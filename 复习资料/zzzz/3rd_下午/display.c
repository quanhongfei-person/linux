#include "fb.h"

u32 image_w;
u32 image_h;

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
void draw_point(u32* addr, u32 x, u32 y, u32 color)
{
	if(x >= 800 || y >= 480){
		return ;
	}
	*(addr + W * y + x) = color;		
}

u8* read_head(char* file_name, BM_F_HEAD* file_head, 
	BM_IF_HEAD* info_head)
{
	int fd = open(file_name, O_RDWR);	
	if(fd < 0){
		perror("open err \n");
		exit(1);
	}
	read(fd, file_head, sizeof(BM_F_HEAD));	
	read(fd, info_head, sizeof(BM_IF_HEAD));	

	//printf("type: %c\n", file_head->type & 0xff);	
	//printf("type: %c\n", (file_head->type & 0xff00) >> 8);	
	//printf("size: %d\n", file_head->size);

	//printf("st_size: %d\n", info_head->st_size);
	//printf("bm_width: %d\n", info_head->bm_width);
	//printf("bm_height: %d\n", info_head->bm_height);
	//printf("bits_per_pixel: %d\n", info_head->bits_per_pixel);
	//printf("bm_image_size: %d\n", info_head->bm_image_size);

	image_w = info_head->bm_width;
	image_h = info_head->bm_height;
	u8* image_addr = malloc(sizeof(u8)*info_head->bm_image_size);
	read(fd, image_addr, info_head->bm_image_size);		

	return image_addr;
} 
void disp_bmp(u32* addr, u8* image_addr, u32 xres, u32 yres)
{
	int i, j;
	u8 r, g, b;
	for(i=image_h-1; i>=0; i--){
		for(j=0; j<image_w; j++){
			b = *image_addr++;			
//			image_addr++;
			g = *image_addr++;
//			image_addr++;
			r = *image_addr++;
//			image_addr++;
			if(r == 255 && g == 255 && b == 255)
				continue;
			draw_point(addr, xres+j, yres+i, rgb888(r, g, b));	
		}
	}
}
int main()
{
	u32* addr = init_fb();
	clean_screen(addr, rgb888(255, 0, 0));	

	BM_F_HEAD file_head; 
	BM_IF_HEAD info_head;
	u8* image_addr = read_head("bk2.bmp", &file_head, &info_head);	

	disp_bmp(addr, image_addr, 0, 0);	

	char* gui[4] = {"gui1.bmp", "gui2.bmp", "gui3.bmp", "gui4.bmp"};
	
	int i = 0, j = 0;
	while(i < 4){
		image_addr = read_head("bk2.bmp", &file_head, &info_head);	
		disp_bmp(addr, image_addr, 0, 0);	
			
		image_addr = read_head(gui[i], &file_head, &info_head);	
		disp_bmp(addr, image_addr, 100+j*10, 100);	
		i++;
		j++;
		if(i == 4)
			i = 0;
		if(j == 70)
			j = 0;
		usleep(150000);
	}
//	printf("%d \n", sizeof(file_head));

	return 0;
}







