; Small "Hello World" program in x64 assembler after the example in the "Assembler in 100 seconds" Youtube video

section .data
  hello: db "Hello World!", 10
  helloLen: equ $-hello
  timespec:
    tv_sec  dq 1
    tv_usec dq 0

section .text
  global _start

  _start:
    ; print "Hello World!"
    mov rax, 1          ; sys_write
    mov rdi, 1          ; stdout
    mov rsi, hello
    mov rdx, helloLen
    syscall

    ; sleep for 1 second
    mov rax, 35         ; sys_nanosleep
    mov rdi, timespec
    xor rsi, rsi
    syscall

    ; loop forever
    jmp _start

    ; exit
    ; mov rax, 60         ; sys_exit
    ; mov rdi, 0          ; error code 0 (success)
    ; syscall

