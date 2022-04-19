OUTPUT_FORMAT("elf32-littlearm", "elf32-littlearm","elf32-littlearm")
OUTPUT_ARCH(arm)
ENTRY(_start)

/*强大的自动化变量 '.'  当前（地址）*/ 

SECTIONS
{
  . = 0x40008000;
  
  .text : 
  {
	  arch/start.o(.text)
	  driver/main.o(.text)
      *(.text)
  }

  . = ALIGN(4);
  /*4字节对其*/
  .rodata : 
  { 
	  *(.rodata) 
  }
  . = ALIGN(4);
  .data :
  {
    *(.data)
  }

  . = ALIGN(4);
  _start_bss = .;
  
  .bss :
  {
   *(.bss)
  }
  . = ALIGN(4);
  _end_bss = .;
}

