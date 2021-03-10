.data
.balign 4
y: .word 0
c: .word 0xCCCCCCCC
.text
.global main

main:   
	push {ip, lr}
	
	@MODO1 - Directo
	ldr r0, =y 		 @Tener la direccion de y
	ldr r1, =0xAAAAAAAA	 @Tenemos el valor que queremos guardar
	str r1, [r0]		 @Guardar r1 en y (r0)


	@MODO2 - Inmediato
	mov r3, #0xBB


	@MODO3 - Indirecto
	ldr r4, =c   	@ Tenemos la direccion de c
	ldr r4, [r4] 	@ Tenemos el valor de c
	str r4, [r0] 	@ Guardar el valor de c en la direccion de y

	pop {ip, pc}