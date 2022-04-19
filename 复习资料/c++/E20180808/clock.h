#ifndef CLOCK_H
#define CLOCK_H

#include <iostream>

class Clock
{
public:
    void show();
    void setTime(int h, int m, int s);
private:
    int hour;
    int minute;
    int second;
};

#endif // CLOCK_H

