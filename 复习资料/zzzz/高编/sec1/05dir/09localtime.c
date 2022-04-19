
#include<stdio.h>
#include<unistd.h>
#include<time.h>
#include<string.h>


int main(int argc, const char *argv[])
{
	time_t tm;
	time(&tm);
	struct tm *a;
	a=localtime(&tm);
	printf("%d-%d-%d %d:%d:%d\n",
			a->tm_year+1900,a->tm_mon+1,a->tm_mday,
			a->tm_hour,a->tm_min,a->tm_sec);
	return 0;
}
