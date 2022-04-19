#ifndef FUN_H
#define FUN_H

template <typename T>
void print(T *p, size_t len)
{
    for(size_t i = 0;i < len;++i)
    {
        cout << p[i] << ",";
    }
    cout << "\b \n";
}


template <typename T>
void Sort(T *p, size_t len)
{
    for(size_t i = 0;i < len - 1;++i)
    {
        for(size_t j = i + 1;j < len;++j)
        {
            if(p[i] > p[j])
            {
                T t;
                t = p[i];
                p[i] = p[j];
                p[j] = t;
            }
        }
    }
}

#endif // FUN_H

