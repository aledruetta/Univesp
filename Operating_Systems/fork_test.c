/* Testando Syscall fork()
 *
 * Build: gcc -Wall teste_fork.c -o teste_fork
 * Exec:  ./teste_fork
 *
 */

#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

int main()
{
    pid_t pid;
    pid = fork();

    printf("PID = %d ", pid);

    if (pid == 0) {
        printf("\t(filho)\n");
    } else {
        printf("\t(pai)\n");
    }

    return 0;
}

