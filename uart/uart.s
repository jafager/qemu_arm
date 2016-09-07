.syntax unified


.global uart0_base
uart0_base	= 0x16000000
.global uart1_base
uart1_base	= 0x17000000

uart_rw		= 0x00


.text


.global uart_putc
uart_putc:

	uart_base	.req r0
	character	.req r1

	/* Output the character in r1 on the UART with base address r0 */
	strb character, [uart_base, uart_rw]

	bx lr

	.unreq uart_base
	.unreq character


.global uart_puts
uart_puts:

	uart_base	.req r0
	string		.req r1
	character	.req r2

	push {r0-r2,lr}

uart_puts_next_character:

	ldrb character, [string]
	cmp character, 0
	beq uart_puts_end_of_string
	push {r1}
	mov r1, character
	bl uart_putc
	pop {r1}
	add string, string, 1
	b uart_puts_next_character

uart_puts_end_of_string:

	pop {r0-r2, pc}

	.unreq uart_base
	.unreq string
	.unreq character
