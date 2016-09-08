void uart_putc(void* uart_base, char character)
{
	*(volatile unsigned long*)uart_base = character;
}


void uart_puts(void* uart_base, const char * string)
{
	while (*string != 0)
	{
		uart_putc(uart_base, *string++);
	}
}


int main (int argc, char* argv)
{
	uart_puts((void*)(0x16000000), "UART initialized.\r\n");
	return 0;
}
