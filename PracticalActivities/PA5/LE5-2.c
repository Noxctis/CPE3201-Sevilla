#pragma config FOSC = XT
#pragma config WDTE = OFF
#pragma config PWRTE = ON
#pragma config BOREN = ON
#pragma config LVP = OFF
#pragma config CPD = OFF
#pragma config WRT = OFF
#pragma config CP = OFF

#include <xc.h>

#define _XTAL_FREQ 4000000

unsigned int adc_value = 0;
unsigned int scaled_voltage = 0;
unsigned char whole = 0;
unsigned char decimal = 0;

void interrupt ISR(void) 
{
    // Timer0 handles the 60Hz enable pin flickering automatically
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

    if (ADIF) 
    {
        adc_value = (ADRESH << 8) + ADRESL;
        
        scaled_voltage = (adc_value * 50) / 1023;
        whole = (unsigned char)(scaled_voltage / 10);
        decimal = (unsigned char)(scaled_voltage % 10);
        
        ADIF = 0; 
    }
}

void main(void) 
{
    // Clear upper nibble of TRISB to make RB4-RB7 outputs. 
    // Leaves RB0-RB3 untouched in case you need them later.
    TRISB &= 0x0F;    
    PORTB &= 0x0F;    // Initialize RB4-RB7 to 0

    // Set RD5 (DP), RD6 (Digit 2 Enable), and RD7 (Digit 1 Enable) as outputs
    TRISD &= ~(1 << 5) & ~(1 << 6) & ~(1 << 7); 
    
    // Start with all three pins OFF
    PORTDbits.RD5 = 0;
    PORTDbits.RD6 = 0;
    PORTDbits.RD7 = 0;

    ADCON1 = 0x80;   
    ADCON0 = 0x01;   
    
    // Configure Timer0 to trigger the multiplexing switch at ~122Hz (61Hz per digit)
    OPTION_REG = 0x04; 

    T0IE = 1;       
    T0IF = 0;       
    ADIE = 1;       
    ADIF = 0;       
    PEIE = 1;       
    GIE = 1;        
    
    __delay_ms(1);   
    
    while(1) 
    {
        GO_DONE = 1; 
        __delay_ms(100); 
    }
}