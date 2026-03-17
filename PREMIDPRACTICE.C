#include <xc.h>

#pragma config FOSC  = XT
#pragma config WDTE  = OFF
#pragma config PWRTE = ON
#pragma config BOREN = ON
#pragma config LVP   = OFF
#pragma config CPD   = OFF
#pragma config WRT   = OFF
#pragma config CP    = OFF

unsigned int input;

void initLCD();
void instCtrl(unsigned char cmd);
void delay(unsigned int ms);
void dataCtrl(unsigned char data);

void instCtrl(unsigned char cmd){
    PORTB = cmd; // Send command to PORTB
    RC0 = 0;     // RS = 0 for command
    RC2 = 0;     // RW = 0 for write
    RC1 = 1;     // E = 1 to latch command
    delay(1);
    RC1 = 0;     // E = 0 to complete command
}

void initLCD(){
    // Note: 0x38 initializes the LCD in 8-bit mode, not 4-bit mode.
    delay(15);      // Give LCD time to boot up
    instCtrl(0x38); // Function set: 8-bit, 2 lines, 5x8 dots
    instCtrl(0x08); // Display off, cursor off
    instCtrl(0x01); // Clear display
    delay(2);       // Clearing display needs extra time
    instCtrl(0x06); // Entry mode set: increment cursor, no shift
    instCtrl(0x0C); // Display on, cursor off (changed from 0x0F to stop blinking)
}

void dataCtrl(unsigned char data){
    PORTB = data; // Send data to PORTB
    RC0 = 1;      // RS = 1 for data
    RC2 = 0;      // RW = 0 for write
    RC1 = 1;      // E = 1 to latch data
    delay(1);
    RC1 = 0;      // E = 0 to complete data write
}

void delay(unsigned int ms){
    // Simple delay function (not accurate)
    unsigned int i, j;
    for(i = 0; i < ms; i++){
        for(j = 0; j < 1000; j++);
    }
}

void main(void) {
    TRISB = 0x00; // PORTB as Output
    TRISC = 0x00; // PORTC as Output
    TRISD = 0xFF; // PORTD as Input

    initLCD();

    while(1) {
        instCtrl(0x01); // Clear display at the start of the loop
        delay(2);
        
        instCtrl(0x80);
        dataCtrl('H'); dataCtrl('O'); dataCtrl('W');
        
        instCtrl(0x84);
        dataCtrl('M'); dataCtrl('A'); dataCtrl('N'); dataCtrl('Y');

        instCtrl(0x89);
        dataCtrl('T'); dataCtrl('O');

        instCtrl(0x8C);	
        dataCtrl('P'); dataCtrl('R'); dataCtrl('I'); dataCtrl('N'); dataCtrl('T'); dataCtrl('?');

        instCtrl(0xC0); // Move to second line

        // 1. Wait until RD4 is pressed (goes HIGH)
        while(RD4 == 0); 
        
        delay(5); // Small debounce delay

        // 2. Read the keypad/input logic
        unsigned char key = PORTD & 0x0F;
        
        if      (key == 0x00){ dataCtrl('1'); input = 1; }
        else if (key == 0x01){ dataCtrl('2'); input = 2; }
        else if (key == 0x02){ dataCtrl('3'); input = 3; }
        else if (key == 0x04){ dataCtrl('4'); input = 4; }
        else if (key == 0x05){ dataCtrl('5'); input = 5; }
        else if (key == 0x06){ dataCtrl('6'); input = 6; }
        else if (key == 0x08){ dataCtrl('7'); input = 7; }
        else if (key == 0x09){ dataCtrl('8'); input = 8; }
        else if (key == 0x0A){ dataCtrl('9'); input = 9; }
        else if (key == 0x0D){ dataCtrl('0'); input = 0; }
        
        instCtrl(0x94);
        dataCtrl('P'); dataCtrl('R'); dataCtrl('I'); dataCtrl('N'); 
        dataCtrl('T'); dataCtrl('I'); dataCtrl('N'); dataCtrl('G');

        instCtrl(0x9D);
        dataCtrl('1');

        instCtrl(0x9F);
        dataCtrl('O'); dataCtrl('F');

        instCtrl(0xA2);
        // 3. Convert integer to ASCII before displaying
        dataCtrl(input + '0'); 
        
        // 4. Wait until the RD4 button is released before looping again
        while(RD4 == 1);
        delay(10); // Keep message on screen for a moment before restarting
    }
}