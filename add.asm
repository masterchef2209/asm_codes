;to run the program use following commands
;nasm -f elf add.asm
;ld -m elf_i386 -s -o add add.o

SYS_EXIT equ 1
SYS_WRITE equ 4
SYS_READ equ 3
STDIN equ 0
STDOUT equ 1

segment .data
    msg1 db 'enter first number :',0xA
    l1 equ $- msg1
    msg2 db 'enter second number :',0xA
    l2 equ $- msg2
    
segment .bss
    num1 resb 2
    num2 resb 2
    res resb 2
    
segment .text
    global _start
    
_start: 
    mov eax,SYS_WRITE
    mov ebx,STDOUT
    mov ecx,msg1
    mov edx,l1
    int 0x80
    
    mov eax,SYS_READ
    mov ebx,STDIN
    mov ecx,num1
    mov edx,2
    int 0x80
    
    mov eax,SYS_WRITE
    mov ebx,STDOUT
    mov ecx,msg2
    mov edx,l2
    int 0x80
    
    mov eax,SYS_READ
    mov ebx,STDIN
    mov ecx,num2
    mov edx,2
    int 0x80
    
    mov eax,[num1]
    sub eax,'0'
    mov ebx,[num2]
    sub ebx,'0'
    add eax,ebx
    add eax,'0'
    mov [res],eax
    
    mov eax,SYS_WRITE
    mov ebx,STDOUT
    mov ecx,res
    mov edx,2
    int 0x80

exit:

    mov eax,SYS_EXIT
    xor ebx,ebx
    int 0x80
    
    