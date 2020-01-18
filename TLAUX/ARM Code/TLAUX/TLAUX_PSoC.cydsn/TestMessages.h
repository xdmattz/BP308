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

#ifndef TESTMESSAGES_H
#define TESTMESSAGES_H

#include "Cmds.h"
#include "CLI.h"
    
// #define NUMOFCMDS (sizeof(CMD_Parse_Table) / sizeof(CMD_Parse_Table[0]))
#define ARRAY_SIZE(X) (sizeof(X) / sizeof(X[0]))
    
#define NUMOFCMDS ARRAY_SIZE(CMD_Parse_Table)
    
const char BadMsgString[] = "Unrecognized Command!";
const char CmdTooLong[] = "*** Command was too long! ***";
const char Prompt[] = "\r>";

struct CmdDesc {
    const char* name;
    const char* args;
    const char* desc;
    int (*func)(int, char*[]);
};
    
// Parse Table structure
//  "cmd", "arguments", "help screen message", Command Function 
struct CmdDesc const CMD_Parse_Table[] = 
{
    {"help",    0,          "This menu", HelpScreen},
    {"?",       0,          "Same as 'help'", HelpScreen},
    {"test",    0,          "Echo the arguments", CLI_Test},
    {"echo",    "{on/off}", "Toggle the character echo", Echo_Cmd},
    {"ver",     0,          "Software Version", Ver_Cmd},
    {"!",       0,          "Comment delimiter up to 78 characters", Comment_Cmd},
    {"count",   "{on/off}", "Count up every second", Count_Cmd},
    {"alpha",   "{on/off}", "Alphabet up every second", Alpha_Cmd},
    {"utx",   "ccccc", "send the string to the uart", UTX_Cmd},
    {"a_motor", "dd", "Run the Arm Motor for dd sec", A_Motor_Cmd},
    {"a_dir", "{in/out}", "Set the Arm Motor direction", Arm_Dir_Cmd},
    {"c_motor", "dd", "Run the Carousel Motor for dd sec", C_Motor_Cmd},
    {"c_dir", "{cw/ccw}", "Set the Carousel Motor direction", Carousel_Dir_Cmd},
    {"brake", "dd", "Release the Arm Brake for dd sec", Brake_Cmd}, 
    {"tclamp", "{on/off}", "Tool clamp control", TClamp_Cmd},
    {"air", "{on/off}", "Tool Clamp air blast", TC_Air_Cmd},
    {"load", 0, "Start the Bootloader", Load_Cmd},
//    {"wdt", 0, "WatchDog Timer test - causes RESET!", WDT_Cmd},
    {"status", 0, "Tool Changer State Status", Status_Cmd},
    {"arm_in", 0, "More Tool Arm to IN position", Arm_In_Cmd},
    {"arm_out", 0, "Move Tool Arm to OUT position", Arm_Out_Cmd},
    {"tool", "dd", "Change tool to number dd", ToolChange_Cmd},
    {"t_rel", 0, "Tool Release with Air", ToolRelease_Cmd},
    {"t_cl", 0, "Tool Clamp", ToolGrab_Cmd},
    {"home", 0, "Tool Changer Home", Test_Home_Cmd},
    {"at_home", 0, "Home Query", At_Home_Cmd},
    {"fault", 0, "Fault Query", In_Fault_Cmd},
    {"sense", 0, "Read Port 0 and port 1", Sense_Cmd},
    {"ucfg", 0, "get the USB Configuration", UsbCfg_Cmd}
};
    
const char HelpDiv[] = "************************";

const char* const HelpHeader[] =
{
    "",
    HelpDiv,
    "* USB CLI *",
    HelpDiv,
    "",
    "%d=decimal, %x=hex, %n=decimal or hex with '0x' prefix",
    "Available Commands:",
    0   // always terminate with NULL
};

#endif // End of TESTMESSAGES_H

/* [] END OF FILE */
