/**
 * @file Stopwatch_Master_7Seg.c
 * @author cssevilla
 * @brief Stopwatch Transmitter - Running time on PORTD, Sends Lap via UART
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

// --- Global Flags & Variables ---
int display_flag = 0;
int send_flag = 0;
unsigned char seconds = 0;
unsigned char lap_time = 0;
int tick_counter = 0;

// --- Interrupt Service Routine ---
void interrupt ISR(void) 
{ 
    GIE = 0; // Disable interrupts
    
    // 1. External Interrupt (RB0 Button Pressed = Capture Lap Time)
    if(INTF == 1)
    {
        INTF = 0;
        lap_time = seconds; // Snapshot the current running time
        send_flag = 1;      // Signal main loop to transmit to Slave
    }
    
    // 2. Timer1 Interrupt (50ms tick for Stopwatch)
    if(TMR1IF == 1) 
    {
        TMR1IF = 0;
        
        // Reload Timer1 for 50ms @ 4MHz (1:8 Prescaler)
        TMR1H = 0xE7; 
        TMR1L = 0x96; 
        
        tick_counter++;
        if(tick_counter >= 20) // 20 ticks * 50ms = 1000ms (1 second)
        {
            tick_counter = 0;
            seconds++;
            
            if(seconds > 99) 
            {
                seconds = 0; // Wrap back to 00
            }
            display_flag = 1; // Signal main loop to update PORTD
        }
    }
    
    GIE = 1; // Re-enable interrupts
}

// --- Main Program ---
void main(void)
{
    // [C90 STANDARD] Variables MUST be declared at the absolute top
    unsigned char disp_tens = 0;
    unsigned char disp_ones = 0;
    unsigned char lap_tens = 0;
    unsigned char lap_ones = 0;
    unsigned char tx_data = 0; 

    // --- I/O Setup ---
    TRISB = 0x01;  // RB0 is Input (Lap Button)
    TRISD = 0x00;  // PORTD is Output (7-Segment Decoders)
    PORTB = 0x00;
    PORTD = 0x00;  // Display starts at "00"
    
    // --- UART Configuration (9600 Baud @ 4MHz) ---
    SPBRG = 25;   
    TXSTA = 0x24; // Transmit Enable (TXEN=1), High Speed (BRGH=1)
    RCSTA = 0x80; // Serial Port Enable (SPEN=1)
    
    // --- External Interrupt Configuration (RB0) ---
    OPTION_REG = 0x40; // Rising edge trigger for the button
    INTE = 1;          // Enable RB0 External Interrupt
    INTF = 0;
    
    // --- Timer1 Configuration (16-bit) ---
    T1CON = 0x31; // Prescaler 1:8, Timer1 ON
    TMR1H = 0xE7; // Pre-load 50ms tick
    TMR1L = 0x96; 
    TMR1IE = 1;   // Enable Timer1 Interrupt
    TMR1IF = 0;
    
    PEIE = 1;     // Peripheral Interrupts Enable
    GIE = 1;      // Global Interrupts Enable

    for(;;)  
    { 
        // 1. Handle Running Stopwatch Display on PORTD
        if(display_flag)
        {
            display_flag = 0;
            
            // Extract digits
            disp_tens = seconds / 10;
            disp_ones = seconds % 10;
            
            // Pack and output directly to PORTD
            // Upper 4 bits (RD4-RD7) = Tens
            // Lower 4 bits (RD0-RD3) = Ones
            PORTD = (disp_tens << 4) | (disp_ones & 0x0F);
        }
        
        // 2. Handle Lap Button Press and UART Transmission
        if(send_flag)
        {
            send_flag = 0;
            
            // Extract digits of the captured lap time
            lap_tens = lap_time / 10;
            lap_ones = lap_time % 10;
            
            // Pack into a single byte exactly like PORTD
            tx_data = (lap_tens << 4) | (lap_ones & 0x0F);
            
            // Transmit the packed byte to the Slave MCU
            while(!TRMT);    
            TXREG = tx_data; 
        }
    }
}