#include "fb.h"

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

void read_head(char* file_name, BM_F_HEAD* file_head, 
	BM_IF_HEAD* info_head)
{
	int fd = open(file_name, O_RDWR);	
	if(fd < 0){
		perror("open err \n");
		exit(1);
	}
	read(fd, file_head, sizeof(BM_F_HEAD));	
	read(fd, info_head, sizeof(BM_IF_HEAD));	
	printf("type: %c\n", file_head->type & 0xff);	
	printf("type: %c\n", (file_head->type & 0xff00) >> 8);	
	printf("size: %d\n", file_head->size);

	printf("st_size: %d\n", info_head->st_size);
	printf("bm_width: %d\n", info_head->bm_width);
	printf("bm_height: %d\n", info_head->bm_height);
	printf("bits_per_pixel: %d\n", info_head->bits_per_pixel);
	printf("bm_image_size: %d\n", info_head->bm_image_size);
} 
int main()
{
	u32* addr = init_fb();
	clean_screen(addr, rgb888(255, 0, 0));	

	BM_F_HEAD file_head; 
	BM_IF_HEAD info_head;
	read_head("123.bmp", &file_head, &info_head);	
//	printf("%d \n", sizeof(file_head));

	return 0;
}







