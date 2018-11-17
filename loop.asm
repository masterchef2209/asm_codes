;to run the program use following commands
;nasm -f elf loop.asm
;ld -m elf_i386 -s -o loop loop.o

SYS_EXIT equ 1
SYS_WRITE equ 4
SYS_READ equ 3
STDIN equ 0
STDOUT equ 1

segment .text
	global _start

_start:	               
   mov ecx,10
   mov eax, '1'
	
l1:
   mov [num], eax
   mov eax, SYS_WRITE
   mov ebx, STDOUT
   push ecx
	
   mov ecx, num        
   mov edx, 1        
   int 0x80
	
   mov eax, [num]
   sub eax, '0'
   inc eax
   add eax, '0'
   pop ecx
   loop l1
	
   mov eax,SYS_EXIT
   int 0x80             
section	.bss
num resb 1