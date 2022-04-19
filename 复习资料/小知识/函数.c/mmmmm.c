void move(char pole1, char pole2)    //汉罗塔（函数递归）//
{
	printf("%c->%c\n", pole1, pole2);
}

void hanoi(int n, char pole1, char pole2, char pole3)
{
	if(1 == n)
	{
		move(pole1, pole3);
		return ;
	}
	else
	{
		hanoi(n - 1, pole1, pole3, pole2);
		move(pole1, pole3);
		hanoi(n - 1, pole2, pole1, pole3);
	}
}

int main(void)
{
	hanoi(64, 'X', 'Y', 'Z');
	return 0;
}