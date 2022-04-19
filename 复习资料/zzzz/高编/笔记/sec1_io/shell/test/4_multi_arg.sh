#!/bin/bash 


echo "多参数求和"
total=0;

for var in $@
do
	echo "$var"
	#total+= var;
	total=`expr $total + $var`
done
echo $total
