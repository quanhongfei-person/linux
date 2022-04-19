#include "clock.h"

using namespace std;

void Clock::show()
{
    cout << hour << ":" << minute << ":" << second << endl;
}

void Clock::setTime(int h, int m, int s)
{
    hour = h;
    minute = m;
    second = s;
}
