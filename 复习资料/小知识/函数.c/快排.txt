

void Qsort(int *begin, int *end)      //快排//
{
	int t;
	int m;
	int *p = begin, *q = end;
	t = *begin;

	if(begin >= end)
	{
		return;
	}
	while(begin != end)
	{
		while(begin < end && *end > t)
		{
			--end;
		}
		while(begin < end && *begin <= t)
		{
			++begin;
		}
		if(begin < end)
		{
			m = *begin;
			*begin = *end;
			*end = m;
		}
	}
	m = *p;
	*p = *begin;
	*begin = m;

	Qsort(p, begin - 1);
	Qsort(begin + 1, q);

}



void choiseSort(int *arr, int len)
{
	int i, j, t;
	for(i = 0;i < len - 1;++i)
	{
		for(j = i + 1;j < len;++j)
		{
			if(*(arr + i) > *(arr + j))
			{
				t = *(arr + i);
				*(arr + i) = *(arr + j);
				*(arr + j) = t;
			}
		}
	}
}

size_t Strlen(const char *pStr)     //递归//
{
	if(*pStr == '\0')
	{
		return 0;
	}
	else
	{
		return Strlen(pStr + 1) + 1; 
	}
}


void Strcpy(char *dest,const char *src)
{
	while(*src)
	{
		*dest++ = *src++;
	}
	*dest = '\0';
}

void Strcat(char *dest,const char *src)
{
	while(*dest)
	{
		++dest;
	}
	while(*src)
	{
		*dest++ = *src++;
	}
	*dest = '\0';
}

void memcpy(void *dest,const void *src, size_t n)   //将src指定n个copy到dest中//
{
	char *d = (char *)dest;
	char *s = (char *)src;
	while(n)
	{
		*d++ = *s++;
		--n;
	}
}

char *Strcat(char *dest, const char *src)
{
	char *ret = dest;
	while(*dest)
	{
		++dest;
	}
	while(*src)
	{
		*dest++ = *src++;
	}
	*dest = '\0';
	return ret;
}

void getMemory(char **p, size_t n)
{
	*p = malloc(n);
}


int pow2(int n)
{
	return n * n;
}
void Sort(int *arr, int len, int (*pfn)(int))
{
	int t, i, j;
	for(i = 0;i < len - 1;++i)
	{
		for(j = i + 1;j < len;++j)
		{
			if(pfn(arr[i]) > pfn(arr[j]))
			{
				t = arr[i];
				arr[i] = arr[j];
				arr[j] = t;
			}
		}
	}
}
void stringSort(char *pStr[], int len)
{
	int i, j;
	char *t;
	for(i = 0;i < len - 1;++i)
	{
		for(j = i + 1;j < len;++j)
		{
			if(strcmp(pStr[i] , pStr[j]) > 0)
			{
				t = pStr[i];
				pStr[i] = pStr[j];
				pStr[j] = t;
			}
		}
	}
}

int *find(int *arr, int len, int n)
{
	int mid;
	int begin = 0;
	int end = len - 1;
	while(begin <= end)
	{
		mid = (begin + end) / 2;

		if(arr[mid] > n)
		{
			end = mid - 1;
		}
		else if(arr[mid] < n)
		{
			begin = mid + 1;
		}
		else
		{
			return arr + mid;
		}
	}
	return NULL;
}


int isPrimerNumber(int n)   //判断n是否为素数函数//
{
	int i;
	for(i = 2;i < n;++i)
	{
		if(n % i == 0)
		{
			break;
		}
	}
	return !(i < n);
}

void printPrimerNumber(int n)    //打印n以内素数专用函数//
{
	int i;
	for(i = 2;i < n;++i)
	{
		if(isPrimerNumber(i))
		{
			printf("%d\n", i);
		}
	}
}

int isPalindromicNumber(int n)    //求n以内回文数函数//
{
	int k, m = 0, t = n;
	while(n)
	{
		k = n % 10;
		m = m * 10 + k;
		n /= 10;
	}
	return t == m;
}


int isLittleEndian(void)
{
	int i = 1;
	char *p = (char *)(&i);
	return *p == 1;

}



int main(void)
{
	if(isLittleEndian())
	{
		puts("small");
	}
	else
	{
		puts("big");
	}
	return 0;
}


