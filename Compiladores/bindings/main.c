#include <stdio.h>
#include <stdlib.h>

typedef struct Node Node;   // creates a new type called "Node" that is a "struct Node"

struct Node
{
    int value;
    Node * next;
};

typedef struct
{
    unsigned int count;
    Node * first;
} List;

int main()
{
    List list;
    list.count = 0;

    Node first;
    first.value = 5;

    list.first = &first;
    list.count++;

    Node next;
    next.value = 7;

    first.next = &next;
    list.count++;

    printf("list[%d]: ", list.count);
    printf("%d -> ", list.first->value);
    printf("%d\n", list.first->next->value);

    return 0;
}