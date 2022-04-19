CROSS_COMPILE=arm-linux-
CC=$(CROSS_COMPILE)gcc
LD=$(CROSS_COMPILE)ld
OBJCOPY=$(CROSS_COMPILE)objcopy
OBJDUMP=$(CROSS_COMPILE)objdump
TARGET=arm

OBJS= arch/start.o driver/main.o driver/beep.o driver/led.o driver/uart.o driver/printf.o
all:$(OBJS)
	$(LD) -Tmap.lds $(OBJS) -o $(TARGET)
	$(OBJCOPY) -O binary $(TARGET) $(TARGET).bin
	$(OBJDUMP) -d $(TARGET) > $(TARGET).s

#Makefile的变量  $(CROSS_COMPILE)  变量引用

%.o:%.S
	$(CC) -c $< -o $@
	
	# $<一个依赖   $^ 所有依赖  $@ 目标

%.o:%.c
	$(CC) -c $< -o $@ -I./include
#-I 指定头文件路径 
.PHONY:clean
clean:
	rm $(TARGET) $(OBJS) *.bin 