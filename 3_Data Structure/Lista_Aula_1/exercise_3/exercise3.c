#include <stdio.h>

float avarageElements(int vec[], int vecSize){
    float avarage = 0, sum = 0;
    for(int i = 0; i < vecSize; i++){
        sum += vec[i];
    }
    avarage = sum / vecSize;
    return avarage;
}   

int main(){
    int vector[] = {56, 94, 24, 554, 32};
    int vectorLenght = sizeof(vector) / sizeof(vector[0]);
    for (int i = 0; i < vectorLenght; i++) {
        printf("Number %d: %d\n", i, vector[i]);
    }
    float avarage = avarageElements(vector, vectorLenght);
    printf("Avarage number: %.2f\n", avarage);
}
