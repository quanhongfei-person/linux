#include <iostream>

using namespace std;


#if 0
class Base
{
public:
    void fn(){cout << "Base::fn()" << endl;}
    void foo(){cout << "Base::foo()" << endl;}
    int m_i;
};


class Derived : public Base
{
public:
    void fm() {cout << "Derived::fm()" << endl;}
    void foo(){cout << "Derived::foo()" << endl;}
    int m_j;
    int m_i;
};

int main()
{
    Derived d;
    d.foo();
//    d.fn();
//    d.m_i = 100;
//    d.fm();

    cout << sizeof(d) << endl;
    return 0;
}


class Base
{
public:
    int m_i;
protected:
    int m_j;
private:
    int m_k;
};

struct Derived :  Base
{
public:
    void fn()
    {
        m_i = 10;
        m_j = 10;
//        m_k = 10;
        m_t = 100;
    }
private :
    int m_t;
};

int main(void)
{

    Derived d;
    d.m_i = 10;
    cout << sizeof(d) << endl;
//    d.m_j = 10;
    return 0;
}


class Clock
{
public:

    Clock(int h = 0, int m = 0, int s = 0) : hour(h), minute(m),  second(s)
    {
        cout << "Clock(int, int , int)" << endl;
    }

    Clock(const Clock &ref) : hour(ref.hour), minute(ref.minute), second(ref.second)
    {
        cout << "Clock(Clock &)" << endl;
    }

    ~Clock()
    {
        cout << "~Clock()" << endl;
    }

    void show()
    {
        cout << hour << ":" << minute << ":" << this->second << endl;
    }

    void setTime(int hour, int m, int s)
    {
        this->hour = hour;
        this->minute = m;
        this->second = s;
    }
protected:
    int hour;
    int minute;
    int second;


};

class CalendarClock : public Clock
{
public:
    void setTime(int y,int m, int d, int h, int mm, int s)
    {
        year = y;
        month = m;
        day = d;
        Clock::setTime(h, mm, s);

    }

    void show();
private:
    int year, month, day;
};



int main(void)
{
    CalendarClock c;
    c.setTime(2018, 8, 11, 11, 22, 33);
    return 0;
}


class Clock
{
public:

    Clock(int h, int m, int s) : hour(h), minute(m),  second(s)
    {
        cout << "Clock(int, int , int)" << endl;
    }

    Clock(const Clock &ref) : hour(ref.hour), minute(ref.minute), second(ref.second)
    {
        cout << "Clock(Clock &)" << endl;
    }

    ~Clock()
    {
        cout << "~Clock()" << endl;
    }

    void show()
    {
        cout << hour << ":" << minute << ":" << this->second << endl;
    }

    void setTime(int hour, int m, int s)
    {
        this->hour = hour;
        this->minute = m;
        this->second = s;
    }
    static int getCount()
    {
        return count;
    }

private:
    static int count;
protected:
    int hour;
    int minute;
    int second;
};

int Clock::count;

class CalendarClock : public Clock
{
public:

    CalendarClock(int y = 0,int m = 0, int d = 0, int h = 0, int mm = 0, int s = 0) :
        Clock(h, mm, s), year(y), month(m), day(d)
    {
        cout << "CalendarClock(int ,int , int , int , int , int )" << endl;
    }

    CalendarClock(const CalendarClock &ref) : Clock(ref), year(ref.year), month(ref.month), day(ref.day)
    {
        cout << "CalendarClock(& )" << endl;
    }

    ~CalendarClock()
    {
        cout << "~CalendarClock()" << endl;
    }

    void setTime(int y,int m, int d, int h, int mm, int s)
    {
        year = y;
        month = m;
        day = d;
        Clock::setTime(h, mm, s);

    }

    void show()
    {
        cout << year << "-" << month << "-" << day << " " << hour << ":" << minute << ":" << second << endl;
    }

    void start()
    {

    }


private:
    int year, month, day;
};



int main(void)
{
    CalendarClock c;
    c.show();

    CalendarClock cc(c);
    cc.show();

    cout << CalendarClock::getCount() << endl;

//    Clock *p;
//    p = &c;

//    cout << sizeof(c) << endl;


    return 0;
}



class Base0
{
public:
    Base0(int n) : var0(n) {cout << "Base0()" << endl;}
    ~Base0() {cout << "~Base0()" << endl;}
    int var0;
};

class Base1 :virtual public Base0
{
public:
    Base1() : Base0(2) {cout << "Base1()" << endl;}
    ~Base1() {cout << "~Base1()" << endl;}
    int var1;
};

class Base2 :virtual public Base0
{
public:
    Base2() : Base0(1) {cout << "Base2()" << endl;}
    ~Base2() {cout << "~Base2()" << endl;}
    int var2;
};

class Derived : public Base1 , public Base2
{
public:
    Derived() : Base0(1)
    {cout << "Derived()" << endl;}
    ~Derived() {cout << "~Derived()" << endl;}
    int vard;
};

int main(void)
{
//    cout << sizeof(Derived) << endl;
    Derived d;
//    Base1 b;
//    d.var0 = 10;
    return 0;
}

#endif

class Base
{
  public:
      Base(int i) { cout << i; }
      ~Base () { }
};
class Base1: virtual public Base
{
  public:
      Base1(int i, int j=0) : Base(j) { cout << i; }
      ~Base1() {}
};
class Base2: virtual public Base
{
  public:
      Base2(int i, int j=0) : Base(j) { cout << i; }
      ~Base2() {}
};
class Derived : public Base2, public Base1
{
  public:
      Derived(int a, int b, int c, int d) : mem1(a), mem2(b), Base1(c),
                               Base2(d), Base(a)
        {
        cout << b;
    }
  private:
      Base2 mem2;
      Base1 mem1;
};

//14302012
int main()
{
    Derived objD (1, 2, 3, 4);
    return 0;
}


