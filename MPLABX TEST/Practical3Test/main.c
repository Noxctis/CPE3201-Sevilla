/**
 * @file main.c
 * @author cssevilla
 * @date 2026-03-09
 * @brief External interrupt driven counter with Timer0-based delay
 * 
 * This program increments a counter (0-9) each time an external interrupt 
 * occurs on RB0. The counter value is displayed on PORTC and automatically
 * resets after reaching 10. A 1-second delay is implemented using Timer0.
 */

#include <xc.h> // include file for the XC8 compiler

#define _XTAL_FREQ 4000000 // Define oscillator frequency for delay functions
#define COUNTER_MAX 10     // Maximum counter value before reset
#define DELAY_1SEC 122     // Timer0 overflows for ~1 second delay (prescaler 1:32)

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

/**
 * @brief Delay function based on Timer0 overflows
 * @param ms Number of Timer0 overflow cycles to wait
 * 
 * With a 4MHz oscillator, prescaler 1:32, each overflow takes ~8.192ms
 * For a 1-second delay, call delay(122)
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

/**
 * @brief Interrupt Service Routine
 * Handles external interrupt on RB0 and Timer0 overflow
 */
void __interrupt() ISR() {
    // Handle external interrupt (RB0/INT pin)
    GIE = 0; // Disable global interrupts to prevent nested interrupts
    if (INTF) {
        INTF = 0;       // Clear hardware interrupt flag
        myINTF = 1;     // Set software flag for main loop
    }
    
    // Handle Timer0 overflow
    if (TMR0IF) {
        TMR0IF = 0;     // Clear hardware Timer0 flag
        myTMR0IF = 1;   // Set software flag for delay function
    }
    GIE = 1; // Re-enable global interrupts
}
 
int main() {
    unsigned char counter = 0;
    
    // Configure I/O ports
    TRISB = 0xFF; // PORTB as input (RB0 for external interrupt)
    TRISC = 0x00; // PORTC as output (display counter value)
    
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
    TMR0IE = 1;   // Enable Timer0 overflow interrupt
    GIE = 1;      // Enable global interrupts
    
    // Initialize output
    PORTC = counter;
    
    while(1) {
        // Wait for external interrupt to occur
        if(myINTF) {
            myINTF = 0;  // Clear software flag
            
            // Increment counter
            counter++;
            
            // Reset counter if it reaches maximum
            if(counter >= COUNTER_MAX) {
                counter = 0;
            }
            
            // Delay for debouncing and visual feedback
            delay(DELAY_1SEC);
            
            // Update output display
            PORTC = counter;
        }
    }

    return 0;
}
