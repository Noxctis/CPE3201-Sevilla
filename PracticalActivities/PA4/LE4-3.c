/**
 * @file main.c
 * @author cssevilla
 * @date 2026-03-25
 * @brief Main function
 */
#include <xc.h>

void interrupt ISR(void) 
{ 
   int period = 0;           
   GIE = 0; // disable all interrupts (INTCON reg)
   if(CCP1IF==1) // check if CCP1 caused the interrupt (PIR1 reg)
   {
    CCP1IF = 0; // reset interrupt flag (PIR1 reg) 
    TMR1 = 0; // reset Timer1 count (TMR1 reg)
    period = CCPR1/1000; // calculate period in ms (CCPR1 reg)
    period = period*8; // adjust for 1:8 prescaler (T1CON reg)
   }      
    GIE = 1; // enable all unmasked interrupts (INTCON reg)
}

void main(void)
{

    TRISC = 0x04; // set RC2 to input 
    T1CON = 0x30;     // 1:8 prescaler, Timer1 off 
    CCP1CON = 0x05;    // capture mode: every rising edge 
    CCP1IE = 1;       // enable TMR1/CCP1 match interrupt (PIE1 reg) 
    CCP1IF = 0;       // reset interrupt flag (PIR1 reg) 
    PEIE = 1;         // enable all peripheral interrupt (INTCON reg) 
    GIE = 1;          // enable all unmasked interrupts (INTCON reg) 
    TMR1ON = 1;       // Turns on Timer1 (T1CON reg) 
    for(;;)  
    { 
    }

}
