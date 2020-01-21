#ifndef BP308_HOME_H
#define BP308_HOME_H

// Thread 2 Notify Commands
#define T2_STATUS       0x0100
#define T2_TEST_MSG     0x0200
#define T2_SER_TEST_MSG 0x0300
#define T2_ZERO_AXIS    0x0400
#define T2_ZERO_X       0x0400
#define T2_ZERO_Y       0x0401
#define T2_ZERO_Z       0x0402
#define T2_ZERO_A       0x0403
#define T2_HOME_AXIS    0x0800
#define T2_HOME_X       0x0801
#define T2_HOME_Y       0x0802
#define T2_HOME_Z       0x0803
#define T2_HOME_A       0x0804
#define T2_LIMIT_BACKOFF 0x0a00
#define T2_LIM_XP       0x0a01
#define T2_LIM_XN       0x0a02
#define T2_LIM_YP       0x0a03
#define T2_LIM_YN       0x0a04
#define T2_LIM_ZP       0x0a05
#define T2_LIM_ZN       0x0a06
#define T2_SEL_TOOL     0x0c00

#define CMD_MASK 0xff00

// Testing
void Test_Msg(int pmsg);
void Serial_Msg_Test(int pmsg);
void StatusRead(void);

// Zeroing & Homing Routines
void Zero_Axis(int Axis);

void Home_All_Axis(int pmsg);
void Home_Axis(int Axis, int Home, int Index);
void Home_X(void);
void Home_Y(void);
void Home_Z(void);
void Home_A(void);


// Limit Switch handlers
void Limit_Backoff(int pmsg);
void Backoff_Xpos(void);
void Backoff_Xneg(void);
void Backoff_Ypos(void);
void Backoff_Yneg(void);
void Backoff_Zpos(void);
void Backoff_Zneg(void);

// tool changer routines
void Select_Tool(void);

// Coolant routines
void Mist_On(void) ;
void Flood_On(void);
void Coolant_Off(void);



#endif