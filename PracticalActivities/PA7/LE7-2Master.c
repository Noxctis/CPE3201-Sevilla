#include <xc.h>

#pragma config FOSC = XT   
#pragma config WDTE = OFF  
#pragma config PWRTE = ON  
#pragma config BOREN = ON  
#pragma config LVP = OFF   
#pragma config CPD = OFF   
#pragma config WRT = OFF   
#pragma config CP = OFF    

#define _XTAL_FREQ 4000000 

void I2C_Wait(void) 
{ 
    while((SSPCON2 & 0x1F) || (SSPSTAT & 0x04));   
} 

void init_I2C_Master(void) 
{  
    TRISC3 = 1;      
    TRISC4 = 1;      
    SSPCON = 0x28;   
    SSPCON2 = 0x00;  
    SSPSTAT = 0x00;  
    SSPADD = 0x09;   
} 

void I2C_Start(void) 
{ 
    I2C_Wait(); 
    SEN = 1;    
} 

void I2C_Stop(void) 
{ 
    I2C_Wait(); 
    PEN = 1;    
} 

void I2C_Send(unsigned char data)
{ 
    I2C_Wait(); 
    SSPBUF = data;  
} 

unsigned char I2C_Receive(unsigned char ack) 
{ 
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

void main(void) 
{ 
    TRISB = 0x00;   
    PORTB = 0x00;   
    TRISD = 0xFF;       
    
    init_I2C_Master();  
    
    for(;;) 
    {  
        // Master Write Operation
        I2C_Start();     
        I2C_Send(0x10);  
        I2C_Send(PORTD); 
        I2C_Stop();      
        
        __delay_ms(200); 

        // Master Read Operation
        I2C_Start();     
        I2C_Send(0x11);  
        PORTB = I2C_Receive(0); 
        I2C_Stop();      
        
        __delay_ms(200); 
    } 
}