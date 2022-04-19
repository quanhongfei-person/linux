#include <iostream>       //标准输入输出//
#include <iomanip>
#include <cstdio>
#include <cmath>
using namespace std;     //全局命名空间//

#if 0
int main()
{
    bool b = false;    //布尔型占一个字节,有两个常量表示形式，true，false//

    int i = 1234ull;//unsigned long long int
    i = i + b;

    double d;
    d = 123.7e4F;    //带F为浮点型//

    cout << b << endl; //<< 流插入运算符结合方向自左向右//
    return 0;        //cout 称为标准输出流对象  endl称为操控字，相当于'\n'换行
}


static void fn()    //fn函数只在此.c中能用//
{
    static int k;   //在主函数开始第一条指令开辟空间，在静态区，常驻内存
}

int main(void)  
{
    auto i(100 + 3.3); // i = 100 + 3.3;
    i = 33.3;

    static int k;          //生命周期//
    &k;

    cout << sizeof(i) << endl;
    return 0;
}


#define PI 3.1415  //常量宏不能取址//

int main(void)
{
//    char *p = "Hello World!";


    int i = 100;
    const int j = 1000;      //c++只读变量（常量）必须定义时初始化（编译不过）//
    &i;   //类型不是 int *，而是const int *
    const int *p;  //不能通过指针改变j//
    p = &i;		//&i == int*  右值要求既能读，又能写。左值要求只能读，不能改，符合。
    p = &j;		//&j == const int* 左值要求既能读，又能写。右值要求只能读，不能改，不符合。
    i << 0;
    return 0;
}



enum WEEK {MON, TUE, WED, THU, FRI, SAT, SUN};           //枚举与0,1,2,3,4,5,6//

int main(void)
{
//    float f = 6.33;
//    int i = 1234, j = 5678;

//    i = static_cast<int>(f);  //static_cast为函数模板，static_cast<int> 是函数名 
								//reinterpret_cast  转指针
								//dynamic_cast 
								//const_cast 
//    while(!(cin >> i))  //cin 标准流输入对象//
//    {
//        while(getchar() != '\n'){} //拿空输入缓冲区//
//        cout << "reinput " << endl;  //reinput会刷屏//
//        cin.sync();

//    }
    WEEK w;
    w = static_cast<WEEK>(8);  //static_cast<类型>—函数的多态性//
    int i;
    i = w;  //不能向枚举型赋值（可强转），枚举型可以给int型赋值//
    cout << w << endl;



//输入和输出是相对内存来说的//

    return 0;
}


int add(int a, int b)  //返回值c中默认int，c++中必须写//
{
    return a + b; //返回值为匿名对象。
}
 
int fn(int n)    //斐波拉切数列（递归）//
{
    if(1 == n || 2 == n)
    {
        return 1;
    }
    else
    {
        return fn(n - 1) + fn(n - 2);
    }
}

void swap(int *n, int *m)
{
    int t;
    t = *n;
    *n = *m;
    *m = t;
}

int main(void)
{
    int i = 3, j = 8;
    swap(&i, &j);

    cout << i << "," << j << endl;
//    add(i, j) = 10;
//    cout << fn(5) << endl;
    return 0;
}

void swap(int &n, int &m)
{
    int t;
    t = n;
    n = m;
    m = t;
}

void print(const int &n) //n只读不改，则const修饰
{
    cout << n << endl;
}

int g_i;

int &foo(int &ref)   //返回值是引用的函数//
{
    static int ret = 100; //static 延长ret生命周期，可返回 //
    return ref;   //返回值3种，static，const，&ref(引用)
}

int main(void)
{
    int i = 100, j = 200;
    foo(i) = 1234;  //将i改为1234//
    cout << i << endl;
//    print(i);
//    const int &ref = i;  
						//指针和引用的区别
							//引用必须初始化,而指针不必。
						    //指针变量有内存空间，引用没内存。
						    //有空指针NULL，没有空引用。
//    int *p = NULL;

//    cout << ref << endl;
//    ref = j;
//    swap(i, j);

//    cout << i << "," << j << endl;

    return 0;
}
#endif

#include "fun.h"


/*****************************函数重载******************************/
//在同一个作用域内，函数重载的依据（同名不同参）：
				//两个函数参数参数个数不同可以作为依据
				//两个函数参数参数类型不同可以作为依据
				//两个函数参数参数顺序不同可以作为依据
				//函数的返回值不能作为重载的依据。
double add(double a, int b)
{
    cout << "add(int, int)" << endl;
    return a + b;
}

double add(int a, double b)
{
    cout << "add(int, int)" << endl;
    return a + b;
}

double add(double a, double b, double c)
{
    cout << "add(double, double , double)" << endl;
    return a + b + c;
}

int add(int a, int b, int c)
{
    cout << "add(int, int , int)" << endl;
    return a + b + c;
}

int add(int a, int b)
{
    cout << "add(int, int)" << endl;
    return a + b;
}

int main(void)
{
    int ret;
//    ret = add(1, 2, 3);
    cout << add(1, 3) << endl;

    return 0;
}
