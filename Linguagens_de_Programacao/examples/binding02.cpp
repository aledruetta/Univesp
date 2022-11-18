#include <iostream>
using std::cout;
using std::endl;

class A
{
    public:

    // virtual void p()
    virtual void p()
    {
        cout << "A::p" << endl;
    }

    void q()
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

    // A * o = &a;
    A * o = &b;
    o->p();
    o->q();

    return 0;
}