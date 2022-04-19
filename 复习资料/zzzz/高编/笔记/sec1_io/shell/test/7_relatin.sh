#!/bin/bash  

echo "输入第一个数"
read a
echo "输入第二个数"
read b

if [ $a -eq $b ]
then
	echo "a == b"
fi

if [ $a -ne $b ]
then
	echo " a != b "
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

