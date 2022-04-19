#ifndef __PRINTF_H__
#define __PRINTF_H__

#define  NULL 0

typedef char * uva_list;

#define uva_start(pa, num) (pa = (char *)(&num) + sizeof(num))

#define uva_arg(pa, type)  ({\
				type val;\
				val = *((type *)pa);\
				pa += 4;\
				val;})
#define uva_end(pa)	(pa = NULL)

extern  void itod(unsigned int num, char *buf);
extern void itox(unsigned int num, char *buf);
extern int uprintf(const char *fmt, ...);
#endif
