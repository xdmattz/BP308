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
#include "MPGCmds.h"
#include "State_Machine.h"

#include "U_HW.h"

extern uint32_t STATUS_FLAG1;

extern func_ptr FastProcess[];
extern func_ptr MsProcess[];
extern func_ptr SlowProcess[];
extern volatile uint32 MS_Time;

extern volatile uint32 StatusMSGTime;

func_ptr MPG_SM;
uint8   MPG_STATE;

func_ptr DlyNextState;

func_ptr Blink_SM;
uint8 Blink_STATE;

uint8 Current_Tool;
uint8 Target_Tool;
int8  Carousel_Dir;

static uint16_t C_Count;
static uint16_t SecCount;

static uint16_t PrevStatus;

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
void Init_MPG_StateMachine(void)
{
    if(Process_Running(MsProcess, MPG_StateMachine))
    {
        PutStr("Status Process already running!\n");
    } else {
    // start all the constantaly running processes.
    // Status Monitor
        Add_Process(FastProcess, &(MPG_StateMachine));
        PutStr("MPG State Machine Started");
        MPG_SM = &MPG_Fault;
    } 
    if(Process_Running(MsProcess, Blink_StateMachine))
    {
        PutStr("Blink Process already running\n");
    } 
    else
    {
        Add_Process(MsProcess, &(Blink_StateMachine));
        PutStr("Blink State Machine Started");
        startLongShortBlink();
    }
    
    PrevStatus = MPGStatusQuery();
}

void MPG_StateMachine(void)
{
    // check for things that may cause a fault
    // if there is a fault then MPG_SM = &TC_Fault;
    // 
    MPG_SM();
}

// state machine states
void MPG_IDLE(void)
{
    MPG_STATE = MPG_STATE_IDLE;
    // waiting for a command to start a motion
    // check for an error condition.
    In_Fault();
    // if status switch is not on OFF then switch to normal
    
    PrevStatus = MPGStatusQuery();
    if((PrevStatus & (1 << OFF_POS)) == 0)  
    {
        MPG_SM = &MPG_Normal;
        Blink_SM = &NoBlink;
    }
    if((PrevStatus & (1 << ESTOP_STATUS_POS)) != 0)
    {
        MPG_SM = &MPG_ESTOP;
        startFastBlink();
    }
}

void MPG_Normal(void)
{
    MPG_STATE = MPG_STATE_NORMAL;
    In_Fault();
    uint16_t xstatus = MPGStatusQuery();
    if(PrevStatus != xstatus)
    {
        // blink the LED
        startDoubleBlink();
        PrevStatus = xstatus; 
        MPG_Set_Delay(25, &MPG_Normal);
        
    } else if((xstatus & (1 << OFF_POS)) != 0)
    {
        MPG_SM = &MPG_IDLE;
        startLongBlink();
    }
    if((xstatus & (1 << ESTOP_STATUS_POS)) != 0)
    {
        MPG_SM = &MPG_ESTOP;
        startFastBlink();
    }
}

void MPG_ESTOP(void)
{
    MPG_STATE = MPG_STATE_ESTOP;
    uint16 status = MPGStatusQuery();
    if((status & (1 << ESTOP_STATUS_POS)) == 0)
    {
        MPG_SM = &MPG_IDLE;
        startLongBlink();
    }
}

void MPG_Fault(void)
{
    MPG_STATE = MPG_STATE_FAULT;
    // Fault!
    // the way out of a fault is to get a status query message
    if((MS_Time - StatusMSGTime) < FAULT_TIMEOUT)
    {
        MPG_SM =&MPG_IDLE;  // change the state back to idle
        startLongBlink();
    }
}

void MPG_Test_Delay(void)
{
    MPG_STATE = MPG_STATE_TEST;
    
    if((MS_Time - TC_DelayStart) > TC_Delay)
    {
        // when done move state back to IDLE
        MPG_SM = DlyNextState;    
//        PutStr("Delay Done\n");
    }
}

void MPG_Set_Delay(uint32 delay, func_ptr NextState)
{
    TC_Delay = delay;
    TC_DelayStart = MS_Time;
    DlyNextState = NextState;
    MPG_SM = &MPG_Test_Delay;
}



void MPG_Status(void)
{
    switch(MPG_STATE)
    {
        case MPG_STATE_IDLE  : 
            PutStr("MPG IDLE");
            break;
        case MPG_STATE_NORMAL :
            PutStr("MPG Normal");
            break;
        case MPG_STATE_ESTOP :
            PutStr("MPG ESTOP");
            break;
        case MPG_STATE_FAULT :
            PutStr("MPG FAULT");
            break;
        default :
            break;
    }
}


// is there an existing fault condition? 1 = yes, 0 = no
int In_Fault(void)
{
    // check for a fault
    // fault is indicated by not getting a query message from the KFLOP for too long
    if((MS_Time - StatusMSGTime) > FAULT_TIMEOUT)
    {
        MPG_SM = &MPG_Fault;
        startLongShortBlink();
        return 1;
    }
    else
    {
        return 0;   // no fault
    }
}

// LED Blink State Machine

void Blink_StateMachine(void)
{
    Blink_SM();
}

static uint32 Blink_Timer;
static uint32 BlinkCount;
// LED Blink processes
void startSingleBlink(void)
{
// add single blink to the MS process
    Blink_SM = &SingleBlink;
    Blink_Timer = MS_Time;
    Pin_LED_Write(0); // LED off
//    PutStr("LED Single\n");
    
}
void SingleBlink(void)
{
    Blink_STATE = BLINK_STATE_SINGLE;
    if((MS_Time - Blink_Timer) > SINGLE_BLINK_TIME)
    {
        Blink_SM = &NoBlink;
    }
}

void startDoubleBlink(void)
{
    Blink_Timer = MS_Time;
    Blink_SM = &DoubleBlink;
    Pin_LED_Write(0);   // LED off
    BlinkCount = 1;     
//    PutStr("LED Double\n");
}

void DoubleBlink(void)
{
    Blink_STATE = BLINK_STATE_DOUBLE;
    if(Pin_LED_Read() == 0)
    {
        if((MS_Time - Blink_Timer) > SINGLE_BLINK_TIME)
        {
            Pin_LED_Write(1);
            Blink_Timer = MS_Time;
            if(BlinkCount-- == 0)
            {
                Blink_SM = &NoBlink;
            }            
        }
    }
    else
    {
//        PrevStatus = MPGStatusQuery();
        if((MS_Time - Blink_Timer) > SINGLE_BLINK_TIME)
        {
            Pin_LED_Write(0);
            Blink_Timer = MS_Time;
        }
    }
}

void startLongBlink(void)
{
    Blink_SM = &LongBlink;
    Blink_Timer = MS_Time;
    Pin_LED_Write(0);   // LED off
//    PutStr("LED Long\n");
}

void LongBlink(void)
{
    Blink_STATE = BLINK_STATE_LONG;
    if(Pin_LED_Read() == 0)
    {
        if((MS_Time - Blink_Timer) > LONG_BLINK_TIME)
        {
            Pin_LED_Write(1); 
            Blink_Timer = MS_Time;
        }
    } else
    {
        if((MS_Time - Blink_Timer) > LONG_BLINK_TIME)
        {
            Pin_LED_Write(0);
            Blink_Timer = MS_Time;
        }
    }
}

void startLongShortBlink(void)
{
    Blink_SM = &LongShortBlink;
    Blink_Timer = MS_Time;
    Pin_LED_Write(0);   // LED off  
//    PutStr("LED LongShort\n");
}


void LongShortBlink(void)
{
    Blink_STATE = BLINK_STATE_LONGSHORT;
    if(Pin_LED_Read() == 0)
    {
        if((MS_Time - Blink_Timer) > LONG_BLINK_TIME)
        {
            Pin_LED_Write(1); 
            Blink_Timer = MS_Time;
        }
    } else
    {
        if((MS_Time - Blink_Timer) > FAST_BLINK_TIME)
        {
            Pin_LED_Write(0);
            Blink_Timer = MS_Time;
        }
    }    
}

void startFastBlink(void)
{
    Blink_SM = &FastBlink;
    Blink_Timer = MS_Time;
    Pin_LED_Write(0);   // LED off 
 //   PutStr("LED Fast\n");
}

void FastBlink(void)
{
    Blink_STATE = BLINK_STATE_FAST;
    if(Pin_LED_Read() == 0)
    {
        if((MS_Time - Blink_Timer) > FAST_BLINK_TIME)
        {
            Pin_LED_Write(1);
            Blink_Timer = MS_Time;
        }
    } else
    {
        if((MS_Time - Blink_Timer) > FAST_BLINK_TIME)
        {
            Pin_LED_Write(0);
            Blink_Timer = MS_Time;
        }
    }
}

void NoBlink(void)
{
    Blink_STATE = BLINK_STATE_NO;
    Pin_LED_Write(1);
}

// end of file
