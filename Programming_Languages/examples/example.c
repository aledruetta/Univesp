#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct
{
    int a;
    char* str;
} Bar;

void* xmalloc(size_t size)
{
    void* value = malloc(size);
    if (value == 0) abort();
    memset(value, 0, sizeof(*value));

    return value;
}

int main(int argc, char *argv[])
{
    char* str = "Happy Birthday!";
    size_t len = strlen(str);

    Bar* bar_ptr = (Bar*)xmalloc(sizeof *bar_ptr);
    bar_ptr->a = 51;
    bar_ptr->str = (char*)xmalloc(len + 1);
    strcpy(bar_ptr->str, str);

    printf("%-14s %p\n", "str: ", str);
    printf("%-14s %p\n", "bar_str: ", bar_ptr);
    printf("%-14s %p\n", "bar_str->a: ", &(bar_ptr->a));
    printf("%-14s %p\n", "bar_str->str: ", bar_ptr->str);

    printf("%d %s\n", bar_ptr->a, bar_ptr->str);

    free(bar_ptr->str);
    free(bar_ptr);

    return 0;
}