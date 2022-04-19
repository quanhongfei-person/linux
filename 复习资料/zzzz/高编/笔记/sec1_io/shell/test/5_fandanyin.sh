#!/bin/bash 
#反单引号的使用示例，反单引号会对内容进行计算或求值

DATE=`date`
echo "当前到时间是 $DATE"

login=`who | wc -l`
echo "当前有$login 个人登录"


UP=`date;uptime`
echo "机器到运行时间是 $UP"
