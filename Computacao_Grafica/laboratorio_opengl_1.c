/* Laboratório OpenGL 1
 * Computação Gráfica
 * UNIVESP
 *
 * compilar:
 *      make lab1
 *
 * executar:
 *      ./a.out
 */

#include <GL/glut.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define MAXPOINTS 50

void init();
void display();

typedef struct {
    int x;
    int y;
} Point;

Point points[MAXPOINTS];
int nro_points = 0;


int main(int argc, char** argv)
{
    int x, y;

    char *file_name = "lab1.txt";
    FILE *in_file = fopen(file_name, "r");

    if (in_file == NULL) {
        printf("Arquivo \"%s\" inexistente!\n", file_name);
        exit(-1);
    }

    while (nro_points < MAXPOINTS) {
        fscanf(in_file, "%d %d", &x, &y);
        if (x == -1 && y == -1)
            break;
        Point point = {x, y};
        points[nro_points] = point;
        printf("(%d, %d)\n", points[nro_points].x, points[nro_points].y);
        nro_points++;
    }

    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);
    glutInitWindowSize(600, 300);
    glutInitWindowPosition(100, 100);
    glutCreateWindow("OpenGL Laboratory 1");
    init();
    glutDisplayFunc(display);
    glutMainLoop();

    return 0;
}

void init()
{
    glClearColor(1.0, 1.0, 1.0, 1.0);
    glOrtho(0, 256, 0, 256, -1, 1);
}

void display()
{
    int nro = 0;

    glClear(GL_COLOR_BUFFER_BIT);
    glColor3f(0.0, 0.0, 0.0);
    glLineWidth(2.0);

    glBegin(GL_LINES);

    while (nro < nro_points-1) {
        glVertex2i(points[nro].x, points[nro].y);
        glVertex2i(points[nro+1].x, points[nro+1].y);
        nro++;
    }

    glEnd();
    glFlush();
}
