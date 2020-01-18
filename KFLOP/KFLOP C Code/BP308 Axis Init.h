#ifndef BP308_AXIS_INIT_H
#define BP308_AXIS_INIT_H

#include "KMotionDef.h"


// X Axis, Encoder resolution = 0.001mm, 39.370079e-6 inch, 1000 steps/mm or 25400 steps/in
//

#define X_AXIS 0
#define Y_AXIS 1
#define Z_AXIS 2
#define A_AXIS 3
#define SPINDLE_AXIS 7

void Init_X_Axis(void)
{
	ch0->InputMode=ENCODER_MODE;
	ch0->OutputMode=DAC_SERVO_MODE;
	ch0->Vel=160000;		// 9600 mm/min or 377 in/min - top speed. Rated speed is 200000 - 12000 mm/min or 472 in/mm
	ch0->Accel=7e+06;
	ch0->Jerk=3e+07;
	ch0->P=3;
	ch0->I=0.01;
	ch0->D=0;
	ch0->FFAccel=1e-05;
	ch0->FFVel=0.002;
	ch0->MaxI=800;
	ch0->MaxErr=500;		// Setting max error to max output/P or 1500/3 = 500
	ch0->MaxOutput=1500;	// 1500 = 8V max output - 1680 is 9V
	ch0->DeadBandGain=1;
	ch0->DeadBandRange=0;
	ch0->InputChan0=0;
	ch0->InputChan1=0;
	ch0->OutputChan0=0;
	ch0->OutputChan1=0;
	ch0->MasterAxis=-1;
	ch0->LimitSwitchOptions=0x127;
	ch0->LimitSwitchNegBit=132;
	ch0->LimitSwitchPosBit=132;
	ch0->SoftLimitPos=1e+09;
	ch0->SoftLimitNeg=-1e+09;
	ch0->InputGain0=1;
	ch0->InputGain1=1;
	ch0->InputOffset0=0;
	ch0->InputOffset1=0;
	ch0->OutputGain=1;
	ch0->OutputOffset=-36;
	ch0->SlaveGain=1;
	ch0->BacklashMode=BACKLASH_OFF;
	ch0->BacklashAmount=0;
	ch0->BacklashRate=0;
	ch0->invDistPerCycle=1;
	ch0->Lead=0;
	ch0->MaxFollowingError=2000;	// 2000 error is 1/4 turn of the lead screw - this is a lot of error - may want to revisit this
	ch0->StepperAmplitude=20;

	// LPF 1
	ch0->iir[0].B0=0.14504;
	ch0->iir[0].B1=0.14504;
	ch0->iir[0].B2=0;
	ch0->iir[0].A1=0.709919;
	ch0->iir[0].A2=0;

	// LPF 2
	ch0->iir[1].B0=1;
	ch0->iir[1].B1=0;
	ch0->iir[1].B2=0;
	ch0->iir[1].A1=0;
	ch0->iir[1].A2=0;

	// LPF 3
	ch0->iir[2].B0=0.0490337;
	ch0->iir[2].B1=0.0980675;
	ch0->iir[2].B2=0.0490337;
	ch0->iir[2].A1=1.35143;
	ch0->iir[2].A2=-0.547568;
}

void Init_Y_Axis(void)
{
	ch1->InputMode=ENCODER_MODE;
	ch1->OutputMode=DAC_SERVO_MODE;
	ch1->Vel=160000;		// 9600 mm/min or 377 in/min - top speed. Rated speed is 200000 - 12000 mm/min or 472 in/mm
	ch1->Accel=7e+06;
	ch1->Jerk=3e+07;
	ch1->P=3;
	ch1->I=0.01;
	ch1->D=0;
	ch1->FFAccel=1e-05;
	ch1->FFVel=0.002;
	ch1->MaxI=800;
	ch1->MaxErr=500;		// Setting max error to max output/P or 1500/3 = 500
	ch1->MaxOutput=1500;	// 1500 = 8V max output  - 1680 is 9V
	ch1->DeadBandGain=1;
	ch1->DeadBandRange=0;
	ch1->InputChan0=0;
	ch1->InputChan1=0;
	ch1->OutputChan0=0;
	ch1->OutputChan1=0;
	ch1->MasterAxis=-1;
	ch1->LimitSwitchOptions=0x127;
	ch1->LimitSwitchNegBit=132;
	ch1->LimitSwitchPosBit=132;
	ch1->SoftLimitPos=1e+09;
	ch1->SoftLimitNeg=-1e+09;
	ch1->InputGain0=1;
	ch1->InputGain1=1;
	ch1->InputOffset0=0;
	ch1->InputOffset1=0;
	ch1->OutputGain=1;
	ch1->OutputOffset=-36;
	ch1->SlaveGain=1;
	ch1->BacklashMode=BACKLASH_OFF;
	ch1->BacklashAmount=0;
	ch1->BacklashRate=0;
	ch1->invDistPerCycle=1;
	ch1->Lead=0;
	ch1->MaxFollowingError=2000;	// 2000 error is 1/4 turn of the lead screw - this is a lot of error - may want to revisit this
	ch1->StepperAmplitude=20;

	// LPF 1
	ch1->iir[0].B0=0.14504;
	ch1->iir[0].B1=0.14504;
	ch1->iir[0].B2=0;
	ch1->iir[0].A1=0.709919;
	ch1->iir[0].A2=0;

	// LPF 2
	ch1->iir[1].B0=1;
	ch1->iir[1].B1=0;
	ch1->iir[1].B2=0;
	ch1->iir[1].A1=0;
	ch1->iir[1].A2=0;

	// LPF 3
	ch1->iir[2].B0=0.0490337;
	ch1->iir[2].B1=0.0980675;
	ch1->iir[2].B2=0.0490337;
	ch1->iir[2].A1=1.35143;
	ch1->iir[2].A2=-0.547568;
}

void Init_Z_Axis(void)
{
	ch2->InputMode=ENCODER_MODE;
	ch2->OutputMode=DAC_SERVO_MODE;
	ch2->Vel=160000;		// 4800 mm/min or 189 in/min - top speed. Rated speed is 250000 - 7500 mm/min or 295 in/mm
	ch2->Accel=7e+06;
	ch2->Jerk=3e+07;
	ch2->P=3;
	ch2->I=0.01;
	ch2->D=0;
	ch2->FFAccel=1e-05;
	ch2->FFVel=0.002;
	ch2->MaxI=800;
	ch2->MaxErr=500;		// Setting max error to max output/P or 1500/3 = 500
	ch2->MaxOutput=1340;	// 1340 = 7.2V max output  - 1680 is 9V
	ch2->DeadBandGain=1;
	ch2->DeadBandRange=0;
	ch2->InputChan0=0;
	ch2->InputChan1=0;
	ch2->OutputChan0=0;
	ch2->OutputChan1=0;
	ch2->MasterAxis=-1;
	ch2->LimitSwitchOptions=0x127;
	ch2->LimitSwitchNegBit=132;
	ch2->LimitSwitchPosBit=132;
	ch2->SoftLimitPos=1e+09;
	ch2->SoftLimitNeg=-1e+09;
	ch2->InputGain0=1;
	ch2->InputGain1=1;
	ch2->InputOffset0=0;
	ch2->InputOffset1=0;
	ch2->OutputGain=1;
	ch2->OutputOffset=-36;
	ch2->SlaveGain=1;
	ch2->BacklashMode=BACKLASH_OFF;
	ch2->BacklashAmount=0;
	ch2->BacklashRate=0;
	ch2->invDistPerCycle=1;
	ch2->Lead=0;
	ch2->MaxFollowingError=2000;	// 2000 error is 1/4 turn of the lead screw - this is a lot of error - may want to revisit this
	ch2->StepperAmplitude=20;

	// LPF 1
	ch2->iir[0].B0=0.14504;
	ch2->iir[0].B1=0.14504;
	ch2->iir[0].B2=0;
	ch2->iir[0].A1=0.709919;
	ch2->iir[0].A2=0;

	// LPF 2
	ch2->iir[1].B0=1;
	ch2->iir[1].B1=0;
	ch2->iir[1].B2=0;
	ch2->iir[1].A1=0;
	ch2->iir[1].A2=0;

	// LPF 3
	ch2->iir[2].B0=0.0490337;
	ch2->iir[2].B1=0.0980675;
	ch2->iir[2].B2=0.0490337;
	ch2->iir[2].A1=1.35143;
	ch2->iir[2].A2=-0.547568;
}


void Init_A_Axis(void)
{

}

void Init_Spindle(void)
{

}

void Init_Axis(void)
{
	Init_X_Axis();
	Init_Y_Axis();
	Init_Z_Axis();
	Init_A_Axis();
	Init_Spindle();
}

#endif