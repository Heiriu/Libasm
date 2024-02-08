bits 64

SYS_READ: equ 00d
SYS_WRITE: equ 01d
SYS_EXIT: equ 060d

STDIN: equ 00d
STDOUT: equ 01d
STDERR: equ 02d

section .data
	message db "tell me your name ?", 010d
	MESSAGE_LENGHT: equ $-message
	USERNAME_LENGHT: equ 11

section .bss
	username: resb USERNAME_LENGHT ; reserver octet d'emplacement memoire

section .text
	global _start
	_start:
		mov rax, SYS_WRITE
		mov rdi, STDOUT
		mov rsi, message
		mov rdx, MESSAGE_LENGHT
		syscall


		mov rax, SYS_READ
		mov rdi, STDIN
		mov rsi, username
		mov rdx, USERNAME_LENGHT
		syscall


		mov rax, SYS_WRITE
		mov rdi, STDOUT
		mov rsi, username
		mov rdx, USERNAME_LENGHT
		syscall


		mov rax, SYS_EXIT
		mov rdi, 0
		syscall
