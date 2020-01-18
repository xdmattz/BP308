
#ifndef SERCMDS_H
#define SERCMDS_H
    
#include <cytypes.h>
    


#define SER_CMD(X) int X(uint8 *SerMsg) 
    
#define  UNUSED_ARG(X) (void)(X)
    
SER_CMD(CmdFunctionName1);   
SER_CMD(CmdFunctionName2); 
SER_CMD(MPG_StatusCmd);


#endif    
/* [] END OF FILE */
