#include "BP308_Axis_Init.h"
#include "KMotionDef.h"
#include "BP308_IO.h"
#include "BP308_Persist.h"
#include "BP308_Startup.h"


#ifdef TESTBED
// Axis control values for the test bed
// this passes the velocity (position deritive) data straight through to the DACs
void Init_X_Axis(void)
{
	ch0->InputMode=NO_INPUT_MODE;
	ch0->OutputMode=DAC_SERVO_MODE;
	ch0->Vel=160000;
	ch0->Accel=2e+06;
	ch0->Jerk=1e+08;
	ch0->P=0.0;
	ch0->I=0.0;
	ch0->D=0.0;
	ch0->FFAccel=0;
	ch0->FFVel=-0.0084;	// 9V DAC value / max velocity --- 1680 / 200000 
	ch0->MaxI=0;
	ch0->MaxErr=0;
	ch0->MaxOutput=1800;
	ch0->DeadBandGain=1;
	ch0->DeadBandRange=0;
	ch0->InputChan0=0;
	ch0->InputChan1=0;
	ch0->OutputChan0=0;
	ch0->OutputChan1=0;
	ch0->MasterAxis=-1;
	ch0->LimitSwitchOptions=0x120;
	ch0->LimitSwitchNegBit=X_LIMIT;
	ch0->LimitSwitchPosBit=X_LIMIT;
	ch0->SoftLimitPos=1e+09;
	ch0->SoftLimitNeg=-1e+09;
	ch0->InputGain0=1;
	ch0->InputGain1=1;
	ch0->InputOffset0=0;
	ch0->InputOffset1=0;
	ch0->OutputGain=1;
	ch0->OutputOffset=0;
	ch0->SlaveGain=1;
	ch0->BacklashMode=BACKLASH_OFF;
	ch0->BacklashAmount=0;
	ch0->BacklashRate=0;
	ch0->invDistPerCycle=1;
	ch0->Lead=0;
	ch0->MaxFollowingError=1e+09;
	ch0->StepperAmplitude=20;

	ch0->iir[0].B0=0.090048;
	ch0->iir[0].B1=0.090048;
	ch0->iir[0].B2=0;
	ch0->iir[0].A1=0.819902;
	ch0->iir[0].A2=0;

	ch0->iir[1].B0=1;
	ch0->iir[1].B1=0;
	ch0->iir[1].B2=0;
	ch0->iir[1].A1=0;
	ch0->iir[1].A2=0;

	ch0->iir[2].B0=0.047244;
	ch0->iir[2].B1=0.094487;
	ch0->iir[2].B2=0.047244;
	ch0->iir[2].A1=1.3021;
	ch0->iir[2].A2=-0.49107;
}

void Init_Y_Axis(void)
{
	ch1->InputMode=NO_INPUT_MODE;
	ch1->OutputMode=DAC_SERVO_MODE;
	ch1->Vel=160000;
	ch1->Accel=2e+06;
	ch1->Jerk=1e+08;
	ch1->P=0.0;
	ch1->I=0.0;
	ch1->D=0.0;
	ch1->FFAccel=0;
	ch1->FFVel=-0.0084;	// 9V DAC value / max velocity --- 1680 / 200000
	ch1->MaxI=0;
	ch1->MaxErr=0;
	ch1->MaxOutput=1800;
	ch1->DeadBandGain=1;
	ch1->DeadBandRange=0;
	ch1->InputChan0=1;
	ch1->InputChan1=0;
	ch1->OutputChan0=1;
	ch1->OutputChan1=0;
	ch1->MasterAxis=-1;
	ch1->LimitSwitchOptions=0x120;
	ch1->LimitSwitchNegBit=Y_LIMIT;
	ch1->LimitSwitchPosBit=Y_LIMIT;
	ch1->SoftLimitPos=1e+09;
	ch1->SoftLimitNeg=-1e+09;
	ch1->InputGain0=1;
	ch1->InputGain1=1;
	ch1->InputOffset0=0;
	ch1->InputOffset1=0;
	ch1->OutputGain=1;
	ch1->OutputOffset=0;
	ch1->SlaveGain=1;
	ch1->BacklashMode=BACKLASH_OFF;
	ch1->BacklashAmount=0;
	ch1->BacklashRate=0;
	ch1->invDistPerCycle=1;
	ch1->Lead=0;
	ch1->MaxFollowingError=1e+09;
	ch1->StepperAmplitude=20;

	ch1->iir[0].B0=0.090048;
	ch1->iir[0].B1=0.090048;
	ch1->iir[0].B2=0;
	ch1->iir[0].A1=0.819902;
	ch1->iir[0].A2=0;

	ch1->iir[1].B0=1;
	ch1->iir[1].B1=0;
	ch1->iir[1].B2=0;
	ch1->iir[1].A1=0;
	ch1->iir[1].A2=0;

	ch1->iir[2].B0=0.047244;
	ch1->iir[2].B1=0.094487;
	ch1->iir[2].B2=0.047244;
	ch1->iir[2].A1=1.3021;
	ch1->iir[2].A2=-0.49107;
}

void Init_Z_Axis(void)
{
	ch2->InputMode=NO_INPUT_MODE;
	ch2->OutputMode=DAC_SERVO_MODE;
	ch2->Vel=160000;
	ch2->Accel=2e+06;
	ch2->Jerk=1e+08;
	ch2->P=0.0;
	ch2->I=0.0;
	ch2->D=0.0;
	ch2->FFAccel=0;
	ch2->FFVel=-0.0084;	// 9V DAC value / max velocity --- 1680 / 200000
	ch2->MaxI=0;
	ch2->MaxErr=0;
	ch2->MaxOutput=1800;
	ch2->DeadBandGain=1;
	ch2->DeadBandRange=0;
	ch2->InputChan0=2;
	ch2->InputChan1=0;
	ch2->OutputChan0=2;
	ch2->OutputChan1=0;
	ch2->MasterAxis=-1;
	ch2->LimitSwitchOptions=0x120;
	ch2->LimitSwitchNegBit=Z_LIMIT;
	ch2->LimitSwitchPosBit=Z_LIMIT;
	ch2->SoftLimitPos=1e+09;
	ch2->SoftLimitNeg=-1e+09;
	ch2->InputGain0=1;
	ch2->InputGain1=1;
	ch2->InputOffset0=0;
	ch2->InputOffset1=0;
	ch2->OutputGain=1;
	ch2->OutputOffset=0;
	ch2->SlaveGain=1;
	ch2->BacklashMode=BACKLASH_OFF;
	ch2->BacklashAmount=0;
	ch2->BacklashRate=0;
	ch2->invDistPerCycle=1;
	ch2->Lead=0;
	ch2->MaxFollowingError=1e+09;
	ch2->StepperAmplitude=20;

	ch2->iir[0].B0=0.090048;
	ch2->iir[0].B1=0.090048;
	ch2->iir[0].B2=0;
	ch2->iir[0].A1=0.819902;
	ch2->iir[0].A2=0;

	ch2->iir[1].B0=1;
	ch2->iir[1].B1=0;
	ch2->iir[1].B2=0;
	ch2->iir[1].A1=0;
	ch2->iir[1].A2=0;

	ch2->iir[2].B0=0.047244;
	ch2->iir[2].B1=0.094487;
	ch2->iir[2].B2=0.047244;
	ch2->iir[2].A1=1.3021;
	ch2->iir[2].A2=-0.49107;	
}

void Init_A_Axis(void)
{}

void Init_Spindle(void)
{}

#else

// Axis control values for the BP308 machine 

// X Axis, Encoder resolution = 0.0008 mm, 31.496e-6 inch, 1250 steps/mm or 31750 steps/in
//

void Init_X_Axis(void)
{
	ch0->InputMode=ENCODER_MODE;
	ch0->OutputMode=DAC_SERVO_MODE;
	ch0->Vel=160000;		// 7680 mm/min or 302 in/min - top speed. Rated speed is 200000 - 9600 mm/min or 377 in/mm
	ch0->Accel=0.9e+06;
	ch0->Jerk=2e+07;
	ch0->P=0.9;
	ch0->I=0.015;
	ch0->D=0;
	ch0->FFAccel=1e-07;
	ch0->FFVel=0.01;
	ch0->MaxI=1200;
	ch0->MaxErr=1500;		// Setting max error to max output/P or 1500/3 = 500
	ch0->MaxOutput=1800;	// 1500 = 8V max output - 1680 is 9V
	ch0->DeadBandGain=1;
	ch0->DeadBandRange=0;
	ch0->InputChan0=0;
	ch0->InputChan1=0;
	ch0->OutputChan0=0;
	ch0->OutputChan1=0;
	ch0->MasterAxis=-1;
	ch0->LimitSwitchOptions=0x12f;
	ch0->LimitSwitchNegBit=X_LIMIT;
	ch0->LimitSwitchPosBit=X_LIMIT;
	ch0->SoftLimitPos=1e+09;
	ch0->SoftLimitNeg=-1e+09;
	ch0->InputGain0=1;
	ch0->InputGain1=1;
	ch0->InputOffset0=0;
	ch0->InputOffset1=0;
	ch0->OutputGain=1;
	ch0->OutputOffset=0; //-36;
	ch0->SlaveGain=1;
	ch0->BacklashMode=BACKLASH_OFF;
	ch0->BacklashAmount=0;
	ch0->BacklashRate=0;
	ch0->invDistPerCycle=1;
	ch0->Lead=0;
	ch0->MaxFollowingError=2000;	// 2000 error is 1/4 turn of the lead screw - this is a lot of error - may want to revisit this
	ch0->StepperAmplitude=20;

	// LPF 1
	ch0->iir[0].B0=0.0900485;
	ch0->iir[0].B1=0.0900485;
	ch0->iir[0].B2=0;
	ch0->iir[0].A1=0.819902;
	ch0->iir[0].A2=0;

	// LPF 2
	ch0->iir[1].B0=1;
	ch0->iir[1].B1=0;
	ch0->iir[1].B2=0;
	ch0->iir[1].A1=0;
	ch0->iir[1].A2=0;

	// LPF 3
	ch0->iir[2].B0=0.0472436;
	ch0->iir[2].B1=0.0944873;
	ch0->iir[2].B2=0.0472436;
	ch0->iir[2].A1=1.3021;
	ch0->iir[2].A2=-0.49107;

	ResetFilters(X_AXIS);
}

// Y Axis, Encoder resolution = 0.0008 mm, 31.496e-6 inch, 1250 steps/mm or 31750 steps/in
//
void Init_Y_Axis(void)
{
	ch1->InputMode=ENCODER_MODE;
	ch1->OutputMode=DAC_SERVO_MODE;
	ch1->Vel=160000;		// 7680 mm/min or 302 in/min - top speed. Rated speed is 200000 - 9600 mm/min or 377 in/mm
	ch1->Accel=0.9e+06;
	ch1->Jerk=2e+07;
	ch1->P=0.9;
	ch1->I=0.015;
	ch1->D=0;
	ch1->FFAccel=1e-05;
	ch1->FFVel=0.01;
	ch1->MaxI=1000;
	ch1->MaxErr=1400;		// Setting max error to max output/P or 1500/3 = 500
	ch1->MaxOutput=1800;	// 1500 = 8V max output  - 1680 is 9V
	ch1->DeadBandGain=1;
	ch1->DeadBandRange=0;
	ch1->InputChan0=1;
	ch1->InputChan1=0;
	ch1->OutputChan0=1;
	ch1->OutputChan1=0;
	ch1->MasterAxis=-1;
	ch1->LimitSwitchOptions=0x12f;
	ch1->LimitSwitchNegBit=Y_LIMIT;
	ch1->LimitSwitchPosBit=Y_LIMIT;
	ch1->SoftLimitPos=1e+09;
	ch1->SoftLimitNeg=-1e+09;
	ch1->InputGain0=1;
	ch1->InputGain1=1;
	ch1->InputOffset0=0;
	ch1->InputOffset1=0;
	ch1->OutputGain=1;
	ch1->OutputOffset=0; //-36;
	ch1->SlaveGain=1;
	ch1->BacklashMode=BACKLASH_OFF;
	ch1->BacklashAmount=0;
	ch1->BacklashRate=0;
	ch1->invDistPerCycle=1;
	ch1->Lead=0;
	ch1->MaxFollowingError=2000;	// 2000 error is 1/4 turn of the lead screw - this is a lot of error - may want to revisit this
	ch1->StepperAmplitude=20;

	// LPF 1
	ch1->iir[0].B0=0.078916;
	ch1->iir[0].B1=0.078916;
	ch1->iir[0].B2=0;
	ch1->iir[0].A1=0.843619;
	ch1->iir[0].A2=0;

	// LPF 2
	ch1->iir[1].B0=1;
	ch1->iir[1].B1=0;
	ch1->iir[1].B2=0;
	ch1->iir[1].A1=0;
	ch1->iir[1].A2=0;

	// LPF 3
	ch1->iir[2].B0=0.0385131;
	ch1->iir[2].B1=0.0770262;
	ch1->iir[2].B2=0.0385131;
	ch1->iir[2].A1=1.37736;
	ch1->iir[2].A2=-0.531416;

	ResetFilters(Y_AXIS);
}

// Z Axis, Encoder resolution = 0.0005mm, 19.68539e-6 inch, 2000 steps/mm or 50800 steps/in
//
void Init_Z_Axis(void)
{
	ch2->InputMode=ENCODER_MODE;
	ch2->OutputMode=DAC_SERVO_MODE;
	ch2->Vel=160000;		// 4800 mm/min or 189 in/min - top speed. Rated speed is 250000 - 7500 mm/min or 295 in/mm
	// ch2->Accel=2e+06;
	// ch2->Jerk=1e+07;
	ch2->Accel=0.8e+06;
	ch2->Jerk=0.4e+07;
	ch2->P=1.3;
	ch2->I=0.01;
	ch2->D=0;
	ch2->FFAccel=1e-08;
	ch2->FFVel=0.01;
	ch2->MaxI=1000;
	ch2->MaxErr=600;		// Setting max error to max output/P or 1500/3 = 500
	ch2->MaxOutput=1700;	// 1340 = 7.2V max output  - 1680 is 9V
	ch2->DeadBandGain=1;
	ch2->DeadBandRange=0;
	ch2->InputChan0=2;
	ch2->InputChan1=0;
	ch2->OutputChan0=2;
	ch2->OutputChan1=0;
	ch2->MasterAxis=-1;
	ch2->LimitSwitchOptions=0x12f;
	ch2->LimitSwitchNegBit=Z_LIMIT;
	ch2->LimitSwitchPosBit=Z_LIMIT;
	ch2->SoftLimitPos=1e+09;
	ch2->SoftLimitNeg=-1e+09;
	ch2->InputGain0=1;	// for some unexplained reason the Z-Axis has changed polarity. Don't know what caused it but this the fix. - I was changing the control module around a bit.
	// OK, Figured out why the direction swapped, I had swapped the Parameter Board (accidently) The parameter board in the SIMODRIVE 611 is 
	// set different than the X, Y and A axis. the direction is reversed (DIP Switch setting) and it has weight compensation (R48)
	ch2->InputGain1=1;
	ch2->InputOffset0=0;
	ch2->InputOffset1=0;
	ch2->OutputGain=1;
	ch2->OutputOffset=0; //\\-36;
	ch2->SlaveGain=1;
	ch2->BacklashMode=BACKLASH_OFF;
	ch2->BacklashAmount=0;
	ch2->BacklashRate=0;
	ch2->invDistPerCycle=1;
	ch2->Lead=0;
	ch2->MaxFollowingError=8000;	// 2000 error is 1/4 turn of the lead screw - this is a lot of error - may want to revisit this // changed to 8000
	ch2->StepperAmplitude=20;

	// LPF 1
	ch2->iir[0].B0=0.0781906;
	ch2->iir[0].B1=0.0781906;
	ch2->iir[0].B2=0;
	ch2->iir[0].A1=0.843619;
	ch2->iir[0].A2=0;

	// LPF 2
	ch2->iir[1].B0=1;
	ch2->iir[1].B1=0;
	ch2->iir[1].B2=0;
	ch2->iir[1].A1=0;
	ch2->iir[1].A2=0;

	// LPF 3
	ch2->iir[2].B0=0.0472522;
	ch2->iir[2].B1=0.0945044;
	ch2->iir[2].B2=0.0472522;
	ch2->iir[2].A1=1.30233;
	ch2->iir[2].A2=-0.491341;

	ResetFilters(Z_AXIS);
}


void Init_A_Axis(void)
{

}

void Init_Spindle(void)
{

}

#endif

void Init_Axis(void)
{
	// define the coordinate system
	DefineCoordSystem(X_AXIS, Y_AXIS, Z_AXIS, -1);	// no A Axis
	// initialize the Axis settings and coefficients
	Init_X_Axis();
	Init_Y_Axis();
	Init_Z_Axis();
	Init_A_Axis();
	// Init_Spindle(); Spindle is initalize everytime it is enabled. 

	// zero the Axis
	Zero(X_AXIS);
	Zero(Y_AXIS);
	Zero(Z_AXIS);

	//	Delay_sec(0.2);	

	// enable the axis 
	EnableAxis(X_AXIS);
	EnableAxis(Y_AXIS);
	EnableAxis(Z_AXIS);

#define OffsetWaitDelay 0.3
#define ZBrakeWaitDelay 0.5

	DelayWithEStop(OffsetWaitDelay);

	// Delay_sec(0.3);
	// start of delay time
#ifndef TESTBED
	// ch2->MaxFollowingError=2000;	// 2000 error is 1/4 turn of the lead screw - this is a lot of error - may want to revisit this // changed to 8000
	
	// auto offset calibration
	// read the output when not in motion and set that value as the offset
	OffsetCal(X_AXIS);
	OffsetCal(Y_AXIS);
	OffsetCal(Z_AXIS);
// 	OffsetCal(A_AXIS);
	chan[SPINDLE_AXIS].OutputOffset = -38;	// this is just an estimate that makes the spindle almost 0

	DelayWithEStop(ZBrakeWaitDelay);

	// Release the Z Brake
	SetBit(Z_BRAKE);
	//pause for a short time to allow things to settle
	// this should give time for the brake to release, and the axis to zero
	ch2->MaxFollowingError=1500; // reduce the Z Axis max following error to something reasonable 

#endif	

}

void OffsetCal(int Axis)
{
	// auto offset calibration
	// read the output when not in motion and set that value as the offset

	double offset;

	if(CheckDone(Axis) != CD_AXIS_DISABLED)	// only do this if the axis is not disabled.
	{
		offset = chan[Axis].Output;	// read the output disable and set the output 
		DisableAxis(Axis);
		ResetFilters(Axis);
		chan[Axis].OutputOffset = offset;
		EnableAxis(Axis);
		WaitNextTimeSlice();	// only do one per slice.
	}
}

void CheckZFault(void)
{
	if(persist.UserData[P_INGORE_FAULT] == 0)
	{
		if(CheckDone(Z_AXIS) == CD_AXIS_DISABLED)
		{
			// Z_Axis has been disabled...
			int BitState = ReadBit(Z_BRAKE);
			ClearBit(Z_BRAKE);	// turn the Z Axis brake back on - so the head doesn't fall down.
			// send a message to the console so we know what happened
			if(BitState == 1)	// this should only print when the bit is changed
			{
				printf("Z - Axis Disabled - Brake Applied\n");
			}
		}
	}

}

void DelayWithEStop(double Delay)
{
	double DelayStopTime = Time_sec() + Delay;
	while(Time_sec() < DelayStopTime)
	{
		// check ESTOP
		if(ReadBit(ESTOP) == ESTOP_ACTIVE)
        {
            ClearPStatusBit(SB_ESTOP); // persist.UserData[P_STATUS] &= ~(_BV(SB_ESTOP));     // clear the Estop bit in P_STATUS and copy to P_STATUS_REPORT so the PC application can pick it up.
            persist.UserData[P_STATUS_REPORT] = persist.UserData[P_STATUS]  | 0x01; // copy P_STATUS and set the LSB to 1
            ESTOP_Loop();   // go to the ESTOP Loop.
        }
		WaitNextTimeSlice();
	}
}
