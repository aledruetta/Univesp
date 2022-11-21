#include <iostream>
using std::cout;
using std::endl;

class A
{
    public:
    // virtual void p()
    void p() { cout << "A::p" << endl; }
};

class B : public A
{
    public:
    void p() { cout << "B::p" << endl; }
};

int main()
{
    B b;
    b.p();          // virtual dynamically binds this.p() to B::p
                    // compiler statically binds b.p() to B::p

    A a = b;
    a.p();          // virtual dynamically binds this.p() to A::p
                    // compiler statically binds a.p() to A::p

    B * bp = &b;
    bp->p();        // virtual dynamically binds this->p() to B::p
                    // compiler statically binds b->p() to B::p

    A * ap = &b;
    ap->p();        // virtual dynamically binds this->p() to B::p
                    // compiler statically binds ap->p() to A::p

    return 0;
}