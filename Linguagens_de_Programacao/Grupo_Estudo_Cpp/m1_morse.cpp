/*
 * =====================================================================================
 *
 *       Filename:  m1_morse.cpp
 *
 *    Description:  Tradutor Código Morse
 *
 *        Version:  1.0
 *        Created:  24/07/2019 13:34:20
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Alejandro Druetta
 *   Organization:  Eng. Computação - Univesp
 *
 * =====================================================================================
 */

#include <iostream>
using namespace std;

typedef struct {
    char letra;
    string codigo;
} Morse;

int main ()
{
    Morse morse[] = {
        {'a', ".-"  },
        {'b', "-..."},
        {'c', "-.-."},
        {'d', "-.." },
        {'e', "."   },
        {'f', "..-."},
        {'g', "--." },
        {'h', "...."},
        {'i', ".."  },
        {'j', ".---"},
        {'k', "-.-" },
        {'l', ".-.."},
        {'m', "--"  },
        {'n', "-."  },
        {'o', "---" },
        {'p', ".--."},
        {'q', "--.-"},
        {'r', ".-." },
        {'s', "..." },
        {'t', "-"   },
        {'u', "..-" },
        {'v', "...-"},
        {'w', ".--" },
        {'x', "-..-"},
        {'y', "-.--"},
        {'z', "--.."}
    };

    string texto;

    cout << "\nApenas caracteres alfabéticos ASCII\n"
         << "Fala aí: ", getline(cin, texto);

    for (char ch : texto)
    {
        ch = tolower(ch);
        if (ch == 32) cout << "   ";
        else if (ch >= 97 && ch <= 122)
            cout << morse[ch-97].codigo << " ";
    }
    cout << "\n" << endl;

    return 0;
}

