#include <xc.h>
#include <math.h>

#define _XTAL_FREQ 4000000

 #pragma config FOSC = XT // oscillator selection
 #pragma config WDTE = OFF // watchdog timer disabled
 #pragma config PWRTE = ON // power-up timer enabled
 #pragma config BOREN = ON // brown-out reset enabled
 #pragma config LVP = OFF // low-voltage programming disabled
 #pragma config CPD = OFF // data EEPROM code protection disabled
 #pragma config WRT = OFF // flash program memory write protection off
 #pragma config CP = OFF // code protection off


// ================= MOTOR PINS =================
#define AIN1 RD0
#define AIN2 RD1
#define BIN1 RD2
#define BIN2 RD3

#define LED  RD6

// ================= SPEED =================
#define BASE_SPEED 90

// ================= SENSOR DATA =================
unsigned int s[8];
unsigned int threshold[8];

// ================= MEMORY =================
signed char last_direction = 1;
unsigned char gap_counter = 0;

// ================= FUNCTION DECLARATIONS =================
void init_io(void);
void init_adc(void);
unsigned int read_adc(unsigned char ch);
void set_motors(int left, int right);

// ================= INIT =================
void init_io(void) {
    TRISA = 0xFF;
    TRISB = 0xFF;
    TRISC = 0x00;
    TRISD = 0x00;

    PORTD = 0x00;
}

void init_adc(void) {
    ADCON1 = 0x80;
    ADCON0 = 0x41;
}

// ================= ADC =================
unsigned int read_adc(unsigned char channel) {

    ADCON0 &= 0xC7;
    ADCON0 |= (channel << 3);

    __delay_us(20);
    GO_nDONE = 1;
    while(GO_nDONE);

    return ((unsigned int)ADRESH << 8) | ADRESL;
}

// ================= MOTOR =================
void set_motors(int left, int right) {

    if(left >= 0) {
        AIN1 = 1; AIN2 = 0;
    } else {
        AIN1 = 0; AIN2 = 1;
        left = -left;
    }

    if(right >= 0) {
        BIN1 = 1; BIN2 = 0;
    } else {
        BIN1 = 0; BIN2 = 1;
        right = -right;
    }

    if(left > 255) left = 255;
    if(right > 255) right = 255;

    CCPR1L = left;
    CCPR2L = right;
}

// ================= MAIN =================
void main(void) {

    unsigned char i;
    int left_motor, right_motor;

    init_io();
    init_adc();

    // ================= CALIBRATION =================
    for(i = 0; i < 8; i++) threshold[i] = 512;

    while(1) {

        // ================= READ SENSORS =================
        for(i = 0; i < 8; i++) {
            s[i] = read_adc(i);
        }

        // ================= NORMALIZED LINE POSITION =================
        // weights: -7 to +7 (center tracking)
        long sum = 0;
        long weighted = 0;

        for(i = 0; i < 8; i++) {

            if(s[i] > threshold[i]) {
                sum += 1;
                weighted += (i - 3); // center bias
            }
        }

        // ================= DETECT LINE =================
        if(sum == 0) {

            // ===== LOST LINE =====
            gap_counter++;

            if(last_direction == -1) {
                set_motors(-120, 120);
            } else {
                set_motors(120, -120);
            }

            if(gap_counter > 15) {

                if(last_direction == -1) {
                    set_motors(-180, 180);
                } else {
                    set_motors(180, -180);
                }
            }

            continue;
        }

        gap_counter = 0;

        // ================= CENTER CONTROL =================
        int error = weighted / sum;

        left_motor  = BASE_SPEED - (error * 25);
        right_motor = BASE_SPEED + (error * 25);

        // ================= MEMORY =================
        if(error < -1) last_direction = -1;
        if(error > 1)  last_direction = 1;

        set_motors(left_motor, right_motor);
    }
}