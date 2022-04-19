#!/bin/bash
file="/usr/bin/wall"
if [ -r $1 ]
then
	echo "File has read access"
else
	echo "File does not have read access"
fi
if [ -w $1 ]
then
	echo "File has write permission"
else
	echo "File does not have write permission"
fi
if [ -x $1 ]
then
	echo "File has execute permission"
else
	echo "File does not have execute permission"
fi
if [ -f $1 ]
then
	echo "File is an ordinary file"
else
	echo "This is sepcial file"
fi
if [ -d $1 ]
then
	echo "File is a directory"
else
	echo "This is not a directory"
fi
if [ -s $1 ]
then
	echo "File size is zero"
else
	echo "File size is not zero"
fi
if [ -e $1 ]
then
	echo "File exists"
else
	echo "File does not exist"
fi
