.eqv KBD_READY 0xFFFF0000
.eqv KBD_DATA 0xFFFF0004
.eqv DSP_READY 0xFFFF0008
.eqv DSP_DATA 0xFFFF000C

.text

	li s0, KBD_READY
	li s1, KBD_DATA
	li s2, DSP_READY
	li s3, DSP_DATA
loop:

	lw t0, 0(s0)
	beq t0, zero, loop
	lw t1, 0(s1)
espera_display:

	lw t2, 0(s2)
	beq t2, zero, espera_display
	sw t1, 0(s3)
	j loop