
char* Itoa(int val,char* dst,int radix = 10);//定义的时候默认指定10进制

char* Itoa(int val,char* dst,int radix)
{
    char *_pdst = dst;   
    if (!val)//允许val等于0 
    {
        *_pdst = '0';
        *++_pdst = '\0';
        return dst;
    }           
    if(val <0)
    {
        *_pdst++ = '-';
        val = -val;
    }
    char *_first = _pdst;     
    char _cov;           
    unsigned int _rem;   
    while(val > 0)
    {
        _rem = (unsigned int)(val % radix);
        val /= radix;//每次计算一位 ，从低到高
        if  (_rem > 9)//16进制
            *_pdst++ = (char)(_rem - 10 + 'a'); 
        else
            *_pdst++ = (char)(_rem + '0');      
    }      
    *_pdst-- = '\0';
    do{ //由于数据是地位到高位储存的，需要转换位置
        _cov = *_pdst;
        *_pdst = *_first;
        *_first = _cov;
        _pdst--;
        _first++;        
    }
	while(_first < _pdst);  
    return dst;
}