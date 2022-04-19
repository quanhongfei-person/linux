E20180124
#ifndef _CLOCK_H_
#define _CLOCK_H_

#include <stdio.h>

struct DateTime
{
	int year;
	int month;
	int day;
	int hour;
	int minute;
	int second;
};

extern void showTime(const struct DateTime *pdt);
extern void incYear(struct DateTime *pdt);
extern void incMonth(struct DateTime *pdt);
extern void incDay(struct DateTime *pdt);
extern void incHour(struct DateTime *pdt);
extern void incMinute(struct DateTime *pdt);
extern void incSecond(struct DateTime *pdt);



#endif
