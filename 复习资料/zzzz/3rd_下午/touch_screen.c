#include <stdio.h>
#include <linux/input.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int main()
{
	struct input_event ev;

	int fd = open("/dev/input/event0", O_RDWR);	
	if(fd < 0){
		perror("open err \n");
		exit(1);
	}
	
	int xres, yres;	

	while(1){
		read(fd, &ev, sizeof(ev));
		if(ev.type == EV_ABS && ev.code == ABS_MT_POSITION_X){	
			xres = ev.value;
			read(fd, &ev, sizeof(ev));	
			yres = ev.value;
			printf("(%d,%d)\n", xres, yres);
		}
	}	

	return 0;	
}









