/* Arquivo: valfef.c
 * Uso:
 *      $ gcc valref.c
 *      $ ./a.out
 */

#include <stdio.h>

// Define um tipo S estrutura com um atributo inteiro
typedef struct {
    int attr;
} S;

// Receve uma estrutura por valor
void por_valor(S st) {
    printf("Por valor:\n");
    printf("\tEndereço de st %p\n", &st);
    printf("\tEndereço de attr: %p\n", &(st.attr));
}

// Receve uma estrurura por referência, através
// de um ponteiro
void por_referencia(S *p) {
    printf("\nPor referência:\n");
    printf("\tEndereço de p: %p\n", &p);
    printf("\tEndereço de st: %p\n", p);
    printf("\tEndereço de attr: %p\n", &((*p).attr));
}

int main() {

    S st;           // Declara uma estrutura
    st.attr = 10;   // Inicializa o atributo
    S *p = &st;     // Ponteiro apontando à estrutura

    // Valores no escopo de "main"
    printf("Fora da função:\n\n");
    printf("\tEndereço de p: %p\n", &p);
    printf("\tEndereço de st: %p\n", p);
    printf("\tEndereço de attr: %p\n", &(st.attr));

    // Valores dentro das funções
    printf("\nDentro da função:\n\n");
    por_valor(st);
    por_referencia(p);

    return 0;
}

