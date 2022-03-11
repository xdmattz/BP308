
#ifndef SERCMDS_H
#define SERCMDS_H
    
#include <cytypes.h>
    


#define SER_CMD(X) int X(uint8 *SerMsg) 
    
#define  UNUSED_ARG(X) (void)(X)
    
SER_CMD(CmdFunctionName1);   
SER_CMD(CmdFunctionName2); 
SER_CMD(TC_StatusCmd);
SER_CMD(TC_Arm_Cmd);
SER_CMD(TC_Carousel_Cmd);
SER_CMD(TC_Clamp_Cmd);
SER_CMD(TC_Home_Cmd);
SER_CMD(TC_Brake_Cmd);

#endif    
/* [] END OF FILE */
