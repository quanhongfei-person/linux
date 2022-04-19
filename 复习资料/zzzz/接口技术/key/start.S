.globl _start  @ .globl 声名全局可见标号
.align 2       @4字节对其
.text          @文本段
_start:        @定义标号
	mov r0, #1
	bl main
.end
