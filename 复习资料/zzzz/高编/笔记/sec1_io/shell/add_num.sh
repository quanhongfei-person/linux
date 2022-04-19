#!/bin/bash
num=0
while read line
do
num=`expr $num + 1`

if [ -z $line ]
then 
    echo "空行"
else 
echo "$num $line">> temp.txt
fi
done<$1
mv temp.txt $1 
