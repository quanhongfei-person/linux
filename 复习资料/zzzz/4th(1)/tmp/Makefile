CC=gcc
FLAG=-c
OUTPUT=-g -o
OBJ=test
SRC=hash.o test.o 


$(OBJ):$(SRC)
	$(CC) $^ $(OUTPUT) $@ 
%.o:%.c
	$(CC) $(FLAG) $^ $(OUTPUT) $@ 
.PHONY:clean
clean:
	rm -rf *.o test









# 目标：依赖
# $^  表示条目中所有的依赖文件
# $@  表示条目中的目标文件  
# $<	第一个

#test:hash.o test.o
#	gcc hash.o test.o -o test
#hash.o:hash.c
#	gcc -c hash.c -o hash.o
#test.o:test.c
#	gcc -c test.c -o test.o
#clean:
#	rm -rf *.o test
#


