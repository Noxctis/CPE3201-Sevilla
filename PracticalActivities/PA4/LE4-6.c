/**
 * @file main.c
 * @author cssevilla
 * @date 2026-03-25
 * @brief Main function
 */
#include <xc.h>

 // In your header file (.h) or at the top of main.c
void initLCD();
void instCtrl(unsigned char cmd);
void delay(unsigned int ms);
void dataCtrl(unsigned char data);


void instCtrl(unsigned char cmd){
    PORTB = cmd; // Send command to PORTB
    RC0 = 0; // RS = 0 for command
    RC2 = 0; // RW = 0 for write
    RC1 = 1; // E = 1 to latch command
    delay(1);
    RC1 = 0; // E = 0 to complete command
}

void initLCD(){
    // Initialize LCD in 4-bit mode
    delay(1);
    instCtrl(0x38); // Function set: 8-bit, 2 lines, 5x8 dots
    instCtrl(0x08); // Display off, cursor off
    instCtrl(0x01); // Clear display
    instCtrl(0x06); // Entry mode set: increment cursor, no shift
    instCtrl(0x0F); // Display on, cursor on, blinking on
}

void dataCtrl(unsigned char data){
    PORTB = data; // Send data to PORTB
    RC0 = 1; // RS = 1 for data
    RC2 = 0; // RW = 0 for write
    RC1 = 1; // E = 1 to latch data
    delay(1);
    RC1 = 0; // E = 0 to complete data write
}

void delay(unsigned int ms){
    // Simple delay function (not accurate)
    unsigned int i, j;
    for(i = 0; i < ms; i++){
        for(j = 0; j < 1000; j++);
    }
}

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

    TRISB = 0x00; // set PORTB as output for LCD data
    TRISD = 0x00; // set PORTD as output for LCD control signals

    TRISC = 0x04; // set RC2 to input 
    T1CON = 0x30;     // 1:8 prescaler, Timer1 off 
    CCP1CON = 0x05;    // capture mode: every rising edge 
    CCP1IE = 1;       // enable TMR1/CCP1 match interrupt (PIE1 reg) 
    CCP1IF = 0;       // reset interrupt flag (PIR1 reg) 
    PEIE = 1;         // enable all peripheral interrupt (INTCON reg) 
    GIE = 1;          // enable all unmasked interrupts (INTCON reg) 
    TMR1ON = 1;       // Turns on Timer1 (T1CON reg) 

    initLCD();


    for(;;)  
    { 

        
    }

}
