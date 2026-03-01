/**
 * @file main.c
 * @author cssevilla
 * @date 2026-03-01
 * @brief Main function
 */

#include<xc.h> // include file for the XC8 compiler 
 
 #pragma config FOSC = XT // oscillator selection
 #pragma config WDTE = OFF // watchdog timer disabled
 #pragma config PWRTE = ON // power-up timer enabled
 #pragma config BOREN = ON // brown-out reset enabled
 #pragma config LVP = OFF // low-voltage programming disabled
 #pragma config CPD = OFF // data EEPROM code protection disabled
 #pragma config WRT = OFF // flash program memory write protection off
 #pragma config CP = OFF // code protection off

 // In your header file (.h) or at the top of main.c
void initLCD();
void instCtrl(unsigned char cmd);
void delay(unsigned int ms);
void dataCtrl(unsigned char data);


void instCtrl(unsigned char cmd){
    PORTB = cmd; // Send command to PORTB
    RC0 = 0; // RS = 0 for command
    RC2 = 0; // RW = 0 for write
    RC1 = 1; // E = 1 to latch command
    delay(1);
    RC1 = 0; // E = 0 to complete command
}

void initLCD(){
    // Initialize LCD in 4-bit mode
    delay(1);
    instCtrl(0x38); // Function set: 8-bit, 2 lines, 5x8 dots
    instCtrl(0x08); // Display off, cursor off
    instCtrl(0x01); // Clear display
    instCtrl(0x06); // Entry mode set: increment cursor, no shift
    instCtrl(0x0F); // Display on, cursor on, blinking on
}

void dataCtrl(unsigned char data){
    PORTB = data; // Send data to PORTB
    RC0 = 1; // RS = 1 for data
    RC2 = 0; // RW = 0 for write
    RC1 = 1; // E = 1 to latch data
    delay(1);
    RC1 = 0; // E = 0 to complete data write
}

void delay(unsigned int ms){
    // Simple delay function (not accurate)
    unsigned int i, j;
    for(i = 0; i < ms; i++){
        for(j = 0; j < 1000; j++);
    }
}
// 3x4 keypad mapping table (MM74C922 outputs 0-15 linearly)
const char keypad[] = "123 456 789 *0# ";


int main(void){

    TRISB = 0x00; // set PORTB as output for LCD data
    TRISC = 0x00; // set PORTC as output for LCD control signals
    TRISD = 0xFF; // set PORTD as input: RD3:RD0 = keypad data, RD4 = DAVBL

    initLCD();

    unsigned char count = 0; // tracks characters written (0-79)

    while(1){
        if(RD4){ // DAVBL = 1: key is pressed
            unsigned char key = PORTD & 0x0F; // read lower 4 bits (74C922 address)
            while(RD4); // wait for key release

            if(count == 80){ // LCD full (20x4), clear and reset
                instCtrl(0x01); // clear display
                delay(2);       // clear command needs extra delay (~1.64ms)
                count = 0;
            }

            if(count == 20)       instCtrl(0xC0); // move cursor to line 2
            else if(count == 40)  instCtrl(0x94); // move cursor to line 3
            else if(count == 60)  instCtrl(0xD4); // move cursor to line 4

            dataCtrl(keypad[key]); // display key character on LCD
            count++;
        }
    }

    return 0;
}
