#include <iostream>
#include <string>
#include <iterator>
#include <cstdio>
#include <algorithm>
#include <vector>
#include <list>
using namespace std;

bool isVowel(char ch)
{
    string s("aeiouAEIOU");
    return s.find(ch) != string::npos;
}

class Demo
{
public:
    bool operator ()(char ch)
    {
        string s("aeiouAEIOU");
        return s.find(ch) != string::npos;
    }
};

class AAA
{
public:
//    AAA(int n){}
    void fn() {}
};

class Complex
{
public:
    Complex(double r, double i) : real(r), imag(i)
    {
        cout << "Complex(double, double) " << endl;
    }

    Complex(const Complex &ref) : real(ref.real), imag(ref.imag)
    {
        cout << "Complex(&) " << endl;
    }

    ~Complex()
    {
        cout << "~Complex() " << endl;
    }

    void show() const
    {
        cout << this->real << " + " << this->imag << "i" << endl;
    }




private:
    double real, imag;
};

bool compare(const int &r1, const int &r2)
{
    return r1 < r2;
}

int main()
{

    int a[] = {1,2,3,4,5,6,7,8,9,0};

//    string s("Hello");
    vector<int> v(a,a + sizeof(a) / sizeof(a[0]));
    vector<int> vv = {3,4,5,6,7,8,9,10,11,12,13};

    list<int> l = {1,2,3,4,5,6,7,8,9,0};

    l.sort();

    copy(l.begin(), l.end(), ostream_iterator<int>(cout, ","));
//    transform(v.begin(), v.end(), vv.begin(), v.begin(), [](int n, int m){return n + m;});
//    transform(v.begin(), v.end(), v.begin(), [](int n){return n + 1;});
//    vv.resize(v.size());

//    string s("Hello World!");


//    copy_if(s.begin(), s.end(), ostream_iterator<char>(cout, ""), [](char ch){return ch >= 'a' && ch <= 'z';});
//    copy(v.begin(), v.end(), ostream_iterator<int>(cout, ","));

//    for(auto &x : vv)
//    {
//        cout << x << endl;
//    }

//    reverse(v.begin() + 1, v.end() - 1);
//    sort(v.begin(), v.end(), compare);



//    vector<Complex> v;
//    v.push_back(Complex(2.3, 5.6));

//    v.emplace(v.begin(), 4.4, 5.5);

//    v.insert(v.begin(), Complex(4.4, 5.5));

//    int a[] = {1,2,3,4,5,6,7,8,9,0};

//    string s("Hello");
//    vector<int> v(a,a + sizeof(a) / sizeof(a[0]));
//    vector<int> vv(vector<int>(s.begin(), s.end()));


//    v.erase(v.begin() + 1, v.end() - 1);
//    v.insert(v.begin() + 1,vv.begin(), vv.end());
//    cout << v.back() << endl;
//    int i = 8;
//    v.push_back(int(8));
//    v.assign({3,6,9});
//    v.assign(10, 8);
//    v.assign(vv.begin(), vv.end());

//    cout << v.max_size() << endl;
//    int *p = v.data();

//    v.back() = 100;
//    cout << *p << endl;


//    for(auto &x : v)
//    {
//        cout << x << endl;
//    }



//    char str[10]  = {0};


//    string s;
//    string ss("aeiou");

//    getline(cin, s, ',');

//    cout << s << endl;

//    cin >> s;
//    cout << s << endl;

//    cout << "Hello" + ss << endl;

//    size_t ret = count_if(s.begin(), s.end(), Demo());
//    cout << ret << endl;

//    size_t ret = count(s.begin(), s.end(), 'o');
//    cout << ret << endl;

//    s.replace(s.find_first_of(" \t\n"), 1, "");
//    s.replace(s.find_last_of(" \t\n"), 1, "");
//    cout << s << endl;


//    size_t ret = s.find_first_of(ss);
//    size_t count = 0;
//    while(ret != string::npos)
//    {
//        ++count;
//        ret = s.find_first_of(ss, ret + 1);
//    }
//    cout << count << endl;



//    size_t count = 0;
//    size_t ret = s.find(ss);
//    while(ret != string::npos)
//    {
//        ++count;
//        ret = s.find("He", ret + 1);
//    }
//    cout << count << endl;

//    s.copy(str, 3, 1);
//    cout << str << endl;

//    printf(s.data(), 12345);//const char *

//    s.pop_back();
//    s.swap(ss);
//    s.erase(s.begin(), s.end());
//    s.erase(s.begin() + 1);
//    s.erase(2, 2);
//    s.replace(s.begin() + 1, s.end() - 1, ss.begin() + 1, ss.end() - 1);
//    s.replace(2, 2, "ABCDEF");
//    s.replace(s.begin() + 1, s.end() - 1, "ABCDEF");
//    s.replace(2, 2, ss, 2, 3);
//    s.replace(2, 2, ss);
//    s.replace(s.begin() + 1, s.end() - 1, ss);

//    cout << s << endl;

//    s.insert(2, ss, 2, 2);
//    s.insert(2, "ABCDEFG", 3);
//    s.insert(2, 8, 'M');
//    s.insert(s.begin() + 1,  'M');
//    s.insert(s.begin() + 1, ss.begin(), ss.end());
//    cout << s << endl;

//    s.append(ss.begin() + 1, ss.end() - 1);
//    cout << s << endl;

//    for(auto i = s.cbegin();i != s.cend();++i)
//    {

//        cout << *i << endl;
//    }


//    s.append(8, 'M');
//    s.append(ss, 2, 3);
//    s.append("World!", 3);
//    cout << s << endl;

//    s += {"World!"};
//    cout << s << endl;

//    cout << s.front() << endl;

//    s.at(8) = 'A';
//    cout << s << endl;

//    s[3] = 'A';
//    cout << s << endl;

//    s.clear();
//    cout << s.capacity() << endl;
//    cout << s.empty() << endl;
//    s.shrink_to_fit();
//    cout << s.capacity() << endl;

//    cout << s.capacity() << endl;
//    s.reserve(50);
//    cout << s.size() << endl;
//    cout << s.capacity() << endl;

//    s.resize(10, 'A');
//    cout << s.capacity() << endl;
//    s.resize(5);
//    cout << s .size() << endl;
//    cout << s .capacity() << endl;
//    cout << s.max_size() << endl;

    return 0;
}

