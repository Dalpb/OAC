#include <stdio.h>
#include <stdlib.h>

extern void asmMayorNumero(int len, int *vector, int *max2);
void cMayorNumero (int len, int *vector, int *max);

int main () {
	int len = 10;
	int max, max2;
	int *vector;
	
	vector = malloc(len*sizeof(int));
	
	vector[0] = 12; vector[1] = 5, vector[2] = 3; vector[3] = 1; vector[4] = 18;
	vector[5] = 24; vector[6] = 27; vector[7] = 11; vector[8] = 10; vector[9] = 4;

	/* Calcular el numero mayor del arreglo en C */
	cMayorNumero(len, vector, &max);
	printf("En C el mayor valor del vector es %d\n",max);
	
	/* Calcular el numero mayor del arreglo en ASM */
	asmMayorNumero(len, vector, &max2);
	printf("En ASM el mayor valor del vector es %d\n",max2);
	
	return 0;
}

void cMayorNumero (int len, int *vector, int *max) {
	int i, M = -999999;
	for (i = 0; i < len; i++) {
		if (vector[i] > M) M = vector[i];
	}
	*max = M;
}