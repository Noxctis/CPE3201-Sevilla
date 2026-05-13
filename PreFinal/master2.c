/**
 * @file Voltmeter_Master.c
 * @brief Voltmeter Transmitter - Reads ADC, handles buttons (RB0=Send '1', RB1=Reset '0')
 */

#include <xc.h>

#define _XTAL_FREQ 4000000 
#define CMD_SEND_VOLTAGE 0xA1
#define CMD_RESET_DISPLAY 0xA0

// --- Configuration Bits ---
#pragma config FOSC = XT, WDTE = OFF, PWRTE = ON, BOREN = ON, LVP = OFF, CPD = OFF, WRT = OFF, CP = OFF

volatile unsigned char adc_ready = 0;

// --- Interrupt Service Routine ---
void interrupt ISR(void) 
{ 
    if(ADIF == 1) 
    {
        ADIF = 0; 
        adc_ready = 1; // Signal main loop that a new reading is ready
    } 
}

// --- Hardware Accurate Delay ---
void delay(unsigned int ms){
    while(ms--) { __delay_ms(1); }
}

// --- Main Program ---
void main(void)
{
    unsigned int adc_raw = 0;
    unsigned char current_voltage_scaled = 0; // Holds 0 to 50 (representing 0.0V to 5.0V)

    // --- I/O Setup ---
    ADCON1 = 0x80; // Right Justified, RA0 as Analog input
    TRISA = 0x01;  // RA0 is Input (Voltage)
    
    // RB0 (Button '1') and RB1 (Button '0') are inputs.
    TRISB = 0x03;  
    TRISD = 0x00;  
    PORTB = 0x00;
    PORTD = 0x00;
    
    // --- UART Configuration (9600 Baud) ---
    SPBRG = 25;   
    TXSTA = 0x24; // TXEN=1, BRGH=1
    RCSTA = 0x80; // SPEN=1
    
    // --- ADC Configuration (RA0) ---
    ADCON0 = 0x41; // Fosc/8, Channel 0, ADC ON
    ADIF = 0;
    ADIE = 1;
    
    PEIE = 1;
    GIE = 1;
    
    delay(100); 
    GO = 1; // Trigger first conversion

    for(;;)  
    { 
        // 1. UPDATE VOLTAGE SILENTLY
        if(adc_ready)
        {
            adc_ready = 0;
            
            // Reconstruct 10-bit result
            adc_raw = (ADRESH << 8) | ADRESL;
            
            // Scale 0-1023 to 0-50 using the rounding trick
            current_voltage_scaled = (((unsigned long)adc_raw * 50) + 511) / 1023;
            
            delay(10);
            GO = 1; 
        }
        
        // 2. CHECK RB0 (BUTTON '1') -> SEND VOLTAGE INFO
        // NOTE: If your button connects to Ground in Proteus, change this to "if(RB0 == 0)"
        if (RB0 == 1)
        {
            delay(20); // Debounce
            if (RB0 == 1)
            {
                // Send Header
                while (!TRMT);
                TXREG = CMD_SEND_VOLTAGE;
                
                // Send Data Payload
                while (!TRMT);
                TXREG = current_voltage_scaled;
                
                // Wait for button release
                while(RB0 == 1); 
            }
        }
        
        // 3. CHECK RB1 (BUTTON '0') -> RESET DISPLAY
        // NOTE: If your button connects to Ground in Proteus, change this to "if(RB1 == 0)"
        if (RB1 == 1)
        {
            delay(20); // Debounce
            if (RB1 == 1)
            {
                // Send Reset Header Only
                while (!TRMT);
                TXREG = CMD_RESET_DISPLAY;
                
                // Wait for button release
                while(RB1 == 1);
            }
        }
    }
}