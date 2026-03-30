/**
 * @file main.c
 * @author cssevilla
 * @date 2026-03-25
 * @brief Main function
 */
#include <xc.h>

void interrupt ISR(void) 
{ 
           
   GIE = 0; // disable all interrupts (INTCON reg)
   if(CCP1IF==1) // check if CCP1 caused the interrupt (PIR1 reg)
   {
    CCP1IF = 0; // reset interrupt flag (PIR1 reg) 
    RA0 = RA0^1; // toggle RA0 (LED on/off)
   }      
    GIE = 1; // enable all unmasked interrupts (INTCON reg)
}

void main(void)
{

    PR2 = 0x7C;         // set value for PR2 
    CCPR1L = 0x57;     // set the match value to TMR2 (87) at 70% duty cycle (8MSBs)
    CCP1CON = 0x2C;    // compare mode: generate PWM, P1A(P2) active high
    TRISC = 0x00;      // set all pins in PORTC to output   
    RC2 = 0;        // initialize RC2 to 0 (LED off)           
    T2CON = 0x06;   // 1:16 prescaler, Timer2 on
    for(;;)  
    { 
    }

}
