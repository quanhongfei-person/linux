#!/bin/bash 
a=10
b=20

if [ $a -gt 20  ]
then
	echo "a > 20"
else
	echo "a <20"
fi


if [ $a -lt 5 ]
then
	echo " $a < 5 "
elif [ $a -gt 8 ]
then
	echo " $a > 8"
fi
