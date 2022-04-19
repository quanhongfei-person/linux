#include <iostream>
#include "complex.h"


using namespace std;


#if 0
class Clock
{
public:
   // 初始化列表只能出现在（定义处）的构造函数中，不能放到申明处，
   // 默认形参值只能放到申明处，不能放到定义处。
   
   // 构造函数的执行流程：
   //1. 向函数传传参数，实参向形参结合。
   //2. 按数据成员申明顺序，以初始化列表的形式，为数据成员开辟空间。
   //3. 执行构造函数函数体。
   //  析构函数执行流程与构造执行相反。
 
	//带参构造函数
    Clock(int h = 0, int m = 0, int s = 0) : hour(h), minute(m),  second(s)   // 初始化列表  其中hour(h) 表示调用hour的带参构造函数，
    {
        cout << "Clock(int, int , int)" << endl;
    }
	
	//用已有对象创建新对象，即复制构造函数（引用）
    Clock(const Clock &ref) : hour(ref.hour), minute(ref.minute), second(ref.second)
    {   
        cout << "Clock(Clock &)" << endl;
    }
	//任何对象在被销毁时，会调用析构函数，析构不能带参，无法重载
	 //  析构函数执行流程与构造执行相反。
    ~Clock()
    {
        cout << "~Clock()" << endl;
    }

    void show() //在类中的所有非静态成员的参数中，都有一个隐含的this指针。
    {
        cout << hour << ":" << minute << ":" << this->second << endl;
    }

    void setTime(int hour, int m, int s)
    {
        this->hour = hour;
        this->minute = m;
        this->second = s;
    }
private:
    int hour;
    int minute;
    int second;
};

void foo(Clock ccc)  
{

    ccc.show();
}

int main()
{
    Clock c;
    Complex c1(1.1, 2.2);
    Complex c2(3.3, 4.4);

    c1.add(c2).show();

//    Clock c(10, 20, 30);
//    c.show(); //()内默认传进去主调对象地址，即 Clock * this 指针（不能写出来）
//	  在类中成员函数中，所有对数据成员的访问，都是通过this指针间接访问的。

//    foo(c);

//    Clock cc(c);
//    cc.show();


//    Complex cm(1.1, 2.2);
//    cm.show();
//    Clock cc;
//    cc.show();

//    cout << sizeof(c) << endl;
//    c.setTime(10, 22, 33);
//    c.show();

//    Clock *p = &c;
//    p->show();

//    Clock &ref = c;
//    ref.show();

    return 0;
}



class CPU
{
public:
    CPU(int n ) : MHZ(n) {cout << "CPU()" << endl;}
    ~CPU() {cout << "~CPU()" << endl;}
private:
    int MHZ;
};

class MEM
{
public:
    MEM() {cout << "MEM()" << endl;}
    ~MEM() {cout << "~MEM()" << endl;}
};

class HD
{
public:
    HD() {cout << "HD()" << endl;}
    ~HD() {cout << "~HD()" << endl;}
};

class HW
{
public:
    HW() : cpu(1000) {cout << "HW()" << endl;}
    ~HW() {cout << "~HW()" << endl;}
private:
    CPU cpu;
    MEM mem;
    HD hd;
};

class OS
{
public:
    OS() {cout << "OS()" << endl;}
    ~OS() {cout << "~OS()" << endl;}
};

class APP
{
public:
    APP() {cout << "APP()" << endl;}
    ~APP() {cout << "~APP()" << endl;}
};

class SW
{
public:
    SW() {cout << "SW()" << endl;}
    ~SW() {cout << "~SW()" << endl;}
private:
    OS os;
    APP app;
};

class Computer
{
public:
    Computer() {cout << "Computer()" << endl;}
    ~Computer() {cout << "~Computer()" << endl;}
private:
    SW sw;
    HW hw;
};
//has-a


int main(void)
{
    Computer c;
    return 0;
}



class Point
{
public:
    Point(int xx, int yy) : x(xx), y(yy)
    {
        cout << "Point(int, int)" << endl;
    }
    Point(const Point &ref) : x(ref.x), y(ref.y)
    {
        cout << "Point(&)" << endl;
    }
    ~Point()
    {
        cout << "~Point()" << endl;
    }
    int getX()
    {
        return x;
    }

    int getY()
    {
        return y;
    }

    void show()
    {
        cout << "(" << x << "," << y << ")";
    }

private:
    int x;
    int y;
};

class Line
{
public:
    Line(const Point &p, const Point &q) : p1(p), p2(q)
    {
        cout << "Line(Point, Point)" << endl;
    }
    Line(int x1, int y1, int x2, int y2) : p1(x1, y1), p2(x2, y2)
    {
        cout << "Line(int, int, int, int)" << endl;
    }
    Line(const Line &ref) : p1(ref.p1), p2(ref.p2)
    {
        cout << "Line(&)" << endl;
    }
    ~Line()
    {
        cout << "~Line()" << endl;
    }
    void show()
    {
        p1.show();
        cout << "->";
        p2.show();
        cout << endl;
    }


private:
    Point p1, p2;
};

int main(void)
{
    Point p1(1,2), p2(3, 4);
    Line l(p1, p2);
    l.show();
    return 0;
}
#endif



class BBB
{
   void fm(AAA &a)
   {

   }
};

class AAA
{
    void fn(BBB *b)
    {

    }
};



int main(void)
{
    return 0;
}
