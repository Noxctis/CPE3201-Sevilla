/**
 * @file LE6-2.c
 * @brief USART Asynchronous Transmit with Keypad Input
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

void UART_Write(char data) {
    while(!TXSTAbits.TRMT); // Wait until transmit shift register is empty
    TXREG = data;           // Write data to be sent
}

void UART_Write_String(const char *text) {
    for(int i = 0; text[i] != '\0'; i++) {
        UART_Write(text[i]);
    }
}

void main(void) {
    // Configure PORTD for 74C922 Keypad (Overrides manual's PORTB instruction based on user pinout)
    TRISD = 0xFF; // RD3:RD0 = keypad data, RD4 = DAVBL

    // Configure EUSART I/O Pins
    TRISCbits.TRISC6 = 1; // TX pin
    TRISCbits.TRISC7 = 1; // RX pin

    // Configure Baud Rate (9600 @ 4MHz, Async High Speed)
    SPBRG = 0x19;
    
    // Configure USART Registers
    TXSTAbits.SYNC = 0; // Asynchronous mode
    TXSTAbits.BRGH = 1; // High-speed baud rate
    RCSTAbits.SPEN = 1; // Enable serial port
    TXSTAbits.TXEN = 1; // Transmit enable

    while(1) {
        // Check if DAVBL (Data Available) is HIGH
        if(PORTDbits.RD4 == 1) {
            // Read the lower 4 bits for keypad data mapping
            unsigned char key_val = PORTD & 0x0F;
            
            // Transmit the required string format
            UART_Write_String("You pressed ");
            UART_Write(keypad[key_val]);
            
            // \r = Carriage Return (move to start of line), \n = Line Feed (move down one line)
            UART_Write_String(".\r\n"); 
            
            // Wait for key release to prevent continuous transmission loop
            while(PORTDbits.RD4 == 1);
            
            // Small software delay for hardware debouncing
            __delay_ms(20);
        }
    }
}