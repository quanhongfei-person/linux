#include <stdio.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>         
#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include<string.h>
#include <arpa/inet.h>
#include<time.h>
#include <unistd.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<fcntl.h>
#include<sqlite3.h>
#define err_msg(msg) do{234perror(msg);exit(1);}while(0)
typedef struct sockaddr* SA;
int flag=0;
int handle(void* arg,int col,char**result,char**title)
{	
	char ptr[1024]={0};
	sprintf(ptr,"<h3>%s</h3>",result[3]);
/*	<a href="../example/html/lastpage.html">
		<img border="0" src="../i/eg_buttonnext.gif" />
		</a>
*/
	sprintf(ptr,"%s<p><a href=\"5_%s.html\"><img src=\"%s\"></a></p>",ptr,result[0],result[19]);
	FILE*fp=fopen("./2.html","a");
	fwrite(ptr,1024,1,fp); 
	fclose(fp);
	return 0;
}

/*<p>
一幅图像：
<img src="../i/eg_mouse.jpg" width="128" height="128" />
</p>
*/
int handle1(void* arg,int col,char**result,char**title)
{	
	char ptr[1024]={0};
		sprintf(ptr,"<p>%s:<img src='%s'></p><p>price:%s</p><h3>%s</h3> </body></html>",result[3],result[20],result[10],result[16],result[18]);
//	sprintf(ptr,"%s</body></html>",result[1]);

	FILE*fp=fopen("./5.html","a");
	fwrite(ptr,1024,1,fp);
	fclose(fp);
	return 0; 
}

unsigned char FromHex(unsigned char x)
{
	if(0 == x ) return -1;
	unsigned char y;
	if(x>='A' &&x<='Z') y = x-'A'+10;
	else if(x>='a' &&x <='z') y = x-'a'+10;
	else if(x>='0' && x<='9') y = x-'0';

	return y;
}
int  urlDecode(  char* dest, const char* src)
{
	if(NULL ==src || NULL == dest)
	{
		return -1;

	}
	int len = strlen(src);
	int i =0 ;
	for(i = 0 ;i<len;i++)
	{

		if('+' == src[i]) strcat(dest,"");
		else if('%'==src[i])
		{

			unsigned char high = FromHex((unsigned char)src[++i]);
			unsigned char low = FromHex((unsigned char)src[++i]);
			unsigned char temp = high*16 +low;
			char temp2[5]={0};
			sprintf(temp2,"%c",temp);
			strcat(dest , temp2);
		}
	}
	return 0;
}

int main(void)
{
	int listfd = socket(AF_INET, SOCK_STREAM, 0);
	if (-1 == listfd)
		err_msg("socket");
	struct sockaddr_in ser, cli;
	bzero(&ser, sizeof(ser));
	bzero(&cli, sizeof(cli));
	ser.sin_addr.s_addr = INADDR_ANY;
	ser.sin_family = AF_INET;
	ser.sin_port = htons(50000);

	int ret = bind(listfd, (SA) &ser, sizeof(ser));
	if (-1 == ret)
		err_msg("bind");
	listen(listfd, 3);
	socklen_t len = sizeof(cli);
	while (1)
	{
		int conn = accept(listfd, (SA) &cli, &len);
		if (-1 == conn)
			err_msg("accept");
		char buf[4096] = { 0 };
		recv(conn, buf, 4096, 0);
		printf("%s", buf);
		char *method = NULL;
  		char* url = NULL;
		char* ver = NULL;
		method = strtok(buf, " ");
		url = strtok(NULL, " ");
		ver = strtok(NULL, "\r\n");
		if (0 == strcmp(url, "/"))
		{

			int fd = open("/home/linux/GJBC/sec04/02web_shop_sqlite3/3.html",
					O_RDONLY);
			if (-1 == fd)
				err_msg("open 3.html");
			while (1)
			{
				bzero(buf, 4096);
				int rd_num = read(fd, buf, 4096);
				if (0 == rd_num)
					break;
				send(conn, buf, rd_num, 0);

			}
			close(fd);
		}
//GET /img/5503.jpg HTTP/1.1
		if(strstr(url,"img"))
		{
			char path[256]={0};
			sprintf(path,"/home/linux/GJBC/sec04/02web_shop_sqlite3%s",url);
			int fd = open(path, O_RDONLY);
			if (-1 == fd)
			err_msg("open");
			char buff[4096] = { 0 };
			while (1)
			{
				bzero(buff, 4096);
				int rd_num = read(fd, buff, 4096);
				if (0 == rd_num)
				break;
				send(conn, buff, rd_num, 0);
			}
				close(fd);
		}
		if (strstr( url,"login"))
		{
			char *start = index(url, '=');
			char * end = index(url, '&');
			*end = '\0';

			char name[128] = { 0 };
			char pass[128] = { 0 };
			char NEWname[128]={0};
			strcpy(name, start + 1);
			end += 1;
			start = index(end, '=');
			strcpy(pass, start + 1);
			urlDecode(NEWname,name);
			if (0==strcmp(pass, "123"))
			{
		
				sqlite3* db;
				int ret = sqlite3_open("shop.db",&db);
				if(SQLITE_OK!=ret)
				{
					fprintf(stderr,"open shop.db：%s\n",sqlite3_errmsg(db));
					sqlite3_close(db);
					exit(1);
				}
				char ptr[1024]={"<!DOCTYPE html> <html><head><meta charset=\"utf-8\"><title>你想要的在这里</title></head><body background=\"./img/1111582.jpg\">这里是搜索结果。"};
				FILE*fp=fopen("./2.html","w");
				size_t t=fwrite(ptr,1024,1,fp);
				if(t<0)
				{
					printf("fwrite error\n");
				}
				fclose(fp);
				char* errmsg; 
				char sql_cmd[1024]={0};
				sprintf(sql_cmd,"select * from goods where goods_name like '%%%s%%'",NEWname);
				ret = sqlite3_exec(db,sql_cmd,handle,&flag,&errmsg);
				if(SQLITE_OK!=ret)
				{
					fprintf(stderr,"exec %s:%s\n",sql_cmd,errmsg);
					sqlite3_free(errmsg);
					sqlite3_close(db);
					exit(1);
				}
				char ptr1[1024]={"</body></html>"};
				FILE*fp1=fopen("./2.html","a");
				fwrite(ptr1,1024,1,fp1);
				fclose(fp1);
				int fd = open("./2.html",O_RDONLY);
				if (-1 == fd)
					err_msg("open 2.html");
				while (1)
				{
					bzero(buf, 4096);
					int rd_num = read(fd, buf, 4096);
					if (0 == rd_num)
						break;
					send(conn, buf, rd_num, 0);

				}
				close(fd);
			/*	bzero(sql_cmd,1024;
				sprintf(sql_cmd,"select cat_id from goods where goods_name like '%%%s%%'",NEWname);
				ret = sqlite3_exec(db,sql_cmd,handle,&flag,&errmsg);
			*/	sqlite3_close(db);
				
			
			}
		}
		if (strstr( url,"images"))
		{
			char *start1 = index(url, '/');
			char buf[256]={0};
			char newbuf[256]={0};
			strcpy(buf, start1 + 1);
			sprintf(newbuf,"/home/linux/GJBC/sec04/02web_shop_sqlite3/%s",buf);
			int fd = open(newbuf, O_RDONLY);
			if (-1 == fd)
			err_msg("open");
			char buff[4096] = { 0 };
			while (1)
			{
				bzero(buff, 4096);
				int rd_num = read(fd, buff, 4096);
				if (0 == rd_num)
				break;
				send(conn, buff, rd_num, 0);
			}
				close(fd);
		}
//		GET /5_4.hmtl HTTP/1.1
		if(strstr( url,"5_"))
		{
			char *start2 = index(url, '_');
			char *end1 = index(url,'.');
			*end1='\0';
			char bud[256]={0};
			strcpy(bud,start2+1);
			sqlite3* db;
			int  ret = sqlite3_open("shop.db",&db);
				if(SQLITE_OK!=ret)
				{
					fprintf(stderr,"open shop.db：%s\n",sqlite3_errmsg(db));
					sqlite3_close(db);
					exit(1);
				}
//<!DOCTYPE html> <html><head><meta charset=\"utf-8\"><title>你想要的在这里</title></head><body background=\"./img/1111582.jpg\">这里是搜索结果。"};

				char ptr[1024]={"<!DOCTYPE html> <html><head><meta charset=\"utf-8\"><title>详细信息</title></head><body background=\"./img/1235676.jpg\">这里是搜索结果。"};
				FILE*fp2=fopen("./5.html","w+");
				size_t t=fwrite(ptr,1024,1,fp2);
				if(t<0)
				{
					printf("fwrite error\n");
				}
				fclose(fp2);
				char* errmsg; 
				char sql_cmd[1024]={0};
				sprintf(sql_cmd,"select * from goods where goods_id = '%s'",bud);
				ret = sqlite3_exec(db,sql_cmd,handle1,&flag,&errmsg);
				if(SQLITE_OK!=ret)
				{
					fprintf(stderr,"exec %s:%s\n",sql_cmd,errmsg);
					sqlite3_free(errmsg);
					sqlite3_close(db);
					exit(1);
				}
/*				char ptr1[1024]={"</body></html>"};
				FILE*fp3=fopen("./5.html","a");
				fwrite(ptr1,1024,1,fp3);
				fclose(fp3);
*/				int fd1 = open("./5.html",O_RDONLY);
				if (-1 == fd1)
					err_msg("open 5.html");
				while (1)
				{
					bzero(buf, 4096);
					int	 rd_num = read(fd1, buf, 4096);
					if (0 == rd_num)
						break;
					send(conn, buf, rd_num, 0);

				}
				close(fd1);
				sqlite3_close(db);
		}
		fflush(stdout);
		close(conn);
	}
	return EXIT_SUCCESS;
}
 
