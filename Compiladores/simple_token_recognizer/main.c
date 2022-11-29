#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>

typedef enum {NUMBER, PLUS, TIMES, LPARENT, RPARENT, ERROR} TokenType;

typedef struct
{
    TokenType type;
    char* value;
} Token;

int get_token_list(Token* token_list, char* expr)
{
    int i = 0;

    return 0;
}

Token get_token(char* expr, int i)
{
    while (expr[i]) {
        if (isdigit(expr[i])) {
            while (isdigit(expr[i])) {
                i++;
            }
        }
        else {
            switch (expr[i]) {
                case '(': return Token {type: LPARENT, value: '('};
            }
            i++;
        }
    }
}

int main(int argc, char* argv[])
{
    char* expr;

    if (argc > 1) {
        expr = argv[1];
    }
    else {
        printf("%s\n", "El usuario no suministró una secuencia de caracteres como primer argumento.");
        exit(1);
    }

    Token* token_list;

    int token_qty = get_token_list(token_list, expr);

    for (int i=0; i<token_qty; i++) {
        printf("%d, %s\n", token_list[i].type, token_list[i].value);
    }

    return 0;
}