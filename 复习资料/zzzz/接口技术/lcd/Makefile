CROSS_COMPILE=arm-linux-
CC=$(CROSS_COMPILE)gcc
LD=$(CROSS_COMPILE)ld
OBJCOPY=$(CROSS_COMPILE)objcopy
OBJDUMP=$(CROSS_COMPILE)objdump
ARCH=./arch
DRIVER=./driver
TARGET=arm
#Makefile的变量都是大写
OBJS=$(ARCH)/start.o  main.o $(DRIVER)/led.o $(DRIVER)/key.o $(DRIVER)/beep.o
OBJS+=$(DRIVER)/pwm0.o $(DRIVER)/uart.o $(ARCH)/_divsi3.o $(DRIVER)/printf.o $(DRIVER)/eint.o
OBJS+=$(DRIVER)/irq.o $(DRIVER)/wdt.o $(DRIVER)/adc.o $(DRIVER)/iic.o $(DRIVER)/touch.o $(DRIVER)/lcd.o $(DRIVER)/backlight.o $(DRIVER)/pwm.o
all:$(OBJS)
	$(LD) -Tmap.lds $(OBJS) -o $(TARGET)
	$(OBJCOPY) -O binary $(TARGET) arm.bin
	$(OBJDUMP) -d $(TARGET) > arm.s
#%是通配符  相当于shell的* 
%.o:%.S
	$(CC) -c $< -o $@ -mabi=apcs-gnu
# $<  一个依赖   $^所有依赖   $@ 目标
%.o:%.c
	$(CC) -c $< -o $@ -I./include -mabi=apcs-gnu

.PHONY:clean
clean:
	rm $(OBJS) $(TARGET) arm.bin
