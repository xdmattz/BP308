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
