  #include <sys/types.h>
       #include <grp.h>
#include<stdio.h>
#include<unistd.h>



int main(int argc, const char *argv[])
{
	struct group *gr = getgrnam("linux");
	printf("username:%s passwd:%s, gid is %d\n",
			gr->gr_name,gr->gr_passwd,gr->gr_gid);
	
	int i = 0;
	while(gr->gr_mem[i])
	{
		printf("mem:%s\n",gr->gr_mem[i++]);
	}
	return 0;
}
