87.排序算法和查找算法时间复杂度
	排序：
		冒泡：O(N^2)
		选择：O(N^2)
		快排：O(nlog(n)) 
		插入：O(N^2)	
	查找：
		顺序：O(N)，条件是有序或者无序
		二分：O(logn)，条件是有序数组
		分块：O(logn) ，条件是有序或者无序	
	链表排序算法：
		冒泡：
		选择：
		插入：
		快排：	
		
		

7.快排算法思想和实现
	思想：快速排序使用分治的思想，通过一趟排序将待排序列分割成两部分，其中一部分记录的关键字均比另一部分记录的关键字小。
		之后分别对这两部分记录进行递归排序，以达到整个序列有序的目的。
	实现原理：①首先设定一个分界值，这里我一般取数组第一个值，通过该分界值将数组分成左右两部分
		 ②从后往前遍历数组，将最后的值与基准值比较，如果大于基准值，若小于基准值，
		 ③从前往后遍历数组
int find_pos(int *arr,int low,int high)
{
    int val = arr[0];
    while(low < high)
    {
		while(low<high &&arr[high] >= val)
	        high--;
		arr[low] = arr[high];
		while(low < high &&arr[low] <= val)
	        low++;
		arr[high] = arr[low];
    }
    arr[low] = val;
    return low;
}
void quick_sort(int *arr,int high,int low)
{
    if(low >= high)
		return ;
    int pos;
    if(low < high)
    {
		pos = find_pos(arr,low,high);
		quick_sort(arr,low,pos-1);
		quick_sort(arr,pos+1,high);
    }
}	
	

10.双向链表的逆序
	typedef struct node
               {
            	       ElemType data;
                       struct node *prior
                       struct node *next;
        	}list;
	①不带头节点
		list* reverselist(list *head)
		{		
		        if(head == NULL || head->next == NULL)   //head->next为空，说明只有一个节点
			return head;
		        list *p1= head,*p2 = p1->next,p3=NULL;
		        p1->next = NULL;
		        
		        while(p2 != NULL)
		        {
			p3 = p2->next;     //保存当前节点的下一个节点
			p2->next = p1;     //改变当前节点的next，指向它的前一个节点
			p1->prior = p2;    //改变前一个节点的prior，指向它的下一个节点
			p1 = p2;               //指针移到下一个节点
			p2 = p3; 
		        }
		        head = p1;
		        return head;
		}
	②带头节点
		list *reverselist(list *head)
		{
		            if(head == NULL || head->next == NULL)    //head为空，则是链表不存在，head->next为空，说明链表为空
			return head;
		           list *p1= head->next,*p2 = p1->next,p3=NULL;
		           p1->next = NULL;  
		           while(p2 != NULL)
		           {
			p3 = p2->next;
			p2->next = p1;
			p1->prior=p2;
			p1=p2;
			p2=p3;
		            }             
		            head->next = p1;      //恢复头节点
		            p1->prior->head;
		}
11.二分法
	①在有序数组(有小到大)中查找指定元素
	int search(int *arr,int target,int len)
	{
	      int mid = 0,first = 0,last =len-1;
	      while(first <= last)
	      {
		mid  = (first+last)/2;
	   	if(arr[mid] > target)
		       last = mid -1;
		if(arr[mid] < target)
		       first = mid+1;
		else 
		       retrun mid;
	      }
	      return -1;
	}
	
17.写一个算法，一个数组得到两个最大数(不用排序)
	int main()
	{
	      int a[10];
	      int i,j;
    	      printf("请输入数组元素:");
	     for(i=0;i<10;++i)
		scanf("%d",&a[i]);
	     int max1 = a[0];
	     int max2 = a[0];
	     for(i = 0; i< 10; ++i)
	     {
		if(max1 <a[i])
		    max1 = a[i];
	     }
	     for(j=0;j<10;++j)
	    {
		if(a[j] > max2 && a[j] < max1)
		       max2 = a[j];
	     }
	     printf("max1 = %d,aecondmax = %d\n",max1,max2);
	     return 0;
	}
	
19.写一个链表中找最小值
	LinkList select_Min(LinkList L)
	{
	       assert(L->next == NULL)   //判断链表是否为空
		retrun NULL;
	       LinkList *p,*minP;
	       p = L->next;
	       minP = p;
	       while(p != NULL)
	       {
		if(minP->data > p->data)
		       minP = p;
		p=p->next;
	       }
	       return minP;    
	}
20.写一个程序从2000年到现在有多少天
	int  count_day(int year)
	{
	      int sum = 0;
	      int day;
	      for(i = 2000; i < year; ++i)
	      {
		if((i%4 ==0 && i %100 != 0) || (i %400 == 0) )
		       day = 365;
		else
	  	       day = 366;
	      }
	      sum += day;
	      retrurn sum;
	}
	
25.memmove程序思想
	strncpy考虑内存重叠的实现（使用strncpy时，最好手动添加‘\0’在结尾）
	char *my_strncpy(void *dst, const void *src,int len)
	{
	        assert(src!= NULL && dst != NULL);
	        char *res = (char *)dst;
	        int offset = 0;
	        char *tmp = NULL;
	        if(strlen(src) < len)       //src 小于len
	       {
		offset = len - strlen(src);
		len = strlen(src);
                       }
	       if(dst >= src && dst <=(src +len-1))
	       {
		dst = dst +len -1;
	 	src= src+ len -1;
		tmp = dst + 1;              是否要加1
		while(len--)
		{
		        *dst-- = *src--;
		}
 	       }
	       else
	       {
		while (len--)
		       *dst++ = *src ++;
		tmp = dst;
	       }
	       while(offset--)
	       {
		*tmp++ = '\0';
	       }
	       return res;
	}
	memcpy：没有考虑内存重叠问题
	memmove：内存重叠时仍然可以正常执行
	void *my_memmove(void *dest,const void *src,size_t n)
	{
	     assert(dest != NULL && src != NULL)；
	     char *p_dest = (char *)dest;
	     const char *p_dest = (const char *)dest;
	     int i = 0;
	     if(p_dst <= p_src || p_dst >= (p_src + n))      //不重叠，从后向前拷贝
	     {
		while(n--)
		{
		       *p_dst ++ = * p_src ++;
		}	
	     }
	     else     //重叠，从后向前拷贝
	     {
		p_dst = (char *)dst +n -1;
		p_src = (char *)src + n - 1;
		while(n--)
		{
		       *p_dst -- = *p_src -- ;
		}
	     }
	     return dest;
	}
	
26.二叉树遍历
	
	
17.单链表的排序
	选择排序法
	void link_order(LinkNode *pHeader)     有头节点
	{
		if(pHeader == NULL)
			return ;
		if(pHeader->next == NULL)
		{	
			pritnf("空链表\n");
			return;
		}
		LinkNode *p=NULL,*r = NULL;
		int len = length_link(pHeader);
		for(i=0,p=pheader->next;i<len-1;i++,p=p->next)
		{
			for(j=i+1,r=p->next;j<len;++j,r=r->next)
			{
				if(p>data > r->data)
				{
					int temp = p->data;
					p->.data = r->data;
					r->data = temp
				}
			}
		}
	}
18.strstr函数
	strstr(str1,str2)：用于判断str2是否是str1的子串
	char* my_strstr(char *str,char *substr)
	{		
		char *start = str;
		char *pstr = str;
		const char *substr;
		while(*start != '\0')
		{
			pstr = start;
			psub = substr;
			while(*psub != '\0')
			{
				if(*psub == *pstr)
				{
					psub++;
					pstr++;
				}
				else
					break;
			}
			if(*psub == '\0')
				return start;
			start++;
		}
		return NULL;
	}
19strlen的递归实现
	int my_strlen(char* str )	
	{
		if(*str != '\0')
			return 0;
		else
			return my_strlen(str+1)+1;
	}
	
21.回文数
	方法一：循环
	方法二：
		int huiwen(int num)
		{
			int a = num;
			int b=0,c= 0;
			while(a != 0)
			{
				b = a %10;
				c = c*10 +b;
				a = a/10;
			}
			if(c == num)
				printf("是回文数\n");
			else
				pritf("不是回文数\n")
		}
		
53.有符号数和无符号数的加法
	计算机中负数存的是它的补码（原码取反加1）
	比如：
		unsigned char m = 200;    1100,1000
		signed char n;      此时计算机认为1100,1000的第一位是符号位，就是负数，负数在计算机中是以它的补码的形式存储，即1100,1000就是一个负数的补码，对负数的补码再求补码就是负数的原码
		n = m;   n=-56    

