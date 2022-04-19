#include <stdio.h>
#include <string.h>
#include <stdlib.h>


int fre[5] = {0};
// so2_fre
// no2_fre
// smoke_fre
// o2_fre
// total_fre

double standard_data[5] = {5.00, 11.00, 7.00, 18.00, 8500.00};

int if_overproof(char* buf)
{
	//so2val, no2val, smokeval, o2val, totalval;	
	double data_val[5];
	int flag = 0;

	char time[12];
	strcpy(time, strtok(buf, " "));
	printf("time: %s\n", time);

	int i;
	for(i=0; i<5; i++){
		data_val[i] = atof(strtok(NULL, " "));
		printf("data_val[%d]: %.2f\n",i, data_val[i]);
	}
	for(i=0; i<5; i++){
		if(data_val[i] > standard_data[i]){
			fre[i]++;
			flag = 1;
		}
	}
	
	printf("%d %d %d %d %d\n", fre[0], fre[1], fre[2], fre[3], fre[4]);	
	if(flag == 1)
		return 1;
	else 
		return 0;
}

char *myitoa(int i)
{
	char *buff = malloc(10);

	int tmp = 0;
	int j = 0;

	do{
		tmp = i % 10;
		i = i / 10;
		buff[j++] = tmp + 48;
	}while(i > 9);
	buff[j++] = i + 48;
	
	return buff;
}

void itoa(char* cov_buf)
{
	char buf[10] = {0};
	int i, j = 0, tmp = 0;
	for(i=0; i<5; i++){
		do{
			tmp = fre[i] % 10;
			fre[i] = fre[i] / 10;
			buf[j++] = tmp + 48;
		}while(fre[i] > 9);
		buf[j++] = fre[i] + 48;
		printf("buf: %s\n", buf);
	}	
}
int insert(FILE* fp)
{
	printf("input val: time so2val no2val somkeval o2val totalval \n");

	char buf[50] = {0};
	char buf_tmp[50] = {0};
	int i, ret;


	for(i=0; i<5; i++){
		fgets(buf, sizeof(buf), stdin);
		strcpy(buf_tmp, buf);
		ret = if_overproof(buf_tmp);
		if(ret){
			fputs(buf, fp);
			memset(buf_tmp, 0, sizeof(buf_tmp));
			itoa(buf_tmp);
		}
		else 
			printf("not overproof \n");
	}

	//printf("buf: %s\n", buf);
}

int main()
{
	FILE* fp = fopen("overproof_data.txt", "r+");
	if(fp == NULL){
		perror("fopen err \n");
		exit(1);
	}
	char* title = "time\tSO2\tNO2\tsmoke\tO2\ttotal\n";
	fputs(title, fp);

	insert(fp);

	return 0;

}



