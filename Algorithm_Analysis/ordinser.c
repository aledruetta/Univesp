#include <stdio.h>

void ord_inser(double A[], int n);

int main()
{
    double A[] = {13.21, 4.04, 21.01, 0.99, 8.47, 92.00};
    int n = sizeof(A) / sizeof(double);

    ord_inser(A, n);

    for (int i=0; i<n; i++) {
        printf("%.2f\n", A[i]);
    }

    return 0;
}

void ord_inser(double A[], int n)
{
    double chave;
    int i, j;

    for (j=1; j < n; j++) {
        chave = A[j];
        i = j - 1;
        while (i >= 0 && A[i] > chave) {
            A[i+1] = A[i];
            i--;
        }
        A[i+1] = chave;
    }
}
