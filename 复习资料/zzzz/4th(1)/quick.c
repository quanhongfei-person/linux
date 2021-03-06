#include <stdio.h>

void quick(int* a, int low, int high) 
{
	int i = low;
	int j = high;
	int tmp = a[i];
	if(low > high)
		return ;
	while(i < j)
	{
		while(i < j && tmp < a[j])
			j--;
		if(i < j)
		{
			a[i] = a[j];
			i++;
		}
		while(i < j && a[i] < tmp)
			i++;
		if(i < j)
		{
			a[j] = a[i];
			j--;
		}
	}
	a[i] = tmp;
	quick(a, low, i-1);
	quick(a, i+1, high);
}

int main()
{
	int a[10] = {23, 90, 0, -12, 45, 77, 0, 45, 9, 11};
	
	quick(a, 0, 9);	

	int i;
	for(i=0; i<10; i++)
		printf(" %d  ", a[i]);
	printf("\n");

}




