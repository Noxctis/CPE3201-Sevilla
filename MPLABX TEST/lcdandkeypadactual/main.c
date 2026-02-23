/**
 * @file main.c
 * @author cssevilla
 * @date 2026-02-23
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

int main(void){

    // Add your code here and press Ctrl + Shift + B to build

	TRISB = 0x00; // set PORTB as output for LCD data
	TRISC = 0x00; // set PORTC as output for LCD control signals
    TRISD = 0xFF; // set PORTD bits 0-7 as input (for keypad)

    initLCD();

    instCtrl(0x80) ; // Set cursor to the beginning of the first line
    dataCtrl(0x41); // Display 'A' on the first line
    
    return 0;
}
