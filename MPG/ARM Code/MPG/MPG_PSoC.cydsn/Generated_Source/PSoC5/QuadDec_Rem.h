/*******************************************************************************
* File Name: QuadDec_Rem.h  
* Version 3.0
*
* Description:
*  This file provides constants and parameter values for the Quadrature
*  Decoder component.
*
* Note:
*  None.
*
********************************************************************************
* Copyright 2008-2014, Cypress Semiconductor Corporation.  All rights reserved.
* You may use this file only in accordance with the license, terms, conditions, 
* disclaimers, and limitations in the end user license agreement accompanying 
* the software package with which this file was provided.
*******************************************************************************/

#if !defined(CY_QUADRATURE_DECODER_QuadDec_Rem_H)
#define CY_QUADRATURE_DECODER_QuadDec_Rem_H

#include "cyfitter.h"
#include "CyLib.h"
#include "cytypes.h"

/* Check to see if required defines such as CY_PSOC5LP are available */
/* They are defined starting with cy_boot v3.0 */
#if !defined (CY_PSOC5LP)
    #error Component QuadDec_v3_0 requires cy_boot v3.0 or later
#endif /* (CY_PSOC5LP) */

#define QuadDec_Rem_COUNTER_SIZE               (8u)
#define QuadDec_Rem_COUNTER_SIZE_8_BIT         (8u)
#define QuadDec_Rem_COUNTER_SIZE_16_BIT        (16u)
#define QuadDec_Rem_COUNTER_SIZE_32_BIT        (32u)

#if (QuadDec_Rem_COUNTER_SIZE == QuadDec_Rem_COUNTER_SIZE_8_BIT)
    #include "QuadDec_Rem_Cnt8.h"
#else 
    /* (QuadDec_Rem_COUNTER_SIZE == QuadDec_Rem_COUNTER_SIZE_16_BIT) || 
    *  (QuadDec_Rem_COUNTER_SIZE == QuadDec_Rem_COUNTER_SIZE_32_BIT) 
    */
    #include "QuadDec_Rem_Cnt16.h"
#endif /* QuadDec_Rem_COUNTER_SIZE == QuadDec_Rem_COUNTER_SIZE_8_BIT */

extern uint8 QuadDec_Rem_initVar;


/***************************************
*   Conditional Compilation Parameters
***************************************/

#define QuadDec_Rem_COUNTER_RESOLUTION         (4u)


/***************************************
*       Data Struct Definition
***************************************/

/* Sleep Mode API Support */
typedef struct
{
    uint8 enableState;
} QuadDec_Rem_BACKUP_STRUCT;


/***************************************
*        Function Prototypes
***************************************/

void  QuadDec_Rem_Init(void) ;
void  QuadDec_Rem_Start(void) ;
void  QuadDec_Rem_Stop(void) ;
void  QuadDec_Rem_Enable(void) ;
uint8 QuadDec_Rem_GetEvents(void) ;
void  QuadDec_Rem_SetInterruptMask(uint8 mask) ;
uint8 QuadDec_Rem_GetInterruptMask(void) ;
int8 QuadDec_Rem_GetCounter(void) ;
void  QuadDec_Rem_SetCounter(int8 value)
;
void  QuadDec_Rem_Sleep(void) ;
void  QuadDec_Rem_Wakeup(void) ;
void  QuadDec_Rem_SaveConfig(void) ;
void  QuadDec_Rem_RestoreConfig(void) ;

#if (QuadDec_Rem_COUNTER_SIZE == QuadDec_Rem_COUNTER_SIZE_32_BIT)
    CY_ISR_PROTO(QuadDec_Rem_ISR);
#endif /* QuadDec_Rem_COUNTER_SIZE == QuadDec_Rem_COUNTER_SIZE_32_BIT */


/***************************************
*           API Constants
***************************************/

#if (QuadDec_Rem_COUNTER_SIZE == QuadDec_Rem_COUNTER_SIZE_32_BIT)
    #define QuadDec_Rem_ISR_NUMBER             ((uint8) QuadDec_Rem_isr__INTC_NUMBER)
    #define QuadDec_Rem_ISR_PRIORITY           ((uint8) QuadDec_Rem_isr__INTC_PRIOR_NUM)
#endif /* QuadDec_Rem_COUNTER_SIZE == QuadDec_Rem_COUNTER_SIZE_32_BIT */


/***************************************
*    Enumerated Types and Parameters
***************************************/

#define QuadDec_Rem_GLITCH_FILTERING           (1u)
#define QuadDec_Rem_INDEX_INPUT                (0u)


/***************************************
*    Initial Parameter Constants
***************************************/

#if (QuadDec_Rem_COUNTER_SIZE == QuadDec_Rem_COUNTER_SIZE_8_BIT)
    #define QuadDec_Rem_COUNTER_INIT_VALUE    (0x80u)
#else 
    /* (QuadDec_Rem_COUNTER_SIZE == QuadDec_Rem_COUNTER_SIZE_16_BIT) ||
    *  (QuadDec_Rem_COUNTER_SIZE == QuadDec_Rem_COUNTER_SIZE_32_BIT)
    */
    #define QuadDec_Rem_COUNTER_INIT_VALUE    (0x8000u)
    #define QuadDec_Rem_COUNTER_MAX_VALUE     (0x7FFFu)
#endif /* QuadDec_Rem_COUNTER_SIZE == QuadDec_Rem_COUNTER_SIZE_8_BIT */


/***************************************
*             Registers
***************************************/

#define QuadDec_Rem_STATUS_REG                 (* (reg8 *) QuadDec_Rem_bQuadDec_Stsreg__STATUS_REG)
#define QuadDec_Rem_STATUS_PTR                 (  (reg8 *) QuadDec_Rem_bQuadDec_Stsreg__STATUS_REG)
#define QuadDec_Rem_STATUS_MASK                (* (reg8 *) QuadDec_Rem_bQuadDec_Stsreg__MASK_REG)
#define QuadDec_Rem_STATUS_MASK_PTR            (  (reg8 *) QuadDec_Rem_bQuadDec_Stsreg__MASK_REG)
#define QuadDec_Rem_SR_AUX_CONTROL             (* (reg8 *) QuadDec_Rem_bQuadDec_Stsreg__STATUS_AUX_CTL_REG)
#define QuadDec_Rem_SR_AUX_CONTROL_PTR         (  (reg8 *) QuadDec_Rem_bQuadDec_Stsreg__STATUS_AUX_CTL_REG)


/***************************************
*        Register Constants
***************************************/

#define QuadDec_Rem_COUNTER_OVERFLOW_SHIFT     (0x00u)
#define QuadDec_Rem_COUNTER_UNDERFLOW_SHIFT    (0x01u)
#define QuadDec_Rem_COUNTER_RESET_SHIFT        (0x02u)
#define QuadDec_Rem_INVALID_IN_SHIFT           (0x03u)
#define QuadDec_Rem_COUNTER_OVERFLOW           ((uint8) (0x01u << QuadDec_Rem_COUNTER_OVERFLOW_SHIFT))
#define QuadDec_Rem_COUNTER_UNDERFLOW          ((uint8) (0x01u << QuadDec_Rem_COUNTER_UNDERFLOW_SHIFT))
#define QuadDec_Rem_COUNTER_RESET              ((uint8) (0x01u << QuadDec_Rem_COUNTER_RESET_SHIFT))
#define QuadDec_Rem_INVALID_IN                 ((uint8) (0x01u << QuadDec_Rem_INVALID_IN_SHIFT))

#define QuadDec_Rem_INTERRUPTS_ENABLE_SHIFT    (0x04u)
#define QuadDec_Rem_INTERRUPTS_ENABLE          ((uint8)(0x01u << QuadDec_Rem_INTERRUPTS_ENABLE_SHIFT))
#define QuadDec_Rem_INIT_INT_MASK              (0x0Fu)


/******************************************************************************************
* Following code are OBSOLETE and must not be used starting from Quadrature Decoder 2.20
******************************************************************************************/
#define QuadDec_Rem_DISABLE                    (0x00u)


#endif /* CY_QUADRATURE_DECODER_QuadDec_Rem_H */


/* [] END OF FILE */
