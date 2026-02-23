#include<xc.h> // include file for the XC8 compiler 
 
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
 	int cnt; 
 	TRISB = 0x00; // set all bits (port) in PORTB as output 
 	for(;;) 
 	{ 
 		for(cnt=0;cnt<10000;cnt++); // delay 
 		PORTB = 0x01; // set RB0 to 1 (LED ON) 
 		for(cnt=0;cnt<10000;cnt++); // delay 
 		PORTB = 0x00; // set RB0 to 0 (LED OFF) 
 	} 
 }
