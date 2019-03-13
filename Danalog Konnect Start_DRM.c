#include "KMotionDef.h"
#include "BP308 Axis Init.h"


// This program will slowly rotate a brushless motor using an Amplifier
// that requires 2 analog inputs that are driven 120 degrees out-of-phase
//

#define AXIS 0       		// Axis channel to be rotated (assume DACS 0,1 then 2,3 then ..)
#define AMPLITUDE 1600.0f  	// Set how hard to drive the coils DAC counts

#define FREQ 2.0f

#define RAD120DEG (TWO_PI_F*0.25f)

#define X_AXIS 0
#define Y_AXIS 1
#define Z_AXIS 2
#define A_AXIS 3
#define SPINDLE_AXIS 7


// #include "BP308 X Axis Motor no load tune.h"
main()
{
	int k=0,dk=8;
	float theta;
	double P0, P1, P2, P3, P4;
	double Elapsed_Time;

	
	InitAux();
	AddKonnect(0,&VirtualBits,VirtualBitsEx);	// start the Konnect
	
	printf("Konnect Started!\n");
	
	
	// Initialize the DAC outputs for all the axis
	
	DAC(X_AXIS, -36);
	DAC(Y_AXIS, -36);
	DAC(Z_AXIS, -36);
	DAC(A_AXIS, -36);
	DAC(SPINDLE_AXIS, -152);
	
	
	
	// Init_X_Axis();
	
	Elapsed_Time = Time_sec();
	for (;;)
    {
		WaitNextTimeSlice();
		// check the E-Stop button
		if((Time_sec() - Elapsed_Time) > 1.0) // print out the current position
		{
			Elapsed_Time = Time_sec();
			P0 = chan[X_AXIS].Position;
			P1 = chan[Y_AXIS].Position;
			P2 = chan[Z_AXIS].Position;
			P3 = chan[A_AXIS].Position;
			P4 = chan[SPINDLE_AXIS].Position;
			printf("X = %f,  Y = %f,  Z = %f,  A = %f,  SP = %f\n", P0, P1, P2, P3, P4);
		}
		
		
    }
}

