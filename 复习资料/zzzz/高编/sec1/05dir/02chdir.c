

#include<stdio.h>

#include<unistd.h>

int main(int argc, const char *argv[])
{
	char current_path[1024]={0};
	getcwd(current_path,1024);
	printf("current_path is %s\n",current_path);
	chdir("/home/linux");
	getcwd(current_path,1024);
	printf("current_path2 is %s\n",current_path);

	return 0;
}
