#include <xc.h>

#define _XTAL_FREQ 4000000 

// Configuration Bits: Critical for Real-Life hardware stability
#pragma config FOSC = XT    // Crystal Oscillator
#pragma config WDTE = OFF   // Watchdog Timer Off
#pragma config PWRTE = ON   // Power-up Timer On
#pragma config BOREN = ON   // Brown-out Reset On
#pragma config LVP = OFF    // Low Voltage Programming Off (Must be OFF for RB3/PGM pin)
#pragma config CPD = OFF    // Data EEPROM Protection Off
#pragma config WRT = OFF    // Flash Program Memory Write Enable
#pragma config CP = OFF     // Flash Program Memory Code Protection Off

void PWM_INIT(unsigned int freq, float duty);


unsigned int freq[] = {500, 700, 1000}; 
float dutyCyclePercent[] = {0.10, 0.25, 0.50, 0.75, 0.95}; 

int freqIndex = 0;  
int dutyIndex = 0;  

// Function to initialize and set PWM frequency & duty cycle
void PWM_INIT(unsigned int freq, float duty)
{
    // 1. Calculate PR2 (8-bit)
    // Formula: PR2 = [Fosc / (4 * Fpwm * Prescaler)] - 1
    PR2 = (unsigned char)((_XTAL_FREQ / (4UL * freq * 16)) - 1);

    // 2. Calculate 10-bit Duty Value
    // Formula: Duty Value = Duty% * (PR2 + 1) * 4
    // We use (PR2 + 1) * 4 because the CCP module has 4x the resolution of Timer2
    unsigned int dutyValue = (unsigned int)(duty * (PR2 + 1) * 4);

    // 3. Load the 10-bit value into registers
    // The 8 Most Significant Bits go to CCPR1L
    CCPR1L = (unsigned char)(dutyValue >> 2); 
    
    // The 2 Least Significant Bits go to CCP1CON bits 5 and 4
    // 0x0C ensures the CCP1 stays in PWM mode (11xx)
    CCP1CON = (0x0C | ((dutyValue & 0x03) << 4)); 

    // 4. Pin and Timer Setup
    TRISC2 = 0;    // Ensure RC2 is output
    T2CON = 0x06;  // Timer2 ON, 1:16 Prescaler
}

void main(void)
{

    TRISD = 0xFF;  
    TRISC = 0x00;  

    PWM_INIT(freq[freqIndex], dutyCyclePercent[dutyIndex]);

    for (;;) { 
        if (RD0) {  
            __delay_ms(50);  

            freqIndex = (freqIndex + 1) % 3;  // Cycle
            PWM_INIT(freq[freqIndex], dutyCyclePercent[dutyIndex]);  // Update PWM

            while (RD0); 
        }
        else if (RD1) {  
            __delay_ms(50); 
 
            dutyIndex = (dutyIndex + 1) % 5;  // Cycle 
            PWM_INIT(freq[freqIndex], dutyCyclePercent[dutyIndex]);  // Update PWM

            while (RD1); 
        }
    }   
}
