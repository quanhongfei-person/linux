#include <stdio.h>
#include <string.h>

int main()
{
    char str[1000];
    while(gets(str))
    {
        int Ascll[256] = {0};
        int i = 0;
        int max = 0;
        while(i < strlen(str))
        {
            Ascll[str[i]]++;
			++i;
            if(Ascll[str] > max)
                max = Ascll[str];
        }
        i = 0;
        while(max)
        {
            while(i < sizeof(Ascll)/sizeof(int))
            {
                if(Ascll[i] == max)
                    putchar(i);
				++i;
            }
            --max;
        }
    }
    return 0;
}