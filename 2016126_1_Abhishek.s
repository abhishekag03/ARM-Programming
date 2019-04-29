@.equ

.equ SWI_PrInt, 0x6b
.equ SWI_PrChr, 0x0
.equ SWI_Exit, 0x11

mov r0, #0
swi 0x6c
mov r5, r0  @storing input in r4

mov r4, #0		@num
@mov r5, #20		@c
mov r6, #0    @pro

loop:
	cmp r6, r5    @comparing the current product with input
	bgt loop_exit   @if it is greater then exit
	mov r0, #1		
	mov r1, r6		
	swi SWI_PrInt		@else we print it
	mov r0, #' '
	swi 0x00
	add r4, r4, #1
	@mov r7, r4
	add r7, r4, #1    @and then add 1 for the next iteration
	mul r6, r4, r7
	@ mov r4
b loop
loop_exit:

swi SWI_Exit
