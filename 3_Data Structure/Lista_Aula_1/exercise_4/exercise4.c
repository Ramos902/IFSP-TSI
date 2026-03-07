#include <stdio.h>

int EvenNumbers(int vec[], int vecLenght)
{
    int EvenCounter = 0;
    for (int i = 0; i < vecLenght; i++)
    {
        if (vec[i] % 2 == 0)
        {
            EvenCounter++;
        }
    }
    return EvenCounter;
}
int OddNumbers(int vec[], int vecLengh)
{
    int EvenCounter = 0;
    for (int i = 0; i < vecLengh; i++)
    {
        if (!(vec[i] % 2 == 0))
        {
            EvenCounter++;
        }
    }
    return EvenCounter;
}

int main()
{
    int vector[] = {45, 54, 76, 32, 12};
    int vectorLenght = sizeof(vector) / sizeof(vector[0]);
    int EvenNumberCount = EvenNumbers(vector, vectorLenght);
    int OddNumberCount = OddNumbers(vector, vectorLenght);

    for (int i = 0; i < vectorLenght; i++)
    {
        printf("Number %d: %d\n", i, vector[i]);
    }

    printf("\nOdd Numbers: %d", OddNumberCount);
    printf("\nEven Numbers: %d", EvenNumberCount);
}