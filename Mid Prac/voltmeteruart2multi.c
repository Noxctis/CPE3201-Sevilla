/**
 * @file Voltmeter_Slave_Multiplexed.c
 * @author cssevilla
 * @brief UART Receiver - Unpacks BCD and multiplexes to 7-segment via Timer0
 */

#include <xc.h>

#define _XTAL_FREQ 4000000

#pragma config FOSC = XT
#pragma config WDTE = OFF
#pragma config PWRTE = ON
#pragma config BOREN = ON
#pragma config LVP = OFF
#pragma config CPD = OFF
#pragma config WRT = OFF
#pragma config CP = OFF

// --- Global Variables ---
unsigned char whole = 0;
unsigned char decimal = 0;

// --- Interrupt Service Routine ---
void interrupt ISR(void) 
{
    // Timer0 handles the multiplexing enable pin flickering automatically
    if (T0IF) 
    {
        static unsigned char digit_select = 0;

        // 1. Disable BOTH enable pins before switching to prevent ghosting
        PORTDbits.RD6 = 0; 
        PORTDbits.RD7 = 0; 

        if (digit_select == 0) 
        {
            // Send 'whole' to RB4-RB7. The (PORTB & 0x0F) preserves RB0-RB3.
            PORTB = (PORTB & 0x0F) | (whole << 4);          
            PORTDbits.RD5 = 1;      // Turn ON Decimal Point (RD5)
            PORTDbits.RD7 = 1;      // Turn ON first digit
            digit_select = 1;
        } 
        else 
        {
            // Send 'decimal' to RB4-RB7. The (PORTB & 0x0F) preserves RB0-RB3.
            PORTB = (PORTB & 0x0F) | (decimal << 4);        
            PORTDbits.RD5 = 0;      // Turn OFF Decimal Point (RD5)
            PORTDbits.RD6 = 1;      // Turn ON second digit
            digit_select = 0;
        }

        T0IF = 0; 
    }
}

// --- Main Program ---
void main(void)
{
    // [C90] Variable at top
    unsigned char rx_byte = 0;

    // --- I/O Setup ---
    // Clear upper nibble of TRISB to make RB4-RB7 outputs for BCD Data. 
    TRISB &= 0x0F;    
    PORTB &= 0x0F;    

    // Set RD5 (DP), RD6 (Digit 2 Enable), and RD7 (Digit 1 Enable) as outputs
    TRISD &= ~(1 << 5) & ~(1 << 6) & ~(1 << 7); 
    TRISCbits.TRISC7 = 1; // RC7 as RX input

    // Start with all three pins OFF
    PORTDbits.RD5 = 0;
    PORTDbits.RD6 = 0;
    PORTDbits.RD7 = 0;

    // --- UART Configuration (9600 Baud) ---
    SPBRG = 25;
    TXSTA = 0x24; 
    RCSTA = 0x90; // SPEN=1, CREN=1 (Receive Enabled)

    // --- Timer0 Configuration (Multiplexing) ---
    OPTION_REG = 0x04; // Prescaler 1:32 assigned to TMR0 (~122Hz overflow)
    T0IE = 1;       
    T0IF = 0;       
    
    PEIE = 1;       
    GIE = 1;        

    for(;;) 
    {
        if(RCIF) // Wait for Byte from Master
        {
            rx_byte = RCREG; // Read from UART buffer

            // Unpack data into globals used by Timer0 ISR
            whole = (rx_byte >> 4) & 0x0F;
            decimal = rx_byte & 0x0F;

            // Clear hardware overrun errors to prevent UART lockup
            if(OERR)
            {
                CREN = 0;
                CREN = 1;
            }
        }
    }
}
