#include "hmutex.h"

HMutex::HMutex()
{
    pthread_mutex_init(&m_id, nullptr);
}

void HMutex::lock()
{
    pthread_mutex_lock(&m_id);
}

void HMutex::unlock()
{
    pthread_mutex_unlock(&m_id);
}

HMutex::~HMutex()
{
    pthread_mutex_destroy(&m_id);
}

