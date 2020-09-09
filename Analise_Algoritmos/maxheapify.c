#include <stdio.h>

void printArray(int A[], size_t m);
void max_heapify(int A[], int m, int i);

int main()
{
    int A[] = {1, 3, 2, 6, 4, 7, 8, 5};
    size_t m = sizeof(A) / sizeof(int);

    printArray(A, m);
    max_heapify(A, m, 0);
    printArray(A, m);

    return 0;
}

void printArray(int A[], size_t m)
{
    for (size_t i=0; i<m; i++)
        printf("%d ", A[i]);
    printf("\n");
}

void max_heapify(int A[], int m, int i)
{
    i++;
    int e = 2 * i;
    int d = 2 * i + 1;
    int maior, tmp;

    if (e < m && A[e] > A[i-1])
        maior = e;
    else
        maior = i;

    if (d < m && A[d] > A[maior])
        maior = d;

    if (maior != i) {
        tmp = A[i-1];
        A[i-1] = A[maior];
        A[maior] = tmp;

        max_heapify(A, m, maior);
    }
}
