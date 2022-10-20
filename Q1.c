#include <msp430.h> 


/**
 * main.c
 */
/*
int main(void)
{
	WDTCTL = WDTPW | WDTHOLD;	// stop watchdog timer
	
	int a = 1;
	float b = 1.5;
	unsigned char c = 0xAB; //1010 1011
	unsigned char d = 0xCD; //1100 1101

	a++;
	b--;
	c = c & d; //10001001 0x89
	d = c ^ d; //01000100 0x44

	return 0;
}
