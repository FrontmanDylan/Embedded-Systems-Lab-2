#include <msp430.h> 



char sum(char A, char B)
{
    return A + B;
}


int main(void)
{
    WDTCTL = WDTPW | WDTHOLD;   // stop watchdog timer

    char a = 0xAA;                //1010 1010
    char b = 0xBB;                //1011 1011
    char c = sum(a,b);
    return 0;
}


