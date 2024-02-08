bits 64

global return_param:
	push rbp
	mov rbp, rdi

	mov rax, rdi

	leave
	ret