#ifndef BP308_MPG_H
#define BP308_MPG_H

#include "KMotionDef.h"

// functions to communicate with an MPG via the serial port and Quadrature Inputs

void Init_MPG(void)
{

}
void ServiceMPG(void)
{
    // if the HostStatus bit is active then don't do anything with the MPG
    if((HostStatus & HOST_JOB_ACTIVE_BIT) == 0)
    {
        // Host is active so don't do anything with the MPG
        // Set the MPG state to OFF so it has to respond to a status request to restart.
    }
    else if(TRUE)   // MPG Switch is set to OFF then don't do anything either
    {

    }
    else
    {
        // do the actual MPG reading and update the axis based on the MPG state that was read from the serial status request
    }
}

#endif