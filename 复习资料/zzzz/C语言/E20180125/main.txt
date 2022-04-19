#include <stdio.h>
#include <stdlib.h>
#include <termios.h>
#include <unistd.h>
#include <time.h>
int code[4][4] = {0};

int getch(void) 
{
	struct termios oldt, newt;
	int ch;
	tcgetattr( STDIN_FILENO, &oldt );
	newt = oldt;
	newt.c_lflag &= ~( ICANON | ECHO );
	tcsetattr( STDIN_FILENO, TCSANOW, &newt );
	ch = getchar();
	tcsetattr( STDIN_FILENO, TCSANOW, &oldt );
	return ch;
}


void print(void)
{
	system("clear");
	puts("|-------------------|");
	int i, j;
	for(i = 0;i < 4;++i)
	{
		for(j = 0;j < 4;++j)
		{
			if(code[i][j] == 0)
			{
				printf("|    ", code[i][j]);

			}
			else
			{
				printf("|%4d", code[i][j]);
			}
		}

		puts("|");
		puts("|-------------------|");

	}
}

int main(void)
{
	char ch;
	int i, j;
	srand(time(NULL));
	while(1)
	{
		do
		{
			i = random() % 4;
			j = random() % 4;
		}while(code[i][j] != 0);

		int t;
		t = random() % 2;
		if(t == 0)
		{
			code[i][j] = 2;
		}
		else
		{
			code[i][j] = 4;
		}

		print();
		ch = getch();
		switch(ch)
		{
		case 'W':
		case 'w':
			break;
		case 'a':
		case 'A':
			break;
		}

	}
	return 0;
}
