E20180124
#include "clock.h"

int Days[] = {31, 0, 31, 30, 31, 30 ,31, 31, 30 ,31, 30 ,31};
3{
	return year % 4 == 0 && year % 100 != 0 || year % 400 == 0;
}

int daysOfTheMonth(int year, int month)
{
	if(month == 2)
	{
		if(isLeapYear(year))
		{
			return 29;
		}
		else
		{
			return 28;
		}
	}
	else
	{
		return Days[month - 1];
	}
}

void showTime(const struct DateTime *pdt)
{
	printf("\r%4d-%02d-%02d %02d:%02d:%02d", pdt->year, pdt->month, pdt->day, pdt->hour, pdt->minute, pdt->second);
	fflush(stdout);
}

void incYear(struct DateTime *pdt)
{
	pdt->year += 1;
}

void incMonth(struct DateTime *pdt)
{
	pdt->month += 1;
	if(pdt->month > 12)
	{
		pdt->month = 1;
		incYear(pdt);
	}	
}

void incDay(struct DateTime *pdt)
{
	int days;
	days = daysOfTheMonth(pdt->year, pdt->month);
	pdt->day += 1;
	if(pdt->day > days)
	{
		pdt->day = 1;
		incMonth(pdt);
	}
}

void incHour(struct DateTime *pdt)
{
	pdt->hour += 1;
	if(pdt->hour > 23)
	{
		pdt->hour = 0;
		incDay(pdt);
	}
}

void incMinute(struct DateTime *pdt)
{
	pdt->minute += 1;
	if(pdt->minute > 59)
	{
		pdt->minute = 0;
		incHour(pdt);
	}
}

void incSecond(struct DateTime *pdt)
{
	pdt->second += 1;
	if(pdt->second > 59)
	{
		pdt->second = 0;
		incMinute(pdt);
	}
}
