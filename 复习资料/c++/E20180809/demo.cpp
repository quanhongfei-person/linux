#include "demo.h"

int Demo::count;

Demo::Demo()
{
    ++count;
}

Demo::Demo(const Demo &)
{
    ++count;
}

Demo::~Demo()
{
    --count;
}

int Demo::getCount()
{
    return count;
}

