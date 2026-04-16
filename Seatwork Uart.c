#include <xc.h>

#define _XTAL_FREQ 4000000

volatile unsigned char rx_data;
volatile unsigned char tx_data = 0x55;
volatile unsigned char tx_complete = 0;
volatile unsigned char rx_complete = 0;

// XC8 v1.3 uses the 'interrupt' keyword for ISRs
void interrupt ISR(void) {
    if (PIE1bits.TXIE && PIR1bits.TXIF) {
        TXREG = tx_data;     
        PIE1bits.TXIE = 0;   // Disable transmit interrupt for single byte transmission
        tx_complete = 1;
    }

    if (PIE1bits.RCIE && PIR1bits.RCIF) {
        rx_data = RCREG;     
        PIE1bits.RCIE = 0;   // Disable receive interrupt for single byte reception
        rx_complete = 1;
    }
}

void main(void) {
    // Baud rate calculation for Synchronous Mode
    // Formula: (Synchronous) Baud Rate = Fosc/(4 (X + 1))
    // Assuming target baud rate of 9600 bps with Fosc = 4MHz:
    // X = (4000000 / (4 * 9600)) - 1 = 103 (decimal)
    SPBRG = 103;

    // Configure TXSTA Register
    TXSTAbits.SYNC = 1; // 1 = Synchronous mode
    TXSTAbits.CSRC = 1; // 1 = Master mode (clock generated internally from BRG)
    TXSTAbits.TX9 = 0;  // 0 = Selects 8-bit transmission
    TXSTAbits.TXEN = 1; // 1 = Transmit enabled

    // Configure RCSTA Register
    RCSTAbits.SPEN = 1; // 1 = Serial port enabled (configures RC7/RX/DT and RC6/TX/CK pins as serial port pins)
    RCSTAbits.RX9 = 0;  // 0 = Selects 8-bit reception
    
    // Interrupt configuration
    INTCONbits.GIE = 1;  
    INTCONbits.PEIE = 1; 

    // 1. Transmit 8-bit data synchronously
    PIE1bits.TXIE = 1;   
    while(!tx_complete); 

    // 2. Receive 8-bit data synchronously
    PIE1bits.RCIE = 1;   
    RCSTAbits.SREN = 1;  // 1 = Enables single receive
    while(!rx_complete); 

    while(1) {
        // Idle
    }
}
