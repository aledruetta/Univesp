/* A Double-Buffered Program
 */

// #include <GL/gl.h>
// #include <GL/glu.h>
// #include <GL/glut.h>
// #include <GL/glx.h>
#include <GL/freeglut.h>

static GLfloat spin = 0.0;

void display(void)
{
    glClear(GL_COLOR_BUFFER_BIT);
    glPushMatrix();
    glRotatef(spin, 0.0, 0.0, 1.0);
    glRectf(-25.0, -25.0, 25.0, 25.0);
    glPopMatrix();

    glFlush();
    glXSwapBuffers(glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB), glutCreateWindow("Title"));
}

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
        glVertex2f(-0.5, -0.5);
        glVertex2f(-0.5, 0.5);
        glVertex2f(0.5, 0.5);
        glVertex2f(0.5, -0.5);
    glEnd();
    glFlush();

    // Loop
    glutMainLoop();

    return 0;
}
