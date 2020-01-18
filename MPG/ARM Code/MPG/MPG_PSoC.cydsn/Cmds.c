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

#include <project.h>

#include "Cmds.h"
#include "CLI.h"
#include "U_HW.h"
#include "State_Machine.h"
#include "MPGCmds.h"
#include "Processes.h"

#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include "Serial_IO.h"

extern func_ptr FastProcess[];
extern func_ptr MsProcess[];
extern func_ptr SlowProcess[];

extern func_ptr MPG_SM;

char u_msg[32];

CLI_CMD(Ver_Cmd)
{
    UNUSED_ARG(argc);UNUSED_ARG(argv);
    
    PutStr("\r** BP308 MPG with PSOC-5 **\r");
	PutStr("  Version 1.00\r");
	PutStr(__DATE__" "__TIME__"\r");
	return 0;
}

CLI_CMD(Comment_Cmd)
{
    UNUSED_ARG(argc);UNUSED_ARG(argv);
    
    return 0;
}

CLI_CMD(Count_Cmd)
{
    if(argc < 2)
    {
        PutStr("usage: count {on/off}");
        return 0;
    }
   if(strcmp(argv[1], "on") == 0)
    {
        if(Process_Running(MsProcess, CountProcess))
        {
            PutStr("Count already running!");
        } else {
            Add_Process(MsProcess, &(CountProcess));
            InitCountProcess();
            PutStr("Count is ON!");
        }
    }
    if(strcmp(argv[1], "off") == 0)
    {
        Del_Process(MsProcess, &(CountProcess));
        PutStr("Count is OFF!");

    }
    return 0;
}

CLI_CMD(Alpha_Cmd)
{
        if(argc < 2)
    {
        PutStr("usage: alpha {on/off}");
        return 0;
    }
   if(strcmp(argv[1], "on") == 0)
    {
        if(Process_Running(MsProcess, AlphaProcess))
        {
            PutStr("Alpha already running!");
        } else {
            Add_Process(MsProcess, &(AlphaProcess));
            InitAlphaProcess();
            PutStr("Alpha is ON!");
        }
    }
    if(strcmp(argv[1], "off") == 0)
    {
        Del_Process(MsProcess, &(AlphaProcess));
        PutStr("Alpha is OFF!");
    }
    return 0;
}

CLI_CMD(UTX_Cmd)
{
    if(argc >= 1)
    {
        for(uint8 i=1; i < argc; i++)
        {
            UART_PutStr((uint8 *) argv[i]);
        }
    }
    return 0;
}


CLI_CMD(State_Cmd)
{
        UNUSED_ARG(argc);UNUSED_ARG(argv);
        PutStr("Status : ");
        MPG_Status();
    return 0;
}



CLI_CMD(Load_Cmd)
{
    UNUSED_ARG(argc);UNUSED_ARG(argv);
    Bootloadable_Load();      // uncomment when the bootloadable is active
    
    return 0;
}



CLI_CMD(In_Fault_Cmd)
{
    UNUSED_ARG(argc);UNUSED_ARG(argv);
    if(In_Fault() == 0)
    {
        PutStr("NO FAULT");
    }
    else
    {
        PutStr("*** FAULT ***");
    }
    return 0;
}
/* [] END OF FILE */
