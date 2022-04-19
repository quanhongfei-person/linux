


#include<stdio.h>
#include<unistd.h>


int main(int argc, const char *argv[])
{
	umask(0111);
	mkdir("123",0777);

	return 0;
}
