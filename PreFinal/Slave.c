/**
 * @file Voltmeter_Slave_LCD.c
 * @author cssevilla
 * @brief Voltmeter Receiver - Unpacks UART BCD and displays to LCD
 */

#include <xc.h>
#include <math.h>

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

// Timing and State Flags
int running = 0; 
int tick = 0;  
unsigned int freq = 0;

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
        //if(running) 
        //{
            static int count = 0;
            count++;
            
            // [PRESCALER CONFIG] 
            // For 1:32 prescaler @ 4MHz clock:
            // 1 second / 8.192ms overflow = ~122 counts
            if(count >= freq) 
            {
                count = 0;
                tick = 1; // Trigger countdown decrement in main loop
            }
        //}
    }
    
    GIE = 1; // Re-enable interrupts
}

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
    unsigned char time_left = 50;  // Current shot clock time
    unsigned char rx_byte = 0;
    unsigned int whole_v = 0;
    unsigned int decimal_v = 0;
    unsigned char time = 50; // Holds the time received from MCU 1
    unsigned long voltage_mv = 0;

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
   
    // --- Initial LCD Setup ---
    initLCD();
    instCtrl(0x80); 
    printString("VOLTAGE:");
     
    instCtrl(0xC0); 
    printString("FREQ:"); 
     
    instCtrl(0x94); // Move to Row 2
    printString("COUNT: ");
    for(;;) 
    {
        if(RCIF) // Wait for UART Byte from Master
        {
            rx_byte = RCREG; 
	    voltage_mv = rx_byte;
            
            // Unpack the BCD Data sent by the Master
            //whole_v = (rx_byte >> 4) & 0x0F;
            //decimal_v = rx_byte & 0x0F;
            
	   
	    // Extract Digits (Example: 1999mV -> 1V and 9 decimal)
            whole_v = (unsigned char)(voltage_mv / 10);
            decimal_v = (unsigned char)(voltage_mv % 10);
	   
            // Update LCD Row 2
            instCtrl(0x8A); 
            printNumber(whole_v);
            dataCtrl('.');
            printNumber(decimal_v);
            printString(" V    "); // Padding clears trailing garbage
	    
	    freq = (int)round(voltage_mv/10);
	    // Update LCD Row 2
            instCtrl(0xCA); 
            printNumber(freq);
	   //(int)round((d_Value%205)/20.48);

            
	    // --- 2. AUTOMATIC COUNTDOWN HANDLING ---
        if(tick) 
        {
            tick = 0; // Reset flag set by Timer0 ISR
            
            if(time_left > 0) 
            {
                time_left--; // Normal countdown
                
               
                time = time_left;
                
                // Auto-stop clock at 0
                if(time_left == 0) 
                {
                    time_left = 50; 
                }
            }
        }
	instCtrl(0x9E); // Move to Row 2
	printNumber((unsigned int)time);
	printString(" s  "); // Pad with spaces to overwrite old characters
	   
            // Clear hardware overrun errors
            if(OERR)
            {
                CREN = 0;
                CREN = 1;
            }
        }
    }
}