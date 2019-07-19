#include <iostream>
using namespace std;

int main()
{
    cout << "--------------------------------------------------------------" << endl
         << "                     *** Tabela ASCII ***                     " << endl
         << "--------------------------------------------------------------" << endl;
    for (unsigned char i=33; i<127; i++)
    {
        printf("%-3i: %c | ", i, i);
        if (i % 7 == 4) cout << endl;
    }
    cout << "\n--------------------------------------------------------------" << endl;

    return 0;
}

