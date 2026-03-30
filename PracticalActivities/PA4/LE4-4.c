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

    ADCON1 = 0x06; 
    TRISA = 0x00; 
    // set all pins in PORTA as digital I/O 
    // sets all of PORTA to output 
    RA0 = 0;          // initialize RA0 to 0 
    T1CON = 0x20;     // 1:4 prescaler, Timer1 off 
    CCP1CON = 0x0A;    // compare mode: generate interrupt on match 
    CCP1IE = 1;       // enable TMR1/CCP1 match interrupt (PIE1 reg) 
    CCP1IF = 0;       // reset interrupt flag (PIR1 reg) 
    CCPR1 = 0x4E2;     // set the match value to TMR1 
    PEIE = 1;         // enable all peripheral interrupt (INTCON reg) 
    GIE = 1;          // enable all unmasked interrupts (INTCON reg) 
    TMR1ON = 1;       // Turns on Timer2 (T1CON reg) 
    for(;;)  
    { 
    }

}
