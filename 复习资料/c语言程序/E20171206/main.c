E20181206
#include <stdio.h>

#if 0      				//条件编译
int main(void)
{
	printf("Hello World!\n");
	return 0;
}
#endif

#define X 789456123     //宏

int main(void)
{
	int buffer_of_size;  //变量名即标识符（命名规则）
	int n;
	int m;
	n = 123456;

	printf("%d\n", n);      // %d打整形
	printf("%p\n", &n);     // %p打地址

	return 0;
}
