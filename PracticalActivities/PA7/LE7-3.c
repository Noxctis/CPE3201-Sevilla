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

// --- Hardware Definitions ---
// As per your previous code, LCD Control is on PORTD
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

// --- LCD Functions ---

void delay(unsigned int ms){
    while(ms--) {
        __delay_ms(1); 
    }
}

void instCtrl(unsigned char cmd){
    PORTB = cmd; 
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
    instCtrl(0x38); 
    delay(5);
    instCtrl(0x38); 
    delay(1);
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

// --- I2C Master Functions ---

void I2C_Wait(void) { 
    // Wait until MSSP is idle
    while((SSPCON2 & 0x1F) || (SSPSTAT & 0x04));   
} 

void init_I2C_Master(void) {  
    TRISC3 = 1;      // SCL
    TRISC4 = 1;      // SDA
    SSPCON = 0x28;   
    SSPCON2 = 0x00;  
    SSPSTAT = 0x00;  
    SSPADD = 0x09;   // 100kHz at 4MHz Fosc
} 

void I2C_Start(void) { 
    I2C_Wait(); 
    SEN = 1;    
} 

void I2C_Stop(void) { 
    I2C_Wait(); 
    PEN = 1;    
} 

void I2C_RepeatedStart(void) { 
    I2C_Wait(); 
    RSEN = 1;    
} 

void I2C_Send(unsigned char data) { 
    I2C_Wait(); 
    SSPBUF = data;  
    I2C_Wait(); // Ensure transmission finishes
} 

unsigned char I2C_Receive(unsigned char ack) { 
    unsigned char temp; 
    I2C_Wait();    
    RCEN = 1;      
    I2C_Wait();    
    temp = SSPBUF; 
    I2C_Wait();    
    ACKDT = (ack) ? 0 : 1; // 1 for ACK, 0 for NACK
    ACKEN = 1;     
    return temp;  
} 

// --- SHT21 Sensor Function (Strictly follows Fig. 5) ---

unsigned int read_SHT21(unsigned char cmd) {
    unsigned char msb, lsb;
    unsigned int raw_data;

    I2C_Start();             
    I2C_Send(0x80);          // S + Address + Write (0)
    I2C_Send(cmd);           // Command (0xE5 or 0xE3)
    
    I2C_RepeatedStart();     // Sr
    I2C_Send(0x81);          // Address + Read (1)
    
    // During this phase, SHT21 holds SCL low.
    // The PIC's MSSP hardware automatically waits.
    msb = I2C_Receive(1);    // Read Data (MSB), send ACK
    lsb = I2C_Receive(0);    // Read Data (LSB) + Stat, send NACK (Skip checksum)
    I2C_Stop();              // P
    
    // Combine into 16-bit word
    raw_data = ((unsigned int)msb << 8) | lsb;
    
    return raw_data;
}

// --- Main Program ---

void main(void) { 
    // Port Initialization
    PORTB = 0x00;
    PORTC = 0x00;
    PORTD = 0x00;
    
    TRISB = 0x00; // LCD Data (Outputs)
    TRISC = 0x18; // RC3/RC4 I2C (Inputs)
    TRISD = 0x00; // LCD Control (Outputs)
    
    delay(100); // Give SHT21 100ms to power up
    
    init_I2C_Master();  
    initLCD();
    
    for(;;) {  
        // ==========================================
        // 1. Humidity (Fig 4 & Manual Formula)
        // ==========================================
        unsigned int raw_rh_16 = read_SHT21(0xE5); 
        
        // Mask status bits & shift right 2 to extract the 14-bit resolution value (S_RH)
        unsigned int s_rh = (raw_rh_16 & 0xFFFC) >> 2; 
        
        // Integer Math Formula: RH = -6 + (125 * S_RH) / 16384
        unsigned long rh_calc = (125UL * s_rh) / 16384UL;
        int rh_int = (int)rh_calc - 6;
        
        if (rh_int < 0) rh_int = 0; // Prevent negative display
        
        // ==========================================
        // 2. Temperature (Fig 4 & Manual Formula)
        // ==========================================
        unsigned int raw_t_16 = read_SHT21(0xE3);  
        
        // Mask status bits & shift right 2 to extract the 14-bit resolution value (S_T)
        unsigned int s_t = (raw_t_16 & 0xFFFC) >> 2;
        
        // Integer Math Formula (Scaled by 10 for 1 decimal place)
        // T_x10 = -468 + (1757 * S_T) / 16384
        unsigned long t_calc = (1757UL * s_t) / 16384UL;
        int temp_x10 = (int)t_calc - 468;
        
        int t_int = temp_x10 / 10;
        int t_frac = temp_x10 % 10;
        if (t_frac < 0) t_frac = -t_frac; // Absolute value for decimal
        
        // ==========================================
        // 3. Update LCD Display
        // ==========================================
        
        // Line 1: "Humidity: 90%"
        instCtrl(0x80); 
        printString("Humidity: ");
        printNumber((unsigned int)rh_int);
        printString("%    "); 
        
        // Line 2: "Temperature: 25.3 C"
        instCtrl(0xC0); 
        printString("Temperature: ");
        if (t_int < 0) {
            printString("-");
            printNumber((unsigned int)(-t_int));
        } else {
            printNumber((unsigned int)t_int);
        }
        printString(".");
        printNumber((unsigned int)t_frac);
        printString(" C  "); 
        
        delay(80); // Wait before next measurement
    } 
}