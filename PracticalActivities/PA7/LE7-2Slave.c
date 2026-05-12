/**
 * @file I2C_Slave.c
 * @author cssevilla
 * @brief I2C Slave Implementation - Receives data to PORTB, Transmits data from PORTD
 */

#include <xc.h>

// --- Configuration Bits ---
#pragma config FOSC = XT   // Oscillator Selection (XT oscillator)
#pragma config WDTE = OFF  // Watchdog Timer Enable (WDT disabled)
#pragma config PWRTE = ON  // Power-up Timer Enable (PWRT enabled)
#pragma config BOREN = ON  // Brown-out Reset Enable (BOR enabled)
#pragma config LVP = OFF   // Low-Voltage (Single-Supply) In-Circuit Serial Programming Disable
#pragma config CPD = OFF   // Data EEPROM Memory Code Protection (Disabled)
#pragma config WRT = OFF   // Flash Program Memory Write Enable (Write protection off)
#pragma config CP = OFF    // Flash Program Memory Code Protection (Disabled)

#define _XTAL_FREQ 4000000 // 4MHz Crystal Frequency 

/**
 * @brief Initializes the PIC as an I2C Slave
 * @param slave_add The 7-bit address assigned to this slave device
 */
void init_I2C_Slave(unsigned char slave_add) 
{  
    // 1. Configure I2C Pins (SCL and SDA must be set as inputs for the MSSP module)
    TRISC3 = 1;       // RC3 / SCL (Clock) is Input
    TRISC4 = 1;       // RC4 / SDA (Data) is Input
    
    // 2. Configure SSPCON (Synchronous Serial Port Control Register)
    // 0x36 = 0b00110110
    // Bit 5: SSPEN = 1 (Enables the serial port)
    // Bits 3-0: SSPM = 0110 (I2C Slave mode, 7-bit address)
    SSPCON = 0x36;    
    
    // 3. Configure SSPCON2
    // 0x01 = 0b00000001
    // Bit 0: SEN = 1 (Enables Clock Stretching for both transmit and receive)
    SSPCON2 = 0x01;   
    
    // 4. Configure SSPSTAT (MSSP Status Register)
    // 0x80 = 0b10000000
    // Bit 7: SMP = 1 (Slew rate control disabled for Standard Speed mode 100kHz)
    SSPSTAT = 0x80;   
    
    // 5. Load the Slave Address
    SSPADD = slave_add;  
    
    // 6. Enable Interrupts
    SSPIE = 1;        // Enable MSSP (I2C) Interrupt
    SSPIF = 0;        // Clear MSSP Interrupt Flag
    PEIE = 1;         // Enable Peripheral Interrupts
    GIE = 1;          // Enable Global Interrupts
} 

/**
 * @brief Interrupt Service Routine for handling I2C communication events
 */
void interrupt ISR(void) 
{  
    unsigned char temp;  
    
    // Hold the clock low (Clock Stretching) while we process the interrupt
    CKP = 0;          
    
    // --- Error Handling ---
    // WCOL: Write Collision Detect bit (Tried to write while transmitting)
    // SSPOV: Receive Overflow Indicator bit (Received new byte while buffer was full)
    if(WCOL || SSPOV) 
    { 
        temp = SSPBUF;  // Dummy read to clear the buffer
        WCOL = 0;       // Clear Collision bit
        SSPOV = 0;      // Clear Overflow bit
        CKP = 1;        // Release clock
    } 

    // --- State 1: Master is WRITING to Slave ---
    // D_nA = 0 (Last byte was an Address)
    // R_nW = 0 (Master wants to Write to us)
    if(!SSPSTATbits.D_nA && !SSPSTATbits.R_nW)      
    { 
        temp = SSPBUF;   // Dummy read to clear the address byte from the buffer
        while(!BF);      // Wait until the Buffer Full (BF) flag is set (data received)
        PORTB = SSPBUF;  // Output the received data to PORTB
        CKP = 1;         // Release the clock line to allow Master to continue
    } 
    
    // --- State 2: Master is READING from Slave ---
    // D_nA = 0 (Last byte was an Address)
    // R_nW = 1 (Master wants to Read from us)
    else if(!SSPSTATbits.D_nA && SSPSTATbits.R_nW)  
    { 
        temp = SSPBUF;   // Dummy read to clear the address byte from the buffer
        BF = 0;          // Manually clear the Buffer Full flag
        SSPBUF = PORTD;  // Load the data from PORTD into the buffer to send to Master
        CKP = 1;         // Release clock so the data can be transmitted
        while(BF);       // Wait until the buffer empties (transmission complete)
    } 
    
    // Clear the interrupt flag so the ISR doesn't immediately trigger again
    SSPIF = 0;         
} 

void main(void) 
{ 
    // --- I/O Setup ---
    TRISB = 0x00;   // Set PORTB as Output (To display data received from Master)
    PORTB = 0x00;   // Initialize PORTB to 0
    TRISD = 0xFF;   // Set PORTD as Input (To read data to send to Master)
    
    // --- Initialize I2C Slave ---
    // 0x10 is the arbitrary 7-bit address chosen for this slave device
    init_I2C_Slave(0x10);  
    
    for(;;) 
    {  
        // Background loop. 
        // All I2C receiving and transmitting is handled seamlessly by the ISR in the background.
    } 
}