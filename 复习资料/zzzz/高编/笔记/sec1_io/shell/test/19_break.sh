#!/bin/bash 
while :
do
	echo "输入1-5之间到数"
	read num
	case $num in
		1|2|3|4|5)
			echo "你输入到值是$num" 
			;;
		*)
			echo "没有按套路出牌，游戏结束"
			break
	esac
done
