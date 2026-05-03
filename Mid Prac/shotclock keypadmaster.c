/**
 * @file Keypad_Tx.c
 * @author cssevilla
 * @brief Keypad input (74C922 with Array Lookup), LCD display, and USART TX
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

// --- LCD Control Pin Mapping ---
#define RS RB5
#define RW RB6
#define EN RB7

// --- Global Keypad Map ---
// Maps 4-bit 74C922 binary output (0-15) directly to ASCII. 
// Spaces represent unconnected column 4 on a 3x4 keypad.
const char keypad[] = "123 456 789 *0# ";

// --- Precise Hardware Delay ---
void delay(unsigned int ms) 
{
    while(ms--) {
        __delay_ms(1); 
    }
}

// --- LCD Control Functions ---
void instCtrl(unsigned char cmd) 
{
    PORTD = cmd; 
    RS = 0;      
    RW = 0;      
    EN = 1;      
    delay(1);
    EN = 0;      
}

void dataCtrl(unsigned char data) 
{
    PORTD = data; 
    RS = 1;       
    RW = 0;       
    EN = 1;       
    delay(1);
    EN = 0;       
}

void initLCD(void) 
{
    delay(20);
    instCtrl(0x38); // 8-bit, dual line, 5x7 font
    instCtrl(0x08); // Display OFF
    instCtrl(0x01); // Display CLEAR
    delay(2);
    instCtrl(0x06); // Entry Mode
    instCtrl(0x0C); // Display ON, Cursor OFF
}

void printString(const char *str) 
{
    while(*str) {
        dataCtrl(*str++);
    }
}

// --- USART Transmit Function ---
void USART_Send_Byte(unsigned char data) 
{
    while(!TRMT);    
    TXREG = data;    
}

// --- Main Program ---
void main(void) 
{
    // [C90 STANDARD] Variables declared at the top
    char tens = '0';
    char ones = '0';
    unsigned char key_code = 0;
    char pressed_key = 0;
    unsigned char raw_tens = 0;
    unsigned char raw_ones = 0;
    unsigned char payload = 0;

    // --- I/O Setup ---
    TRISB = 0x1F;       // RB0-RB4 input (Keypad), RB5-RB7 output (LCD RS, RW, EN)
    TRISD = 0x00;       // PORTD output (LCD Data Bus)
    PORTB = 0x00; 
    PORTD = 0x00;
    
    // --- USART Setup (9600 Baud @ 4MHz) ---
    SPBRG = 25;         
    TXSTA = 0x24;       // Transmit Enable (TXEN=1), High Speed (BRGH=1)
    RCSTA = 0x80;       // Serial Port Enable (SPEN=1)
    
    // --- LCD Initialization & Static Text ---
    initLCD();
    instCtrl(0x80); 
    printString("SHOT CLK:");
    
    instCtrl(0xC0); 
    dataCtrl(tens); 
    dataCtrl(ones);

    for(;;) 
    {
        // Check if 74C922 Data Available (DA) pin is HIGH
        if (PORTBbits.RB4 == 1) 
        { 
            // Isolate the lower 4 bits from PORTB
            key_code = PORTB & 0x0F; 
            
            // O(1) Array Lookup instead of switch statement
            pressed_key = keypad[key_code];
            
            // Ignore the "dead" spaces in the array
            if (pressed_key != ' ') 
            {
                // ACTION 1: Number (0-9)
                if (pressed_key >= '0' && pressed_key <= '9') 
                {
                    tens = ones;
                    ones = pressed_key;
                }
                
                // ACTION 2: '*' (CLEAR)
                else if (pressed_key == '*') 
                {
                    tens = '0';
                    ones = '0';
                }
                
                // ACTION 3: '#' (SEND)
                else if (pressed_key == '#') 
                {
                    raw_tens = tens - '0';
                    raw_ones = ones - '0';
                    
                    payload = (raw_tens << 4) | raw_ones;
                    
                    USART_Send_Byte(payload);
                }
                
                // Update the LCD with the new digits
                instCtrl(0xC0);
                dataCtrl(tens);
                dataCtrl(ones);
            }
            
            // Debounce: Wait for key release before looping
            while(PORTBbits.RB4 == 1); 
            delay(20); 
        }
    }
}