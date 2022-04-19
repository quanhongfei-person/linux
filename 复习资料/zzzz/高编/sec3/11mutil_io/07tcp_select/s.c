服务器端：
 
#include"func.h"
 
int main(int argc,char **argv)
{
    if(3!=argc)
    {
        printf("error argcs!\n");
        return 0;
    }
    int ret,sfd;
    sfd=socket(AF_INET,SOCK_DGRAM,0);
    if(sfd==-1)
    {
        perror("socket");
        return -1;
    }
    struct sockaddr_in ser;
    memset(&ser,0,sizeof(ser));
    ser.sin_family=AF_INET;
    ser.sin_port=htons(atoi(argv[2]));
    ser.sin_addr.s_addr=inet_addr(argv[1]);
    ret=bind(sfd,(struct sockaddr *)&ser,sizeof(ser));//udp绑定后监听就打开了
    if(-1==ret)
    {
        perror("bind");
        return -1;
    }
    fd_set rdset;
    char buf[128]={0};
    struct sockaddr_in cli;
    memset(&cli,0,sizeof(cli));
    int cli_len=sizeof(cli);
    static int flag=0,flag2=0;
    while(1)
    {
        FD_ZERO(&rdset);
        FD_SET(0,&rdset);
        FD_SET(sfd,&rdset);
        ret=select(sfd+1,&rdset,NULL,NULL,NULL);
        if(ret>0)
        {
            if(FD_ISSET(sfd,&rdset))
            {
                flag2=1;
                memset(buf,0,sizeof(buf));
                ret=recvfrom(sfd,buf,sizeof(buf),0,(struct sockaddr *)&cli,&cli_len);
                flag=1;
                if(ret>0)
                {
                    printf("Client:%s",buf);
                }
                else{
                        printf("byebye!\n");
                        close(sfd);
                        break;
                }
            }
            if(FD_ISSET(0,&rdset)&&flag==1)
            {
                memset(buf,0,sizeof(buf));
                ret=read(0,buf,sizeof(buf));
                if(ret>0)
                {
                    ret=sendto(sfd,buf,strlen(buf)-1,0,(struct sockaddr *)&cli,cli_len);
                    //printf("have sendto %d characters!\n",ret);
                }
                else{
                    printf("byebye!\n");
                    close(sfd);
                    break;
                }
            }else{
                    if(flag2==0)
                    puts("please connect server first!then try again:");
                    flag2=1;
            }
 
        }
    }
 
}
