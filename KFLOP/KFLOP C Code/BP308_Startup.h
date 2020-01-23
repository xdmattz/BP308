#ifndef BP308_STARTUP_H
#define BP308_STARTUP_H

#define MS05_Time 0.005
#define MS10_Time 0.01
#define MS1_Time 0.001

// all the functions in BP308 Startup.
// all this so I can have the main routine at the top

int Axis_Printout(double ETime);
void ESTOP_Loop(void);
void Periodic_Processes(void);




#endif
