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

    A * x = &b;
    // if A::p was declared as virtual
    x->p();     // this->p() is called and this refers to b that is an object of type B
    x->q();
    // else if A::p was not declared as virtual
    // x->p() means A::p()
    a = b;
    a.p();      // this.p() is called and this refers to a that is an object of type A

    return 0;
}