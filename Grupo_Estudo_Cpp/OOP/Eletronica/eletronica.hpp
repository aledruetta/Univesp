#ifndef ELETRONICA_HPP
#define ELETRONICA_HPP

using namespace std;

class Resistor
{
    public:
        Resistor ( unsigned resistencia );
        unsigned getResistencia () const;
        double getCondutancia () const;
        string getEngSimbol () const;
        string getCodigoCores () const;
        friend ostream& operator<< ( ostream& os, const Resistor res);
    private:
        unsigned resistencia_;
};

#endif /* ELETRONICA_HPP */
