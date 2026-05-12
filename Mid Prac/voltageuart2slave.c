/**
 * @file Voltmeter_Slave_LCD.c
 * @author cssevilla
 * @brief Voltmeter Receiver - Unpacks UART BCD and displays to LCD
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

// --- LCD Control Pins ---
#define RS RB5
#define EN RB6
#define RW RB7

// --- LCD Control Functions ---
void delay(unsigned int ms){
    while(ms--) {
        __delay_ms(1); 
    }
}

void instCtrl(unsigned char cmd){
    PORTD = cmd; 
    RS = 0;      
    RW = 0;      
    EN = 1;      
    delay(1);
    EN = 0;      
}

void dataCtrl(unsigned char data){
    PORTD = data; 
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
    // [C90 STANDARD] Variables at top
    unsigned char rx_byte = 0;
    unsigned int whole_v = 0;
    unsigned int decimal_v = 0;

    // --- I/O Setup ---
    TRISB = 0x0F; // RB5-7 Output (LCD Control Pins)
    TRISC = 0x80; // RC7 is RX Input
    TRISD = 0x00; // PORTD Output (LCD Data Bus)
    PORTB = 0x00;
    PORTD = 0x00;
    
    // --- UART Configuration (9600 Baud) ---
    SPBRG = 25;
    TXSTA = 0x24; // BRGH=1
    RCSTA = 0x90; // SPEN=1, CREN=1 (Receive Enabled)
    
    // --- Initial LCD Setup ---
    initLCD();
    instCtrl(0x80); 
    printString("VOLTAGE:");

    for(;;) 
    {
        if(RCIF) // Wait for UART Byte from Master
        {
            rx_byte = RCREG; 
            
            // Unpack the BCD Data sent by the Master
            whole_v = (rx_byte >> 4) & 0x0F;
            decimal_v = rx_byte & 0x0F;
            
            // Update LCD Row 2
            instCtrl(0xC0); 
            printNumber(whole_v);
            dataCtrl('.');
            printNumber(decimal_v);
            printString(" V    "); // Padding clears trailing garbage
            
            // Clear hardware overrun errors
            if(OERR)
            {
                CREN = 0;
                CREN = 1;
            }
        }
    }
}