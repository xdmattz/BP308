#ifndef BP308_STARTUP_H
#define BP308_STARTUP_H

#define MS10_Time 0.01
#define MS1_Time 0.001

// all the functions in BP308 Startup.
// all this so I can have the main routine at the top

void ESTOP_Loop(void);
void SerialPort_Manager(void);
void Periodic_Processes(void);




#endif