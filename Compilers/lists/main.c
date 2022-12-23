#include <stdio.h>
#include <stdlib.h>

typedef struct ListNode ListNode;
typedef ListNode * SimpleList;

struct ListNode
{
    char * value;
    ListNode * next;
};

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

void sl_append(SimpleList head, ListNode * node)
{
    ListNode * last = head;
    while (last->next != NULL) {
        last = head->next;
    }
    last->next = node;
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

ListNode * sl_create_node(char * value)
{
    ListNode * node = (ListNode*) malloc(sizeof(ListNode));
    node->value = value;
    node->next = NULL;
    printf("node created: {%s, %p}\n", node->value, node->next);

    return node;
}

int main()
{
    SimpleList sl = sl_create_node("head");

    for (char c='a'; c<='z'; c++) {
        char str[] = { c, '\0'};
        ListNode * node = sl_create_node(str);
        sl_append(sl, node);
    }
    /*

    sl_tostring(sl);

    sl_drop(sl);
    */

    return 0;
}