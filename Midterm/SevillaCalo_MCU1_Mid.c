//Chrys Sean T. Sevilla
//Cyril John Christian A. Calo
#include <xc.h>
#include <math.h>

#define _XTAL_FREQ 4000000 

#pragma config FOSC = XT
#pragma config WDTE = OFF
#pragma config PWRTE = ON
#pragma config BOREN = ON
#pragma config LVP = OFF
#pragma config CPD = OFF
#pragma config WRT = OFF
#pragma config CP = OFF

// --- LCD Control Pins ---
#define RS RC0
#define EN RC2
#define RW RC1

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
    GIE = 0; 
    
 
    if(ADIF == 1) 
    {
        ADIF = 0; 
        display_flag = 1;
    } 
    
    
    if(INTF == 1)
    {
        INTF = 0;
        while(!TRMT);    // Wait for UART buffer to be empty
        TXREG = tx_data; 
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
    
    unsigned int adc_value = 0;
    unsigned int scaled_voltage = 0;
    unsigned char whole = 0;
    unsigned char decimal = 0;

    // I/O Setup
    ADCON1 = 0x80; // Right Justified, RA0 as Analog input
    TRISA = 0x01;  // RA0 is Input (Voltage)
    TRISB = 0x0F;  // RB0 input (Button)
    TRISC = 0xF0;  // RB0-3 LCD Control
    TRISCbits.TRISC6 = 1; //UART
    TRISCbits.TRISC7 = 1; //UART
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
    
    GO = 1; 

    for(;;)  
    { 
        if(display_flag)
        {
            display_flag = 0;
            
            
            adc_value = (ADRESH << 8) + ADRESL;
        
	    scaled_voltage = (adc_value * 50) / 1023;
	    whole = (unsigned char)(scaled_voltage / 10);
	    decimal = (unsigned char)(scaled_voltage % 10);

            // Update LCD Row 2
            instCtrl(0xC0); 
            printNumber(whole);
            dataCtrl('.');
            printNumber(decimal);
            printString(" V    "); // Clear trailing characters
            
            
            tx_data = (whole << 4) | (decimal & 0x0F);
            
            delay(500); 
            GO = 1;     
        }
    }
}