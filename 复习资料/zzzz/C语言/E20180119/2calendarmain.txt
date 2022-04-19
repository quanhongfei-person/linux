E20180119
#ifndef _CALENDAR_H_
#define _CALENDAR_H_
#include <stdio.h>

extern int daysOfTheMonth(int year, int month);
extern int daysBefore1900(int year, int month);
extern int weekOfTheFirstDay(int year, int month);
extern void printCalendar(int year, int month);



#endif
