#include "KMotionDef.h"
#include "BP308_MPG.h"
#include "BP308_Hardware.h"
#include "BP308_IO.h"
#include "BP308_Persist.h"
#include "BP308_Axis_Init.h"

// functions to communicate with an MPG via the serial port and Quadrature Inputs

void Init_MPG(void)
{
    persist.UserData[P_MPG_RESYNC] = FALSE;

}

void ServiceMPG(void)
{
    int MPG_NewState = 0;
    int MPG_Step = 0;
    int Axis;
    int Rate;
    static int InMotion = FALSE;
    static double Target = 0;
    static double LastChangeTime = 0;
    static int MPG_LastState;
    static int Prev_Axis = 0;

if(persist.UserData[P_MPG_RESYNC] == TRUE)
{
    // make it look like the axis switch on the MPG is off by setting the bits in the P_MPG_STATUS to the off position
    // the next serial MPG query will reset it.
    persist.UserData[P_MPG_STATUS] &= ~(MPG_STATUS_AXIS_MASK);
    persist.UserData[P_MPG_RESYNC] = FALSE;
    // printf("MPG Resync!\n");
}

//SetBit(TP2);
    // if the HostStatus bit is active then don't do anything with the MPG
    if((HostStatus & HOST_JOB_ACTIVE_BIT) != 0)
    {
        // Host is active so don't do anything with the MPG
        // Set the MPG state to OFF so it has to respond to a status query to restart.
        SetPBit(P_MPG_STATUS, MPG_STATUS_OFF_POS); // persist.UserData[P_MPG_STATUS] |= _BV(MPG_STATUS_OFF_POS); // set the off bit 
    }
    else if((persist.UserData[P_MPG_STATUS] & _BV(MPG_STATUS_OFF_POS)) == 0)   // MPG Switch OFF flag is not set so not in off
    {
// SetBit(TP2);        
        // do the actual MPG reading and update the axis based on the MPG state that was read from the serial status request
        // from the old bridgeport code...
        // read the MPG Encoder
        int curr_MPG_A = ReadBit(MPG_A);
        MPG_NewState = (curr_MPG_A ^ ReadBit(MPG_B)) | (curr_MPG_A << 1);
        MPG_Step = (MPG_NewState - MPG_LastState) & 0x03;   
        if(MPG_Step == 3) MPG_Step = -1;
        MPG_LastState = MPG_NewState;

        // read the axis switch
        int MPG_Status = persist.UserData[P_MPG_STATUS]; 
        Axis = (MPG_Status & MPG_STATUS_AXIS_MASK);    // results in MPG_STATUS_AXIS_X etc 
        Rate = MPG_Status & MPG_STATUS_RATE_MASK;
        // check for an axis change
        if(Axis != Prev_Axis)
        {
            if(InMotion == TRUE)
            {
                Move(MPG2Axis(Prev_Axis), Target);    // Finish the move if still in motion - note: move axis is 0 indexed 
                InMotion = FALSE;
            }
            printf("Axis Change\nAxis = %d\n", Axis);
            
        }
        else if((InMotion == TRUE) && (Time_sec() > (LastChangeTime + FINAL_TIME)))
        {
            Move(MPG2Axis(Axis), Target);
            InMotion = FALSE;
        }
        else if (MPG_Step != 0) // the wheel has moved
        {
            // it would be nice here to make the wheel change resolution in inch vs metric mode.
            // just something to think about.
            // **************
            double Factor;
            // X and Y Axis the same, Z Axis has a different resolution
            if((Axis == MPG_STATUS_AXIS_X) || (Axis == MPG_STATUS_AXIS_Y))
            {
                if((persist.UserData[P_METRIC] & METRIC_MASK) == METRIC_MASK)
                {
                    Factor = X_FACTOR_X1M;  // use metric steps for the MPG
                    if(Rate == MPG_STATUS_RATE_X10) Factor = X_FACTOR_X10M;
                    if(Rate == MPG_STATUS_RATE_X100) Factor = X_FACTOR_X100M;
                }
                else 
                {
                    Factor = X_FACTOR_X1;
                    if(Rate == MPG_STATUS_RATE_X10) Factor = X_FACTOR_X10;
                    if(Rate == MPG_STATUS_RATE_X100) Factor = X_FACTOR_X100;
                }
            } else if(Axis == MPG_STATUS_AXIS_Z)
            {
                if((persist.UserData[P_METRIC] & METRIC_MASK) == METRIC_MASK)
                {
                    Factor = Z_FACTOR_X1M;  // use metric steps for the MPG
                    if(Rate == MPG_STATUS_RATE_X10) Factor = Z_FACTOR_X10M;
                    if(Rate == MPG_STATUS_RATE_X100) Factor = Z_FACTOR_X100M;
                }
                else 
                {
                    Factor = Z_FACTOR_X1;
                    if(Rate == MPG_STATUS_RATE_X10) Factor = Z_FACTOR_X10;
                    if(Rate == MPG_STATUS_RATE_X100) Factor = Z_FACTOR_X100;
                }
            }
            else if (Axis == MPG_STATUS_AXIS_A)
            {

            }
            if(InMotion == FALSE)
            {

                Target = chan[MPG2Axis(Axis)].Dest;   // get the inital axis position value
            }
            Target -=(MPG_Step * Factor);   // step times rate scale factor - minus sign due to the decoder phaseing
            MoveExp(MPG2Axis(Axis),Target,TAU);   // note: contains a WaitNextTimeSlice
            LastChangeTime = Time_sec();
            InMotion = TRUE;
            MPG_Step = 0;
        }
        Prev_Axis = Axis;
    }
    else if(InMotion == TRUE)   // axis switch is off but still trying to finish a MPG motion
    {
            Move(MPG2Axis(Prev_Axis), Target);
            InMotion = FALSE;   
    }


// ClearBit(TP2);
}

int MPG2Axis(int MAxis)
{
    int PhysicalAxis;
    switch (MAxis)
    {
        case MPG_STATUS_AXIS_X :
                                PhysicalAxis = X_AXIS; 
                                break;
        case MPG_STATUS_AXIS_Y : 
                                PhysicalAxis = Y_AXIS; 
                                break;
        case MPG_STATUS_AXIS_Z :
                                PhysicalAxis = Z_AXIS; 
                                break;
        case MPG_STATUS_AXIS_A : 
                                PhysicalAxis = A_AXIS; 
                                break;
        default :                   
                                PhysicalAxis = MAxis -1;    // this is probably going to get me in trouble here...
                                break;
    }
    return PhysicalAxis;
}
