bits 64

SYS_READ: equ 00d
SYS_WRITE: equ 01d
SYS_EXIT: equ 060d

STDIN: equ 00d
STDOUT: equ 01d
STDERR: equ 02d

section .data
	n1: dq 4
	n2: dq 5
	message_equals: db "n1 est egal a n2", 010d
	MESSAGE_EQUALS_LEN: equ $- message_equals
	message_not_equals: db "n1 n'est pas egal a n2", 010d
	MESSAGE_NOT_EQUALS_LEN: equ $- message_not_equals

section .text
	global _start
	_start:

		mov rax, [n1]
		mov rbx, [n2]
		cmp rax, rbx
		je equals
		jne not_equals
		jmp exit_program

		equals:
			mov rax, SYS_WRITE
			mov rdi, STDOUT
			mov rsi, message_equals
			mov rdx, MESSAGE_EQUALS_LEN
			syscall
			jmp exit_program

		not_equals:
			mov rax, SYS_WRITE
			mov rdi, STDOUT
			mov rsi, message_not_equals
			mov rdx, MESSAGE_NOT_EQUALS_LEN
			syscall
			jmp exit_program

		exit_program:
			mov rax, SYS_EXIT
			mov rdi, 0
			syscall


; CMP <A>, <BS> : comparaison de valeurs numeriques
; JMP <label>	: saut inconditionnel

; JE <label>	: effectue un saut si A est egal a B
; JNE <label>	: effectue un saut si A est different a B

; JG <label>	: effectue un saut si A est strictement superieur a B
; JL <label>	: effectue un saut si A est strictement inferieur a B

; JGE <label>	: effectue un saut si A est superieur ou egal a B
; JLE <label>	: effectue un saut si A est iinferieur ou egal a B