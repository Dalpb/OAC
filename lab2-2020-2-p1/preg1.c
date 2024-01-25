#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

/* Prototipos de funciones de la pregunta 1 */
void avgFilter(float *c, float *v, int N);
extern void avgFilterASM(float *c, float *v, int N);
void genRandomValues(float *v, int tam);
void norm2(float *v, float *r, int N);

int main(int argc, char **argv)
{
    clock_t start, stop;

    float timeC, timeASM;
    float *x, *yC, *yASM;
    int N = 1024;

    srand(time(NULL)); // semilla para la funcion RAND

    /* Validar que el usuario ingreso el valor de N y que sea mayor a 0 */
    if (argc < 2){
        printf("Utilizando tamaño de vector N = 1024\n");
    } else{
        if (atoi(argv[1]) > 0){
            N = atoi(argv[1]);
            printf("Utilizando tamaño de vector N = %d\n", N);
        } else{
            printf("Utilizando tamaño de vector N = %d\n", N);
        }
    }

    /* FIXME: Reservar espacio de memoria en funcion a N */
    x  = malloc(N * sizeof(float));
    yC = malloc(N *sizeof(float));
    yASM = malloc(N * sizeof(float));

    /* FIXME: utilizar la función genRandomValues() para incializar el vector x */

    genRandomValues(x,N);
  for(int i=0;i<N;i++){
        printf("%.2f  ",x[i]);
    }
    /* FIXME: llamar a las funciones en C y ASM y medir los tiempos de cada una para calcular el SU */
    printf("\n");

    avgFilter(yC,x,N);
    for(int i=0;i<N;i++){
        printf("%.2f  ",yC[i]);
    }
    printf("\n");
    avgFilterASM(yASM,x,N);
    for(int i=0;i<N;i++){
        printf("%.2f  ",yASM[i]);
    }
 
   // printf("El speed-up es: %.2f\n", /*FIXME: calcular el speed-up*/);
    
    /* Esta seccion del codigo verifica si sus implementaciones en ASM y C entregan resultados similares */
   // norm2(yC,yASM,N);

    return 0;
}

void genRandomValues(float *v, int tam){
/* Funcion para generar valores aleatorios reales */
    float e = 0.0;
    int i = 0;
    for(i = 0; i < tam; i++){
        e = (float)(rand() % tam);
        v[i] = (sinf(e) + cosf(e))*0.707106;
    }
}

void norm2(float *v, float *r, int N){
/* Funcion para revisar si sus calculos fueron correctos */
    float sum = 0.0;
    for (int i = 0; i < N; i++){
        sum += (v[i] - r[i])*(v[i] - r[i]);
    }
    printf("El error entre sus implementaciones es: %.2f\n", sqrt(sum));
}

void avgFilter(float *c, float *v, int N){
/* FIXME: completar la funcion para el algoritmo de filtro promedio movil */

    for(int i=0; i<N ;i++){
        if (i != 0 && i != N-1){
            c[i] = (v[i] + v[i-1] + v[i+1])/3.0;
        }
        else{ 
            if(i == 0)c[0] = (v[0] + v[0]+ v[1])/3.0;
    
            else{
                c[N-1] = (v[N-1]+ v[N-1] + v[N-2])/3.0;
            }
        }
    }



}
