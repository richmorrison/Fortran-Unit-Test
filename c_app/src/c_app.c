#include <stdio.h>

double squared_(double* i);

int main(void)
{
	double i = 5;
	
	printf("%6.2f\t%6.2f\n", i, squared_(&i) );
	
	return 0;
}
