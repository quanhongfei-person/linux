#!/bin/bash 
fun()
{
	echo "第一个参数是 $1"
	echo "第二个参数是 $2"
	#$10 读取变量到方式是错误的。
	echo "第十个参数是 $10"
	echo "第十个参数是 ${10}"
	echo "参数的个数 $#"
	echo "参数他们是$@"
}

#函数在调用时用到到参数
fun 1 2 3 4 5 6 7 8 9 34 55 66

