#ifndef DEMO_H
#define DEMO_H


class Demo
{
public:
    Demo();
    Demo(const Demo &);
    ~Demo();
    static int getCount();
private:
    static int count;
};



#endif // DEMO_H
