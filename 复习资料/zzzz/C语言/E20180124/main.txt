E20180124
#include <stdio.h>
#include <string.h>


#if 0
//#pragma pack(1)



int main(void)
{
	int i;
	printf("%d\n", sizeof(struct Student));
/*	struct Student stu1, stu2 = {1, "lisi", 98.5, 'F'};
	
	stu1.id = 10;
	strcpy(stu1.name, "zhangsan");;
	stu1.score = 95;
	stu1.sex = 'M';

//	stu2 = stu1;

	printf("%d %f %c %s\n", stu2.id, stu2.score, stu2.sex, stu2.name);

//	id[0] name[0] sex[0]*/

	return 0;
}

struct Date
{
	int year;
	int month;
	int day;
};

struct Student
{
	int id;
	double score;
	char name[17];
};

void printStudent(const struct Student *ss)
{
//	ss->id = 5;//(*ss).id
	printf("%d, %f, %s\n", ss->id, ss->score, ss->name);

}

void printStudent1(struct Student ss)
{
//	ss->id = 5;//(*ss).id
	printf("%d, %f, %s\n", ss.id, ss.score, ss.name);

}

void printStudents(struct Student *p, int len)
{
	int i;
	for(i = 0;i < len;++i)
	{
		printf("%d, %f, %s\n", (p + i)->id, p[i].score, p[i].name);
	}
}


int main(void)
{
//	printf("%d\n" ,sizeof(struct Student));
	
//	struct Student s1 = {1, 97.5, "zhangsan"};

//	printStudent1(s1);
//	printf("%d\n", s1.id);

	struct Student Stus[] = {{1, 97.5, "zhangsan"},{2, 99.5, "lisi"},{3, 95.5, "wangwu"}};
	printStudents(Stus, sizeof(Stus) / sizeof(Stus[0]));
/*	int i;
	for(i = 0;i < sizeof(Stus)/ sizeof(Stus[0]);++i)
	{
		printf("%d, %f, %s\n", Stus[i].id, Stus[i].score, Stus[i].name);
	}*/

	return 0;
}

#include "clock.h"
#include <unistd.h>
int main(void)
{
	struct DateTime dt = {2018, 12 ,31, 23 ,59, 55};

	while(1)
	{
		incSecond(&dt);
		showTime(&dt);
		sleep(1);
	}
	return 0;
}

typedef struct AAA
{
	int i;
	int j;
}STU;

int main(void)
{
//	struct AAA a;
	typedef int INT;
	typedef float FOLAT;
	INT i;
	printf("%d\n", sizeof(STU));
	STU s;
	return 0;
}

union Type
{
	char c;
	short s;
	int i;
};

int isLittleDiand(void)
{
	union Type t;
	t.i = 1;
	return t.c == 1;
}

void foo(union Type ts)
{

}

int main(void)
{
	union Type t = {1};
	union Type t1;
	t1 = t;
	foo(t);
	int i;

/*	printf("%d\n", sizeof(t));
	t.c = 1;
	t.s = 12345;
	t.i = 123456789;

	printf("%d\n", t.c);
	printf("%p\n", &t.c);
	printf("%p\n", &t.s);
	printf("%p\n", &t.i);

	puts(isLittleDiand() ? "Yes" : "No");
*/

	return 0;
}

enum Month
{
	Jan = 1, Feb = 3, Mar = 8, Apl, May, Jun = 8, July, Aug, Set, Otc, Nov, Dec
};

union Type
{
	int i;
	char c;
};

struct AAA
{
	int i;
	enum Month m;
	union Type t;
};

int main(void)
{
	enum Month m;
	m = July;
	m = 100;
	
	printf("%d\n", sizeof(struct AAA));
	//printf("%d\n", m);

	switch(m)
	{
	case Jan:
	case Mar:
		break;
	}

	return 0;
}


int main(void)
{
	int i = 3;
	int j = 5;
	int k;
	k = i & j;
	printf("%d\n", k);
	return 0;
}


int main(void)
{
	unsigned int i = 0x33;
	unsigned int j = 0xAA;
	int k = ~i;
	printf("%X\n", k);
	return 0;
}


int main(void)
{
	unsigned int i = 0;
	int k;
//	i &= ~(1 << 10) & ~(1 << 15);
	i &= ~((1 << 10) | (1 << 15));
	printf("%X\n", i);
	return 0;
}


int main(void)
{
	unsigned int i = 0x70000000;
	int k = i >> 4;
	printf("%X\n", k);
	return 0;
}
#endif


int main(void)
{
	int i = -1;
	int count = 0;
	while(i)
	{
		i &= i - 1;
		++count;
	}
	printf("%d\n", count);
	return 0;
}
