#include <xc.h>

#pragma config FOSC = XT
#pragma config WDTE = OFF
#pragma config PWRTE = ON
#pragma config BOREN = ON
#pragma config LVP = OFF
#pragma config CPD = OFF
#pragma config WRT = OFF
#pragma config CP = OFF

void main()
{
	unsigned int cnt;
	ADCON1 = 0x06; // configure PORTA/PORTB pins as digital I/O
	TRISB = 0x00; // set PORTB as output for LEDs
	PORTB = 0x00; // initialize LEDs to OFF

	for(;;)
	{
		RB0 = 0x01; // LED ON
		for(cnt = 0; cnt < 30000; cnt++) // delay
		{
		}
		
		RB0 = 0x00; // LED OFF
		for(cnt = 0; cnt < 30000; cnt++) // delay
		{
		}
	}
}