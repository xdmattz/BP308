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
#ifndef MPGCMDS_H
#define MPGCMDS_H
    
#include <cytypes.h>
    
// Tool Changer command list - Serial commands or Test commands
    
#define TEST_CMD1           0x01  // test command just to see if it works
#define TEST_CMD2           0x02
#define MPG_STATUS_QUERY     0x03    // MPG Status query - see actual commands for response
 

    
// MPG Status Query
// Current state of the Manual Pulse Generator
// 16 LSBs contain the status of the tool changer
// 
//      |      Fault Bits |       open            | Selector Switches
// | NC | Timeout | ESTOP |              |SW2  SW1| EN_SW | off | Axis | Rate |
// | 15 |    14   |  13   | 12 | 11 | 10 | 9 | 8  |  7    |  6  | 5-3  | 2-0  | 
//
//
#define TIMEOUT_FAULT_POS       14
#define ESTOP_STATUS_POS        13
#define SW2_POS                 9 
#define SW1_POS                 8
#define EN_SW_POS               7
#define OFF_POS                 6
#define AXIS_POS                3
#define RATE_POS                0
    
#define AXIS_OFF    0    
#define AXIS_X      1
#define AXIS_Y      2
#define AXIS_Z      3
#define AXIS_A      4

#define RATE_ZERO   0
#define RATE_X1     1
#define RATE_X10    2
#define RATE_X100   3
    
    
    
#define RATE_SW_PORT Pin_X1_PS  // port 3 Data Register - TRIAC AC Power Outputs
#define AXIS_SW_PORT Pin_X_PS        // port 0 Port State - Sense inputs
#define EN_SW_PORT Pin_EN_SW_PS
#define ESTOP_PORT Pin_ESTOP_PS        // port 1 Port State - Fault inputs   
#define ENCODER_PORT Pin_MPG_Ap_PS  
#define SWITCH_PORT Pin_SW1_PS
#define LED_PORT Pin_LED_DR
    
    
// Various Delays
    
#define ARM_START_DELAY 400
#define SINGLE_BLINK_TIME 150
#define LONG_BLINK_TIME 950    
#define FAST_BLINK_TIME 100
#define SLOW_BLINK_TIME 900
    
#define FAULT_TIMEOUT 700

    
// Command Arguments
// MPG Command Arguments - not currently used - 
    
 
    
// Home Command
// No arguments
    
#ifndef UNUSED_ARG
#define  UNUSED_ARG(X) (void)(X)
#endif
    
uint16 MPGStatusQuery(void);


    
#endif

/* [] END OF FILE */
