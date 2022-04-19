#!/bin/bash 

total=0
#{1..10} 产生1-10的数字序列

#for var in {1..10}
for((i=0;i<10;i++))
do
	#echo "当前到文件名字是 $var"
	total=`expr $total + $i`
done

echo "和是 $total"
