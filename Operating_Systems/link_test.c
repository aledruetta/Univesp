#include <unistd.h>
#include <fcntl.h>

int main() {
    char fn[] = "file.txt";
    int fd;
    fd = creat(fn, S_IRUSR);
    link("/home/alejandro/Devel/Univesp/Sistemas_Operacionais/file.txt", \
        "/home/alejandro/Devel/Univesp/Sistemas_Operacionais/file.lnk");

    return 0;
}
