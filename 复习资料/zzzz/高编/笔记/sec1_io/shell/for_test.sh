#!/bin/bash
echo "bash 命令行内部参数演示"
sum=0
for temp in $@
do
    sum=`expr $sum + $temp`
done 
echo $sum
