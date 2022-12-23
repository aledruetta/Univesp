#include <stdlib.h>
#include <stdio.h>

typedef struct
{
    double x;
    double y;
} Point;

Point * point_const(double px, double py)
{
    Point * self = (Point*) malloc(sizeof self);
    self->x = px;
    self->y = py;

    return self;
}

void point_tostring(Point * self)
{
    printf("Point(%.2f, %.2f)", self->x, self->y);
}

int main(void)
{
    Point * point = point_const(4.1, 0.36);
    point_tostring(point);

    free(point);

    return 0;
}