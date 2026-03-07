#include <stdio.h>
#include <stdbool.h>

bool isOrdened(int vec[], int vectorLenght){
    int lastNum = 0;
    bool isOrdened = false;
    for (int i = 0; i <= vectorLenght; i++) {
        if(vec[i] >= lastNum){
            lastNum = vec[i];
            isOrdened = true;
        }else{
            return false;
        }
    }
    return isOrdened;
}

int main(){

    int vector[] = {45, 54, 76, 12};
    int vectorLenght = sizeof(vector) / sizeof(vector[0]);

    for (int i = 0; i < vectorLenght; i++)
    {
        printf("Number %d: %d\n", i, vector[i]);
    }

    if(isOrdened(vector, vectorLenght)){
        printf("Is Ordened\n");
    }else{
        printf("Is not Ordened\n");
    }
}