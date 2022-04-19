#!/bin/bash 
case $1 in
-f)
	echo "被检测到是普通文件"
	;;
-d)
	echo "被检测到是目录"
	;;
*)
	echo "参数输入错误"
	;;
esac
