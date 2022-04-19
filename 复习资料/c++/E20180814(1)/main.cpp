#include <iostream>
#include <vector>

using namespace std;


#if 0
class Base
{
public:
    virtual void f1(){cout << "Base::f1()" << endl;}
    void f2(){cout << "Base::f2()" << endl;}
    void f3(){cout << "Base::f3()" << endl;}
    virtual void f4(){cout << "Base::f4()" << endl;}
    void f5(){cout << "Base::f5()" << endl;}
    virtual void f6(){cout << "Base::f6()" << endl;}
    int m_i;

};

class Derived : public Base
{
public:
    void f1(){cout << "Derived::f1()" << endl;}
    virtual void f2(){cout << "Derived::f2()" << endl;}
    void f3(){cout << "Derived::f3()" << endl;}
    virtual void f4(){cout << "Derived::f4()" << endl;}
    void f7(){cout << "Derived::f7()" << endl;}
    virtual void f8(){cout << "Derived::f8()" << endl;}
};

int main()
{
    Base *p;
    Derived d;
    p = &d;

    p->f1();
    p->f2();
    p->f3();
    p->f4();
    p->f5();
    p->f6();
//    p->f7();
//    p->f8();

 /*   vector<Base *> v;
    int n;

    while(cin >> n)
    {
        if(1 == n)
        {
            v.push_back(new Base);
        }
        else
        {
            v.push_back(new Derived);
        }
    }

    for(size_t i = 0;i < v.size();++i)
    {
        v[i]->fn();
    }
*/
    return 0;
}



class Animal
{
public:
    Animal(){cout << "Animal()" << endl;}
    virtual ~Animal(){cout << "~Animal()" << endl;}
    virtual void speak() = 0;
};


class Dog : public Animal
{
public:
    Dog(){cout << "Dog()" << endl;}
    virtual ~Dog(){cout << "~Dog()" << endl;}
    virtual void speak()
    {
        cout << "wangwang" << endl;
    }
};

class Cat : public Animal
{
public:
    Cat(){cout << "Cat()" << endl;}
    ~Cat(){cout << "~Cat()" << endl;}
    void speak(){cout << "miaomiao" << endl;}
};

class Sheep : public Animal
{
public:
    Sheep(){cout << "Sheep()" << endl;}
    ~Sheep(){cout << "~Sheep()" << endl;}
    void speak(){cout << "miemie" << endl;}
};


int main(void)
{
//    Animal a;
    vector<Animal *> v;

    int n;

    while(cin >> n)
    {
        if(1 == n)
        {
            v.push_back(new Dog);
        }
        else if(2 == n)
        {
            v.push_back(new Cat);
        }
        else
        {
            v.push_back(new Sheep);
        }
    }

    for(auto &x : v)
    {
        x->speak();
    }

    for(auto &x : v)
    {
        delete x;
    }


//    p->speak();
    return 0;
}



class Base
{
public:
    virtual void fn(){}
};


class Derived : public Base
{
public:
    virtual void fn(){}
};

int main(void)
{
    Base *p;
    Derived d;
    Base b;
    p = &d;

    Derived * q = dynamic_cast<Derived *>(p);

    if(q != nullptr)
    {
        cout << "OK" << endl;
    }
    else
    {
        cout << "error!" << endl;
    }

    return 0;
}

class CNY
{
public:
    CNY(double val = 0) : value(val){}
    void show(){cout << "￥" << value << endl;}
//    CNY operator +(const CNY &ref) const
//    {
//        CNY ret(value + ref.value);
//        return ret;
//    }

    bool operator >(const CNY &ref)const
    {
        return value > ref.value;
    }

    CNY &operator ++()
    {
        value += 1;
        return *this;
    }

    CNY operator ++(int)
    {
        CNY ret(*this);
        value += 1;
        return ret;
    }

    CNY& operator =(const CNY &ref);

    CNY *operator &()
    {
        cout << "operator &()" << endl;
        return this;
    }

    const CNY *operator &() const
    {
        cout << "const operator &()" << endl;
        return this;//const CNY *
    }

private:
    double value;
    friend CNY operator +(const CNY &ref1, const CNY &ref2);
    friend ostream& operator <<(ostream &out,const CNY &ref );
};

CNY operator +(const CNY &ref1, const CNY &ref2)
{
    CNY ret(ref1.value + ref2.value);
    return ret;
}

ostream& operator <<(ostream &out,const CNY &ref )
{
    out << "￥" << ref.value;
    return out;
}

CNY& CNY::operator =(const CNY &ref)
{
    value = ref.value;
    return *this;
}

template <typename T>
struct Node
{
    T Value;
    Node *Next;
};

template <typename T>
class List
{
public:
    List() : pHead(nullptr)
    {

    }
    List(const List &ref) : pHead(nullptr)
    {
        Node<T> *p = ref.pHead;
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

    void push_front(T val);
    void push_back(T val);
    void show();
    void free();


private:
    Node<T> *pHead;
};


template <typename T>
void List<T>::push_front(T val)
{
    Node<T> *pNew = new Node<T>;
    pNew->Value = val;
    pNew->Next = pHead;
    pHead = pNew;
}

template <typename T>
void List<T>::push_back(T val)
{
    if(pHead == nullptr)
    {
        push_front(val);
    }
    else
    {
        Node<T> *p = pHead;
        while(p->Next != nullptr)
        {
            p = p->Next;
        }
        Node<T> *pNew = new Node<T>;
        pNew->Value = val;
        p->Next = pNew;
        pNew->Next = nullptr;
    }
}

template <typename T>
void List<T>::show()
{
    Node<T> *p = pHead;
    while(p)
    {
        cout << p->Value << ",";
        p = p->Next;
    }
    cout << "\b \n";
}

template <typename T>
void List<T>::free()
{
    while(pHead)
    {
        Node<T> *p = pHead;
        pHead = pHead->Next;
        delete p;
    }
}

int main(void)
{
    List<CNY> l;
    l.push_back(CNY(1.11));
    l.push_back(CNY(2.22));
    l.push_back(CNY(3.33));
    l.show();

    return 0;
}



template <typename T>
void print(T *p, size_t len)
{
    cout << "template" << endl;
    for(size_t i = 0;i < len;++i)
    {
        cout << p[i] << ",";
    }
    cout << "\b \n";
}

void print(int *p, size_t len)
{
    cout << "function" << endl;
    for(size_t i = 0;i < len;++i)
    {
        cout << p[i] << ",";
    }
    cout << "\b \n";
}


template <typename T>
void Sort(T *p, size_t len)
{
    for(size_t i = 0;i < len - 1;++i)
    {
        for(size_t j = i + 1;j < len;++j)
        {
            if(p[i] > p[j])
            {
                T t(p[i]);
                p[i] = p[j];
                p[j] = t;
            }
        }
    }
}

template <typename T, typename P>
auto mul(T t, P p) -> decltype(t * p)
{
    return t * p;
}

//auto mul(double d, int i) -> double
//{
//    return d * i;
//}

int main(void)
{
//    decltype (3.3 + 5) k;
//    auto l = 3.6 + 5;

//    cout << k << endl;

    cout << mul(5 ,3.3) << endl;

//    CNY a[] = {CNY(3.33), CNY(2.22), CNY(1.11)};

//    Sort(a, sizeof(a) / sizeof(a[0]));
//    print(a, sizeof(a) / sizeof(a[0]));

    return 0;
}


#include <memory>

class Demo
{
public:
    Demo() {cout << "Demo()" << endl;}
    ~Demo() {cout << "~Demo()" << endl;}
};

int main(void)
{
//    auto_ptr<Demo > p(new Demo);
    Demo *p = new Demo;

    Demo d(*p);



    return 0;
}



#include <pthread.h>
#include <unistd.h>

void *foo(void *)
{
    while(1)
    {
        cout << "Hello" << endl;
        sleep(1);
    }
    return nullptr;
}

int main(void)
{
    pthread_t id;
    pthread_create(&id, nullptr,foo,nullptr );
    pthread_join(id, nullptr);
    return 0;
}

#endif

#include <vector>
#include "hthread.h"
#include "hmutex.h"

vector<int> house;
HMutex mutex;

class TCPClient : public HThread
{
private:
    int fd;
};

class Procuder : public HThread
{
public:
    void run()
    {
        int n;
        while(1)
        {
            mutex.lock();
            cout << "Procuder : " << n << endl;
            house.push_back(n++);
            mutex.unlock();
            sleep(1);
        }
    }
};

class Customer : public HThread
{
public:
    void run()
    {
        while(1)
        {
            mutex.lock();
            if(!house.empty())
            {
                cout << "Customer : " << house.back() << endl;
                house.pop_back();
            }
            mutex.unlock();

            sleep(1);
        }
    }
};


int main(void)
{
    Procuder t1, t2;

    t1.start();
    t2.start();


    Customer c1, c2, c3;
    c1.start();
    c2.start();
    c3.start();
    c1.join();
    c2.join();
    t1.join();
    return 0;
}
