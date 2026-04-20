/**
 * @file LE6-3-RX_modular.c
 * @brief MCU2: UART Receiver using 74LS48 - Modularized
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

// --- Function Prototypes ---
void UART_Init(void);
char UART_Receive_Char(void);
void Display_Init(void);
void Display_Update(char rx_char);

// --- Main Program ---
void main(void) {
    // 1. Initialize Hardware
    Display_Init();
    UART_Init();

    // 2. Main Loop
    while(1) {
        // Wait for and receive a character
        char incoming_char = UART_Receive_Char();
        
        // Update the 74LS48 display logic
        Display_Update(incoming_char);
    }
}

// --- Function Definitions ---

void UART_Init(void) {
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
}

char UART_Receive_Char(void) {
    // Check and clear Overrun Error
    if (RCSTAbits.OERR) {
        RCSTAbits.CREN = 0; // Disable continuous receive to clear error
        RCSTAbits.CREN = 1; // Re-enable continuous receive
    }

    // Wait until a character is completely received
    while(!PIR1bits.RCIF);
    
    // Reading RCREG automatically clears the RCIF flag
    return RCREG; 
}

void Display_Init(void) {
    // Configure PORTB for BCD Output to 74LS48
    TRISB = 0x00; 
    PORTB = 0x00; // 0x0F blanks the 74LS48 (0x00 displays a '0')
}

void Display_Update(char rx_char) {
    // Determine BCD output based on received character
    if (rx_char >= '0' && rx_char <= '9') {
        PORTB = rx_char - '0';
    } 
    else if (rx_char == '*' || rx_char == '#') {
        PORTB = 0x0F; // Blank display
    }
}