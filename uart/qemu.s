.syntax unified


.text


.global qemu
qemu:

	ldr sp, =stack_supervisor

	ldr r0, =uart0_base
	ldr r1, =message_uart_initialized
	bl uart_puts

hang:

	b hang

message_uart_initialized:

	.asciz "UART initialized.\r\n"
