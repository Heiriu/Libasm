bits 64

SYS_READ: equ 00d
SYS_WRITE: equ 01d
SYS_EXIT: equ 060d

STDIN: equ 00d
STDOUT: equ 01d
STDERR: equ 02d

section .data
	message: db "LOOP", 010d
	MESSAGE_LENGHT: equ $-message

section .text
	global _start
	_start:

		mov rbx, 5

		loop_message:
			mov rax, SYS_WRITE
			mov rdi, STDOUT
			mov rsi, message
			mov rdx, MESSAGE_LENGHT
			syscall

			dec rbx
			jnz loop_message

		mov rax, SYS_EXIT
		mov rdi, 0
		syscall