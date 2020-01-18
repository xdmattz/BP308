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

#ifndef CMDS_H
#define CMDS_H
    
#include <stdint.h>
    
#define CLI_CMD(X) int X(int argc, char **argv)     // define the CLI command data type
    
#define  UNUSED_ARG(X) (void)(X)
    
// All the commands that the CLI will handle
    
// CLI_CMD(Echo_Cmd);
CLI_CMD(Ver_Cmd);
CLI_CMD(Comment_Cmd);
CLI_CMD(Count_Cmd);
CLI_CMD(Alpha_Cmd);
CLI_CMD(UTX_Cmd);
CLI_CMD(A_Motor_Cmd);
CLI_CMD(Arm_Dir_Cmd);
CLI_CMD(C_Motor_Cmd);
CLI_CMD(Carousel_Dir_Cmd);
CLI_CMD(TClamp_Cmd);
CLI_CMD(TC_Air_Cmd);
CLI_CMD(Load_Cmd);
CLI_CMD(WDT_Cmd);
CLI_CMD(Status_Cmd);
CLI_CMD(Brake_Cmd);
CLI_CMD(Arm_In_Cmd);
CLI_CMD(Arm_Out_Cmd);
CLI_CMD(ToolChange_Cmd);
CLI_CMD(ToolRelease_Cmd);
CLI_CMD(ToolGrab_Cmd);
CLI_CMD(Test_Home_Cmd);
CLI_CMD(Sense_Cmd);
CLI_CMD(At_Home_Cmd);
CLI_CMD(In_Fault_Cmd);
CLI_CMD(UsbCfg_Cmd);


void StartProcesses(void);

#endif
/* [] END OF FILE */
