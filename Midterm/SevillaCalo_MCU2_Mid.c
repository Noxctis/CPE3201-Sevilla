//Chrys Sean T. Sevilla
//Cyril John Christian A. Calo

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
    
    unsigned char rx_byte = 0;

    
    TRISB = 0xF0; 
    TRISD = 0xF0; 
    PORTB = 0x00;
    PORTD = 0x00;
    
    // UART Configuration (9600 Baud)
    SPBRG = 25;
    TXSTA = 0x24; 
    RCSTA = 0x90; 
    
    for(;;) 
    {
        if(RCIF) 
        {
            rx_byte = RCREG; 
            
            PORTB = (rx_byte >> 4) & 0x0F;
            
            
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