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

void main(void)
{
    // [C90] Variable at top
    unsigned char rx_byte = 0;

    // Port Directions: Lower 4 bits as output for BCD-to-7-Seg decoders
    TRISB = 0xF0; 
    TRISD = 0xF0; 
    PORTB = 0x00;
    PORTD = 0x00;
    
    // UART Configuration (9600 Baud)
    SPBRG = 25;
    TXSTA = 0x24; 
    RCSTA = 0x90; // SPEN=1, CREN=1 (Receive Enabled)
    
    for(;;) 
    {
        if(RCIF) // Wait for Byte
        {
            rx_byte = RCREG; // Read from buffer
            
            // Unpack data and display to 7-segment decoders
            // WHOLE NUMBER on PORTB (0-3)
            PORTB = (rx_byte >> 4) & 0x0F;
            
            // DECIMAL NUMBER on PORTD (0-3)
            PORTD = rx_byte & 0x0F;
            
            // Clear hardware overrun errors
            if(OERR)
            {
                CREN = 0;
                CREN = 1;
            }
        }
    }
}