#!/bin/bash 

echo "请输入一个数1-4之间"
read num

case $num in
1)
	echo "111111111"
	;;
2)
	echo "222222222"
	;;
3)
	echo "3333333333"
	;;
4)
	echo "444444444"
	;;
*)
	echo "输入错误"
	;;
esac
