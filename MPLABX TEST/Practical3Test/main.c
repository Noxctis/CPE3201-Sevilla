/**
 * @file main.c
 * @author cssevilla
 * @date 2026-03-09
 * @brief Main function
 */

 #include <builtins.h>
#include <pic16f877a.h>
#include <xc.h> // include file for the XC8 compiler

#define _XTAL_FREQ 4000000 // Define oscillator frequency for delay functions

 #pragma config FOSC = XT // oscillator selection
 #pragma config WDTE = OFF // watchdog timer disabled
 #pragma config PWRTE = ON // power-up timer enabled
 #pragma config BOREN = ON // brown-out reset enabled
 #pragma config LVP = OFF // low-voltage programming disabled
 #pragma config CPD = OFF // data EEPROM code protection disabled
 #pragma config WRT = OFF // flash program memory write protection off
 #pragma config CP = OFF // code protection off

 __bit myINTF = 0; // Custom flag for external interrupt

 void __interrupt() ISR() {
    GIE=0; // Disable global interrupts
    if (INTF) { // Check if external interrupt occurred
        INTF = 0; // Clear external interrupt flag
        // Handle external interrupt (e.g., toggle an LED)
        myINTF = 1; // Set custom flag to indicate interrupt occurred
    }
    if (TMR0IF) { // Check if Timer0 overflow occurred
        TMR0IF = 0; // Clear Timer0 interrupt flag
        // Handle Timer0 interrupt (e.g., toggle an LED)
    }
    GIE=1; // Re-enable global interrupts
}
 
int main(){

    // Add your code here and press Ctrl + Shift + B to build
unsigned char counter = 0; // Counter variable for Timer0
TRISB = 0xFF; // Set PORTB as input
TRISC = 0x00; // Set PORTC as output

//Both RB0 and TIMER0
OPTION_REG = 0xC4; // Prescale 1:32, Timer0 source is internal instruction cycle clock

INTF= 0; // Clear interrupt flag
INTE = 1; // Enable external interrupt

TMR0 = 0; // Clear Timer0
TMR0IE = 1; // Enable Timer0 interrupt

GIE = 1; // Enable global interrupts

while(1){
        if(!myINTF) {
            while(!myINTF){
                // Wait for external interrupt to occur
            }
        }
        else if(counter == 0x0A) { // Check if counter has reached 10
            counter = 0x00; // Reset counter
            // Handle Timer0 overflow (e.g., toggle an LED)
        }
        else {
            counter++; // Increment counter
        }

        _delay(122); // Delay for approximately 1 second (assuming 4MHz clock)
        PORTC = counter; // Output counter value to PORTC (for debugging)
}

    return 0;
}
