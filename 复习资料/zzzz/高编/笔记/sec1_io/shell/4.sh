#!/bin/bash
# 演示 $*, $@ 区别，$@ 可以把多个参数分块。不是当作一个整体。

echo "\$*=" $*
echo "\"\$*\"=" "$*"
echo "\$@=" $@
echo "\"\$@\"=" "$@"
echo "print each param from \$*"
for var in $*
do
	echo "$var"
done
echo "print each param from \$@"
for var in $@
do
	echo "$var"
done
echo "print each param from \"\$*\""
for var in "$*"
do
	echo "$var"
done
echo "print each param from \"\$@\""
for var in "$@"
do
	echo "$var"
done
