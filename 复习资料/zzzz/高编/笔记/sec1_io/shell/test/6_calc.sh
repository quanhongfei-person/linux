#!/bin/bash 
a=10
b=20

val=`expr $a + $b`
echo "a + b is $val"
val=`expr $a - $b`
echo "a - b is $val"
val=`expr $a \* $b`
echo "a * b is $val"
val=`expr $a / $b`
echo "a / b is $val"
val=`expr $a % $b`
echo "a % b is $val"


if [ $a == $b ]
then
	echo " a == b"
fi

if [ $a != $b ]
then 
	echo "a != b"
fi
