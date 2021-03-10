       .data
        .balign 4       

string1: .asciz "Give me the first operand:"
string2: .asciz "Give me the second  operand:"
string3: .asciz "The operation selected is: %c"
stringF1: .asciz "The result of %d %c %d = "
stringF2: .asciz "%d\n"
stringO: .asciz "Give me the operation to be performed (+, -, *, /):"
num: .asciz "%d%*c"
cha: .asciz "%c"
Int1: .int 0
Int2: .int 0
Ans:  .word 0
Ope:  .int 43

.text
.global main
.extern printf
.extern scanf
.extern getkey

main:
        push    {ip, lr}
        ldr     r0, =string1
        bl      printf

        ldr     r0, =num
        ldr     r1, =Int1
        bl      scanf
	
	@imprime stringO -> pregunta si +-*/
	ldr	r0, =stringO
	bl	printf

	ldr 	r0, =cha
	ldr	r1, =Ope
	bl	scanf

	@ldr	r0, =string3
	@ldr	r1, =Ope
	@ldr	r1, [r1]
	@bl 	printf
	
	@scanf 2 numero
        ldr     r0, =string2
        bl      printf

        ldr     r0, =num
	ldr     r1, =Int2
        bl      scanf

        ldr     r1, =Int1
        ldr     r2, =Int2
        ldr     r1, [r1]
        ldr     r2, [r2]

	@ Comparar char con +
	ldr	r0, =Ope
	ldr	r0, [r0]
	cmp	r0, #43
	beq	suma
	@ Comparar char con -
	cmp	r0, #45
	beq	resta
	@ Comparar char con *
	cmp	r0, #42
	beq	multi
	@ Comparar char con /
	cmp	r0, #47
	beq	div

suma:
        add     r0, r1, r2

        ldr     r4, =Ans
        str     r0, [r4]

	b	end

resta:
        sub     r0, r1, r2

        ldr     r4, =Ans
        str     r0, [r4]

	b	end	

multi:
        mul     r0, r1, r2

        ldr     r4, =Ans
        str     r0, [r4]

	b 	end

div:
        @ r1 contiene el 1er num
	@ r2 contiene el 2do num

	mov	r0, #0
loop:
	cmp	r1, r2
	blt	end_loop

	sub	r1, r1, r2
	add	r0, r0, #1
	b	loop

end_loop:
        ldr     r4, =Ans
        str     r0, [r4]

	b	end

end:
        ldr     r1, =Int1
	ldr	r2, =Ope
        ldr     r3, =Int2
	ldr     r1,  [r1]
        ldr     r2, [r2]
        ldr     r3, [r3]
        ldr     r0, =stringF1
        bl      printf

	ldr	r0, =stringF2
	ldr	r1, =Ans
	ldr	r1, [r1]
	bl	printf

        pop	{ip, pc}