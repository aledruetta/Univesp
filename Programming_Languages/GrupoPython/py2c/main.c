/* build: make
 * run  : ./a.out
 */

#include <stdio.h>
#include "strtools.h"
#include "py_strlib.h"

int main()
{
    char buf[MAXLINE];
    char new_str[MAXLINE];
    int len;

    printf("\n=== Test ===\n");

    printf("\nFrase: ");
    len = my_getline(buf, MAXLINE);

    printf("1 - capitalize\n");
    printf("2 - title\n");
    printf("3 - isalnum\n");

    printf("Opção: ");
    char op = getchar();
    switch (op) {
        case '1':
            py_capitalize(buf, new_str, len);
            printf("test : '%s'", new_str);
            break;
        case '2':
            py_title(buf, new_str, len);
            printf("test : '%s'", new_str);
            break;
        case '3':
            printf("test : '%s'", (py_isalnum(buf, len))? "true" : "false");
            break;
        default:
            printf("Opção inválida!");
    }

    printf("\n");
    printf("chars: %d\n", len);

    return 0;
}
