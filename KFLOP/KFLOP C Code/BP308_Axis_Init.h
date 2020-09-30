#ifndef BP308_AXIS_INIT_H
#define BP308_AXIS_INIT_H



// these number are from the BOSS 6 - need to recalculate for the BP308
// AXIS Resolutions
// X Axis
#define X_MICRO_STEP 16
#define X_STEPPER_PPR	200
#define X_LEADSCREW_TPI 5
#define X_PULLY_RATIO 2
#define X_STEPS_PER_INCH (X_MICRO_STEP * X_STEPPER_PPR * X_LEADSCREW_TPI * X_PULLY_RATIO)
#define X_ENCODER_PPR 500
#define X_VEL_IPS 90		// Inches per minute
#define X_VELOCITY ((X_VEL_IPS * X_STEPS_PER_INCH) / 60)
#define X_ACC 200000
#define X_JERK 3000000

#define X_BACKOFF_STEPS (X_STEPS_PER_INCH / 20)	// 1/20 of an inch
#define X_BACKOFF_VEL (X_STEPS_PER_INCH * 3 / 60)	// 3 Inch per min
#define X_FACTOR_X1 (X_STEPS_PER_INCH / 5000)	// 0.20 mil
#define X_FACTOR_X10 (X_STEPS_PER_INCH / 1000)	// 1 mil
#define X_FACTOR_X100 (X_STEPS_PER_INCH / 100)	// 10 mil
#define X_HOME_VEL (X_STEPS_PER_INCH * 25 / 60)	// 25 Inch per min

void Init_X_Axis(void);
void Init_Y_Axis(void);
void Init_Z_Axis(void);
void Init_A_Axis(void);
void Init_Spindle(void);
void Init_Axis(void);
void OffsetCal(int Axis);
void CheckZFault(void);
void DelayWithEStop(double Delay);

#endif
