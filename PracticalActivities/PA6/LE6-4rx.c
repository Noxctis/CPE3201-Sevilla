/**
 * @file LE6-3-RX.c
 * @brief MCU2: UART Receiver using 74LS48 BCD Decoder
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

void main(void) {
    // Configure PORTB for BCD Output to 74LS48
    TRISB = 0x00; 
    PORTB = 0x00; // Initialize display to blank

    // Configure EUSART I/O Pins
    TRISCbits.TRISC6 = 1; 
    TRISCbits.TRISC7 = 1; 

    // Configure Baud Rate (9600 @ 4MHz, Async High Speed)
    SPBRG = 0x19;
    
    // Configure USART Registers
    TXSTAbits.SYNC = 0; 
    TXSTAbits.BRGH = 1; 
    RCSTAbits.SPEN = 1; 
    RCSTAbits.RX9 = 0;  
    RCSTAbits.CREN = 1; // Enable continuous receive

    while(1) {
        // Wait until a character is completely received
        while(!PIR1bits.RCIF);
        
        char rx_char = RCREG; // Reading clears the RCIF flag

        // Determine BCD output based on received character
        if (rx_char >= '0' && rx_char <= '9') {
            // Subtracting '0' (ASCII 48) converts the character to a 0-9 integer.
            // Sending this 4-bit value to PORTB drives the 74LS48.
            PORTB = rx_char - '0';
        } 
        else if (rx_char == '*' || rx_char == '#') {
            // Sending 15 (0x0F) to a 74LS48 blanks the display
            PORTB = 0x0F; 
        }
    }
}