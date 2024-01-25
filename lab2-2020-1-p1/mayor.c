#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void cMayorNumero(int len,int *vector,int max);
extern void asmMayorNumero(int len,int *vector,int max);
int main(){
    int len;
    int* vector;
    int max;

    vector =  malloc(len * sizeof(int));
    len=5;
    vector[0] =2;
    vector[1] =9;
    vector[2] =1;
    vector[3] =2;
    vector[4] =6;

    cMayorNumero(len,vector, max);
    asmMayorNumero(len,vector,max);
    return 0;
}
void cMayorNumero(int len,int *vector,int max){
    max = vector[0];
    for (int i = 0; i < len; i++)
    {
        if(max < vector[i])max = vector[i];
    }
    printf("En C el mayor valor del vector es %d \n",max);
}