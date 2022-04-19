all:
	arm-linux-gcc -c start.S -o start.o
	arm-linux-gcc -c led.c -o led.o
	arm-linux-gcc -c key.c -o key.o
	arm-linux-ld -Ttext=0x40008000 start.o led.o  key.o -o led
	arm-linux-objcopy -O binary led led.bin
