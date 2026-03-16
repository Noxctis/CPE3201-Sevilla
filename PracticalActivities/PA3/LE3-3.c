#include <xc.h>

#pragma config FOSC = XT
#pragma config WDTE = OFF
#pragma config PWRTE = ON
#pragma config BOREN = ON
#pragma config LVP = OFF
#pragma config CPD = OFF
#pragma config WRT = OFF
#pragma config CP = OFF

bit myINTF = 0;
bit myTMR0IF = 0;
unsigned char counter = 0x00;  // Global counter variable

void interrupt ISR (){
    GIE = 0;
    if(INTF){
        INTF = 0;  // Clears interrupt flag
        //myINTF ^= 1;  // Toggle flag

        // Check which key is pressed and update both PORTC and counter
        if(PORTD == 0x00) { PORTC = 0x01; counter = 0x01; }
        else if(PORTD == 0x01) { PORTC = 0x02; counter = 0x02; }
        else if(PORTD == 0x02) { PORTC = 0x03; counter = 0x03; }
        else if(PORTD == 0x04) { PORTC = 0x04; counter = 0x04; }
        else if(PORTD == 0x05) { PORTC = 0x05; counter = 0x05; }
        else if(PORTD == 0x06) { PORTC = 0x06; counter = 0x06; }
        else if(PORTD == 0x08) { PORTC = 0x07; counter = 0x07; }
        else if(PORTD == 0x09) { PORTC = 0x08; counter = 0x08; }
        else if(PORTD == 0x0A) { PORTC = 0x09; counter = 0x09; }
        else if(PORTD == 0x0D) { PORTC = 0x00; counter = 0x00; }

    } else if(TMR0IF){
        TMR0IF = 0;
        myTMR0IF = 1;
    }
    GIE = 1;
}

void delay(int count){
    int of_count = 0;
    while (of_count < count){
        if (myTMR0IF){
            of_count++;
            myTMR0IF = 0;
        }
    }
}

void main(){
    TRISA = 0X00;
    TRISB = 0xFF;
    TRISC = 0x00;    // Output
    TRISD = 0XFF;    // Input
    
    OPTION_REG = 0xC4;    
    
    INTEDG = 1;      // Low to high edge
    INTF = 0;        // Interrupt flag bit (must be manually cleared)
    INTE = 1;        // Interrupt enable bit

    TMR0IF = 0;      // Timer0 flag bit
    TMR0IE = 1;      // Timer0 enable bit

    GIE = 1;         // Enable global interrupts after everything is set
    PORTC = 0X00;    // Initialize display

    while(1){
        if(counter == 0x09){
            counter = 0x00;
        }
        else{
            counter++;
        }
        delay(98);
        PORTC = counter;
    }
}