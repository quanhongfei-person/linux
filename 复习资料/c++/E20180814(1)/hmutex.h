#ifndef HMUTEX_H
#define HMUTEX_H

#include <pthread.h>

class HMutex
{
public:
    HMutex();
    void lock();
    void unlock();
    ~HMutex();
private:
    pthread_mutex_t m_id;
};

#endif // HMUTEX_H
