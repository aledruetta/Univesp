#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

void print_ptr(int *);

int main()
{
    int * ptr;              // uninitialized
    // print_ptr(ptr);         // segmentation fault

    ptr = NULL;             // null initialized
    // print_ptr(ptr);         // segmentation fault

    // *ptr = 33;              // segmentation fault

    return 0;
}

void print_ptr(int * ptr)
{
    printf("ptr addrs: %p\n", &ptr);
    printf("ptr value: %p\n", ptr);
    printf("ptr deref: %d\n", *ptr);
}
