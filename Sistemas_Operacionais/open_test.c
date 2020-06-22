#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

int main()
{
    mode_t mode = 644;
    int fd = open("/home/alejandro/Devel/Univesp/Sistemas_Operacionais/teste.txt", O_CREAT, mode);
    printf("%d\n", fd);
    close(fd);

    return 0;
}
