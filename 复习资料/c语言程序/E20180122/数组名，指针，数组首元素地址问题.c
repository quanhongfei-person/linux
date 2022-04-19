#include <stdio.h>
int main(int argc, const char *argv[])
{
	int a[5] = {1,2,3,4,5};
	printf("%d\n",a);
	//printf("%p\n",a);
	
	printf("%x\n",a);
	//printf("%p\n",a);
	
	printf("%x\n",&a[0]);
	//printf("%p\n",a);
	
	printf("%d\n",a[0]);
	printf("%d\n",*a);
	
	printf("%d\n",&a[0]);
	//printf("%p\n",a);
	
	return 0;
}
结果：

	-1080984740
	bf917b5c
	bf917b5c
	1
	1
	-1080984740（bf917b5c）
