#include <stdio.h>

struct Node
{
    int value;
    struct Node * next;
};

struct List
{
    unsigned int count;
    struct Node * first;
};

int main()
{
    struct Node next;
    struct Node first;

    struct List list;
    list.count = 0;

    next.value = 7;
    next.next = NULL;

    first.value = 5;
    first.next = &next;

    list.first = &first;
    list.count++;
    list.count++;

    printf("list[%d]: ", list.count);
    printf("%d -> ", list.first->value);
    printf("%d\n", list.first->next->value);

    return 0;
}