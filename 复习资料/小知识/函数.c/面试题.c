


预处理器（Preprocessor）

1. 用预处理指令#define 声明一个常数，用以表明1年中有多少秒（忽略闰年问题）

#define SECONDS_PER_YEAR (60 * 60 * 24 * 365)UL

我在这想看到几件事情：

1). #define 语法的基本知识（例如：不能以分号结束，括号的使用，等等）

2). 懂得预处理器将为你计算常数表达式的值，因此，直接写出你是如何计算一年中有多少秒而不是计算出实际的值，是更清晰而没有代价的。

3). 意识到这个表达式将使一个16位机的整型数溢出-因此要用到长整型符号L,告诉编译器这个常数是的长整型数。

4). 如果你在你的表达式中用到UL（表示无符号长整型），那么你有了一个好的起点。记住，第一印象很重要。


2. 写一个“标准”宏MIN，这个宏输入两个参数并返回较小的一个。

#define MIN(A,B) ((A) <= (B) ? (A) : (B))

这个测试是为下面的目的而设的：

1). 标识#define在宏中应用的基本知识。这是很重要的，因为直到嵌入(inline)操作符变为标准C的一部分，宏是方便产生嵌入代码的唯一方法，对于嵌入式系统来说，为了能达到要求的性能，嵌入代码经常是必须的方法。

2). 三重条件操作符的知识。这个操作符存在C语言中的原因是它使得编译器能产生比if-then-else更优化的代码，了解这个用法是很重要的。

3). 懂得在宏中小心地把参数用括号括起来

4). 我也用这个问题开始讨论宏的副作用，例如：当你写下面的代码时会发生什么事？least = MIN(*p++, b);


3. 预处理器标识#error的目的是什么？

如果你不知道答案，请看参考文献1。这问题对区分一个正常的伙计和一个书呆子是很有用的。只有书呆子才会读C语言课本的附录去找出象这种

问题的答案。当然如果你不是在找一个书呆子，那么应试者最好希望自己不要知道答案。


死循环（Infinite loops）

4. 嵌入式系统中经常要用到无限循环，你怎么样用C编写死循环呢？

这个问题用几个解决方案。我首选的方案是：

while(1) { }

一些程序员更喜欢如下方案：

for(;;) { }

这个实现方式让我为难，因为这个语法没有确切表达到底怎么回事。如果一个应试者给出这个作为方案，我将用这个作为一个机会去探究他们这样做的

基本原理。如果他们的基本答案是：“我被教着这样做，但从没有想到过为什么。”这会给我留下一个坏印象。

第三个方案是用 goto

Loop:

...

goto Loop;

应试者如给出上面的方案，这说明或者他是一个汇编语言程序员（这也许是好事）或者他是一个想进入新领域的BASIC/FORTRAN程序员。


数据声明（Data declarations）

5. 用变量a给出下面的定义

a) 一个整型数（An integer）

b) 一个指向整型数的指针（A pointer to an integer）

c) 一个指向指针的的指针，它指向的指针是指向一个整型数（A pointer to a pointer to an integer）

d) 一个有10个整型数的数组（An array of 10 integers）

e) 一个有10个指针的数组，该指针是指向一个整型数的（An array of 10 pointers to integers）

f) 一个指向有10个整型数数组的指针（A pointer to an array of 10 integers）

g) 一个指向函数的指针，该函数有一个整型参数并返回一个整型数（A pointer to a function that takes an integer as an argument and returns an integer）

h) 一个有10个指针的数组，该指针指向一个函数，该函数有一个整型参数并返回一个整型数（ An array of ten pointers to functions that take an integer argument and return an integer ）

答案是：

a) int a; // An integer

b) int *a; // A pointer to an integer

c) int **a; // A pointer to a pointer to an integer

d) int a[10]; // An array of 10 integers

e) int *a[10]; // An array of 10 pointers to integers

f) int (*a)[10]; // A pointer to an array of 10 integers

g) int (*a)(int); // A pointer to a function a that takes an integer argument and returns an integer

h) int (*a[10])(int); // An array of 10 pointers to functions that take an integer argument and return an integer

人们经常声称这里有几个问题是那种要翻一下书才能回答的问题，我同意这种说法。当我写这篇文章时，为了确定语法的正确性，我的确查了一下书。

但是当我被面试的时候，我期望被问到这个问题（或者相近的问题）。因为在被面试的这段时间里，我确定我知道这个问题的答案。应试者如果不知道

所有的答案（或至少大部分答案），那么也就没有为这次面试做准备，如果该面试者没有为这次面试做准备，那么他又能为什么出准备呢？


Static

6. 关键字static的作用是什么？

这个简单的问题很少有人能回答完全。在C语言中，关键字static有三个明显的作用：

1). 在函数体，一个被声明为静态的变量在这一函数被调用过程中维持其值不变。

2). 在模块内（但在函数体外），一个被声明为静态的变量可以被模块内所用函数访问，但不能被模块外其它函数访问。它是一个本地的全局变量。

3). 在模块内，一个被声明为静态的函数只可被这一模块内的其它函数调用。那就是，这个函数被限制在声明它的模块的本地范围内使用。

大多数应试者能正确回答第一部分，一部分能正确回答第二部分，同是很少的人能懂得第三部分。这是一个应试者的严重的缺点，因为他显然不懂得本地化数据和代码范围的好处和重要性。


Const

7．关键字const是什么含意？

我只要一听到被面试者说：“const意味着常数”，我就知道我正在和一个业余者打交道。去年Dan Saks已经在他的文章里完全概括了const的所有用法，因此ESP(译者：Embedded Systems Programming)的每一位读者应该非常熟悉const能做什么和不能做什么.

如果你从没有读到那篇文章，只要能说出const意味着“只读”就可以了。尽管这个答案不是完全的答案，但我接受它作为一个正确的答案。（如果你想知道更详细的答案，仔细读一下Saks的文章吧。）如果应试者能正确回答这个问题，我将问他一个附加的问题：下面的声明都是什么意思？

const int a;

int const a;

const int *a;

int * const a;

int const * a const;

前两个的作用是一样，a是一个常整型数。第三个意味着a是一个指向常整型数的指针（也就是，整型数是不可修改的，但指针可以）。第四个意思a是一个指向整型数的常指针（也就是说，指针指向的整型数是可以修改的，但指针是不可修改的）。最后一个意味着a是一个指向常整型数的常指针（也就是说，指针指向的整型数是不可修改的，同时指针也是不可修改的）。如果应试者能正确回答这些问题，那么他就给我留下了一个好印象。顺带提一句，也许你可能会问，即使不用关键字 const，也还是能很容易写出功能正确的程序，那么我为什么还要如此看重关键字const呢？我也如下的几下理由：

1). 关键字const的作用是为给读你代码的人传达非常有用的信息，实际上，声明一个参数为常量是为了告诉了用户这个参数的应用目的。如果你曾花很多时间清理其它人留下的垃圾，你就会很快学会感谢这点多余的信息。（当然，懂得用const的程序员很少会留下的垃圾让别人来清理的。）

2). 通过给优化器一些附加的信息，使用关键字const也许能产生更紧凑的代码。

3). 合理地使用关键字const可以使编译器很自然地保护那些不希望被改变的参数，防止其被无意的代码修改。简而言之，这样可以减少bug的出现。


Volatile

8. 关键字volatile有什么含意 并给出三个不同的例子。

一个定义为volatile的变量是说这变量可能会被意想不到地改变，这样，编译器就不会去假设这个变量的值了。精确地说就是，优化器在用到这个变量时必须每次都小心地重新读取这个变量的值，而不是使用保存在寄存器里的备份。下面是volatile变量的几个例子：

1). 并行设备的硬件寄存器（如：状态寄存器）

2). 一个中断服务子程序中会访问到的非自动变量(Non-automatic variables)

3). 多线程应用中被几个任务共享的变量

回答不出这个问题的人是不会被雇佣的。我认为这是区分C程序员和嵌入式系统程序员的最基本的问题。嵌入式系统程序员经常同硬件、中断、RTOS等等打交道，所用这些都要求volatile变量。不懂得volatile内容将会带来灾难。

假设被面试者正确地回答了这是问题（嗯，怀疑这否会是这样），我将稍微深究一下，看一下这家伙是不是直正懂得volatile完全的重要性。

1). 一个参数既可以是const还可以是volatile吗？解释为什么。

2). 一个指针可以是volatile 吗？解释为什么。

3). 下面的函数有什么错误：

int square(volatile int *ptr)

{ 

     return *ptr * *ptr;

} 


下面是答案：

1). 是的。一个例子是只读的状态寄存器。它是volatile因为它可能被意想不到地改变。它是const因为程序不应该试图去修改它。

2). 是的。尽管这并不很常见。一个例子是当一个中服务子程序修该一个指向一个buffer的指针时。

3). 这段代码的有个恶作剧。这段代码的目的是用来返指针*ptr指向值的平方，但是，由于*ptr指向一个volatile型参数，编译器将产生类似下面的代码：

int square(volatile int *ptr)

{ 

     int a,b;

     a = *ptr;

     b = *ptr;

     return a * b;

} 

由于*ptr的值可能被意想不到地该变，因此a和b可能是不同的。结果，这段代码可能返不是你所期望的平方值！正确的代码如下：

long square(volatile int *ptr)

{ 

    int a;

    a = *ptr;

    return a * a;

}


位操作（Bit manipulation）

9. 嵌入式系统总是要用户对变量或寄存器进行位操作。给定一个整型变量a，写两段代码，第一个设置a的bit 3，第二个清除a 的bit 3。在以上两个操作中，要保持其它位不变。

对这个问题有三种基本的反应

1). 不知道如何下手。该被面者从没做过任何嵌入式系统的工作。

2). 用bit fields。Bit fields是被扔到C语言死角的东西，它保证你的代码在不同编译器之间是不可移植的，同时也保证了的你的代码是不可重用的。我最近不幸看到 Infineon为其较复杂的通信芯片写的驱动程序，它用到了bit fields因此完全对我无用，因为我的编译器用其它的方式来实现bit fields的。从道德讲：永远不要让一个非嵌入式的家伙粘实际硬件的边。

3). 用 #defines 和 bit masks 操作。这是一个有极高可移植性的方法，是应该被用到的方法。最佳的解决方案如下：

#define BIT3 (0x1<<3)

static int a;

void set_bit3(void)

{ 

   a |= BIT3;

} 

void clear_bit3(void)

{ 

   a &= ~BIT3;

} 

一些人喜欢为设置和清除值而定义一个掩码同时定义一些说明常数，这也是可以接受的。我希望看到几个要点：说明常数、|=和&=~操作。



10. 嵌入式系统经常具有要求程序员去访问某特定的内存位置的特点。在某工程中，要求设置一绝对地址为0x67a9的整型变量的值为0xaa66。编译器是一个纯粹的ANSI编译器。写代码去完成这一任务。

这一问题测试你是否知道为了访问一绝对地址把一个整型数强制转换（typecast）为一指针是合法的。这一问题的实现方式随着个人风格不同而不同。典型的类似代码如下：

int *ptr;

ptr = (int *)0x67a9;

*ptr = 0xaa55;

一个较晦涩的方法是：

*(int * const)(0x67a9) = 0xaa55;

即使你的品味更接近第二种方案，但我建议你在面试时使用第一种方案。


中断（Interrupts）

11. 中断是嵌入式系统中重要的组成部分，这导致了很多编译开发商提供一种扩展—让标准C支持中断。具代表事实是，产生了一个新的关键字 __interrupt。下面的代码就使用了__interrupt关键字去定义了一个中断服务子程序(ISR)，请评论一下这段代码的。

__interrupt double compute_area (double radius)

{ 

   double area = PI * radius * radius;

   printf(" Area = %f", area);

   return area;

}

这个函数有太多的错误了，以至让人不知从何说起了：

1). ISR 不能返回一个值。如果你不懂这个，那么你不会被雇用的。

2). ISR 不能传递参数。如果你没有看到这一点，你被雇用的机会等同第一项。

3). 在许多的处理器/编译器中，浮点一般都是不可重入的。有些处理器/编译器需要让额处的寄存器入栈，有些处理器/编译器就是不允许在ISR中做浮点运算。此外，ISR应该是短而有效率的，在ISR中做浮点运算是不明智的。

4). 与第三点一脉相承，printf()经常有重入和性能上的问题。如果你丢掉了第三和第四点，我不会太为难你的。不用说，如果你能得到后两点，那么你的被雇用前景越来越光明了。


代码例子（Code examples）

12 . 下面的代码输出是什么，为什么？

void foo(void)

{ 

   unsigned int a = 6;

   int b = -20;

   (a+b > 6)? puts(“> 6″) : puts(“<= 6");

}

这个问题测试你是否懂得C语言中的整数自动转换原则，我发现有些开发者懂得极少这些东西。不管如何，这无符号整型问题的答案是输出是“>6”。原因是当表达式中存在有符号类型和无符号类型时所有的操作数都自动转换为无符号类型。因此-20变成了一个非常大的正整数，所以该表达式计算出的结果大于6。这一点对于应当频繁用到无符号数据类型的嵌入式系统来说是丰常重要的。如果你答错了这个问题，你也就到了得不到这份工作的边缘。


13. 评价下面的代码片断：

unsigned int zero = 0;

unsigned int compzero = 0xFFFF;

/*1′s complement of zero */

对于一个int型不是16位的处理器为说，上面的代码是不正确的。应编写如下：

unsigned int compzero = ~0;

这一问题真正能揭露出应试者是否懂得处理器字长的重要性。在我的经验里，好的嵌入式程序员非常准确地明白硬件的细节和它的局限，然而PC机程序往往把硬件作为一个无法避免的烦恼。

到了这个阶段，应试者或者完全垂头丧气了或者信心满满志在必得。如果显然应试者不是很好，那么这个测试就在这里结束了。但如果显然应试者做得不错，那么我就扔出下面的追加问题，这些问题是比较难的，我想仅仅非常优秀的应试者能做得不错。提出这些问题，我希望更多看到应试者应付问题的方法，而不是答案。不管如何，你就当是这个娱乐吧…


动态内存分配（Dynamic memory allocation）

14. 尽管不像非嵌入式计算机那么常见，嵌入式系统还是有从堆（heap）中动态分配内存的过程的。那么嵌入式系统中，动态分配内存可能发生的问题是什么？

这里，我期望应试者能提到内存碎片，碎片收集的问题，变量的持行时间等等。这个主题已经在ESP杂志中被广泛地讨论过了（主要是 P.J. Plauger, 他的解释远远超过我这里能提到的任何解释），所有回过头看一下这些杂志吧！让应试者进入一种虚假的安全感觉后，我拿出这么一个小节目：下面的代码片段的输出是什么，为什么？

char *ptr;

if ((ptr = (char *)malloc(0)) == NULL)

   puts(“Got a null pointer”);

else

   puts(“Got a valid pointer”);


这是一个有趣的问题。最近在我的一个同事不经意把0值传给了函数malloc，得到了一个合法的指针之后，我才想到这个问题。这就是上面的代码，该代码的输出是“Got a valid pointer”。我用这个来开始讨论这样的一问题，看看被面试者是否想到库例程这样做是正确。得到正确的答案固然重要，但解决问题的方法和你做决定的基本原理更重要些。


Typedef

15. Typedef 在C语言中频繁用以声明一个已经存在的数据类型的同义字。也可以用预处理器做类似的事。例如，思考一下下面的例子：

#define dPS struct s *

typedef struct s * tPS;

以上两种情况的意图都是要定义dPS 和 tPS 作为一个指向结构s指针。哪种方法更好呢？（如果有的话）为什么？

这是一个非常微妙的问题，任何人答对这个问题（正当的原因）是应当被恭喜的。答案是：typedef更好。思考下面的例子：

dPS p1,p2;

tPS p3,p4;

第一个扩展为

struct s * p1, p2;

上面的代码定义p1为一个指向结构的指，p2为一个实际的结构，这也许不是你想要的。第二个例子正确地定义了p3 和p4 两个指针。


晦涩的语法

16. C语言同意一些令人震惊的结构,下面的结构是合法的吗，如果是它做些什么？

int a = 5, b = 7, c;

c = a+++b;

这个问题将做为这个测验的一个愉快的结尾。不管你相不相信，上面的例子是完全合乎语法的。问题是编译器如何处理它？水平不高的编译作者实际上会争论这个问题，根据最处理原则，编译器应当能处理尽可能所有合法的用法。因此，上面的代码被处理成：

c = a++ + b;

因此, 这段代码持行后a = 6, b = 7, c = 12。

如果你知道答案，或猜出正确答案，做得好。如果你不知道答案，我也不把这个当作问题。我发现这个问题的最大好处是:这是一个关于代码编写风格，代码的可读性，代码的可修改性的好的话题


What will print out?

main()

{ 

   char *p1=“name”;

   char *p2;

   p2=(char*)malloc(20);

   memset (p2, 0, 20);

   while(*p2++ = *p1++);

   printf(“%s\n”,p2);

}

Answer:empty string.


What will be printed as the result of the operation below:

main()

{

   int x = 20, y = 35;

   x = y++ + x++; 

   y = ++y + ++x; 

   printf("%d%d\n", x, y);

}

Answer : 5794


What will be printed as the result of the operation below:

main()

{

   int x = 5;

   printf("%d,%d,%d\n", x, x << 2, x >> 2);

}

Answer: 5,20,1


What will be printed as the result of the operation below:

#define swap(a,b) a=a+b;b=a-b;a=a-b;

void main()

{

   int x = 5, y = 10;

   swap(x, y); // 15 5 10

   printf("%d %d\n", x, y);

   swap2(x, y);

   printf("%d %d\n", x, y);

}

int swap2(int a, int b)

{

   int temp;

   temp = a;

   b = a;

   a = temp;

   return 0;

}

Answer: 10, 5

10, 5


What will be printed as the result of the operation below:

main()

{

     char *ptr = "Cisco Systems";

      *ptr++;

      printf("%s\n",ptr);

      ptr++;

      printf("%s\n", ptr);

}

Answer:Cisco Systems

isco systems


What will be printed as the result of the operation below:

main()

{

      char s1[] = "Cisco";

      char s2[] = "systems";

      printf("%s", s1);

}

Answer: Cisco


What will be printed as the result of the operation below:

main()

{

      char *p1;

      char *p2;

      p1 = (char *) malloc(25);

      p2  = (char *) malloc(25);

      strcpy(p1, "Cisco");

      strcpy(p2, "systems");

      strcat(p1, p2);

      printf("%s", p1);

}

Answer: Ciscosystems


The following variable is available in file1.c, who can access it?:

static int average;

Answer: all the functions in the file1.c can access the variable.

WHat will be the result of the following code?

#define TRUE 0 // some code

while(TRUE)

{

     // some code

}

Answer: This will not go into the loop as TRUE is defined as 0.

What will be printed as the result of the operation below:


int x;

int modifyvalue()

{

      return (x += 10);

}

int changevalue(int x)

{

      return (x += 1);

}

void main()

{

      int x = 10;

      x++;

      changevalue(x);

      x++;

      modifyvalue();

      printf("First output:%d\n", x);

      x++;

      changevalue(x);

      printf("Second output:%d\n", x);

      modifyvalue();

      printf("Third output:%d\n", x);

}

Answer: 12 , 13 , 13

What will be printed as the result of the operation below:

main()

{

      int x = 10, y = 15;

      x = x++;

      y = ++y;

      printf("%d %d\n", x, y);

}

Answer: 11, 16


What will be printed as the result of the operation below:

main()

{

      int a = 0;

      if (a == 0)

       printf("Cisco Systems\n");

      printf("Cisco Systems\n");

}

Answer: Two lines with “Cisco Systems” will be printed.


再次更新C++相关题集

1. 以下三条输出语句分别输出什么？[C易]

char str1[] = "abc";

char str2[] = "abc";

const char str3[] = "abc";

const char str4[] = "abc";

const char* str5 = "abc";

const char* str6 = "abc";

cout << boolalpha << ( str1==str2 ) << endl; // 输出什么？

cout << boolalpha << ( str3==str4 ) << endl; // 输出什么？

cout << boolalpha << ( str5==str6 ) << endl; // 输出什么？


13. 非C++内建型别 A 和 B，在哪几种情况下B能隐式转化为A？[C++中等]

答：

a. class B : public A { ……} // B公有继承自A，可以是间接继承的

b. class B { operator A( ); } // B实现了隐式转化为A的转化

c. class A { A( const B& ); } // A实现了non-explicit的参数为B（可以有其他带默认值的参数）构造函数

d. A& operator= ( const A& ); // 赋值操作，虽不是正宗的隐式类型转换，但也可以勉强算一个


12. 以下代码中的两个sizeof用法有问题吗？[C易]

void UpperCase(char str[]) // 将 str 中的小写字母转换成大写字母

{

      for (size_t i = 0; str[i] != '\0'; i++)

       if ('a' <= str[i] && str[i] <= 'z')

        str[i] -= ('a' - 'A');

}


int main()

{

      char str[] = "aBcDe";

      cout << "str字符长度为: " << sizeof(str) / sizeof(str[0]) << endl;

      UpperCase(str);

      cout << str << endl;

}




7. 以下代码有什么问题？[C难]

void char2Hex(char c) // 将字符以16进制表示

{

      char ch = c / 0x10 + '0';

      if (ch > '9')

       ch += ('A' - '9' - 1);

      char cl = c % 0x10 + '0';

      if (cl > '9')

       cl += ('A' - '9' - 1);

      cout << ch << cl << ' ';

}

int main(void)

{

      char str[] = "I love 中国";

      for (size_t i = 0; str[i] != '\0'; i++)

       char2Hex(str[i]);

      cout << endl;

}


4. 以下代码有什么问题？[C++易]

struct Test

{

      Test(int)     

      {

      }

      Test()

      {

      }

      void fun()

      {

      }

};

int main(void)

{

      Test a(1);

      a.fun();

       Test b();

      b.fun();


      return 0;

}

5. 以下代码有什么问题？[C++易]

cout << (true?1:"1") << endl;

8. 以下代码能够编译通过吗，为什么？[C++易]

int main()

{

      unsigned int const size1 = 2;

      char str1[size1];

      unsigned int temp = 0;

      cin >> temp;

      unsigned int const size2 = temp;

      char str2[size2];

}


9. 以下代码中的输出语句输出0吗，为什么？[C++易]

struct CLS

{

      int m_i;

      CLS(int i) :

        m_i(i)

      {

      }

      CLS()

      {

            CLS(0);

      }

};

int main(void)

{

      CLS obj;

      cout << obj.m_i << endl;

      return 0;

}


10. C++中的空类，默认产生哪些类成员函数？[C++易]

答：

class Empty

{ 
public:

     Empty(); // 缺省构造函数

     Empty( const Empty& ); // 拷贝构造函数

     ~Empty(); // 析构函数

     Empty& operator=( const Empty& ); // 赋值运算符

     Empty* operator&(); // 取址运算符

     const Empty* operator&() const; // 取址运算符 const

};

3. 以下两条输出语句分别输出什么？[C++难]

float a = 1.0f;

cout << (int)a << endl;

cout << (int&)a << endl;

cout << boolalpha << ( (int)a == (int&)a ) << endl; // 输出什么？

float b = 0.0f;

cout << (int)b << endl;

cout << (int&)b << endl;

cout << boolalpha << ( (int)b == (int&)b ) << endl; // 输出什么？

2. 以下反向遍历array数组的方法有什么错误？[STL易]

vector array;

array.push_back( 1 );

array.push_back( 2 );

array.push_back( 3 );

for( vector::size_type i=array.size()-1; i>=0; –i ) // 反向遍历array数组

{ 

      cout << array[i] << endl;

}

6. 以下代码有什么问题？[STL易]

typedef vector IntArray;

IntArray array;

array.push_back( 1 );

array.push_back( 2 );

array.push_back( 2 );

array.push_back( 3 );

// 删除array数组中所有的2

for( IntArray::iterator itor=array.begin(); itor!=array.end(); ++itor )

{ 

      if( 2 == *itor ) array.erase( itor );

}

11. 写一个函数，完成内存之间的拷贝。[考虑问题是否全面]

答：

void memcpy(char *dst, char *src, int count)

{

      while(count--)

       *dst++ = *src++;

}


void* mymemcpy(void* dest, const void* src, size_t count)

{

      char* d = (char*) dest;

      const char* s = (const char*) src;

      //   int n = (count + 7) / 8; // count > 0 assumed

      int n = count >> 3;

      switch (count & 7)

      {

      do

      {

                 *d++ = *s++;

       case 7:

            *d++ = *s++;

       case 6:

            *d++ = *s++;

       case 5:

            *d++ = *s++;

       case 4:

            *d++ = *s++;

       case 3:

            *d++ = *s++;

       case 2:

            *d++ = *s++;

       case 1:

            *d++ = *s++;

     // case 0 } while (--n > 0);

      } while (n-- > 0);

      }


      return dest;

}


int main(void)

{

      char str[] = "0123456789";

      mymemcpy(str + 1, str + 0, 9);

      cout << str << endl;


     //system("Pause");

      return 0;

}

