#include <iostream>
#include <cstdio>
using namespace std;
#if 0
void fn(int *m)
{
    ++*m;
}

int *fn()
{
    static int i;
    return &i;
}

int main()
{
    void (*pfn)(int *);
    pfn = fn;

//    int a[] = {1,2,3,4,5,6,7,8,9};

//    //a[i] <=> *(a + i)

//    int *p = a;
//    short *q = (short *)(a + 5);


//    printf("%d\n",p - q);
//    int n = 10;
//    const int *q;
//    const int * const p = &n;
//    *p;
//    int
    return 0;
}


auto Pow2(int n)->int
{
    return n * n;
}

int fn(int n)
{
    return n;
}

void Sort(int *p, size_t len, int(*pfn)(int))
{
    for(size_t i = 0;i < len - 1;++i)
    {
        for(size_t j = i + 1;j < len;++j)
        {
            if(pfn(p[i]) > pfn(p[j]) )
            {
                int t = p[i];
                p[i] = p[j];
                p[j] = t;
            }
        }
    }
}

int main(void)
{

    int i = 100;
    int j = 11;
    int k =10100;
    auto fm = [](int n){return n;};

    fm(10);
    cout << i << endl;

    int a[] = {1,-2,3,-4,5,-6,7,-8,9,0};

//    auto fm = [](int n){return n * n;};

    Sort(a, sizeof(a) / sizeof(a[0]), fm);

//    for(auto &x : a)
//    {
//        cout << x << ",";
//    }
//    cout << "\b " << endl;

    return 0;
}



bool foo(int n)
{
    return n % 2 == 0;
}

void printArr(int *p, size_t len, bool(*pfn)(int))
{
    for(size_t i = 0;i < len;++i)
    {
        if(pfn(p[i]))
        {
            cout << p[i] << " ,";
        }

    }
    cout << "\b \n";
}

int main(void)
{
    int a[] = {1,2,3,4,5,6,7,8,9,0};

    printArr(a, sizeof(a) / sizeof(a[0]), [](int n){return n % 2 == 0;});

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
public:
    int hour;
    int minute;
    int second;

    static int count;

    static int getCount()
    {
        return count;
    }
};

int Clock::count;

#include <cstdlib>
#include <string>

int main(void)
{

    int i(10);
    string s("Hello World!");

    s[0] = 'A';
    cout << s << endl;

//    int *p = new int[10];

//    delete p;


//    Clock *p = new Clock[3]{{11,22,33}, {22,33,44},{11,44,23}};//+ - *

//    if(p)
//    {
//        for(size_t i = 0;i < 3;++i)
//        {
//            p[i].show();
//        }
//        delete []p;
//        p = nullptr;
//        delete []p;
//    }

//    if(p)
//    {
//        p->show();
//        delete p;
//        p = nullptr;
//    }

    return 0;
}




int main(void)
{

    int (*pfm)();
    pfm = &Clock::getCount;

    int *q = &Clock::count;
    void (Clock::*pfn)();
    pfn = &Clock::show;

    Clock c(11,22,33);

    (c.*pfn)();

    Clock *p = &c;
    (p->*pfn)();

//    int Clock::*p1;
//    int Clock::*p2;
//    int Clock::*p3;

//    p1 = &Clock::hour;
//    p2 = &Clock::minute;
//    p3 = &Clock::second;

//    Clock c(11,22,33);
//    cout << c.*p2 << endl;

    return 0;
}


#include <cstring>

class String
{
public:
    String(const char *pStr) : m_pStr(new char[strlen(pStr) + 1])
    {
        strcpy(m_pStr, pStr);
    }

    String(const String &ref) : m_pStr(new char[strlen(ref.m_pStr) + 1])
    {
        strcpy(m_pStr, ref.m_pStr);
    }

    ~String()
    {
        delete []m_pStr;
    }

    void show()
    {
        cout << m_pStr << endl;
    }

    void assign(const char *pStr)
    {
        char *p = new char[strlen(pStr) + 1];
        strcpy(p, pStr);
        delete []m_pStr;
        m_pStr = p;
    }

    void assign(const String &s)
    {
        if(&s == this)
        {
            return ;
        }
        char *p = new char[strlen(s.m_pStr) + 1];
        strcpy(p, s.m_pStr);
        delete []m_pStr;
        m_pStr = p;
    }

    void append(const char *pStr)
    {
        char *p = new char[strlen(m_pStr) + strlen(pStr) + 1];
        strcpy(p, m_pStr);
        strcat(p, pStr);
        delete []m_pStr;
        m_pStr = p;
    }

private:
    char *m_pStr;
};

void foo(String ss)
{
    ss.show();
}

int main(void)
{
    String s1("Hello World!");//const char *
//    s1.assign("cpp language");
//    s1.show();
//    s1.assign(s1);

//    String s2("1234567");
//    s1.assign(s2);

    s1.append("cpp language");
    s1.show();
//    foo(s1);
//    String s2(s1);
//    s2.show();

    return 0;
}
#endif

struct Node
{
    int Value;
    Node *Next;
};

class List
{
public:
    List() : pHead(nullptr)
    {

    }
    List(const List &ref) : pHead(nullptr)
    {
        Node *p = ref.pHead;
        while(p)
        {
            push_back(p->Value);
            p = p->Next;
        }
    }

    ~List()
    {
        free();
    }

    void push_front(int val);
    void push_back(int val);
    void show();
    void free();


private:
    Node *pHead;
};

void List::push_front(int val)
{
    Node *pNew = new Node;
    pNew->Value = val;
    pNew->Next = pHead;
    pHead = pNew;
}

void List::push_back(int val)
{
    if(pHead == nullptr)
    {
        push_front(val);
    }
    else
    {
        Node *p = pHead;
        while(p->Next != nullptr)
        {
            p = p->Next;
        }
        Node *pNew = new Node;
        pNew->Value = val;
        p->Next = pNew;
        pNew->Next = nullptr;
    }
}

void List::show()
{
    Node *p = pHead;
    while(p)
    {
        cout << p->Value << ",";
        p = p->Next;
    }
    cout << "\b \n";
}

void List::free()
{
    while(pHead)
    {
        Node *p = pHead;
        pHead = pHead->Next;
        delete p;
    }
}

int main(void)
{
    List l;
    l.push_back(1);
    l.push_back(2);
    l.push_back(3);
    l.show();

    List ll(l);
    ll.show();

//    l.free();
//    l.show();
    return 0;
}


