/* Exercise 1-15 */

#include <stdio.h>

float to_fahr(float celsius);

int main()
{
    float celsius;
    int lower, upper, step;

    lower = -20;
    upper = 160;
    step = 20;

    celsius = lower;

    printf("ºC   ºF\n");
    printf("========\n");

    while (celsius <= upper) {
        printf("%3.0f %3.0f\n", celsius, to_fahr(celsius));
        celsius = celsius + step;
    }

    return 0;
}

float to_fahr(float celsius)
{
    return (9.0/5.0) * celsius + 32.0;
}
