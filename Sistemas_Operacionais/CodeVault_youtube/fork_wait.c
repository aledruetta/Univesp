#include <stdio.h>
#include <unistd.h>

int main()
{
	int pid = fork();
	int n;

	if (pid == 0)
		n = 1;
	else
		n = 6;

	int i;
	for (i = n; i < n + 5; i++)
	{
		printf("%d ", i);
		fflush(stdout);
	}
	printf("\n");

	return 0;
}