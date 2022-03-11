#ifndef BP308_REMOTECMDS_H
#define BP308_REMOTECMDS_H

// these are the commands that can be sent from another Thread or Process to trigger an action in the main forever loop - like sending a serial message.
// Remote commands are send in the persist.UserData[P_REMOTE_CMD] variable.
// the value is initialized to 0 and is cleard when the command is received. Any process wanting to send a command should verify that 
// it is cleared before setting it to the desired command

// Remote Command List - moved to BP308_Persist.h



// Remote Command Functions

void RemoteCmd(void);

void TLAUX_Clamp_Cmd(int rcmd);
void TLAUX_CAROUSEL_Cmd(int rcmd);

// Button Check 
void ButtonCheck(void);

void Init_Buttons(void);


void TLAUX_Clamp_Release_Air(void);
void TLAUX_Clamp_Grab(void);

void TLAUX_Clamp_Home(void);
void TLAUX_CAROUSEL_Cmd(int rcmd);  // Rotate Tool Carousel
void TLAUX_ArmIn(void);     // Tool Carousel Arm retracted
void TLAUX_ArmOut(void);    // Tool Carousel Arm Extended 
void TLAUX_Brake(int rcmd); // Arm Brake release command

void TLAUX_Clamp_AirX(void); // air blast - no spindle check  
void TLAUX_Clamp_ReleaseX(void); // clamp release no air blast
void TLAUX_Clamp_Release_AirX(void); // clamp release with air blast
void TLAUX_Clamp_GrabX(void);   // clamp grab no spindle check

#endif
