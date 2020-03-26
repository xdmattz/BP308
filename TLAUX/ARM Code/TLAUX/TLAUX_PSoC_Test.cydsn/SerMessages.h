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

#ifndef SERMESSAGES_H
#define SERMESSAGES_H
    
#include "SerCmds.h"  
#include "cytypes.h"    
    
#include "ToolCmds.h"    
    
// command list
    
struct SerCmdDesc 
{
    const unsigned char Cmd;
    int(*func)(uint8*);
};

struct SerCmdDesc const SerCmdParseTable[] = 
{
    { TEST_CMD1, CmdFunctionName1},
    { TEST_CMD2, CmdFunctionName2},
    { TC_STATUS_QUERY, TC_StatusCmd},
    { TC_TOOL_ARM_CMD, TC_Arm_Cmd},
    { TC_TOOL_CAROUSEL_CMD, TC_Carousel_Cmd},
    { TC_TOOL_CLAMP_CMD, TC_Clamp_Cmd},
    { TC_HOME_CMD, TC_Home_Cmd}
};
   
// #define NUMOFCMDS (sizeof(CMD_Parse_Table) / sizeof(CMD_Parse_Table[0]))
#define SER_ARRAY_SIZE(X) (sizeof(X) / sizeof(X[0]))
#define NUMOFSERCMDS SER_ARRAY_SIZE(SerCmdParseTable)    
    
    
#endif

/* [] END OF FILE */
