#include<xc.h> // include file for the XC8 compiler 
 
#pragma config FOSC = XT // oscillator selection
 #pragma config WDTE = OFF // watchdog timer disabled
 #pragma config PWRTE = ON // power-up timer enabled
 #pragma config BOREN = ON // brown-out reset enabled
 #pragma config LVP = OFF // low-voltage programming disabled
 #pragma config CPD = OFF // data EEPROM code protection disabled
 #pragma config WRT = OFF // flash program memory write protection off
 #pragma config CP = OFF // code protection off

void main() 
 { 
	unsigned char i;
	unsigned int cnt;
	ADCON1 = 0x06; // configure PORTA/PORTB pins as digital I/O
	TRISA = 0x01; // set RA0 as input for the push button
	TRISB = 0x00; // set PORTB as output for LEDs
	PORTB = 0x00; // initialize LEDs to OFF

 	for(;;) 
 	{ 
		if(RA0 == 0x01) // active-high button press detected
		{
            for(cnt = 0; cnt < 10000; cnt++); // debounce delay
			for(i = 0; i < 3; i++) // blink LED 3 times
			{
				RB0 = 0x01; // LED ON
				for(cnt = 0; cnt < 10000; cnt++) // delay
				{
				}
				RB0 = 0x00; // LED OFF
				for(cnt = 0; cnt < 10000; cnt++) // delay
				{
				}
			}

			while(RA0 == 0x01) // wait until button is released
			{
			}
		}
 	} 
 }
