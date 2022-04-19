#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <linux/input.h>

int main(int argc, char* argv[])
{
#if 1
	int led_fd = open("/dev/leds", O_RDWR);
	if(led_fd < 0){
		perror("open led err \n");
		exit(1);
	}
	while(1){
		//第2个参数： 0 表示灯灭   1 表示灯亮	
		//第3个参数： 4个led灯，0：第1个灯，...  3:表示第4个灯
		ioctl(led_fd, 0, 0);	
		ioctl(led_fd, 0, 1);	
		ioctl(led_fd, 0, 2);	
		ioctl(led_fd, 0, 3);	
	}

	close(led_fd);
	int pwm_fd = open("/dev/pwm", O_RDWR);
	if(pwm_fd < 0){
		perror("open pwm err \n");
		exit(1);
	}
	while(1){
		//第2个参数： 0 表示蜂鸣器关闭   1 表示蜂鸣器开启	
		//第3个参数： 设置蜂鸣器振荡频率    10^9 / 100
		ioctl(pwm_fd, 1, 100);	
	}
	close(pwm_fd);
#endif
	int touch_fd = open("/dev/input/event0", O_RDWR);
	if(touch_fd < 0){
		perror("open event0 err \n");
		exit(1);
	}

	struct input_event ev;
	int x, y;
	while(1){
		read(touch_fd, &ev, sizeof(ev));
		if(ev.type == EV_ABS && ev.code == ABS_MT_POSITION_X){
			x = ev.value;
			read(touch_fd, &ev, sizeof(ev));
			y = ev.value;
		}
		printf("(%d, %d)\n", x, y);
	}
	return 0;	
}














