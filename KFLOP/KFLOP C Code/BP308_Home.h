#ifndef BP308_HOME_H
#define BP308_HOME_H





// Testing
void Test_Msg(int pmsg);
void Serial_Msg_Test(int pmsg);
void StatusRead(void);

// Zeroing & Homing Routines
void Zero_Axis(int Axis);

void Home_AxisCmd(int pmsg);
void Home_All_Axis(void);
void Home_Axis(int Axis, int Home, int Index);

// Limit Switch handlers
void Limit_Backoff(int pmsg);
// void Backoff_Xpos(void);
// void Backoff_Xneg(void);
// void Backoff_Ypos(void);
// void Backoff_Yneg(void);
// void Backoff_Zpos(void);
// void Backoff_Zneg(void);

// tool changer routines
void Select_Tool(int pmsg);

void Tool_Clamp(int pmsg);
void Tool_Arm(int pmsg);

// Coolant routines
void Mist_On(void) ;
void Flood_On(void);
void Coolant_Off(void);

// Spindle Control Routines
void Spindle_Cmd(int pmsg);

// Axis Commands
void Axis_Cmd(int pmsg);

// Probe Commands
void Probe_Cmd(int pmsg);
void Probe_Axis(int Axis);
void Probe_XYZ(void);
void ToolSet(void);

// misc commands
int WaitForRemoteDone(double delay);


#endif
