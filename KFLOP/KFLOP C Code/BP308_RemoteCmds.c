#include "KMotionDef.h"
#include "BP308_RemoteCmds.h"

#include "BP308_Persist.h"
#include "BP308_IO.h"
#include "BP308_Serial.h"

void RemoteCmd(void)
{
    int cmd = persist.UserData[P_REMOTE_CMD];

    switch (cmd & CMD_MASK)      
    {
        case RC_TLAUX_CLAMP_CMD : TLAUX_Clamp_Cmd(cmd);
                                break;
        case RC_TLAUX_CAROUSEL_CMD : TLAUX_CAROUSEL_Cmd(cmd);
                                break;
        default : break;
    }
    persist.UserData[P_REMOTE_CMD] = 0; // clear the command
}


char TLAUX_Home_Cmd[] = { 0x04, TLAUX_ADDRESS, TLAUX_HOME_CMD};
char TLAUX_Cmd_1Arg[] = { 0x05, TLAUX_ADDRESS, TLAUX_CLAMP_CMD, 0x00};

int ToolBtnN;   // button history for edge detection
// putting the Button Check routine here also - this file was looking a bit small...
void ButtonCheck(void)
{
    int ToolBtn;

    ToolBtn = ReadBit(TOOL_RELEASE);    
    if(ToolBtn != ToolBtnN)
    {
    // check for:
        if(ToolBtn == 1)    // A rising edge on the Tool Release button
        {
            TLAUX_Clamp_Release_Air();
        } else              // A falling edge on the Tool Release button
        {
           TLAUX_Clamp_Grab();
        }
    }
    ToolBtnN = ToolBtn; // update button history.
    // other buttons? 
}

void Init_Buttons(void)
{
    // make sure the buttons are in the desired state
    // save that state to the button history - for edge detection.
    ToolBtnN = ReadBit(TOOL_RELEASE);
}

// clamp release with air blast and spindle stopped check - only used with tool change button
void TLAUX_Clamp_Release_Air(void)
{
     // only do this if the spindle is disabled!
    if(ReadBit(SPINDLE_ENABLE) == 0) 
    {
        TLAUX_Cmd_1Arg[COMMAND_INDEX - 1] = TLAUX_CLAMP_CMD;
        TLAUX_Cmd_1Arg[DATA_INDEX - 1] = TLAUX_CLAMP_RELA;
        Send_Serial(TLAUX_Cmd_1Arg);
    }      
}

// clamp grab with spindle stopped check - only used with tool change button
void TLAUX_Clamp_Grab(void)
{
     // only do this if the spindle is disabled!
    if(ReadBit(SPINDLE_ENABLE) == 0) 
    {
        TLAUX_Cmd_1Arg[COMMAND_INDEX - 1] = TLAUX_CLAMP_CMD;
        TLAUX_Cmd_1Arg[DATA_INDEX - 1] = TLAUX_CLAMP_GRAB;
        Send_Serial(TLAUX_Cmd_1Arg);
    }     
}

void TLAUX_Clamp_Cmd(int rcmd)
{
    switch (rcmd)
    {
        case RC_TLAUX_CLAMP_AIR : TLAUX_Clamp_AirX();    // Air only
                                break;
        case RC_TLAUX_CLAMP_REL : TLAUX_Clamp_ReleaseX();    // release no air blast
                                break;
        case RC_TLAUX_CLAMP_RELA : TLAUX_Clamp_Release_AirX(); // release with air blast 
                                break;
        case RC_TLAUX_CLAMP_GRAB : TLAUX_Clamp_GrabX(); // clamp grab
                                break;
        case RC_TLAUX_ARM_IN    : TLAUX_ArmIn();
                                break;
        case RC_TLAUX_ARM_OUT   : TLAUX_ArmOut();
                                break;
        case RC_TLAUX_HOME      : TLAUX_Clamp_Home(); // initialize the TLAUX and send it to its home position
                                break;

        default : break;
    }
                             
}

void TLAUX_Clamp_Home(void)
{
    // send the command to the serial port
    TLAUX_Cmd_1Arg[COMMAND_INDEX - 1] = TLAUX_HOME_CMD;  // TLAUX Home Command
    TLAUX_Cmd_1Arg[DATA_INDEX - 1] = 0;   // No argument
    Send_Serial(TLAUX_Cmd_1Arg);    
}

// Rotate Tool Carousel
void TLAUX_CAROUSEL_Cmd(int rcmd)
{
    // send the command to the serial port
    TLAUX_Cmd_1Arg[COMMAND_INDEX - 1] = TLAUX_CAR_CMD;  // the carousel command
    TLAUX_Cmd_1Arg[DATA_INDEX - 1] = (rcmd & 0x001f);   // tool slot number
    Send_Serial(TLAUX_Cmd_1Arg);
}

// Tool Carousel Arm retracted
void TLAUX_ArmIn(void)
{
    printf("Arm In\n");
    // send the command to the serial port
    TLAUX_Cmd_1Arg[COMMAND_INDEX - 1] = TLAUX_ARM_CMD;  // the carousel command
    TLAUX_Cmd_1Arg[DATA_INDEX - 1] = TLAUX_ARM_IN;   // tool slot number
    Send_Serial(TLAUX_Cmd_1Arg);
}

// Tool Carousel Arm Extended    
void TLAUX_ArmOut(void)
{
    printf("Arm Out\n");
    // send the command to the serial port
    TLAUX_Cmd_1Arg[COMMAND_INDEX - 1] = TLAUX_ARM_CMD;  // the carousel command
    TLAUX_Cmd_1Arg[DATA_INDEX - 1] = TLAUX_ARM_OUT;   // tool slot number
    Send_Serial(TLAUX_Cmd_1Arg);
}    

// Four possiblities
// 1 Air Blast only - Air blast automacially times out
// 2 Clamp Release with Air - Air blast automatically times out
// 3 Clamp Release no Air
// 4 Clamp Grab

// Air blast with out Spindle check
void TLAUX_Clamp_AirX(void)
{
     // send the command to the serial port
    TLAUX_Cmd_1Arg[COMMAND_INDEX - 1] = TLAUX_CLAMP_CMD;  // the carousel command
    TLAUX_Cmd_1Arg[DATA_INDEX - 1] = TLAUX_CLAMP_AIR;   // tool slot number
    Send_Serial(TLAUX_Cmd_1Arg);   
}
// Clamp release with no spindle check
void TLAUX_Clamp_ReleaseX(void)
{
     // send the command to the serial port
    TLAUX_Cmd_1Arg[COMMAND_INDEX - 1] = TLAUX_CLAMP_CMD;  // the carousel command
    TLAUX_Cmd_1Arg[DATA_INDEX - 1] = TLAUX_CLAMP_REL;   // tool slot number
    Send_Serial(TLAUX_Cmd_1Arg);     
}
// Clamp release with air blast and no spindle check
void TLAUX_Clamp_Release_AirX(void)
{
      // send the command to the serial port
    TLAUX_Cmd_1Arg[COMMAND_INDEX - 1] = TLAUX_CLAMP_CMD;  // the carousel command
    TLAUX_Cmd_1Arg[DATA_INDEX - 1] = TLAUX_CLAMP_RELA;   // tool slot number
    Send_Serial(TLAUX_Cmd_1Arg);   
}
// Clamp engage with no spindle check
void TLAUX_Clamp_GrabX(void)
{
       // send the command to the serial port
    TLAUX_Cmd_1Arg[COMMAND_INDEX - 1] = TLAUX_CLAMP_CMD;  // the carousel command
    TLAUX_Cmd_1Arg[DATA_INDEX - 1] = TLAUX_CLAMP_GRAB;   // tool slot number
    Send_Serial(TLAUX_Cmd_1Arg);    
}
