#include <iostream>

using namespace std;

class MyClass
{
    public:
        MyClass () : _var{0} {}
        void set (int v) {_var = v;}
        int get () const {return _var;}

        MyClass& operator+= (MyClass m) {_var += m.get(); return *this;}
        MyClass& operator-= (MyClass m) {_var -= m.get(); return *this;}
    private:
        int _var;
};

MyClass operator+ (MyClass a, MyClass b) {MyClass r; r.set(a.get() + b.get()); return r;}
MyClass operator- (MyClass a, MyClass b) {MyClass r; r.set(a.get() - b.get()); return r;}

int main ()
{
    MyClass a, b, c;

    a.set(5);
    cout << "a: " << a.get() << endl;

    b.set(8);
    cout << "b: " << b.get() << endl;

    a += b;
    cout << "a += b: " << a.get() << endl;
    cout << "b: " << b.get() << endl;

    a += b;
    cout << "a += b: " << a.get() << endl;
    cout << "b: " << b.get() << endl;

    c = a + b;
    cout << "c = a + b: " << c.get() << endl;

    c = a - b;
    cout << "c = a - b: " << c.get() << endl;

    return 0;
}

