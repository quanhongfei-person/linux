#ifndef HTHREAD_H
#define HTHREAD_H

#include <pthread.h>
#include <iostream>
#include <unistd.h>


class HThread
{
public:
    HThread();
    virtual void run() = 0;
    void start();
    void join();
    static void *proxy(void *self);
private:
    pthread_t m_id;
};

#endif // HTHREAD_H
