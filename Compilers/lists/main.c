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
void sl_append(SimpleList, char*);
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

void sl_append(SimpleList head, char value[])
{
    ListNode * last = head;
    while (last->next != NULL) {
        last = last->next;
    }

    ListNode * node = (ListNode*) malloc(sizeof(ListNode));
    if (node == 0) return;

    size_t str_len = 1;
    while (value[str_len] != '\0') str_len++;

    char * node_value = (char*) malloc(str_len);
    if (node_value == 0) {
        free(node);
        return;
    }

    strncpy(node_value, value, str_len);

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
        sl_append(sl, str);
    }

    sl_tostring(sl);

    sl_drop(sl);

    return 0;
}