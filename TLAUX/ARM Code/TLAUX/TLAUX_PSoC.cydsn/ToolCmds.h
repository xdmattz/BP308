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
#ifndef TOOLCMDS_H
#define TOOLCMDS_H
    
#include <cytypes.h>
    
// Tool Changer command list - Serial commands or Test commands
    
#define TEST_CMD1           0x01  // test command just to see if it works
#define TEST_CMD2           0x02
#define TC_STATUS_QUERY     0x03    // Tool Changer Status query - see actual commands for response
#define TC_TOOL_ARM_CMD     0x04    // Tool Arm Command, 0 no motion, 1 in, 2 out
#define TC_TOOL_CAROUSEL_CMD 0x05    // Tool Carousel Command, 0 no motion, 1 - 32  go to tool position, 64-127 debug stuff?
#define TC_TOOL_CLAMP_CMD   0x06    // Tool Clamp Command, 0 nothing, 1 Air Blast, 2 Clamp release with Air, 3 Clamp release no air, 4 Clamp engaged 
#define TC_HOME_CMD         0x07    // Home command, send arm back, rotate carousel to tool 1, this is how to get out of a fault        
    
#define NUMBER_OF_TOOLS         8   // Size of the tool holder   
#define HALF_NUMBER_OF_TOOLS    4    // half the number of tools
    
// Tool Changer Status Query
// Current state of the tool changer
// 16 LSBs contain the status of the tool changer
// 
//      |         Fault Bits         |  Clamp Relays   |     ARM Bits      | Carousel Bits         |
// | NC | Timeout | ESTOP | 24V | AC | UnClamp | Clamp | Arm Out |  ARM In | Car Motion | Tool Pos |
// | 15 |    14   |  13   |  12 | 11 |    10   |   9   |    8    |    7    |     6      |  5 - 0   | 
//
//
#define TIMEOUT_FAULT_POS       14
#define ESTOP_STATUS_POS        13
#define V24_STATUS_POS          12
#define VAC_STATUS_POS          11
#define UNCLAMP_STATUS_POS      10
#define CLAMP_STATUS_POS        9
#define ARM_OUT_STATUS_POS      8
#define ARM_IN_STATUS_POS       7
#define CAROUSEL_ON_TOOL_POS    6
#define CAROUSEL_TOOL_POS       0    
    
#define TRIAC_PORT Pin_Tool_Arm_FWD_DR  // port 3 Data Register - TRIAC AC Power Outputs
#define SENSE_PORT Pin_Tool_1_PS        // port 0 Port State - Sense inputs
#define FAULT_PORT Pin_V_Mon2_PS        // port 1 Port State - Fault inputs    
    
#define ARM_START_DELAY 400
#define ARM_STOP_DELAY 5
#define ARM_MOVE_TIME   3000
    
#define CAROUSEL_START_DELAY 500        // 400 ms delay to get off carousel sensor 
                                        // - takes a little longer to get off the sensor because of the Geneva Mechanism
#define CAROUSEL_MOVING_DELAY 2000
#define CAROUSEL_STOP_DELAY 10         // 50 ms delay
#define CAROUSEL_HOME_DELAY 10000       // 10 second delay if we need to go all the way around the tool changer

#define MOTOR_STOP_DELAY 10             // 50ms motor stop delay
#define AIR_BLAST_DELAY 800            // 0.8 seconds air blast   
    
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
    
uint16 ToolStatusQuery(void);
void Arm_Cmd(uint8 arg);
void Carousel_Cmd(uint8 arg);
void Clamp_Cmd(uint8 arg);
void Home_Cmd(uint8 arg);

    
#endif

/* [] END OF FILE */
