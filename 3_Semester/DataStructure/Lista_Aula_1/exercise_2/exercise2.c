#include <stdio.h>

int getHigherNumberInVector(int vec[], int vecSize){
    int higherNumber = 0;
    for (int i = 0; i < vecSize; i++) {
        if(vec[i] > higherNumber){
            higherNumber = vec[i];
        }
    }
    return higherNumber;
}

int main(){
    int vector[] = {56, 94, 24, 554, 32};
    int vectorLenght = sizeof(vector) / sizeof(vector[0]);
    for (int i = 0; i < vectorLenght; i++) {
        printf("Number %d: %d\n", i, vector[i]);
    }
    int higherNum = getHigherNumberInVector(vector, vectorLenght);
    printf("Higher Number in Vector: %d\n", higherNum);
}
