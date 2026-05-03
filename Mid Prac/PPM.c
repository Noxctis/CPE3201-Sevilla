
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

// --- LCD Control Pin Mapping (Mapped to PORTA based on your code) ---
#define RS RA0
#define EN RA1
#define RW RA2

// --- Global Variables ---
int numOfPeople = 0;    
int num = 0;            
int count = 0;          
int reset = 0;          
int minute = 0;         
int second = 0;         
int deciSecond = 0;     
float totalTime = 0.0;  
int stopFlag = 0;       

// --- Interrupt Service Routine ---
void interrupt ISR(void) 
{
    GIE = 0; 

    // 1. External Interrupt (RB0) - People Counter
    if(INTF == 1) 
    { 
        INTF = 0; 
        if(numOfPeople <= 100) 
        {    
            numOfPeople++;           
        }       
    }   
    
    // 2. Timer0 Interrupt - Time Tracking (1:32 Prescaler)
    if(T0IF == 1) 
    { 
        T0IF = 0;   
        count++;    
        num++;      

        // ~0.1 seconds elapsed
        if(count == 12) 
        {  
            totalTime = totalTime + 0.1; 
            count = 0;                   
            
            if(deciSecond == 9) deciSecond = 0;  
            else deciSecond++;                   

            stopFlag = 1; // Trigger LCD update
        }

        // ~1.0 seconds elapsed
        if(num >= 122) 
        {
            if(second == 59) 
            {
                minute++;  
                second = 0; 
            }
            else 
            {
                second++;   
            }
            num = 0;
        }
    }

    // 3. CCP1 Interrupt - Double-click detection for reset
    if(CCP1IF == 1) 
    { 
        CCP1IF = 0; 
        if(TMR1ON == 1)
        {
            // Reset if SW2 is pressed twice within 500ms
            numOfPeople = 0;        
            totalTime = 0;
            deciSecond = 0;
            second = 0;
            minute = 0;
            reset = 1;

            TMR1ON = 0; // Turn off Timer1
        }
        else 
        {
            TMR1 = 0x0BDC;  // Counter starts at 3036
            TMR1ON = 1;     // Turn on Timer1
        }
    }
    
    // 4. Timer1 Interrupt - 500ms Timeout
    if(TMR1IF == 1) 
    { 
        TMR1IF = 0; 
        TMR1ON = 0; // Turn off Timer1
    }

    GIE = 1; 
}

// --- Precise Hardware Delay ---
void delay(unsigned int ms){
    while(ms--) {
        __delay_ms(1); 
    }
}

// --- LCD Control Functions ---
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

void initLCD(void){
    delay(20);      
    instCtrl(0x38); // 8-bit, 2-line, 5x7 font
    instCtrl(0x08); // Display OFF
    instCtrl(0x01); // Clear Display
    delay(2);       
    instCtrl(0x06); // Auto-increment cursor
    instCtrl(0x0C); // Display ON, Cursor OFF
}

// --- Custom Print Functions ---
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
    // [C90 STANDARD] Variables declared at the top
    float tempTime = 0;
    int tempMinute = 0;
    int tempSecond = 0;
    int tempDeciSecond = 0;
    
    float result = 0;
    unsigned int ppm_whole = 0;
    unsigned int ppm_decimal = 0;
    
    // --- I/O Setup ---
    ADCON1 = 0x06;      // Set PORTA as digital I/O
    TRISA  = 0x00;      // PORTA output (RS, EN, RW)
    TRISB  = 0x01;      // RB0 input (Button), rest output
    TRISC  = 0x04;      // RC2 input (CCP1 Capture)
    TRISD  = 0x00;      // PORTD output (LCD Data Bus)
    
    PORTA = 0x00;
    PORTB = 0x00;
    PORTC = 0x00;
    PORTD = 0x00;
    
    // --- Timer1 Setup (500ms Window) ---
    T1CON = 0x30;       // 1:8 prescaler, internal clock, Timer1 off
    TMR1IE = 1;         
    TMR1IF = 0;         
    
    // --- CCP1 Setup (Capture Mode) ---
    CCP1CON = 0x05;     // Capture mode: every rising edge
    CCP1IE = 1;         
    CCP1IF = 0;         
    TMR1ON = 1;         
    
    // --- Interrupt & Timer0 Setup ---
    INTE = 1;           // Enable RB0 external interrupt 
    INTF = 0;
    OPTION_REG = 0x44;  // Rising edge (INTEDG), Prescaler 1:32 assigned to TMR0
    T0IE = 1;           // Enable TMR0 interrupt
    T0IF = 0;           
    
    PEIE = 1;           
    GIE = 1;            
    
    // --- LCD Initial Text Setup ---
    initLCD();                              
    instCtrl(0x80); // Move to Row 1                         
    printString("Count:");
    
    instCtrl(0xC0); // Move to Row 2                      
    printString("PPM  :");
    
    instCtrl(0x94); // Move to Row 3 (for 4x20 displays)
    printString("Time :");

    for(;;) 
    {   
        if(stopFlag) 
        {                       
            stopFlag = 0;                   
            
            // Snapshot variables
            tempTime = totalTime;           
            tempMinute = minute;            
            tempSecond = second;            
            tempDeciSecond = deciSecond;    

            // --- 1. Print People Counter ---
            instCtrl(0x87); // Row 1, Column 7                             
            printNumber(numOfPeople);         
            printString("   "); // Padding to clear old digits
            
            // --- 2. Print PPM (Using the Math Split trick) ---
            if (tempTime > 0.0) {
                result = (60.0 / tempTime) * (float)numOfPeople;  
            } else {
                result = 0.0;
            }
            
            // Split Float into Whole and Decimal for printNumber()
            ppm_whole = (unsigned int)result;
            ppm_decimal = (unsigned int)((result - ppm_whole) * 100);

            instCtrl(0xC7); // Row 2, Column 7                                 
            printNumber(ppm_whole);
            dataCtrl('.');
            if (ppm_decimal < 10) dataCtrl('0'); // Leading zero for decimal
            printNumber(ppm_decimal);
            printString("   "); 
                
            // --- 3. Print Time (MM:SS.D) ---
            instCtrl(0x9B); // Row 3, Column 11                                                     
            
            if (tempMinute < 10) dataCtrl('0'); // Leading zero for minutes
            printNumber(tempMinute);
            
            dataCtrl(':');
            
            if (tempSecond < 10) dataCtrl('0'); // Leading zero for seconds
            printNumber(tempSecond);
            
            dataCtrl('.');
            
            printNumber(tempDeciSecond);                                                             
        }
    }
}