/**
 * @file Voltmeter_Master.c
 * @author cssevilla
 * @brief Voltmeter Transmitter - Calculates Voltage and sends packed BCD via UART
 */

#include <xc.h>

#define _XTAL_FREQ 4000000 

// --- Configuration Bits ---
#pragma config FOSC = XT
#pragma config WDTE = OFF
#pragma config PWRTE = ON
#pragma config BOREN = ON
#pragma config LVP = OFF
#pragma config CPD = OFF
#pragma config WRT = OFF
#pragma config CP = OFF

// Global variable for ISR/Main communication
int display_flag = 0;

// --- Interrupt Service Routine ---
void interrupt ISR(void) 
{ 
    GIE = 0; // Disable interrupts
    
    // ADC Interrupt (Voltage conversion finished)
    if(ADIF == 1) 
    {
        ADIF = 0; 
        display_flag = 1; // Signal main to calculate and transmit
    } 
    
    GIE = 1; // Re-enable interrupts
}

// --- Hardware Accurate Delay ---
void delay(unsigned int ms){
    while(ms--) {
        __delay_ms(1); 
    }
}

// --- Main Program ---
void main(void)
{
    // [C90 STANDARD] Variables MUST be declared at the absolute top
    unsigned int adc_raw = 0;
    unsigned int whole_v = 0;
    unsigned int decimal_v = 0;
    unsigned long voltage_mv = 0; 
    unsigned char tx_data = 0;

    // --- I/O Setup ---
    ADCON1 = 0x80; // Right Justified, RA0 as Analog input
    TRISA = 0x01;  // RA0 is Input (Voltage)
    TRISB = 0x00;  
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
    
    delay(100); // Startup stabilization
    GO = 1;     // Trigger first conversion

    for(;;)  
    { 
        if(display_flag)
        {
            display_flag = 0;
            
            // Reconstruct 10-bit result
            adc_raw = (ADRESH << 8) | ADRESL;
            
            // Calculate total mV (0-5000) using 32-bit math
            voltage_mv = ((unsigned long)adc_raw * 5000L) / 1023L;
            
            // Extract Digits (Example: 1999mV -> 1V and 9 decimal)
            whole_v = (unsigned int)(voltage_mv / 1000L);
            decimal_v = (unsigned int)((voltage_mv % 1000L) / 100L);

            // Pack BCD byte for Slave MCU: [Upper 4 bits: Whole] [Lower 4 bits: Decimal]
            tx_data = (whole_v << 4) | (decimal_v & 0x0F);
            
            // Transmit via UART automatically
            while(!TRMT);    
            TXREG = tx_data; 
            
            delay(500); // Wait 0.5s before taking the next reading
            GO = 1;     // Re-trigger ADC
        }
    }
}