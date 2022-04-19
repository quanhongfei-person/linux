#!/bin/bash  

echo "输入第一个数"
read a
echo "输入第二个数"
read b

if [ $a -eq $b  -o  $b -ge 10 ]
then
	echo "a == b or b == 10"
fi

if [ $a -ne $b  -a $a -gt 5 ]
then
	echo " a != b  and a > 5"
fi

if [ $a -gt $b ]
then
	echo " a > b"
fi

if [ $a -lt $b ]
then 
	echo "a < b"
fi


if [ $a -ge $b ]
then 
	echo " a>= b"
fi

if [ $a -le $b ]
then 
	echo "a <= b"
fi

