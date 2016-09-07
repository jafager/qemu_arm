.syntax unified


.text


.global qemu
qemu:

	ldr sp, =stack_supervisor

	ldr r0, =message_console_initialized
	bl console_puts

hang:

	b hang

message_console_initialized:

	.asciz "Console initialized.\r\n"
