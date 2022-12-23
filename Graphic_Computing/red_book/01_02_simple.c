/* A Simple OpenGL Program
 * A white rectangle on a black background
 */

#include <GL/glut.h>

int main(int argc, char ** argv)
{
    // Init
    glutInit(&argc, argv);
    glutInitDisplayMode (GLUT_SINGLE | GLUT_RGB);
    glutInitWindowSize (300, 300);
    glutInitWindowPosition (100, 100);
    glutCreateWindow (argv[0]);

    // Display
    glClearColor(0.0, 0.0, 0.0, 0.0);
    glClear(GL_COLOR_BUFFER_BIT);
    glColor3f(1.0, 1.0, 1.0);
    glOrtho(-1.0, 1.0, -1.0, 1.0, 0, 0);
    glBegin(GL_POLYGON);
        glColor3f(0.0, 1.0, 1.0);
        glVertex2f(-0.5, -0.5);

        glColor3f(1.0, 0.0, 1.0);
        glVertex2f(-0.5, 0.5);

        glColor3f(1.0, 1.0, 0.0);
        glVertex2f(0.5, 0.5);

        glColor3f(1.0, 1.0, 1.0);
        glVertex2f(0.5, -0.5);
    glEnd();
    glFlush();

    // Loop
    glutMainLoop();

    return 0;
}
