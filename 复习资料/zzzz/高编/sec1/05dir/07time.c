
#include<stdio.h>
#include<unistd.h>
#include<time.h>
#include<string.h>


int main(int argc, const char *argv[])
{
	time_t tm;
	time(&tm);
	printf("sec:%ld\n",tm);
	return 0;
}
