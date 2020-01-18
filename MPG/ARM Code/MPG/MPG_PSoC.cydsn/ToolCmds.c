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

extern func_ptr MPG_SM;
extern uint8 MPG_STATE;

// char t_msg[32];

// ToolStatusQuery - returns the status of the tool changer
uint16 ToolStatusQuery(void)
{
    uint16 status = 0;
    if(MPG_STATE == MPG_STATE_FAULT) status = (1 << TIMEOUT_FAULT_POS);           // in fault state
    if((ESTOP_PORT & Pin_ESTOP_MASK) == 0) status |= (1 << ESTOP_STATUS_POS);   // in ESTOP condition
/*    
    if((FAULT_PORT & Pin_V_Mon2_MASK) == 0) status |= (1 << V24_STATUS_POS);    // 24V under voltage fault
    if((FAULT_PORT & Pin_AC_Mon_MASK) != 0) status |= (1 << VAC_STATUS_POS);    // No AC fault
    if((SENSE_PORT & Pin_Tool_Unclamped_MASK) == 0) status |= (1 << UNCLAMP_STATUS_POS);    // tool unclamped sensor
    if((SENSE_PORT & Pin_Tool_Clamped_MASK) == 0) status |= (1 << CLAMP_STATUS_POS);        // tool clamped sensor
    if((SENSE_PORT & Pin_Tool_Arm_Out_MASK) == 0) status |= (1 << ARM_OUT_STATUS_POS);      // tool arm out sensor
    if((SENSE_PORT & Pin_Tool_Arm_In_MASK) == 0) status |= (1 << ARM_IN_STATUS_POS);        // tool arm in sensor
    if(((SENSE_PORT & Pin_Tool_1_MASK) == 0) || ((SENSE_PORT & Pin_Tool_Count_MASK) == 0)) status |= (1 << CAROUSEL_ON_TOOL_POS); // tool carousel is on a tool
    */
    return status;
}

// move Arm Command - 0 = no motion, 1 = back, 2 = out
void Arm_Cmd(uint8 arg)
{
    // make sure not at fault
    if(In_Fault() == 1)
    {
        MPG_SM = &MPG_Fault;
    }

}

void Carousel_Cmd(uint8 arg)
{
    // calculate the shortest path to the desired tool


}

void Clamp_Cmd(uint8 arg)
{

}

void Home_Cmd(uint8 arg)
{
    UNUSED_ARG(arg);
    // This command needs to do two things, retract the Arm and rotate the Carousel to tool position 1



}


/* [] END OF FILE */
