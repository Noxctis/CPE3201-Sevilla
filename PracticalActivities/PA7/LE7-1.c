/**
 * @file I2C_Master_Tx.c
 * @author cssevilla
 * @brief I2C Master Implementation - Reads PORTD state and transmits to an I2C Slave
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
 * @brief Blocks execution until the MSSP hardware and I2C bus are idle
 */
void I2C_Wait(void) 
{ 
    // SSPCON2 & 0x1F masks the lower 5 bits (ACKEN, RCEN, PEN, RSEN, SEN)
    // SSPSTAT & 0x04 masks the R_nW bit (Transmit in progress)
    // Loop runs as long as any I2C hardware sequence is active
    while((SSPCON2 & 0x1F) || (SSPSTAT & 0x04));   
} 

/**
 * @brief Initializes the PIC as an I2C Master at 100kHz (@ 4MHz Fosc)
 */
void init_I2C_Master(void) 
{  
    // 1. Configure I2C Pins
    TRISC3 = 1;      // RC3 / SCL (Clock) must be set as Input for MSSP control
    TRISC4 = 1;      // RC4 / SDA (Data) must be set as Input for MSSP control
    
    // 2. Configure SSPCON (Synchronous Serial Port Control Register)
    // 0x28 = 0b00101000
    // Bit 5: SSPEN = 1 (Enables the serial port)
    // Bits 3-0: SSPM = 1000 (I2C Master mode, clock = FOSC / (4 * (SSPADD+1)))
    SSPCON = 0x28;   
    
    // 3. Clear Control and Status Registers
    SSPCON2 = 0x00;  
    SSPSTAT = 0x00;  
    
    // 4. Set I2C Clock Speed (Baud Rate Generator)
    // Target: 100kHz standard mode
    // SSPADD = (Fosc / (4 * BaudRate)) - 1
    // SSPADD = (4,000,000 / (4 * 100,000)) - 1 = 10 - 1 = 9 (0x09)
    SSPADD = 0x09;   
} 

/**
 * @brief Initiates an I2C Start Condition
 */
void I2C_Start(void) 
{ 
    I2C_Wait(); 
    SEN = 1;    // SEN: Start Condition Enable bit
} 

/**
 * @brief Initiates an I2C Stop Condition
 */
void I2C_Stop(void) 
{ 
    I2C_Wait(); 
    PEN = 1;    // PEN: Stop Condition Enable bit
} 

/**
 * @brief Initiates an I2C Repeated Start Condition
 */
void I2C_RepeatedStart(void) 
{ 
    I2C_Wait(); 
    RSEN = 1;   // RSEN: Repeated Start Condition Enable bit
} 

/**
 * @brief Sends a single byte of data over the I2C bus
 * @param data The 8-bit value to transmit (Address or Data)
 */
void I2C_Send(unsigned char data)
{ 
    I2C_Wait(); 
    SSPBUF = data;  // Writing to SSPBUF automatically initiates transmission
} 

/**
 * @brief Receives a single byte of data from the I2C bus
 * @param ack Set to 1 to send ACK (request more data), 0 for NACK (last byte)
 * @return The received 8-bit data
 */
unsigned char I2C_Receive(unsigned char ack) 
{ 
    unsigned char temp; 
    
    I2C_Wait();    
    RCEN = 1;       // RCEN: Receive Enable bit (Triggers MSSP to clock in a byte)
    
    I2C_Wait();    
    temp = SSPBUF;  // Read the received byte from the buffer
    
    I2C_Wait();    
    // ACKDT: Acknowledge Data bit (0 = ACK, 1 = NACK)
    ACKDT = (ack) ? 0 : 1;  
    ACKEN = 1;      // ACKEN: Acknowledge Sequence Enable bit (Transmits ACKDT)
    
    return temp;  
} 

void main(void) 
{ 
    // --- I/O Setup ---
    TRISD = 0xFF;   // PORTD as Input (Reads switch/button states to send to Slave)
    
    // --- Initialize I2C Master ---
    init_I2C_Master();  
    
    for(;;) 
    {  
        // --------------------------------------------------------
        // SEQUENCE: Master Write Operation (Send PORTD to Slave)
        // --------------------------------------------------------
        I2C_Start();     
        
        // Send Slave Address + Write Bit
        // 0x10 = Slave Address (0x08 shifted left by 1) + Write bit (0)
        I2C_Send(0x10);  
        
        // Transmit the state of PORTD
        I2C_Send(PORTD); 
        
        // Terminate communication
        I2C_Stop();      
        
        // Polling delay before the next transmission
        __delay_ms(200); 
    } 
}