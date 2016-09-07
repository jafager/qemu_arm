.syntax unified


console_uart_base	= uart0_base


.text


.global console_putc
console_putc:

	push {r0-r1,lr}

	/* Output the character in r0 on the console UART */
	mov r1, r0
	ldr r0, =console_uart_base
	bl uart_putc

	pop {r0-r1,pc}


.global console_puts
console_puts:

	push {r0-r1,lr}

	/* Output the string in r0 on the console UART */
	mov r1, r0
	ldr r0, =console_uart_base
	bl uart_puts

	pop {r0-r1,pc}
