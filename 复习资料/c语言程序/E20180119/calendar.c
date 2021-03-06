E20180119
#include "calendar.h"
int Days[] = {31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
					//判断平年，闰年函数
static int isLeapYear(int year)  //加static关键字后此函数只能在此文件中使用，
{
	return year % 4 == 0 && year % 100 != 0 || year % 400 == 0;
}
					//判断某一月有多少天函数， 注意2月
int daysOfTheMonth(int year, int month)
{
	int ret;
	ret = Days[month - 1];
	if(month == 2)
	{
		if(isLeapYear(year))
		{ 
			ret = 29;
		}
		else
		{
			ret = 28;
		}
	}
	return ret;
}


int daysBefore1900(int year, int month)   //算距离1900年过了多少天（用1900年1月1日来推）
{
	int i;
	int ret = 0;
	for(i = 1900;i < year;++i)
	{
		ret += 365;
		if(isLeapYear(i))
		{
			ret += 1;
		}
	}
	for(i = 1;i < month;++i)
	{
		ret += daysOfTheMonth(year, i);
	}
	return ret;
}

int weekOfTheFirstDay(int year, int month)  
{
	int days;
	days = daysBefore1900(year, month);
	int ret;
	ret = days % 7 + 1 ;
	return ret;
}

void printCalendar(int year, int month)   //打印日历函数
{
	int days = daysOfTheMonth(year, month);
	int week = weekOfTheFirstDay(year, month);
	int i , k = 0;
	printf("Mon Tue Wes Thu Fri Sat Sun\n");
	for(i = 1;i < week;++i)
	{
		printf("    ");
		++k;
	}
	for(i = 1;i <= days;++i)
	{
		printf("%3d ", i);
		++k;
		if(k % 7 == 0)
		{
			printf("\n");
		}
	}
	printf("\n");


}
