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
#include "ToolCmds.h"
#include "Processes.h"

#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include "Serial_IO.h"

extern func_ptr FastProcess[];
extern func_ptr MsProcess[];
extern func_ptr SlowProcess[];

extern func_ptr TC_SM;

static int CarouselDir = 0;
static int ArmDir = 0;

char u_msg[32];

CLI_CMD(Ver_Cmd)
{
    UNUSED_ARG(argc);UNUSED_ARG(argv);
    
    PutStr("\r** BP308 TLAUX with PSOC-5 **\r");
#ifdef TESTBED	
    PutStr("\r** Test Bed Version **\r");
    PutStr("\r** Simulates all serial commands **\r");
#endif	
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


CLI_CMD(A_Motor_Cmd)
{
    int Pulse_time;
    if(argc < 2)
    {
        TC_Set_Delay(1000);  // 1 second 
    }
    else
    {
        Pulse_time = strtoul(argv[1], NULL, 0);
        TC_Set_Delay(Pulse_time);
    }
    // start the Arm Motor with delay process
    // set the state machine to TestStateDelay
    TC_SM = &TC_Test_Delay;
    if(ArmDir == 0)
    {
        TRIAC_PORT |= (Pin_Tool_Arm_FWD_MASK | Pin_Tool_Arm_Brake_MASK); // Motor FWD and Brake Release
    }
    else
    {
        TRIAC_PORT |= (Pin_Tool_Arm_REV_MASK | Pin_Tool_Arm_Brake_MASK); // Motor REV and Brake Release
    }
    return 0;
}

CLI_CMD(Arm_Dir_Cmd)
{
    if(argc < 2)
    {
        //PutStr("usage: a_dir {in/out}\r");
        // print out the current direction
        if(ArmDir == 0)
        {
            PutStr("Arm Dir: OUT");
        }
        else 
        {
            PutStr("Arm Dir: IN");
        }
        return 0;
    }
   if(strcmp(argv[1], "in") == 0)
    {
        ArmDir = 1;
    }
    if(strcmp(argv[1], "out") == 0)
    {
        ArmDir = 0;
    }
    return 0;
}

CLI_CMD(C_Motor_Cmd)
{
        int Pulse_time;
    if(argc < 2)
    {
        TC_Set_Delay(1000);  // 1 second 
    }
    else
    {
        Pulse_time = strtoul(argv[1], NULL, 0);
        TC_Set_Delay(Pulse_time);
    }
    // start the Carousel Motor with delay process
    TC_SM = &TC_Test_Delay;
    if(CarouselDir == 0)
    {
        TRIAC_PORT &= ~(Pin_Car_REV_MASK); // make sure that REV is off!
        TRIAC_PORT |= Pin_Car_FWD_MASK; // turn the carousel motor FWD
    }
    else
    {
        TRIAC_PORT &= ~(Pin_Car_FWD_MASK);  // make sure that FWD is off!
        TRIAC_PORT |= Pin_Car_REV_MASK; // turn the carousel motor REV
    }
    
    return 0;
}

CLI_CMD(Carousel_Dir_Cmd)
{
        if(argc < 2)
    {
        //PutStr("usage: a_dir {in/out}\r");
        // print out the current direction
        if(CarouselDir == 0)
        {
            PutStr("Carousel Dir: CW");
        }
        else 
        {
            PutStr("Carousel Dir: CCW");
        }        
        return 0;
    }
   if(strcmp(argv[1], "cw") == 0)
    {
        CarouselDir = 0;
    }
    if(strcmp(argv[1], "ccw") == 0)
    {
        CarouselDir = 1;
    }
    return 0;
}

CLI_CMD(Brake_Cmd)
{
    int Pulse_time;
    if(argc < 2)
    {
        TC_Set_Delay(1000);  // 1 second 
    }
    else
    {
        Pulse_time = strtoul(argv[1], NULL, 0);
        TC_Set_Delay(Pulse_time);
    }
    // Release the ARM Brake for xx milliseconds
    // set the state machine to TestStateDelay
    TC_SM = &TC_Test_Delay;
    TRIAC_PORT |= Pin_Tool_Arm_Brake_MASK; // Motor FWD and Brake Release

    return 0;
}

// turn the tool clamp on or off.
CLI_CMD(TClamp_Cmd)
{
    if(argc < 2)
    {
        PutStr("usage: tclamp {on/off}");
        return 0;
    }
   if(strcmp(argv[1], "on") == 0)
    {
        TRIAC_PORT |= Pin_Tool_Clamp_MASK;   // turn the air on
    }
    if(strcmp(argv[1], "off") == 0)
    {
        TRIAC_PORT &= ~(Pin_Tool_Clamp_MASK); // turn the air off
    }
    return 0;
}

// turn the air blast on or off
CLI_CMD(TC_Air_Cmd)
{
    if(argc < 2)
    {
        PutStr("usage: Tool Changer Air {on/off}");
        return 0;
    }
   if(strcmp(argv[1], "on") == 0)
    {
        TRIAC_PORT |= Pin_Tool_Air_MASK;   // turn the air on
    }
    if(strcmp(argv[1], "off") == 0)
    {
        TRIAC_PORT &= ~Pin_Tool_Air_MASK; // turn the air off
    }
    return 0;
}

CLI_CMD(Load_Cmd)
{
    UNUSED_ARG(argc);UNUSED_ARG(argv);
    Bootloadable_Load();      // uncomment when the bootloadable is active
    
    return 0;
}
CLI_CMD(WDT_Cmd)
{
    UNUSED_ARG(argc);UNUSED_ARG(argv);
    return 0;
//    for(;;) // loop forever - causes Watchdog reset
//    {}
}

CLI_CMD(Status_Cmd)
{
    UNUSED_ARG(argc);UNUSED_ARG(argv);
    
    int status1 = ToolStatusQuery();
    sprintf(u_msg, "Status: 0x%X ", status1);
    PutStr(u_msg);
    TC_Status();
    return 0;
}

// actual operational commands
CLI_CMD(Arm_In_Cmd)
{
    UNUSED_ARG(argc);UNUSED_ARG(argv);
    Arm_Cmd(1); // exactly the same command function as serial
    return 0;
}
CLI_CMD(Arm_Out_Cmd)
{
    UNUSED_ARG(argc);UNUSED_ARG(argv);
    Arm_Cmd(2);
    return 0;
}

CLI_CMD(ToolChange_Cmd)
{
    // get the tool number
    int tool;
    if(argc < 2)
    {
        tool = Get_Current_Tool();  // 1 second 
        sprintf(u_msg, "Current Tool is %d", tool);
        PutStr(u_msg);
    }
    else
    {
        tool = strtoul(argv[1], NULL, 0);
        if((tool > NUMBER_OF_TOOLS) || (tool < 1)) 
        {
            sprintf(u_msg,"Tool out of range! 1 to %d", NUMBER_OF_TOOLS);
            PutStr(u_msg);
            return 0;
        }
        else
        {
            Carousel_Cmd((int8)(tool));
        }
    }
    
    return 0;
}

CLI_CMD(ToolRelease_Cmd)
{
    UNUSED_ARG(argc);UNUSED_ARG(argv);
    Clamp_Cmd(2);
    return 0;
}

CLI_CMD(ToolGrab_Cmd)
{
    UNUSED_ARG(argc);UNUSED_ARG(argv);
    Clamp_Cmd(4);
    return 0;
}

CLI_CMD(Test_Home_Cmd)
{
    UNUSED_ARG(argc);UNUSED_ARG(argv);
    Home_Cmd(0);
    return 0;
}

CLI_CMD(Sense_Cmd)
{
    UNUSED_ARG(argc);UNUSED_ARG(argv);
    uint8  p0, p1;
    p0 = SENSE_PORT;
    p1 = FAULT_PORT;
    sprintf(u_msg, "Port0: 0x%X, Port1: 0x%X", p0, p1);
    PutStr(u_msg);
    return 0;
}

CLI_CMD(At_Home_Cmd)
{
    UNUSED_ARG(argc);UNUSED_ARG(argv);
    if(At_Home() == 0)
    {
        PutStr("Not HOME!");
    }
    else
    {
        PutStr("HOME!");
    }
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
        PutStr("*** FAULT ***\n");
        uint8 fault = (FAULT_PORT & (Pin_V_Mon2_MASK | Pin_AC_Mon_MASK | Pin_ESTOP_MASK));
        if((fault & Pin_V_Mon2_MASK) == 0)
        {
            PutStr("Under Voltage Fault\n");
        }
        if((fault & Pin_AC_Mon_MASK) != 0)
        {
            PutStr("No AC Voltage Fault\n");
        }
        if((fault & Pin_ESTOP_MASK) == 0)
        {
            PutStr("ESTOP Fault\n");
        }
		TC_Status();    // get the state machine status
    }
    return 0;
}



CLI_CMD(Blink_Cmd)
{
    if(argc < 2)
    {
        PutStr("usage: blink {on/off}");
        return 0;
    }
   if(strcmp(argv[1], "on") == 0)
    {
        if(Process_Running(MsProcess, BlinkProcess))
        {
            PutStr("Blink already running!");
        } else {
            Add_Process(MsProcess, &(BlinkProcess));
            InitCountProcess();
            PutStr("Blink is ON!");
        }
    }
    if(strcmp(argv[1], "off") == 0)
    {
        Del_Process(MsProcess, &(BlinkProcess));
        PutStr("Blink is OFF!");
    }
    return 0;
}
/* [] END OF FILE */
