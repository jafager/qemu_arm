.syntax unified


.text


.global qemu
qemu:

	ldr r4, =0x01234567
	ldr r5, =0x89abcdef

hang:

	b hang
