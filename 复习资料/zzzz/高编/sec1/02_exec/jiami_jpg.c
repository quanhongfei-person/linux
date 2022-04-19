#include <stdio.h>
#include<stdlib.h>
int main(void)
{
	FILE *fp =fopen("/home/linux/Pictures/11.png","r+");
		if(NULL == fp)
		{
			printf("fopen error");
			return 0;
		}
		int i,t;
		int c[10];
		for(i = 0;i<10;++i)
		{
			c[i] = fgetc(fp);     拿出来
			printf("%d ",c[i]);
		}
		puts("");
		fclose(fp);

		for(i = 0;i<5;++i)
		{
			t = c[i];
			c[i] = c[10-i-1];
			c[10-i-1] = t;
		}
		for(i = 0;i<10;++i)
		{
			printf("%d ",c[i]);
		}
		FILE *f =fopen("/home/linux/Pictures/11.png","r+");
		for(i = 0;i<10;++i)
		{
				fputc(c[i],f);       放进去

		}
		fclose(f);
	return EXIT_SUCCESS;
}
