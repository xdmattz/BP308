/*******************************************************************************
* File Name: Pin_V_Mon2.h  
* Version 2.20
*
* Description:
*  This file contains Pin function prototypes and register defines
*
* Note:
*
********************************************************************************
* Copyright 2008-2015, Cypress Semiconductor Corporation.  All rights reserved.
* You may use this file only in accordance with the license, terms, conditions, 
* disclaimers, and limitations in the end user license agreement accompanying 
* the software package with which this file was provided.
*******************************************************************************/

#if !defined(CY_PINS_Pin_V_Mon2_H) /* Pins Pin_V_Mon2_H */
#define CY_PINS_Pin_V_Mon2_H

#include "cytypes.h"
#include "cyfitter.h"
#include "cypins.h"
#include "Pin_V_Mon2_aliases.h"

/* APIs are not generated for P15[7:6] */
#if !(CY_PSOC5A &&\
	 Pin_V_Mon2__PORT == 15 && ((Pin_V_Mon2__MASK & 0xC0) != 0))


/***************************************
*        Function Prototypes             
***************************************/    

/**
* \addtogroup group_general
* @{
*/
void    Pin_V_Mon2_Write(uint8 value);
void    Pin_V_Mon2_SetDriveMode(uint8 mode);
uint8   Pin_V_Mon2_ReadDataReg(void);
uint8   Pin_V_Mon2_Read(void);
void    Pin_V_Mon2_SetInterruptMode(uint16 position, uint16 mode);
uint8   Pin_V_Mon2_ClearInterrupt(void);
/** @} general */

/***************************************
*           API Constants        
***************************************/
/**
* \addtogroup group_constants
* @{
*/
    /** \addtogroup driveMode Drive mode constants
     * \brief Constants to be passed as "mode" parameter in the Pin_V_Mon2_SetDriveMode() function.
     *  @{
     */
        #define Pin_V_Mon2_DM_ALG_HIZ         PIN_DM_ALG_HIZ
        #define Pin_V_Mon2_DM_DIG_HIZ         PIN_DM_DIG_HIZ
        #define Pin_V_Mon2_DM_RES_UP          PIN_DM_RES_UP
        #define Pin_V_Mon2_DM_RES_DWN         PIN_DM_RES_DWN
        #define Pin_V_Mon2_DM_OD_LO           PIN_DM_OD_LO
        #define Pin_V_Mon2_DM_OD_HI           PIN_DM_OD_HI
        #define Pin_V_Mon2_DM_STRONG          PIN_DM_STRONG
        #define Pin_V_Mon2_DM_RES_UPDWN       PIN_DM_RES_UPDWN
    /** @} driveMode */
/** @} group_constants */
    
/* Digital Port Constants */
#define Pin_V_Mon2_MASK               Pin_V_Mon2__MASK
#define Pin_V_Mon2_SHIFT              Pin_V_Mon2__SHIFT
#define Pin_V_Mon2_WIDTH              1u

/* Interrupt constants */
#if defined(Pin_V_Mon2__INTSTAT)
/**
* \addtogroup group_constants
* @{
*/
    /** \addtogroup intrMode Interrupt constants
     * \brief Constants to be passed as "mode" parameter in Pin_V_Mon2_SetInterruptMode() function.
     *  @{
     */
        #define Pin_V_Mon2_INTR_NONE      (uint16)(0x0000u)
        #define Pin_V_Mon2_INTR_RISING    (uint16)(0x0001u)
        #define Pin_V_Mon2_INTR_FALLING   (uint16)(0x0002u)
        #define Pin_V_Mon2_INTR_BOTH      (uint16)(0x0003u) 
    /** @} intrMode */
/** @} group_constants */

    #define Pin_V_Mon2_INTR_MASK      (0x01u) 
#endif /* (Pin_V_Mon2__INTSTAT) */


/***************************************
*             Registers        
***************************************/

/* Main Port Registers */
/* Pin State */
#define Pin_V_Mon2_PS                     (* (reg8 *) Pin_V_Mon2__PS)
/* Data Register */
#define Pin_V_Mon2_DR                     (* (reg8 *) Pin_V_Mon2__DR)
/* Port Number */
#define Pin_V_Mon2_PRT_NUM                (* (reg8 *) Pin_V_Mon2__PRT) 
/* Connect to Analog Globals */                                                  
#define Pin_V_Mon2_AG                     (* (reg8 *) Pin_V_Mon2__AG)                       
/* Analog MUX bux enable */
#define Pin_V_Mon2_AMUX                   (* (reg8 *) Pin_V_Mon2__AMUX) 
/* Bidirectional Enable */                                                        
#define Pin_V_Mon2_BIE                    (* (reg8 *) Pin_V_Mon2__BIE)
/* Bit-mask for Aliased Register Access */
#define Pin_V_Mon2_BIT_MASK               (* (reg8 *) Pin_V_Mon2__BIT_MASK)
/* Bypass Enable */
#define Pin_V_Mon2_BYP                    (* (reg8 *) Pin_V_Mon2__BYP)
/* Port wide control signals */                                                   
#define Pin_V_Mon2_CTL                    (* (reg8 *) Pin_V_Mon2__CTL)
/* Drive Modes */
#define Pin_V_Mon2_DM0                    (* (reg8 *) Pin_V_Mon2__DM0) 
#define Pin_V_Mon2_DM1                    (* (reg8 *) Pin_V_Mon2__DM1)
#define Pin_V_Mon2_DM2                    (* (reg8 *) Pin_V_Mon2__DM2) 
/* Input Buffer Disable Override */
#define Pin_V_Mon2_INP_DIS                (* (reg8 *) Pin_V_Mon2__INP_DIS)
/* LCD Common or Segment Drive */
#define Pin_V_Mon2_LCD_COM_SEG            (* (reg8 *) Pin_V_Mon2__LCD_COM_SEG)
/* Enable Segment LCD */
#define Pin_V_Mon2_LCD_EN                 (* (reg8 *) Pin_V_Mon2__LCD_EN)
/* Slew Rate Control */
#define Pin_V_Mon2_SLW                    (* (reg8 *) Pin_V_Mon2__SLW)

/* DSI Port Registers */
/* Global DSI Select Register */
#define Pin_V_Mon2_PRTDSI__CAPS_SEL       (* (reg8 *) Pin_V_Mon2__PRTDSI__CAPS_SEL) 
/* Double Sync Enable */
#define Pin_V_Mon2_PRTDSI__DBL_SYNC_IN    (* (reg8 *) Pin_V_Mon2__PRTDSI__DBL_SYNC_IN) 
/* Output Enable Select Drive Strength */
#define Pin_V_Mon2_PRTDSI__OE_SEL0        (* (reg8 *) Pin_V_Mon2__PRTDSI__OE_SEL0) 
#define Pin_V_Mon2_PRTDSI__OE_SEL1        (* (reg8 *) Pin_V_Mon2__PRTDSI__OE_SEL1) 
/* Port Pin Output Select Registers */
#define Pin_V_Mon2_PRTDSI__OUT_SEL0       (* (reg8 *) Pin_V_Mon2__PRTDSI__OUT_SEL0) 
#define Pin_V_Mon2_PRTDSI__OUT_SEL1       (* (reg8 *) Pin_V_Mon2__PRTDSI__OUT_SEL1) 
/* Sync Output Enable Registers */
#define Pin_V_Mon2_PRTDSI__SYNC_OUT       (* (reg8 *) Pin_V_Mon2__PRTDSI__SYNC_OUT) 

/* SIO registers */
#if defined(Pin_V_Mon2__SIO_CFG)
    #define Pin_V_Mon2_SIO_HYST_EN        (* (reg8 *) Pin_V_Mon2__SIO_HYST_EN)
    #define Pin_V_Mon2_SIO_REG_HIFREQ     (* (reg8 *) Pin_V_Mon2__SIO_REG_HIFREQ)
    #define Pin_V_Mon2_SIO_CFG            (* (reg8 *) Pin_V_Mon2__SIO_CFG)
    #define Pin_V_Mon2_SIO_DIFF           (* (reg8 *) Pin_V_Mon2__SIO_DIFF)
#endif /* (Pin_V_Mon2__SIO_CFG) */

/* Interrupt Registers */
#if defined(Pin_V_Mon2__INTSTAT)
    #define Pin_V_Mon2_INTSTAT            (* (reg8 *) Pin_V_Mon2__INTSTAT)
    #define Pin_V_Mon2_SNAP               (* (reg8 *) Pin_V_Mon2__SNAP)
    
	#define Pin_V_Mon2_0_INTTYPE_REG 		(* (reg8 *) Pin_V_Mon2__0__INTTYPE)
#endif /* (Pin_V_Mon2__INTSTAT) */

#endif /* CY_PSOC5A... */

#endif /*  CY_PINS_Pin_V_Mon2_H */


/* [] END OF FILE */
