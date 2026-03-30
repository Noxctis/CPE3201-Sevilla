/**
 * @file main.c
 * @author cssevilla
 * @date 2026-03-25
 * @brief Main function
 */
#include <xc.h>

void interrupt ISR(void) 
{ 
   GIE = 0;          
   if(TMR1IF==1)     
   { 
   TMR1IF = 0;     
   TMR1 = 0x0BDC;  
   RA0 = RA0^1; 
   } 
   GIE = 1;          
}

void main(void)
{

    ADCON1 = 0x6; // set all pins in PORTA as digital I/O
    TRISA = 0x00; // sets all of PORTA to output
    RA0 = 0; // initialize RA0 to 0 (LED off)
    T1CON = 0x30; // 1:8 prescaler, internal clock, Timer1 off
    TMR1IE = 1; // enable Timer1 overflow interrupt (PIE1 reg)
    TMR1IF = 0; // reset interrupt flag (PIR1 reg)
    PEIE = 1; // enable all peripheral interrupt (INTCON reg)
    GIE = 1; // enable all unmasked interrupts (INTCON reg)
    TMR1 = 0x0BDC; // counter starts counting at 0x0BDC (3036)
    TMR1ON = 1; // Turns on Timer1 (T1CON reg)
    
    for(;;) // foreground routine
    {

    }

}
