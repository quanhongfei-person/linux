#ifndef COMPLEX_H
#define COMPLEX_H

#include <iostream>
using namespace std;

class Complex
{
public:  	//公有的  所有函数的申明
    Complex(double r = 0, double i = 0); //默认形参值在申明处 
    Complex(const Complex &ref);
    ~Complex();
    Complex add(const Complex &c);

    void show()  //定义出现在申明处，则隐含的申明为内联函数，实现在申明处，则#include 处会展开
    {
        cout << real << "+" << imag << "i" << endl;
    }
private:  	//私有的
    double real;
    double imag;
};

#endif // COMPLEX_H
