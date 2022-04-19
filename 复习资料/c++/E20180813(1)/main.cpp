#include <iostream>
using namespace std;
/**************************运算符重载*******************************/
#if 0

class USD      
{
public:
    USD(double val) : value(val){} // 带参构造 //   

private:
    double value;
    friend ostream& operator <<(ostream &out,const USD &ref ); //友元//
};

ostream& operator <<(ostream &out,const USD &ref ) //重载 operator << //
{
    out << "$" << ref.value;
    return out;
}
/********
String（“987”）匿名，为右值，想将其做左值使用，则起名 String &&ref
				String &&ref = String（“987”）; 
*********/
class CNY
{
public:
    CNY(double val) : value(val){}
    void show(){cout << "￥" << value << endl;}
//    CNY operator +(const CNY &ref) const
//    {
//        CNY ret(value + ref.value);
//        return ret;
//    }

    bool operator >(const CNY &ref)const //重载>,返回bool型//
    {
        return value > ref.value;
    }

    CNY &operator ++()    //重载 ++i，左值返回引用//
    {
        value += 1;
        return *this;
    }

    CNY operator ++(int)	//重载 i++，右值返回对象//
    {
        CNY ret(*this);
        value += 1;
        return ret;
    }

    CNY& operator =(const CNY &ref);	//重载 =，返回引用//

    CNY *operator &()	//重载（） //
    {
        cout << "operator &()" << endl;
        return this;
    }

    const CNY *operator &() const        //重载（）//
    {
        cout << "const operator &()" << endl;
        return this;//const CNY *
    }

    operator USD() const
    {
        USD ret(this->value / 6.6);
        return ret;
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

int &foo(int &ref)
{
    return ref;
}



void Sort(CNY *p, size_t len)
{
    for(size_t i = 0;i < len - 1;++i)
    {
        for(size_t j = i + 1;j < len;++j)
        {
            if(p[i] > p[j])
            {
                CNY t(p[i]) ;   //复制构造//
                p[i] = p[j];
                p[j] = t;
            }
        }
    }
}

int main(void)
{



    CNY c(1.22);
    CNY cc(3.33);

    cout << static_cast<USD>(cc) << endl;

//    cc = c;

//    cout << &cc << endl;//const CNY *

//    cout << c++ << endl;
//    cout << c << endl;
    return 0;
}


int main()
{

    CNY c(10.58);
//    cout << c << endl;
    CNY cc(20.88);
//    cout << (c + cc) << endl;

    CNY a[] = {CNY(3.22), CNY(1.88), CNY(9.78)};

    Sort(a, sizeof(a) / sizeof(a[0]));

    for(auto &x : a)
    {
        cout << x << endl;
    }


    return 0;
}


#include <cstring>
#include <cassert>
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

    String &operator =(const String &ref)
    {
        if(&ref == this)
        {
            return *this;
        }
        char *p = new char[strlen(ref.m_pStr) + 1];
        strcpy(p, ref.m_pStr);
        delete []m_pStr;
        m_pStr = p;
        return *this;
    }

    String &operator +=(const String &ref)
    {
        char *p = new char[strlen(m_pStr) + strlen(ref.m_pStr) + 1];
        strcpy(p, m_pStr);
        strcat(p, ref.m_pStr);
        delete []m_pStr;
        m_pStr = p;
        return *this;
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

    const char &operator [](int index) const  //[]重载函数，返回//
    {

        if((size_t)index >= strlen(m_pStr))
        {
            throw "error!";//const char *
        }
        return *(m_pStr + index);//char *
//        assert((size_t)index < strlen(m_pStr));
    }
    char &operator [](int index)
    {

        if((size_t)index >= strlen(m_pStr))
        {
            throw "error!";//const char *
        }
        return *(m_pStr + index);//char *
//        assert((size_t)index < strlen(m_pStr));
    }
private:
    char *m_pStr;
    friend ostream &operator <<(ostream &out, const String &ref);
};

ostream &operator <<(ostream &out, const String &ref)
{
    out << ref.m_pStr;
    return out;
}

int main(void)
{
    String s("Hello World!");
    String ss("cpp language");

    s[3] = 'A';//const String *
//    try
//    {
//        s[100] = 'A';
//    }
//    catch (const char *eStr)
//    {
//        cout << eStr << endl;
//    }


    cout << s << endl;
    return 0;
}


class Greater
{
public:
    Greater(int n) : m_i(n){}
    bool operator ()(int n)
    {
        return m_i > n;
    }

private:
    int m_i;
};

int main(void)
{


    int i = 3;

    cout << Greater(5)(i) << endl;

    return 0;
}
#endif

//void foo(int n)
//{

//}

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
        cout << "String(&)" << endl;
        strcpy(m_pStr, ref.m_pStr);
    }

//    String(String &&ref) : m_pStr(ref.m_pStr)
//    {
//        cout << "String(&&)" << endl;
//        ref.m_pStr = nullptr;
//    }

    ~String()
    {
        delete []m_pStr;
    }

    String &operator =(const String &ref)
    {
        if(&ref == this)
        {
            return *this;
        }
        char *p = new char[strlen(ref.m_pStr) + 1];
        strcpy(p, ref.m_pStr);
        delete []m_pStr;
        m_pStr = p;
        return *this;
    }

    String &operator =(String &&ref)
    {
        delete []m_pStr;
        m_pStr = ref.m_pStr;
        ref.m_pStr = nullptr;
        return *this;
    }

private:
    char *m_pStr;
    friend ostream &operator <<(ostream &out, const String &ref);
};

ostream &operator <<(ostream &out, const String &ref)
{
    out << ref.m_pStr;
    return out;
}

#include <memory>

int main(void)
{

//    String s(String("Hello World!"));
//    cout << s << endl;
    String s("Hello");
    String ss("World!");

    s = move(ss);

    cout << ss << endl;


    return 0;
}
