/**
 * @file main.c
 * @author cssevilla
 * @date 2026-03-01
 * @brief Main function
 */

#include<xc.h> // include file for the XC8 compiler 


#define _XTAL_FREQ 4000000 // Define oscillator frequency for delay functions
#define COUNTER_MAX 10     // Maximum counter value before reset
#define DELAY_08SEC 98     // Timer0 overflows for ~0.8 second delay (prescaler 1:32)
 
 #pragma config FOSC = XT // oscillator selection
 #pragma config WDTE = OFF // watchdog timer disabled
 #pragma config PWRTE = ON // power-up timer enabled
 #pragma config BOREN = ON // brown-out reset enabled
 #pragma config LVP = OFF // low-voltage programming disabled
 #pragma config CPD = OFF // data EEPROM code protection disabled
 #pragma config WRT = OFF // flash program memory write protection off
 #pragma config CP = OFF // code protection off

 volatile __bit myINTF = 0;    // Flag set when external interrupt occurs
 volatile __bit myTMR0IF = 0;  // Flag set when Timer0 overflows
volatile unsigned char counter = 0x00;  // Shared by ISR and main loop

void delay(unsigned int ms);
void interrupt ISR(void);

/**
 * @brief Delay function based on Timer0 overflows
 * @param ms Number of Timer0 overflow cycles to wait
 * 
 * With a 4MHz oscillator, prescaler 1:32, each overflow takes ~8.192ms
 * For a 0.8-second delay, call delay(98)
 */
void delay(unsigned int ms) {
    unsigned int of_counter = 0;
    while(of_counter < ms) {
        if(myTMR0IF) {
            myTMR0IF = 0;
            of_counter++;
        }
    }
}

void interrupt ISR(void){
    GIE = 0; // Disable global interrupts to prevent nested interrupts
    // Handle external interrupt (RB0/INT pin)
    if(INTF){
        INTF = 0;  // Clears interrupt flag
        myINTF = 1;

        // Check which key is pressed and update counter.
        switch (PORTD & 0x0F) {
            case 0x00: counter = 0x01; break;
            case 0x01: counter = 0x02; break;
            case 0x02: counter = 0x03; break;
            case 0x04: counter = 0x04; break;
            case 0x05: counter = 0x05; break;
            case 0x06: counter = 0x06; break;
            case 0x08: counter = 0x07; break;
            case 0x09: counter = 0x08; break;
            case 0x0A: counter = 0x09; break;
            case 0x0D: counter = 0x00; break;
            default: break;
        }

        PORTC = counter;

    } 
    
    // Handle Timer0 overflow
    if (TMR0IF) {
        TMR0IF = 0;     // Clear hardware Timer0 flag
        myTMR0IF = 1;   // Set software flag for delay function
    }
    GIE = 1; // Re-enable global interrupts
}

int main(){
    TRISA = 0X00;
    TRISB = 0xFF; // PORTB as input (RB0 for external interrupt)
    TRISC = 0x00; // PORTC as output (display counter value)
    TRISD = 0XFF; // PORTD as input (keypad)
    
    // Configure Timer0 and external interrupt
    // Bits: 1 1 0 0 0 1 0 0
    // Bit 7: RBPU = 1 (Pull-ups disabled)
    // Bit 6: INTEDG = 1 (Interrupt on rising edge)
    // Bit 5: T0CS = 0 (Timer0 source = internal clock)
    // Bit 4: T0SE = 0 (Increment on low-to-high transition)
    // Bit 3: PSA = 0 (Prescaler assigned to Timer0)
    // Bits 2-0: PS = 100 (Prescaler 1:32)
    OPTION_REG = 0xC4;   
    
    // Configure interrupts
    INTF = 0;     // Clear external interrupt flag
    INTE = 1;     // Enable external interrupt (RB0/INT)

    TMR0 = 0;     // Clear Timer0

    TMR0IF = 0;      // Timer0 flag bit
    TMR0IE = 1;      // Timer0 enable bit

    GIE = 1;         // Enable global interrupts after everything is set
    PORTC = 0X00;    // Initialize display

    while(1){
        if(counter == 0x09){
            counter = 0x00;
        }
        else{
            counter++;
        }
        delay(DELAY_08SEC); // Delay for ~0.8 second
        PORTC = counter;
    }
    return 0;
}