#include "BP308_MoreSpindle.h"
#include "KMotionDef.h"
#include "BP308_IO.h"

// setup channel 7 as a PID loop for synchronous Spindle Control
// Spindle Encoder 2000 per rev

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
}

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


}

void SpindleEnable(void)
{
   // if(ReadBit((SPINDLE_FAULT != SPINDLE_FAULTED) && (ReadBit(SPINDLE_ENABLE) == 0)))
   if(ReadBit(SPINDLE_ENABLE) == 0)
    {
        SetBit(SPINDLE_ENABLE);
		printf("SP Enabled\n");
    } else
	{
		printf("Check Fault!\n");
	}
	
}
void SpindleDisable(void)
{
    ClearBit(SPINDLE_ENABLE);
}

int CheckSpindleOn(void)
{
    if((ReadBit(SPINDLE_ENABLE) == 1) && (ReadBit(SPINDLE_FAULT) == SPINDLE_FAULT_OK))
    {
        return TRUE;
    } else 
    {
        return FALSE;
    }
}

void Spindle_Home(void)
{


	#ifdef TESTBED
		// clear the appropriate bit in the P_STATUS variable - 1 = not homed, 0 = homed
		persist.UserData[P_STATUS] &= ~(1 << SB_SPIN_HOME);
		printf("Spindle Homed!\n");
	#else
	
	double home_pos;
	// first make sure the spindle is off!
	if(CheckSpindleOn == TRUE)
	{
		SpindleDisable();	// turn the spindle off and wait for RPM = 0;
		//
		while (persist.UserData[P_SPINDLE_RPM] != 0)
		{
			WaitNextTimeSlice();
		}
	}
	// set the spindle to synch mode
	SetSyncSpindle();
	// turn on the spindle
	SpindleEnable();
	// wait a little while it comes up 
	Delay_sec(0.3); // short delay to allow spindle drive to initialize
	if(CheckSpindleOn == TRUE)
	{
		 // is the spindle on the index Switch?
    
    	Jog(SPINDLE_AXIS, (HOME_VEL_3));    // move slowly until Index is set.
		while(ReadBit(SPINDLE_R) == INDEX_NOT_INDEX)
		{
			WaitNextTimeSlice();
		}
    	home_pos = chan[SPINDLE_AXIS].Dest;     // record the index location
    	Jog(SPINDLE_AXIS,0);    // stop the motion
    	MoveAtVel(SPINDLE_AXIS, home_pos, HOME_VEL_3);
    	while(CheckDone(SPINDLE_AXIS) != CD_DONE)    // move to the index location
		{
			WaitNextTimeSlice();
		}
		// clear the appropriate bit in the P_STATUS variable - 1 = not homed, 0 = homed
		persist.UserData[P_STATUS] &= ~(1 << SB_SPIN_HOME);
	} 
	else 
	{
		// some kind of fault happend
		// spindle is not homed
		printf("Spindle Problem!\nSpindle did not HOME\n");
		persist.UserData[P_STATUS] |= _BV(SB_SPIN_HOME);	// set the spindle home bit - ie not homed
	}
	#endif
}

void Spindle_CW(int RPM)
{
	// is spindle already running?
	// if so make sure it is running the correct way. jog to the new value
	// if not yet running, change to RPM mode and enable and Jog.
}
void Spindle_CCW(int RPM)
{
	// is spindle already running?
}
void Spindle_Stop(void)
{

}

