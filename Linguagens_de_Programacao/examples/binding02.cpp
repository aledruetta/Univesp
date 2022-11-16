#include <iostream>
using std::cout;
using std::endl;

class A
{
    public:

    // virtual void p()
    void p()
    {
        cout << "A::p" << endl;
    }

    void f()
    {
        p();
    }
};

class B : public A
{
    public:

    void p()
    {
        cout << "B::p" << endl;
    }
};

int main()
{
    A a;
    B b;

    // a.p();
    a.f();

    // b.p();
    b.f();

    return 0;
}