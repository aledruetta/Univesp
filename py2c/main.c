/* build: make
 * run  : ./a.out
 */

#include <stdio.h>
#include <string.h>
#include "strlib.h"


int main()
{
    char buf[256];

    printf("\n=== Tests ===\n");

    printf("\nFrase: ");
    fgets(buf, sizeof buf, stdin);
    char* nl = strchr(buf, '\n');
    *nl = '\0';

    printf("1 - capitalize\n");
    printf("2 - title\n");
    printf("3 - isalnum\n");

    printf("Opção: ");
    char op = getchar();
    switch (op) {
        case '1':
            printf("test : %s", py_capitalize(buf, strlen(buf)));
            break;
        case '2':
            printf("test : %s", py_title(buf, strlen(buf)));
            break;
        case '3':
            printf("test : %s", (py_isalnum(buf, strlen(buf)))? "true" : "false");
            break;
        default:
            printf("Opção inválida!");
    }

    printf("\n");
    printf("chars: %ld\n", strlen(buf));

    return 0;
}
