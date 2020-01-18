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
    
#include "cytypes.h"
    
// Tool Changer command list - Serial commands or Test commands
    
#define TEST_CMD1           0x01  // test command just to see if it works
#define TEST_CMD2           0x02
#define MPG_STATUS_QUERY     0x03    // MPG Status query - see actual commands for response
 

    
// MPG Status Query
// Current state of the Manual Pulse Generator
// 16 LSBs contain the status of the tool changer
// 
//      |      Fault Bits |     Selector     | 
// | NC | Timeout | ESTOP |                  | EN_SW | off | X | Y  | Z | A | x1 | x10 | x100 |
// | 15 |    14   |  13   | 12 | 11 | 10 | 9 |   8   |  7  | 6 |  5 | 4 | 3 | 2  |  1  |   0  | 
//
//
#define TIMEOUT_FAULT_POS       14
#define ESTOP_STATUS_POS        13
#define EN_SW_POS               8
#define OFF_POS                 7
#define X_POS                   6
#define Y_POS                   5
#define Z_POS                   4
#define A_POS                   3
#define X1_POS                  2
#define X10_POS                 1
#define X100_POS                0
    
#define RATE_SW_PORT Pin_X1_PS  // port 3 Data Register - TRIAC AC Power Outputs
#define AXIS_SW_PORT Pin_X_PS        // port 0 Port State - Sense inputs
#define ESTOP_PORT Pin_ESTOP_PS        // port 1 Port State - Fault inputs   
#define ENCODER_PORT Pin_MPG_Ap_PS   
#define LED_PORT Pin_LED_DR
    
#define ARM_START_DELAY 400
#define ARM_STOP_DELAY 5
#define ARM_MOVE_TIME   3000
    
#define CAROUSEL_START_DELAY 500        // 400 ms delay to get off carousel sensor 
                                        // - takes a little longer to get off the sensor because of the Geneva Mechanism
#define CAROUSEL_MOVING_DELAY 2000
#define CAROUSEL_STOP_DELAY 10         // 50 ms delay
#define CAROUSEL_HOME_DELAY 10000       // 10 second delay if we need to go all the way around the tool changer

#define MOTOR_STOP_DELAY 10             // 50ms motor stop delay
#define AIR_BLAST_DELAY 1200            // 1.2 seconds air blast   
    
// Command Arguments
// Arm Command arguments
#define ARM_IN 1
#define ARM_OUT 2
    
// Carousel Command arguments
// Carousel command only gets the tool to go to so ONE to NUMBER_OF_TOOLS    
    
// Clamp Command
#define AIR_BLAST_ONLY          1
#define AIR_BLAST_TOOL_UNCLAMP  2
#define TOOL_UNCLAMP            3
#define TOOL_CLAMP              4       
    
// Home Command
// No arguments
    
#ifndef UNUSED_ARG
#define  UNUSED_ARG(X) (void)(X)
#endif
    
uint16 MPGStatusQuery(void);


    
#endif

/* [] END OF FILE */
