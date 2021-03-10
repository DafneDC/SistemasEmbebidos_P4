	.data
	.balign 4

input: .asciz "x ="
output: .asciz "The result is %d\n"
num: .asciz "%d"
Int1: .int 0

.text
.global main
.extern printf
.extern scanf

main:
	push	{ip, lr}

	ldr	r0, =input
	bl	printf

	ldr	r0, =num
	ldr	r1, =Int1
	bl	scanf

	ldr	r1, =Int1
	ldr	r1, [r1]

	mov	r5, #6
	mov	r6, #9
	mov	r0, #2
	
	mul	r2, r1, r1
	mul	r4, r2, r5
	mul	r3, r1, r6
	add	r3, r3, r0
	add	r3, r3, r4

	mov	r1, r3

	ldr	r0, =output
	bl	printf
	pop	{ip, pc}