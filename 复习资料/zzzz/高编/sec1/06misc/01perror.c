#include<stdio.h>


int main(int argc, const char *argv[])
{
	FILE*fp = fopen("test","r");
	if(NULL == fp)
	{
		perror("fopen test");
		return 0;
	}
	return 0;
}
