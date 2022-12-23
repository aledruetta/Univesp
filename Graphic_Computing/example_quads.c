#include <GL/glut.h>

void displayMe(void)
{
    float size = 0.5f;
    float center = 0.0f;
    float offset = 0.08f;

    glClear(GL_COLOR_BUFFER_BIT);

    // red botton-left quad
    glBegin(GL_QUADS);
    glColor3f(1.0f, 0.0f, 0.0f);    // Red
    glVertex2f(-size, -size);       // botton-left
    glVertex2f(-offset, -size);     // botton-right
    glVertex2f(-offset, -offset);   // top-right
    glVertex2f(-size, -offset);     // top-left
    glEnd();

    // green botton-right quad
    glBegin(GL_QUADS);
    glColor3f(0.0f, 1.0f, 0.0f);    // Green
    glVertex2f(center, -size);      // botton-left
    glVertex2f(size, -size);        // botton-right
    glVertex2f(size, center);       // top-right
    glVertex2f(center, center);     // top-left
    glEnd();

    // blue top-right quad
    glBegin(GL_QUADS);
    glColor3f(0.0f, 0.0f, 1.0f);    // Blue
    glVertex2f(center, center);     // botton-left
    glVertex2f(size, center);       // botton-right
    glVertex2f(size, size);         // top-right
    glVertex2f(center, size);       // top-left
    glEnd();

    // white top-left quad
    glBegin(GL_QUADS);
    glColor3f(1.0f, 1.0f, 1.0f);    // White
    glVertex2f(-size, center);      // botton-left
    glVertex2f(center, center);     // botton-right
    glVertex2f(center, size);       // top-right
    glVertex2f(-size, size);        // top-left
    glEnd();

    /*
    glBegin(GL_POLYGON);
    glVertex3f(0.5, 0.0, 0.5);
    glVertex3f(0.5, 0.0, 0.0);
    glVertex3f(0.0, 0.5, 0.0);
    glVertex3f(0.0, 0.0, 0.5);
    glEnd();
    */

    glFlush();
}

int main(int argc, char** argv)
{
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_SINGLE);
    glutInitWindowSize(400, 400);
    glutInitWindowPosition(100, 100);
    glutCreateWindow("Hello world!");
    glutDisplayFunc(displayMe);
    glutMainLoop();

    return 0;
}
