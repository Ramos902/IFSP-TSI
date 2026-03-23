#include <stdio.h>

void invertArray(){
    
}

int main(){
    int array[5][5] = {0};
    /*
    int array[5][5] = {
        {1, 2, 3, 4, 5}, 
        {1, 2, 3, 4, 5}, 
        {1, 2, 3, 4, 5}, 
        {1, 2, 3, 4, 5}, 
        {1, 2, 3, 4, 5}
    };
    */
   for (int i = 0; i < 5; i++)
   {
        array[i][4 - i] = 1;
   }
   
    for (int i = 0; i < 5; i++)
    {
        for (int j = 0; j < 5; j++)
        {
            printf("%d, ", array[i][j]);     
        }
        printf("\n");
    }
}