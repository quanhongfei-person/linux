
#ifndef __HEAD_H__
#define __HEAD_H__
#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<string.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<fcntl.h>
#include<sys/socket.h>
#include<error.h>
#include<errno.h>

#include <netinet/in.h>
#include <arpa/inet.h>


#define err_exit(err) error(EXIT_FAILURE,errno,err)

#endif
