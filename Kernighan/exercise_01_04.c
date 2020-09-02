/* Exercise 1-4 */

#include <stdio.h>

int main()
{
    float fahr, celsius;
    int lower, upper, step;

    lower = -20;
    upper = 160;
    step = 20;

    celsius = lower;

    printf("ºC   ºF\n");
    printf("========\n");

    while (celsius <= upper) {
        fahr = (9.0/5.0) * celsius + 32.0;
        printf("%3.0f %3.0f\n", celsius, fahr);
        celsius = celsius + step;
    }

    return 0;
}
