/**
 * @file ShotClock_Master_Wrap.c
 * @author cssevilla
 * @brief Shot Clock Master - 1:32 Prescaler with Wrapping Logic
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

// Global Keypad Map (4-bit binary to ASCII)
const char keypad[] = "123 456 789 *0# ";

// Timing and State Flags
int running = 0; 
int tick = 0;    

// --- Interrupt Service Routine ---
void interrupt ISR(void) 
{ 
    GIE = 0; // Disable interrupts during execution
    
    // [EXTERNAL INTERRUPT] RB0 Pin - Start/Stop Button
    if(INTF == 1) 
    {
        INTF = 0; 
        running = !running; // Toggle countdown state
    } 
    
    // [TIMER0 INTERRUPT] 1-Second Generator
    if(TMR0IF == 1)
    {
        TMR0IF = 0; // Clear flag
        if(running) 
        {
            static int count = 0;
            count++;
            
            // [PRESCALER CONFIG] 
            // For 1:32 prescaler @ 4MHz clock:
            // 1 second / 8.192ms overflow = ~122 counts
            if(count >= 122) 
            {
                count = 0;
                tick = 1; // Trigger countdown decrement in main loop
            }
        }
    }
    
    GIE = 1; // Re-enable interrupts
}

// Precise Hardware Delay
void delay(unsigned int ms){
    while(ms--) {
        __delay_ms(1); 
    }
}

void main(void)
{
    // [C90] ALL VARIABLES DECLARED AT THE TOP
    unsigned char time_left = 24;  // Current shot clock time
    unsigned char key_val = 0;      // Raw 4-bit data from keypad encoder
    unsigned char prev_davbl = 0;   // Edge detection for DAVBL pin
    char pressed_key = 0;           // Translated ASCII key

    // --- I/O CONFIGURATION ---
    TRISB = 0x01; // RB0 is Input (Button), others Output
    TRISD = 0xFF; // PORTD is Input (Keypad Data RD0-RD3 + DAVBL RD4)
    PORTB = 0x00;
    PORTD = 0x00;
    
    // --- UART CONFIGURATION (9600 Baud) ---
    SPBRG = 25;   // Baud Rate Generator reload value
    TXSTA = 0x24; // BRGH=1 (High Speed), TXEN=1 (Transmit Enable)
    RCSTA = 0x80; // SPEN=1 (Serial Port Enable)
    
    // --- OPTION_REG SETUP ---
    // Bit 7: RBPU=1 (Pull-ups disabled)
    // Bit 6: INTEDG=1 (Rising Edge for RB0)
    // Bit 5: T0CS=0 (Internal clock)
    // Bit 3: PSA=0 (Prescaler assigned to Timer0)
    // Bit 2-0: PS<2:0>=100 (1:32 Ratio)
    OPTION_REG = 0xC4; 
    
    // --- INTERRUPT ENABLE ---
    INTE = 1;   // Enable RB0 External Interrupt
    INTF = 0;   // Clear RB0 Flag
    TMR0IE = 1; // Enable Timer0 Interrupt
    TMR0IF = 0; // Clear Timer0 Flag
    
    PEIE = 1;   // Peripheral Interrupts
    GIE = 1;    // Global Interrupts
    
    // Sync initial time with Slave MCU
    while(!TRMT);
    TXREG = time_left;

    for(;;)  
    { 
        // --- 1. KEYPAD HANDLING (Stopped State) ---
        if(!running) 
        {
            // Check DAVBL pin (RD4) for transition from LOW to HIGH
            if((PORTD & 0x10) && !prev_davbl) 
            {
                delay(20); // Debounce delay
                
                // Read 4-bit data from RD0-RD3 and look up in keypad array
                key_val = PORTD & 0x0F; 
                pressed_key = keypad[key_val];
                
                // [RESET LOGIC]
                if(pressed_key == '1') time_left = 14;
                if(pressed_key == '2') time_left = 24;
                
                // [WRAPPING DECREMENT]
                if(pressed_key == '*') 
                {
                    if(time_left == 0) 
                    {
                        time_left = 24; // [EDIT HERE] Wrap back to 24 (or 99)
                    }
                    else 
                    {
                        time_left--; 
                    }
                }
                
                // [WRAPPING INCREMENT]
                if(pressed_key == '#') 
                {
                    if(time_left >= 24) // [EDIT HERE] Wrap back to 0 if at limit
                    {
                        time_left = 0;
                    }
                    else 
                    {
                        time_left++;
                    }
                }
                
                // Send manual update to Slave LCD immediately
                while(!TRMT);
                TXREG = time_left;
            }
            prev_davbl = PORTD & 0x10; // Store state of DAVBL
        }
        
        // --- 2. AUTOMATIC COUNTDOWN HANDLING ---
        if(tick) 
        {
            tick = 0; // Reset flag set by Timer0 ISR
            
            if(time_left > 0) 
            {
                time_left--; // Normal countdown
                
                // Update Slave LCD
                while(!TRMT);
                TXREG = time_left;
                
                // Auto-stop clock at 0
                if(time_left == 0) 
                {
                    running = 0; 
                }
            }
        }
    }
}