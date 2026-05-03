/**
 * @file Stopwatch_Master.c
 * @author cssevilla
 * @brief Stopwatch Transmitter - Sends Lap Time via UART (Packed BCD for PORTD)
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

// Global variables for ISR/Main communication
int display_flag = 0;
int send_flag = 0;
unsigned int seconds = 0;
unsigned int lap_time = 0;
int tick_counter = 0;

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
    
    // 1. External Interrupt (RB0 Button Pressed = Capture Lap Time)
    if(INTF == 1)
    {
        INTF = 0;
        lap_time = seconds; // Snapshot the current time
        send_flag = 1;      // Signal main loop to transmit and update LCD
    }
    
    // 2. Timer1 Interrupt (50ms tick for Stopwatch)
    if(TMR1IF == 1) 
    {
        TMR1IF = 0;
        
        // Reload for 50ms @ 4MHz (1:8 Prescaler)
        TMR1H = 0xE7; 
        TMR1L = 0x96; 
        
        tick_counter++;
        if(tick_counter >= 20) // 20 ticks * 50ms = 1 second
        {
            tick_counter = 0;
            seconds++;
            
            if(seconds > 99) 
            {
                seconds = 0; // Wrap back to 0 so it fits in 2 digits
            }
            display_flag = 1; // Signal main loop to update running clock
        }
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
    // [C90] Variables MUST be declared at the absolute top
    unsigned char tens = 0;
    unsigned char ones = 0;
    unsigned char tx_data = 0; 

    // --- I/O Setup ---
    TRISA = 0x00; 
    TRISB = 0x01;  // RB0 input (Lap Button), RB5-7 Output (LCD Control)
    TRISD = 0x00;  // PORTD Output (LCD Data)
    PORTB = 0x00;
    PORTD = 0x00;
    
    // --- UART Configuration (9600 Baud) ---
    SPBRG = 25;   
    TXSTA = 0x24; // TXEN=1, BRGH=1
    RCSTA = 0x80; // SPEN=1
    
    // --- External Interrupt Configuration (RB0) ---
    OPTION_REG = 0x40; // Rising edge trigger
    INTE = 1;
    INTF = 0;
    
    // --- Timer1 Configuration (16-bit) ---
    T1CON = 0x31; // Prescaler 1:8, Timer1 ON
    TMR1H = 0xE7; // Pre-load 50ms tick
    TMR1L = 0x96; 
    TMR1IE = 1;
    TMR1IF = 0;
    
    PEIE = 1;
    GIE = 1;
    
    // --- Initial LCD Setup ---
    initLCD();
    instCtrl(0x80); 
    printString("TIME: 00 s");
    
    instCtrl(0xC0);
    printString("LAP : -- s");

    for(;;)  
    { 
        // 1. Handle Running Stopwatch Display
        if(display_flag)
        {
            display_flag = 0;
            
            instCtrl(0x86); // Move cursor right after "TIME: "
            
            // Format leading zero
            if(seconds < 10) dataCtrl('0');
            printNumber(seconds);
        }
        
        // 2. Handle Lap Button Press and UART Transmission
        if(send_flag)
        {
            send_flag = 0;
            
            // Extract digits for BCD Packing
            tens = (unsigned char)(lap_time / 10);
            ones = (unsigned char)(lap_time % 10);
            
            // Pack into a single byte: [Upper 4 bits: Tens] [Lower 4 bits: Ones]
            // This is exactly what the Slave needs to output both digits to PORTD
            tx_data = (tens << 4) | (ones & 0x0F);
            
            // Transmit to Slave
            while(!TRMT);    
            TXREG = tx_data; 
            
            // Update Master LCD with the Lap Time
            instCtrl(0xC6); // Move cursor right after "LAP : "
            if(lap_time < 10) dataCtrl('0');
            printNumber(lap_time);
        }
    }
}