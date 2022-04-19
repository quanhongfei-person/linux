#include <stdio.h>
#include <termios.h>
#include <unistd.h>
#include <time.h>

#define N 4
#define WINNUM 64

enum gameStats {WIN , LOST, NORMAL};

int code[N][N] = {0};
int temp[N];

int getch(void) 
{
	struct termios oldt, newt;
	int ch;
	tcgetattr(STDIN_FILENO, &oldt);
	newt = oldt;
	newt.c_lflag &= ~(ICANON | ECHO);
	tcsetattr(STDIN_FILENO, TCSANOW, &newt);
	ch = getchar();
	tcsetattr(STDIN_FILENO, TCSANOW, &oldt);
	return ch;
}

void print(void)
{
	int i, j;
	system("clear");
	puts("2048");
	puts("a-left s-down w-up d-right 0-exit");
	puts("|-------------------|");
	for(i = 0;i < N;++i)
	{
		for(j = 0;j < N;++j)
		{
			if(0 == code[i][j])
			{
				printf("|    ");
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

int addNumber(void)
{
	int change = 0;
	int i, j;
	for(j = 0;j < N - 1;++j)
	{
		for(i = 0;i < N - 1;++i)
		{
			if(0 == temp[i])
			{
				if(temp[i] != temp[i + 1])
				{
					change = 1;
					temp[i] = temp[i + 1];
					temp[i + 1] = 0;
				}
			}
		}
	}

	for(i = 0;i < N - 1;++i)
	{
		if(temp[i] != 0)
		{
			if(temp[i] == temp[i + 1])
			{
				change = 1;
				temp[i] *= 2;
				temp[i + 1] = 0;
			}
		}
	}

	for(j = 0;j < N - 1;++j)
	{
		for(i = 0;i < N - 1;++i)
		{
			if(0 == temp[i])
			{
				if(temp[i] != temp[i + 1])
				{
					temp[i] = temp[i + 1];
					temp[i + 1] = 0;
				}
			}
		}
	}
	return change;

}

enum gameStats judge(void)
{
	int i, j;
	for(i = 0;i < N;++i)
	{
		for(j = 0;j < N;++j)
		{
			if(code[i][j] == WINNUM)
			{
				return WIN;
			}
		}
	}
	for(i = 0;i < N;++i)
	{
		for(j = 0;j < N;++j)
		{
			if(code[i][j] == 0)
			{
				return NORMAL;
			}
		}
	}
	return LOST;
}

int main(void)
{
	int i, j, k;
	int gameOver = 0, change = 1;
	char ch;
	srand(time(NULL));

	while(!gameOver)
	{
		if(change)
		{
			do
			{
				i = (int)random() % N;
				j = (int)random() % N;
			}while(code[i][j] != 0);

			k = (int)random();
			if(0 == k % 2)
			{
				code[i][j] = 2;
			}
			else
			{
				code[i][j] = 4;
			}
		}
		change = 0;

		print();
		ch = getch();
		
		switch(ch)
		{
		case 'a':
		case 'A':
			for(i = 0;i < N;++i)
			{
				for(j = 0;j < N;++j)
				{
					temp[j] = code[i][j];
				}
				change += addNumber();
				for(j = 0;j < N;++j)
				{
					code[i][j] = temp[j];
				}
			}
			break;
		case 'w':
		case 'W':
			for(i = 0;i < N;++i)
			{
				for(j = 0;j < N;++j)
				{
					temp[j] = code[j][i];
				}
				change += addNumber();
				for(j = 0;j < N;++j)
				{
					code[j][i] = temp[j];
				}
			}
			break;
		case 's':
		case 'S':
			for(i = 0;i < N;++i)
			{
				for(j = 0;j < N;++j)
				{
					temp[j] = code[N - j - 1][i];
				}
				change += addNumber();
				for(j = 0;j < N;++j)
				{
					code[N - j - 1][i] = temp[j];
				}
			}
			break;
		case 'd':
		case 'D':
			for(i = 0;i < N;++i)
			{
				for(j = 0;j < N;++j)
				{
					temp[j] = code[i][N - j - 1];
				}
				change += addNumber();
				for(j = 0;j < N;++j)
				{
					code[i][N - j - 1] = temp[j];
				}
			}
			break;
		case 'q':
		case 'Q':
			return 0;
			break;
		default:
			break;
		}
		
		enum gameStats result = judge();
		switch(result)
		{
		case WIN:
			puts("Congratulations! You win the game!");
			return 0;
		case LOST:
			puts("You lost the game!");
			return 0;
		default:
			break;
		}
	}

	
	
	return 0;
}
