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

#include "MPGCmds.h"
#include "project.h"
#include "Processes.h"
#include "State_Machine.h"
#include "U_HW.h"

#include "stdio.h"

extern func_ptr MPG_SM;
extern uint8 MPG_STATE;

// ToolStatusQuery - returns the status of the tool changer
uint16 MPGStatusQuery(void)
{
    uint16 status = 0;
    if((AXIS_SW_PORT & Pin_X_MASK) == 0) status |= (AXIS_X << AXIS_POS);    // X axis position
    else if((AXIS_SW_PORT & Pin_Y_MASK) == 0) status |= (AXIS_Y << AXIS_POS);    // Y axis position
    else if((AXIS_SW_PORT & Pin_Z_MASK) == 0) status |= (AXIS_Z << AXIS_POS);    // Z axis position
    else if((AXIS_SW_PORT & Pin_A_MASK) == 0) status |= (AXIS_A << AXIS_POS);    // A axis position
    
    if(status == 0) status |= (1 << OFF_POS);                       // if the positions are all zero then set the OFF bit
    
    if(MPG_STATE == MPG_STATE_FAULT) status |= (1 << TIMEOUT_FAULT_POS);           // in fault state
    
    if((ESTOP_PORT & Pin_ESTOP_MASK) == 0) status |= (1 << ESTOP_STATUS_POS);   // in ESTOP condition if pin is low
   
    if((EN_SW_PORT & Pin_EN_SW_MASK) == 0) status |= (1 << EN_SW_POS);    // Enable Switch axis position
    if((SWITCH_PORT & Pin_SW1_MASK) == 0) status |= (1 << SW1_POS);       //  SW1 position
    if((SWITCH_PORT & Pin_SW2_MASK) == 0) status |= (1 << SW2_POS);       //  SW2 position
    if((RATE_SW_PORT & Pin_X1_MASK) == 0) status |= (RATE_X1 << RATE_POS);  // 1x motion rate
    else if((RATE_SW_PORT & Pin_X10_MASK) == 0) status |= (RATE_X10 << RATE_POS);  // 10x motion rate
    else if((RATE_SW_PORT & Pin_X100_MASK) == 0) status |= (RATE_X100 << RATE_POS);  // 100x motion rate

    return status;
}



/* [] END OF FILE */
