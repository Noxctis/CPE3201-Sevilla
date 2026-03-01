/**
 * @file PA2-2.c
 * @author cssevilla
 * @date 2026-03-1
 * @brief Main function
 */

#include <xc.h> // include file for the XC8 compiler 

#pragma config FOSC = XT   // oscillator selection
#pragma config WDTE = OFF  // watchdog timer disabled
#pragma config PWRTE = ON  // power-up timer enabled
#pragma config BOREN = ON  // brown-out reset enabled
#pragma config LVP = OFF   // low-voltage programming disabled
#pragma config CPD = OFF   // data EEPROM code protection disabled
#pragma config WRT = OFF   // flash program memory write protection off
#pragma config CP = OFF    // code protection off

const unsigned char ledMap[16] = {
    1,   // 0x00 -> key '1' -> 0001
    2,   // 0x01 -> key '2' -> 0010
    3,   // 0x02 -> key '3' -> 0011
    0,   // 0x03 -> key 'A' (4th col, unused in 3x4)
    4,   // 0x04 -> key '4' -> 0100
    5,   // 0x05 -> key '5' -> 0101
    6,   // 0x06 -> key '6' -> 0110
    0,   // 0x07 -> key 'B' (4th col, unused in 3x4)
    7,   // 0x08 -> key '7' -> 0111
    8,   // 0x09 -> key '8' -> 1000
    9,   // 0x0A -> key '9' -> 1001
    0,   // 0x0B -> key 'C' (4th col, unused in 3x4)
    15,  // 0x0C -> key '*' -> 1111
    0,   // 0x0D -> key '0' -> 0000
    15,  // 0x0E -> key '#' -> 1111
    0    // 0x0F -> key 'D' (4th col, unused in 3x4)
};

int main(void) {
    TRISA = 0x00;  // PORTA as output for LEDs (RA3:RA0)
    TRISD = 0xFF;  // PORTD as input: RD3:RD0 = keypad data, RD4 = DAVBL

    PORTA = 0x00;  // LEDs off initially

    while (1) {
        if (RD4) {                          // DAVBL = 1: a key is pressed
            unsigned char key = PORTD & 0x0F; // read lower 4 bits (74C922 address)
            while (RD4);                    // wait for key release (DAVBL goes low)
            PORTA = ledMap[key];            // display mapped value on LEDs
        }
    }

    return 0;
}
