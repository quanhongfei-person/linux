/*
 ============================================================================
 Name        : 01fgetc.c
 Author      : yas
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	FILE *fp =fopen("test1","w");
	if(NULL == fp)
	{
		printf("fopen error");
		return 0;

	}
	fputc('1',fp);
	fputc('2',fp);
	fputc('3',fp);
	fclose(fp);

	fp = fopen("test1","r");
	if(NULL == fp)
		{
			printf("fopen error");
			return 0;

		}
	int a,b,c;
	a = fgetc(fp);

	b=fgetc(fp);
	c= fgetc(fp);
	printf("%c %c %c\n",a,b,c);
	fclose(fp);


	puts("!!!done!!!"); /* prints !!!done!!! */
	return EXIT_SUCCESS;
}
