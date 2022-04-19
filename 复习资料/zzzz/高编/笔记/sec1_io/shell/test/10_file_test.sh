#!/bin/bash 
file="6_calc.sh"

if [ -b $1 ]
then 
	echo "块设备文件" 
fi

if [ -c $1 ]
then 
	echo "字符文件" 
fi

if [ -p $1 ]
then 
	echo "管道文件"
fi
if [ -d $1 ]
then 
	echo "目录文件"
fi
if [ -f $1 ]
then 
	echo "普通文件"
fi

if [ -g $1 ]
then
	echo " 设置了组id权限"
fi

if [ -u $1 ]
then 
	echo "设置了用户id" 
fi

if [ -k $1 ]
then 
	echo "设置了粘黏位权限"
fi

if [ -r $1 ]
then 
	echo "对该文件有可读到权限"
fi

if [ -w $1 ]
then 
	echo "对该文件有可写到权限"
fi
if [ -x $1 ]
then 
	echo "对该文件有可执行权限"
fi
