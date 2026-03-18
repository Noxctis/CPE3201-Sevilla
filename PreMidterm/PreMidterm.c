/**
 * @file main.c
 * @author cssevilla
 * @date 2026-03-01
 * @brief Main function
 */

#include<xc.h> // include file for the XC8 compiler 

#define _XTAL_FREQ 4000000 // Define oscillator frequency for delay functions
#define COUNTER_MAX 14     // Maximum counter value before reset
#define DELAY_05SEC 61     // Timer0 overflows for ~1 second delay (prescaler 1:32)
 
 #pragma config FOSC = XT // oscillator selection
 #pragma config WDTE = OFF // watchdog timer disabled
 #pragma config PWRTE = ON // power-up timer enabled
 #pragma config BOREN = ON // brown-out reset enabled
 #pragma config LVP = OFF // low-voltage programming disabled
 #pragma config CPD = OFF // data EEPROM code protection disabled
 #pragma config WRT = OFF // flash program memory write protection off
 #pragma config CP = OFF // code protection off

volatile __bit myINTF = 0;    // Flag set when external interrupt occurs
 volatile __bit myTMR0IF = 0;  // Flag set when Timer0 overflows
volatile unsigned char counter = 0x00;  // Shared by ISR and main loop



 // In your header file (.h) or at the top of main.c
void initLCD();
void instCtrl(unsigned char cmd);
void delay(unsigned int ms);
void dataCtrl(unsigned char data);


void instCtrl(unsigned char cmd){
    PORTC = cmd; // Send command to PORTB
    RB5 = 0; // RS = 0 for command
    RB6 = 0; // RW = 0 for write
    RB7 = 1; // E = 1 to latch command
    delay(1);
    RB7 = 0; // E = 0 to complete command
}

void initLCD(){
    // Initialize LCD in 4-bit mode
    delay(1);
    instCtrl(0x38); // Function set: 8-bit, 2 lines, 5x8 dots
    instCtrl(0x08); // Display off, cursor off
    instCtrl(0x01); // Clear display
    instCtrl(0x06); // Entry mode set: increment cursor, no shift
    instCtrl(0x0C); // Display on, cursor on, blinking on
}

void dataCtrl(unsigned char data){
    PORTC = data; // Send data to PORTB
    RB5 = 1; // RS = 1 for data
    RB6 = 0; // RW = 0 for write
    RB7 = 1; // E = 1 to latch data
    delay(1);
    RB7 = 0; // E = 0 to complete data write
}

void delay(unsigned int ms){
    // Simple delay function (not accurate)
    unsigned int i, j;
    for(i = 0; i < ms; i++){
        for(j = 0; j < 1000; j++);
    }
}


void delay1(unsigned int ms) {
    unsigned int of_counter = 0;
    while(of_counter < ms) {
        if(myTMR0IF) {
            myTMR0IF = 0;
            of_counter++;
        }
    }
}\

void interrupt ISR(void){
    GIE = 0; // Disable global interrupts to prevent nested interrupts
    // Handle external interrupt (RB0/INT pin)
    if(INTF){

        INTF = 0;  // Clears interrupt flag
        myINTF = 1;

    

    } 
    

    // Handle Timer0 overflow
    if (TMR0IF) {
        TMR0IF = 0;     // Clear hardware Timer0 flag
        myTMR0IF = 1;   // Set software flag for delay function
    }
    GIE = 1; // Re-enable global interrupts

 
}


// 3x4 keypad mapping table (MM74C922 outputs 0-15 linearly)
const char keypad[] = "123 456 789 *0# ";


int main(void){

    TRISB = 0x0F; // set PORTB as output for LCD data
    TRISC = 0x00; // set PORTC as output for LCD control signals
    TRISD = 0xFF; // set PORTD as input: RD3:RD0 = keypad data, RD4 = DAVBL


OPTION_REG = 0xC4;

 INTF = 0;     // Clear external interrupt flag
    INTE = 1;     // Enable external interrupt (RB0/INT)
    TMR0 = 0;     // Clear Timer0
    TMR0IE = 1;   // Enable Timer0 overflow interrupt
    GIE = 1;      // Enable global interrupts

    initLCD();


    while(1){
            unsigned char key = PORTD & 0x0F; // read lower 4 bits (74C922 address)
            while(RD4); // wait for key release
                
            delay(2);       // clear command needs extra delay (~1.64ms)
 			instCtrl(0xC7); // move cursor to line 2
				
			dataCtrl('T');
			dataCtrl('I'); 
			dataCtrl('M'); 
			dataCtrl('E'); 
			dataCtrl('R'); 

			instCtrl(0x9D); // move cursor to line 3
			
			

if (counter == 0x00) {dataCtrl('0');dataCtrl(' ');}
else if (counter == 0x01) {dataCtrl('1');dataCtrl(' ');}
else if (counter == 0x02) {dataCtrl('2');dataCtrl(' ');}
else if (counter == 0x03) {dataCtrl('3');dataCtrl(' ');}
else if (counter == 0x04) {dataCtrl('4');dataCtrl(' ');}
else if (counter == 0x05) {dataCtrl('5');dataCtrl(' ');}
else if (counter == 0x06) {dataCtrl('6');dataCtrl(' ');}
else if (counter == 0x07) {dataCtrl('7');dataCtrl(' ');}
else if (counter == 0x08) {dataCtrl('8');dataCtrl(' ');}
else if (counter == 0x09) {dataCtrl('9');dataCtrl(' ');}
else if (counter == 0x0A) {dataCtrl('1');dataCtrl('0');}
else if (counter == 0x0B) {dataCtrl('1');dataCtrl('1');}
else if (counter == 0x0C) {dataCtrl('1');dataCtrl('2');}
else if (counter == 0x0D) {dataCtrl('1');dataCtrl('3');}
else if (counter == 0x0E) {dataCtrl('1');dataCtrl('4');}			

			if(myINTF) {
            //myINTF = 0;  // Clear software flag
            
            // Increment counter
            counter++;
	
            // Reset counter if it reaches maximum
            if(counter > COUNTER_MAX) {
                counter = 0;
            }
            
            // Delay for debouncing and visual feedback
            delay(DELAY_05SEC);
			if(keypad[key]=='0'){
			counter+=2;
}
else if(
        }
    }

    return 0;
}
