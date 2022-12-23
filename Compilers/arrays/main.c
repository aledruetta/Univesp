#include <stdio.h>
#include <stdlib.h>

#define POINTS_LEN 5

typedef struct
{
    unsigned int len;
    int * points;
} User;

void user_const(User * user)
{
    user->len = POINTS_LEN;
    int * points = (int *) malloc(sizeof(int) * POINTS_LEN);
    user->points = points;
}

void user_drop(User * user)
{
    free(user->points);
}

int last(unsigned int len)
{
    int a[len];
    int i;

    for (i=0; i<len; i++) {
        a[i] = i * 2;
    }

    return a[i-1];
}

int main()
{
    User user;
    user_const(&user);

    printf("length: %d\n", user.len);
    for (int i=0; i<user.len; i++) {
        user.points[i] = i;
        printf("%d\n", user.points[i]);
    }

    user_drop(&user);

    printf("last: %d\n", last(19));

    return 0;
}
