#include <iostream>
#include <limits>

/*
 * Adaptado do código do Leonardo Dorathoto
 * A função getMinMax permite obter os valores mínimos e máximos
 * de um tipo.
 */

using namespace std;

template<typename T>
void getMinMax (T& tmin, T& tmax)
{
    tmin = numeric_limits<T>::min();
    tmax = numeric_limits<T>::max();
}

int main ()
{
    int i_min, i_max;
    unsigned u_min, u_max;
    long l_min, l_max;
    unsigned long ul_min, ul_max;
    double d_min, d_max;
    long double ld_min, ld_max;

    getMinMax(i_min, i_max);
    getMinMax(u_min, u_max);
    getMinMax(l_min, l_max);
    getMinMax(ul_min, ul_max);
    getMinMax(d_min, d_max);
    getMinMax(ld_min, ld_max);

    cout << "\n"
         << "int min:                " << i_min   << "\n"
         << "int max:                " << i_max   << "\n\n"
         << "unsigned min:           " << u_min   << "\n"
         << "unsigned max:           " << u_max   << "\n\n"
         << "long min:               " << l_min   << "\n"
         << "long max:               " << l_max   << "\n\n"
         << "unsigned long min:      " << ul_min  << "\n"
         << "unsigned long max:      " << ul_max  << "\n\n"
         << "double min:             " << d_min   << "\n"
         << "double max:             " << d_max   << "\n\n"
         << "long double min:        " << ld_min  << "\n"
         << "long double max:        " << ld_max  << "\n"
         << endl;

    return 0;
}

