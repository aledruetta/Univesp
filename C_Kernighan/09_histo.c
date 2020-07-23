#include <stdio.h>

#define NCHARS 25

main()
{
    char c;
    int i, j, histo[NCHARS];

    for (i=0; i<NCHARS; i++)
        histo[i] = 0;

    printf("Frase: ");
    while ((c = getchar()) != '\n') {
        if (c >= 'a' && c <= 'z') {
            ++histo[c-'a'];
        }
    }

    for (i=0; i<NCHARS; i++) {
        for (j=0; j<histo[i]; j++)
            putchar(i + 'a');
        if (histo[i] != 0)
            putchar('\n');
    }
}
