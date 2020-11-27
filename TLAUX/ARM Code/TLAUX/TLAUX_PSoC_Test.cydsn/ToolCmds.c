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

#include "ToolCmds.h"
#include "project.h"
#include "Processes.h"
#include "State_Machine.h"
#include "U_HW.h"

#include "stdio.h"

extern func_ptr TC_SM;
extern uint8 TC_STATE;

int16 TB_STATUS;


// char t_msg[32];

// ToolStatusQuery - returns the status of the tool changer
// ** TEST VERSION - 
// instead of looking at the FAULT_PORT and SENSE PORT look at the global state variable that tracks those.
uint16 ToolStatusQuery(void)
{
    uint16 status = 0;
#ifdef TESTBED
    if(TC_STATE == TC_STATE_FAULT) status = (1 << TIMEOUT_FAULT_POS);           // in fault state
    status = status | TB_STATUS;
#else        
    
    if(TC_STATE == TC_STATE_FAULT) status = (1 << TIMEOUT_FAULT_POS);           // in fault state
    if((FAULT_PORT & Pin_ESTOP_MASK) == 0) status |= (1 << ESTOP_STATUS_POS);   // in ESTOP condition
    if((FAULT_PORT & Pin_V_Mon2_MASK) == 0) status |= (1 << V24_STATUS_POS);    // 24V under voltage fault
    if((FAULT_PORT & Pin_AC_Mon_MASK) != 0) status |= (1 << VAC_STATUS_POS);    // No AC fault
    if((SENSE_PORT & Pin_Tool_Unclamped_MASK) == 0) status |= (1 << UNCLAMP_STATUS_POS);    // tool unclamped sensor
    if((SENSE_PORT & Pin_Tool_Clamped_MASK) == 0) status |= (1 << CLAMP_STATUS_POS);        // tool clamped sensor
    if((SENSE_PORT & Pin_Tool_Arm_Out_MASK) == 0) status |= (1 << ARM_OUT_STATUS_POS);      // tool arm out sensor
    if((SENSE_PORT & Pin_Tool_Arm_In_MASK) == 0) status |= (1 << ARM_IN_STATUS_POS);        // tool arm in sensor
    if(((SENSE_PORT & Pin_Tool_1_MASK) == 0) || ((SENSE_PORT & Pin_Tool_Count_MASK) == 0)) status |= (1 << CAROUSEL_ON_TOOL_POS); // tool carousel is on a tool
    status |= ((uint16)(Get_Current_Tool()) & 0x3f);
#endif    
    return status;
}

// move Arm Command - 0 = no motion, 1 = back, 2 = out
void Arm_Cmd(uint8 arg)
{
    // make sure not at fault
    if(In_Fault() == 1)
    {
        TC_SM = &TC_Fault;
    }
#ifdef TESTBED
        switch(arg)
        {
            case ARM_IN : 
                    TB_STATUS |= _BV(ARM_IN_STATUS_POS); // set the ARM IN bit 
                    TB_STATUS &= ~(_BV(ARM_OUT_STATUS_POS)); // clear the ARM OUT bit
                    break;
            case ARM_OUT: 
                    TB_STATUS |= _BV(ARM_OUT_STATUS_POS); // set the ARM OUT bit 
                    TB_STATUS &= ~(_BV(ARM_IN_STATUS_POS)); // clear the ARM IN bit                    
                    break;
            default : break;
        }
#else       
    else if(((SENSE_PORT & Pin_Tool_Arm_Out_MASK) != 0) && ((SENSE_PORT & Pin_Tool_Arm_In_MASK) != 0))
    {   
        TC_SM = &TC_Fault;  // if not on a sensor then fault
    }
    else
    {
 
        switch(arg)
        {
            case ARM_IN :

                    if((SENSE_PORT & Pin_Tool_Arm_In_MASK) == 0) break;    // already there, don't move
                    else
                    {
                        // PutStr("Arm In\n");
                        TC_SM = &TC_Arm_Move_In_Start;      // change the state to Arm Moving In
                        TC_Set_Delay(ARM_START_DELAY);      // delay to allow for moving off the sensor
                        TRIAC_PORT &= ~(Pin_Tool_Arm_FWD_MASK); // make sure FWD is off
                        TRIAC_PORT |= (Pin_Tool_Arm_REV_MASK | Pin_Tool_Arm_Brake_MASK); // turn the motor on REV and release Brake
                    }
                    break;
            case ARM_OUT :
                    if((SENSE_PORT & Pin_Tool_Arm_Out_MASK) == 0) break;    // already there, don't move
                    else
                    {
                        // PutStr("Arm Out\n");
                        TC_SM = &TC_Arm_Move_Out_Start;  // change the state to Arm Moving Out
                        TC_Set_Delay(ARM_START_DELAY);     // 1.5 sec
                        TRIAC_PORT &= ~(Pin_Tool_Arm_REV_MASK); // make sure REV is off
                        TRIAC_PORT |= (Pin_Tool_Arm_FWD_MASK | Pin_Tool_Arm_Brake_MASK); // turn the motor on FWD and release Brake
                     }
                    break;
            default :
                    // do nothing!
                    break;
        } 
    }
#endif     
}

void Carousel_Cmd(uint8 arg)
{
#ifdef TESTBED
    if(In_Fault() == 0)
    {
        if((arg > 0) && (arg <= NUMBER_OF_TOOLS))
        {
            TB_STATUS |= arg;
        }
    }
#else
    
    // calculate the shortest path to the desired tool
    if(In_Fault() == 0)   // only do this if not in a fault state
    {
        // make sure we are currently on a tool!
        if((SENSE_PORT & Pin_Tool_Count_MASK) != 0)
        { 
            // PutStr("Not on tool!\n");
            TC_SM = & TC_Fault;
        }
        else
        {
            // PutStr("Car 1\n");
            if((arg > 0) && (arg <= NUMBER_OF_TOOLS))
            {
                // PutStr("Car 2\n");
                int8 tool_distance;
            
                tool_distance = arg - Get_Current_Tool();
                if(tool_distance > HALF_NUMBER_OF_TOOLS)
                {
                    tool_distance -= NUMBER_OF_TOOLS;
                }
                else if(tool_distance < -(HALF_NUMBER_OF_TOOLS))
                {
                    tool_distance += NUMBER_OF_TOOLS;
                }
                // PutStr("Car 2x\n");
                if(tool_distance != 0)  // if it is not already on the correct tool
                {
                    // sprintf(t_msg, "Car 3 distance = %d\n", tool_distance);
                    // PutStr(t_msg);
                    if(tool_distance > 0)   // if distance is positive
                    {
                        TRIAC_PORT &= ~(Pin_Car_REV_MASK);  // REV is off
                        TRIAC_PORT |= Pin_Car_FWD_MASK;     // FWD is on
                        Set_Target_Tool(arg, 1);
                    }
                    else    // if distance is negative
                    {
                        TRIAC_PORT &= ~(Pin_Car_FWD_MASK);  // FWD is off
                        TRIAC_PORT |= Pin_Car_REV_MASK;     // REV is on
                        Set_Target_Tool(arg, -1);
                    }
                    // PutStr("Car 4\n");
                    TC_SM = &TC_Carousel_Moving_Start;      // change the state to start moving
                    TC_Set_Delay(CAROUSEL_START_DELAY);
                }
            }
        }
    }
#endif    
}

void Clamp_Cmd(uint8 arg)
{
#ifdef TESTBED
    switch(arg)
    {
        case AIR_BLAST_ONLY : break;
        case AIR_BLAST_TOOL_UNCLAMP : 
                            TB_STATUS |= _BV(UNCLAMP_STATUS_POS); // set the UNCLAMP bit 
                            TB_STATUS &= ~(_BV(CLAMP_STATUS_POS)); // clear the CLAMP bit
                            break;
        case TOOL_UNCLAMP : 
                            TB_STATUS |= _BV(UNCLAMP_STATUS_POS); // set the UNCLAMP bit 
                            TB_STATUS &= ~(_BV(CLAMP_STATUS_POS)); // clear the CLAMP bit
                            break;
        case TOOL_CLAMP :
                            TB_STATUS |= _BV(CLAMP_STATUS_POS); // set the UNCLAMP bit 
                            TB_STATUS &= ~(_BV(UNCLAMP_STATUS_POS)); // clear the CLAMP bit
                            break;
        default : break;
    }
#else    
    switch(arg)
    {
        case AIR_BLAST_ONLY :
            TC_Set_Delay(AIR_BLAST_DELAY);
            TC_SM = &TC_Clamp_AirBlast; // change state to Air Blast
            TRIAC_PORT |= Pin_Tool_Air_MASK;   // turn on the Air
            break;
        case AIR_BLAST_TOOL_UNCLAMP :
            TC_Set_Delay(AIR_BLAST_DELAY);
            TC_SM = &TC_Clamp_AirBlast;
            TRIAC_PORT |= (Pin_Tool_Air_MASK | Pin_Tool_Clamp_MASK);   // turn on the Air and release the clamp
            
            break;
        case TOOL_UNCLAMP :
            TRIAC_PORT |= Pin_Tool_Clamp_MASK;   // just release the clamp
            break;
        case TOOL_CLAMP :
            TRIAC_PORT &= ~(Pin_Tool_Clamp_MASK);    // re-engage the clamp
            break;
        default :
            break;
    }
#endif    
}

void Home_Cmd(uint8 arg)
{
    UNUSED_ARG(arg);
    // This command needs to do two things, retract the Arm and rotate the Carousel to tool position 1
    
#ifdef TESTBED
    // this should be the "home" state of the tool changer
    TB_STATUS = _BV(CLAMP_STATUS_POS) | _BV(ARM_IN_STATUS_POS) | _BV(CAROUSEL_ON_TOOL_POS) | 0x01;
       
#else
   

    if(In_Fault() == 0) // only try this if there is no fault
    {
        // PutStr("Home 1\n");
        if((SENSE_PORT & Pin_Tool_Arm_In_MASK) == 0) // check for ARM at IN - already retracted
        {
            // PutStr("Home 2\n");
            if((SENSE_PORT & (Pin_Tool_Count_MASK | Pin_Tool_1_MASK)) == 0) // check for already at Tool position 1
            {
                // PutStr("Home 3\n");
                Set_Current_Tool(1);
                TC_SM = &TC_IDLE;
            }
            else
            {
                // PutStr("Home 4\n");
                TC_Set_Delay(CAROUSEL_HOME_DELAY);  
                TC_SM = &TC_Home_Carousel;          // Set the state to Home Carousel
                TRIAC_PORT &= ~(Pin_Car_REV_MASK);  // make sure that REV is off!
                TRIAC_PORT |= Pin_Car_FWD_MASK;     // start moving the carousel forward
            }
        }
        else
        {
            // start the arm move
            TC_Set_Delay(ARM_MOVE_TIME);
            TC_SM = &TC_Home_Arm;
            TRIAC_PORT &= ~(Pin_Tool_Arm_FWD_MASK);    // make sure that out is off!
            TRIAC_PORT |= (Pin_Tool_Arm_REV_MASK | Pin_Tool_Arm_Brake_MASK); // release the brake and start moving
        }
    }
#endif    
}


/* [] END OF FILE */
