#include<xc.h>
#include<stdio.h> 
#include<math.h>

int RH;
float T;

void delay_ms(int cnt);

void instCtrl(unsigned char INST);
void dataCtrl(unsigned char DATA);

void dispRH();
void dispT();

// I2C_master_mode
void I2C_Wait(void);
void I2C_Start(void);
void I2C_Stop(void);
void init_I2C_Master(void);
void I2C_RepeatedStart(void);
void I2C_Send(unsigned char data);
unsigned char I2C_Receive(unsigned char ack);

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

void main(void) {
	int res = (int)(pow(2,14));
	unsigned int RH_temp = 0x0000, T_temp = 0x0000;
	unsigned char temp = 0x00;
	TRISB = 0x00;	// set all ports of PORTB to output
	TRISD = 0x00;	// set all ports of PORTD to output
	PORTB = 0x00;
	PORTD = 0x00;
	init_I2C_Master(); // initialize I2C as master
	

	for(;;)
	{
		// for reading relative humidity
		I2C_Start(); 				// initiate start condition
		I2C_Send(0x80); 			// send the slave address + write
		I2C_Send(0xE5); 			// 11100101 -> command for reading humidity
		I2C_RepeatedStart();		// read data from another address without stop
		I2C_Send(0x81); 			// send the slave address + read
		RH_temp = I2C_Receive(1); 	// read MSB and acknowledge 
		temp = I2C_Receive(0); 		// read LSB and not acknowledge 
		I2C_Stop(); 				// initiate stop condition
		delay_ms(200); 				// delay
			
		RH_temp = RH_temp << 6; 	// shift left 6 times
		temp = temp >> 2; 			// shift right 2 times
		RH_temp = RH_temp | temp; 	// combine MSB and LSB
		
		RH = (int)(-6+(125*((float)RH_temp/(float)res)));
		
		// ACK POLLING
		I2C_Start(); 		// init start condition
		I2C_Send(0x80); 	// sending slave address + write
		I2C_Send(0xE3); 	// 11100101 -> command for reading humidity
		I2C_Stop();
		delay_ms(200);
		
		temp = 0x00;		// reset temp value
		
		// for reading temperature
		I2C_Start(); 				// initiate start condition
		I2C_Send(0x80); 			// sending slave address + write
		I2C_Send(0xE3); 			// 11100101 -> command for temperature
		I2C_RepeatedStart();		// read data from another address without stop
		I2C_Send(0x81); 			// sending slave address + read
		T_temp = I2C_Receive(1); 	// read MSB and acknowledge
		temp = I2C_Receive(0); 		// read LSB and not acknowledge
		I2C_Stop(); 				// init stop condition
		delay_ms(200); 				// delay
		
		T_temp = T_temp << 6; 		// shift left 6 times
		temp = temp >> 2; 			// shift right 2 times
		T_temp = T_temp | temp; 	// combine MSB and LSB

		T = (float)(-46.85+(175.72*((float)T_temp/(float)res)));

		// ACK POLLING
		I2C_Start(); 		// initiate start condition
		I2C_Send(0x80); 	// send the slave address + write
		I2C_Send(0xE5); 	// 11100101 -> command for reading humidity
		I2C_Stop();
		delay_ms(200);

		dispRH();
		dispT();
	}
}
void delay_ms(int cnt) {
	int i, j;
	for (i = cnt; i != 0; i--);
	for (j = 0; j < 5000; j++); 
}

void dispRH() {
    int i;
    char val[2] = {' ',' '};
    sprintf(val, "%d", RH);
    for(i=0; i<=1; i++)
	{
		PORTB = key_seg(val[i]); // read the receive register 
	}
   
}

void dispT() {
    int i;
    char val[2] = {' ',' '};
    sprintf(val, "%f", T);
    for(i=0; i<=1;i++)
	{
		PORTD = key_seg(val[i]); // read the receive register 
	}
}



void init_I2C_Master(void){
	TRISC3 = 1; 		// set RC3 (SCL) to input
	TRISC4 = 1; 		// set RC4 (SDA) to input
	SSPCON = 0x28; 		// SSP enabled, I2C master mode
	SSPCON2 = 0x00; 	// start condition idle, stop condition idle
						// receive idle
	SSPSTAT = 0x00; 	// slew rate enabled
	SSPADD = 0x09; 		// clock frequency at 100 KHz (FOSC = 4MHz)
}

void I2C_Wait(void)
{
	/* wait until all I2C operation are finished*/
	while((SSPCON2 & 0x1F) || (SSPSTAT & 0x04));
}

void I2C_Start(void)
{
	/* wait until all I2C operation are finished*/
	I2C_Wait();

	/* enable start condition */
	SEN = 1; 			// SSPCON2
}

void I2C_Stop(void)
{
	/* wait until all I2C operation are finished*/
	I2C_Wait();

	/* enable stop condition */
	PEN = 1; 			// SSPCON2
}

void I2C_RepeatedStart(void)
{
	/* wait until all I2C operation are finished*/
	I2C_Wait();

	/* enable repeated start */
	RSEN = 1; 			// SSPCON2
}

void I2C_Send(unsigned char data)
{
	/* wait until all I2C operation are finished*/
	I2C_Wait();

	/* write data to buffer and transmit */
	SSPBUF = data;
}

unsigned char I2C_Receive(unsigned char ack)
{
	unsigned char temp;
	I2C_Wait(); 		// wait until all I2C operation are finished
	RCEN = 1; 			// enable receive (SSPCON2 reg)
	I2C_Wait(); 		// wait until all I2C operation are finished
	temp = SSPBUF; 		// read SSP buffer
	I2C_Wait(); 		// wait until all I2C operation are finished
	ACKDT = (ack)?0:1; 	// set acknowledge (ACK) or not acknowledge (NACK)
	ACKEN = 1; 			// enable acknowledge sequence
	return temp;
}

