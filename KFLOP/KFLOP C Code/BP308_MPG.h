#ifndef BP308_MPG_H
#define BP308_MPG_H

// time constants for MPG smoothing
// #define TAU 0.08 // smoothness factor (Low Pass Time constant seconds)
#define TAU 0.15 // smoothness factor (Low Pass Time constant seconds)
#define FINAL_TIME 0.85 // Set final dest after this amount of time with no change

void Init_MPG(void);
void ServiceMPG(void);
int MPG2Axis(int MAxis);

#endif
