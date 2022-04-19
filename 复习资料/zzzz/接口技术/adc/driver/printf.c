#include <uart.h>
#include <printf.h>

void itod(unsigned int num, char *buf)
{
	int i;

	if(num < 10){
		buf[0] = num + '0';
		buf[1] = '\0';
		return;
	}

	itod(num/10, buf);

	for(i = 0; buf[i] != '\0'; i++);

	buf[i] = num%10 + '0';
	buf[i+1] = '\0';
}

void itox(unsigned int num, char *buf)
{
	int i;

	if(num < 16){
		if(num > 9){
			buf[0] = num - 10 + 'a';
		}else{
			buf[0] = num + '0';
		}

		buf[1] = '\0';

		return;
	}

	itox(num/16, buf);

	for(i = 0; buf[i] != '\0'; i++);

	if((num%16) > 9){
		buf[i] = num%16 - 10 + 'a';
	}else{
		buf[i] = num%16 + '0';
	}	

	buf[i+1] = '\0';
}

int uprintf(const char *fmt, ...)
{
	int hex;
	char buf[16];

	uva_list pa;

	uva_start(pa, fmt);	

	while(*fmt){
		
		if(*fmt != '%'){
			uart_send(*fmt);
		}else{
			fmt++;
			switch(*fmt){
				case 'c':
					uart_send(uva_arg(pa, int));
					break;
				case 's':
					puts_(uva_arg(pa, char *));
					break;
				case 'd':
					hex = uva_arg(pa, int);
					if(hex < 0){
						uart_send('-');
						hex = 0 - hex;
					}	
					itod(hex, buf);
					puts_(buf);
					break;
				case 'x':
					hex = uva_arg(pa, int);
					itox(hex, buf);
					puts_(buf);
					break;
				default:
					break;
			}	
		}

		fmt++;
	}

	uva_end(pa);

	return 0;
}


