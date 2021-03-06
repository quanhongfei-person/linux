#include 
#include 
struct JosephusNode
{
	int index;
	int next;
};
unsigned int Josephus(unsigned int n, unsigned int m)
{
	if (m < 1 || n < 1)
		return 0;
	
	JosephusNode *a = (JosephusNode *)calloc(n, sizeof(JosephusNode));
	for (int i = 0; i < n; ++i)
	{
		a[i].index = i;
		a[i].next = (i+1)%n;
	}
	unsigned int p = n-1, c = 0;
	while (a[c].next != c)
	{
		for (unsigned int i = 1; i < m; ++i)
		{
			p = c;
			c = a[c].next;
		}
		printf("==> %d exit.\n", a[c].index+1);
		c = a[p].next = a[c].next;
	}
	unsigned int w = a[c].index+1;
	free(a);
	printf("==> winner is %d.\n", w);
	return w;
}
int main()
{
	Josephus(10, 3);
	Josephus(6, 1);
	Josephus(2, 3);
	Josephus(1, 3);
	Josephus(1, 1);
        system("pause");
} 