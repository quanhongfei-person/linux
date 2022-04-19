/*
 * lcd.h
 *
 *  Created on: Aug 2, 2018
 *      Author: linux
 */

#ifndef LCD_H_
#define LCD_H_
typedef unsigned int u32;
#define COL(R,G,B)  ((R<<16)|(G<<8)|(B))
#define FRAMEBUFFER 0x50000000
#define FRAMEBUFFER1 0x53000000

#define GPF0CON (*(u32 *)0x11400180)
#define GPF1CON (*(u32 *)0x114001a0)
#define GPF2CON (*(u32 *)0x114001c0)
#define GPF3CON (*(u32 *)0x114001e0)
#define MPLL_CON0 (*(u32 *)0x10040108)
//m 16-23   p  8-13   s  0-2
#define CLK_DIV_LCD (*(u32 *)0x1003c534)
#define CLK_SRC_LCD0 (*(u32 *)0x1003c234)
#define LCDBLK_CFG   (*(u32 *)0x10010210)
#define LCDBLK_CFG2   (*(u32 *)0x10010214)
#define VIDCON0      (*(u32 *)0x11c00000 )
#define VIDCON1      (*(u32 *)0x11c00004 )
#define VIDCON2      (*(u32 *)0x11c00008 )
#define VIDCON3      (*(u32 *)0x11c0000C )
#define VIDTCON0     (*(u32 *)0x11c00010 )
#define VIDTCON1     (*(u32 *)0x11c00014 )
#define VIDTCON2     (*(u32 *)0x11c00018 )
#define VIDTCON3     (*(u32 *)0x11c0001C )
#define WINCON0      (*(u32 *)0x11c00020 )
#define WINCON1      (*(u32 *)0x11c00024 )
#define WINCON2      (*(u32 *)0x11c00028 )
#define WINCON3      (*(u32 *)0x11c0002C )
#define WINCON4      (*(u32 *)0x11c00030 )
#define SHADOWCON    (*(u32 *)0x11c00034 )
#define WINCHMAP2    (*(u32 *)0x11c0003C )
#define VIDOSD0A     (*(u32 *)0x11c00040 )
#define VIDOSD0B     (*(u32 *)0x11c00044 )
#define VIDOSD0C     (*(u32 *)0x11c00048 )
#define VIDOSD1A     (*(u32 *)0x11c00050 )
#define VIDOSD1B     (*(u32 *)0x11c00054 )
#define VIDOSD1C     (*(u32 *)0x11c00058 )
#define VIDOSD1D     (*(u32 *)0x11c0005C )
#define VIDOSD2A     (*(u32 *)0x11c00060 )
#define VIDOSD2B     (*(u32 *)0x11c00064 )
#define VIDOSD2C     (*(u32 *)0x11c00068 )
#define VIDOSD2D     (*(u32 *)0x11c0006C )
#define VIDOSD3A     (*(u32 *)0x11c00070 )
#define VIDOSD3B     (*(u32 *)0x11c00074 )
#define VIDOSD3C     (*(u32 *)0x11c00078 )
#define VIDOSD4A     (*(u32 *)0x11c00080 )
#define VIDOSD4B     (*(u32 *)0x11c00084 )
#define VIDOSD4C     (*(u32 *)0x11c00088 )
#define VIDW00ADD0B0 (*(u32 *)0x11c000A0 )
#define VIDW00ADD0B1 (*(u32 *)0x11c000A4 )
#define VIDW00ADD0B2 (*(u32 *)0x11c020A0 )
#define VIDW01ADD0B0 (*(u32 *)0x11c000A8 )
#define VIDW01ADD0B1 (*(u32 *)0x11c000AC )
#define VIDW01ADD0B2 (*(u32 *)0x11c020A8 )
#define VIDW02ADD0B0 (*(u32 *)0x11c000B0 )
#define VIDW02ADD0B1 (*(u32 *)0x11c000B4 )
#define VIDW02ADD0B2 (*(u32 *)0x11c020B0 )
#define VIDW03ADD0B0 (*(u32 *)0x11c000B8 )
#define VIDW03ADD0B1 (*(u32 *)0x11c000BC )
#define VIDW03ADD0B2 (*(u32 *)0x11c020B8 )
#define VIDW04ADD0B0 (*(u32 *)0x11c000C0 )
#define VIDW04ADD0B1 (*(u32 *)0x11c000C4 )
#define VIDW04ADD0B2 (*(u32 *)0x11c020C0 )
#define VIDW00ADD1B0 (*(u32 *)0x11c000D0 )
#define VIDW00ADD1B1 (*(u32 *)0x11c000D4 )
#define VIDW00ADD1B2 (*(u32 *)0x11c020D0 )
#define VIDW01ADD1B0 (*(u32 *)0x11c000D8 )
#define VIDW01ADD1B1 (*(u32 *)0x11c000DC )
#define VIDW01ADD1B2 (*(u32 *)0x11c020D8 )
#define VIDW02ADD1B0 (*(u32 *)0x11c000E0 )
#define VIDW02ADD1B1 (*(u32 *)0x11c000E4 )
#define VIDW02ADD1B2 (*(u32 *)0x11c020E0 )
#define VIDW03ADD1B0 (*(u32 *)0x11c000E8 )
#define W1KEYCON0 (*(u32 *)0x11c00140)




#endif /* LCD_H_ */
