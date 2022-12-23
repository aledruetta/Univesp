#include <iostream>
using std::cout;
using std::endl;

class A
{
    public:

    void p()
    {
        cout << "A::p" << endl;
    }

    virtual void q()
    {
        cout << "A::q" << endl;
    }

    void f()
    {
        p();
        q();
        cout << endl;
    }
};

class B : public A
{
    public:

    void p()
    {
        cout << "B::p" << endl;
    }

    void q()
    {
        cout << "B::q" << endl;
    }
};

int main()
{
    A a;
    B b;

    a.f();
    b.f();

    a = b;
    a.f();

    return 0;
}