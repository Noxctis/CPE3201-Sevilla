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
    while((SSPCON2 & 0x1F) || (SSPSTAT & 0x04));   
} 

void init_I2C_Master(void) {  
    TRISC3 = 1;      
    TRISC4 = 1;      
    SSPCON = 0x28;   
    SSPCON2 = 0x00;  
    SSPSTAT = 0x00;  
    SSPADD = 0x09;   
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
    I2C_Wait(); 
} 

unsigned char I2C_Receive(unsigned char ack) { 
    unsigned char temp; 
    I2C_Wait();    
    RCEN = 1;      
    I2C_Wait();    
    temp = SSPBUF; 
    I2C_Wait();    
    ACKDT = (ack) ? 0 : 1; 
    ACKEN = 1;     
    return temp;  
} 

// --- SHT21 Sensor Function ---

unsigned int read_SHT21(unsigned char cmd) {
    unsigned char msb, lsb;
    unsigned int raw_data;

    I2C_Start();             
    I2C_Send(0x80);          
    I2C_Send(cmd);           
    
    I2C_RepeatedStart();     
    I2C_Send(0x81);          
    
    msb = I2C_Receive(1);    
    lsb = I2C_Receive(0);    
    I2C_Stop();              
    
    raw_data = ((unsigned int)msb << 8) | lsb;
    
    return raw_data;
}

// --- Main Program ---

void main(void) { 
    PORTB = 0x00;
    PORTC = 0x00;
    PORTD = 0x00;
    
    TRISB = 0x00; 
    TRISC = 0x18; 
    TRISD = 0x00; 
    
    delay(100); 
    
    init_I2C_Master();  
    initLCD();
    
    for(;;) {  
        // ==========================================
        // 1. Humidity (Strict Truncation - Drop Decimal)
        // ==========================================
        unsigned int raw_rh_16 = read_SHT21(0xE5); 
        raw_rh_16 &= 0xFFFC; 
        
        // No mathematical rounding added. The bit shift strictly chops the decimal.
        // 90.86% goes straight to 90.
        int rh_int = (int)(((125L * (long)raw_rh_16)) >> 16) - 6;
        
        if (rh_int <= 0) rh_int = 0; 
        if (rh_int > 100) rh_int = 100;
        
        // ==========================================
        // 2. Temperature (Rounded to Nearest Integer)
        // ==========================================
        unsigned int raw_t_16 = read_SHT21(0xE3);  
        raw_t_16 &= 0xFFFC; 
        
        long t_100 = (((17572L * (long)raw_t_16) + 32768L) >> 16) - 4685L;
        
        int t_int;
        if (t_100 >= 0) {
            t_int = (int)((t_100 + 50L) / 100L); 
        } else {
            t_int = (int)((t_100 - 50L) / 100L); 
        }
        
        // ==========================================
        // 3. Update LCD Display
        // ==========================================
        instCtrl(0x80); 
        printString("Humidity: ");
        printNumber((unsigned int)rh_int);
        printString("%    "); 
        
        instCtrl(0xC0); 
        printString("Temp: ");
        
        if (t_int < 0) {
            printString("-");
            printNumber((unsigned int)(-t_int));
        } else {
            printNumber((unsigned int)t_int);
        }
        
        printString(" C    "); 
        
        delay(150); 
    } 
}