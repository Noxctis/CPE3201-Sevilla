/**
 * @file LE4-6.c
 * @author cssevilla
 * @date 2026-03-25
 * @brief Main function - Capture Module to 20x4 LCD (XC8 v1.33)
 */

#include <xc.h>
#include <stdio.h> // Required for sprintf in printNumber()

#define _XTAL_FREQ 4000000 // Oscillator frequency

#pragma config FOSC = XT
#pragma config WDTE = OFF
#pragma config PWRTE = ON
#pragma config BOREN = ON
#pragma config LVP = OFF
#pragma config CPD = OFF
#pragma config WRT = OFF
#pragma config CP = OFF

// Define LCD Control Pins
// Mapped to PORTC as per your previous update
#define RS RC5
#define EN RC6
#define RW RC7

// Global variable so main() can access the value calculated in the ISR
volatile unsigned int period = 0;

// Function Prototypes
void initLCD();
void instCtrl(unsigned char cmd);
void dataCtrl(unsigned char data);
void delay(unsigned int ms);
void printString(const char *str);
void printNumber(unsigned int num);

void instCtrl(unsigned char cmd){
    PORTB = cmd; 
    RS = 0;      
    RW = 0;      
    EN = 1;      
    delay(1);
    EN = 0;      
}

void initLCD(){
    delay(15);      
    instCtrl(0x38); // Function set: 8-bit, 2+ lines, 5x8 dots
    instCtrl(0x08); // Display off
    instCtrl(0x01); // Clear display
    delay(2);       // Clear needs extra time
    instCtrl(0x06); // Increment cursor
    instCtrl(0x0C); // Display on, cursor off
}

void dataCtrl(unsigned char data){
    PORTB = data; 
    RS = 1;       
    RW = 0;       
    EN = 1;       
    delay(1);
    EN = 0;       
}

void delay(unsigned int ms){
    unsigned int i, j;
    for(i = 0; i < ms; i++){
        for(j = 0; j < 1000; j++); 
    }
}

void printString(const char *str) {
    while(*str) {
        dataCtrl(*str++);
    }
}

void printNumber(unsigned int num) {
    char buffer[16]; 
    sprintf(buffer, "%u", num); 
    printString(buffer); 
}

// ISR with Unsigned Long Cast and Rounding Math Fix applied
void interrupt ISR(void) 
{ 
    GIE = 0; 
    if(CCP1IF==1) 
    {
        CCP1IF = 0; 
        TMR1 = 0; 
        RA0 = RA0^1;
        // Use unsigned long to prevent overflow at low frequencies,
        // and add + 500 to mathematically round up before truncation.
        period = CCPR1 * 8;
	period = CCPR1/1000;
    }      
    GIE = 1; 
}

void main(void)
{
    ADCON1 = 0x06;  
    TRISB = 0x00; // set PORTB as output for LCD data
    TRISA = 0x00; // set PORTD as output 
    TRISC = 0x04; // set RC2 to input (CCP1), RC5-RC7 as outputs for LCD 
    
    T1CON = 0x30;     // 1:8 prescaler, Timer1 off 
    CCP1CON = 0x05;   // capture mode: every rising edge 
    CCP1IE = 1;       // enable TMR1/CCP1 match interrupt (PIE1 reg) 
    CCP1IF = 0;       // reset interrupt flag (PIR1 reg) 
    PEIE = 1;         // enable all peripheral interrupt (INTCON reg) 
    GIE = 1;          // enable all unmasked interrupts (INTCON reg) 
    TMR1ON = 1;       // Turns on Timer1 (T1CON reg) 

    initLCD();
    
    instCtrl(0x80); // Row 1 (Top Line)
    printString("Period:");

    for(;;)  
    { 
        instCtrl(0xC0); // Row 2
        
        // Padded to 20 spaces to fully clear a 20x4 display line
        printString("                    "); 
        
        instCtrl(0xC0); // Reset to beginning of Row 2
        
        printNumber(period);
        printString(" ms");

        delay(20); 
    }
}