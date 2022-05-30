; Small "Hello World" program in x64 assembler after the example in the "Assembler in 100 seconds" Youtube video

section .data
  hello: db "Hello World!", 10
  helloLen: equ $-hello
  
section .text
  global _start
  
  _start:
    ; print "Hello World!"
    mov rax, 1          ; sys_write
    mov rdi, 1          ; stdout
    mov rsi, hello
    mov rdx, helloLen
    syscall
    
    ; exit
    mov rax, 60         ; sys_exit
    mov rdi, 0          ; error code 0 (success)
    syscall
    
