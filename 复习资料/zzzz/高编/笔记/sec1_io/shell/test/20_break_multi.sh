#!/bin/bash  
i=0
while :
do
	for var in {0..10}
	do
		if [ $var -eq 3 ]
		then
			break 2
		fi
		echo " $var"
	done
	i=`expr $i + 1`	
	echo "$i"

done
