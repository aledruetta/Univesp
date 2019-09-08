#ifndef ELETRONICA_HPP
#define ELETRONICA_HPP

class Resistor
{
    public:
        Resistor ( unsigned resistencia );
        unsigned getResistencia () const;
        double getCondutancia () const;
        void getCodigoCores () const;
    private:
        unsigned resistencia_;
};

#endif /* ELETRONICA_HPP */
