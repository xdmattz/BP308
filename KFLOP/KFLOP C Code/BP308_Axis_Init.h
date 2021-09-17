#ifndef BP308_AXIS_INIT_H
#define BP308_AXIS_INIT_H



// these number are from the BOSS 6 - need to recalculate for the BP308
// Recalculated for BP308 - everything is metric on this machine!
// AXIS Resolutions
// X Axis
// The following were for the BOSS 6 Stepper Motors
// #define X_MICRO_STEP 16
// #define X_STEPPER_PPR	200
// #define X_LEADSCREW_TPI 5
// #define X_PULLY_RATIO 2
// #define X_STEPS_PER_INCH (X_MICRO_STEP * X_STEPPER_PPR * X_LEADSCREW_TPI * X_PULLY_RATIO)
// #define X_ENCODER_PPR 500
// #define X_VEL_IPS 90		// Inches per minute
// #define X_VELOCITY ((X_VEL_IPS * X_STEPS_PER_INCH) / 60)
// #define X_ACC 200000
// #define X_JERK 3000000

// BP308 lead screw calculations

#define X_LEADSCREW_PITCH 8.0 // mm
// Pulley Ratios and Encoder are defined in BP308_IO.h

#define X_RES_PER_INCH 25400.0 // encoder resolution per inch
#define X_RES_PER_METER 1000000.0

// #define X_BACKOFF_STEPS (X_STEPS_PER_INCH / 20)	// 1/20 of an inch
#define X_BACKOFF_STEPS (X_RES_PER_INCH / 20)   // 1/20 of an inch
// #define X_BACKOFF_VEL (X_STEPS_PER_INCH * 3 / 60)	// 3 Inch per min
#define X_BACKOFF_VEL (X_RES_PER_INCH * 3 / 60)	// 3 Inch per min
// #define X_FACTOR_X1 (X_STEPS_PER_INCH / 5000)	// 0.20 mil
#define X_FACTOR_X1 (X_RES_PER_INCH / 10000)	// 0.10 mil
// #define X_FACTOR_X10 (X_STEPS_PER_INCH / 1000)	// 1 mil
#define X_FACTOR_X10 (X_RES_PER_INCH / 1000)	// 1.0 mil
// #define X_FACTOR_X100 (X_STEPS_PER_INCH / 100)	// 10 mil
#define X_FACTOR_X100 (X_RES_PER_INCH / 100)	// 10.0 mil
#define X_FACTOR_X1M (X_RES_PER_METER / 20000)  // 0.05 mm
#define X_FACTOR_X10M (X_RES_PER_METER / 2000) // 0.5 mm
#define X_FACTOR_X100M (X_RES_PER_METER / 200) // 2.0 mm

// #define X_HOME_VEL (X_STEPS_PER_INCH * 25 / 60)	// 25 Inch per min
#define X_HOME_VEL (X_RES_PER_INCH * 30 / 60)	// 30 Inch per min

// Y Axis same resolution as the X Axis

#define Z_LEADSCREW_PITCH 5 // mm
#define Z_PULLEY_RATIO 2
#define Z_ENCODER_RESOLUTION 5000

#define Z_RES_PER_INCH 50800.0 // encoder resolution per inch
#define Z_RES_PER_METER 2000000.0 // resolution per meter

#define Z_BACKOFF_STEPS (Z_RES_PER_INCH / 20)     // 1/20 of an inch
#define Z_BACKOFF_VEL (Z_RES_PER_INCH * 3 / 60)     // 3 inch per min
#define Z_FACTOR_X1 (Z_RES_PER_INCH / 10000)    // 0.1 milS
#define Z_FACTOR_X10 (Z_RES_PER_INCH / 1000)    // 1 mil
#define Z_FACTOR_X100 (Z_RES_PER_INCH / 100)    // 10 mil
#define Z_FACTOR_X1M (Z_RES_PER_METER / 20000)    // 0.05 mm
#define Z_FACTOR_X10M (Z_RES_PER_METER / 2000)    // 0.5 mm
#define Z_FACTOR_X100M (Z_RES_PER_METER / 200)    // 2.0 mm

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
