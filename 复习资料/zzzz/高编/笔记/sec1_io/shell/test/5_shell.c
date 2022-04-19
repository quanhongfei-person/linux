	Shell有两种执行命令的方式：
交互式（Interactive）：解释执行用户的命令，用户输入一条命令，Shell就解释执行一条。
批处理（Batch）：用户事先写一个Shell脚本(Script)，其中有很多条命令，让Shell一次把这些命令执行完，而不必一条一条地敲命令。


Shell脚本和编程语言很相似，也有变量和流程控制语句，但Shell脚本是解释执行的，不需要编译，Shell程序从脚本中一行一行读取并执行这些命令，相当于一个用户把脚本中的命令一行一行敲到Shell提示符下执行。
		
		
		几种常见的Shell
Unix/Linux上常见的Shell脚本解释器有bash、sh、csh、ksh等，习惯上把它们称作一种Shell。我们常说有多少种Shell，其实说的是Shell脚本解释器。
bash

bash是Linux标准默认的shell。bash由Brian Fox和Chet Ramey共同完成，是BourneAgain Shell的缩写，内部命令一共有40个。

Linux使用它作为默认的shell是因为它有诸如以下的特色：
可以使用类似DOS下面的doskey的功能，用方向键查阅和快速输入并修改命令。
自动通过查找匹配的方式给出以某字符串开头的命令。
包含了自身的帮助功能，你只要在提示符下面键入help就可以得到相关的帮助。
sh

sh 由Steve Bourne开发，是Bourne Shell的缩写，sh 是Unix 标准默认的shell。
ash

ash shell 是由Kenneth Almquist编写的，Linux中占用系统资源最少的一个小shell，它只包含24个内部命令，因而使用起来很不方便。
csh

csh 是Linux比较大的内核，它由以William Joy为代表的共计47位作者编成，共有52个内部命令。该shell其实是指向/bin/tcsh这样的一个shell，也就是说，csh其实就是tcsh。
ksh

ksh 是Korn shell的缩写，由Eric Gisin编写，共有42条内部命令。该shell最大的优点是几乎和商业发行版的ksh完全兼容，这样就可以在不用花钱购买商业版本的情况下尝试商业版本的性能了。

注意：bash是 Bourne Again Shell 的缩写，是linux标准的默认shell ，它基于Bourne shell，吸收了C shell和Korn shell的一些特性。bash完全兼容sh，也就是说，用sh写的脚本可以不加修改的在bash中执行。

		Shell脚本语言与编译型语言的差异
大体上，可以将程序设计语言可以分为两类：编译型语言和解释型语言。
编译型语言

很多传统的程序设计语言，例如Fortran、Ada、Pascal、C、C++和Java，都是编译型语言。这类语言需要预先将我们写好的源代码(source code)转换成目标代码(object code)，这个过程被称作“编译”。

运行程序时，直接读取目标代码(object code)。由于编译后的目标代码(object code)非常接近计算机底层，因此执行效率很高，这是编译型语言的优点。

但是，由于编译型语言多半运作于底层，所处理的是字节、整数、浮点数或是其他机器层级的对象，往往实现一个简单的功能需要大量复杂的代码。例如，在C++里，就很难进行“将一个目录里所有的文件复制到另一个目录中”之类的简单操作。
解释型语言

解释型语言也被称作“脚本语言”。执行这类程序时，解释器(interpreter)需要读取我们编写的源代码(source code)，并将其转换成目标代码(object code)，再由计算机运行。因为每次执行程序都多了编译的过程，因此效率有所下降。

使用脚本编程语言的好处是，它们多半运行在比编译型语言还高的层级，能够轻易处理文件与目录之类的对象；缺点是它们的效率通常不如编译型语言。不过权衡之下，通常使用脚本编程还是值得的：花一个小时写成的简单脚本，同样的功能用C或C++来编写实现，可能需要两天，而且一般来说，脚本执行的速度已经够快了，快到足以让人忽略它性能上的问题。脚本编程语言的例子有awk、Perl、Python、Ruby与Shell。
		
		什么时候使用Shell

因为Shell似乎是各UNIX系统之间通用的功能，并且经过了POSIX的标准化。因此，Shell脚本只要“用心写”一次，即可应用到很多系统上。因此，之所以要使用Shell脚本是基于：
简单性：Shell是一个高级语言；通过它，你可以简洁地表达复杂的操作。
可移植性：使用POSIX所定义的功能，可以做到脚本无须修改就可在不同的系统上执行。
开发容易：可以在短时间内完成一个功能强大又妤用的脚本。

但是，考虑到Shell脚本的命令限制和效率问题，下列情况一般不使用Shell：
资源密集型的任务，尤其在需要考虑效率时（比如，排序，hash等等）。
需要处理大任务的数学操作，尤其是浮点运算，精确运算，或者复杂的算术运算（这种情况一般使用C++或FORTRAN 来处理）。
有跨平台（操作系统）移植需求（一般使用C 或Java）。
复杂的应用，在必须使用结构化编程的时候（需要变量的类型检查，函数原型，等等）。
对于影响系统全局性的关键任务应用。
对于安全有很高要求的任务，比如你需要一个健壮的系统来防止入侵、破解、恶意破坏等等。
需要多维数组的支持。
需要数据结构的支持，比如链表或数等数据结构。
需要产生或操作图形化界面 GUI。
需要直接操作系统硬件。
需要 I/O 或socket 接口。
私人的、闭源的应用（shell 脚本把代码就放在文本文件中，全世界都能看到）。

如果你的应用符合上边的任意一条，那么就考虑一下更强大的语言吧——或许是Perl、Tcl、Python、Ruby——或者是更高层次的编译语言比如C/C++，或者是Java。即使如此，你会发现，使用shell来原型开发你的应用，在开发步骤中也是非常有用的。
	
	第一个Shell脚本
打开文本编辑器，新建一个文件，扩展名为sh（sh代表shell），扩展名并不影响脚本执行，见名知意就好，如果你用php写shell 脚本，扩展名就用php好了。
python 脚本语言，更强大。
输入一些代码：
1.sh
#!/bin/bash
echo "Hello World !"

[yas@localhost shell]$ echo "你好！$PATH"
你好！/usr/lib/ccache:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/arm/4.3.2/usr/local/arm/4.3.2/bin:/home/yas/bin:/usr/local/arm/4.3.2/usr/local/arm/4.3.2/bin
[yas@localhost shell]$ echo '你好！$PATH'
你好！$PATH

``  反单引号的用法
[yas@localhost shell]$ date
Fri Jan 22 10:26:39 CST 2016
[yas@localhost shell]$ today = `date`
bash: today: command not found...
[yas@localhost shell]$ today=`date`
[yas@localhost shell]$ echo $today
Fri Jan 22 10:27:33 CST 2016


“#!” 是一个约定的标记，它告诉系统这个脚本需要什么解释器来执行，即使用哪一种Shell。echo命令用于向窗口输出文本。

运行Shell脚本有两种方法。
作为可执行程序

将上面的代码保存为test.sh，并 cd 到相应目录：
chmod +x ./test.sh  #使脚本具有执行权限
./test.sh  #执行脚本
注意，一定要写成./test.sh，而不是test.sh。运行其它二进制的程序也一样，直接写test.sh，linux系统会去PATH里寻找有没有叫test.sh的，而只有/bin, /sbin, /usr/bin，/usr/sbin等在PATH里，你的当前目录通常不在PATH里，所以写成test.sh是会找不到命令的，要用./test.sh告诉系统说，就在当前目录找。

通过这种方式运行bash脚本，第一行一定要写对，好让系统查找到正确的解释器。

这里的"系统"，其实就是shell这个应用程序（想象一下Windows Explorer），但我故意写成系统，是方便理解，既然这个系统就是指shell，那么一个使用/bin/sh作为解释器的脚本是不是可以省去第一行呢？是的。
作为解释器参数

这种运行方式是，直接运行解释器，其参数就是shell脚本的文件名，如：
/bin/sh test.sh
/bin/php test.php
这种方式运行的脚本，不需要在第一行指定解释器信息，写了也没用。

再看一个例子。下面的脚本使用 read 命令从 stdin 获取输入并赋值给 PERSON 变量，最后在 stdout 上输出：
#!/bin/bash
# Author : yas
# Copyright (c) shenlan 
# Script follows here:
echo "What is your name?"
read yas
echo "Hello, $yas"
运行脚本：
chmod +x ./2.sh
$./2.sh
What is your name?
yas
Hello, yas
$


echo  相当于c语言当中pintf
shell 中的变量
变量的类型：
1) 局部变量

局部变量在脚本或命令中定义，仅在当前shell实例中有效，其他shell启动的程序不能访问局部变量。
2) 环境变量

所有的程序，包括shell启动的程序，都能访问环境变量，有些程序需要环境变量来保证其正常运行。必要的时候shell脚本也可以定义环境变量。

export HISTSIZE=2000
3) shell变量

shell变量是由shell程序设置的特殊变量。shell变量中有一部分是环境变量，有一部分是局部变量，这些变量保证了shell的正常运行
$0, $#, $*, $@, $?, $$等


定义变量时，变量名不加美元符号（$），如
variableName=“value”

注意，变量名和等号之间不能有空格
同时，变量名的命名须遵循如下规则：
首个字符必须为字母（a-z，A-Z）。
中间不能有空格，可以使用下划线（_）。
不能使用标点符号。
不能使用bash里的关键字（可用help命令查看保留关键字）。


my="www.163.com"
numa=100

对应变量，默认接收到的数据都以字符串对待，其中
numa=100，,100当做字符串处理。



变量的使用， 变量引用（使用的时候）前面加$
echo $numa
echo ${my} 推荐使用，{}作为变量名边界

shell中的特殊变量
$0, $#, $*, $@, $?, $$

特殊变量列表
2.sh 1 2 3 4 
变量	 含义
$0	 当前脚本的文件名 argv[]
$n	 传递给脚本或函数的参数。n 是一个数字，表示第几个参数。例如，第一个参数是$1，第二个参数是$2。
$#	  相当于argc ， 传递给脚本或函数的参数个数。不包括命令本身（$0）
$*	 传递给脚本或函数的所有参数。
$@	 传递给脚本或函数的所有参数。被双引号(" ")包含时，与 $* 稍有不同，下面将会讲到。
$?	 上个命令的退出状态，或函数的返回值。
$$	 当前Shell进程ID。对于 Shell 脚本，就是这些脚本所在的进程ID。

#!/bin/bash
echo "File Name: $0"
echo "First Parameter : $1"
echo "First Parameter : $2"
echo "Quoted Values: $@"
echo "Quoted Values: $*"
echo "Total Number of Parameters : $#"
./3.sh aaa bbb
agrc argv 

$* 和 $@ 的区别

$* 和 $@ 都表示传递给函数或脚本的所有参数，不被双引号(" ")包含时，都以"$1" "$2" … "$n" 的形式输出所有参数。

但是当它们被双引号(" ")包含时，"$*" 会将所有的参数作为一个整体，以"$1 $2 … $n"的形式输出所有参数；"$@" 会将各个参数分开，以"$1" "$2" … "$n" 的形式输出所有参数。
4.sh
#!/bin/bash
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

./test.sh "a" "b" "c" "d" "e"

退出状态

$? 可以获取上一个命令的退出状态。所谓退出状态，就是上一个命令执行后的返回结果。

退出状态是一个数字，一般情况下，大部分命令执行成功会返回 0，失败返回 1。

不过，也有一些命令返回其他值，表示不同类型的错误。

命令替换

命令替换是指Shell可以先执行命令，将输出结果暂时保存，在适当的地方输出。

命令替换的语法：
`command`
注意是反引号，不是单引号，这个键位于 Esc 键下方。

下面的例子中，将命令执行结果保存在变量中：
#!/bin/bash  5.sh
DATE=`date`
echo "Date is $DATE"
USERS=`who | wc -l`;
echo "Logged in user are $USERS"
UP=`date ; uptime`
echo "Uptime is $UP"
运行结果：
Date is Thu Jul  2 03:59:57 MST 2009
Logged in user are 1
Uptime is Thu Jul  2 03:59:57 MST 2009
03:59:57 up 20 days, 14:03,  1 user,  load avg: 0.13, 0.07, 0.15


7.sh
#!/bin/sh
a=10
b=20
val=`expr $a + $b`
echo "a + b : $val"
val=`expr $a - $b`
echo "a - b : $val"
val=`expr $a \* $b`
echo "a * b : $val"
val=`expr $b / $a`
echo "b / a : $val"
val=`expr $b % $a`
echo "b % a : $val"

if [ $a == $b ]
then
   echo "a is equal to b"
fi
if [ $a != $b ]
then
   echo "a is not equal to b"
fi
乘号(*)前边必须加反斜杠(\)才能实现乘法运算；


算术运算符列表
运算符	 说明	 举例
+	 加法	 `expr $a + $b` 结果为 30。
-	 减法	 `expr $a - $b` 结果为 10。
*	 乘法	 `expr $a \* $b` 结果为  200。
/	 除法	 `expr $b / $a` 结果为 2。
%	 取余	 `expr $b % $a` 结果为 0。
=	 赋值	 a=$b 将把变量 b 的值赋给 a。
==	 相等。用于比较两个数字，相同则返回 true。	 [ $a == $b ] 返回 false。
!=	 不相等。用于比较两个数字，不相同则返回 true。	 [ $a != $b ] 返回 true。
注意：条件表达式要放在方括号之间，并且要有空格，例如 [$a==$b] 是错误的，必须写成 [ $a == $b ]。


关系运算符

关系运算符只支持数字，不支持字符串，除非字符串的值是数字。

8.sh
#!/bin/sh
a=10
b=20
if [ $a -eq $b ] equal
then
   echo "$a -eq $b : a is equal to b"
else
   echo "$a -eq $b: a is not equal to b"
fi
if [ $a -ne $b ] not equal
then
   echo "$a -ne $b: a is not equal to b"
else
   echo "$a -ne $b : a is equal to b"
fi
if [ $a -gt $b ] great than 
then
   echo "$a -gt $b: a is greater than b"
else
   echo "$a -gt $b: a is not greater than b"
fi
if [ $a -lt $b ] less than 
then
   echo "$a -lt $b: a is less than b"
else
   echo "$a -lt $b: a is not less than b"
fi
if [ $a -ge $b ] great equal 
then
   echo "$a -ge $b: a is greater or  equal to b"
else
   echo "$a -ge $b: a is not greater or equal to b"
fi
if [ $a -le $b ] less equal
then
   echo "$a -le $b: a is less or  equal to b"
else
   echo "$a -le $b: a is not less or equal to b"
fi
运行结果：
10 -eq 20: a is not equal to b
10 -ne 20: a is not equal to b
10 -gt 20: a is not greater than b
10 -lt 20: a is less than b
10 -ge 20: a is not greater or equal to b
10 -le 20: a is less or  equal to b


关系运算符列表
运算符	 说明	 举例
-eq	 检测两个数是否相等，相等返回 true。	 [ $a -eq $b ] 返回 true。
-ne	 检测两个数是否相等，不相等返回 true。	 [ $a -ne $b ] 返回 true。
-gt	 检测左边的数是否大于右边的，如果是，则返回 true。	 [ $a -gt $b ] 返回 false。
-lt	 检测左边的数是否小于右边的，如果是，则返回 true。	 [ $a -lt $b ] 返回 true。
-ge	 检测左边的数是否大等于右边的，如果是，则返回 true。	 [ $a -ge $b ] 返回 false。
-le	 检测左边的数是否小于等于右边的，如果是，则返回 true。	 [ $a -le $b ] 返回 true。





布尔运算符

先来看一个布尔运算符的例子：
#!/bin/sh 9.sh
a=10
b=20
if [ $a != $b ]
then
   echo "$a != $b : a is not equal to b"
else
   echo "$a != $b: a is equal to b"
fi
if [ $a -lt 100 -a $b -gt 15 ]  and
then
   echo "$a -lt 100 -a $b -gt 15 : returns true"
else
   echo "$a -lt 100 -a $b -gt 15 : returns false"
fi
if [ $a -lt 100 -o $b -gt 100 ] or 
then
   echo "$a -lt 100 -o $b -gt 100 : returns true"
else
   echo "$a -lt 100 -o $b -gt 100 : returns false"
fi
if [ $a -lt 5 -o $b -gt 100 ]
then
   echo "$a -lt 100 -o $b -gt 100 : returns true"
else
   echo "$a -lt 100 -o $b -gt 100 : returns false"
fi
运行结果：
10 != 20 : a is not equal to b
10 -lt 100 -a 20 -gt 15 : returns true
10 -lt 100 -o 20 -gt 100 : returns true
10 -lt 5 -o 20 -gt 100 : returns false

布尔运算符列表  在shell中，0 表示真，非0都为假
运算符	 说明	 举例
!	 非运算，表达式为 true 则返回 false，否则返回 true。	 [ ! false ] 返回 true。
-o	 或运算，有一个表达式为 true 则返回 true。	 [ $a -lt 20 -o $b -gt 100 ] 返回 true。
-a	 与运算，两个表达式都为 true 才返回 true。	 [ $a -lt 20 -a $b -gt 100 ] 返回 false。




字符串运算符

先来看一个例子：
#!/bin/sh  10.sh
a="abc"
b="efg"
if [ $a = $b ]
then
   echo "$a = $b : a is equal to b"
else
   echo "$a = $b: a is not equal to b"
fi
if [ $a != $b ]
then
   echo "$a != $b : a is not equal to b"
else
   echo "$a != $b: a is equal to b"
fi



if [ -z $a ] zero
then
   echo "-z $a : string length is zero"
else
   echo "-z $a : string length is not zero"
	echo "-z $a : string length is not zero"
fi
 
 if( a == 0 )
 {
	 
	 
 }
 
 else
 {
	 
	 
 }


if [ -n $a ] 
then
   echo "-n $a : string length is not zero"
else
   echo "-n $a : string length is zero"
fi
if [ $a ]
then
   echo "$a : string is not empty"
else
   echo "$a : string is empty"
fi
运行结果：
abc = efg: a is not equal to b
abc != efg : a is not equal to b
-z abc : string length is not zero
-n abc : string length is not zero
abc : string is not empty

字符串运算符列表
运算符	 说明	 举例
=	 检测两个字符串是否相等，相等返回 true。	 [ $a = $b ] 返回 false。
!=	 检测两个字符串是否相等，不相等返回 true。	 [ $a != $b ] 返回 true。
-z	 检测字符串长度是否为0，为0返回 true。	 [ -z $a ] 返回 false。
-n	 检测字符串长度是否为0，不为0返回 true。	 [ -z '$a' ] 返回 true。 为null
str	 检测字符串是否为空，不为空返回 true。	 [ $a ] 返回 true。
[ -n "$a" ] 返回 true。 no null
str	 检测字符串是否为空，不为空返回 true。	 [ $a ] 返回 true。



文件测试运算符

文件测试运算符用于检测 Unix 文件的各种属性。

例如，变量 file 表示文件“/var/www/tutorialspoint/unix/test.sh”，它的大小为100字节，具有 rwx 权限。下面的代码，将检测该文件的各种属性：
#!/bin/bash 11.sh
file="/var/www/tutorialspoint/unix/test.sh"
if [ -r $file ]
{ then
   echo "File has read access"
   echo "File has read access"
   echo "File has read access"
   
else
   echo "File does not have read access"
fi}
if [ -w $file ]
then
   echo "File has write permission"
else
   echo "File does not have write permission"
fi
if [ -x $file ]
then
   echo "File has execute permission"
else
   echo "File does not have execute permission"
fi
if [ -f $file ]
then
   echo "File is an ordinary file"
else
   echo "This is sepcial file"
fi
if [ -d $file ]
then
   echo "File is a directory"
else
   echo "This is not a directory"
fi
if [ -s $file ]
then
   echo "File size is zero"
else
   echo "File size is not zero"
fi
if [ -e $file ]
then
   echo "File exists"
else
   echo "File does not exist"
fi
运行结果：
File has read access
File has write permission
File has execute permission
File is an ordinary file
This is not a directory
File size is zero
File exists

文件测试运算符列表
操作符	 说明	 举例
-b file	 检测文件是否是块设备文件，如果是，则返回 true。	 [ -b $file ] 返回 false。
-c file	 检测文件是否是字符设备文件，如果是，则返回 true。	 [ -b $file ] 返回 false。
-d file	 检测文件是否是目录，如果是，则返回 true。	 [ -d $file ] 返回 false。
-f file	 检测文件是否是普通文件（既不是目录，也不是设备文件），如果是，则返回 true。	 [ -f $file ] 返回 true。
-g file	 检测文件是否设置了 SGID 位，如果是，则返回 true。	 [ -g $file ] 返回 false。
-k file	 检测文件是否设置了粘着位(Sticky Bit)，如果是，则返回 true。	 [ -k $file ] 返回 false。
-p file	 检测文件是否是具名管道，如果是，则返回 true。	 [ -p $file ] 返回 false。
-u file	 检测文件是否设置了 SUID 位，如果是，则返回 true。	 [ -u $file ] 返回 false。
-r file	 检测文件是否可读，如果是，则返回 true。	 [ -r $file ] 返回 true。
-w file	 检测文件是否可写，如果是，则返回 true。	 [ -w $file ] 返回 true。
-x file	 检测文件是否可执行，如果是，则返回 true。	 [ -x $file ] 返回 true。
-s file	 检测文件是否为空（文件大小是否大于0），不为空返回 true。	 [ -s $file ] 返回 true。
-e file	 检测文件（包括目录）是否存在，如果是，则返回 true。	 [ -e $file ] 返回 true。

-rw-rw-r--


-rwsrw-r--


  1 1 0
  
  6664

Shell if else语句


if 语句通过关系运算符判断表达式的真假来决定执行哪个分支。Shell 有三种 if ... else 语句：
if ... fi 语句；
if ... else ... fi 语句；
if ... elif ... else ... fi 语句。
1) if ... else 语句

if ... else 语句的语法：
if [ expression ]
#if test expression
then
   Statement(s) to be executed if expression is true
fi
如果 expression 返回 true，then 后边的语句将会被执行；如果返回 false，不会执行任何语句。

最后必须以 fi 来结尾闭合 if，fi 就是 if 倒过来拼写，后面也会遇见。

注意：expression 和方括号([ ])之间必须有空格，否则会有语法错误。

举个例子：
#!/bin/sh  12.sh
a=10 
b=20
if [ $a == $b ]
then
   echo "a is equal to b"
fi
if [ $a != $b ]
then
   echo "a is not equal to b"
fi
运行结果：
a is not equal to b
2) if ... else ... fi 语句

if ... else ... fi 语句的语法：
if [ expression ]
then
   Statement(s) to be executed if expression is true
else
   Statement(s) to be executed if expression is not true
fi
如果 expression 返回 true，那么 then 后边的语句将会被执行；否则，执行 else 后边的语句。

举个例子：
#!/bin/sh  13.sh
a=10
b=20
if [ $a == $b ]
then
   echo "a is equal to b"
else
   echo "a is not equal to b"
fi
执行结果：
a is not equal to b
3) if ... elif ... fi 语句 else if 

if ... elif ... fi 语句可以对多个条件进行判断，语法为：
if [ expression 1 ]
then
   Statement(s) to be executed if expression 1 is true
elif [ expression 2 ]
then
   Statement(s) to be executed if expression 2 is true
elif [ expression 3 ]
then
   Statement(s) to be executed if expression 3 is true
else
   Statement(s) to be executed if no expression is true
fi
哪一个 expression 的值为 true，就执行哪个 expression 后面的语句；如果都为 false，那么不执行任何语句。

举个例子：
#!/bin/sh  14.sh
a=10
b=20
if [ $a == $b ]
then
   echo "a is equal to b"
elif [ $a -gt $b ]
then
   echo "a is greater than b"
elif [ $a -lt $b ]
then
   echo "a is less than b"
else
   echo "None of the condition met"
fi
运行结果：
a is less than b

if ... else 语句也可以写成一行，以命令的方式来运行，像这样：
if test $[2*3] -eq $[1+5]; then echo 'The two numbers are equal!'; fi;

if ... else 语句也经常与 test 命令结合使用，如下所示：
num1=$[2*3]
num2=$[1+5]
num=expr 1 + 2
if test $[num1] -eq $[num2]
test ==  [  ]
if [ $[num1] -eq $[num2] ]
then
    echo 'The two numbers are equal!'
else
    echo 'The two numbers are not equal!'
fi
输出：
The two numbers are equal!
test 命令用于检查某个条件是否成立，与方括号([ ])类似。

Shell case esac语句 


case ... esac 与其他语言中的 switch ... case 语句类似，是一种多分枝选择结构。

case 语句匹配一个值或一个模式，如果匹配成功，执行相匹配的命令。case语句格式如下：
case 值 in
模式1)
    command1
    command2
    command3
    ;;
模式2）
    command1
    command2
    command3
    ;;
*)  default :
    command1
    command2
    command3
    ;;
esac
case工作方式如上所示。取值后面必须为关键字 in，每一模式必须以右括号结束。取值可以为变量或常数。匹配发现取值符合某一模式后，其间所有命令开始执行直至 ;;。;; 与其他语言中的 break 类似，意思是跳到整个 case 语句的最后。

取值将检测匹配的每一个模式。一旦模式匹配，则执行完匹配模式相应命令后不再继续其他模式。如果无一匹配模式，使用星号 * 捕获该值，再执行后面的命令。

下面的脚本提示输入1到4，与每一种模式进行匹配：
echo 'Input a number between 1 to 4'
echo 'Your number is:\c'
read aNum
case $aNum in
    1)  echo 'You select 1'
    ;;
    2)  echo 'You select 2'
    ;;
    3)  echo 'You select 3'
    ;;
    4)  echo 'You select 4'
    ;;
    *)  echo 'You do not select a number between 1 to 4'
    ;;
esac
输入不同的内容，会有不同的结果，例如：
Input a number between 1 to 4
Your number is:3
You select 3

再举一个例子：15.sh 2
#!/bin/bash
option="${1}"
case ${option} in
   -f) FILE="${2}"
      echo "File name is $FILE"
      ;;
   -d) DIR="${2}"
      echo "Dir name is $DIR"
      ;;
   *) 
      echo "`basename ${0}`:usage: [-f file] | [-d directory]"
      exit 1 # Command to come out of the program with status 1
      ;;
esac
运行结果：
$./test.sh
test.sh: usage: [ -f filename ] | [ -d directory ]
$ ./test.sh -f index.htm
$ vi test.sh
$ ./test.sh -f index.htm
File name is index.htm
$ ./test.sh -d unix
Dir name is unix
$


Shell for循环


与其他编程语言类似，Shell支持for循环。

for循环一般格式为：
for 变量 in 列表 	for(int i=0;i<10;i++)
do					for((int i=0;i<10;i++))
    command1
    command2
    ...
    commandN
done
列表是一组值（数字、字符串等）组成的序列，每个值通过空格分隔。每循环一次，就将列表中的下一个值赋给变量。

in 列表是可选的，如果不用它，for 循环使用命令行的位置参数。

例如，顺序输出当前列表中的数字：
for loop in 1 2 3 4 5   i=1;i<=5
do
    echo "The value is: $loop"
done
运行结果：
The value is: 1
The value is: 2
The value is: 3
The value is: 4
The value is: 5

顺序输出字符串中的字符：
for str in 'This is a string'
do
    echo $str
done
运行结果：
This is a string

显示主目录下以 .bash 开头的文件：
#!/bin/bash
for FILE in `ls -l`      #$HOME/.bash* 16.sh
do
   echo $FILE
done
运行结果：
/root/.bash_history
/root/.bash_logout
/root/.bash_profile
/root/.bashrc


Shell while循环


while循环用于不断执行一系列命令，也用于从输入文件中读取数据；命令通常为测试条件。其格式为：
while command
do
   Statement(s) to be executed if command is true
done
命令执行完毕，控制返回循环顶部，从头开始直至测试条件为假。

以下是一个基本的while循环，测试条件是：如果COUNTER小于5，那么返回 true。COUNTER从0开始，每次循环处理时，COUNTER加1。运行上述脚本，返回数字1到5，然后终止。
17.sh
COUNTER=0 
while [ $COUNTER -lt 5 ]
do
    COUNTER=`expr $COUNTER+1`
    echo $COUNTER
done
运行脚本，输出：
1
2
3
4
5

while循环可用于读取键盘信息。下面的例子中，输入信息被设置为变量FILM，按<Ctrl-D>结束循环。
echo 'type <CTRL-D> to terminate'
echo -n 'enter your most liked film: '
while read FILM
do
    echo "Yeah! great film the $FILM"
done
运行脚本，输出类似下面：
type <CTRL-D> to terminate
enter your most liked film: Sound of Music
Yeah! great film the Sound of Music



Shell until循环

until 循环执行一系列命令直至条件为 true 时停止。until 循环与 while 循环在处理方式上刚好相反。一般while循环优于until循环，但在某些时候，也只是极少数情况下，until 循环更加有用。

until 循环格式为：
until command
do
   Statement(s) to be executed until command is true
done
command 一般为条件表达式，如果返回值为 false，则继续执行循环体内的语句，否则跳出循环。

例如，使用 until 命令输出 0 ~ 9 的数字：
#!/bin/bash 18.sh
a=0
until [ ! $a -lt 10 ]
do
   echo $a
   a=`expr $a + 1`
done
运行结果：
0
1
2
3
4
5
6
7
8
9



Shell break和continue命令

在循环过程中，有时候需要在未达到循环结束条件时强制跳出循环，像大多数编程语言一样，Shell也使用 break 和 continue 来跳出循环。
break命令

break命令允许跳出所有循环（终止执行后面的所有循环）。

下面的例子中，脚本进入死循环直至用户输入数字大于5。要跳出这个循环，返回到shell提示符下，就要使用break命令。
#!/bin/bash
while :
do
    echo -n "Input a number between 1 to 5: "
    read aNum
    case $aNum in
        1|2|3|4|5) echo "Your number is $aNum!"
       ;; 
        *) echo "You do not select a number between 1 to 5, game is over!"
            break
        ;;
    esac
done
在嵌套循环中，break 命令后面还可以跟一个整数，表示跳出第几层循环。例如：
break n
表示跳出第 n 层循环。

下面是一个嵌套循环的例子，如果 var1 等于 2，并且 var2 等于 0，就跳出循环：
#!/bin/bash 19.sh
for var1 in 1 2 3
do
   for var2 in 0 5
   do
      if [ $var1 -eq 2 -a $var2 -eq 0 ]
      then
         break 2
      else
         echo "$var1 $var2"
      fi
   done
done
如上，break 2 表示直接跳出外层循环。运行结果：
1 0
1 5
continue命令

continue命令与break命令类似，只有一点差别，它不会跳出所有循环，仅仅跳出当前循环。

对上面的例子进行修改：
#!/bin/bash
while :
do
    echo -n "Input a number between 1 to 5: "
    read aNum
    case $aNum in
        1|2|3|4|5) echo "Your number is $aNum!"
        ;;
        *) echo "You do not select a number between 1 to 5!"
            continue
            echo "Game is over!"
        ;;
    esac
done
运行代码发现，当输入大于5的数字时，该例中的循环不会结束，语句
echo "Game is over!"
永远不会被执行。

//#同样，continue 后面也可以跟一个数字，表示跳出第几层循环。

再看一个 continue 的例子：
#!/bin/bash 20.sh
NUMS="1 2 3 4 5 6 7"
for NUM in $NUMS
do
   Q=`expr $NUM % 2`
   if [ $Q -eq 0 ]
   then
      echo "Number is an even number!!"
      continue
   fi
   echo "Found odd number"
done
运行结果：
Found odd number
Number is an even number!!
Found odd number
Number is an even number!!
Found odd number
Number is an even number!!
Found odd number



Shell函数

函数可以让我们将一个复杂功能划分成若干模块，让程序结构更加清晰，代码重复利用率更高。像其他编程语言一样，Shell 也支持函数。Shell 函数必须先定义后使用。

Shell 函数的定义格式如下：
function_name () 
{
    list of commands
    [ return value ]
}

$?
如果你愿意，也可以在函数名前加上关键字 function：
function function_name () {
    list of commands
    [ return value ]
}
函数返回值，可以显式增加return语句；如果不加，会将最后一条命令运行结果作为返回值。

Shell 函数返回值只能是整数，一般用来表示函数执行成功与否，0表示成功，其他值表示失败。如果 return 其他数据，比如一个字符串，往往会得到错误提示：“numeric argument required”。255  32

如果一定要让函数返回字符串，那么可以先定义一个变量，用来接收函数的计算结果，脚本在需要的时候访问这个变量来获得函数返回值。


#!/bin/bash
# Define your function here
Hello () 
{
   echo "this is my function..."
}
# Invoke your function
Hello
运行结果：
$./test.sh
Hello World
$
调用函数只需要给出函数名，不需要加括号。

再来看一个带有return语句的函数：
#!/bin/bash  21.sh
funWithReturn()
{
    echo "The function is to get the sum of two numbers..."
    echo -n "Input first number: "
    read aNum
    echo -n "Input another number: "
    read anotherNum
    echo "The two numbers are $aNum and $anotherNum !"
    return $(($aNum+$anotherNum))
}
funWithReturn 
# Capture value returnd by last command
ret=$?
echo "The sum of two numbers is $ret !"
运行结果：
The function is to get the sum of two numbers...
Input first number: 25
Input another number: 50
The two numbers are 25 and 50 !
The sum of two numbers is 75 !
函数返回值在调用该函数后通过 $? 来获得。


再来看一个函数嵌套的例子：
#!/bin/bash
# Calling one function from another
number_one () 
{
   echo "my func ,number1"
   number_two
}
number_two () 
{
   echo "my func ,number2"
}
number_one
运行结果：
my func ,number1
my func ,number2
像删除变量一样，删除函数也可以使用 unset 命令，不过要加上 .f 选项，如下所示：
$unset .f function_name
如果你希望直接从终端调用函数，可以将函数定义在主目录下的 .profile 文件，这样每次登录后，在命令提示符后面输入函数名字就可以立即调用。

Shell函数参数
在Shell中，调用函数时可以向其传递参数。在函数体内部，通过 $n 的形式来获取参数的值，例如，$1表示第一个参数，$2表示第二个参数...

带参数的函数示例：
#!/bin/bash   22.sh
funWithParam(){
    echo "The value of the first parameter is $1 !"
    echo "The value of the second parameter is $2 !"
    echo "The value of the tenth parameter is $10 !"
    echo "The value of the tenth parameter is ${10} !"
    echo "The value of the eleventh parameter is ${11} !"
    echo "The amount of the parameters is $# !"  # 参数个数
    echo "The string of the parameters is $* !"  # 传递给函数的所有参数
}
funWithParam 1 2 3 4 5 6 7 8 9 34 73
fun(1,2,3,4,5,6...)
运行脚本：
The value of the first parameter is 1 !
The value of the second parameter is 2 !
The value of the tenth parameter is 10 !
The value of the tenth parameter is 34 !
The value of the eleventh parameter is 73 !
The amount of the parameters is 12 !
The string of the parameters is 1 2 3 4 5 6 7 8 9 34 73 !"
注意，$10 不能获取第十个参数，获取第十个参数需要${10}。当n>=10时，需要使用${n}来获取参数。






