#include <iostream>

using namespace std;

namespace myvec
{
    class Vector
    {
        public:
            Vector (unsigned size): _elem{new double[size]}, _sz{size}
            {
                for (int i=0; i<size; i++) _elem[i] = 0;
            }
            ~Vector () {delete[] _elem;}
            double& operator[] (unsigned i) {return _elem[i];}
            unsigned len() const;
        private:
            double* _elem;
            unsigned _sz;
    };

    unsigned Vector::len () const
    {
        return _sz;
    }
};

int main ()
{
    myvec::Vector vec (5);
    unsigned len = vec.len();
    cout << "Length: " << len << endl;
    for (int i=0; i<len; i++) vec[i] = i * 2;
    for (int i=0; i<len; i++)
        cout << "Index [" << i << "]: " << vec[i] << endl;

    return 0;
}

