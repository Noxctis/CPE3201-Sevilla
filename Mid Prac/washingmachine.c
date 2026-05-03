
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
#define RS RA0
#define EN RA1
#define RW RA2

// Mapped based on actual code logic, overriding confusing original comments
#define BUZZER     RC4
#define WATER_PUMP RC5
#define SOAP_PUMP  RC6

// --- Global Variables ---
int step = 0;       // 0 = idle, 1 = menu, 2 = pump, 3 = end
int coins = 0;      // Number of 5-peso coins inserted
int mode = 0;       // 0 = Water, 1 = Soap
int count = 0;      // Timer0 overflow counter
int second = 0;     // Seconds tracker
int pause = 0;      // Pause flag
int reset = 0;      // Reset/Terminate flag
int verify = 0;     // Verify termination flag

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

void initLCD(void){
    delay(20);      
    instCtrl(0x38); // 8-bit, 2-line, 5x7 font
    instCtrl(0x08); // Display OFF
    instCtrl(0x01); // Clear Display
    delay(2);       
    instCtrl(0x06); // Auto-increment cursor
    instCtrl(0x0C); // Display ON, Cursor OFF
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

// --- Display Screens (Replaces massive array logic) ---
void startDisplay() {
    instCtrl(0x01); 
    instCtrl(0x87); printString("INSERT");
    instCtrl(0xC7); printString("5 PESO");
    instCtrl(0x9B); printString("-COIN-");
}

void coinsDisplay() {
    instCtrl(0x01); 
    instCtrl(0x86); printString("CAR WASH");
    instCtrl(0xC3); printString("TOTAL: Php ");
    instCtrl(0x97); printString("WATER:      s   L");
    instCtrl(0xD7); printString("SOAP :      s");
}

void waterDisplay() {
    instCtrl(0x01); 
    instCtrl(0x85); printString("WATER PUMP");
    instCtrl(0xC3); printString("REMAINING:");
    instCtrl(0x97); printString("VOLUME:      mL");
    instCtrl(0xD7); printString("TIME:      s");
}

void soapDisplay() {
    instCtrl(0x01); 
    instCtrl(0x81); printString("~~~~SOAPY PUMP~~~~");
    instCtrl(0xC3); printString("REMAINING:");
    instCtrl(0x97); printString("TIME:      s");
}

void endDisplay() {
    instCtrl(0x01); 
    instCtrl(0xC5); printString("TIME IS UP");
}

void stopDisplay() {
    instCtrl(0x01); 
    instCtrl(0xC2); printString("ACTION TERMINATED");
}

// --- Interrupt Service Routine ---
void interrupt ISR(void) {
    GIE = 0;

    // 1. Insert 5 Peso Coin (RB0)
    if(INTF == 1) {
        INTF = 0;
        if (step == 0) step = 1;
        if ((step == 0 || step == 1) && coins < 20) {
            coins++;
        }
    }
    
    // 2. Mode / Pause Button (RB4-RB7 Change)
    if(RBIF == 1){
        unsigned char dummy = PORTB; // MUST read PORTB to clear mismatch condition
        RBIF = 0;
        
        if(RB4 == 1 && step == 1) {
            if(mode == 0) mode = 1;
            else if(mode == 1) mode = 0;
        }
        else if(RB4 == 1 && step == 2) {
            if(pause == 0) pause = 1;
            else if(pause == 1) pause = 0;
        }
    }
    
    // 3. Start / Stop Button Double-Click (CCP1)
    if(CCP1IF == 1) { 
        CCP1IF = 0; 
        if(step == 1 || step == 2) {
            if(step == 1) verify = 1; 

            if(TMR1ON == 1){
                reset = 1; 
                TMR1ON = 0; 
            }
            else {
                TMR1 = 0x0BDC; // 3036 pre-load for 500ms @ 4MHz (1:8 prescaler)
                TMR1ON = 1; 
            }
        }
    }
    
    // 4. Timer0 1-Second Generator
    if(T0IF == 1) { 
        T0IF = 0; 
        if (pause == 0) {
            count++; 
            if(count >= 122) { // 122 overflows of 1:32 prescaler = ~1 sec
                second++;
                count = 0;
            }
        }
    }

    // 5. Timer1 Overflow (500ms double-click timeout)
    if(TMR1IF == 1) { 
        TMR1IF = 0; 
        TMR1ON = 0; 
    }

    GIE = 1;
} 

// --- Main Program ---
void main(void) {
    // [C90 STANDARD] All variables declared at the absolute top
    int total = 0;
    int wtime = 0;
    int stime = 0;
    int liter = 0;
    int totalSeconds = 0;
    int totalVolume = 0;

    // --- I/O Setup ---
    ADCON1 = 0x06;      // PORTA as digital I/O
    TRISA  = 0x00;      // PORTA output (LCD Control)
    TRISB  = 0x11;      // RB0 & RB4 input, rest output
    TRISC  = 0x04;      // RC2 input (CCP1), rest output
    TRISD  = 0x00;      // PORTD output (LCD Data)
    
    PORTA = 0x00;
    PORTB = 0x00;
    PORTC = 0x00;
    PORTD = 0x00;
    
    BUZZER = 0;
    WATER_PUMP = 0;
    SOAP_PUMP = 0;

    // --- Timer1 Setup (500ms timeout) ---
    T1CON = 0x30;       // 1:8 prescaler, Timer1 off
    TMR1IE = 1;         
    TMR1IF = 0;         
    
    // --- CCP1 Setup (Capture Mode) ---
    CCP1CON = 0x05;     // Capture on rising edge
    CCP1IE = 1;         
    CCP1IF = 0;         
    TMR1ON = 1;         
    
    // --- Interrupt & Timer0 Setup ---
    OPTION_REG = 0x44;  // Rising edge INT, Prescaler 1:32 to TMR0
    INTE = 1;           // Enable RB0 interrupt 
    INTF = 0;
    T0IE = 1;           // Enable TMR0 interrupt
    T0IF = 0;           
    RBIE = 1;           // Enable RB4-RB7 change interrupt
    RBIF = 0;           
    
    PEIE = 1; 
    GIE = 1; 
    
    initLCD(); 
    
    for(;;) {
        startDisplay(); 
        
        for(;;){
            // --- STEP 1: MENU SCREEN ---
            if (step == 1){
                coinsDisplay(); 
                
                while(step == 1 && reset == 0){
                    // Show '>' pointer to active mode
                    if (mode == 0) {
                        instCtrl(0xD4); dataCtrl(' ');
                        instCtrl(0x94); dataCtrl('>');
                    } else {
                        instCtrl(0x94); dataCtrl(' ');
                        instCtrl(0xD4); dataCtrl('>');
                    } 

                    // Display Calculations
                    total = coins * 5;
                    instCtrl(0xCE); printNumber(total); printString("  "); 
                    
                    wtime = 80 * coins;
                    instCtrl(0x9E); printNumber(wtime); printString("   "); 

                    liter = 4 * coins;
                    instCtrl(0xA4); printNumber(liter); printString("  "); 

                    stime = 15 * coins;
                    instCtrl(0xDE); printNumber(stime); printString("  "); 
                    
                    // Start Verification Wait (2 Seconds)
                    if (verify == 1) {
                        second = 0;
                        step = 2;
                        while(second != 2) { 
                            if(reset == 1) {
                                verify = 0; 
                                step = 1;
                                break;
                            }
                        }
                    }
                    if (reset == 1) break; 
                }
            }
            
            // --- STEP 2: WATER PUMP ---
            if (step == 2 && mode == 0){
                second = 0;                     
                waterDisplay();                 
                totalSeconds = 80 * coins;      
                totalVolume = 4000 * coins;     
                
                while(step == 2 && reset == 0){ 
                    WATER_PUMP = (pause == 0) ? 1 : 0;
                    
                    liter = totalVolume - (50 * second); 
                    instCtrl(0x9E); 
                    printNumber(liter); 
                    printString("   "); 

                    wtime = totalSeconds - second; 
                    instCtrl(0xDE); 
                    if(wtime < 10) dataCtrl('0'); // Padding for single digits
                    printNumber(wtime); 
                    printString("   "); 
                    
                    if (wtime <= 0) {
                        step = 3;
                        break;  
                    }
                }
                WATER_PUMP = 0; 
            }

            // --- STEP 2: SOAP PUMP ---
            else if (step == 2 && mode == 1){
                second = 0;     
                soapDisplay();  
                totalSeconds = 15 * coins;  
                
                while(step == 2 && reset == 0){ 
                    SOAP_PUMP = (pause == 0) ? 1 : 0;
                
                    stime = totalSeconds - second;          
                    instCtrl(0x9E); 
                    if(stime < 10) dataCtrl('0'); 
                    printNumber(stime); 
                    printString("   "); 
        
                    if (stime <= 0) {
                        step = 3;
                        break;  
                    }
                }
                SOAP_PUMP = 0; 
            } 
            
            // --- RESET / REFUNDING ---
            if (reset == 1) {
                stopDisplay(); 
                
                if (step == 1) {
                    instCtrl(0xC2); 
                    printString("REFUNDING Php   ");
                    instCtrl(0xD0); 
                    printNumber(total); 
                }

                pause = 0;  
                second = 0; 
                
                // Animated Loading Bar
                while(second <= 5) {
                    if(second == 1) { instCtrl(0x94); printString("****"); }  
                    if(second == 2) { instCtrl(0x98); printString("****"); }
                    if(second == 3) { instCtrl(0x9C); printString("****"); }  
                    if(second == 4) { instCtrl(0xA0); printString("****"); }
                    if(second == 5) { instCtrl(0xA4); printString("****"); }
                    
                    if(second > 4) BUZZER = 1; 
                }
                
                BUZZER = 0;
                reset = 0;
                mode = 0;
                step = 0;
                coins = 0;
                verify = 0;
                break;
            }
            
            // --- STEP 3: TIME IS UP ---
            if (step == 3) {
                endDisplay();   
                pause = 0;      
                second = 0;     
                BUZZER = 1;     
                
                while (second != 5) {       
                    if (second > 1) BUZZER = 0; // Buzz only for 1s
                }
                
                step = 0;
                mode = 0;
                coins = 0;
                verify = 0;
                break;
            }
        }
    }
}