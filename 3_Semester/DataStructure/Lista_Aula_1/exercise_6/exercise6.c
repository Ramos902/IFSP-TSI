#include <stdio.h>

void sumMatriz(int mat1[], int mat2[], int matSize, int matrizSum[]){
    for (int i = 0; i < matSize; i++)
    {   
        matrizSum[i] = mat1[i] + mat2[i];
    }
    
}

int main(){
    int matriz1[] = {12, 34, 54};
    int matriz2[] = {45, 32, 23};
    int matSize = sizeof(matriz1) / sizeof(matriz1[0]);
    int matrizSum[sizeof(matriz1) / sizeof(matriz1[0])];
    
    sumMatriz(matriz1, matriz2, matSize, matrizSum);
    
    for (int i = 0; i < matSize; i++)
    {
        printf("Num %d: %d\n", i, matrizSum[i]);
    }  
}