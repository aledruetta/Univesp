#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Types

typedef struct ListNode ListNode;
typedef struct ListNode
{
    char * value;
    ListNode * next;
} * SimpleList;

// Prototypes

void sl_tostring(SimpleList);
void sl_append(SimpleList, char*, size_t);
void sl_drop(SimpleList);

// Functions

void sl_tostring(SimpleList head)
{
    ListNode * last = head;
    printf("%s", last->value);
    while (last->next != NULL) {
        last = last->next;
        printf(" -> %s", last->value);
    }
    printf("\n");
}

void sl_append(SimpleList head, char value[], size_t value_len)
{
    ListNode * last = head;
    while (last->next != NULL) {
        last = last->next;
    }

    ListNode * node = (ListNode*) malloc(sizeof(ListNode));
    char * node_value = (char*) malloc(value_len);
    strncpy(node_value, value, 2);
    node->value = node_value;
    node->next = NULL;
    last->next = node;

    sl_tostring(head);
}

void sl_drop(SimpleList head)
{
    ListNode * last = head;
    ListNode * prev = head;
    while (last->next != NULL) {
        prev = last;
        last = last->next;
        free(prev);
    }
    free(last);
}

int main()
{
    ListNode head = { "head", NULL };
    SimpleList sl = &head;

    for (char c='a'; c<='f'; c++) {
        char str[] = { c, '\0'};
        sl_append(sl, str, 2);
    }

    //sl_tostring(sl);

    sl_drop(sl);

    return 0;
}