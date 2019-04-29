@.equ
.equ SWI_PrInt, 0x6b
.equ SWI_PrChr, 0x0
.equ SWI_Exit, 0x11

mov r0, #0
swi 0x6c
mov r4, r0  @storing input in r4

@mov r4, #5    @input(N)
mov r5, #0;    @count
add r4, r4, #1 @i

loop:
	cmp r5, #9       @loop to check count<10
	bgt loop_exit 
	mov r6, #2     @j
	loop2:
		mul r7, r6, r6   @checking that j^2<=N
		cmp r7, r4		
		bgt loop2_exit		@if j^2>N then the number is a prime	
		mov r9, r4
		loop3:
			sub r9, r9, r6		@division using repeated subtraction
			cmp r9, #0	
			blt nextj			@if not divisible by this j then increment j
			beq not_prime		
			b loop3

nextj:
	add r6, r6, #1			@incrementing count of j by 1	
	b loop2


not_prime:
	mov r6, #2				@number is not a prime hence moving to the next N
	add r4, r4, #1
	@mov r8, #0
	b loop2

loop2_exit:
	@cmp r8, #1
	mov r0, #1			@number is prime, hence printing it with a space
	mov r1, r4
	swi SWI_PrInt
	add r4, r4, #1
	add r5, r5, #1
	mov r0, #' '
	swi 0x00
	b loop

loop_exit:
	swi SWI_Exit


@prime:
	@mov r8, #1
	@add r6, r6, #1
	@b loop2