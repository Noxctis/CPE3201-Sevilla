
#include <xc.h>
#include <math.h>

#define _XTAL_FREQ 4000000 // Required for __delay_ms

// --- Configuration Bits (Exactly as you set them) ---
#pragma config FOSC = XT
#pragma config WDTE = OFF
#pragma config PWRTE = ON
#pragma config BOREN = ON
#pragma config LVP = OFF
#pragma config CPD = OFF
#pragma config WRT = OFF
#pragma config CP = OFF

// --- LCD Control Pins ---
#define RS RB5
#define EN RB6
#define RW RB7

// Global variables for ISR/Main communication
int display_flag = 0;
unsigned char tx_data = 0;

// --- Function Prototypes ---
void initLCD();
void instCtrl(unsigned char cmd);
void dataCtrl(unsigned char data);
void delay(unsigned int ms);
void printString(const char *str);
void printNumber(unsigned int num);

// --- Interrupt Service Routine ---
void interrupt ISR(void) 
{ 
    GIE = 0; // Disable interrupts
    
    // ADC Interrupt (Voltage conversion finished)
    if(ADIF == 1) 
    {
        ADIF = 0; 
        display_flag = 1; // Signal main to update LCD
    } 
    
    // External Interrupt (Button press on RB0 to send UART)
    if(INTF == 1)
    {
        INTF = 0;
        while(!TRMT);    // Wait for UART buffer to be empty
        TXREG = tx_data; // Send packed BCD byte to MCU 2
    }
    
    GIE = 1; // Re-enable interrupts
}

// --- Hardware Accurate Delay ---
void delay(unsigned int ms){
    while(ms--) {
        __delay_ms(1); 
    }
}

// --- LCD Control Functions ---
void instCtrl(unsigned char cmd){
    PORTD = cmd; // Data Bus on PORTD
    RS = 0;      
    RW = 0;      
    EN = 1;      
    delay(1);
    EN = 0;      
}

void dataCtrl(unsigned char data){
    PORTD = data; // Data Bus on PORTD
    RS = 1;       
    RW = 0;       
    EN = 1;       
    delay(1);
    EN = 0;       
}

void initLCD(){
    delay(20);      
    instCtrl(0x38); // 8-bit, 2-line, 5x7
    instCtrl(0x08); 
    instCtrl(0x01); 
    delay(2);       
    instCtrl(0x06); 
    instCtrl(0x0C); 
}

void printString(const char *str) {
    while(*str) {
        dataCtrl(*str++);
    }
}

void printNumber(unsigned int num) {
    char buffer[6]; 
    int i = 5;
    buffer[--i] = '\0'; 

    if (num == 0) {
        buffer[--i] = '0';
    } else {
        while (num > 0 && i > 0) {
            buffer[--i] = (num % 10) + '0';
            num /= 10;
        }
    }
    printString(&buffer[i]); 
}

// --- Main Program ---
void main(void)
{
    // [C90] Variables MUST be declared at the absolute top
    unsigned int adc_raw = 0;
    unsigned int whole_v = 0;
    unsigned int decimal_v = 0;
    unsigned long voltage_mv = 0; // Use long to prevent math overflow

    // I/O Setup
    ADCON1 = 0x80; // Right Justified, RA0 as Analog input
    TRISA = 0x01;  // RA0 is Input (Voltage)
    TRISB = 0x0F;  // RB0 input (Button), RB5-7 Output (LCD Control)
    TRISD = 0x00;  // PORTD is Output (LCD Data)
    PORTB = 0x00;
    PORTD = 0x00;
    
    // UART Configuration (9600 Baud)
    SPBRG = 25;   
    TXSTA = 0x24; // TXEN=1, BRGH=1
    RCSTA = 0x80; // SPEN=1
    
    // External Interrupt Configuration (RB0)
    OPTION_REG = 0x40; // Rising edge
    INTE = 1;
    INTF = 0;
    
    // ADC Configuration (RA0)
    ADCON0 = 0x41; // Fosc/8, Channel 0, ADC ON
    ADIF = 0;
    ADIE = 1;
    
    PEIE = 1;
    GIE = 1;
    
    initLCD();
    instCtrl(0x80); 
    printString("VOLTAGE:");
    
    GO = 1; // Trigger first conversion

    for(;;)  
    { 
        if(display_flag)
        {
            display_flag = 0;
            
            // Reconstruct 10-bit result
            adc_raw = (ADRESH << 8) | ADRESL;
            
            // Math Fix: Calculate total mV (0-5000) using 32-bit math
            // Formula: (ADC * 5000) / 1023
            voltage_mv = ((unsigned long)adc_raw * 5000L) / 1023L;
            
            // Extract Digits (Example: 1999mV -> 1V and 9 decimal)
            whole_v = (unsigned int)(voltage_mv / 1000L);
            decimal_v = (unsigned int)((voltage_mv % 1000L) / 100L);

            // Update LCD Row 2
            instCtrl(0xC0); 
            printNumber(whole_v);
            dataCtrl('.');
            printNumber(decimal_v);
            printString(" V    "); // Clear trailing characters
            
            // Pack BCD byte for MCU 2: [Whole][Decimal]
            tx_data = (whole_v << 4) | (decimal_v & 0x0F);
            
            delay(500); // Wait 0.5s before next reading
            GO = 1;     // Re-trigger ADC
        }
    }
}