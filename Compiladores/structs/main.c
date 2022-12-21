#include <stdlib.h>
#include <stdio.h>

struct CharListNode
{
    char data;
    struct CharListNode * next;
};

typedef struct CharListNode * CharList;

int main()
{
    struct CharListNode next = { 'b', NULL };
    struct CharListNode head = { 'a', &next };
    CharList list = &head;

    printf("%c -> %c\n", list->data, list->next->data);

    return 0;
}