/* ========================================
 *
 * Copyright YOUR COMPANY, THE YEAR
 * All Rights Reserved
 * UNPUBLISHED, LICENSED SOFTWARE.
 *
 * CONFIDENTIAL AND PROPRIETARY INFORMATION
 * WHICH IS THE PROPERTY OF your company.
 *
 * ========================================
*/

#include "Processes.h"
#include <project.h>
#include <stdio.h>
#include "ToolCmds.h"
#include "State_Machine.h"

#include "U_HW.h"

extern uint32_t STATUS_FLAG1;

extern func_ptr FastProcess[];
extern func_ptr MsProcess[];
extern func_ptr SlowProcess[];
extern volatile uint32 MS_Time;

func_ptr TC_SM;
uint8   TC_STATE;

uint8 Current_Tool;
uint8 Target_Tool;
int8  Carousel_Dir;

static uint16_t C_Count;
static uint16_t SecCount;

void InitCountProcess(void)
{
    C_Count = 0;
    SecCount = 1000;
}
void CountProcess(void)
{
    char msg[20];
    if((--SecCount) == 0)
    {
        SecCount = 1000; // reset the counter
        sprintf(msg, "Count = %d\r", C_Count++);
        PutStr(msg);
//        Pin_LED_Write(~(Pin_LED_Read()));    // toggle the LED
    }
}

static uint32 BCount = 400;

void BlinkProcess(void)
{
    if((--BCount) == 0)
    {
        BCount = 600;
        Pin_LED_Write(~(Pin_LED_Read()));
    }
}

static uint8 A_Count;
static uint16 S_Count;

void InitAlphaProcess(void)
{
    A_Count = 0;
    S_Count = 1000;
}

void AlphaProcess(void)
{

    char msg[20];
    if((--S_Count) == 0)
    {
        S_Count = 1000u; // reset the counter
        sprintf(msg, "Alpha = %c\r", (A_Count + 'A'));
        PutStr(msg);
        if(A_Count++ > 56) A_Count = 0;
//        Pin_LED_Write(~(Pin_LED_Read()));    // toggle the LED
    }
}


// delay timer variables
static uint32 TC_Delay; // the amount of time to delay
static uint32 TC_DelayStart; // the time tick when the delay started


// tool changer state machine
void Init_TC_StateMachine(void)
{
    if(Process_Running(FastProcess, TC_StateMachine))
    {
        PutStr("Status Process already running!\n");
    } else {
    // start all the constantaly running processes.
    // Status Monitor
        Add_Process(FastProcess, &(TC_StateMachine));
        PutStr("TC_State Machine Started");
        TC_SM = &TC_Fault;
    } 
}

void TC_StateMachine(void)
{
    // check for things that may cause a fault
    // if there is a fault then TC_SM = &TC_Fault;
    // 
    TC_SM();
}

// state machine states
void TC_IDLE(void)
{
    TC_STATE = TC_STATE_IDLE;
    // waiting for a command to start a motion
    // check for an error condition.
    if(In_Fault() == 1)
    {
        TC_SM = &TC_Fault;
    }
}

void TC_Arm_Move_In_Start(void)
{
    TC_STATE = TC_STATE_ARM_IN_START;
    if((SENSE_PORT & Pin_Tool_Arm_Out_MASK) != 0)  // check for tool to get off the Arm Out sensor
    {
        TC_SM = &TC_Arm_Move_In;    // change the state to Arm Move In
        TC_Set_Delay(ARM_MOVE_TIME);
    }
    RunningTooLong();
}

void TC_Arm_Move_In(void)
{
    TC_STATE = TC_STATE_ARM_IN;
    RunningTooLong();
    if((SENSE_PORT & Pin_Tool_Arm_In_MASK) == 0)   //  detect Arm In (retracted
    {
        TC_Set_Delay(MOTOR_STOP_DELAY);  // change the state to motor brake - not really a brake, just a shutdown delay 
        TC_SM = TC_Motor_Brake;
    }
}

void TC_Arm_Move_Out_Start(void)
{
    TC_STATE = TC_STATE_ARM_OUT_START;
    if((SENSE_PORT & Pin_Tool_Arm_In_MASK) == 0)  // check for tool to get off the tool back sensor
    {
        TC_SM = &TC_Arm_Move_Out;    // change the state to Arm Move In
        TC_Set_Delay(ARM_MOVE_TIME);
    }
    RunningTooLong();   // took too long to get off the sensor
}

void TC_Arm_Move_Out(void)
{
    TC_STATE = TC_STATE_ARM_OUT;
    RunningTooLong();    
    if((SENSE_PORT & Pin_Tool_Arm_Out_MASK) == 0)   //  detect Arm Back
    {
        TC_Set_Delay(MOTOR_STOP_DELAY);  // change the state to motor brake - not really a brake, just a shutdown delay 
        TC_SM = TC_Motor_Brake;
    }
}

void TC_Motor_Brake(void)
{
    TC_STATE = TC_STATE_BRAKE;
    if((MS_Time - TC_DelayStart) > TC_Delay)
    {
        Motors_Off();   // after a short delay then all motors off, change state to Idle
        TC_SM = &TC_IDLE;
    }
}

void TC_Carousel_Moving_Start(void)
{
    TC_STATE = TC_STATE_CAROUSEL_START;
     // look for both sensor to be high, ie. off of he currrent tool position
    if((SENSE_PORT & Pin_Tool_Count_MASK) != 0)   // stay in this state until off the sensor or timeout
    {
        TC_SM = &TC_Carousel_Moving;    // change status to carousel moving
        TC_Set_Delay(CAROUSEL_MOVING_DELAY);
        // PutStr("P_Car 1\n");
    }
    RunningTooLong();   // too long on sensor? then timeout ie. next state is Fault...
}

void TC_Carousel_Moving(void)
{
    TC_STATE = TC_STATE_CAROUSEL;
    RunningTooLong();   // if timeout then next state is Fault.
    
    if((SENSE_PORT & Pin_Tool_Count_MASK) == 0) // look for next sensor detect 
    {
        // PutStr("P_Car 2\n");
        Current_Tool = Current_Tool + Carousel_Dir;     // Increment/decrement Current Tool position
        if(Current_Tool > NUMBER_OF_TOOLS)              // There has to be some modulus stuff here ... 
        {
            Current_Tool = 1;
        }
        else if(Current_Tool < 1)
        {
            Current_Tool = NUMBER_OF_TOOLS;
        }
        
        if((Current_Tool == 1) && ((SENSE_PORT & Pin_Tool_1_MASK) != 0))    // if the current tool is 1 check that we are really on tool 1
        {   
            // PutStr("Not on tool 1\n");
            TC_SM = &TC_Fault;
            Motors_Off();
        }
        if(Current_Tool == Target_Tool)    // if sensor detected position is destination, then done
        {
            // stop the tool
            TC_Set_Delay(CAROUSEL_STOP_DELAY);
            TC_SM = &TC_Motor_Brake;
        }
        else
        {
            TC_Set_Delay(CAROUSEL_START_DELAY); // otherwise continue - back to moving start until sensor is cleared by moving past it.
            TC_SM = &TC_Carousel_Moving_Start;
            // PutStr("P_Car Restart\n");
        }
    }  
}

void TC_Clamp_AirBlast(void)
{
    TC_STATE = TC_STATE_AIR_BLAST;
    // clamp is released - Air Blast for XX ms
    if((MS_Time - TC_DelayStart) > TC_Delay)
    {
        // after timeout shut off air and move to IDLE
        TRIAC_PORT &= ~(Pin_Tool_Air_MASK);
        TC_SM = &TC_IDLE;
    }
}

void TC_Fault(void)
{
    TC_STATE = TC_STATE_FAULT;
    // Fault!
    // There are two ways to get out of the fault state.
    // the first is via a HOME command 
    // the second is for the tool changer to be in the HOME position with no faults.
    if((At_Home() == 1) && (In_Fault() == 0))
    {
        Set_Current_Tool(1);    //this is needed for coming out of fault on startup 
        TC_SM = &TC_IDLE;   // change state back to idle
        Motors_Off();       // make sure the motors are off... 
    }
}

void TC_Test_Delay(void)
{
    TC_STATE = TC_STATE_TEST;
    
    if((MS_Time - TC_DelayStart) > TC_Delay)
    {
        // when done move state back to IDLE
        Motors_Off();   // turn everything that can move off first... 
        TC_SM = &TC_IDLE;    
        PutStr("Delay Done\n");
    }
}

void TC_Set_Delay(uint32 delay)
{
    TC_Delay = delay;
    TC_DelayStart = MS_Time;
}

// Turn all the motors off - precursor to switching back to Idle or fault
void Motors_Off(void)
{
    // since all motors are on the same port... 
    TRIAC_PORT &= ~(Pin_Tool_Arm_FWD_MASK | Pin_Tool_Arm_REV_MASK | Pin_Car_FWD_MASK | Pin_Car_REV_MASK | Pin_Tool_Arm_Brake_MASK);
}

uint8 Get_Current_Tool(void)
{
    return Current_Tool;
}

void Set_Current_Tool(uint8 tool)
{
    Current_Tool = tool;
}

void Set_Target_Tool(uint8 targ, int8 dir)
{
    Target_Tool = targ;
    Carousel_Dir = dir;
}

void TC_Status(void)
{
    switch(TC_STATE)
    {
        case TC_STATE_IDLE  : 
            PutStr("TC IDLE");
            break;
        case TC_STATE_ARM_IN_START :
        case TC_STATE_ARM_IN :
            PutStr("TC ARM REV");
            break;
        case TC_STATE_ARM_OUT_START :
        case TC_STATE_ARM_OUT :
            PutStr("TC ARM FWD");
            break;
        case TC_STATE_BRAKE :
            PutStr("TC BRAKE");
            break;
        case TC_STATE_CAROUSEL_START :
        case TC_STATE_CAROUSEL       :
            PutStr("TC CAROUSEL");
            break;
        case TC_STATE_AIR_BLAST :
            PutStr("TC AIR BLAST");
            break;
        case TC_STATE_CLAMP :
            PutStr("TC CLAMP");
            break;
        case TC_STATE_FAULT :
            PutStr("TC FAULT");
            break;
        case TC_STATE_TEST :
            PutStr("TC TEST");
            break;
    }
}
// is the tool changer at the home position? 1 = yes, 0 = no
int At_Home(void)
{
    if((SENSE_PORT & (Pin_Tool_1_MASK | Pin_Tool_Count_MASK | Pin_Tool_Arm_In_MASK)) == 0)    // all three must be low
    {
        return 1;   // at home
    } 
    else 
    {
        return 0;   // not home
    }
}

// is there an existing fault condition? 1 = yes, 0 = no
int In_Fault(void)
{
    uint8 fault = (FAULT_PORT & (Pin_V_Mon2_MASK | Pin_AC_Mon_MASK | Pin_ESTOP_MASK));
    if(fault == (Pin_V_Mon2_MASK | Pin_ESTOP_MASK))
    {
        return 0;   // no fault
    }
    else
    {
        return 1;   // in fault
    }
}

void TC_Home_Arm(void)
{
    TC_STATE = TC_STATE_HOME_ARM;
    RunningTooLong();
    if((SENSE_PORT & Pin_Tool_Arm_In_MASK) == 0)   //  detect Arm Back
    {
        TC_Set_Delay(MOTOR_STOP_DELAY);  // change the state to motor brake - not really a brake, just a shutdown delay 
        TC_SM = TC_Home_Delay;
    }
}

void TC_Home_Carousel(void)
{
    RunningTooLong();
    // move until the carousel reaches tool 1
    if((SENSE_PORT & (Pin_Tool_Count_MASK | Pin_Tool_1_MASK)) == 0) // is the carousel at tool 1?
    {
        TC_Set_Delay(CAROUSEL_STOP_DELAY);
        TC_SM = &TC_Motor_Brake;
        Current_Tool = 1;   // current tool reset to 1! 
    }
}

void TC_Home_Delay(void)
{
    TC_STATE = TC_STATE_BRAKE;  // yes this really isn't the correct state...
    if((MS_Time - TC_DelayStart) > TC_Delay)
    {
        Motors_Off();   // after a short delay then all motors off, change state to TC_Home_Carousel if needed
        
        if((SENSE_PORT & (Pin_Tool_Count_MASK | Pin_Tool_1_MASK)) == 0) // check for already at Tool position 1
        {
            TC_SM = &TC_IDLE;
            Current_Tool = 1;
        }
        else
        {
            // start the carousel move
            TC_Set_Delay(CAROUSEL_HOME_DELAY);
            TC_SM = &TC_Home_Carousel; 
            TRIAC_PORT &= ~(Pin_Car_REV_MASK);  // make sure that REV is off!
            TRIAC_PORT |= Pin_Car_FWD_MASK; // start moving the carousel forward
        }
    }
}

void RunningTooLong(void)
{
    if((MS_Time - TC_DelayStart) > TC_Delay)    // motors have been running too long!
    {
        Motors_Off();
        TC_SM = &TC_Fault;
        // PutStr("Timeout\n");
    }   
}

// end of file
