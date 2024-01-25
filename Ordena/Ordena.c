#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void COrdenafloat(float *x,int len);
extern void ASMOrdena(float *x, int len);
int main(){
    float *x;
    int *y;
    int len = 10;

    x = malloc(len*sizeof(float));
    y = malloc(len*sizeof(int));

    x[0]=21.12;
    x[1]=35.43;
    x[2]=56.511;
    x[3]=23.23;
    x[4]=12.1;
    x[5]=67.46;
    x[6]=32.83;
    x[7]=12.94;
    x[8]=11.52;
    x[9]=86.11;

    //COrdenafloat(x,len);
    ASMOrdena(x,len);
    for(int i=0;i<len;i++)printf("%.2f ",x[i]);
    printf("\n");
}

void COrdenafloat(float *x,int len){
    float aux;
    for(int i=0;i<len-1;i++){
        for(int j= i+1; j<len;j++){
            if(x[j] < x[i]){
                aux = x[j];
                x[j] = x[i];
                x[i] = aux;
            }
        }
    }
}