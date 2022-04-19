客户端：
 
#include"func.h"
 
int main(int argc,char **argv)
{
    if(3!=argc)
    {
        printf("errror argcs!\n");
        return -1;
    }
    int sfd,ret;
    sfd=socket(AF_INET,SOCK_DGRAM,0);
    if(-1==sfd)
    {
        perror("socket");
        return -1;
    }
    struct sockaddr_in ser;
    memset(&ser,0,sizeof(ser));
    struct sockaddr_in cli;
    memset(&cli,0,sizeof(cli));
    int clilen=sizeof(cli);
    ser.sin_family=AF_INET;
    ser.sin_port=htons(atoi(argv[2]));
    ser.sin_addr.s_addr=inet_addr(argv[1]);
    fd_set rdset;
    char buf[128]={0};
    while(1)
    {
        FD_ZERO(&rdset);
        FD_SET(0,&rdset);
        FD_SET(sfd,&rdset);
        ret=select(sfd+1,&rdset,NULL,NULL,NULL);
        if(ret>0)
        {
            if(FD_ISSET(0,&rdset))
            {
                memset(buf,0,sizeof(buf));
                ret=read(0,buf,sizeof(buf));
                if(ret>0)
                {
                    ret=sendto(sfd,buf,sizeof(buf),0,(struct sockaddr *)&ser,clilen);
                }else{
                    printf("byebye!\n");
                    close(sfd);
                    break;
                }
            }
            if(FD_ISSET(sfd,&rdset))
            {
                memset(buf,0,sizeof(buf));
                ret=recvfrom(sfd,buf,sizeof(buf),0,(struct sockaddr *)&cli,&clilen);
                //printf("recv %d characters!\n",ret);
                //puts(buf);
               if(ret>0)
               {
                   puts(buf);
               }else{
                   printf("byebye!\n");
                   close(sfd);
                   break;
               }
            }
        }
 
    }
}
