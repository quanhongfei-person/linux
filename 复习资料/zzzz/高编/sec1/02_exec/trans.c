/*
 ============================================================================
 Name        : exercise3.c
 Author      : 
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	FILE *src,*dstn;
	src = fopen("/home/linux/Wrox/E20180127/exercise_3/Hello","r");
	dstn = fopen("test3","w");
	if(src == NULL || dstn == NULL)
	{
		puts("fopen error");
		return 0;
	}
	while(1)
	{
		int c = fgetc(src);
		if(c == EOF)
		{
			break;
		}
		if(c > 'a' && c < 'z')
		{
			c -= 32;
		}
		else if(c > 'A' && 'Z' > c)
		{
			c += 32;
		}
		fputc(c,dstn);
	}
	fclose(src);
	fclose(dstn);
	puts("!!!Hello World!!!"); /* prints !!!Hello World!!! */
	return EXIT_SUCCESS;
}
hello