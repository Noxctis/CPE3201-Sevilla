/**
 * @file ShotClock_Slave.c
 * @author cssevilla
 * @brief Shot Clock Display (UART RX to LCD)
 */

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

// --- LCD Control Pins ---
#define RS RB5
#define EN RB6
#define RW RB7

void delay(unsigned int ms){
    while(ms--) {
        __delay_ms(1); 
    }
}

// --- LCD Command Write ---
void instCtrl(unsigned char cmd){
    PORTD = cmd; // Data on PORTD
    RS = 0;      // Instruction Mode
    RW = 0;      // Write Mode
    EN = 1;      // Enable High
    delay(1);
    EN = 0;      // Latch data
}

// --- LCD Character Write ---
void dataCtrl(unsigned char data){
    PORTD = data; // Data on PORTD
    RS = 1;       // Character Mode
    RW = 0;       // Write Mode
    EN = 1;       // Enable High
    delay(1);
    EN = 0;       // Latch data
}

// --- LCD Boot Sequence ---
void initLCD(){
    delay(20);      
    instCtrl(0x38); // 8-bit mode, 2 lines
    instCtrl(0x08); // Display OFF
    instCtrl(0x01); // Clear Display
    delay(2);       // Must wait 2ms after clear
    instCtrl(0x06); // Auto-increment cursor
    instCtrl(0x0C); // Display ON, Cursor OFF
}

void printString(const char *str) {
    while(*str) {
        dataCtrl(*str++);
    }
}

// Converts an integer into ASCII characters for the LCD
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

void main(void)
{
    // [C90 STANDARD] Variable at top
    unsigned char rx_time = 24; // Holds the time received from MCU 1

    // --- I/O Direction Setup ---
    TRISB = 0x0F; // RB5-RB7 Output (LCD Control)
    TRISD = 0x00; // PORTD Output (LCD 8-bit Data)
    TRISC = 0x80; // RC7 (RX) must be Input, RC6 (TX) is Output
    PORTB = 0x00;
    PORTD = 0x00;
    
    // --- UART (Serial) Setup ---
    SPBRG = 25;   // 9600 Baud Rate at 4MHz
    TXSTA = 0x24; // THE FIX: BRGH=1 (High Speed). Must match MCU 1 exactly!
    RCSTA = 0x90; // Serial Port Enable (SPEN=1), Continuous Receive (CREN=1)
    
    // --- LCD Initial Text ---
    initLCD();
    instCtrl(0x80); // Move to Row 1
    printString("SHOT CLOCK:");

    for(;;) 
    {
        // RCIF triggers when a full 8-bit byte arrives from MCU 1
        if(RCIF) 
        {
            rx_time = RCREG; // Read the byte from the hardware buffer
            
            instCtrl(0xC0); // Move to Row 2
            printString("TIME: ");
            
            // Formatting: Add a leading zero if time is less than 10 
            // (Prints "09" instead of "9 ")
            if(rx_time < 10) 
            {
                dataCtrl('0');
            }
            
            printNumber((unsigned int)rx_time);
            printString(" s  "); // Pad with spaces to overwrite old characters
            
            // --- Error Handling ---
            // If MCU 1 sends data too fast, the buffer overflows (OERR).
            // Clearing CREN resets the UART hardware so it doesn't freeze permanently.
            if(OERR)
            {
                CREN = 0;
                CREN = 1;
            }
        }
    }
}