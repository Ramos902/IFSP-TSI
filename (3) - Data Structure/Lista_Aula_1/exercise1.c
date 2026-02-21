
#include <stdio.h>

int main(){
    int vector[5] = {12, 21, 34, 42, 51};
    int sizeOfVector = sizeof(vector) / sizeof(vector[0]);

    for(int i = 0; i < sizeOfVector; i++){
        printf("Number %d: %d\n", i, vector[i]);
    }
    return 0;
}