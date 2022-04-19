int main()
{ 
	pid_t  pid1,pid2;
	if((pid1=fork()) == 0)
	{
	   sleep(3);
	   printf(“info1 from child process_1\n”);
	   exit(0);   								//退出//
	   printf(“info2 from child process_1\n”); 
	}
	else
	{
		if((pid2=fork()) == 0)
		{
			 sleep(1);
			 printf(“info1 from child process_2\n”);
			 exit(0);        //退出//
		}
		else
		{
			 wait(NULL);                   //阻塞等待任意//
			 wait(NULL);
			 printf(“info1 from parent process\n”);
			 printf(“info2 from parent process”);//未加\n不会打印，//
			 _exit(0);                  //调用_exit(0)会清理缓冲区//
		}
	}
}	