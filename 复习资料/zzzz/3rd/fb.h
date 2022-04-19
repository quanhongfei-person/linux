#ifndef	_FB_H_
#define	_FB_H_

#include <stdio.h>
#include <stdlib.h>
#include <linux/fb.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/mman.h>

typedef unsigned long	u32;
typedef unsigned char	u8;

#define	W	800
#define	H	480

#define	rgb888(r,g,b)	(((r&0xff)<<16)|((g & 0xff)<<8)|(b&0xff))

#pragma pack(1)

// 位图文件头
typedef struct bitmap_file_head{
	short type;		 
	unsigned long size;	
	short reserved[2];	
	unsigned long offset;	
    				
}BM_F_HEAD;

// 位图信息头 
typedef struct bitmap_info_head{
	unsigned long st_size;		
	unsigned long bm_width;		
	unsigned long bm_height;	
	short	      planes;		
	short	      bits_per_pixel;	
	unsigned long compress_type;	
	unsigned long bm_image_size;	
	unsigned long xres;		
	unsigned long yres;		
	unsigned long clr_used;		 
	unsigned long important_clr;	
}BM_IF_HEAD;

#pragma pack(4)

void draw_point(u32* addr, u32 x, u32 y, u32 color);
void draw_point(u32* addr, u32 x, u32 y, u32 color);
void clean_screen(u32* addr, u32 color);
u32* init_fb();




#endif



