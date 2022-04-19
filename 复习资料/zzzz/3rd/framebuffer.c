#include "fb.h"
	
extern u8 font_yan[56*56/8];		

u32* init_fb()
{
	int fd = open("/dev/fb0", O_RDWR);
	if(fd < 0){
		perror("open err \n");
		exit(1);
	}
	struct fb_var_screeninfo vinfo;
	ioctl(fd, FBIOGET_VSCREENINFO, &vinfo);	

	//printf("vinfo.xres: %d\n", vinfo.xres);	
	//printf("vinfo.yres: %d\n", vinfo.yres);	
	//printf("vinfo.yres: %d\n", vinfo.bits_per_pixel);	
	u32 size = vinfo.xres*vinfo.yres*vinfo.bits_per_pixel/8;	
	u32* addr = mmap(NULL, size, PROT_READ|PROT_WRITE,
					MAP_SHARED, fd, 0);
	if(addr == (void*)-1){
		perror("mmap err \n");
		exit(1);
	}

	return addr;
}
void clean_screen(u32* addr, u32 color)
{
	int i, j;
	for(i=0; i<H; i++){
		for(j=0; j<W; j++)
			draw_point(addr, j, i, color);
	}
}
void draw_gb2312(u32* addr, u32 x, u32 y, u8* font_yan)
{
	int i, j;
	u8 tmp;
	for(i=0; i<56; i++)
	{
		tmp = font_yan[i*7];		
		for(j=0; j<8; j++)
		{
			if(tmp & 0x80)
				draw_point(addr, x+j, y+i, rgb888(0,0,0));
			//else
			//	draw_point(addr, x+j, y+i, rgb888(255,255,255));
			tmp = tmp << 1;
		}
		tmp = font_yan[i*7 + 1];		
		for(j=0; j<8; j++)
		{
			if(tmp & 0x80)
				draw_point(addr, x+j+8, y+i, rgb888(0,0,0));
		//	else
		//		draw_point(addr, x+j+8, y+i, rgb888(255,255,255));
			tmp = tmp << 1;
		}
		tmp = font_yan[i*7 + 2];		
		for(j=0; j<8; j++)
		{
			if(tmp & 0x80)
				draw_point(addr, x+j+16, y+i, rgb888(0,0,0));
		//	else
		//		draw_point(addr, x+j+16, y+i, rgb888(255,255,255));
			tmp = tmp << 1;
		}
		tmp = font_yan[i*7 + 3];		
		for(j=0; j<8; j++)
		{
			if(tmp & 0x80)
				draw_point(addr, x+j+24, y+i, rgb888(0,0,0));
		//	else
		//		draw_point(addr, x+j+24, y+i, rgb888(255,255,255));
			tmp = tmp << 1;
		}
		tmp = font_yan[i*7 + 4];		
		for(j=0; j<8; j++)
		{
			if(tmp & 0x80)
				draw_point(addr, x+j+32, y+i, rgb888(0,0,0));
		//	else
		//		draw_point(addr, x+j+32, y+i, rgb888(255,255,255));
			tmp = tmp << 1;
		}
		tmp = font_yan[i*7 + 5];		
		for(j=0; j<8; j++){
			if(tmp & 0x80)
				draw_point(addr, x+j+40, y+i, rgb888(0,0,0));
		//	else
		//		draw_point(addr, x+j+40, y+i, rgb888(255,255,255));
			tmp = tmp << 1;
		}
		tmp = font_yan[i*7 + 6];		
		for(j=0; j<8; j++)
		{
			if(tmp & 0x80)
				draw_point(addr, x+j+48, y+i, rgb888(0,0,0));
		//	else
		//		draw_point(addr, x+j+48, y+i, rgb888(255,255,255));
			tmp = tmp << 1;
		}
	}		
}

void draw_point(u32* addr, u32 x, u32 y, u32 color)
{
	if(x >= 800 || y >= 480){
		return ;
	}
	*(addr + W * y + x) = color;		
}

int main()
{
	u32* addr = init_fb();
	clean_screen(addr, rgb888(255, 0, 0));	

	draw_gb2312(addr, 200, 100, font_yan);

	return 0;
}







