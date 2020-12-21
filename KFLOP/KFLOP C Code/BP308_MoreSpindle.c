#include "BP308_MoreSpindle.h"
#include "KMotionDef.h"
#include "BP308_IO.h"
#include "BP308_Persist.h"

//
//
#define MinRPM 12
#define RPM_TIMOUT 2.0	// 2 second timeout
//
// setup channel 7 as a PID loop for synchronous Spindle Control
// Spindle Encoder 2000 per rev
#define SP_ENCODER_RES 2000
#define SP_UPDATE_TIME 0.2
#define SP_FILTER_TAU 0.1
#define SP_SENSOR_ENCODER 1

#ifdef TESTBED

void SetSyncSpindle(void)
{
	printf("PID SPINDLE\n");
    ch7->InputMode=ENCODER_MODE;
	ch7->OutputMode=DAC_SERVO_MODE;
	ch7->Vel=180000;
	ch7->Accel=70000;
	ch7->Jerk=4e+06;
	ch7->P=0.0;
	ch7->I=0.00;
	ch7->D=0.0;
	ch7->FFAccel=0.00;
	ch7->FFVel=0.0018;
	ch7->MaxI=0;
	ch7->MaxErr=0;
	ch7->MaxOutput=1900;
	ch7->DeadBandGain=1.0;
	ch7->DeadBandRange=0.0;
	ch7->InputChan0=7;
	ch7->InputChan1=1;
	ch7->OutputChan0=7;
	ch7->OutputChan1=1;
	ch7->MasterAxis=-1;
	ch7->LimitSwitchOptions=0x12f;
	ch7->LimitSwitchNegBit=129;
	ch7->LimitSwitchPosBit=129;
	ch7->SoftLimitPos=1e+09;
	ch7->SoftLimitNeg=-1e+09;
	ch7->InputGain0=1;
	ch7->InputGain1=1;
	ch7->InputOffset0=0;
	ch7->InputOffset1=0;
	ch7->OutputGain=1;
	ch7->OutputOffset=-39;
	ch7->SlaveGain=1;
	ch7->BacklashMode=BACKLASH_OFF;
	ch7->BacklashAmount=0;
	ch7->BacklashRate=0;
	ch7->invDistPerCycle=1;
	ch7->Lead=0;
	ch7->MaxFollowingError=20000;
	ch7->StepperAmplitude=250;

	// IIR Filters are all all pass.
	ch7->iir[0].B0=1;
	ch7->iir[0].B1=0;
	ch7->iir[0].B2=0;
	ch7->iir[0].A1=0;
	ch7->iir[0].A2=0;

	ch7->iir[1].B0=1;
	ch7->iir[1].B1=0;
	ch7->iir[1].B2=0;
	ch7->iir[1].A1=0;
	ch7->iir[1].A2=0;

	ch7->iir[2].B0=1;
	ch7->iir[2].B1=0;
	ch7->iir[2].B2=0;
	ch7->iir[2].A1=0;
	ch7->iir[2].A2=0;
	SetPStatusBit(SB_SPINDLE_PID);	// SPINDLE MODE = PID Mode
	ClearPStatusBit(SB_SPINDLE_RPM);
	ResetFilters(SPINDLE_AXIS);	
}

#else
void SetSyncSpindle(void)
{
	printf("PID SPINDLE\n");
    ch7->InputMode=ENCODER_MODE;
	ch7->OutputMode=DAC_SERVO_MODE;
	ch7->Vel=180000;
	ch7->Accel=70000;
	ch7->Jerk=4e+06;
	ch7->P=0.3;
	ch7->I=0.0001;
	ch7->D=0;
	ch7->FFAccel=1e-07;
	ch7->FFVel=0.008;
	ch7->MaxI=1700;
	ch7->MaxErr=1000;
	ch7->MaxOutput=1900;
	ch7->DeadBandGain=1.0;
	ch7->DeadBandRange=0.0;
	ch7->InputChan0=7;
	ch7->InputChan1=1;
	ch7->OutputChan0=7;
	ch7->OutputChan1=1;
	ch7->MasterAxis=-1;
	ch7->LimitSwitchOptions=0x12f;
	ch7->LimitSwitchNegBit=129;
	ch7->LimitSwitchPosBit=129;
	ch7->SoftLimitPos=1e+09;
	ch7->SoftLimitNeg=-1e+09;
	ch7->InputGain0=1;
	ch7->InputGain1=1;
	ch7->InputOffset0=0;
	ch7->InputOffset1=0;
	ch7->OutputGain=1;
	ch7->OutputOffset=-39;
	ch7->SlaveGain=1;
	ch7->BacklashMode=BACKLASH_OFF;
	ch7->BacklashAmount=0;
	ch7->BacklashRate=0;
	ch7->invDistPerCycle=1;
	ch7->Lead=0;
	ch7->MaxFollowingError=20000;
	ch7->StepperAmplitude=250;

	ch7->iir[0].B0=1;
	ch7->iir[0].B1=0;
	ch7->iir[0].B2=0;
	ch7->iir[0].A1=0;
	ch7->iir[0].A2=0;

	ch7->iir[1].B0=1;
	ch7->iir[1].B1=0;
	ch7->iir[1].B2=0;
	ch7->iir[1].A1=0;
	ch7->iir[1].A2=0;

	ch7->iir[2].B0=1;
	ch7->iir[2].B1=0;
	ch7->iir[2].B2=0;
	ch7->iir[2].A1=0;
	ch7->iir[2].A2=0;
	SetPStatusBit(SB_SPINDLE_PID);	// SPINDLE MODE = PID Mode
	ClearPStatusBit(SB_SPINDLE_RPM);
	ResetFilters(SPINDLE_AXIS);
}

#endif

// setup channel 7 as an open loop 
void SetRPMSpindle(void)
{
	printf("RPM Spindle\n");
	
	ch7->InputMode=ENCODER_MODE;
	ch7->OutputMode=DAC_SERVO_MODE;
	ch7->Vel=5900;
	ch7->Accel=1700;
	ch7->Jerk=20000;
	ch7->P=0;
	ch7->I=0;
	ch7->D=0;
	ch7->FFAccel=0;
	ch7->FFVel=0.275;	// 9V DAC value / (Units / sec) --- using RPM as the Jog value units/sec 
	ch7->MaxI=0;
	ch7->MaxErr=0;
	ch7->MaxOutput=1700;
	ch7->DeadBandGain=1;
	ch7->DeadBandRange=0;
	ch7->InputChan0=7;
	ch7->InputChan1=1;
	ch7->OutputChan0=7;
	ch7->OutputChan1=1;
	ch7->MasterAxis=-1;
	ch7->LimitSwitchOptions=0x12f;
	ch7->LimitSwitchNegBit=129;
	ch7->LimitSwitchPosBit=129;
	ch7->SoftLimitPos=1e+09;
	ch7->SoftLimitNeg=-1e+09;
	ch7->InputGain0=1;
	ch7->InputGain1=1;
	ch7->InputOffset0=0;
	ch7->InputOffset1=0;
	ch7->OutputGain=1;
	ch7->OutputOffset=-39;
	ch7->SlaveGain=1;
	ch7->BacklashMode=BACKLASH_OFF;
	ch7->BacklashAmount=0;
	ch7->BacklashRate=0;
	ch7->invDistPerCycle=1;
	ch7->Lead=0;
	ch7->MaxFollowingError=1000000000;
	ch7->StepperAmplitude=250;

	ch7->iir[0].B0=1;
	ch7->iir[0].B1=0;
	ch7->iir[0].B2=0;
	ch7->iir[0].A1=0;
	ch7->iir[0].A2=0;

	ch7->iir[1].B0=1;
	ch7->iir[1].B1=0;
	ch7->iir[1].B2=0;
	ch7->iir[1].A1=0;
	ch7->iir[1].A2=0;

	ch7->iir[2].B0=1;
	ch7->iir[2].B1=0;
	ch7->iir[2].B2=0;
	ch7->iir[2].A1=0;
	ch7->iir[2].A2=0;

	ClearPStatusBit(SB_SPINDLE_PID);	
	SetPStatusBit(SB_SPINDLE_RPM);	// SPINDLE MODE RPM Mode - JOG7=RPM
	ResetFilters(SPINDLE_AXIS);

}

void SpindleEnable(void)
{

#ifdef TESTBED
	SetBit(SPINDLE_ENABLE);
	// pause for just a bit
	Delay_sec(0.4);
	SetPStatusBit(SB_SPINDLE_ON);
#else
   	if(ReadBit(SPINDLE_FAULT) == SPINDLE_FAULTED)
	{
		printf("Check Spindle Fault!\n");
	}
	else if(ReadBit(SPINDLE_ENABLE) == 0)
    {
        SetBit(SPINDLE_ENABLE);	// enable the hardware signal
		Delay_sec(0.2);	// delay while the hardware enables.
		ConfigureSpindle(SP_SENSOR_ENCODER, SPINDLE_AXIS, SP_UPDATE_TIME, SP_FILTER_TAU, SP_ENCODER_RES);
		EnableAxis(SPINDLE_AXIS);		
		SetPStatusBit(SB_SPINDLE_ON);
		printf("SP Enabled\n");
    } else
	{
		printf("Spindle Already Enabled\n");
	}
#endif
	
}
void SpindleDisable(void)
{
	DisableAxis(SPINDLE_AXIS);
    ClearBit(SPINDLE_ENABLE);
	ClearPStatusBit(SB_SPINDLE_ON);
	printf("SP Disabled\n");
}

int CheckSpindleOn(void)
{
	#ifdef TESTBED
	// if on the TESTBED only check the SPINDLE ENABLE - because the falut detect doesn't exist
	if(ReadBit(SPINDLE_ENABLE) == 1)
	{
		return TRUE;
	}
	return FALSE;

	#else

    if((ReadBit(SPINDLE_ENABLE) == 1) && (ReadBit(SPINDLE_FAULT) == SPINDLE_FAULT_OK))
    {
        return TRUE;
    } else 
    return FALSE;
    
	#endif
}

void Spindle_Home(void)
{
	xSpindle_Home();	// home the spindle
	// disable the spindle axis and turn off the spindle drive
	SpindleDisable();
//	DisableAxis(SPINDLE_AXIS);
//	ClearBit(SPINDLE_ENABLE);
//	ClearPStatusBit(SB_SPINDLE_ON);
	printf("Spindle Off\n");

}

void Spindle_CW(int RPM)
{
	if(CheckSpindleOn() == FALSE)	// is spindle already running?
	{
		// if not then enable and start the spindle
		SetRPMSpindle();
		SpindleEnable();
		// wait just a bit for it to enable
		Delay_sec(0.2);	// double check how long this should take.

	}
	if(PStatusBitIsSet(SB_SPINDLE_PID) != FALSE) // if the Spindle is in PID mode... 
	{
		SetRPMSpindle();
	}
		// if so make sure it is running the correct way. jog to the new value - actually don't have to do this. 
//		if(PStatusBitIsSet(SB_SPINDLE_CCW))
//		{
			// stop the spindle first
//			Jog(SPINDLE_AXIS, 0);
			// wait for it to get there...not sure I need to do this - check before coding it up.
//		}
	// get the set spindle speed - double stored in persist variable
	Jog(SPINDLE_AXIS, *(float *)&persist.UserData[P_SPINDLE_RPM_CMD]);
	SetPStatusBit(SB_SPINDLE_CW);
	ClearPStatusBit(SB_SPINDLE_CCW);

	// the motion control will automatically decelerate and reverse direction.
	// if not yet running, change to RPM mode and enable and Jog.
}
void Spindle_CCW(int RPM)
{
	if(CheckSpindleOn() == FALSE)	// is spindle already running?
	{
		// if not then enable and start the spindle
		SetRPMSpindle();
		SpindleEnable();
		// wait just a bit for it to enable
		Delay_sec(0.2);
	}
	
	if(PStatusBitIsSet(SB_SPINDLE_PID) != FALSE) // if the Spindle is in PID mode... 
	{
		SetRPMSpindle();
	}
		// if so make sure it is running the correct way. jog to the new value - actually don't have to do this. 
//		if(PStatusBitIsSet(SB_SPINDLE_CW))
//		{
			// stop the spindle first
//			Jog(SPINDLE_AXIS, 0);
			// wait for it to get there...not sure I need to do this - check before coding it up.
//		}
	// get the set spindle speed - double stored in persist variable
	Jog(SPINDLE_AXIS, -(*(float *)&persist.UserData[P_SPINDLE_RPM_CMD]));
	SetPStatusBit(SB_SPINDLE_CCW);
	ClearPStatusBit(SB_SPINDLE_CW);
}


void Spindle_Stop(void)
{
	#ifdef TESTBED
	if(CheckSpindleOn() ==TRUE)
	{
		ClearPStatusBit(SB_SPINDLE_CW);
		ClearPStatusBit(SB_SPINDLE_CCW);
		SpindleDisable();	
	}
	#else
	if(CheckSpindleOn() == TRUE)
	{
	// set spindle jog to 0
		Jog(SPINDLE_AXIS, 0);
		// wait for axis to finish... 
		WaitSP();	
		ClearPStatusBit(SB_SPINDLE_CW);
		ClearPStatusBit(SB_SPINDLE_CCW);
		SpindleDisable();
	}
	#endif
}

void xSpindle_PID(void)
{
	// do a little more than just shift to PID
	if(PStatusBitIsSet(SB_SPINDLE_PID) == FALSE)	// if not currently in PID mode then...
	{
		if(CheckSpindleOn() == TRUE)
		{
			// make sure that the spindle is not turning...
			Jog(SPINDLE_AXIS, 0);
			WaitSP();
			SpindleDisable();	// don't switch to PID while enabled.
		}
		SetSyncSpindle();	// When switching from RPM to PID should we automatacially re-home?
	} 
}

void xSpindle_RPM(void)
{
	if(PStatusBitIsSet(SB_SPINDLE_RPM)== FALSE)
	{
		if(CheckSpindleOn() == TRUE)
		{
			// make sure that the spindle is not turning...
			Jog(SPINDLE_AXIS, 0);
			WaitSP();
			SpindleDisable();
		}
		SetRPMSpindle();
	}
}

// home the spindle but leave it enabled. Ready to move to a controlled position
void xSpindle_Home(void)
{
#ifdef TESTBED
	// if not in PID mode then switch to PID mode
	if(CheckSpindleOn() == TRUE)
	{
		SpindleDisable();
	}
		// set the home bit in P_STATUS to indicate it is not homed
		SetPStatusBit(SB_SPIN_HOME);

		// wait for for a little time to simulate the actual process.
		Delay_sec(1.0); // Wait 1.0 second
		Zero(SPINDLE_AXIS);
		chan[SPINDLE_AXIS].Position = 0;
		SetSyncSpindle();	// set the spindle control to PID
		printf("Spindle Homed!\n");
		SpindleDisable();
		printf("Spindle Off\n");	

#else
// set the home bit in P_STATUS to indicate it is not homed
	SetPStatusBit(SB_SPIN_HOME);

	double home_pos;
	// first make sure the spindle is off!
	if(CheckSpindleOn() == TRUE)
	{
		// if the spindle is on and in RPM Mode then jog to 0 then switch to PID Mode
		if(PStatusBitIsSet(SB_SPINDLE_RPM) != FALSE)
		{
			Jog(SPINDLE_AXIS,0);    // stop the motion		
			printf("SP Jog 0");	// TEST - 
			WaitSP();
		}
		SpindleDisable();
		WaitNextTimeSlice();
	}
	// set the spindle to synch mode
	SetSyncSpindle();
	SpindleEnable();
	Delay_sec(0.1); // short delay to allow spindle drive to initialize
	if(CheckSpindleOn() == TRUE)	// <- why do this again? didn't we just enable the spindle? - this also checks the Fault.
	{
		 // is the spindle on the index Switch?
    	Jog(SPINDLE_AXIS, (SPINDLE_HOME_VEL));    // move slowly until Index is set.
		while(ReadBit(SPINDLE_R) != SPINDLE_AT_INDEX)
		{
			WaitNextTimeSlice();
		}
    	home_pos = chan[SPINDLE_AXIS].Dest;     // record the index location in home_pos
	   	Jog(SPINDLE_AXIS,0);    // stop the motion
		WaitSP();
    	MoveAtVel(SPINDLE_AXIS, home_pos, HOME_VEL_3);
    	WaitSP();
		Zero(SPINDLE_AXIS);
		
		// clear the appropriate bit in the P_STATUS variable - 1 = not homed, 0 = homed
		ClearPStatusBit(SB_SPIN_HOME); // persist.UserData[P_STATUS] &= ~(1 << SB_SPIN_HOME);
		printf("Spindle Homed\n");
	}
	else 
	{
		printf("Spindle Homing Fault!\n");
		SetPStatusBit(SB_SPIN_HOME); // set the status bit means not homed!
	}

#endif

}

// helper functions
void WaitSP(void)	// should we be checking for the axis enalbed here?
{
	// while(CheckDone(SPINDLE_AXIS) != CD_DONE)
	// {
	// 	WaitNextTimeSlice();
	// }
	WaitAxis(SPINDLE_AXIS);
}

void WaitAxis(int Axis)
{
	while(CheckDone(Axis) != CD_DONE)
	{
		WaitNextTimeSlice();
	}
}

// returns TRUE if the axis completes normally, FALSE if there is a timeout
int WaitAxisTimeout(int Axis, double Timeout)
{
	double CheckTime = Time_sec() + Timeout;
	while (CheckDone(Axis) != CD_DONE)
	{
		WaitNextTimeSlice();
		if(Time_sec() > CheckTime)
		{
			return FALSE;
		}
	}
	return TRUE;
}

