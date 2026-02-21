
#include <stdio.h>

int invertVector(int vet[], int tamanho){
    int temp;
    for(int i = 0; i < tamanho / 2; i++){
        temp = vet[i];
        vet[i] = vet[tamanho - 1 - i];
        vet[tamanho - 1 - i] = temp;
    }
}

int main(){
    int vector[5] = {12, 21, 34, 42, 51};
    int sizeOfVector = sizeof(vector) / sizeof(vector[0]);
    
    printf("Normal Vector\n");
    for(int i = 0; i < sizeOfVector; i++){
        printf("Number %d: %d\n", i, vector[i]);
    }

    invertVector(vector, sizeOfVector);
    
    printf("\nInverted Vector\n");
    for(int i = 0; i < sizeOfVector; i++){
        printf("Number %d: %d\n", i, vector[i]);
    }

    return 0;

}



