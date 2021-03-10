	.data
	.balign 4	

string1: .asciz "Give me the first operand:"
string2: .asciz "Give me the second  operand:"
stringF: .asciz "The result of %d + %d = %d\n "
num: .asciz "%d"
Int1: .int 0
Int2: .int 0
Ans:  .int 0

.text
.global main
.extern printf
.extern scanf

main:
	push	{ip, lr}
	ldr	r0, =string1
	bl	printf

	ldr	r0, =num
	ldr	r1, =Int1
	bl	scanf

        ldr	r0, =string2
        bl	printf

	ldr	r0, =num
        ldr	r1, =Int2
        bl	scanf

	ldr	r1, =Int1
	ldr	r2, =Int2
	ldr	r1, [r1]
	ldr	r2, [r2]
	add	r0, r1, r2

	ldr	r4, =Ans
	str	r0, [r4]
	
	ldr	r1, =Int1
        ldr	r2, =Int2
	ldr	r3, =Ans
	ldr	r1, [r1]
	ldr	r2, [r2]
	ldr	r3, [r3]
        ldr	r0, =stringF
        bl	printf

	pop   {ip, pc}