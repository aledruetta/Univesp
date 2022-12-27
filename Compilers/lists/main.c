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
    printf("List: [%s]", last->value);
    while (last->next != NULL) {
        last = last->next;
        printf("->[%s]", last->value);
    }
    printf(".\n");
}

void sl_append(SimpleList head, char value[], size_t value_len)
{
    ListNode * last = head;
    while (last->next != NULL) {
        last = last->next;
    }

    ListNode * node = (ListNode*) malloc(sizeof(ListNode));

    int i = 1;
    while (value[i] != '\0') i++;
    char * node_value = (char*) malloc(i);
    strncpy(node_value, value, i);

    node->value = node_value;
    node->next = NULL;
    last->next = node;
}

void sl_drop(SimpleList head)
{
    ListNode * node = head->next;
    ListNode * tmp = head->next;
    while (node->next != NULL) {
        tmp = node;
        node = tmp->next;
        free(tmp);
    }
    free(node);
}

int main()
{
    ListNode head = { "head", NULL };
    SimpleList sl = &head;

    for (char c='A'; c<='F'; c++) {
        char str[] = { '0', 'X', c, '\0'};
        sl_append(sl, str, 2);
    }

    sl_tostring(sl);

    sl_drop(sl);

    return 0;
}