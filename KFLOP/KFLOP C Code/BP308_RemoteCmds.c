#include "KMotionDef.h"
#include "BP308_RemoteCmds.h"

#include "BP308_Persist.h"
#include "BP308_IO.h"
#include "BP308_Serial.h"

void RemoteCmd(void)
{
    int cmd = persist.UserData[P_REMOTE_CMD];

    switch (cmd)      
    {
        case RC_TLAUX_CLAMP_AIR : TLAUX_Clamp_Release_Air();
                                break;
        case RC_TLAUX_CLAMP_GRAB : TLAUX_Clamp_Grab();
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
