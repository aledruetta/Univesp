#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

int main()
{
	int pid = fork();
	int n;

	if (pid == 0)
		n = 1;
	else
		n = 6;

	if (pid != 0) // if pid != 0, then is the parent process and wait child to finish
		wait(&pid);

	int i;
	for (i = n; i < n + 25; i++)
	{
		printf("%d ", i);
		fflush(stdout);
	}

	printf("\n");

	return 0;
}