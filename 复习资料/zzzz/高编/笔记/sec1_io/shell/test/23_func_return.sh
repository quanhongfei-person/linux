#!/bin/bash 
add()
{

	echo "将计算两个数到和"
	echo "输入第一个数"
	read a
	echo "输入第二个数"
	read b

	return $(($a+$b))

}
add 
ret=$?

echo "两个数的和是$ret"
