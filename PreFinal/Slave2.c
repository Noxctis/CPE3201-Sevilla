/**
 * @file Voltmeter_Slave_LCD.c
 * @brief Voltmeter Receiver - Unpacks UART commands, calculates frequency, runs countdown
 */

#include <xc.h>

#define _XTAL_FREQ 4000000

// Command Headers
#define CMD_SEND_VOLTAGE 0xA1
#define CMD_RESET_DISPLAY 0xA0

// --- Configuration Bits ---
#pragma config FOSC = XT, WDTE = OFF, PWRTE = ON, BOREN = ON, LVP = OFF, CPD = OFF, WRT = OFF, CP = OFF

// --- LCD Control Pins ---
#define RS RB5
#define EN RB6
#define RW RB7

// --- Global Variables ---
unsigned char time_left = 50; 
unsigned int freq = 0;
int tick = 0;  

// --- Interrupt Service Routine ---
void interrupt ISR(void) 
{ 
    // [TIMER0 INTERRUPT] 
    if(TMR0IF == 1)
    {
        TMR0IF = 0; // Clear flag
        
        // Only count if frequency is greater than 0
        if(freq > 0) 
        {
            static int overflow_count = 0;
            overflow_count++;
            
            // MATH: 4MHz clock / 4 = 1MHz instruction rate (1us per tick)
            // Prescaler 1:32 -> Timer0 ticks every 32us.
            // Timer0 overflows every 256 * 32us = 8.192ms.
            // 1 full second = 1000ms / 8.192ms = ~122 overflows.
            // To fire "freq" times per second, we divide 122 by freq.
            int target_overflows = 122 / freq;
            
            if(overflow_count >= target_overflows) 
            {
                overflow_count = 0;
                tick = 1; // Trigger countdown decrement in main loop
            }
        }
    }
}

// --- LCD Control Functions ---
void delay(unsigned int ms){
    while(ms--) { __delay_ms(1); }
}

void instCtrl(unsigned char cmd){
    PORTD = cmd; 
    RS = 0; RW = 0; EN = 1; delay(1); EN = 0; 
}

void dataCtrl(unsigned char data){
    PORTD = data; 
    RS = 1; RW = 0; EN = 1; delay(1); EN = 0; 
}

void initLCD(){
    delay(20);      
    instCtrl(0x38); // 8-bit, 2-line, 5x7
    instCtrl(0x0C); // Display ON, Cursor OFF
    instCtrl(0x01); // Clear Display
    instCtrl(0x06); // Auto-increment
}

void printString(const char *str) {
    while(*str) { dataCtrl(*str++); }
}

// Custom function to ensure numbers always take up exact spaces (e.g., "05", "50")
void print2Digits(unsigned char num) {
    dataCtrl((num / 10) + '0'); // Tens digit
    dataCtrl((num % 10) + '0'); // Ones digit
}

// --- Main Program ---
void main(void)
{
    unsigned char rx_byte = 0;
    unsigned char expecting_data = 0; // UART State Machine Flag
    unsigned char current_voltage = 0;
    
    // Display Update Flags
    int update_voltage_display = 1;
    int update_count_display = 1;

    // --- I/O Setup ---
    TRISB = 0x00; // RB5-7 Output (LCD)
    TRISC = 0x80; // RC7 is RX Input
    TRISD = 0x00; // PORTD Output (LCD Data)
    PORTB = 0x00;
    PORTD = 0x00;
    
    // --- UART Configuration (9600 Baud) ---
    SPBRG = 25;
    TXSTA = 0x04; // BRGH=1, TXEN=0
    RCSTA = 0x90; // SPEN=1, CREN=1
    
    // --- TIMER0 SETUP ---
    // Prescaler 1:32 assigned to Timer0, Internal Clock
    OPTION_REG = 0x84; 
    
    TMR0IE = 1; // Enable Timer0 Interrupt
    PEIE = 1;   // Peripheral Interrupts
    GIE = 1;    // Global Interrupts
   
    initLCD();

    for(;;) 
    {
        // --- 1. UART RECEIVE (State Machine) ---
        if(RCIF) 
        {
            rx_byte = RCREG; 
            
            if (rx_byte == CMD_RESET_DISPLAY) 
            {
                // Reset Command Received ('0' was pressed)
                current_voltage = 0;
                freq = 0;
                time_left = 50;
                expecting_data = 0;
                
                update_voltage_display = 1;
                update_count_display = 1;
            }
            else if (rx_byte == CMD_SEND_VOLTAGE) 
            {
                // Header Received ('1' was pressed)
                expecting_data = 1;
            }
            else if (expecting_data == 1)
            {
                // Data Payload Received
                current_voltage = rx_byte;
                expecting_data = 0;
                
                // MATH: Round up to nearest whole number (e.g., 21 -> 2.1V -> Rounds to 3Hz)
                freq = (current_voltage + 9) / 10;
                
                // Reset the count down when a new frequency arrives
                time_left = 50; 
                
                update_voltage_display = 1;
                update_count_display = 1;
            }
            
            // Clear hardware overrun errors
            if(OERR) { CREN = 0; CREN = 1; }
        }
        
        // --- 2. TIMER TICK HANDLER ---
        if(tick) 
        {
            tick = 0; // Acknowledge the flag
            
            if(time_left > 0) {
                time_left--; 
            } 
            if (time_left == 0) {
                time_left = 50; // Loop back to 50
            }
            
            update_count_display = 1;
        }
        
        // --- 3. LCD UPDATER ---
        if (update_voltage_display)
        {
            update_voltage_display = 0;
            
            instCtrl(0x80); // Line 1
            printString("VOLTAGE: ");
            dataCtrl((current_voltage / 10) + '0');
            dataCtrl('.');
            dataCtrl((current_voltage % 10) + '0');
            printString(" V  ");
            
            instCtrl(0xC0); // Line 2
            printString("FREQ: ");
            dataCtrl(freq + '0');
            printString(" Hz  ");
        }
        
        if (update_count_display)
        {
            update_count_display = 0;
            
            instCtrl(0x94); // Line 3 (Assumes 20x4 LCD)
            printString("COUNT: ");
            print2Digits(time_left);
            printString("  "); 
        }
    }
}