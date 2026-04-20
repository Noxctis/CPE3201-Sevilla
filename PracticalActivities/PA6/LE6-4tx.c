/**
 * @file LE6-3-TX.c
 * @brief MCU1: UART Transmitter (Reads Keypad, Sends Character)
 */

#include <xc.h>

#pragma config FOSC = XT   
#pragma config WDTE = OFF  
#pragma config PWRTE = ON  
#pragma config BOREN = ON  
#pragma config LVP = OFF   
#pragma config CPD = OFF   
#pragma config WRT = OFF   
#pragma config CP = OFF    

#define _XTAL_FREQ 4000000 

// 3x4 keypad mapping table (MM74C922 outputs 0-15 linearly)
const char keypad[] = "123 456 789 *0# ";

void main(void) {
    // Configure PORTD for Keypad (RD3:RD0 = data, RD4 = DAVBL)
    TRISD = 0xFF; 

    // Configure EUSART I/O Pins
    TRISCbits.TRISC6 = 1; 
    TRISCbits.TRISC7 = 1; 

    // Configure Baud Rate (9600 @ 4MHz, Async High Speed)
    SPBRG = 0x19;
    
    // Configure USART Registers
    TXSTAbits.SYNC = 0; 
    TXSTAbits.BRGH = 1; 
    RCSTAbits.SPEN = 1; 
    TXSTAbits.TXEN = 1; 

    while(1) {
        // Wait for key press (DAVBL goes HIGH)
        if(PORTDbits.RD4 == 1) {
            
            unsigned char key_val = PORTD & 0x0F;
            char send_char = keypad[key_val];
            
            // Wait until transmit buffer is empty, then send
            while(!TXSTAbits.TRMT);
            TXREG = send_char;
            
            // Wait for key release to prevent multi-triggering
            while(PORTDbits.RD4 == 1);
            __delay_ms(20); // Debounce
        }
    }
}