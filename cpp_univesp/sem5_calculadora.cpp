#include <iostream>

using namespace std;

int main()
{
    char op;
    float a, b, res=0;
    int aint, bint;

    cout << "\n Use operador ';' para sair." << endl;

    while (true)
    {
        cout << " Calc: ";
        cin >> a;
        cin.get(op);
        cin >> b;

        if (b == 0 && (op == '/' || op == '%')) {
            cout << " Erro: Divisão por Zero!\n" << endl;
            continue;
        }

        switch (op)
        {
            case '+':
                res = a + b;
                break;
            case '-':
                res = a - b;
                break;
            case '*':
                res = a * b;
                break;
            case '/':
                res = a / b;
                break;
            case '%':
                cout << " Os operandos serão convertidos a inteiros!" << endl;
                a = (int) a;
                b = (int) b;
                aint = a;
                bint = b;
                res = aint % bint;
                break;
            case ';':
                cout << " Saíndo...\n" << endl;
                return 0;
            default:
                cout << " Operador inválido!\n" << endl;
                continue;
        }

        cout << " " << a << op << b << " = " << res << "\n"
             << endl;
    }

    return 0;
}

