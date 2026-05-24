/**
 * @file LineFollower_Hardcoded.c
 * @brief 8-Sensor IR Array, No Calibration
 * Upgrades v19: Deep Search Sweeping for blind 90-degree dotted corners
 */

#include <xc.h>
#include <stdint.h>

// --- Configuration Bits ---
#pragma config FOSC = XT   
#pragma config WDTE = OFF  
#pragma config PWRTE = ON  
#pragma config BOREN = ON  
#pragma config LVP = OFF   
#pragma config CPD = OFF   
#pragma config WRT = OFF   
#pragma config CP = OFF    

#define _XTAL_FREQ 4000000     

// --- Hardware Pin Mapping ---
#define AIN2 PORTDbits.RD0      
#define AIN1 PORTDbits.RD1      
#define BIN2 PORTDbits.RD2      
#define BIN1 PORTDbits.RD3      
#define STBY PORTDbits.RD4      
#define LED  PORTBbits.RB0      

// ==========================================
// --- GLOBAL TUNING PARAMETERS ---
// ==========================================

unsigned char BASE_SPEED = 100;          

unsigned char WOBBLE_SPEED_OUTER = 115; 
unsigned char WOBBLE_SPEED_INNER = 85;  

unsigned char PIVOT_SPEED_OUTER = 200;  
unsigned char PIVOT_SPEED_INNER = 95;   

unsigned char CURVE_SPEED_OUTER = 170;  
unsigned char CURVE_SPEED_INNER = 70;   

unsigned int THRESHOLD_LEFT = 3050;   
unsigned int CURVE_LEFT = 2400;       
unsigned int PIVOT_LEFT = 1200;       

unsigned int THRESHOLD_RIGHT = 3950;  
unsigned int CURVE_RIGHT = 4600;      
unsigned int PIVOT_RIGHT = 5800;      

unsigned int BLACK_LINE_NOISE = 300;  

unsigned int COAST_TIME = 300; 
unsigned int SWEEP_TIME = 800;

// ==========================================

void System_Init(void);
unsigned int ADC_Read(unsigned char channel);
void setMotors(signed char leftDir, unsigned char leftSpeed, signed char rightDir, unsigned char rightSpeed);

void System_Init(void) {
    TRISCbits.TRISC1 = 0;       
    TRISCbits.TRISC2 = 0;       
    TRISD &= 0xE0;              
    TRISBbits.TRISB0 = 0;       
    
    PORTD &= 0xE0;              
    LED = 0;                    
    STBY = 1;                   

    TRISA |= 0x2F;              
    TRISE |= 0x07;              
    
    ADCON0 = 0x41;              
    ADCON1 = 0x80;              

    PR2 = 249;                  
    T2CON = 0b00000101;         
    CCP1CON = 0x0C;             
    CCP2CON = 0x0C;             
    CCPR1L = 0;                 
    CCPR2L = 0;                 
}

unsigned int ADC_Read(unsigned char channel) {
    ADCON0 &= 0xC5; 
    ADCON0 |= (channel << 3); 
    __delay_us(20);             
    GO_nDONE = 1;               
    while(GO_nDONE);            
    return ((ADRESH << 8) | ADRESL); 
}

void setMotors(signed char leftDir, unsigned char leftSpeed, signed char rightDir, unsigned char rightSpeed) {
    if (leftDir == 1)      { AIN1 = 1; AIN2 = 0; }
    else if (leftDir == -1){ AIN1 = 0; AIN2 = 1; }
    else                   { AIN1 = 0; AIN2 = 0; }

    if (rightDir == 1)      { BIN1 = 1; BIN2 = 0; }
    else if (rightDir == -1){ BIN1 = 0; BIN2 = 1; }
    else                   { BIN1 = 0; BIN2 = 0; }

    CCPR1L = leftSpeed;         
    CCPR2L = rightSpeed;        
}

void main(void) {
    unsigned int sensorValues[8];
    unsigned char i;
    unsigned long weighted_sum;
    unsigned long sum;
    unsigned int position = 3500;
    unsigned int active_sensors;
    unsigned int telemetry_timer = 0;
    
    unsigned int last_position = 3500; 
    unsigned int gap_timer = 0;

    System_Init();
    
    __delay_ms(1000); 

    for(;;) {
        weighted_sum = 0;
        sum = 0;
        active_sensors = 0;

        if (telemetry_timer % 20 == 0) LED = !LED;

        for (i = 0; i < 8; i++) {
            sensorValues[i] = ADC_Read(i);
            
            if (sensorValues[i] > BLACK_LINE_NOISE) { 
                weighted_sum += (unsigned long)sensorValues[i] * i * 1000;
                sum += sensorValues[i];
                active_sensors++;
            }
        }
        
        if (active_sensors >= 5) {
            if (sensorValues[0] > BLACK_LINE_NOISE) position = 0;       
            else if (sensorValues[7] > BLACK_LINE_NOISE) position = 7000;    
            else position = 3500;    
            last_position = position;
        }
        else if (active_sensors > 0) {
            position = (unsigned int)(weighted_sum / sum);
            last_position = position; 
        } 

        if (active_sensors > 0) {
            gap_timer = 0; 
            
            if (position < PIVOT_LEFT) { 
                setMotors(-1, PIVOT_SPEED_INNER, 1, PIVOT_SPEED_OUTER); 
            }
            else if (position < CURVE_LEFT) {
                setMotors(1, CURVE_SPEED_INNER, 1, CURVE_SPEED_OUTER);
            }
            else if (position < THRESHOLD_LEFT) { 
                setMotors(1, WOBBLE_SPEED_INNER, 1, WOBBLE_SPEED_OUTER); 
            }
            else if (position > PIVOT_RIGHT) { 
                setMotors(1, PIVOT_SPEED_OUTER, -1, PIVOT_SPEED_INNER); 
            }
            else if (position > CURVE_RIGHT) {
                setMotors(1, CURVE_SPEED_OUTER, 1, CURVE_SPEED_INNER);
            }
            else if (position > THRESHOLD_RIGHT) { 
                setMotors(1, WOBBLE_SPEED_OUTER, 1, WOBBLE_SPEED_INNER); 
            }
            else { 
                setMotors(1, BASE_SPEED, 1, BASE_SPEED);  
            }
        } 
        else {
            gap_timer++;

            if (gap_timer < COAST_TIME) {
                if (last_position > CURVE_LEFT && last_position < CURVE_RIGHT) {
                    setMotors(1, BASE_SPEED, 1, BASE_SPEED); 
                }
                else if (last_position <= CURVE_LEFT) {
                    setMotors(1, 0, 1, CURVE_SPEED_OUTER);
                }
                else {
                    setMotors(1, CURVE_SPEED_OUTER, 1, 0);
                }
            } 
            else if (gap_timer < SWEEP_TIME) {
                if (last_position >= 3500) {
                    setMotors(1, PIVOT_SPEED_OUTER, -1, PIVOT_SPEED_INNER); 
                } else {
                    setMotors(-1, PIVOT_SPEED_INNER, 1, PIVOT_SPEED_OUTER); 
                }
            }
            else if (gap_timer < (SWEEP_TIME * 2)) {
                if (last_position >= 3500) {
                    setMotors(-1, PIVOT_SPEED_INNER, 1, PIVOT_SPEED_OUTER); 
                } else {
                    setMotors(1, PIVOT_SPEED_OUTER, -1, PIVOT_SPEED_INNER); 
                }
            }
            else {
                setMotors(0, 0, 0, 0);
            }
        }

        telemetry_timer++;
        if (telemetry_timer >= 50) {
            telemetry_timer = 0; 
        }
    }
}