bits 64

; db (chaine de charactere)

; b (byte : 8 bits)
; w (word : 16 bits)
; d (double-word : 32 bits)
; q (quadruple-word : 64 bits)

; 010d valeur decimal, correspond a 10

section	.data
	message db "Test pour le plaisir de  tester", 010d ; 10 correspond au saut a la ligne
	MESSAGE_LENGHT: equ $ - message

	SYS_WRITE: equ 01d
	SYS_EXIT: equ 060d

	STDIN: equ 00d
	STDOUT: equ 01d
	STDERR: equ 02d

section .text
	global _start
	_start:
		mov rax, SYS_WRITE
		mov rdi, STDOUT ; stdout
		mov rsi, message ; recuperation message
		mov rdx, MESSAGE_LENGHT ; taille message

		; commande finale : write(1, message, 13)

		syscall



		mov rax, SYS_EXIT
		mov rdi, 0

		; commande finale : exit (0)

		syscall


;  rdi, rsi, rdx, rcx, r8, r9, pile (droite -> gauche)
;  retour dans accumulateur rax (64 bits) ou rax + rdx (128 bits)