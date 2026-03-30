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
   if(TMR2IF==1)     
   { 
   TMR2IF = 0;      
   RA0 = RA0^1; 
   } 
   GIE = 1;          
}

void main(void)
{

    ADCON1 = 0x06;   // set all pins in PORTA as digital I/O 
    TRISA = 0x00; 
    // sets all of PORTA to output 
    RA0 = 0;         // initialize RA0 to 0 
    T2CON = 0x01;    // 1:4 prescaler, Timer2 off 
    TMR2IE = 1;      // enable Timer2/PR2 match interrupt (PIE1 reg) 
    TMR2IF = 0;      // reset interrupt flag (PIR1 reg) 
    PEIE = 1;        // enable all peripheral interrupt (INTCON reg) 
    GIE = 1;         // enable all unmasked interrupts (INTCON reg) 
    PR2 = 0x7D;      // match value for TMR2(125)at half cycle 
    TMR2ON = 1;      // Turns on Timer2 (T2CON reg) 
    for(;;)  
    { 
    }

}
