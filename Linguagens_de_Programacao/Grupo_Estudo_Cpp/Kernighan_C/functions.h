#ifndef FUNCTIONS_H
#define FUNCTIONS_H

#define TABSTOP 8

int get_line(char line[], int maxline);
void entab(char line[], int len);
void detab(char line[], int len);
void clear_stdin();

#endif /* FUNCTIONS_H */
