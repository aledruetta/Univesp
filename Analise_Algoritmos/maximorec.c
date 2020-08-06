#include <stdio.h>

double max_rec(double A[], int n);

int main()
{
    double A[] = {1.50, 3.30, 11.04, 7.11, -0.39};
    double max = max_rec(A, sizeof(A) / sizeof(double));

    printf("Máximo: %.2f\n", max);

    return 0;
}

double max_rec(double A[], int n)
{
    double x;

    if (n == 1)
        return A[0];
    else {
        x = max_rec(A, --n);
        if (x > A[n])
            return x;
        else
            return A[n];
    }
}
