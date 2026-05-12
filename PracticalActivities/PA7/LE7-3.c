/**
 * @file SHT21_I2C_LCD.c
 * @author cssevilla
 * @brief I2C Master reading SHT21 Temperature/Humidity Sensor with LCD Display
 *        Uses optimized 32-bit integer math instead of floating point.
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

// --- Hardware Pin Mapping ---
// LCD Data Bus is mapped to PORTB
#define RS RD5
#define EN RD6
#define RW RD7

// --- Function Prototypes ---
void initLCD(void);
void instCtrl(unsigned char cmd);
void dataCtrl(unsigned char data);
void delay(unsigned int ms);
void printString(const char *str);
void printNumber(unsigned int num);

void I2C_Wait(void);
void init_I2C_Master(void);
void I2C_Start(void);
void I2C_Stop(void);
void I2C_RepeatedStart(void);
void I2C_Send(unsigned char data);
unsigned char I2C_Receive(unsigned char ack);
unsigned int read_SHT21(unsigned char cmd);

// --- Accurate Hardware Delay ---
void delay(unsigned int ms){
    while(ms--) {
        __delay_ms(1); 
    }
}

// --- LCD Control Functions ---
void instCtrl(unsigned char cmd){
    PORTB = cmd; // 8-bit Data Bus on PORTB
    RS = 0;      
    RW = 0;      
    EN = 1;      
    delay(1);
    EN = 0;      
    delay(1);
}

void dataCtrl(unsigned char data){
    PORTB = data; 
    RS = 1;       
    RW = 0;       
    EN = 1;       
    delay(1);
    EN = 0;       
    delay(1);
}

void initLCD(void){
    delay(20);     
    instCtrl(0x38); // 8-bit mode, 2-line display, 5x7 font
    delay(5);
    instCtrl(0x38); 
    delay(1);
    instCtrl(0x08); // Display OFF
    instCtrl(0x01); // Display CLEAR
    delay(2);       
    instCtrl(0x06); // Auto-increment cursor
    instCtrl(0x0C); // Display ON, Cursor OFF
}

void printString(const char *str) {
    while(*str) {
        dataCtrl(*str++);
    }
}

// Converts integer to ASCII characters without using heavy sprintf()
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

// --- I2C Master Functions ---

// Blocks execution until the MSSP hardware and I2C bus are idle
void I2C_Wait(void) { 
    while((SSPCON2 & 0x1F) || (SSPSTAT & 0x04));   
} 

// Initializes PIC16 MSSP module for I2C Master at 100kHz (@ 4MHz Fosc)
void init_I2C_Master(void) {  
    TRISC3 = 1;      // RC3/SCL set as input for MSSP control
    TRISC4 = 1;      // RC4/SDA set as input for MSSP control
    SSPCON = 0x28;   // SSPEN = 1, I2C Master Mode (clock = Fosc / (4 * (SSPADD+1)))
    SSPCON2 = 0x00;  
    SSPSTAT = 0x00;  
    SSPADD = 0x09;   // Baud Rate Generator = 9 (Yields 100kHz standard mode)
} 

void I2C_Start(void) { 
    I2C_Wait(); 
    SEN = 1;    // Initiate Start Condition
} 

void I2C_Stop(void) { 
    I2C_Wait(); 
    PEN = 1;    // Initiate Stop Condition
} 

void I2C_RepeatedStart(void) { 
    I2C_Wait(); 
    RSEN = 1;   // Initiate Repeated Start Condition
} 

void I2C_Send(unsigned char data) { 
    I2C_Wait(); 
    SSPBUF = data;  // Load buffer to auto-start transmission
    I2C_Wait(); 
} 

unsigned char I2C_Receive(unsigned char ack) { 
    unsigned char temp; 
    I2C_Wait();    
    RCEN = 1;       // Enable receive mode
    I2C_Wait();    
    temp = SSPBUF;  // Extract received byte
    I2C_Wait();    
    ACKDT = (ack) ? 0 : 1; // 0 = ACK, 1 = NACK
    ACKEN = 1;      // Transmit ACK/NACK bit
    return temp;  
} 

// --- SHT21 Sensor Functions ---

// Reads a 16-bit value from the SHT21 based on the provided command
unsigned int read_SHT21(unsigned char cmd) {
    unsigned char msb, lsb;
    unsigned int raw_data;

    I2C_Start();             
    I2C_Send(0x80);          // SHT21 I2C Address (0x40) shifted left + Write bit (0)
    I2C_Send(cmd);           // Send measurement command (e.g., 0xE5 for RH, 0xE3 for Temp)
    
    // Switch to receive mode using Repeated Start
    I2C_RepeatedStart();     
    I2C_Send(0x81);          // SHT21 I2C Address (0x40) shifted left + Read bit (1)
    
    // Master must hold SCL low (clock stretching) if SHT21 is still measuring.
    // The hardware handles the hold automatically. Once ready, it sends MSB.
    msb = I2C_Receive(1);    // Receive MSB, send ACK
    lsb = I2C_Receive(0);    // Receive LSB, send NACK to end communication
    I2C_Stop();              
    
    // Combine the two 8-bit halves into a single 16-bit integer
    raw_data = ((unsigned int)msb << 8) | lsb;
    
    return raw_data;
}

// --- Main Program ---

void main(void) { 
    // [C90 STANDARD] All variables declared at the absolute top of scope
    unsigned int raw_rh_16;
    int rh_int;
    unsigned int raw_t_16;
    long t_100;
    int t_int;

    // --- I/O Setup ---
    PORTB = 0x00;
    PORTC = 0x00;
    PORTD = 0x00;
    
    TRISB = 0x00; // PORTB Output (LCD Data)
    TRISC = 0x18; // RC3, RC4 Inputs (I2C SCL/SDA)
    TRISD = 0x00; // PORTD Output (LCD Control)
    
    delay(100);   // Give the SHT21 time to boot up
    
    init_I2C_Master();  
    initLCD();
    
    for(;;) {  
        // ==========================================
        // 1. Humidity (Strict Truncation - Drop Decimal)
        // ==========================================
        // 0xE5 = Trigger Humidity Measurement (Hold Master mode)
        raw_rh_16 = read_SHT21(0xE5); 
        
        // Bits 1 and 0 are status bits (must be set to 0 before calculation)
        raw_rh_16 &= 0xFFFC; 
        
        // Formula: RH = -6 + 125 * (raw / 2^16)
        // Shifting right by 16 bits is identical to dividing by 65536. 
        // We do the multiplication first, then shift, entirely avoiding slow float math.
        rh_int = (int)(((125L * (long)raw_rh_16)) >> 16) - 6;
        
        // Clamp boundaries just in case sensor spits bad data near extremes
        if (rh_int <= 0) rh_int = 0; 
        if (rh_int > 100) rh_int = 100;
        
        // ==========================================
        // 2. Temperature (Rounded to Nearest Integer)
        // ==========================================
        // 0xE3 = Trigger Temperature Measurement (Hold Master mode)
        raw_t_16 = read_SHT21(0xE3);  
        
        // Clear status bits
        raw_t_16 &= 0xFFFC; 
        
        // Formula: T = -46.85 + 175.72 * (raw / 2^16)
        // To preserve 2 decimal places using integers, we calculate T * 100:
        // T * 100 = -4685 + 17572 * (raw / 2^16)
        // The "+ 32768L" rounds the division rather than truncating it.
        t_100 = (((17572L * (long)raw_t_16) + 32768L) >> 16) - 4685L;
        
        // Convert the scaled T * 100 back to normal integer (T), rounding to nearest whole number
        if (t_100 >= 0) {
            t_int = (int)((t_100 + 50L) / 100L); 
        } else {
            t_int = (int)((t_100 - 50L) / 100L); 
        }
        
        // ==========================================
        // 3. Update LCD Display
        // ==========================================
        instCtrl(0x80); // Row 1
        printString("Humidity: ");
        printNumber((unsigned int)rh_int);
        printString("%    "); // Spaces overwrite leftover characters
        
        instCtrl(0xC0); // Row 2
        printString("Temp: ");
        
        // Handle negative temperatures
        if (t_int < 0) {
            printString("-");
            printNumber((unsigned int)(-t_int));
        } else {
            printNumber((unsigned int)t_int);
        }
        
        printString(" C    "); 
        
        // Polling delay. Prevents self-heating of the SHT21 sensor.
        delay(150); 
    } 
}