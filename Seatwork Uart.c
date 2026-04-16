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
    [span_0](start_span)// Formula: (Synchronous) Baud Rate = Fosc/(4 (X + 1))[span_0](end_span)
    // Assuming target baud rate of 9600 bps with Fosc = 4MHz:
    // X = (4000000 / (4 * 9600)) - 1 = 103 (decimal)
    SPBRG = 103;

    // Configure TXSTA Register
    TXSTAbits.SYNC = 1; [span_1](start_span)// 1 = Synchronous mode[span_1](end_span)
    TXSTAbits.CSRC = 1; [span_2](start_span)// 1 = Master mode (clock generated internally from BRG)[span_2](end_span)
    TXSTAbits.TX9 = 0;  [span_3](start_span)// 0 = Selects 8-bit transmission[span_3](end_span)
    TXSTAbits.TXEN = 1; [span_4](start_span)// 1 = Transmit enabled[span_4](end_span)

    // Configure RCSTA Register
    RCSTAbits.SPEN = 1; [span_5](start_span)// 1 = Serial port enabled (configures RC7/RX/DT and RC6/TX/CK pins as serial port pins)[span_5](end_span)
    RCSTAbits.RX9 = 0;  [span_6](start_span)// 0 = Selects 8-bit reception[span_6](end_span)
    
    // Interrupt configuration
    INTCONbits.GIE = 1;  
    INTCONbits.PEIE = 1; 

    // 1. Transmit 8-bit data synchronously
    PIE1bits.TXIE = 1;   
    while(!tx_complete); 

    // 2. Receive 8-bit data synchronously
    PIE1bits.RCIE = 1;   
    RCSTAbits.SREN = 1;  [span_7](start_span)// 1 = Enables single receive[span_7](end_span)
    while(!rx_complete); 

    while(1) {
        // Idle
    }
}
