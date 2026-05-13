/**
 * @file Voltmeter_Master.c
 * @author cssevilla
 * @brief Voltmeter Transmitter - Calculates Voltage and sends packed BCD via UART
 */

#include <xc.h>

#define _XTAL_FREQ 4000000 
#define CMD_SEND_VOLTAGE 0xA1
#define CMD_RESET_DISPLAY 0xA0
#define NO_KEY 0xFF



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
volatile unsigned char voltage_tenths = 0;
volatile unsigned char adc_ready = 0;

// --- Interrupt Service Routine ---
void interrupt ISR(void) 
{ 
    GIE = 0; // Disable interrupts
    
    // ADC Interrupt (Voltage conversion finished)
    if(ADIF == 1) 
    {
        ADIF = 0; 
        adc_ready = 1; // Signal main to calculate and transmit
    } 
    
    GIE = 1; // Re-enable interrupts
}

// --- Hardware Accurate Delay ---
void delay(unsigned int ms){
    while(ms--) {
        __delay_ms(1); 
    }
}

void sendVoltage(void)
{
    while (!TRMT);
    TXREG = CMD_SEND_VOLTAGE;
    while (!TRMT);
    TXREG = voltage_tenths;
}

void sendReset(void)
{
    while (!TRMT);
    TXREG = CMD_RESET_DISPLAY;
}

// --- Main Program ---
void main(void)
{
    // [C90 STANDARD] Variables MUST be declared at the absolute top
    unsigned char time = 50; // Holds the time received from MCU 1
   
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
        if(adc_ready)
        {
            adc_ready = 0;
            
            // Reconstruct 10-bit result
            adc_raw = (ADRESH << 8) | ADRESL;
            
            // Calculate total mV (0-5000) using 32-bit math
            voltage_mv = (adc_raw * 50) / 1023;
            
            // Extract Digits (Example: 1999mV -> 1V and 9 decimal)
            whole_v = (unsigned char)(voltage_mv / 10);
            decimal_v = (unsigned char)(voltage_mv % 10);

            // Pack BCD byte for Slave MCU: [Upper 4 bits: Whole] [Lower 4 bits: Decimal]
            //tx_data = (whole_v << 4) | (decimal_v & 0x0F);
            tx_data = voltage_mv;
            // Transmit via UART automatically
            while(!TRMT);    
            TXREG = tx_data; 
	    
	    if (RB0)
                {
                    sendVoltage();
                }
                else if (RB1)
                {
                    sendReset();
                }
            
            delay(500); // Wait 0.5s before taking the next reading
            GO = 1;     // Re-trigger ADC
        }
    }
}

/*

Problem:

Design and Implement a circuit with 2 microcontroller units (MCU1 and MCU2). MCU1 reads an input voltage which ranges from 0V to 5V. A keypad (without decoder) connected to MCU1 allows the following operations when the following keys are pressed:

1 - Send the input voltage information from MCU1 to MCU2. MCU2 does the following using an LCD:

Display voltage reading from MCU1 with 1 decimal place. (VOLTAGE: _____)
Display frequency based on the voltage value rounded up to the nearest whole number (FREQ: _____)
Display a counter that counts from 50 down to 0 and goes back to 50 after 0 with counting frequency based on the frequency above. (COUNT: _____)
0 - Reset the display in the LCD.

*/