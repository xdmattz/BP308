#ifndef BP308_MORESPINDLE_H
#define BP308_MORESPINDLE_H

void SetSyncSpindle(void);
void SetRPMSpindle(void);
void SpindleEnable(void);
void SpindleDisable(void);
int CheckSpindleOn(void);
void Spindle_Home(void);
void Spindle_CW(int RPM);
void Spindle_CCW(int RPM);
void Spindle_Stop(void);

void xSpindle_PID(void);
void xSpindle_RPM(void);

// helper functions
void WaitSP(void);
void WaitAxis(int Axis);
int WaitAxisTimeout(int Axis, double Timeout);

#endif
