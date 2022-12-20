#include <stdio.h>
#include <stdlib.h>

typedef struct
{
    unsigned int len;
    int * points;
} User;

User * user_const(unsigned int len)
{
    User * user = (User *) malloc(sizeof(User));
    user->len = len;
    int * points = (int *) malloc(sizeof(int) * user->len);
    user->points = points;

    return user;
}

void user_drop(User * user)
{
    free(user->points);
    free(user);
}

int main()
{
    User * user = user_const(5);
    for (int i=0; i<user->len; i++) {
        printf("%d\n", user->points[i]);
    }
    user_drop(user);

    return 0;
}
