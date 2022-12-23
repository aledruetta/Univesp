#include <stdlib.h>
#include <stdio.h>

typedef struct
{
    double x;
    double y;
    void (*tostring)(void * self);
} Point;

void point_tostring(void * void_self)
{
    Point * self = (Point*)void_self;
    printf("Point(%.2f, %.2f)", self->x, self->y);
}

Point * point_const(double px, double py)
{
    Point * self = (Point*) malloc(sizeof self);
    self->tostring = &point_tostring;
    self->x = px;
    self->y = py;

    return self;
}

int main(void)
{
    Point * point = point_const(4.2, 0.38);
    point->tostring(point);

    free(point);

    return 0;
}