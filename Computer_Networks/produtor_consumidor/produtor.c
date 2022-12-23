/* file: produtor.c
 */

#include <stdio.h>
#include <unistd.h>
#include <stdbool.h>

#define BUFFER_FILE "buffer.txt"
#define BUFFER_SIZE 15
#define READONLY "r"
#define WRITEONLY "w"

int read_buffer (char * bufin);
bool write_buffer (char chr);


int main ()
{
    char chr;

    printf ("message: ");

    while (( chr = getchar() ) != '\n' && chr != EOF) {
        if ( !write_buffer(chr) )
            return 0;
        sleep(1);
    }

    return 0;
}


bool write_buffer (char chr)
{
    char bufin[BUFFER_SIZE];
    int nc = read_buffer (bufin);

    if (nc == BUFFER_SIZE)
        return false;

    FILE * buf = fopen (BUFFER_FILE, WRITEONLY);

    for (int i=0; i<nc; i++)
        fprintf (buf, "%c", bufin[i]);
    fprintf (buf, "%c", chr);

    fclose (buf);

    return true;
}


int read_buffer (char * bufin)
{
    FILE * buf = fopen (BUFFER_FILE, READONLY);
    char chr;
    int size = 0;

    while (( fscanf(buf, "%c", &chr) == 1 )) {
        *bufin = chr;
        bufin++;
        size++;
    }

    fclose(buf);

    return size;
}
