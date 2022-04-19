CROSS_COMPILE=arm-linux-
CC=$(CROSS_COMPILE)gcc
LD=$(CROSS_COMPILE)ld
OBJCOPY=$(CROSS_COMPILE)objcopy
TARGET=arm

OBJS= arch/start.o driver/main.o driver/beep.o driver/led.o
all:$(OBJS)
	$(LD) -Ttext=0x40008000 $(OBJS) -o $(TARGET)
	$(OBJCOPY) -O binary $(TARGET) $(TARGET).bin

#Makefile的变量  $(CROSS_COMPILE)  变量引用

%.o:%.S
	$(CC) -c $< -o $@
	
	# $<一个依赖   $^ 所有依赖  $@ 目标

%.o:%.c
	$(CC) -c $< -o $@ -I./include
#-I 指定头文件路径 