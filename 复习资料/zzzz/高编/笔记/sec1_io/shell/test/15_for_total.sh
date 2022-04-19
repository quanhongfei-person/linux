#!/bin/bash 

total=0
#{1..10} 产生1-10的数字序列

for var in {1..10}
do
	#echo "当前到文件名字是 $var"
	total=`expr $total + $var`
done

echo "和是 $total"
