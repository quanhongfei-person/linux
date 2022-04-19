#include <iostream>
#include <cstring>
using namespace std;


#if 0
namespace XA       //全局命名空间//
{
    class TTT
    {

    };
    int i = 10;   //具有命名空间作用域的变量也称为全局变量//
    void fn(){}
}

namespace BJ
{
    class TTT
    {

    };
    int i = 100;
    void fn(){}
}

using namespace XA;      //此下的变量是XA中变量//

int main(void)
{
//    XA::TTT t1;
//    BJ::TTT t2;
//    XA::fn();
    fn();
    i = 100;
    BJ::fn();
    return 0;
}




Clock bar()      
{
    Clock ret;    //构造函数//
    return ret;   //返回Clock类型ret后，复制构造//
}

int add(int a, int b);//参数可省，最好加上//
//int div(int fz, int fm);

int main()
{
    Clock c;
    c.show();
    Clock *p = &c;    //*p 引用c   构造函数//
    p->show();
    for(int i = 0;i < 10;++i)
    {
        cout << i << endl;
    }

    return 0;
}

int add(int a, int b)
{
    return a + b;
}


namespace        //匿名命名空间//
{
    class AAA
    {
        void f1()
        {

        }
    };
    void fn(){}
}

namespace Out     //嵌套命名空间//
{         //在命名空间作用域中声明的对象都是具有静态生存期（全局变量）的//
    namespace Inner
    {
        class BBB
        {

        };

//        int BBB;    //不可同名//
    }

}

void foo()
{
    int i;
}

int i = 1;    //全局变量i在main函数第一行被创建，return前销毁//
						
class AAA
{
    void fn()
    {
        int a;
        this->a = 100;  //此a访问fn函数的//
    }

    int a;
};

int main(void)
{
    int i = 10;

    {
        int i = 1000;
        cout << i << endl;      //此a = 1000//
    }
    cout << i << endl;			//此a = 100//
    return 0;
}


class Demo
{
public:
    Demo(int n) : m_i(n) {cout << "Demo(int)" << endl;} //构造函数//
    ~Demo() {cout << "~Demo()" << endl;}
    void show()
    {
        cout << m_i << endl;
    }

    int m_i;
};

//Demo d;

//void fn()
//{
//    static Demo d;  //静态局部类对象，未被初始化，则为0//

//}

Demo foo()
{
    Demo ret(10);
    return ret;
}

int main(void)
{

    Demo &&ref = foo();    //c++规定//
    &ref;

//    cout << "start" << endl;						    //左值:locatianable(只读),右值：readable（可读写）//
//    const Demo &ref（） = Demo(10);       			//Demo(10)构造匿名对象，只能为右值，且生存期只存在本行//
//    cout << "end" << endl;       				  		//匿名起名后，生存期加至所在{}中；// 
														//输出->start->Demo(int)->end->~Demo()//
													
//    Demo dd;
//
//

//    for(int i = 0;i < 10;++i)
//    {
//        Demo dd;
//        cout << dd.m_i << endl;
//    }
//    fn();
//    fn();
//    fn();
//    fn();

    return 0;
}



#include <string>

class Employee
{                			//本类所有成员共享静态数据成员（内存）//
public:
    Employee()
    {
//        companyName = "XXXkejiyouxiangongsi";
    }
    void fn()        //companyName私有，封装公有函数传//
    {
        getName();
        cout << companyName;
    }

    static string getName()
    {
//        m_i = 100;
//        fn();
        return companyName;
    }

    static void setName(const string &ref)    //2 静态函数成员，有静态生存期//
    {                                         //访问用法：类名：：标识符//
        companyName = ref;
    }

private:
    int m_i;
    static string companyName;       //1 静态数据成员申明//
};

string Employee::companyName;  //静态数据成员//

int main(void)
{


    Employee::setName("xxxxiaomaobu") ;    //用法：类名：：标识符//
    cout << Employee::getName() << endl;

//    cout << Employee::companyName << endl;       //访问不到companyName（Employee不是对象->无this指针）//

    Employee e1, e2, e3, e4;

//    cout << Employee::companyName << endl;

//    Employee::companyName = "xxxxiaomaibu";

//    e1.companyName = "XXXxiaomaibu";
//    cout << Employee::companyName << endl;
    cout << e2.getName() << endl;
    cout << e3.getName() << endl;
//    cout << e4.companyName << endl;

//    cout << sizeof(e1) << endl;

    return 0;
}


#include "demo.h"
#include <cstdio>
class Singels				//单列模式（背.记）（共23种）//
{
public:
    static Singel *createCentance()          //静态 成员函数//
    {
        if(m_p == nullptr)
        {
            m_p = new Singel;
        }
        return m_p;
    }

    static void destroyCentance()  			 //静态 成员函数//
    {
        if(m_p != nullptr)
        {
            delete m_p;
            m_p = nullptr;
        }
    }

    static int getCount()
    {
       return count;
    }

private:
    Singel(){++count;}
    Singel(const Singel &){}
    ~Singel(){--count;}
    static Singel *m_p;     申明
    static int count;		//申明   默认count = 0;//
};

Singel* Singel::m_p;	//静态 数据成员在类外定义和初始化//
int Singel::count;      //静态 数据成员在类外定义和初始化//



int main(void)
{

    cout << Singel::getCount() << endl;

    Singel *p;                //复制构造//
    p = Singel::createCentance();
    cout << Singel::getCount() << endl;

    Singel *q;
    q = Singel::createCentance();
    cout << Singel::getCount() << endl;

    Singel::destroyCentance();
    cout << Singel::getCount() << endl;



//    Demo d1, d2, d3, d4;
//    cout << Demo::getCount() << endl;

//    {
//        Demo d5, d6;
//        cout << Demo::getCount() << endl;
//    }
//    Demo d7(d1);

//    cout << Demo::getCount() << endl;



    return 0;
}

/**********//用法:firend (函数/class 类对象)的声明//**********/
class Point
{
public:
    Point(int xx, int yy) : x(xx), y(yy){}
    int getX() {return x;}
    int getY() {return y;}
private:
    int x, y;
    friend double Distance(const Point &p1, const Point &p2);
    friend class AAA;   //Distance是Point的一个友元函数，AAA是一个友元类//
};

double Distance(const Point &p1, const Point &p2)
{
    double ret;
    ret = (p1.y - p2.y) * (p1.y - p2.y);
    return ret;
}

class AAA
{
    void fn()
    {
        Point p(1,1);
        p.y = 100;
    }
private:
    int m_i;

};

int main(void)
{
    Point p1(1,1);
    Point p2(2,2);

    return 0;
}


class Clock
{
public:

    Clock(int h = 0, int m = 0, int s = 0) : hour(h), minute(m),  second(s), m_i(100)
    {
//        std::cout << "Clock(int, int , int)" << std::endl;
    }

    Clock(const Clock &ref) : hour(ref.hour), minute(ref.minute), second(ref.second), m_i(ref.m_i)
    {
//        std::cout << "Clock(Clock &)" << std::endl;
    }

    ~Clock()
    {
//        cout << "~Clock()" << endl;
    }

    void show() const
    {
        cout << hour << ":" << minute << ":" << this->second << endl;
    }

    void fn() const      //常成员函数--->不能调用非 常成员函数//
    {
        cout << hour << endl;
//        setTime(12,33,44);
    }

    void setTime(int h, int m, int s)
    {
        fn();
        hour = h;
        minute = m;
        second = s;
    }
private:
    int hour;
    int minute;     //定义//
    int second;
    const int m_i;      //常 数据成员//

};






int main(void)
{
    volatile const int i = 100;   //i默认在寄存器上，volatile禁止优化使i在内存上//
    int *p = const_cast<int *>(&i);      //const_cast<int*> 类似强转//

    *p = 1000;

    cout << *p << endl;
    cout << i << endl;



//    Clock c(11,22,33);        
//    c.fn();                   5//const Clock *
//    c.setTime(11,22,33);
//    c.show();

    return 0;
}



void foo(int *p, size_t len)
{
    for(size_t i = 0;i < len;++i)
    {
        cout << p[i] << endl;
    }
}



void foo(Clock *p, size_t len)
{
    for(size_t i = 0;i < len;++i)
    {
        (p + i)->show();
    }
}

int main(void)
{
//    int b[3] = {3,2,1};  //定义并初始化//
//    b[0] = 10;     //赋值//

    Clock a[3] = {Clock(11,22,33), Clock(22,44,55), Clock(20,11,22)};

    foo(a, sizeof(a) / sizeof(a[0]));
//    for(size_t i = 0;i < sizeof(a) / sizeof(a[0]);++i)
//    {
//        (a + i)->show();
//    }

//    int a[10] = {1,2,3,4,5,};
//    int *p = a;

//    foo(a, sizeof(a) / sizeof(a[0]));

//    for(auto &x : a)
//    {
//        ++x;
//    }

//    for(auto &x : a)
//    {
//        cout << x << endl;
//    }

//    for(size_t i = 0;i < sizeof(a) / sizeof(a[0]);++i)
//    {
//        cout << a[i] << endl;
//    }

    return 0;
}
#endif

#include <vector>
#include <algorithm>
#include <functional>

void foo(const vector<int> &vv)
{
    for(size_t i = 0;i < vv.size();++i)
    {
        cout << vv[i] << endl;
    }
}

void Revese(vector<int> &vv)  //vector<int>类型*************************************************//
{
    size_t len = vv.size();
    for(size_t i = 0;i < len / 2;++i)	
    {
        int t;
        t = vv[i];
        vv[i] = vv[len - i - 1];
        vv[len - i - 1] = t;
    }
}

class Clock
{
public:

    Clock(int h, int m, int s) : hour(h), minute(m),  second(s), m_i(100)
    {
        std::cout << "Clock(int, int , int)" << std::endl;
    }

    Clock(const Clock &ref) : hour(ref.hour), minute(ref.minute), second(ref.second), m_i(ref.m_i)
    {
        std::cout << "Clock(Clock &)" << std::endl;
    }

    ~Clock()
    {
        cout << "~Clock()" << endl;
    }

    void show() const
    {
        cout << hour << ":" << minute << ":" << this->second << endl;
    }

    void fn() const            
    {
        cout << hour << endl;
//        setTime(12,33,44);
    }

    void setTime(int h, int m, int s)
    {
        fn();
        hour = h;
        minute = m;
        second = s;
    }
private:
    int hour;
    int minute;
    int second;
    const int m_i;            //常对象成员变量//

};

int main(void)
{

    vector<Clock> v;       
    v.push_back(Clock(11,22,33));
    v.push_back(Clock(22,33,44));

    v.pop_back();

//    vector<int> v = {1,-2,3,-4,5,-6,7,-8,9};

//    sort(v.begin(), v.end(), greater<int>());
//    reverse(v.begin(), v.end());//[)

//    for(int i = 0;i < 10;++i)
//    {
//        v.push_back(10);
//    }
//    Revese(v);
//    foo(v);

//    for(size_t i = 0;i < v.size();++i)
//    {
//        cout << v[i] << endl;
//    }

    return 0;
}

