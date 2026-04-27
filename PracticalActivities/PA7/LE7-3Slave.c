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

void init_I2C_Slave(unsigned char slave_add) 
{  
    TRISC3 = 1;       
    TRISC4 = 1;       
    SSPCON = 0x36;    
    SSPCON2 = 0x01;   
    SSPSTAT = 0x80;   
    SSPADD = slave_add;  
    SSPIE = 1;        
    SSPIF = 0;        
    PEIE = 1;         
    GIE = 1;          
} 

void interrupt ISR(void) 
{  
    unsigned char temp;  
    
    CKP = 0;          
    
    if(WCOL || SSPOV) 
    { 
        temp = SSPBUF;  
        WCOL = 0;       
        SSPOV = 0;      
        CKP = 1;        
    } 

    if(!SSPSTATbits.D_nA && !SSPSTATbits.R_nW)      
    { 
        temp = SSPBUF; 
        while(!BF);    
        PORTB = SSPBUF;  
        CKP = 1;          
    } 
    else if(!SSPSTATbits.D_nA && SSPSTATbits.R_nW)  
    { 
        temp = SSPBUF;   
        BF = 0;          
        SSPBUF = PORTD;  
        CKP = 1;        
        while(BF);    
    } 
    
    SSPIF = 0;         
} 

void main(void) 
{ 
    TRISB = 0x00;   
    PORTB = 0x00;   
    TRISD = 0xFF;   
    
    init_I2C_Slave(0x10);  
    
    for(;;) 
    {  
        // Interrupt-driven; main loop remains empty
    } 
}