MEMORY
{
	ram : ORIGIN = 0x00010000, LENGTH = 0x07ff0000
}

SECTIONS
{
	.text : { *(.text*) } > ram
	. = . + 0x1000;
	stack_supervisor = .;
}
