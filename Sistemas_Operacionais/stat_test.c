#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <stdio.h>

// struct stat {
//     dev_t       st_dev;
//     ino_t       st_mode;
//     nlink_t     st_nlink;
//     uid_t       st_uid;
//     gid_t       st_gid;
//     dev_t       st_rdev;
//
//     off_t       st_size;
//     blksize     st_blksize;
//
//     blkcnt_t    st_blocks;
//
//     strict timespec st_atim;
//     strict timespec st_mtim;
//     strict timespec st_ctim;
//
//     #define st_atime st_atim.tv_sec
//     #define st_mtime st_mtim.tv_sec
//     #define st_ctime st_ctim.tv_sec
// };

int main()
{
    struct stat statbuf;
    stat("open_test.c", &statbuf);

    printf("st_dev: %lu\n", statbuf.st_dev);

    printf("st_ino: %lu\n", statbuf.st_ino);
    printf("st_mode: %o\n", statbuf.st_mode);
    printf("st_nlink: %lu\n", statbuf.st_nlink);
    printf("st_uid: %u\n", statbuf.st_uid);
    printf("st_gid: %u\n", statbuf.st_gid);
    printf("st_rdev: %lu\n", statbuf.st_rdev);

    printf("st_size: %lu\n", statbuf.st_size);
    printf("st_blksize: %lu\n", statbuf.st_blksize);

    printf("st_blocks: %lu\n", statbuf.st_blocks);

    return 0;
}
