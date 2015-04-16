;*********************************************
;	boot.asm
;		- A Simple Bootloader
;*********************************************

bits 32

FLAGS equ	0	; this is the multiboot 'flag' field
MAGIC equ	0x1BADB002	; 'magic number' lets bootloader find the header
CHECKSUM equ	-(MAGIC + FLAGS); checksum required
STACKSIZE equ	0x4000	; 16 KiB for stack

section .text
	align 4
	; setting multiboot header
	multiboot_header:
	dd	MAGIC
	dd	FLAGS
	dd	CHECKSUM\

global boot
extern main

boot:
	cli	;block interrupts
	call main
	hlt	;halt CPU