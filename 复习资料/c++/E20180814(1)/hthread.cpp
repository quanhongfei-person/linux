#include "hthread.h"

HThread::HThread() : m_id(-1)
{

}



void HThread::start()
{
    pthread_create(&m_id, nullptr, proxy, this);
}

void HThread::join()
{
    pthread_join(m_id,nullptr);
}

void *HThread::proxy(void *self)
{
    ((HThread *)(self))->run();
    return nullptr;
}

