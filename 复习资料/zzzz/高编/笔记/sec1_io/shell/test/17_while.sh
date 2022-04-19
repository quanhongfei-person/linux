#!/bin/bash 

i=10
while [ $i -gt 0 ] 
do
	echo "i is $i"
	i=`expr $i - 1`
done
