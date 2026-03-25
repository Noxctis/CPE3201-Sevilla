/**
 * @file main.c
 * @author cssevilla
 * @date 2026-03-01
 * @brief Main function
 */

#include <xc.h> // include file for the XC8 compiler

#define _XTAL_FREQ 4000000 // Oscillator frequency
#define COUNTER_MAX 14
#define DELAY_05SEC 61      // 61 Timer0 overflows at 1:32 and 4MHz is ~0.5s
#define INT_DEBOUNCE_TICKS 6

#pragma config FOSC = XT
#pragma config WDTE = OFF
#pragma config PWRTE = ON
#pragma config BOREN = ON
#pragma config LVP = OFF
#pragma config CPD = OFF
#pragma config WRT = OFF
#pragma config CP = OFF


volatile __bit myINTF = 0;    // Flag set when external interrupt occurs
volatile __bit myTMR0IF = 0;  // Flag set when Timer0 overflows

volatile unsigned char counter = COUNTER_MAX;
volatile __bit isPaused;                  // 1 = paused, 0 = running
volatile unsigned char tmr0Ticks = 0;     // Timer0 overflow accumulator
volatile unsigned char intDebounceTicks = 0;

// 3x4 keypad mapping table (MM74C922 outputs 0-15 linearly)
const char keypad[] = "123 456 789 *0# ";

void initLCD(void);
void instCtrl(unsigned char cmd);
void delay(unsigned int ms);
void dataCtrl(unsigned char data);
void showCounter(unsigned char value);
void showTimerCenter(void);

void instCtrl(unsigned char cmd) {
    PORTC = cmd; // Send command to PORTB
    RB5 = 0; // RS = 0 for command
    RB6 = 0; // RW = 0 for write
    RB7 = 1; // E = 1 to latch command
    delay(1);
    RB7 = 0; // E = 0 to complete command
}

void initLCD(void) {
    delay(1);
    instCtrl(0x38); // Function set: 8-bit, 2 lines, 5x8 dots
    instCtrl(0x08); // Display off, cursor off
    instCtrl(0x01); // Clear display
    instCtrl(0x06); // Entry mode set: increment cursor, no shift
    instCtrl(0x0C); // Display on, cursor on, blinking on
}

void dataCtrl(unsigned char data) {
    PORTC = data; // Send data to PORTB
    RB5 = 1; // RS = 1 for data
    RB6 = 0; // RW = 0 for write
    RB7 = 1; // E = 1 to latch data
    delay(1);
    RB7 = 0; // E = 0 to complete data write
}

void delay(unsigned int ms) {
    unsigned int i, j;
    for (i = 0; i < ms; i++) {
        for (j = 0; j < 1000; j++) {
        }
    }
}

void showCounter(unsigned char value) {
    instCtrl(0x9D); // center on second line
    dataCtrl((value / 10) + '0');
    dataCtrl((value % 10) + '0');
}

void showTimerCenter(void) {
    instCtrl(0xC7); // center "TIMER" on first line
    dataCtrl('T');
    dataCtrl('I');
    dataCtrl('M');
    dataCtrl('E');
    dataCtrl('R');
}

void interrupt ISR(void) {
    GIE = 0; // Disable global interrupts during ISR
    if (TMR0IF) {
        TMR0IF = 0;

        if (intDebounceTicks > 0) {
            intDebounceTicks--;
        }

        if (!isPaused) {
            tmr0Ticks++;
            if (tmr0Ticks >= DELAY_05SEC) {
                tmr0Ticks = 0;
                if (counter == 0) {
                    counter = COUNTER_MAX; // wrap 00 -> 14 during decrement operation
                } else {
                    counter--; // countdown step
                }
            }
        }
    }

    if (INTF) {
        INTF = 0;
        myINTF = 1;
        // Toggle only on valid press level (active-low with pull-up enabled).
        if ((intDebounceTicks == 0) && (RB0 == 0)) {
            isPaused = !isPaused; // start/pause toggle
            intDebounceTicks = INT_DEBOUNCE_TICKS;
        }
    }


    // Handle Timer0 overflow
    if (TMR0IF) {
        TMR0IF = 0;     // Clear hardware Timer0 flag
        myTMR0IF = 1;   // Set software flag for delay function
    }
}

int main(void) {
    unsigned char key;
    char kchar;
    unsigned char rd4Idle;

    // RB0 is external interrupt input. RB5-RB7 used for LCD control.
    TRISB = 0x0F;
    TRISC = 0x00;
    TRISD = 0xFF; // RD3:RD0 keypad code, RD4 DAVBL

    // RB pull-ups enabled, RB0/INT falling edge, Timer0 internal clock, prescaler 1:32
    OPTION_REG = 0x04;

    isPaused = 1;
    counter = COUNTER_MAX;
    tmr0Ticks = 0;
    intDebounceTicks = 0;

    INTF = 0;
    INTE = 1;
    TMR0IF = 0;
    TMR0 = 0;
    TMR0IE = 1;
    GIE = 1;

    initLCD();
    rd4Idle = RD4;

    while (1) {
        showTimerCenter();
        showCounter(counter);

        // Key actions only when paused. Capture a short click with quick confirm.
        if (RD4 != rd4Idle) {
            delay(2);
            if (RD4 != rd4Idle) {
                key = PORTD & 0x0F;
                kchar = keypad[key];

                if (isPaused) {
                    if (kchar == '0') {
                        counter = COUNTER_MAX;
                    } else if (kchar == '*') {
                        if (counter == 0) {
                            counter = COUNTER_MAX;
                        } else {
                            counter--;
                        }
                    } else if (kchar == '#') {
                        if (counter >= COUNTER_MAX) {
                            counter = 0;
                        } else {
                            counter++;
                        }
                    }

                    // Update display immediately after keypad edit while paused.
                    showCounter(counter);
                }

                while (RD4 != rd4Idle) {
                }
                delay(2);
            }
        }

        delay(1);
    }
}
