
#include<stdio.h>

#include<errno.h>
#include<error.h>
int main(int argc, const char *argv[])
{
	FILE* fp = fopen("test","r");
	if(NULL == fp)
	error(1,errno,"fopen test file:%s,line:%d,func:%s,date:%s\n",__FILE__,__LINE__,__func__,__DATE__);
	return 0;
}
