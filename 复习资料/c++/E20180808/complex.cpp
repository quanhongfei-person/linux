#include "complex.h"



Complex::Complex(double r, double i)  : real(r), imag(i)
{
    cout << "Complex(double, double)" << endl;
}

Complex::Complex(const Complex &ref) :real(ref.real), imag(ref.imag)
{
    cout << "Complex(&)" << endl;
}

Complex::~Complex()
{
    cout << "~Complex()" << endl;
}

Complex Complex::add(const Complex &c)
{
    Complex ret(real + c.real, imag + c.imag);
    return ret;
}

//void Complex::show()
//{
//    cout << real << "+" << imag << "i" << endl;
//}
