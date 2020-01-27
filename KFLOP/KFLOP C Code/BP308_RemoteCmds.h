#ifndef BP308_REMOTECMDS_H
#define BP308_REMOTECMDS_H

// these are the commands that can be sent from another Thread or Process to trigger an action in the main forever loop - like sending a serial message.
// Remote commands are send in the persist.UserData[P_REMOTE_CMD] variable.
// the value is initialized to 0 and is cleard when the command is received. Any process wanting to send a command should verify that 
// it is cleared before setting it to the desired command

// Remote Command List - moved to BP308_Persist.h



// Remote Command Functions

void RemoteCmd(void);

// Button Check 
void ButtonCheck(void);

void Init_Buttons(void);

void TLAUX_Clamp_Release_Air(void);
void TLAUX_Clamp_Grab(void);

#endif
