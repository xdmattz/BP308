#pragma TI_COMPILER // (optimization) or (optimization, size)

// BP308 Startup
// this is the main loop that runs on the KFLOP for the BP308 Machine
// this program should always run in thread 1 so it will not be cleared during ESTOP
// 
// performs the following functions:
// Initialization
// Serial port management - for monitoring the MPG and TLAUX
// MPG Management
// Other periodic processes that have to run all the time. - Add here as implemented.

#include "KMotionDef.h"

#include "BP308_Persist.h"
#include "BP308_IO.h"
#include "BP308_Startup.h"

// maybe if I had an actual project file (or make file) I could make these all .h
#include "BP308_Axis_Init.c"
#include "BP308_Hardware.c"
#include "BP308_MPG.c"
#include "BP308_Spindle.c"
#include "BP308_Serial.c"
#include "BP308_RemoteCmds.c"

#define RUNNING_STATUS_LOG

main()
{

	double Elapsed_Time;
    double MS_Slow_Timer;      // timer for slow peroidic events - 5 to 10 ms resolution

	// Initialize everything

    // Initialize the Konnect part of the Danalog Board
	InitAux();
	AddKonnect(0,&VirtualBits,VirtualBitsEx);	// start the Konnect section of the Danalog Board
	printf("Konnect Started!\n");

    Delay_sec(0.1); // short delay to allow Konnect and Kanalog to initialize

    Init_Variables();
    // Initialize the serial port
	Init_BP308_Serial();
	
	
	// Initialize the DAC outputs for all the axis
    // Probably don't need to do this once the axis are all turned on and running.
	
	DAC(X_AXIS, -36);
	DAC(Y_AXIS, -36);
	DAC(Z_AXIS, -36);
	DAC(A_AXIS, -36);
	DAC(SPINDLE_AXIS, -152);

    Init_BP308_Hardware();  // hardware check
	
	Init_Axis();    // initialize all the axis variables and enable the axis

	
    Elapsed_Time = Time_sec();
    MS_Slow_Timer = Time_sec() + MS05_Time;


    // Check for hardware present

    // main loop - where all the action happens - runs forever - or until the universe ends (with an ESTOP).
	for (;;)
    {
		WaitNextTimeSlice();    // always start on a new time slice
		// check the E-Stop button
        if(ReadBit(ESTOP) == ESTOP_ACTIVE)
        {
            ESTOP_Loop();   // go to the ESTOP Loop.
        }
        else
        {
            // check the serial port for an input
            // SetBit(TP1);     // Test Point Toggle
            SerialPort_Manager();
            // ClearBit(TP1);
			// Peiodic processes and checks
            if(Time_sec() > MS_Slow_Timer)
            {
                MS_Slow_Timer = Time_sec() + MS05_Time;    // reset the timer
                // do the fucntions that happen every Slow time tick
                Periodic_Processes();
                //printf("Tick time = %f\n", Time_sec());
            }

            // check for a fault in the persistant status 
            // turn off the spindle 
            // ServiceSpindleCount();  // manage the Spindle encoder count for MACH3 spindle speed display
            ServiceMPG();           // manage the MPG 

#ifdef RUNNING_STATUS_LOG
            if(Axis_Printout(Elapsed_Time) != 0)
            {
                Elapsed_Time = Time_sec();
            }
#endif  

        }
    }
}

int Axis_Printout(double ETime)
{
    if((Time_sec() - ETime) > 1.0) // print out the current position
    {
        double P0, P1, P2, P3, P4;

        P0 = chan[X_AXIS].Position;
        P1 = chan[Y_AXIS].Position;
        P2 = chan[Z_AXIS].Position;
        P3 = chan[A_AXIS].Position;
        P4 = chan[SPINDLE_AXIS].Position;
        printf("X = %f,  Y = %f,  Z = %f,  A = %f,  SP = %f\n", P0, P1, P2, P3, P4);

	//	P0 = chan[X_AXIS].Dest;
    //    P1 = chan[Y_AXIS].Dest;
    //    P2 = chan[Z_AXIS].Dest;
    //    P3 = chan[A_AXIS].Dest;
        P0 = chan[X_AXIS].Output;
        P1 = chan[Y_AXIS].Output;
        P2 = chan[Z_AXIS].Output;
        P3 = chan[A_AXIS].Output;
        P4 = chan[SPINDLE_AXIS].Output;
					
        printf("DAC Out: X = %f,  Y = %f,  Z = %f,  A = %f, SP = %f\n", P0, P1, P2, P3, P4);
        
        printf("Main Status: %4X, TLAUX Status: %4X, MPG Staatus:%4X\n", persist.UserData[P_STATUS], persist.UserData[P_TLAUX_STATUS], persist.UserData[P_MPG_STATUS]);
     
        return 1;          
    }
    return 0;
}

void ESTOP_Loop(void)
{
    // shut everything down? or at least disable the axis. 
    // If the program is here then something has triggered the ESTOP. On the BP308 this means that the relay has been engaged
    // and the Siemens Drive has been completely disabled. 
    // the only way to recover from this is probably to start over and re-home the machine. 
	printf("*** ESTOP! ***\n");
	// make sure that everything is stopped!
	// the only way out of this is to reset the ESTOP switch and re-run the Init program (RESET in MACH3)!
	if (ch0->Enable) DisableAxis(0);  // axis still enabled?  - Disable it
	if (ch1->Enable) DisableAxis(1);  // ditto
	if (ch2->Enable) DisableAxis(2);  
	if (ch3->Enable) DisableAxis(3);  
	if (ch4->Enable) DisableAxis(4);  
	if (ch5->Enable) DisableAxis(5); 
	if (ch6->Enable) DisableAxis(6);  
	if (ch7->Enable) DisableAxis(7);

    ClearBit(Z_BRAKE);  // re-enable the Z Brake

	// disable the spindle
	


    for(;;) // for now, just sit here forever.
    {
        WaitNextTimeSlice();
        if(ReadBit(ESTOP) == ESTOP_RUN)
        {
            // when we come back online after ESTOP then what?
        }
    }
    // but the thing to do here is probably to loop until ESTOP is cleared
    // then re-check the hardware, re-enable the axis and move back into normal operation.
}


// Periodic Processes
// this gets called every 5ms
void Periodic_Processes(void)
{
    static int ProcessCnt = 0;

//	printf("P_Process Cnt = %ld\n", ProcessCnt);
    // check for pending query responses
    // if it has been too long then flag an error
    // if a particular device has missed more than XX querys, then shut down the device - ie. don't query any more and flag it as disabled
    switch (ProcessCnt++)
    {
        case 0 :    // Remote Command Check - only checks every 30 ms - is this enough? or do I need to put it in the main loop?
                if(persist.UserData[P_REMOTE_CMD] != 0)
                {
                    RemoteCmd();
                }
                break;
        case 1 :  
                persist.UserData[P_SERIAL_PENDING] |= (SP_MPG_QUERY); 
    	        Send_Serial(MPG_StatusQuery);  
                break;
        case 2  : 
                persist.UserData[P_SERIAL_PENDING] |= (SP_TLAUX_QUERY);    // set the query pending bit
                Send_Serial(TLAUX_StatusQuery);
                break;
        case 3  : Warning_Check();  // check for things that have potential problems
                  Fault_Check();
                break;
        case 4  : ButtonCheck();
                break;
        case 5  : // check for unanswered queries
        default:
            ProcessCnt = 0;
            break;
    }

 /*   
    if(ProcessCnt++ == 1)
    {
        persist.UserData[P_SERIAL_PENDING] |= (_BV(SP_MPG_QUERY)); 
    	Send_Serial(MPG_StatusQuery);
    }
    else if(ProcessCnt++ == 2)
    {
        ProcessCnt = 0; // reset the counter 
        persist.UserData[P_SERIAL_PENDING] |= (_BV(SP_TLAUX_QUERY));    // set the query pending bit
        Send_Serial(TLAUX_StatusQuery);
        persist.UserData[P_SERIAL_PENDING] |= (1 << SP_TLAUX_QUERY);    // set the tlaux query sent bit. - this will be cleared when a status reply is received   
    }
    else if ()
    */
    //Send_Serial(StatusQuery);
    // stagger the querys so that they don't all happen at once.
    // query the MPG every 50ms for the current switch state, and state of its ESTOP button
    // query the TLAUX board every 50 ms to detemine it's state - 
}

void Init_Variables(void)
{
    // initialize all the variables so they start in a known state
    persist.UserData[P_STATUS] = 0;
    persist.UserData[P_TLAUX_STATUS] = 0;
    persist.UserData[P_MPG_STATUS] = 0;
    persist.UserData[P_REMOTE_CMD] = 0;
    persist.UserData[P_SERIAL_PENDING] = 0;
    persist.UserData[P_NOTIFY] = 0;

    Init_Buttons();

}

