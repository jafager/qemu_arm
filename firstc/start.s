interrupt_vector_table:
	b .
	b .
	b .
	b .
	b .
	b .
	b .
	b .

.comm stack, 0x10000

_start:
	.global _start
	ldr sp, =stack+0x10000
	bl main

hang:
	b hang
