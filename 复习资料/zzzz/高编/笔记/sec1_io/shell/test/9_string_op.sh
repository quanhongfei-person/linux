#!/bin/bash  

echo "请输入一个字符串"
read str


str1='123'
if [ -z ${str} ]
then
	echo "str is empty..."
fi
 
if [ -n ${str} ]
then 
	echo "str lenth not zero..." 
fi
echo  -x $str
