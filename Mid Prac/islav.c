#include <xc.h>

#pragma config FOSC = XT 
#pragma config WDTE = OFF 
#pragma config PWRTE = ON 
#pragma config BOREN = ON 
#pragma config LVP = OFF 
#pragma config CPD = OFF 
#pragma config WRT = OFF 
#pragma config CP = OFF 

unsigned char key_seg(char key){
	switch(key){
		case '1': return 0x06;	// 1
		case '2': return 0X5B; 	// 2
		case '3': return 0X4F;	// 3
		case '4': return 0X66;	// 4
		case '5': return 0X6D;	// 5
		case '6': return 0X7D;	// 6
		case '7': return 0X07;	// 7
		case '8': return 0X7F;	// 8
		case '9': return 0X6F;	// 9
		case '0': return 0X3F; 	// 0
		default: return 0X00;	// blank
	}
}

void interrupt ISR(void){
	GIE = 0;
	if(RCIF == 1){
		RCIF = 0;
		PORTB = key_seg(RCREG); // read the receive register 
	}
	GIE = 1;
}

void main(void) 
{ 
	SPBRG = 0x19; 				// 9.6K baud rate @ FOSC=4MHz, asynchronous high speed 
	SYNC = 0; 					// asynchronous mode (TXSTA reg) 
	SPEN = 1; 					// enable serial port (RCSTA reg) 
	RX9 = 0; 					// 8-bit reception (TXSTA reg) 
	BRGH = 1; 					// asynchronous high-speed (TXSTA reg) 
	CREN = 1; 					// enable continuous receive (RCSTA reg) 
	TRISB = 0x00; 				// set all ports in PORTB to output 
	PORTB = 0x00; 				// all LEDs are off 
	RCIE = 1;
	GIE = 1;
	PEIE = 1;
	
	for(;;) 					// foreground routine 
	{
		
	}
} 
