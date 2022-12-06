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
    struct List list;
    list.count = 0;

    struct Node first;
    first.value = 5;

    list.first = &first;
    list.count++;

    struct Node next;
    next.value = 7;

    first.next = &next;
    list.count++;

    printf("list[%d]: ", list.count);
    printf("%d -> ", list.first->value);
    printf("%d\n", list.first->next->value);

    return 0;
}