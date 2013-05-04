	.syntax unified
	.eabi_attribute 6, 6
	.eabi_attribute 10, 2
	.fpu vfpv2
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.file	"zlibtest.clang.opt.bc"
	.text
	.globl	ZMEMCPY
	.align	2
	.type	ZMEMCPY,%function
ZMEMCPY:                                @ @ZMEMCPY
@ BB#0:
	cmp	r2, #0
	bxeq	lr
	mov	r12, r0
.LBB0_1:                                @ %.lr.ph
                                        @ =>This Inner Loop Header: Depth=1
	ldrb	r3, [r1], #1
	subs	r2, r2, #1
	strb	r3, [r12], #1
	bne	.LBB0_1
@ BB#2:                                 @ %._crit_edge
	bx	lr
.Ltmp0:
	.size	ZMEMCPY, .Ltmp0-ZMEMCPY

	.globl	ZMEMSET
	.align	2
	.type	ZMEMSET,%function
ZMEMSET:                                @ @ZMEMSET
@ BB#0:
	push	{r4, lr}
	mov	r4, r0
	cmp	r2, #0
	beq	.LBB1_2
@ BB#1:                                 @ %.lr.ph
	uxtb	r3, r1
	mov	r1, r2
	mov	r0, r4
	mov	r2, r3
	bl	__aeabi_memset
.LBB1_2:
	mov	r0, r4
	pop	{r4, pc}
.Ltmp1:
	.size	ZMEMSET, .Ltmp1-ZMEMSET

	.globl	ZMALLOC
	.align	2
	.type	ZMALLOC,%function
ZMALLOC:                                @ @ZMALLOC
@ BB#0:
	ldr	r2, .LCPI2_0
	mov	r1, r0
	ldr	r0, [r2]
	add	r1, r1, r0
	add	r1, r1, #3
	bic	r1, r1, #3
	str	r1, [r2]
	bx	lr
	.align	2
@ BB#1:
.LCPI2_0:
	.long	heap_offset
.Ltmp2:
	.size	ZMALLOC, .Ltmp2-ZMALLOC

	.globl	ZCALLOC
	.align	2
	.type	ZCALLOC,%function
ZCALLOC:                                @ @ZCALLOC
@ BB#0:
	push	{r4, lr}
	ldr	r2, .LCPI3_0
	ldr	r4, [r2]
	mla	r3, r1, r0, r4
	mul	r1, r1, r0
	add	r0, r3, #3
	bic	r0, r0, #3
	str	r0, [r2]
	cmp	r1, #0
	beq	.LBB3_2
@ BB#1:                                 @ %.lr.ph.i
	mov	r0, r4
	mov	r2, #0
	bl	__aeabi_memset
.LBB3_2:                                @ %ZMEMSET.exit
	mov	r0, r4
	pop	{r4, pc}
	.align	2
@ BB#3:
.LCPI3_0:
	.long	heap_offset
.Ltmp3:
	.size	ZCALLOC, .Ltmp3-ZCALLOC

	.globl	free
	.align	2
	.type	free,%function
free:                                   @ @free
@ BB#0:
	bx	lr
.Ltmp4:
	.size	free, .Ltmp4-free

	.globl	notmain
	.align	2
	.type	notmain,%function
notmain:                                @ @notmain
@ BB#0:
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	sub	sp, sp, #12
	ldr	r0, .LCPI5_0
	mov	r1, #1048576
	str	r1, [r0]
	bl	uart_init
	ldr	r4, .LCPI5_1
	mov	r1, #16318464
	mov	r0, r4
	bl	PUT32
	mov	r1, #512
	orr	r1, r1, #16318464
	mov	r0, r4
	bl	PUT32
	mov	r4, #0
.LBB5_1:                                @ =>This Loop Header: Depth=1
                                        @     Child Loop BB5_2 Depth 2
                                        @     Child Loop BB5_4 Depth 2
	mov	r0, r4
	bl	hexstrings
.LBB5_2:                                @   Parent Loop BB5_1 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_2
@ BB#3:                                 @ %uart_putc.exit.i
                                        @   in Loop: Header=BB5_1 Depth=1
	ldr	r0, .LCPI5_3
	mov	r1, #13
	bl	PUT32
.LBB5_4:                                @   Parent Loop BB5_1 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_4
@ BB#5:                                 @ %hexstring.exit
                                        @   in Loop: Header=BB5_1 Depth=1
	ldr	r0, .LCPI5_3
	mov	r1, #10
	bl	PUT32
	add	r4, r4, #1
	cmp	r4, #256
	bne	.LBB5_1
@ BB#6:
	mov	r4, #1808
	orr	r4, r4, #8192
	mov	r0, r4
	bl	hexstrings
.LBB5_7:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_7
@ BB#8:                                 @ %uart_putc.exit.i1
	ldr	r0, .LCPI5_3
	mov	r1, #13
	bl	PUT32
.LBB5_9:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_9
@ BB#10:                                @ %hexstring.exit2
	ldr	r0, .LCPI5_3
	mov	r1, #10
	bl	PUT32
	ldr	r6, .LCPI5_4
	mov	r0, r6
	bl	GET32
	ldr	r5, .LCPI5_5
	ldr	r7, .LCPI5_6
	ldr	r2, .LCPI5_7
	str	r0, [sp, #8]            @ 4-byte Spill
	mvn	r0, #0
	str	r0, [sp]
	mov	r0, r7
	mov	r1, r5
	mov	r3, r4
	str	r4, [r5]
	bl	compress2
	mov	r8, r0
	mov	r0, r6
	bl	GET32
	ldr	r11, .LCPI5_8
	mov	r10, r0
	ldr	r0, .LCPI5_9
	ldr	r3, [r5]
	mov	r1, r11
	mov	r2, r7
	str	r4, [r11]
	bl	uncompress
	mov	r4, r0
	mov	r0, r6
	bl	GET32
	mov	r9, r0
	mov	r0, r8
	bl	hexstrings
.LBB5_11:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_11
@ BB#12:                                @ %uart_putc.exit.i3
	ldr	r0, .LCPI5_3
	mov	r1, #13
	bl	PUT32
.LBB5_13:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_13
@ BB#14:                                @ %hexstring.exit4
	ldr	r0, .LCPI5_3
	mov	r1, #10
	bl	PUT32
	ldr	r0, [r5]
	bl	hexstrings
.LBB5_15:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_15
@ BB#16:                                @ %uart_putc.exit.i5
	ldr	r0, .LCPI5_3
	mov	r1, #13
	bl	PUT32
.LBB5_17:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_17
@ BB#18:                                @ %hexstring.exit6
	ldr	r0, .LCPI5_3
	mov	r1, #10
	bl	PUT32
	mov	r0, r4
	bl	hexstrings
.LBB5_19:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_19
@ BB#20:                                @ %uart_putc.exit.i7
	ldr	r0, .LCPI5_3
	mov	r1, #13
	bl	PUT32
.LBB5_21:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_21
@ BB#22:                                @ %hexstring.exit8
	ldr	r0, .LCPI5_3
	mov	r1, #10
	bl	PUT32
	ldr	r0, [r11]
	bl	hexstrings
.LBB5_23:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_23
@ BB#24:                                @ %uart_putc.exit.i9
	ldr	r0, .LCPI5_3
	mov	r1, #13
	bl	PUT32
.LBB5_25:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_25
@ BB#26:                                @ %hexstring.exit10
	ldr	r0, .LCPI5_3
	mov	r1, #10
	bl	PUT32
	ldr	r0, .LCPI5_10
	bl	hexstrings
	ldr	r4, [sp, #8]            @ 4-byte Reload
.LBB5_27:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_27
@ BB#28:                                @ %uart_putc.exit.i11
	ldr	r0, .LCPI5_3
	mov	r1, #13
	bl	PUT32
.LBB5_29:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_29
@ BB#30:                                @ %hexstring.exit12
	ldr	r0, .LCPI5_3
	mov	r1, #10
	bl	PUT32
	mov	r0, r4
	bl	hexstrings
.LBB5_31:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_31
@ BB#32:                                @ %uart_putc.exit.i13
	ldr	r0, .LCPI5_3
	mov	r1, #13
	bl	PUT32
.LBB5_33:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_33
@ BB#34:                                @ %hexstring.exit14
	ldr	r0, .LCPI5_3
	mov	r1, #10
	bl	PUT32
	mov	r0, r10
	bl	hexstrings
.LBB5_35:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_35
@ BB#36:                                @ %uart_putc.exit.i15
	ldr	r0, .LCPI5_3
	mov	r1, #13
	bl	PUT32
.LBB5_37:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_37
@ BB#38:                                @ %hexstring.exit16
	ldr	r0, .LCPI5_3
	mov	r1, #10
	bl	PUT32
	mov	r0, r9
	bl	hexstrings
.LBB5_39:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_39
@ BB#40:                                @ %uart_putc.exit.i17
	ldr	r0, .LCPI5_3
	mov	r1, #13
	bl	PUT32
.LBB5_41:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_41
@ BB#42:                                @ %hexstring.exit18
	ldr	r0, .LCPI5_3
	mov	r1, #10
	bl	PUT32
	sub	r0, r10, r4
	bl	hexstrings
.LBB5_43:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_43
@ BB#44:                                @ %uart_putc.exit.i19
	ldr	r0, .LCPI5_3
	mov	r1, #13
	bl	PUT32
.LBB5_45:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_45
@ BB#46:                                @ %hexstring.exit20
	ldr	r0, .LCPI5_3
	mov	r1, #10
	bl	PUT32
	sub	r0, r9, r10
	bl	hexstrings
.LBB5_47:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_47
@ BB#48:                                @ %uart_putc.exit.i21
	ldr	r0, .LCPI5_3
	mov	r1, #13
	bl	PUT32
.LBB5_49:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_49
@ BB#50:                                @ %hexstring.exit22
	ldr	r0, .LCPI5_3
	mov	r1, #10
	bl	PUT32
	sub	r0, r9, r4
	bl	hexstrings
.LBB5_51:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_51
@ BB#52:                                @ %uart_putc.exit.i23
	ldr	r0, .LCPI5_3
	mov	r1, #13
	bl	PUT32
.LBB5_53:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_53
@ BB#54:                                @ %hexstring.exit24
	ldr	r0, .LCPI5_3
	mov	r1, #10
	bl	PUT32
	mov	r0, #0
	add	sp, sp, #12
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.align	2
@ BB#55:
.LCPI5_0:
	.long	heap_offset
.LCPI5_1:
	.long	536917000               @ 0x2000b408
.LCPI5_2:
	.long	539054164               @ 0x20215054
.LCPI5_3:
	.long	539054144               @ 0x20215040
.LCPI5_4:
	.long	536917024               @ 0x2000b420
.LCPI5_5:
	.long	complen
.LCPI5_6:
	.long	compressed
.LCPI5_7:
	.long	testdata
.LCPI5_8:
	.long	uncomplen
.LCPI5_9:
	.long	uncompressed
.LCPI5_10:
	.long	286331153               @ 0x11111111
.Ltmp5:
	.size	notmain, .Ltmp5-notmain

	.globl	uart_putc
	.align	2
	.type	uart_putc,%function
uart_putc:                              @ @uart_putc
@ BB#0:
	push	{r4, lr}
	mov	r4, r0
.LBB6_1:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI6_0
	bl	GET32
	tst	r0, #32
	beq	.LBB6_1
@ BB#2:
	ldr	r0, .LCPI6_1
	mov	r1, r4
	bl	PUT32
	pop	{r4, pc}
	.align	2
@ BB#3:
.LCPI6_0:
	.long	539054164               @ 0x20215054
.LCPI6_1:
	.long	539054144               @ 0x20215040
.Ltmp6:
	.size	uart_putc, .Ltmp6-uart_putc

	.globl	hexstrings
	.align	2
	.type	hexstrings,%function
hexstrings:                             @ @hexstrings
@ BB#0:
	push	{r4, r5, r6, lr}
	mov	r4, r0
	lsr	r6, r4, #28
	mov	r5, #55
.LBB7_1:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI7_0
	bl	GET32
	tst	r0, #32
	beq	.LBB7_1
@ BB#2:                                 @ %uart_putc.exit
	ldr	r0, .LCPI7_1
	orr	r1, r6, #48
	cmp	r4, #-1610612736
	addhs	r1, r5, r4, lsr #28
	bl	PUT32
	mov	r0, #15
	and	r5, r0, r4, lsr #24
.LBB7_3:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI7_0
	bl	GET32
	tst	r0, #32
	beq	.LBB7_3
@ BB#4:                                 @ %uart_putc.exit.1
	ldr	r0, .LCPI7_1
	orr	r1, r5, #48
	cmp	r5, #9
	addhi	r1, r5, #55
	bl	PUT32
	mov	r0, #15
	and	r5, r0, r4, lsr #20
.LBB7_5:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI7_0
	bl	GET32
	tst	r0, #32
	beq	.LBB7_5
@ BB#6:                                 @ %uart_putc.exit.2
	ldr	r0, .LCPI7_1
	orr	r1, r5, #48
	cmp	r5, #9
	addhi	r1, r5, #55
	bl	PUT32
	mov	r0, #15
	and	r5, r0, r4, lsr #16
.LBB7_7:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI7_0
	bl	GET32
	tst	r0, #32
	beq	.LBB7_7
@ BB#8:                                 @ %uart_putc.exit.3
	ldr	r0, .LCPI7_1
	orr	r1, r5, #48
	cmp	r5, #9
	addhi	r1, r5, #55
	bl	PUT32
	mov	r0, #15
	and	r5, r0, r4, lsr #12
.LBB7_9:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI7_0
	bl	GET32
	tst	r0, #32
	beq	.LBB7_9
@ BB#10:                                @ %uart_putc.exit.4
	ldr	r0, .LCPI7_1
	orr	r1, r5, #48
	cmp	r5, #9
	addhi	r1, r5, #55
	bl	PUT32
	mov	r0, #15
	and	r5, r0, r4, lsr #8
.LBB7_11:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI7_0
	bl	GET32
	tst	r0, #32
	beq	.LBB7_11
@ BB#12:                                @ %uart_putc.exit.5
	ldr	r0, .LCPI7_1
	orr	r1, r5, #48
	cmp	r5, #9
	addhi	r1, r5, #55
	bl	PUT32
	mov	r0, #15
	and	r5, r0, r4, lsr #4
.LBB7_13:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI7_0
	bl	GET32
	tst	r0, #32
	beq	.LBB7_13
@ BB#14:                                @ %uart_putc.exit.6
	ldr	r0, .LCPI7_1
	orr	r1, r5, #48
	cmp	r5, #9
	addhi	r1, r5, #55
	bl	PUT32
	and	r4, r4, #15
.LBB7_15:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI7_0
	bl	GET32
	tst	r0, #32
	beq	.LBB7_15
@ BB#16:                                @ %uart_putc.exit.7
	ldr	r0, .LCPI7_1
	orr	r1, r4, #48
	cmp	r4, #9
	addhi	r1, r4, #55
	bl	PUT32
.LBB7_17:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI7_0
	bl	GET32
	tst	r0, #32
	beq	.LBB7_17
@ BB#18:                                @ %uart_putc.exit1
	ldr	r0, .LCPI7_1
	mov	r1, #32
	bl	PUT32
	pop	{r4, r5, r6, pc}
	.align	2
@ BB#19:
.LCPI7_0:
	.long	539054164               @ 0x20215054
.LCPI7_1:
	.long	539054144               @ 0x20215040
.Ltmp7:
	.size	hexstrings, .Ltmp7-hexstrings

	.globl	hexstring
	.align	2
	.type	hexstring,%function
hexstring:                              @ @hexstring
@ BB#0:
	push	{r11, lr}
	bl	hexstrings
.LBB8_1:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI8_0
	bl	GET32
	tst	r0, #32
	beq	.LBB8_1
@ BB#2:                                 @ %uart_putc.exit
	ldr	r0, .LCPI8_1
	mov	r1, #13
	bl	PUT32
.LBB8_3:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI8_0
	bl	GET32
	tst	r0, #32
	beq	.LBB8_3
@ BB#4:                                 @ %uart_putc.exit1
	ldr	r0, .LCPI8_1
	mov	r1, #10
	bl	PUT32
	pop	{r11, pc}
	.align	2
@ BB#5:
.LCPI8_0:
	.long	539054164               @ 0x20215054
.LCPI8_1:
	.long	539054144               @ 0x20215040
.Ltmp8:
	.size	hexstring, .Ltmp8-hexstring

	.globl	uart_init
	.align	2
	.type	uart_init,%function
uart_init:                              @ @uart_init
@ BB#0:
	push	{r4, r5, r11, lr}
	ldr	r0, .LCPI9_0
	mov	r1, #1
	bl	PUT32
	ldr	r5, .LCPI9_1
	mov	r1, #0
	mov	r4, #0
	mov	r0, r5
	bl	PUT32
	ldr	r0, .LCPI9_2
	mov	r1, #0
	bl	PUT32
	ldr	r0, .LCPI9_3
	mov	r1, #3
	bl	PUT32
	ldr	r0, .LCPI9_4
	mov	r1, #0
	bl	PUT32
	mov	r0, r5
	mov	r1, #0
	bl	PUT32
	ldr	r0, .LCPI9_5
	mov	r1, #198
	bl	PUT32
	ldr	r0, .LCPI9_6
	mov	r1, #14
	orr	r1, r1, #256
	bl	PUT32
	ldr	r5, .LCPI9_7
	mov	r0, r5
	bl	GET32
	bic	r0, r0, #258048
	orr	r1, r0, #73728
	mov	r0, r5
	bl	PUT32
	ldr	r0, .LCPI9_8
	mov	r1, #0
	bl	PUT32
.LBB9_1:                                @ =>This Inner Loop Header: Depth=1
	mov	r0, r4
	bl	dummy
	add	r4, r4, #1
	cmp	r4, #150
	bne	.LBB9_1
@ BB#2:
	ldr	r0, .LCPI9_9
	mov	r1, #49152
	bl	PUT32
	mov	r4, #0
.LBB9_3:                                @ =>This Inner Loop Header: Depth=1
	mov	r0, r4
	bl	dummy
	add	r4, r4, #1
	cmp	r4, #150
	bne	.LBB9_3
@ BB#4:
	ldr	r0, .LCPI9_9
	mov	r1, #0
	bl	PUT32
	ldr	r0, .LCPI9_2
	mov	r1, #3
	bl	PUT32
	pop	{r4, r5, r11, pc}
	.align	2
@ BB#5:
.LCPI9_0:
	.long	539054084               @ 0x20215004
.LCPI9_1:
	.long	539054148               @ 0x20215044
.LCPI9_2:
	.long	539054176               @ 0x20215060
.LCPI9_3:
	.long	539054156               @ 0x2021504c
.LCPI9_4:
	.long	539054160               @ 0x20215050
.LCPI9_5:
	.long	539054152               @ 0x20215048
.LCPI9_6:
	.long	539054184               @ 0x20215068
.LCPI9_7:
	.long	538968068               @ 0x20200004
.LCPI9_8:
	.long	538968212               @ 0x20200094
.LCPI9_9:
	.long	538968216               @ 0x20200098
.Ltmp9:
	.size	uart_init, .Ltmp9-uart_init

	.globl	compress2
	.align	2
	.type	compress2,%function
compress2:                              @ @compress2
@ BB#0:
	push	{r4, r5, r11, lr}
	sub	sp, sp, #72
	mov	r5, r1
	str	r2, [sp, #16]
	str	r3, [sp, #20]
	str	r0, [sp, #28]
	ldr	r2, [r5]
	ldr	r0, .LCPI10_0
	ldr	r1, [sp, #88]
	str	r2, [sp, #32]
	mov	r2, #0
	mov	r4, #8
	mov	r3, #56
	str	r2, [sp, #48]
	str	r2, [sp, #52]
	str	r4, [sp]
	str	r2, [sp, #4]
	str	r0, [sp, #8]
	str	r2, [sp, #56]
	str	r3, [sp, #12]
	add	r0, sp, #16
	mov	r2, #8
	mov	r3, #15
	bl	deflateInit2_
	mov	r4, r0
	cmp	r4, #0
	bne	.LBB10_43
@ BB#1:
	add	r0, sp, #16
	mov	r1, #4
	bl	deflate
	mov	r4, r0
	cmp	r4, #1
	bne	.LBB10_6
@ BB#2:
	ldr	r0, [sp, #36]
	mvn	r4, #1
	str	r0, [r5]
	ldr	r1, [sp, #44]
	cmp	r1, #0
	beq	.LBB10_43
@ BB#3:
	ldr	r5, [r1, #4]
	mov	r0, #153
	orr	r0, r0, #512
	cmp	r5, r0
	bhi	.LBB10_10
@ BB#4:
	cmp	r5, #68
	bhi	.LBB10_12
@ BB#5:
	cmp	r5, #42
	beq	.LBB10_23
	b	.LBB10_43
.LBB10_6:
	ldr	r1, [sp, #44]
	cmp	r1, #0
	beq	.LBB10_42
@ BB#7:
	ldr	r0, [r1, #4]
	mov	r2, #153
	orr	r2, r2, #512
	cmp	r0, r2
	bhi	.LBB10_11
@ BB#8:
	cmp	r0, #68
	bhi	.LBB10_16
@ BB#9:
	cmp	r0, #42
	beq	.LBB10_33
	b	.LBB10_42
.LBB10_10:
	mov	r0, #154
	orr	r0, r0, #512
	cmp	r5, r0
	bne	.LBB10_43
	b	.LBB10_23
.LBB10_11:
	mov	r2, #154
	orr	r2, r2, #512
	cmp	r0, r2
	bne	.LBB10_42
	b	.LBB10_33
.LBB10_12:
	cmp	r5, #112
	bhi	.LBB10_20
@ BB#13:
	cmp	r5, #102
	bhi	.LBB10_22
@ BB#14:
	sub	r0, r5, #69
	cmp	r0, #22
	bhi	.LBB10_43
@ BB#15:
	mov	r2, #17
	mov	r3, #1
	orr	r2, r2, #4194304
	tst	r2, r3, lsl r0
	bne	.LBB10_23
	b	.LBB10_43
.LBB10_16:
	cmp	r0, #112
	bhi	.LBB10_21
@ BB#17:
	cmp	r0, #102
	bhi	.LBB10_32
@ BB#18:
	sub	r0, r0, #69
	cmp	r0, #22
	bhi	.LBB10_42
@ BB#19:
	mov	r2, #17
	mov	r3, #1
	orr	r2, r2, #4194304
	tst	r2, r3, lsl r0
	bne	.LBB10_33
	b	.LBB10_42
.LBB10_20:
	cmp	r5, #113
	beq	.LBB10_23
	b	.LBB10_43
.LBB10_21:
	cmp	r0, #113
	beq	.LBB10_33
	b	.LBB10_42
.LBB10_22:
	cmp	r5, #103
	bne	.LBB10_43
.LBB10_23:
	ldr	r2, [r1, #8]
	cmp	r2, #0
	beq	.LBB10_25
@ BB#24:
	ldr	r3, [sp, #52]
	ldr	r0, [sp, #56]
	mov	r1, r2
	blx	r3
	ldr	r1, [sp, #44]
.LBB10_25:
	ldr	r2, [r1, #68]
	cmp	r2, #0
	beq	.LBB10_27
@ BB#26:
	ldr	r3, [sp, #52]
	ldr	r0, [sp, #56]
	mov	r1, r2
	blx	r3
	ldr	r1, [sp, #44]
.LBB10_27:
	ldr	r2, [r1, #64]
	cmp	r2, #0
	beq	.LBB10_29
@ BB#28:
	ldr	r3, [sp, #52]
	ldr	r0, [sp, #56]
	mov	r1, r2
	blx	r3
	ldr	r1, [sp, #44]
.LBB10_29:
	ldr	r2, [r1, #56]
	cmp	r2, #0
	beq	.LBB10_31
@ BB#30:
	ldr	r3, [sp, #52]
	ldr	r0, [sp, #56]
	mov	r1, r2
	blx	r3
	ldr	r1, [sp, #44]
.LBB10_31:                              @ %._crit_edge.i6
	ldr	r2, [sp, #52]
	ldr	r0, [sp, #56]
	blx	r2
	mov	r4, #0
	cmp	r5, #113
	str	r4, [sp, #44]
	mvneq	r4, #2
	b	.LBB10_43
.LBB10_32:
	cmp	r0, #103
	bne	.LBB10_42
.LBB10_33:
	ldr	r2, [r1, #8]
	cmp	r2, #0
	beq	.LBB10_35
@ BB#34:
	ldr	r3, [sp, #52]
	ldr	r0, [sp, #56]
	mov	r1, r2
	blx	r3
	ldr	r1, [sp, #44]
.LBB10_35:
	ldr	r2, [r1, #68]
	cmp	r2, #0
	beq	.LBB10_37
@ BB#36:
	ldr	r3, [sp, #52]
	ldr	r0, [sp, #56]
	mov	r1, r2
	blx	r3
	ldr	r1, [sp, #44]
.LBB10_37:
	ldr	r2, [r1, #64]
	cmp	r2, #0
	beq	.LBB10_39
@ BB#38:
	ldr	r3, [sp, #52]
	ldr	r0, [sp, #56]
	mov	r1, r2
	blx	r3
	ldr	r1, [sp, #44]
.LBB10_39:
	ldr	r2, [r1, #56]
	cmp	r2, #0
	beq	.LBB10_41
@ BB#40:
	ldr	r3, [sp, #52]
	ldr	r0, [sp, #56]
	mov	r1, r2
	blx	r3
	ldr	r1, [sp, #44]
.LBB10_41:                              @ %._crit_edge.i
	ldr	r2, [sp, #52]
	ldr	r0, [sp, #56]
	blx	r2
	mov	r0, #0
	str	r0, [sp, #44]
.LBB10_42:                              @ %deflateEnd.exit
	cmp	r4, #0
	mvneq	r4, #4
.LBB10_43:                              @ %deflateEnd.exit9
	mov	r0, r4
	add	sp, sp, #72
	pop	{r4, r5, r11, pc}
	.align	2
@ BB#44:
.LCPI10_0:
	.long	.L.str9
.Ltmp10:
	.size	compress2, .Ltmp10-compress2

	.globl	compress
	.align	2
	.type	compress,%function
compress:                               @ @compress
@ BB#0:
	push	{r11, lr}
	sub	sp, sp, #8
	mvn	r12, #0
	str	r12, [sp]
	bl	compress2
	add	sp, sp, #8
	pop	{r11, pc}
.Ltmp11:
	.size	compress, .Ltmp11-compress

	.globl	compressBound
	.align	2
	.type	compressBound,%function
compressBound:                          @ @compressBound
@ BB#0:
	add	r1, r0, r0, lsr #12
	add	r1, r1, r0, lsr #14
	add	r0, r1, r0, lsr #25
	add	r0, r0, #13
	bx	lr
.Ltmp12:
	.size	compressBound, .Ltmp12-compressBound

	.globl	deflateInit_
	.align	2
	.type	deflateInit_,%function
deflateInit_:                           @ @deflateInit_
@ BB#0:
	push	{r11, lr}
	sub	sp, sp, #16
	mov	lr, #8
	mov	r12, #0
	str	lr, [sp]
	str	r12, [sp, #4]
	str	r2, [sp, #8]
	str	r3, [sp, #12]
	mov	r2, #8
	mov	r3, #15
	bl	deflateInit2_
	add	sp, sp, #16
	pop	{r11, pc}
.Ltmp13:
	.size	deflateInit_, .Ltmp13-deflateInit_

	.globl	deflateInit2_
	.align	2
	.type	deflateInit2_,%function
deflateInit2_:                          @ @deflateInit2_
@ BB#0:
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	sub	sp, sp, #4
	mov	r5, r0
	ldr	r0, [sp, #48]
	mov	r11, r1
	mov	r7, r3
	mvn	r1, #5
	str	r1, [sp]                @ 4-byte Spill
	cmp	r0, #0
	beq	.LBB14_16
@ BB#1:
	ldrb	r0, [r0]
	cmp	r0, #49
	ldreq	r0, [sp, #52]
	cmpeq	r0, #56
	bne	.LBB14_16
@ BB#2:
	mvn	r0, #1
	str	r0, [sp]                @ 4-byte Spill
	cmp	r5, #0
	beq	.LBB14_16
@ BB#3:
	mov	r0, #0
	str	r0, [r5, #24]
	ldr	r3, [r5, #32]
	cmp	r3, #0
	ldreq	r3, .LCPI14_0
	streq	r3, [r5, #32]
	streq	r0, [r5, #40]
	ldr	r0, [r5, #36]
	cmp	r0, #0
	ldreq	r0, .LCPI14_1
	streq	r0, [r5, #36]
	ldr	r0, [sp, #40]
	cmn	r11, #1
	moveq	r11, #6
	cmp	r7, #0
	blt	.LBB14_5
@ BB#4:
	cmp	r7, #15
	mov	r9, #1
	movgt	r9, #2
	subgt	r7, r7, #16
	b	.LBB14_6
.LBB14_5:
	rsb	r7, r7, #0
	mov	r9, #0
.LBB14_6:
	mov	r1, r0
	mov	r6, r1
	sub	r0, r1, #1
	cmp	r0, #8
	bhi	.LBB14_16
@ BB#7:
	cmp	r2, #8
	bne	.LBB14_16
@ BB#8:
	sub	r0, r7, #8
	cmp	r0, #7
	bhi	.LBB14_16
@ BB#9:
	cmp	r11, #9
	ldrls	r0, [sp, #44]
	cmpls	r0, #4
	bhi	.LBB14_16
@ BB#10:
	ldr	r0, [r5, #40]
	mov	r2, #708
	orr	r2, r2, #5120
	mov	r1, #1
	mov	r10, #1
	blx	r3
	cmp	r7, #8
	mov	r4, r0
	moveq	r7, #9
	mvn	r0, #3
	str	r0, [sp]                @ 4-byte Spill
	cmp	r4, #0
	beq	.LBB14_16
@ BB#11:
	ldr	r0, .LCPI14_2
	mov	r8, r6
	add	r1, r8, #9
	mvn	r3, #0
	umull	r0, r6, r1, r0
	add	r0, r8, #7
	add	r12, r3, r10, lsl r7
	lsl	r1, r10, r7
	add	r3, r3, r10, lsl r0
	lsr	r6, r6, #1
	str	r4, [r5, #28]
	str	r5, [r4]
	str	r9, [r4, #24]
	mov	r9, #0
	lsl	r2, r10, r0
	add	lr, r4, #44
	str	r9, [r4, #28]
	stm	lr, {r1, r7, r12}
	add	lr, r4, #80
	str	r2, [r4, #76]
	stm	lr, {r0, r3, r6}
	ldr	r3, [r5, #32]
	ldr	r0, [r5, #40]
	mov	r2, #2
	blx	r3
	str	r0, [r4, #56]
	ldr	r3, [r5, #32]
	ldr	r0, [r5, #40]
	ldr	r1, [r4, #44]
	mov	r2, #2
	blx	r3
	str	r0, [r4, #64]
	ldr	r3, [r5, #32]
	ldr	r0, [r5, #40]
	ldr	r1, [r4, #76]
	mov	r2, #2
	blx	r3
	str	r0, [r4, #68]
	mov	r0, #5824
	add	r1, r8, #6
	str	r9, [r4, r0]
	mov	r0, #668
	lsl	r1, r10, r1
	orr	r0, r0, #5120
	mov	r6, r4
	mov	r2, #4
	str	r1, [r6, r0]!
	ldr	r3, [r5, #32]
	ldr	r0, [r5, #40]
	blx	r3
	str	r0, [r4, #8]
	ldr	r1, [r6]
	lsl	r2, r1, #2
	str	r2, [r4, #12]
	ldr	r2, [r4, #56]
	cmp	r2, #0
	beq	.LBB14_14
@ BB#12:
	ldr	r2, [r4, #64]
	cmp	r2, #0
	ldrne	r2, [r4, #68]
	cmpne	r2, #0
	beq	.LBB14_14
@ BB#13:
	cmp	r0, #0
	bne	.LBB14_15
.LBB14_14:
	ldr	r0, .LCPI14_3
	mov	r1, #154
	orr	r1, r1, #512
	str	r1, [r4, #4]
	str	r0, [r5, #24]
	mov	r0, r5
	bl	deflateEnd
	b	.LBB14_16
.LBB14_15:
	mov	r3, #676
	add	r2, r1, r1, lsl #1
	bic	r1, r1, #1
	orr	r3, r3, #5120
	add	r1, r0, r1
	str	r1, [r4, r3]
	mov	r1, #664
	orr	r1, r1, #5120
	add	r0, r0, r2
	str	r0, [r4, r1]
	ldr	r0, [sp, #44]
	str	r11, [r4, #132]
	str	r0, [r4, #136]
	mov	r0, #8
	strb	r0, [r4, #36]
	mov	r0, r5
	bl	deflateReset
	str	r0, [sp]                @ 4-byte Spill
.LBB14_16:
	pop	{r0}
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.align	2
@ BB#17:
.LCPI14_0:
	.long	zcalloc
.LCPI14_1:
	.long	zcfree
.LCPI14_2:
	.long	2863311531              @ 0xaaaaaaab
.LCPI14_3:
	.long	.L.str6
.Ltmp14:
	.size	deflateInit2_, .Ltmp14-deflateInit2_

	.globl	deflateEnd
	.align	2
	.type	deflateEnd,%function
deflateEnd:                             @ @deflateEnd
@ BB#0:
	push	{r4, r5, r11, lr}
	mov	r4, r0
	cmp	r4, #0
	ldrne	r1, [r4, #28]
	mvn	r0, #1
	cmpne	r1, #0
	beq	.LBB15_14
@ BB#1:
	ldr	r5, [r1, #4]
	mov	r2, #153
	orr	r2, r2, #512
	cmp	r5, r2
	bhi	.LBB15_4
@ BB#2:
	cmp	r5, #68
	bhi	.LBB15_15
@ BB#3:
	cmp	r5, #42
	beq	.LBB15_5
	b	.LBB15_14
.LBB15_4:
	mov	r2, #154
	orr	r2, r2, #512
	cmp	r5, r2
	popne	{r4, r5, r11, pc}
.LBB15_5:
	ldr	r2, [r1, #8]
	cmp	r2, #0
	beq	.LBB15_7
@ BB#6:
	ldr	r3, [r4, #36]
	ldr	r0, [r4, #40]
	mov	r1, r2
	blx	r3
	ldr	r1, [r4, #28]
.LBB15_7:
	ldr	r2, [r1, #68]
	cmp	r2, #0
	beq	.LBB15_9
@ BB#8:
	ldr	r3, [r4, #36]
	ldr	r0, [r4, #40]
	mov	r1, r2
	blx	r3
	ldr	r1, [r4, #28]
.LBB15_9:
	ldr	r2, [r1, #64]
	cmp	r2, #0
	beq	.LBB15_11
@ BB#10:
	ldr	r3, [r4, #36]
	ldr	r0, [r4, #40]
	mov	r1, r2
	blx	r3
	ldr	r1, [r4, #28]
.LBB15_11:
	ldr	r2, [r1, #56]
	cmp	r2, #0
	beq	.LBB15_13
@ BB#12:
	ldr	r3, [r4, #36]
	ldr	r0, [r4, #40]
	mov	r1, r2
	blx	r3
	ldr	r1, [r4, #28]
.LBB15_13:
	ldr	r2, [r4, #36]
	ldr	r0, [r4, #40]
	blx	r2
	mov	r0, #0
	cmp	r5, #113
	str	r0, [r4, #28]
	mvneq	r0, #2
.LBB15_14:
	pop	{r4, r5, r11, pc}
.LBB15_15:
	cmp	r5, #112
	bhi	.LBB15_19
@ BB#16:
	cmp	r5, #102
	bhi	.LBB15_20
@ BB#17:
	sub	r2, r5, #69
	cmp	r2, #22
	bhi	.LBB15_14
@ BB#18:
	mov	r12, #17
	mov	r3, #1
	orr	r12, r12, #4194304
	tst	r12, r3, lsl r2
	bne	.LBB15_5
	b	.LBB15_14
.LBB15_19:
	cmp	r5, #113
	beq	.LBB15_5
	b	.LBB15_14
.LBB15_20:
	cmp	r5, #103
	beq	.LBB15_5
	b	.LBB15_14
.Ltmp15:
	.size	deflateEnd, .Ltmp15-deflateEnd

	.globl	deflateReset
	.align	2
	.type	deflateReset,%function
deflateReset:                           @ @deflateReset
@ BB#0:
	push	{r4, r5, r6, lr}
	mov	r5, r0
	bl	deflateResetKeep
	mov	r4, r0
	cmp	r4, #0
	bne	.LBB16_4
@ BB#1:
	ldr	r5, [r5, #28]
	mov	r6, #0
	ldr	r0, [r5, #44]
	lsl	r0, r0, #1
	str	r0, [r5, #60]
	ldr	r1, [r5, #76]
	ldr	r0, [r5, #68]
	add	r0, r0, r1, lsl #1
	mvn	r1, #1
	strh	r6, [r0, #-2]
	ldr	r0, [r5, #76]
	add	r1, r1, r0, lsl #1
	cmp	r1, #0
	beq	.LBB16_3
@ BB#2:                                 @ %.lr.ph.i.i
	ldr	r0, [r5, #68]
	mov	r2, #0
	bl	__aeabi_memset
.LBB16_3:                               @ %lm_init.exit
	ldr	r0, [r5, #132]
	add	r1, r0, r0, lsl #1
	ldr	r0, .LCPI16_0
	lsl	r1, r1, #2
	ldrh	r1, [r0, r1]!
	ldrh	r3, [r0, #2]
	ldrh	r2, [r0, #6]
	ldrh	r0, [r0, #4]
	str	r3, [r5, #128]
	str	r1, [r5, #140]
	str	r0, [r5, #144]
	mov	r0, #692
	orr	r0, r0, #5120
	str	r2, [r5, #124]
	str	r6, [r5, #108]
	str	r6, [r5, #92]
	str	r6, [r5, #116]
	str	r6, [r5, r0]
	mov	r0, #2
	str	r0, [r5, #120]
	str	r0, [r5, #96]
	str	r6, [r5, #104]
	str	r6, [r5, #72]
.LBB16_4:
	mov	r0, r4
	pop	{r4, r5, r6, pc}
	.align	2
@ BB#5:
.LCPI16_0:
	.long	configuration_table
.Ltmp16:
	.size	deflateReset, .Ltmp16-deflateReset

	.globl	deflateSetDictionary
	.align	2
	.type	deflateSetDictionary,%function
deflateSetDictionary:                   @ @deflateSetDictionary
@ BB#0:
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	sub	sp, sp, #4
	mov	r11, r0
	cmp	r11, #0
	ldrne	r5, [r11, #28]
	mov	r9, r2
	mov	r6, r1
	mvn	r0, #1
	cmpne	r5, #0
	beq	.LBB17_20
@ BB#1:
	cmp	r6, #0
	ldrne	r8, [r5, #24]
	cmpne	r8, #2
	beq	.LBB17_20
@ BB#2:
	cmp	r8, #1
	bne	.LBB17_4
@ BB#3:
	ldr	r1, [r5, #4]
	cmp	r1, #42
	bne	.LBB17_20
.LBB17_4:
	ldr	r1, [r5, #116]
	cmp	r1, #0
	bne	.LBB17_20
@ BB#5:
	cmp	r8, #1
	bne	.LBB17_7
@ BB#6:
	ldr	r0, [r11, #48]
	mov	r1, r6
	mov	r2, r9
	bl	adler32
	str	r0, [r11, #48]
.LBB17_7:
	mov	r0, #0
	str	r0, [r5, #24]
	ldr	r0, [r5, #44]
	cmp	r0, r9
	bls	.LBB17_9
@ BB#8:
	mov	r0, r9
	b	.LBB17_14
.LBB17_9:
	cmp	r8, #0
	bne	.LBB17_13
@ BB#10:
	ldr	r1, [r5, #76]
	ldr	r0, [r5, #68]
	mov	r7, #0
	add	r0, r0, r1, lsl #1
	mvn	r1, #1
	strh	r7, [r0, #-2]
	ldr	r0, [r5, #76]
	add	r1, r1, r0, lsl #1
	cmp	r1, #0
	beq	.LBB17_12
@ BB#11:                                @ %.lr.ph.i
	ldr	r0, [r5, #68]
	mov	r2, #0
	bl	__aeabi_memset
.LBB17_12:                              @ %ZMEMSET.exit
	mov	r0, #692
	orr	r0, r0, #5120
	str	r7, [r5, #108]
	str	r7, [r5, #92]
	str	r7, [r5, r0]
	ldr	r0, [r5, #44]
.LBB17_13:
	sub	r1, r9, r0
	add	r6, r6, r1
.LBB17_14:
	ldr	r1, [r11]
	ldr	r10, [r11, #4]
	str	r6, [r11]
	str	r0, [r11, #4]
	mov	r0, r5
	str	r1, [sp]                @ 4-byte Spill
	bl	fill_window
	ldr	r1, [r5, #116]
	ldr	r0, [r5, #108]
	cmp	r1, #3
	blo	.LBB17_19
@ BB#15:                                @ %.lr.ph
	mov	r9, #2
.LBB17_16:                              @ =>This Loop Header: Depth=1
                                        @     Child Loop BB17_17 Depth 2
	rsb	r2, r1, #2
	sub	r12, r1, #2
	mov	r3, r0
.LBB17_17:                              @   Parent Loop BB17_16 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r6, [r5, #56]
	ldr	r1, [r5, #88]
	ldr	r7, [r5, #72]
	add	r6, r6, r3
	ldr	r4, [r5, #84]
	ldrb	r6, [r6, #2]
	adds	r2, r2, #1
	eor	r1, r6, r7, lsl r1
	and	r7, r1, r4
	str	r7, [r5, #72]
	ldr	r1, [r5, #68]
	ldr	r6, [r5, #52]
	add	r1, r1, r7, lsl #1
	ldr	r4, [r5, #64]
	and	r7, r6, r3
	add	r7, r4, r7, lsl #1
	ldrh	r1, [r1]
	strh	r1, [r7]
	ldr	r7, [r5, #72]
	ldr	r1, [r5, #68]
	add	r1, r1, r7, lsl #1
	strh	r3, [r1]
	add	r3, r3, #1
	bne	.LBB17_17
@ BB#18:                                @   in Loop: Header=BB17_16 Depth=1
	add	r0, r12, r0
	str	r0, [r5, #108]
	mov	r0, r5
	str	r9, [r5, #116]
	bl	fill_window
	ldr	r1, [r5, #116]
	ldr	r0, [r5, #108]
	cmp	r1, #2
	bhi	.LBB17_16
.LBB17_19:                              @ %._crit_edge
	add	r0, r0, r1
	str	r0, [r5, #108]
	str	r0, [r5, #92]
	mov	r0, #692
	orr	r0, r0, #5120
	str	r1, [r5, r0]
	mov	r0, #0
	mov	r1, #2
	str	r0, [r5, #116]
	str	r1, [r5, #120]
	str	r1, [r5, #96]
	ldr	r1, [sp]                @ 4-byte Reload
	str	r0, [r5, #104]
	stm	r11, {r1, r10}
	str	r8, [r5, #24]
.LBB17_20:
	add	sp, sp, #4
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
.Ltmp17:
	.size	deflateSetDictionary, .Ltmp17-deflateSetDictionary

	.align	2
	.type	fill_window,%function
fill_window:                            @ @fill_window
@ BB#0:
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	sub	sp, sp, #4
	mov	r4, r0
	ldr	r1, .LCPI18_0
	ldr	r6, [r4, #44]
	ldr	r0, [r4, #116]
	add	r2, r4, #692
	add	r10, r2, #5120
	add	r8, r6, r1
	sub	r9, r6, #1
	mov	r2, r6
	b	.LBB18_2
.LBB18_1:                               @ %._crit_edge85
                                        @   in Loop: Header=BB18_2 Depth=1
	ldr	r2, [r4, #44]
.LBB18_2:                               @ =>This Loop Header: Depth=1
                                        @     Child Loop BB18_5 Depth 2
                                        @     Child Loop BB18_8 Depth 2
                                        @     Child Loop BB18_10 Depth 2
                                        @     Child Loop BB18_16 Depth 2
                                        @     Child Loop BB18_25 Depth 2
	ldr	r3, [r4, #60]
	ldr	r1, [r4, #108]
	add	r2, r8, r2
	sub	r0, r3, r0
	sub	r0, r0, r1
	cmp	r1, r2
	blo	.LBB18_12
@ BB#3:                                 @   in Loop: Header=BB18_2 Depth=1
	cmp	r6, #0
	beq	.LBB18_7
@ BB#4:                                 @ %.lr.ph.i.preheader
                                        @   in Loop: Header=BB18_2 Depth=1
	ldr	r1, [r4, #56]
	mov	r3, #0
	add	r2, r1, r6
.LBB18_5:                               @ %.lr.ph.i
                                        @   Parent Loop BB18_2 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldrb	r7, [r2, -r3]
	strb	r7, [r1, -r3]
	sub	r3, r3, #1
	adds	r7, r6, r3
	bne	.LBB18_5
@ BB#6:                                 @ %ZMEMCPY.exit.loopexit
                                        @   in Loop: Header=BB18_2 Depth=1
	ldr	r1, [r4, #108]
.LBB18_7:                               @ %ZMEMCPY.exit
                                        @   in Loop: Header=BB18_2 Depth=1
	ldr	r2, [r4, #112]
	sub	r1, r1, r6
	str	r1, [r4, #108]
	sub	r2, r2, r6
	str	r2, [r4, #112]
	ldr	r1, [r4, #92]
	sub	r1, r1, r6
	str	r1, [r4, #92]
	ldr	r1, [r4, #76]
	ldr	r2, [r4, #68]
	add	r2, r2, r1, lsl #1
	sub	r2, r2, #2
.LBB18_8:                               @   Parent Loop BB18_2 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldrh	r7, [r2]
	mov	r3, #0
	cmp	r7, r6
	subhs	r3, r7, r6
	strh	r3, [r2], #-2
	subs	r1, r1, #1
	bne	.LBB18_8
@ BB#9:                                 @   in Loop: Header=BB18_2 Depth=1
	ldr	r1, [r4, #64]
	mov	r2, r6
	add	r1, r1, r9, lsl #1
.LBB18_10:                              @   Parent Loop BB18_2 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldrh	r7, [r1]
	mov	r3, #0
	cmp	r7, r6
	subhs	r3, r7, r6
	strh	r3, [r1], #-2
	subs	r2, r2, #1
	bne	.LBB18_10
@ BB#11:                                @   in Loop: Header=BB18_2 Depth=1
	add	r0, r0, r6
.LBB18_12:                              @ %._crit_edge
                                        @   in Loop: Header=BB18_2 Depth=1
	ldr	r7, [r4]
	ldr	r2, [r7, #4]
	cmp	r2, #0
	beq	.LBB18_28
@ BB#13:                                @   in Loop: Header=BB18_2 Depth=1
	ldr	r1, [r4, #116]
	cmp	r2, r0
	mov	r11, r2
	movhi	r11, r0
	cmp	r11, #0
	bne	.LBB18_15
@ BB#14:                                @   in Loop: Header=BB18_2 Depth=1
	mov	r11, #0
	b	.LBB18_23
.LBB18_15:                              @   in Loop: Header=BB18_2 Depth=1
	ldr	r5, [r4, #108]
	ldr	r3, [r4, #56]
	mvn	r0, r0
	add	r1, r1, r5
	add	r1, r3, r1
	sub	r3, r2, r11
	mvn	r2, r2
	cmp	r0, r2
	str	r3, [r7, #4]
	movhi	r2, r0
	ldr	r0, [r7]
	mvn	r2, r2
	mov	r3, r1
.LBB18_16:                              @ %.lr.ph.i.i
                                        @   Parent Loop BB18_2 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldrb	r5, [r0], #1
	subs	r2, r2, #1
	strb	r5, [r3], #1
	bne	.LBB18_16
@ BB#17:                                @ %ZMEMCPY.exit.i
                                        @   in Loop: Header=BB18_2 Depth=1
	ldr	r0, [r7, #28]
	ldr	r0, [r0, #24]
	cmp	r0, #2
	bne	.LBB18_19
@ BB#18:                                @   in Loop: Header=BB18_2 Depth=1
	ldr	r0, [r7, #48]
	mov	r2, r11
	bl	crc32
	b	.LBB18_21
.LBB18_19:                              @ %ZMEMCPY.exit.i
                                        @   in Loop: Header=BB18_2 Depth=1
	cmp	r0, #1
	bne	.LBB18_22
@ BB#20:                                @   in Loop: Header=BB18_2 Depth=1
	ldr	r0, [r7, #48]
	mov	r2, r11
	bl	adler32
.LBB18_21:                              @   in Loop: Header=BB18_2 Depth=1
	str	r0, [r7, #48]
.LBB18_22:                              @   in Loop: Header=BB18_2 Depth=1
	ldr	r0, [r7]
	add	r0, r0, r11
	str	r0, [r7]
	ldr	r0, [r7, #8]
	add	r0, r0, r11
	str	r0, [r7, #8]
	ldr	r1, [r4, #116]
.LBB18_23:                              @ %read_buf.exit
                                        @   in Loop: Header=BB18_2 Depth=1
	add	r0, r1, r11
	str	r0, [r4, #116]
	ldr	r2, [r10]
	add	r1, r0, r2
	cmp	r1, #3
	blo	.LBB18_26
@ BB#24:                                @   in Loop: Header=BB18_2 Depth=1
	ldr	r1, [r4, #108]
	ldr	r3, [r4, #56]
	sub	r1, r1, r2
	ldrb	r7, [r3, r1]!
	str	r7, [r4, #72]
	ldr	r5, [r4, #88]
	ldrb	r3, [r3, #1]
	ldr	r12, [r4, #84]
	eor	r3, r3, r7, lsl r5
	and	r3, r3, r12
	str	r3, [r4, #72]
.LBB18_25:                              @   Parent Loop BB18_2 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	cmp	r2, #0
	ldrne	r3, [r4, #56]
	ldrne	r7, [r4, #88]
	ldrne	r0, [r4, #72]
	addne	r3, r3, r1
	ldrne	r2, [r4, #84]
	ldrbne	r3, [r3, #2]
	eorne	r0, r3, r0, lsl r7
	andne	r0, r0, r2
	strne	r0, [r4, #72]
	ldrne	r7, [r4, #68]
	ldrne	r2, [r4, #52]
	addne	r0, r7, r0, lsl #1
	ldrne	r3, [r4, #64]
	andne	r2, r2, r1
	addne	r2, r3, r2, lsl #1
	ldrhne	r0, [r0]
	strhne	r0, [r2]
	ldrne	r2, [r4, #72]
	ldrne	r0, [r4, #68]
	addne	r0, r0, r2, lsl #1
	strhne	r1, [r0]
	ldrne	r0, [r10]
	addne	r1, r1, #1
	subne	r2, r0, #1
	strne	r2, [r10]
	ldrne	r0, [r4, #116]
	addne	r3, r0, r2
	cmpne	r3, #2
	bhi	.LBB18_25
.LBB18_26:                              @ %thread-pre-split
                                        @   in Loop: Header=BB18_2 Depth=1
	lsr	r1, r0, #1
	cmp	r1, #130
	bhi	.LBB18_28
@ BB#27:                                @   in Loop: Header=BB18_2 Depth=1
	ldr	r1, [r4]
	ldr	r1, [r1, #4]
	cmp	r1, #0
	bne	.LBB18_1
.LBB18_28:                              @ %.critedge
	mov	r0, #5824
	mov	r6, r4
	ldr	r1, [r4, #60]
	ldr	r0, [r6, r0]!
	cmp	r0, r1
	bhs	.LBB18_38
@ BB#29:
	ldr	r2, [r4, #108]
	ldr	r3, [r4, #116]
	add	r7, r3, r2
	cmp	r0, r7
	bhs	.LBB18_33
@ BB#30:
	mov	r0, #2
	sub	r5, r1, r7
	orr	r0, r0, #256
	cmp	r5, r0
	movhi	r5, r0
	cmp	r5, #0
	beq	.LBB18_32
@ BB#31:                                @ %.lr.ph.i3
	ldr	r0, [r4, #56]
	mov	r1, r5
	mov	r2, #0
	add	r0, r0, r7
	bl	__aeabi_memset
.LBB18_32:                              @ %ZMEMSET.exit4
	add	r0, r5, r7
	b	.LBB18_37
.LBB18_33:
	add	r2, r7, #2
	add	r2, r2, #256
	cmp	r0, r2
	bhs	.LBB18_38
@ BB#34:
	sub	r1, r1, r0
	sub	r5, r2, r0
	cmp	r5, r1
	movhi	r5, r1
	cmp	r5, #0
	beq	.LBB18_36
@ BB#35:                                @ %.lr.ph.i2
	ldr	r1, [r4, #56]
	mov	r2, #0
	add	r0, r1, r0
	mov	r1, r5
	bl	__aeabi_memset
	ldr	r0, [r6]
.LBB18_36:                              @ %ZMEMSET.exit
	add	r0, r0, r5
.LBB18_37:                              @ %ZMEMSET.exit
	str	r0, [r6]
.LBB18_38:
	add	sp, sp, #4
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.align	2
@ BB#39:
.LCPI18_0:
	.long	4294967034              @ 0xfffffefa
.Ltmp18:
	.size	fill_window, .Ltmp18-fill_window

	.globl	deflateResetKeep
	.align	2
	.type	deflateResetKeep,%function
deflateResetKeep:                       @ @deflateResetKeep
@ BB#0:
	push	{r4, lr}
	mov	r1, r0
	cmp	r1, #0
	ldrne	r0, [r1, #28]
	mvn	r4, #1
	cmpne	r0, #0
	beq	.LBB19_3
@ BB#1:
	ldr	r2, [r1, #32]
	cmp	r2, #0
	ldrne	r2, [r1, #36]
	cmpne	r2, #0
	beq	.LBB19_3
@ BB#2:
	mov	r4, #0
	mov	r2, #2
	str	r4, [r1, #20]
	str	r4, [r1, #8]
	str	r4, [r1, #24]
	str	r2, [r1, #44]
	str	r4, [r0, #20]
	ldr	r2, [r0, #8]
	ldr	r12, .LCPI19_0
	str	r2, [r0, #16]
	ldr	r3, [r0, #24]
	mov	r2, #113
	cmp	r3, #0
	rsblt	r3, r3, #0
	strlt	r3, [r0, #24]
	cmp	r3, #0
	movne	r2, #42
	cmp	r3, #2
	mov	r3, #0
	movne	r3, #1
	str	r2, [r0, #4]
	str	r3, [r1, #48]
	add	r1, r0, #148
	str	r4, [r0, #40]
	str	r1, [r0, #2840]
	add	r1, r0, #392
	add	r1, r1, #2048
	str	r12, [r0, #2848]
	str	r1, [r0, #2852]
	add	r3, r12, #40
	add	r1, r12, #20
	str	r3, [r0, #2872]
	str	r1, [r0, #2860]
	mov	r1, #696
	add	r2, r0, #636
	orr	r1, r1, #5120
	add	r2, r2, #2048
	str	r2, [r0, #2864]
	strh	r4, [r0, r1]
	mov	r1, #700
	orr	r1, r1, #5120
	str	r4, [r0, r1]
	bl	init_block
.LBB19_3:
	mov	r0, r4
	pop	{r4, pc}
	.align	2
@ BB#4:
.LCPI19_0:
	.long	_MergedGlobals
.Ltmp19:
	.size	deflateResetKeep, .Ltmp19-deflateResetKeep

	.globl	deflateSetHeader
	.align	2
	.type	deflateSetHeader,%function
deflateSetHeader:                       @ @deflateSetHeader
@ BB#0:
	mov	r2, r0
	cmp	r2, #0
	ldrne	r2, [r2, #28]
	mvn	r0, #1
	cmpne	r2, #0
	beq	.LBB20_2
@ BB#1:
	ldr	r3, [r2, #24]
	cmp	r3, #2
	moveq	r0, #0
	streq	r1, [r2, #28]
.LBB20_2:
	bx	lr
.Ltmp20:
	.size	deflateSetHeader, .Ltmp20-deflateSetHeader

	.globl	deflatePending
	.align	2
	.type	deflatePending,%function
deflatePending:                         @ @deflatePending
@ BB#0:
	mov	r3, r0
	cmp	r3, #0
	ldrne	r12, [r3, #28]
	mvn	r0, #1
	cmpne	r12, #0
	beq	.LBB21_2
@ BB#1:
	cmp	r1, #0
	ldrne	r0, [r12, #20]
	strne	r0, [r1]
	mov	r0, #0
	cmp	r2, #0
	bxeq	lr
	ldr	r1, [r3, #28]
	mov	r3, #700
	orr	r3, r3, #5120
	ldr	r1, [r1, r3]
	str	r1, [r2]
.LBB21_2:
	bx	lr
.Ltmp21:
	.size	deflatePending, .Ltmp21-deflatePending

	.globl	deflatePrime
	.align	2
	.type	deflatePrime,%function
deflatePrime:                           @ @deflatePrime
@ BB#0:
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, r0
	cmp	r3, #0
	ldrne	r3, [r3, #28]
	mvn	r0, #1
	cmpne	r3, #0
	beq	.LBB22_7
@ BB#1:
	mov	r0, #676
	orr	r0, r0, #5120
	ldr	r6, [r3, #16]
	ldr	r7, [r3, r0]
	add	r6, r6, #2
	mvn	r0, #4
	cmp	r7, r6
	poplo	{r4, r5, r6, r7, r8, pc}
	mov	r0, #700
	mov	r7, #696
	orr	r0, r0, #5120
	orr	r7, r7, #5120
	mov	r12, r3
	mov	lr, r3
	ldrh	r6, [r12, r7]!
	ldr	r7, [lr, r0]!
	mov	r8, #1
	mvn	r5, #0
.LBB22_2:                               @ =>This Inner Loop Header: Depth=1
	rsb	r0, r7, #16
	cmp	r0, r1
	movgt	r0, r1
	uxth	r6, r6
	add	r4, r5, r8, lsl r0
	and	r4, r4, r2
	orr	r6, r6, r4, lsl r7
	add	r7, r7, r0
	strh	r6, [r12]
	str	r7, [lr]
	cmp	r7, #16
	bne	.LBB22_4
@ BB#3:                                 @   in Loop: Header=BB22_2 Depth=1
	ldr	r7, [r3, #20]
	add	r4, r7, #1
	str	r4, [r3, #20]
	ldr	r4, [r3, #8]
	strb	r6, [r4, r7]
	ldr	r6, [r3, #20]
	ldrb	r7, [r12, #1]
	add	r4, r6, #1
	str	r4, [r3, #20]
	ldr	r4, [r3, #8]
	strb	r7, [r4, r6]
	mov	r6, #0
	strh	r6, [r12]
	str	r6, [lr]
	mov	r7, r6
	b	.LBB22_6
.LBB22_4:                               @   in Loop: Header=BB22_2 Depth=1
	cmp	r7, #8
	blt	.LBB22_6
@ BB#5:                                 @   in Loop: Header=BB22_2 Depth=1
	ldr	r7, [r3, #20]
	add	r4, r7, #1
	str	r4, [r3, #20]
	ldr	r4, [r3, #8]
	strb	r6, [r4, r7]
	ldrh	r4, [r12]
	lsr	r6, r4, #8
	strh	r6, [r12]
	ldr	r4, [lr]
	sub	r7, r4, #8
	str	r7, [lr]
.LBB22_6:                               @ %_tr_flush_bits.exit
                                        @   in Loop: Header=BB22_2 Depth=1
	asr	r2, r2, r0
	subs	r1, r1, r0
	mov	r0, #0
	bne	.LBB22_2
.LBB22_7:                               @ %.loopexit
	pop	{r4, r5, r6, r7, r8, pc}
.Ltmp22:
	.size	deflatePrime, .Ltmp22-deflatePrime

	.globl	deflateParams
	.align	2
	.type	deflateParams,%function
deflateParams:                          @ @deflateParams
@ BB#0:
	push	{r4, r5, r6, lr}
	mov	r5, r1
	mov	r1, r0
	cmp	r1, #0
	ldrne	r6, [r1, #28]
	mov	r4, r2
	mvn	r0, #1
	cmpne	r6, #0
	beq	.LBB23_9
@ BB#1:
	cmn	r5, #1
	moveq	r5, #6
	cmp	r5, #9
	cmpls	r4, #4
	bhi	.LBB23_9
@ BB#2:
	ldr	r0, [r6, #136]
	cmp	r0, r4
	bne	.LBB23_4
@ BB#3:
	ldr	r0, [r6, #132]
	add	r2, r5, r5, lsl #1
	ldr	r3, .LCPI23_0
	add	r0, r0, r0, lsl #1
	add	r2, r3, r2, lsl #2
	add	r0, r3, r0, lsl #2
	ldr	r2, [r2, #8]
	ldr	r3, [r0, #8]
	mov	r0, #0
	cmp	r3, r2
	beq	.LBB23_6
.LBB23_4:
	ldr	r2, [r1, #8]
	mov	r0, #0
	cmp	r2, #0
	beq	.LBB23_6
@ BB#5:
	mov	r0, r1
	mov	r1, #5
	bl	deflate
.LBB23_6:                               @ %._crit_edge
	ldr	r1, [r6, #132]
	cmp	r1, r5
	beq	.LBB23_8
@ BB#7:
	add	r2, r5, r5, lsl #1
	ldr	r1, .LCPI23_0
	lsl	r2, r2, #2
	ldrh	r2, [r1, r2]!
	str	r5, [r6, #132]
	ldrh	r5, [r1, #2]
	ldrh	r3, [r1, #6]
	ldrh	r1, [r1, #4]
	str	r5, [r6, #128]
	str	r2, [r6, #140]
	str	r1, [r6, #144]
	str	r3, [r6, #124]
.LBB23_8:
	str	r4, [r6, #136]
.LBB23_9:
	pop	{r4, r5, r6, pc}
	.align	2
@ BB#10:
.LCPI23_0:
	.long	configuration_table
.Ltmp23:
	.size	deflateParams, .Ltmp23-deflateParams

	.globl	deflate
	.align	2
	.type	deflate,%function
deflate:                                @ @deflate
@ BB#0:
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	sub	sp, sp, #12
	mov	r9, r0
	cmp	r9, #0
	ldrne	r4, [r9, #28]
	mvn	r0, #1
	cmpne	r4, #0
	beq	.LBB24_181
@ BB#1:
	cmp	r1, #5
	bhi	.LBB24_181
@ BB#2:
	ldr	r2, [r9, #12]
	cmp	r2, #0
	beq	.LBB24_19
@ BB#3:
	ldr	r2, [r9]
	cmp	r2, #0
	bne	.LBB24_5
@ BB#4:
	ldr	r2, [r9, #4]
	cmp	r2, #0
	bne	.LBB24_19
.LBB24_5:
	ldr	r2, [r4, #4]
	mov	r11, #154
	orr	r11, r11, #512
	cmp	r2, r11
	bne	.LBB24_7
@ BB#6:
	cmp	r1, #4
	bne	.LBB24_19
.LBB24_7:
	ldr	r0, [r9, #16]
	cmp	r0, #0
	beq	.LBB24_98
@ BB#8:
	str	r9, [r4]
	ldr	r8, [r4, #40]
	mov	r10, r1
	str	r1, [r4, #40]
	cmp	r2, #42
	bne	.LBB24_26
@ BB#9:
	ldr	r0, [r4, #24]
	cmp	r0, #2
	bne	.LBB24_20
@ BB#10:
	mov	r0, #0
	str	r0, [r9, #48]
	ldr	r1, [r4, #20]
	mov	r3, #31
	mov	r6, r4
	add	r2, r1, #1
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	strb	r3, [r2, r1]
	ldr	r1, [r4, #20]
	mov	r3, #139
	add	r2, r1, #1
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	strb	r3, [r2, r1]
	ldr	r1, [r4, #20]
	mov	r3, #8
	add	r2, r1, #1
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	strb	r3, [r2, r1]
	ldr	r2, [r6, #28]!
	cmp	r2, #0
	beq	.LBB24_39
@ BB#11:
	ldr	r0, [r2]
	ldr	r5, [r2, #16]
	ldr	r3, [r2, #28]
	ldr	r1, [r2, #36]
	ldr	r7, [r2, #44]
	ldr	r2, [r4, #20]
	cmp	r0, #0
	movne	r0, #1
	cmp	r7, #0
	add	r7, r2, #1
	orrne	r0, r0, #2
	cmp	r5, #0
	str	r7, [r4, #20]
	orrne	r0, r0, #4
	cmp	r3, #0
	ldr	r3, [r4, #8]
	orrne	r0, r0, #8
	cmp	r1, #0
	orrne	r0, r0, #16
	strb	r0, [r3, r2]
	ldr	r1, [r6]
	ldr	r0, [r4, #20]
	add	r2, r0, #1
	ldr	r1, [r1, #4]
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	strb	r1, [r2, r0]
	ldr	r1, [r6]
	ldr	r0, [r4, #20]
	ldr	r1, [r1, #4]
	add	r2, r0, #1
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	lsr	r1, r1, #8
	strb	r1, [r2, r0]
	ldr	r1, [r6]
	ldr	r0, [r4, #20]
	add	r2, r0, #1
	ldrh	r1, [r1, #6]
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	strb	r1, [r2, r0]
	ldr	r1, [r6]
	ldr	r0, [r4, #20]
	add	r2, r0, #1
	ldrb	r1, [r1, #7]
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	strb	r1, [r2, r0]
	ldr	r1, [r4, #132]
	mov	r0, #2
	cmp	r1, #9
	beq	.LBB24_14
@ BB#12:
	ldr	r2, [r4, #136]
	mov	r0, #4
	cmp	r2, #1
	bgt	.LBB24_14
@ BB#13:
	mov	r0, #0
	cmp	r1, #2
	movlt	r0, #4
.LBB24_14:
	ldr	r1, [r4, #20]
	add	r2, r1, #1
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	strb	r0, [r2, r1]
	ldr	r1, [r4, #28]
	ldr	r0, [r4, #20]
	add	r2, r0, #1
	ldr	r1, [r1, #12]
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	strb	r1, [r2, r0]
	ldr	r0, [r4, #28]
	ldr	r1, [r0, #16]
	cmp	r1, #0
	beq	.LBB24_16
@ BB#15:
	ldr	r1, [r4, #20]
	ldr	r0, [r0, #20]
	add	r2, r1, #1
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	strb	r0, [r2, r1]
	ldr	r1, [r4, #28]
	ldr	r0, [r4, #20]
	ldr	r1, [r1, #20]
	add	r2, r0, #1
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	lsr	r1, r1, #8
	strb	r1, [r2, r0]
	ldr	r0, [r4, #28]
.LBB24_16:
	ldr	r0, [r0, #44]
	cmp	r0, #0
	beq	.LBB24_18
@ BB#17:
	ldr	r1, [r4, #8]
	ldr	r2, [r4, #20]
	ldr	r0, [r9, #48]
	bl	crc32
	str	r0, [r9, #48]
.LBB24_18:                              @ %.thread
	mov	r0, #0
	mov	r1, #69
	str	r0, [r4, #32]
	str	r1, [r4, #4]
	b	.LBB24_28
.LBB24_19:
	ldr	r1, .LCPI24_5
	str	r1, [r9, #24]
	add	sp, sp, #12
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
.LBB24_20:
	ldr	r3, [r4, #136]
	ldr	r0, [r4, #48]
	ldr	r1, .LCPI24_0
	mov	r2, #0
	cmp	r3, #1
	bgt	.LBB24_23
@ BB#21:
	ldr	r3, [r4, #132]
	cmp	r3, #2
	movge	r2, #64
	cmpge	r3, #6
	blt	.LBB24_23
@ BB#22:
	mov	r2, #192
	moveq	r2, #128
.LBB24_23:
	add	r0, r1, r0, lsl #12
	ldr	r1, [r4, #108]
	mov	r3, #113
	orr	r0, r2, r0
	cmp	r1, #0
	ldr	r1, .LCPI24_1
	str	r3, [r4, #4]
	orrne	r0, r0, #32
	ldr	r3, [r4, #20]
	umull	r2, r1, r0, r1
	add	r7, r3, #1
	sub	r2, r0, r1
	str	r7, [r4, #20]
	add	r1, r1, r2, lsr #1
	ldr	r5, [r4, #8]
	lsr	r6, r0, #8
	lsr	r2, r1, #4
	strb	r6, [r5, r3]
	lsl	r7, r2, #5
	ldr	r2, [r4, #20]
	sub	r1, r7, r1, lsr #4
	add	r3, r2, #1
	str	r3, [r4, #20]
	sub	r3, r0, r1
	ldr	r1, [r4, #8]
	orr	r0, r0, r3
	eor	r0, r0, #31
	strb	r0, [r1, r2]
	ldr	r0, [r4, #108]
	cmp	r0, #0
	beq	.LBB24_25
@ BB#24:
	ldr	r1, [r4, #20]
	ldr	r0, [r9, #48]
	add	r2, r1, #1
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	lsr	r3, r0, #24
	strb	r3, [r2, r1]
	ldr	r1, [r4, #20]
	lsr	r0, r0, #16
	add	r2, r1, #1
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	strb	r0, [r2, r1]
	ldr	r1, [r4, #20]
	ldr	r0, [r9, #48]
	add	r2, r1, #1
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	lsr	r3, r0, #8
	strb	r3, [r2, r1]
	ldr	r1, [r4, #20]
	add	r2, r1, #1
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	strb	r0, [r2, r1]
.LBB24_25:                              @ %._crit_edge347
	mov	r0, #1
	str	r0, [r9, #48]
	ldr	r2, [r4, #4]
.LBB24_26:
	cmp	r2, #69
	bne	.LBB24_50
@ BB#27:                                @ %._crit_edge323
	add	r6, r4, #28
.LBB24_28:
	ldr	r0, [r6]
	ldr	r1, [r0, #16]
	cmp	r1, #0
	beq	.LBB24_48
@ BB#29:
	ldr	r1, [r4, #20]
	ldr	r2, [r4, #32]
	ldrh	r3, [r0, #20]
	cmp	r2, r3
	bhs	.LBB24_44
@ BB#30:                                @ %.lr.ph
	mov	r3, r1
	b	.LBB24_32
.LBB24_31:                              @ %._crit_edge320
                                        @   in Loop: Header=BB24_32 Depth=1
	ldr	r1, [r4, #20]
.LBB24_32:                              @ =>This Inner Loop Header: Depth=1
	ldr	r7, [r4, #12]
	cmp	r1, r7
	bne	.LBB24_37
@ BB#33:                                @   in Loop: Header=BB24_32 Depth=1
	ldr	r0, [r0, #44]
	cmp	r0, #0
	cmpne	r1, r3
	bls	.LBB24_35
@ BB#34:                                @   in Loop: Header=BB24_32 Depth=1
	ldr	r7, [r4, #8]
	ldr	r0, [r9, #48]
	sub	r2, r1, r3
	add	r1, r7, r3
	bl	crc32
	str	r0, [r9, #48]
.LBB24_35:                              @   in Loop: Header=BB24_32 Depth=1
	mov	r0, r9
	bl	flush_pending
	ldr	r1, [r4, #20]
	ldr	r0, [r4, #12]
	cmp	r1, r0
	beq	.LBB24_43
@ BB#36:                                @ %._crit_edge319
                                        @   in Loop: Header=BB24_32 Depth=1
	ldr	r0, [r4, #28]
	ldr	r2, [r4, #32]
	mov	r3, r1
.LBB24_37:                              @   in Loop: Header=BB24_32 Depth=1
	ldr	r0, [r0, #16]
	ldrb	r0, [r0, r2]
	add	r2, r1, #1
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	strb	r0, [r2, r1]
	ldr	r0, [r4, #32]
	add	r2, r0, #1
	str	r2, [r4, #32]
	ldr	r0, [r6]
	ldrh	r1, [r0, #20]
	cmp	r2, r1
	blo	.LBB24_31
@ BB#38:
	mov	r1, r3
	b	.LBB24_44
.LBB24_39:
	ldr	r1, [r4, #20]
	add	r2, r1, #1
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	strb	r0, [r2, r1]
	ldr	r1, [r4, #20]
	add	r2, r1, #1
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	strb	r0, [r2, r1]
	ldr	r1, [r4, #20]
	add	r2, r1, #1
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	strb	r0, [r2, r1]
	ldr	r1, [r4, #20]
	add	r2, r1, #1
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	strb	r0, [r2, r1]
	ldr	r1, [r4, #20]
	add	r2, r1, #1
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	strb	r0, [r2, r1]
	ldr	r1, [r4, #132]
	mov	r0, #2
	cmp	r1, #9
	beq	.LBB24_42
@ BB#40:
	ldr	r2, [r4, #136]
	mov	r0, #4
	cmp	r2, #1
	bgt	.LBB24_42
@ BB#41:
	mov	r0, #0
	cmp	r1, #2
	movlt	r0, #4
.LBB24_42:                              @ %.thread296
	ldr	r1, [r4, #20]
	add	r2, r1, #1
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	strb	r0, [r2, r1]
	ldr	r0, [r4, #20]
	mov	r2, #3
	add	r1, r0, #1
	str	r1, [r4, #20]
	ldr	r1, [r4, #8]
	strb	r2, [r1, r0]
	b	.LBB24_90
.LBB24_43:                              @ %split305
	ldr	r0, [r6]
.LBB24_44:                              @ %._crit_edge
	ldr	r2, [r0, #44]
	cmp	r2, #0
	ldrne	r2, [r4, #20]
	cmpne	r2, r1
	bls	.LBB24_46
@ BB#45:
	ldr	r3, [r4, #8]
	ldr	r0, [r9, #48]
	sub	r2, r2, r1
	add	r1, r3, r1
	bl	crc32
	str	r0, [r9, #48]
	ldr	r0, [r4, #28]
.LBB24_46:                              @ %._crit_edge322
	ldr	r1, [r0, #20]
	ldr	r2, [r4, #32]
	cmp	r2, r1
	bne	.LBB24_49
@ BB#47:
	mov	r1, #0
	str	r1, [r4, #32]
.LBB24_48:
	mov	r1, #73
	str	r1, [r4, #4]
	b	.LBB24_52
.LBB24_49:                              @ %._crit_edge311
	ldr	r2, [r4, #4]
.LBB24_50:
	cmp	r2, #73
	bne	.LBB24_65
@ BB#51:                                @ %..thread281_crit_edge
	ldr	r0, [r4, #28]
.LBB24_52:                              @ %.thread281
	ldr	r0, [r0, #28]
	add	r6, r4, #28
	cmp	r0, #0
	beq	.LBB24_68
@ BB#53:
	ldr	r1, [r4, #20]
	mov	r3, r1
	b	.LBB24_55
.LBB24_54:                              @ %._crit_edge318
                                        @   in Loop: Header=BB24_55 Depth=1
	ldr	r1, [r4, #20]
.LBB24_55:                              @ =>This Inner Loop Header: Depth=1
	ldr	r0, [r4, #12]
	cmp	r1, r0
	bne	.LBB24_59
@ BB#56:                                @   in Loop: Header=BB24_55 Depth=1
	ldr	r0, [r6]
	ldr	r0, [r0, #44]
	cmp	r0, #0
	cmpne	r1, r3
	bls	.LBB24_58
@ BB#57:                                @   in Loop: Header=BB24_55 Depth=1
	ldr	r7, [r4, #8]
	ldr	r0, [r9, #48]
	sub	r2, r1, r3
	add	r1, r7, r3
	bl	crc32
	str	r0, [r9, #48]
.LBB24_58:                              @   in Loop: Header=BB24_55 Depth=1
	mov	r0, r9
	bl	flush_pending
	ldr	r1, [r4, #20]
	ldr	r0, [r4, #12]
	mov	r5, #1
	mov	r3, r1
	cmp	r1, r0
	beq	.LBB24_61
.LBB24_59:                              @ %._crit_edge316
                                        @   in Loop: Header=BB24_55 Depth=1
	ldr	r0, [r4, #32]
	mov	r5, #0
	add	r2, r0, #1
	str	r2, [r4, #32]
	ldr	r2, [r4, #28]
	ldr	r2, [r2, #28]
	ldrb	r0, [r2, r0]
	add	r2, r1, #1
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	cmp	r0, #0
	strb	r0, [r2, r1]
	bne	.LBB24_54
@ BB#60:
	mov	r1, r3
.LBB24_61:
	ldr	r0, [r6]
	ldr	r0, [r0, #44]
	cmp	r0, #0
	ldrne	r0, [r4, #20]
	cmpne	r0, r1
	bls	.LBB24_63
@ BB#62:
	ldr	r3, [r4, #8]
	sub	r2, r0, r1
	ldr	r0, [r9, #48]
	add	r1, r3, r1
	bl	crc32
	str	r0, [r9, #48]
.LBB24_63:
	cmp	r5, #0
	beq	.LBB24_67
@ BB#64:                                @ %thread-pre-split
	ldr	r2, [r4, #4]
.LBB24_65:
	cmp	r2, #91
	bne	.LBB24_82
@ BB#66:                                @ %..thread284_crit_edge
	add	r6, r4, #28
	b	.LBB24_69
.LBB24_67:
	mov	r0, #0
	str	r0, [r4, #32]
.LBB24_68:
	mov	r0, #91
	str	r0, [r4, #4]
.LBB24_69:                              @ %.thread284
	ldr	r0, [r6]
	ldr	r0, [r0, #36]
	cmp	r0, #0
	beq	.LBB24_84
@ BB#70:
	ldr	r1, [r4, #20]
	mov	r3, r1
	b	.LBB24_72
.LBB24_71:                              @ %._crit_edge315
                                        @   in Loop: Header=BB24_72 Depth=1
	ldr	r1, [r4, #20]
.LBB24_72:                              @ =>This Inner Loop Header: Depth=1
	ldr	r0, [r4, #12]
	cmp	r1, r0
	bne	.LBB24_76
@ BB#73:                                @   in Loop: Header=BB24_72 Depth=1
	ldr	r0, [r6]
	ldr	r0, [r0, #44]
	cmp	r0, #0
	cmpne	r1, r3
	bls	.LBB24_75
@ BB#74:                                @   in Loop: Header=BB24_72 Depth=1
	ldr	r7, [r4, #8]
	ldr	r0, [r9, #48]
	sub	r2, r1, r3
	add	r1, r7, r3
	bl	crc32
	str	r0, [r9, #48]
.LBB24_75:                              @   in Loop: Header=BB24_72 Depth=1
	mov	r0, r9
	bl	flush_pending
	ldr	r1, [r4, #20]
	ldr	r0, [r4, #12]
	mov	r5, #1
	mov	r3, r1
	cmp	r1, r0
	beq	.LBB24_78
.LBB24_76:                              @ %._crit_edge313
                                        @   in Loop: Header=BB24_72 Depth=1
	ldr	r0, [r4, #32]
	mov	r5, #0
	add	r2, r0, #1
	str	r2, [r4, #32]
	ldr	r2, [r6]
	ldr	r2, [r2, #36]
	ldrb	r0, [r2, r0]
	add	r2, r1, #1
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	cmp	r0, #0
	strb	r0, [r2, r1]
	bne	.LBB24_71
@ BB#77:
	mov	r1, r3
.LBB24_78:
	ldr	r0, [r6]
	ldr	r0, [r0, #44]
	cmp	r0, #0
	ldrne	r0, [r4, #20]
	cmpne	r0, r1
	bls	.LBB24_80
@ BB#79:
	ldr	r3, [r4, #8]
	sub	r2, r0, r1
	ldr	r0, [r9, #48]
	add	r1, r3, r1
	bl	crc32
	str	r0, [r9, #48]
.LBB24_80:
	cmp	r5, #0
	beq	.LBB24_84
@ BB#81:                                @ %._crit_edge312
	ldr	r2, [r4, #4]
.LBB24_82:
	cmp	r2, #103
	bne	.LBB24_91
@ BB#83:                                @ %..thread288_crit_edge
	add	r6, r4, #28
	b	.LBB24_85
.LBB24_84:
	mov	r0, #103
	str	r0, [r4, #4]
.LBB24_85:                              @ %.thread288
	ldr	r0, [r6]
	ldr	r0, [r0, #44]
	cmp	r0, #0
	beq	.LBB24_90
@ BB#86:
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #12]
	add	r2, r0, #2
	cmp	r2, r1
	bls	.LBB24_88
@ BB#87:
	mov	r0, r9
	bl	flush_pending
	ldr	r1, [r4, #12]
	ldr	r0, [r4, #20]
.LBB24_88:
	add	r2, r0, #2
	cmp	r2, r1
	bhi	.LBB24_91
@ BB#89:
	add	r2, r0, #1
	ldr	r1, [r9, #48]
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	strb	r1, [r2, r0]
	ldr	r0, [r4, #20]
	ldr	r1, [r9, #48]
	add	r2, r0, #1
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	lsr	r1, r1, #8
	strb	r1, [r2, r0]
	mov	r0, #0
	str	r0, [r9, #48]
.LBB24_90:
	mov	r0, #113
	str	r0, [r4, #4]
.LBB24_91:                              @ %._crit_edge331
	ldr	r0, [r4, #20]
	cmp	r0, #0
	beq	.LBB24_93
@ BB#92:
	mov	r0, r9
	bl	flush_pending
	ldr	r0, [r9, #16]
	mov	r2, r10
	cmp	r0, #0
	bne	.LBB24_96
	b	.LBB24_178
.LBB24_93:
	ldr	r0, [r9, #4]
	mov	r2, r10
	cmp	r0, #0
	bne	.LBB24_96
@ BB#94:
	mvn	r1, #8
	add	r0, r1, r8, lsl #1
	cmp	r8, #4
	lslle	r0, r8, #1
	add	r1, r1, r2, lsl #1
	cmp	r2, #4
	lslle	r1, r2, #1
	cmp	r1, r0
	bgt	.LBB24_96
@ BB#95:
	cmp	r2, #4
	bne	.LBB24_98
.LBB24_96:                              @ %._crit_edge328
	ldr	r1, [r4, #4]
	ldr	r0, [r9, #4]
	cmp	r1, r11
	bne	.LBB24_99
@ BB#97:
	cmp	r0, #0
	beq	.LBB24_100
.LBB24_98:
	ldr	r0, .LCPI24_2
	str	r0, [r9, #24]
	mvn	r0, #4
	add	sp, sp, #12
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
.LBB24_99:
	cmp	r0, #0
	bne	.LBB24_103
.LBB24_100:                             @ %.thread351
	ldr	r0, [r4, #116]
	cmp	r0, #0
	bne	.LBB24_103
@ BB#101:
	mov	r0, #0
	cmp	r2, #0
	beq	.LBB24_181
@ BB#102:
	cmp	r1, r11
	beq	.LBB24_174
.LBB24_103:
	ldr	r0, [r4, #136]
	str	r2, [sp]                @ 4-byte Spill
	cmp	r0, #3
	bne	.LBB24_142
@ BB#104:
	add	r0, r4, #668
	add	r0, r0, #5120
	str	r0, [sp, #8]            @ 4-byte Spill
	add	r0, r4, #392
	add	r11, r0, #2048
	add	r0, r4, #664
	add	r0, r0, #5120
	str	r0, [sp, #4]            @ 4-byte Spill
	add	r0, r4, #676
	add	r1, r4, #1696
	add	r8, r0, #5120
	add	r10, r1, #4096
.LBB24_105:                             @ %.backedge.i
                                        @ =>This Loop Header: Depth=1
                                        @     Child Loop BB24_117 Depth 2
	ldr	r12, [r4, #116]
	mov	r0, #2
	orr	r0, r0, #256
	cmp	r12, r0
	bhi	.LBB24_111
@ BB#106:                               @   in Loop: Header=BB24_105 Depth=1
	mov	r0, r4
	bl	fill_window
	ldr	r12, [r4, #116]
	mov	r0, #2
	orr	r0, r0, #256
	cmp	r12, r0
	bhi	.LBB24_111
@ BB#107:                               @   in Loop: Header=BB24_105 Depth=1
	ldr	r0, [sp]                @ 4-byte Reload
	cmp	r0, #0
	beq	.LBB24_162
@ BB#108:                               @   in Loop: Header=BB24_105 Depth=1
	cmp	r12, #0
	beq	.LBB24_149
@ BB#109:                               @ %.thread.i
                                        @   in Loop: Header=BB24_105 Depth=1
	mov	r0, #0
	str	r0, [r4, #96]
	cmp	r12, #2
	bhi	.LBB24_112
@ BB#110:                               @ %.thread..thread87_crit_edge.i
                                        @   in Loop: Header=BB24_105 Depth=1
	ldr	r2, [r4, #108]
	b	.LBB24_139
.LBB24_111:                             @ %.thread.thread.i
                                        @   in Loop: Header=BB24_105 Depth=1
	mov	r0, #0
	str	r0, [r4, #96]
.LBB24_112:                             @ %.thread.i._crit_edge
                                        @   in Loop: Header=BB24_105 Depth=1
	ldr	r1, [r4, #108]
	mov	r2, #0
	cmp	r1, #0
	beq	.LBB24_139
@ BB#113:                               @   in Loop: Header=BB24_105 Depth=1
	ldr	r0, [r4, #56]
	mov	r3, r0
	ldrb	r2, [r3, r1]!
	sub	r3, r3, #1
	ldrb	r5, [r3]
	cmp	r5, r2
	bne	.LBB24_127
@ BB#114:                               @   in Loop: Header=BB24_105 Depth=1
	add	r2, r1, r0
	ldrb	r3, [r2, #1]
	cmp	r5, r3
	bne	.LBB24_128
@ BB#115:                               @   in Loop: Header=BB24_105 Depth=1
	mov	r7, r2
	ldrb	r3, [r7, #2]!
	cmp	r5, r3
	bne	.LBB24_129
@ BB#116:                               @   in Loop: Header=BB24_105 Depth=1
	mov	r3, #2
	orr	r3, r3, #256
	add	r2, r2, r3
.LBB24_117:                             @   Parent Loop BB24_105 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	add	r6, r0, r1
	ldrb	r3, [r6, #3]
	cmp	r5, r3
	bne	.LBB24_130
@ BB#118:                               @   in Loop: Header=BB24_117 Depth=2
	ldrb	r3, [r6, #4]
	cmp	r5, r3
	bne	.LBB24_131
@ BB#119:                               @   in Loop: Header=BB24_117 Depth=2
	ldrb	r3, [r6, #5]
	cmp	r5, r3
	bne	.LBB24_132
@ BB#120:                               @   in Loop: Header=BB24_117 Depth=2
	ldrb	r3, [r6, #6]
	cmp	r5, r3
	bne	.LBB24_133
@ BB#121:                               @   in Loop: Header=BB24_117 Depth=2
	ldrb	r3, [r6, #7]
	cmp	r5, r3
	bne	.LBB24_134
@ BB#122:                               @   in Loop: Header=BB24_117 Depth=2
	ldrb	r3, [r6, #8]
	cmp	r5, r3
	bne	.LBB24_135
@ BB#123:                               @   in Loop: Header=BB24_117 Depth=2
	ldrb	r3, [r6, #9]
	cmp	r5, r3
	bne	.LBB24_136
@ BB#124:                               @   in Loop: Header=BB24_117 Depth=2
	ldrb	r3, [r6, #10]!
	add	r0, r0, #8
	cmp	r5, r3
	bne	.LBB24_126
@ BB#125:                               @   in Loop: Header=BB24_117 Depth=2
	add	r7, r7, #8
	cmp	r6, r2
	blo	.LBB24_117
.LBB24_126:                             @ %..critedge.i_crit_edge
                                        @   in Loop: Header=BB24_105 Depth=1
	add	r0, r0, r1
	add	r3, r0, #2
	b	.LBB24_137
.LBB24_127:                             @   in Loop: Header=BB24_105 Depth=1
	mov	r2, r1
	b	.LBB24_139
.LBB24_128:                             @   in Loop: Header=BB24_105 Depth=1
	mov	r2, r1
	b	.LBB24_139
.LBB24_129:                             @   in Loop: Header=BB24_105 Depth=1
	mov	r2, r1
	b	.LBB24_139
.LBB24_130:                             @   in Loop: Header=BB24_105 Depth=1
	add	r3, r7, #1
	b	.LBB24_137
.LBB24_131:                             @   in Loop: Header=BB24_105 Depth=1
	add	r3, r7, #2
	b	.LBB24_137
.LBB24_132:                             @   in Loop: Header=BB24_105 Depth=1
	add	r3, r7, #3
	b	.LBB24_137
.LBB24_133:                             @   in Loop: Header=BB24_105 Depth=1
	add	r3, r7, #4
	b	.LBB24_137
.LBB24_134:                             @   in Loop: Header=BB24_105 Depth=1
	add	r3, r7, #5
	b	.LBB24_137
.LBB24_135:                             @   in Loop: Header=BB24_105 Depth=1
	add	r3, r7, #6
	b	.LBB24_137
.LBB24_136:                             @   in Loop: Header=BB24_105 Depth=1
	add	r3, r7, #7
.LBB24_137:                             @ %.critedge.i
                                        @   in Loop: Header=BB24_105 Depth=1
	sub	r0, r3, r2
	mov	r2, #2
	orr	r2, r2, #256
	add	r3, r0, r2
	cmp	r3, r12
	movhi	r3, r12
	mov	r2, r1
	str	r3, [r4, #96]
	cmp	r3, #3
	blo	.LBB24_139
@ BB#138:                               @   in Loop: Header=BB24_105 Depth=1
	ldr	r0, [r10]
	ldr	r1, [r8]
	add	r0, r1, r0, lsl #1
	mov	r1, #1
	strh	r1, [r0]
	add	r0, r3, #253
	ldr	r1, [r10]
	ldr	r3, .LCPI24_3
	uxtb	r2, r0
	ldrb	r2, [r3, r2]
	add	r3, r1, #1
	str	r3, [r10]
	ldr	r3, [sp, #4]            @ 4-byte Reload
	orr	r2, r2, #256
	add	r2, r4, r2, lsl #2
	ldr	r3, [r3]
	strb	r0, [r3, r1]
	ldrh	r0, [r2, #152]
	ldr	r3, [sp, #8]            @ 4-byte Reload
	add	r0, r0, #1
	strh	r0, [r2, #152]
	ldrh	r0, [r11]
	add	r0, r0, #1
	strh	r0, [r11]
	ldr	r0, [r4, #96]
	ldr	r2, [r4, #116]
	ldr	r3, [r3]
	ldr	r1, [r10]
	sub	r2, r2, r0
	str	r2, [r4, #116]
	ldr	r2, [r4, #108]
	sub	r3, r3, #1
	cmp	r1, r3
	mov	r1, #0
	add	r0, r2, r0
	moveq	r1, #1
	mov	r2, #0
	str	r0, [r4, #108]
	str	r2, [r4, #96]
	b	.LBB24_140
.LBB24_139:                             @ %.thread87.i
                                        @   in Loop: Header=BB24_105 Depth=1
	ldr	r0, [r10]
	ldr	r1, [r8]
	ldr	r3, [r4, #56]
	add	r1, r1, r0, lsl #1
	ldrb	r0, [r3, r2]
	mov	r2, #0
	strh	r2, [r1]
	ldr	r1, [r10]
	add	r2, r1, #1
	str	r2, [r10]
	ldr	r2, [sp, #4]            @ 4-byte Reload
	ldr	r3, [r2]
	add	r2, r4, r0, lsl #2
	strb	r0, [r3, r1]
	ldrh	r0, [r2, #148]
	ldr	r1, [sp, #8]            @ 4-byte Reload
	add	r0, r0, #1
	strh	r0, [r2, #148]
	ldr	r2, [r4, #116]
	ldr	r1, [r1]
	ldr	r0, [r10]
	sub	r2, r2, #1
	str	r2, [r4, #116]
	ldr	r2, [r4, #108]
	sub	r1, r1, #1
	cmp	r0, r1
	mov	r1, #0
	add	r0, r2, #1
	moveq	r1, #1
	str	r0, [r4, #108]
.LBB24_140:                             @   in Loop: Header=BB24_105 Depth=1
	cmp	r1, #0
	beq	.LBB24_105
@ BB#141:                               @   in Loop: Header=BB24_105 Depth=1
	ldr	r2, [r4, #92]
	mov	r1, #0
	mov	r3, #0
	cmp	r2, #0
	ldrge	r1, [r4, #56]
	addge	r1, r1, r2
	sub	r2, r0, r2
	mov	r0, r4
	bl	_tr_flush_block
	ldr	r0, [r4, #108]
	str	r0, [r4, #92]
	ldr	r0, [r4]
	bl	flush_pending
	ldr	r0, [r4]
	ldr	r0, [r0, #16]
	cmp	r0, #0
	bne	.LBB24_105
	b	.LBB24_162
.LBB24_142:
	cmp	r0, #2
	bne	.LBB24_148
@ BB#143:
	add	r0, r4, #668
	add	r8, r0, #5120
	add	r0, r4, #664
	add	r10, r0, #5120
	add	r0, r4, #676
	add	r1, r4, #1696
	add	r7, r0, #5120
	add	r6, r1, #4096
	mov	r5, #0
.LBB24_144:                             @ %.backedge.i7
                                        @ =>This Inner Loop Header: Depth=1
	ldr	r0, [r4, #116]
	cmp	r0, #0
	bne	.LBB24_146
@ BB#145:                               @   in Loop: Header=BB24_144 Depth=1
	mov	r0, r4
	bl	fill_window
	ldr	r0, [r4, #116]
	cmp	r0, #0
	beq	.LBB24_151
.LBB24_146:                             @ %._crit_edge.i
                                        @   in Loop: Header=BB24_144 Depth=1
	str	r5, [r4, #96]
	ldr	r2, [r6]
	ldr	r3, [r7]
	ldr	r1, [r4, #108]
	ldr	r0, [r4, #56]
	add	r2, r3, r2, lsl #1
	ldrb	r0, [r0, r1]
	strh	r5, [r2]
	ldr	r1, [r6]
	add	r2, r1, #1
	str	r2, [r6]
	ldr	r3, [r10]
	add	r2, r4, r0, lsl #2
	strb	r0, [r3, r1]
	ldrh	r0, [r2, #148]
	add	r0, r0, #1
	strh	r0, [r2, #148]
	ldr	r0, [r4, #116]
	ldr	r2, [r8]
	ldr	r1, [r6]
	sub	r0, r0, #1
	str	r0, [r4, #116]
	ldr	r0, [r4, #108]
	sub	r2, r2, #1
	cmp	r1, r2
	add	r0, r0, #1
	str	r0, [r4, #108]
	bne	.LBB24_144
@ BB#147:                               @   in Loop: Header=BB24_144 Depth=1
	ldr	r2, [r4, #92]
	mov	r1, #0
	mov	r3, #0
	cmp	r2, #0
	ldrge	r1, [r4, #56]
	addge	r1, r1, r2
	sub	r2, r0, r2
	mov	r0, r4
	bl	_tr_flush_block
	ldr	r0, [r4, #108]
	str	r0, [r4, #92]
	ldr	r0, [r4]
	bl	flush_pending
	ldr	r0, [r4]
	ldr	r0, [r0, #16]
	cmp	r0, #0
	bne	.LBB24_144
	b	.LBB24_162
.LBB24_148:
	ldr	r0, [r4, #132]
	ldr	r1, .LCPI24_4
	add	r0, r0, r0, lsl #1
	add	r0, r1, r0, lsl #2
	ldr	r1, [sp]                @ 4-byte Reload
	ldr	r2, [r0, #8]
	mov	r0, r4
	blx	r2
	mov	r7, r0
	b	.LBB24_154
.LBB24_149:
	mov	r0, #692
	ldr	r1, [sp]                @ 4-byte Reload
	mov	r8, #0
	orr	r0, r0, #5120
	cmp	r1, #4
	str	r8, [r4, r0]
	beq	.LBB24_153
@ BB#150:
	mov	r7, #1
	ldr	r0, [r10]
	b	.LBB24_159
.LBB24_151:
	ldr	r0, [sp]                @ 4-byte Reload
	cmp	r0, #0
	beq	.LBB24_162
@ BB#152:
	mov	r0, #692
	ldr	r1, [sp]                @ 4-byte Reload
	mov	r8, #0
	orr	r0, r0, #5120
	cmp	r1, #4
	str	r8, [r4, r0]
	bne	.LBB24_158
.LBB24_153:
	ldr	r0, [r4, #92]
	mov	r1, #0
	ldr	r2, [r4, #108]
	cmp	r0, #0
	ldrge	r1, [r4, #56]
	sub	r2, r2, r0
	mov	r3, #1
	addge	r1, r1, r0
	mov	r0, r4
	bl	_tr_flush_block
	ldr	r0, [r4, #108]
	str	r0, [r4, #92]
	ldr	r0, [r4]
	bl	flush_pending
	ldr	r0, [r4]
	mov	r7, #3
	ldr	r0, [r0, #16]
	cmp	r0, #0
	moveq	r7, #2
.LBB24_154:                             @ %deflate_huff.exit
	cmp	r7, #2
	bne	.LBB24_156
@ BB#155:
	mov	r8, #1
	mov	r0, #2
	b	.LBB24_157
.LBB24_156:
	mov	r0, #3
	mov	r8, #0
	cmp	r7, #3
	bne	.LBB24_161
.LBB24_157:
	mov	r1, #154
	mov	r7, r0
	orr	r1, r1, #512
	str	r1, [r4, #4]
	b	.LBB24_161
.LBB24_158:
	ldr	r0, [r6]
	mov	r7, #1
.LBB24_159:
	cmp	r0, #0
	beq	.LBB24_161
@ BB#160:
	ldr	r0, [r4, #92]
	mov	r8, #0
	mov	r1, r8
	cmp	r0, #0
	ldrge	r1, [r4, #56]
	ldr	r2, [r4, #108]
	mov	r3, #0
	addge	r1, r1, r0
	sub	r2, r2, r0
	mov	r0, r4
	bl	_tr_flush_block
	ldr	r0, [r4, #108]
	str	r0, [r4, #92]
	ldr	r0, [r4]
	bl	flush_pending
	ldr	r0, [r4]
	ldr	r0, [r0, #16]
	cmp	r0, #0
	beq	.LBB24_162
.LBB24_161:                             @ %.thread289
	cmp	r7, #0
	cmpne	r8, #1
	bne	.LBB24_164
.LBB24_162:                             @ %.thread289.thread
	ldr	r1, [r9, #16]
	mov	r0, #0
	cmp	r1, #0
	bne	.LBB24_181
@ BB#163:
	mvn	r1, #0
	str	r1, [r4, #40]
	add	sp, sp, #12
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
.LBB24_164:
	ldr	r2, [sp]                @ 4-byte Reload
	cmp	r7, #1
	bne	.LBB24_174
@ BB#165:
	cmp	r2, #5
	beq	.LBB24_173
@ BB#166:
	mov	r6, r2
	cmp	r2, #1
	bne	.LBB24_168
@ BB#167:
	mov	r0, r4
	bl	_tr_align
	mov	r2, r6
	b	.LBB24_173
.LBB24_168:
	mov	r0, r4
	mov	r1, #0
	mov	r2, #0
	mov	r3, #0
	mov	r5, #0
	bl	_tr_stored_block
	mov	r2, r6
	cmp	r6, #3
	bne	.LBB24_173
@ BB#169:
	ldr	r1, [r4, #76]
	ldr	r0, [r4, #68]
	mov	r6, r2
	add	r0, r0, r1, lsl #1
	mvn	r1, #1
	strh	r5, [r0, #-2]
	ldr	r0, [r4, #76]
	add	r1, r1, r0, lsl #1
	cmp	r1, #0
	beq	.LBB24_171
@ BB#170:                               @ %.lr.ph.i
	ldr	r0, [r4, #68]
	mov	r2, #0
	bl	__aeabi_memset
.LBB24_171:                             @ %ZMEMSET.exit
	ldr	r0, [r4, #116]
	mov	r2, r6
	cmp	r0, #0
	bne	.LBB24_173
@ BB#172:
	mov	r1, #692
	orr	r1, r1, #5120
	mov	r0, #0
	str	r0, [r4, #108]
	str	r0, [r4, #92]
	str	r0, [r4, r1]
.LBB24_173:
	mov	r0, r9
	mov	r5, r2
	bl	flush_pending
	ldr	r0, [r9, #16]
	mov	r2, r5
	cmp	r0, #0
	beq	.LBB24_178
.LBB24_174:
	mov	r0, #0
	cmp	r2, #4
	bne	.LBB24_181
@ BB#175:
	ldr	r1, [r4, #24]
	mov	r0, #1
	cmp	r1, #1
	blt	.LBB24_181
@ BB#176:
	ldr	r0, [r9, #48]
	cmp	r1, #2
	bne	.LBB24_179
@ BB#177:
	ldr	r1, [r4, #20]
	add	r2, r1, #1
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	strb	r0, [r2, r1]
	ldr	r0, [r4, #20]
	ldr	r1, [r9, #48]
	add	r2, r0, #1
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	lsr	r1, r1, #8
	strb	r1, [r2, r0]
	ldr	r0, [r4, #20]
	ldrh	r1, [r9, #50]
	add	r2, r0, #1
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	strb	r1, [r2, r0]
	ldr	r0, [r4, #20]
	ldrb	r1, [r9, #51]
	add	r2, r0, #1
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	strb	r1, [r2, r0]
	ldr	r0, [r4, #20]
	ldr	r1, [r9, #8]
	add	r2, r0, #1
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	strb	r1, [r2, r0]
	ldr	r0, [r4, #20]
	ldr	r1, [r9, #8]
	add	r2, r0, #1
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	lsr	r1, r1, #8
	strb	r1, [r2, r0]
	ldr	r0, [r4, #20]
	ldrh	r1, [r9, #10]
	add	r2, r0, #1
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	strb	r1, [r2, r0]
	ldr	r0, [r4, #20]
	ldrb	r1, [r9, #11]
	add	r2, r0, #1
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	strb	r1, [r2, r0]
	b	.LBB24_180
.LBB24_178:
	mvn	r0, #0
	str	r0, [r4, #40]
	mov	r0, #0
	add	sp, sp, #12
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
.LBB24_179:
	ldr	r1, [r4, #20]
	lsr	r3, r0, #24
	add	r2, r1, #1
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	lsr	r0, r0, #16
	strb	r3, [r2, r1]
	ldr	r1, [r4, #20]
	add	r2, r1, #1
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	strb	r0, [r2, r1]
	ldr	r1, [r4, #20]
	ldr	r0, [r9, #48]
	add	r2, r1, #1
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	lsr	r3, r0, #8
	strb	r3, [r2, r1]
	ldr	r1, [r4, #20]
	add	r2, r1, #1
	str	r2, [r4, #20]
	ldr	r2, [r4, #8]
	strb	r0, [r2, r1]
.LBB24_180:
	mov	r0, r9
	bl	flush_pending
	ldr	r0, [r4, #24]
	cmp	r0, #1
	rsbge	r0, r0, #0
	strge	r0, [r4, #24]
	ldr	r1, [r4, #20]
	mov	r0, #0
	cmp	r1, #0
	moveq	r0, #1
.LBB24_181:                             @ %.thread290
	add	sp, sp, #12
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.align	2
@ BB#182:
.LCPI24_0:
	.long	4294936576              @ 0xffff8800
.LCPI24_1:
	.long	138547333               @ 0x8421085
.LCPI24_2:
	.long	.L.str7
.LCPI24_3:
	.long	_length_code
.LCPI24_4:
	.long	configuration_table
.LCPI24_5:
	.long	.L.str4
.Ltmp24:
	.size	deflate, .Ltmp24-deflate

	.globl	deflateTune
	.align	2
	.type	deflateTune,%function
deflateTune:                            @ @deflateTune
@ BB#0:
	mov	r12, r0
	cmp	r12, #0
	ldrne	r12, [r12, #28]
	mvn	r0, #1
	cmpne	r12, #0
	beq	.LBB25_2
@ BB#1:
	ldr	r0, [sp]
	str	r1, [r12, #140]
	str	r2, [r12, #128]
	str	r3, [r12, #144]
	str	r0, [r12, #124]
	mov	r0, #0
.LBB25_2:
	bx	lr
.Ltmp25:
	.size	deflateTune, .Ltmp25-deflateTune

	.globl	deflateBound
	.align	2
	.type	deflateBound,%function
deflateBound:                           @ @deflateBound
@ BB#0:
	push	{r4, r5, r11, lr}
	cmp	r0, #0
	add	r12, r1, #7
	ldrne	r0, [r0, #28]
	add	r2, r1, r12, lsr #3
	add	r3, r1, #63
	add	lr, r2, r3, lsr #6
	cmpne	r0, #0
	beq	.LBB26_9
@ BB#1:
	ldr	r3, [r0, #24]
	mov	r2, #0
	cmp	r3, #0
	beq	.LBB26_13
@ BB#2:
	cmp	r3, #2
	bne	.LBB26_10
@ BB#3:
	ldr	r3, [r0, #28]
	mov	r2, #18
	cmp	r3, #0
	beq	.LBB26_13
@ BB#4:
	ldr	r4, [r3, #16]
	mov	r2, #18
	cmp	r4, #0
	ldrne	r2, [r3, #20]
	ldr	r4, [r3, #28]
	addne	r2, r2, #20
	cmp	r4, #0
	beq	.LBB26_6
.LBB26_5:                               @ %.preheader20
                                        @ =>This Inner Loop Header: Depth=1
	ldrb	r5, [r4], #1
	add	r2, r2, #1
	cmp	r5, #0
	bne	.LBB26_5
.LBB26_6:                               @ %.loopexit21
	ldr	r4, [r3, #36]
	cmp	r4, #0
	beq	.LBB26_8
.LBB26_7:                               @ %.preheader
                                        @ =>This Inner Loop Header: Depth=1
	ldrb	r5, [r4], #1
	add	r2, r2, #1
	cmp	r5, #0
	bne	.LBB26_7
.LBB26_8:                               @ %.loopexit
	ldr	r3, [r3, #44]
	cmp	r3, #0
	addne	r2, r2, #2
	b	.LBB26_13
.LBB26_9:
	add	r0, lr, #11
	pop	{r4, r5, r11, pc}
.LBB26_10:
	cmp	r3, #1
	bne	.LBB26_12
@ BB#11:
	ldr	r3, [r0, #108]
	mov	r2, #6
	cmp	r3, #0
	movne	r2, #10
	b	.LBB26_13
.LBB26_12:
	mov	r2, #6
.LBB26_13:
	ldr	r3, [r0, #48]
	cmp	r3, #15
	ldreq	r0, [r0, #80]
	cmpeq	r0, #15
	beq	.LBB26_15
@ BB#14:
	add	r0, lr, #5
	add	r0, r0, r2
	pop	{r4, r5, r11, pc}
.LBB26_15:
	add	r0, r12, r1, lsr #12
	add	r0, r0, r1, lsr #14
	add	r0, r0, r1, lsr #25
	add	r0, r0, r2
	pop	{r4, r5, r11, pc}
.Ltmp26:
	.size	deflateBound, .Ltmp26-deflateBound

	.align	2
	.type	flush_pending,%function
flush_pending:                          @ @flush_pending
@ BB#0:
	push	{r4, r5, r11, lr}
	ldr	lr, [r0, #28]
	mov	r1, #700
	orr	r1, r1, #5120
	mov	r3, lr
	ldr	r1, [r3, r1]!
	cmp	r1, #16
	bne	.LBB27_2
@ BB#1:
	mov	r12, lr
	mov	r4, #696
	ldr	r2, [r12, #20]!
	orr	r4, r4, #5120
	mov	r1, lr
	add	r5, r2, #1
	ldrb	r4, [r1, r4]!
	str	r5, [r12]
	ldr	r5, [lr, #8]
	strb	r4, [r5, r2]
	ldr	r2, [r12]
	mov	r4, #185
	orr	r4, r4, #5632
	add	r5, r2, #1
	ldrb	r4, [lr, r4]
	str	r5, [r12]
	ldr	r5, [lr, #8]
	strb	r4, [r5, r2]
	mov	r2, #0
	strh	r2, [r1]
	str	r2, [r3]
	b	.LBB27_5
.LBB27_2:
	cmp	r1, #7
	ble	.LBB27_4
@ BB#3:
	mov	r12, lr
	mov	r4, #696
	ldr	r2, [r12, #20]!
	orr	r4, r4, #5120
	mov	r1, lr
	add	r5, r2, #1
	ldrb	r4, [r1, r4]!
	str	r5, [r12]
	ldr	r5, [lr, #8]
	strb	r4, [r5, r2]
	mov	r2, #185
	orr	r2, r2, #5632
	ldrb	r2, [lr, r2]
	strh	r2, [r1]
	ldr	r1, [r3]
	sub	r1, r1, #8
	str	r1, [r3]
	b	.LBB27_5
.LBB27_4:                               @ %._tr_flush_bits.exit_crit_edge
	add	r12, lr, #20
.LBB27_5:                               @ %_tr_flush_bits.exit
	ldr	r1, [r12]
	ldr	r4, [r0, #16]
	mov	r3, r1
	cmp	r1, r4
	movhi	r3, r4
	cmp	r3, #0
	beq	.LBB27_9
@ BB#6:
	mvn	r5, r4
	mvn	r4, r1
	cmp	r5, r4
	ldr	r2, [lr, #16]
	ldr	r1, [r0, #12]
	movhi	r4, r5
	mvn	r4, r4
.LBB27_7:                               @ %.lr.ph.i
                                        @ =>This Inner Loop Header: Depth=1
	ldrb	r5, [r2], #1
	subs	r4, r4, #1
	strb	r5, [r1], #1
	bne	.LBB27_7
@ BB#8:                                 @ %ZMEMCPY.exit
	ldr	r1, [r0, #12]
	add	r1, r1, r3
	str	r1, [r0, #12]
	ldr	r1, [lr, #16]
	add	r1, r1, r3
	str	r1, [lr, #16]
	ldr	r1, [r0, #20]
	add	r1, r1, r3
	str	r1, [r0, #20]
	ldr	r1, [r0, #16]
	sub	r1, r1, r3
	str	r1, [r0, #16]
	ldr	r0, [r12]
	subs	r0, r0, r3
	str	r0, [r12]
	ldreq	r0, [lr, #8]
	streq	r0, [lr, #16]
.LBB27_9:
	pop	{r4, r5, r11, pc}
.Ltmp27:
	.size	flush_pending, .Ltmp27-flush_pending

	.globl	deflateCopy
	.align	2
	.type	deflateCopy,%function
deflateCopy:                            @ @deflateCopy
@ BB#0:
	push	{r4, r5, r6, r7, r8, r9, r11, lr}
	mov	r5, r0
	mvn	r8, #1
	cmp	r1, #0
	beq	.LBB28_24
@ BB#1:
	cmp	r5, #0
	ldrne	r6, [r1, #28]
	cmpne	r6, #0
	beq	.LBB28_24
@ BB#2:
	mov	r0, #0
.LBB28_3:                               @ %.lr.ph.i
                                        @ =>This Inner Loop Header: Depth=1
	ldrb	r2, [r1, -r0]
	strb	r2, [r5, -r0]
	sub	r0, r0, #1
	cmn	r0, #56
	bne	.LBB28_3
@ BB#4:                                 @ %ZMEMCPY.exit
	mov	r7, #708
	ldr	r3, [r5, #32]
	ldr	r0, [r5, #40]
	orr	r7, r7, #5120
	mov	r1, #1
	mov	r2, r7
	blx	r3
	mov	r4, r0
	mvn	r8, #3
	cmp	r4, #0
	beq	.LBB28_24
@ BB#5:
	mov	r0, r6
	mov	r1, r4
	str	r4, [r5, #28]
.LBB28_6:                               @ %.lr.ph.i19
                                        @ =>This Inner Loop Header: Depth=1
	ldrb	r2, [r0], #1
	subs	r7, r7, #1
	strb	r2, [r1], #1
	bne	.LBB28_6
@ BB#7:                                 @ %ZMEMCPY.exit20
	str	r5, [r4]
	ldr	r3, [r5, #32]
	ldr	r0, [r5, #40]
	ldr	r1, [r4, #44]
	mov	r2, #2
	blx	r3
	str	r0, [r4, #56]
	ldr	r3, [r5, #32]
	ldr	r0, [r5, #40]
	ldr	r1, [r4, #44]
	mov	r2, #2
	blx	r3
	str	r0, [r4, #64]
	ldr	r3, [r5, #32]
	ldr	r0, [r5, #40]
	ldr	r1, [r4, #76]
	mov	r2, #2
	blx	r3
	mov	r1, #668
	orr	r1, r1, #5120
	mov	r9, r4
	str	r0, [r4, #68]
	ldr	r3, [r5, #32]
	ldr	r0, [r5, #40]
	ldr	r1, [r9, r1]!
	mov	r2, #4
	blx	r3
	str	r0, [r4, #8]
	ldr	r2, [r4, #56]
	cmp	r2, #0
	ldrne	r1, [r4, #64]
	cmpne	r1, #0
	beq	.LBB28_9
@ BB#8:
	ldr	r3, [r4, #68]
	cmp	r3, #0
	cmpne	r0, #0
	bne	.LBB28_10
.LBB28_9:
	mov	r0, r5
	bl	deflateEnd
	mov	r0, r8
	pop	{r4, r5, r6, r7, r8, r9, r11, pc}
.LBB28_10:
	ldr	r5, [r4, #44]
	mov	r3, #0
	cmp	r3, r5, lsl #1
	beq	.LBB28_14
@ BB#11:                                @ %.lr.ph.i15.preheader
	ldr	r1, [r6, #56]
	lsl	r5, r5, #1
.LBB28_12:                              @ %.lr.ph.i15
                                        @ =>This Inner Loop Header: Depth=1
	ldrb	r7, [r1], #1
	subs	r5, r5, #1
	strb	r7, [r2], #1
	bne	.LBB28_12
@ BB#13:                                @ %ZMEMCPY.exit16.loopexit
	ldr	r5, [r4, #44]
	ldr	r1, [r4, #64]
.LBB28_14:                              @ %ZMEMCPY.exit16
	cmp	r3, r5, lsl #1
	beq	.LBB28_17
@ BB#15:                                @ %.lr.ph.i11.preheader
	ldr	r2, [r6, #64]
	lsl	r3, r5, #1
.LBB28_16:                              @ %.lr.ph.i11
                                        @ =>This Inner Loop Header: Depth=1
	ldrb	r7, [r2], #1
	subs	r3, r3, #1
	strb	r7, [r1], #1
	bne	.LBB28_16
.LBB28_17:                              @ %ZMEMCPY.exit12
	ldr	r3, [r4, #76]
	mov	r1, #0
	cmp	r1, r3, lsl #1
	beq	.LBB28_20
@ BB#18:                                @ %.lr.ph.i7.preheader
	ldr	r1, [r4, #68]
	ldr	r2, [r6, #68]
	lsl	r3, r3, #1
.LBB28_19:                              @ %.lr.ph.i7
                                        @ =>This Inner Loop Header: Depth=1
	ldrb	r7, [r2], #1
	subs	r3, r3, #1
	strb	r7, [r1], #1
	bne	.LBB28_19
.LBB28_20:                              @ %ZMEMCPY.exit8
	ldr	r3, [r4, #12]
	ldr	r1, [r4, #8]
	ldr	r2, [r6, #8]
	cmp	r3, #0
	beq	.LBB28_23
.LBB28_21:                              @ %.lr.ph.i3
                                        @ =>This Inner Loop Header: Depth=1
	ldrb	r7, [r2], #1
	subs	r3, r3, #1
	strb	r7, [r1], #1
	bne	.LBB28_21
@ BB#22:                                @ %ZMEMCPY.exit4.loopexit
	ldr	r2, [r6, #8]
	ldr	r1, [r4, #8]
.LBB28_23:                              @ %ZMEMCPY.exit4
	ldr	r3, [r6, #16]
	mov	r8, #0
	sub	r2, r3, r2
	add	r2, r1, r2
	str	r2, [r4, #16]
	ldr	r3, [r9]
	add	r2, r3, r3, lsl #1
	bic	r3, r3, #1
	add	r0, r0, r3
	mov	r3, #676
	orr	r3, r3, #5120
	str	r0, [r4, r3]
	add	r0, r1, r2
	mov	r1, #664
	orr	r1, r1, #5120
	str	r0, [r4, r1]
	add	r0, r4, #148
	str	r0, [r4, #2840]
	add	r0, r4, #392
	add	r0, r0, #2048
	str	r0, [r4, #2852]
	add	r0, r4, #636
	add	r0, r0, #2048
	str	r0, [r4, #2864]
.LBB28_24:
	mov	r0, r8
	pop	{r4, r5, r6, r7, r8, r9, r11, pc}
.Ltmp28:
	.size	deflateCopy, .Ltmp28-deflateCopy

	.align	2
	.type	deflate_stored,%function
deflate_stored:                         @ @deflate_stored
@ BB#0:
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	mov	r6, #255
	ldr	r0, [r4, #12]
	orr	r6, r6, #65280
	mov	r8, r1
	sub	r0, r0, #5
	cmp	r0, r6
	movlo	r6, r0
	mov	r5, #0
.LBB29_1:                               @ %.backedge
                                        @ =>This Inner Loop Header: Depth=1
	ldr	r0, [r4, #116]
	cmp	r0, #1
	bhi	.LBB29_3
@ BB#2:                                 @   in Loop: Header=BB29_1 Depth=1
	mov	r0, r4
	bl	fill_window
	ldr	r0, [r4, #116]
	cmp	r0, #0
	beq	.LBB29_9
.LBB29_3:                               @ %.thread
                                        @   in Loop: Header=BB29_1 Depth=1
	ldr	r1, [r4, #108]
	adds	r1, r1, r0
	str	r1, [r4, #108]
	str	r5, [r4, #116]
	ldr	r0, [r4, #92]
	add	r2, r0, r6
	beq	.LBB29_5
@ BB#4:                                 @ %.thread
                                        @   in Loop: Header=BB29_1 Depth=1
	cmp	r1, r2
	blo	.LBB29_7
.LBB29_5:                               @   in Loop: Header=BB29_1 Depth=1
	sub	r1, r1, r2
	str	r1, [r4, #116]
	str	r2, [r4, #108]
	cmp	r0, #0
	mov	r1, #0
	ldrge	r1, [r4, #56]
	mov	r2, r6
	mov	r3, #0
	addge	r1, r1, r0
	mov	r0, r4
	mov	r7, #0
	bl	_tr_flush_block
	ldr	r0, [r4, #108]
	str	r0, [r4, #92]
	ldr	r0, [r4]
	bl	flush_pending
	ldr	r0, [r4]
	ldr	r0, [r0, #16]
	cmp	r0, #0
	beq	.LBB29_15
@ BB#6:                                 @ %._crit_edge
                                        @   in Loop: Header=BB29_1 Depth=1
	ldr	r0, [r4, #92]
	ldr	r1, [r4, #108]
.LBB29_7:                               @ %.thread._crit_edge
                                        @   in Loop: Header=BB29_1 Depth=1
	ldr	r3, .LCPI29_0
	ldr	r7, [r4, #44]
	sub	r2, r1, r0
	add	r1, r7, r3
	cmp	r2, r1
	blo	.LBB29_1
@ BB#8:                                 @   in Loop: Header=BB29_1 Depth=1
	mov	r7, #0
	cmp	r0, #0
	mov	r1, r7
	ldrge	r1, [r4, #56]
	mov	r3, #0
	addge	r1, r1, r0
	mov	r0, r4
	bl	_tr_flush_block
	ldr	r0, [r4, #108]
	str	r0, [r4, #92]
	ldr	r0, [r4]
	bl	flush_pending
	ldr	r0, [r4]
	ldr	r0, [r0, #16]
	cmp	r0, #0
	bne	.LBB29_1
	b	.LBB29_15
.LBB29_9:
	mov	r7, #0
	cmp	r8, #0
	beq	.LBB29_15
@ BB#10:
	mov	r0, #692
	mov	r1, #0
	orr	r0, r0, #5120
	cmp	r8, #4
	str	r1, [r4, r0]
	bne	.LBB29_12
@ BB#11:
	ldr	r0, [r4, #92]
	ldr	r2, [r4, #108]
	mov	r3, #1
	cmp	r0, #0
	ldrge	r1, [r4, #56]
	sub	r2, r2, r0
	addge	r1, r1, r0
	mov	r0, r4
	bl	_tr_flush_block
	ldr	r0, [r4, #108]
	str	r0, [r4, #92]
	ldr	r0, [r4]
	bl	flush_pending
	ldr	r0, [r4]
	ldr	r1, [r0, #16]
	mov	r0, #3
	cmp	r1, #0
	moveq	r0, #2
	pop	{r4, r5, r6, r7, r8, pc}
.LBB29_12:
	ldr	r0, [r4, #92]
	ldr	r2, [r4, #108]
	cmp	r2, r0
	ble	.LBB29_14
@ BB#13:
	mov	r7, #0
	cmp	r0, #0
	mov	r1, r7
	ldrge	r1, [r4, #56]
	sub	r2, r2, r0
	mov	r3, #0
	addge	r1, r1, r0
	mov	r0, r4
	bl	_tr_flush_block
	ldr	r0, [r4, #108]
	str	r0, [r4, #92]
	ldr	r0, [r4]
	bl	flush_pending
	ldr	r0, [r4]
	ldr	r0, [r0, #16]
	cmp	r0, #0
	movne	r7, #1
	b	.LBB29_15
.LBB29_14:
	mov	r7, #1
.LBB29_15:                              @ %.loopexit
	mov	r0, r7
	pop	{r4, r5, r6, r7, r8, pc}
	.align	2
@ BB#16:
.LCPI29_0:
	.long	4294967034              @ 0xfffffefa
.Ltmp29:
	.size	deflate_stored, .Ltmp29-deflate_stored

	.align	2
	.type	deflate_fast,%function
deflate_fast:                           @ @deflate_fast
@ BB#0:
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r1}
	mov	r4, r0
	add	r0, r4, #668
	add	r5, r0, #5120
	add	r0, r4, #664
	mov	r9, #392
	add	r10, r0, #5120
	add	r0, r4, #676
	add	r1, r4, #1696
	add	r11, r0, #5120
	add	r8, r1, #4096
	orr	r9, r9, #2048
.LBB30_1:                               @ %.backedge
                                        @ =>This Loop Header: Depth=1
                                        @     Child Loop BB30_14 Depth 2
	ldr	r0, [r4, #116]
	lsr	r0, r0, #1
	cmp	r0, #130
	bhi	.LBB30_6
@ BB#2:                                 @   in Loop: Header=BB30_1 Depth=1
	mov	r0, r4
	bl	fill_window
	ldr	r0, [r4, #116]
	lsr	r1, r0, #1
	cmp	r1, #130
	bhi	.LBB30_6
@ BB#3:                                 @   in Loop: Header=BB30_1 Depth=1
	ldr	r1, [sp]                @ 4-byte Reload
	mov	r6, #0
	cmp	r1, #0
	beq	.LBB30_25
@ BB#4:                                 @   in Loop: Header=BB30_1 Depth=1
	cmp	r0, #0
	beq	.LBB30_20
@ BB#5:                                 @ %.thread
                                        @   in Loop: Header=BB30_1 Depth=1
	cmp	r0, #3
	blo	.LBB30_8
.LBB30_6:                               @ %.thread81
                                        @   in Loop: Header=BB30_1 Depth=1
	ldr	r2, [r4, #56]
	ldr	r0, [r4, #108]
	ldr	r6, [r4, #88]
	ldr	r1, [r4, #72]
	add	r2, r0, r2
	ldr	r3, [r4, #84]
	ldrb	r2, [r2, #2]
	eor	r1, r2, r1, lsl r6
	and	r1, r1, r3
	str	r1, [r4, #72]
	ldr	r7, [r4, #68]
	ldr	r2, [r4, #52]
	add	r1, r7, r1, lsl #1
	ldr	r3, [r4, #64]
	and	r0, r2, r0
	ldrh	r1, [r1]
	add	r0, r3, r0, lsl #1
	cmp	r1, #0
	strh	r1, [r0]
	ldr	r0, [r4, #72]
	ldr	r2, [r4, #68]
	ldr	r3, [r4, #108]
	add	r0, r2, r0, lsl #1
	strh	r3, [r0]
	beq	.LBB30_8
@ BB#7:                                 @   in Loop: Header=BB30_1 Depth=1
	ldr	r0, .LCPI30_0
	ldr	r3, [r4, #108]
	ldr	r2, [r4, #44]
	sub	r3, r3, r1
	add	r0, r2, r0
	cmp	r3, r0
	bls	.LBB30_9
.LBB30_8:                               @ %.thread82thread-pre-split
                                        @   in Loop: Header=BB30_1 Depth=1
	ldr	r0, [r4, #96]
	b	.LBB30_10
.LBB30_9:                               @   in Loop: Header=BB30_1 Depth=1
	mov	r0, r4
	bl	longest_match
	str	r0, [r4, #96]
.LBB30_10:                              @ %.thread82
                                        @   in Loop: Header=BB30_1 Depth=1
	cmp	r0, #3
	blo	.LBB30_16
@ BB#11:                                @   in Loop: Header=BB30_1 Depth=1
	ldr	r1, [r8]
	ldr	r2, [r11]
	ldr	r3, [r4, #108]
	ldr	r7, [r4, #112]
	add	r2, r2, r1, lsl #1
	sub	r1, r3, r7
	add	r0, r0, #253
	ldr	r7, .LCPI30_1
	strh	r1, [r2]
	uxtb	r3, r0
	ldr	r2, [r8]
	ldrb	r3, [r7, r3]
	add	r7, r2, #1
	str	r7, [r8]
	orr	r3, r3, #256
	ldr	r7, [r10]
	add	r3, r4, r3, lsl #2
	strb	r0, [r7, r2]
	ldrh	r0, [r3, #152]
	add	r0, r0, #1
	strh	r0, [r3, #152]
	sub	r0, r1, #1
	uxth	r0, r0
	cmp	r0, #256
	movhs	r1, #256
	addhs	r0, r1, r0, lsr #7
	ldr	r1, .LCPI30_2
	ldrb	r0, [r1, r0]
	add	r0, r4, r0, lsl #2
	ldrh	r1, [r0, r9]
	add	r1, r1, #1
	strh	r1, [r0, r9]
	ldr	r1, [r4, #96]
	ldr	r0, [r4, #116]
	ldr	r3, [r5]
	ldr	r6, [r8]
	sub	r2, r0, r1
	sub	r0, r3, #1
	str	r2, [r4, #116]
	cmp	r6, r0
	mov	r0, #0
	ldr	r3, [r4, #128]
	moveq	r0, #1
	cmp	r1, r3
	bhi	.LBB30_17
@ BB#12:                                @   in Loop: Header=BB30_1 Depth=1
	cmp	r2, #3
	blo	.LBB30_17
@ BB#13:                                @   in Loop: Header=BB30_1 Depth=1
	mov	r12, r5
	sub	r1, r1, #1
	str	r1, [r4, #96]
.LBB30_14:                              @   Parent Loop BB30_1 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r2, [r4, #108]
	add	r1, r2, #1
	str	r1, [r4, #108]
	ldr	r5, [r4, #56]
	ldr	r7, [r4, #88]
	ldr	r3, [r4, #72]
	add	r2, r2, r5
	ldr	r6, [r4, #84]
	ldrb	r2, [r2, #3]
	eor	r2, r2, r3, lsl r7
	and	r2, r2, r6
	str	r2, [r4, #72]
	ldr	r7, [r4, #68]
	ldr	r3, [r4, #52]
	add	r2, r7, r2, lsl #1
	ldr	r6, [r4, #64]
	and	r1, r3, r1
	add	r1, r6, r1, lsl #1
	ldrh	r2, [r2]
	strh	r2, [r1]
	ldr	r2, [r4, #72]
	ldr	r1, [r4, #68]
	ldr	r3, [r4, #108]
	add	r1, r1, r2, lsl #1
	strh	r3, [r1]
	ldr	r1, [r4, #96]
	subs	r1, r1, #1
	str	r1, [r4, #96]
	bne	.LBB30_14
@ BB#15:                                @   in Loop: Header=BB30_1 Depth=1
	ldr	r1, [r4, #108]
	mov	r5, r12
	add	r2, r1, #1
	str	r2, [r4, #108]
	b	.LBB30_18
.LBB30_16:                              @   in Loop: Header=BB30_1 Depth=1
	ldr	r2, [r8]
	ldr	r3, [r11]
	ldr	r1, [r4, #108]
	ldr	r0, [r4, #56]
	add	r2, r3, r2, lsl #1
	ldrb	r0, [r0, r1]
	mov	r1, #0
	strh	r1, [r2]
	ldr	r1, [r8]
	add	r2, r1, #1
	str	r2, [r8]
	ldr	r3, [r10]
	add	r2, r4, r0, lsl #2
	strb	r0, [r3, r1]
	ldrh	r0, [r2, #148]
	add	r0, r0, #1
	strh	r0, [r2, #148]
	ldr	r1, [r4, #116]
	ldr	r2, [r5]
	ldr	r0, [r8]
	sub	r1, r1, #1
	str	r1, [r4, #116]
	ldr	r1, [r4, #108]
	sub	r2, r2, #1
	cmp	r0, r2
	mov	r0, #0
	add	r2, r1, #1
	moveq	r0, #1
	str	r2, [r4, #108]
	b	.LBB30_18
.LBB30_17:                              @   in Loop: Header=BB30_1 Depth=1
	ldr	r2, [r4, #108]
	add	r2, r2, r1
	mov	r1, #0
	str	r2, [r4, #108]
	str	r1, [r4, #96]
	ldr	r1, [r4, #56]
	ldrb	r3, [r1, r2]!
	str	r3, [r4, #72]
	ldr	r7, [r4, #88]
	ldrb	r1, [r1, #1]
	ldr	r6, [r4, #84]
	eor	r1, r1, r3, lsl r7
	and	r1, r1, r6
	str	r1, [r4, #72]
.LBB30_18:                              @   in Loop: Header=BB30_1 Depth=1
	cmp	r0, #0
	beq	.LBB30_1
@ BB#19:                                @   in Loop: Header=BB30_1 Depth=1
	ldr	r0, [r4, #92]
	mov	r6, #0
	mov	r1, r6
	cmp	r0, #0
	ldrge	r1, [r4, #56]
	sub	r2, r2, r0
	mov	r3, #0
	addge	r1, r1, r0
	mov	r0, r4
	bl	_tr_flush_block
	ldr	r0, [r4, #108]
	str	r0, [r4, #92]
	ldr	r0, [r4]
	bl	flush_pending
	ldr	r0, [r4]
	ldr	r0, [r0, #16]
	cmp	r0, #0
	bne	.LBB30_1
	b	.LBB30_25
.LBB30_20:
	ldr	r0, [r4, #108]
	mov	r2, #692
	orr	r2, r2, #5120
	cmp	r0, #2
	mov	r1, r0
	movhs	r1, #2
	str	r1, [r4, r2]
	ldr	r1, [sp]                @ 4-byte Reload
	cmp	r1, #4
	bne	.LBB30_22
@ BB#21:
	ldr	r2, [r4, #92]
	mov	r1, #0
	mov	r3, #1
	cmp	r2, #0
	ldrge	r1, [r4, #56]
	addge	r1, r1, r2
	sub	r2, r0, r2
	mov	r0, r4
	bl	_tr_flush_block
	ldr	r0, [r4, #108]
	str	r0, [r4, #92]
	ldr	r0, [r4]
	bl	flush_pending
	ldr	r0, [r4]
	ldr	r1, [r0, #16]
	mov	r0, #3
	cmp	r1, #0
	moveq	r0, #2
	add	sp, sp, #4
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
.LBB30_22:
	ldr	r1, [r8]
	cmp	r1, #0
	beq	.LBB30_24
@ BB#23:
	ldr	r2, [r4, #92]
	mov	r6, #0
	mov	r1, r6
	cmp	r2, #0
	ldrge	r1, [r4, #56]
	mov	r3, #0
	addge	r1, r1, r2
	sub	r2, r0, r2
	mov	r0, r4
	bl	_tr_flush_block
	ldr	r0, [r4, #108]
	str	r0, [r4, #92]
	ldr	r0, [r4]
	bl	flush_pending
	ldr	r0, [r4]
	ldr	r0, [r0, #16]
	cmp	r0, #0
	movne	r6, #1
	b	.LBB30_25
.LBB30_24:
	mov	r6, #1
.LBB30_25:                              @ %.loopexit
	mov	r0, r6
	add	sp, sp, #4
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.align	2
@ BB#26:
.LCPI30_0:
	.long	4294967034              @ 0xfffffefa
.LCPI30_1:
	.long	_length_code
.LCPI30_2:
	.long	_dist_code
.Ltmp30:
	.size	deflate_fast, .Ltmp30-deflate_fast

	.align	2
	.type	deflate_slow,%function
deflate_slow:                           @ @deflate_slow
@ BB#0:
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	sub	sp, sp, #12
	mov	r4, r0
	add	r0, r4, #668
	add	r10, r0, #5120
	add	r0, r4, #664
	mov	r5, r1
	add	r9, r0, #5120
	add	r0, r4, #676
	add	r1, r4, #1696
	add	r11, r0, #5120
	add	r7, r1, #4096
	str	r5, [sp, #8]            @ 4-byte Spill
.LBB31_1:                               @ %.backedgethread-pre-split
                                        @ =>This Loop Header: Depth=1
                                        @     Child Loop BB31_3 Depth 2
                                        @     Child Loop BB31_25 Depth 2
	ldr	r0, [r4, #116]
	b	.LBB31_3
.LBB31_2:                               @   in Loop: Header=BB31_3 Depth=2
	mov	r0, #1
	str	r0, [r4, #104]
	ldr	r0, [r4, #108]
	add	r0, r0, #1
	str	r0, [r4, #108]
	ldr	r0, [r4, #116]
	sub	r0, r0, #1
	str	r0, [r4, #116]
.LBB31_3:                               @ %.backedge
                                        @   Parent Loop BB31_1 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	lsr	r0, r0, #1
	cmp	r0, #130
	bhi	.LBB31_8
@ BB#4:                                 @   in Loop: Header=BB31_3 Depth=2
	mov	r0, r4
	bl	fill_window
	ldr	r0, [r4, #116]
	lsr	r1, r0, #1
	cmp	r1, #130
	bhi	.LBB31_8
@ BB#5:                                 @   in Loop: Header=BB31_3 Depth=2
	mov	r6, #0
	cmp	r5, #0
	beq	.LBB31_37
@ BB#6:                                 @   in Loop: Header=BB31_3 Depth=2
	cmp	r0, #0
	beq	.LBB31_30
@ BB#7:                                 @ %.thread
                                        @   in Loop: Header=BB31_3 Depth=2
	cmp	r0, #2
	bls	.LBB31_15
.LBB31_8:                               @ %.thread.thread
                                        @   in Loop: Header=BB31_3 Depth=2
	ldr	r2, [r4, #56]
	ldr	r0, [r4, #108]
	ldr	r6, [r4, #88]
	ldr	r1, [r4, #72]
	add	r2, r0, r2
	ldr	r3, [r4, #84]
	ldrb	r2, [r2, #2]
	eor	r1, r2, r1, lsl r6
	and	r1, r1, r3
	str	r1, [r4, #72]
	ldr	r6, [r4, #68]
	ldr	r2, [r4, #52]
	add	r1, r6, r1, lsl #1
	ldr	r3, [r4, #64]
	and	r0, r2, r0
	ldrh	r1, [r1]
	add	r0, r3, r0, lsl #1
	cmp	r1, #0
	strh	r1, [r0]
	ldr	r2, [r4, #72]
	ldr	r0, [r4, #68]
	ldr	r3, [r4, #108]
	add	r0, r0, r2, lsl #1
	strh	r3, [r0]
	ldr	r2, [r4, #96]
	str	r2, [r4, #120]
	ldr	r0, [r4, #112]
	str	r0, [r4, #100]
	mov	r0, #2
	str	r0, [r4, #96]
	beq	.LBB31_17
@ BB#9:                                 @   in Loop: Header=BB31_3 Depth=2
	ldr	r3, [r4, #128]
	mov	r0, #2
	cmp	r2, r3
	bhs	.LBB31_18
@ BB#10:                                @   in Loop: Header=BB31_3 Depth=2
	ldr	r0, .LCPI31_0
	ldr	r2, [r4, #44]
	ldr	r3, [r4, #108]
	add	r2, r2, r0
	mov	r0, #2
	sub	r3, r3, r1
	cmp	r3, r2
	bhi	.LBB31_17
@ BB#11:                                @   in Loop: Header=BB31_3 Depth=2
	mov	r0, r4
	bl	longest_match
	str	r0, [r4, #96]
	cmp	r0, #5
	bhi	.LBB31_17
@ BB#12:                                @   in Loop: Header=BB31_3 Depth=2
	ldr	r1, [r4, #136]
	cmp	r1, #1
	beq	.LBB31_16
@ BB#13:                                @   in Loop: Header=BB31_3 Depth=2
	cmp	r0, #3
	bne	.LBB31_17
@ BB#14:                                @   in Loop: Header=BB31_3 Depth=2
	ldr	r0, [r4, #108]
	ldr	r1, [r4, #112]
	sub	r1, r0, r1
	mov	r0, #3
	cmp	r1, #4096
	bls	.LBB31_17
	b	.LBB31_16
.LBB31_15:                              @ %.thread112
                                        @   in Loop: Header=BB31_3 Depth=2
	ldr	r0, [r4, #96]
	str	r0, [r4, #120]
	ldr	r0, [r4, #112]
	str	r0, [r4, #100]
.LBB31_16:                              @   in Loop: Header=BB31_3 Depth=2
	mov	r0, #2
	str	r0, [r4, #96]
.LBB31_17:                              @ %thread-pre-split
                                        @   in Loop: Header=BB31_3 Depth=2
	ldr	r2, [r4, #120]
.LBB31_18:                              @   in Loop: Header=BB31_3 Depth=2
	cmp	r2, #3
	bhs	.LBB31_23
.LBB31_19:                              @   in Loop: Header=BB31_3 Depth=2
	ldr	r0, [r4, #104]
	cmp	r0, #0
	beq	.LBB31_2
@ BB#20:                                @   in Loop: Header=BB31_3 Depth=2
	ldr	r0, [r7]
	ldr	r2, [r4, #56]
	ldr	r3, [r4, #108]
	ldr	r1, [r11]
	add	r1, r1, r0, lsl #1
	add	r0, r3, r2
	sub	r0, r0, #1
	mov	r2, #0
	ldrb	r0, [r0]
	strh	r2, [r1]
	ldr	r1, [r7]
	add	r2, r1, #1
	str	r2, [r7]
	ldr	r3, [r9]
	add	r2, r4, r0, lsl #2
	strb	r0, [r3, r1]
	ldrh	r0, [r2, #148]
	add	r0, r0, #1
	strh	r0, [r2, #148]
	ldr	r0, [r10]
	ldr	r1, [r7]
	sub	r0, r0, #1
	cmp	r1, r0
	bne	.LBB31_22
@ BB#21:                                @   in Loop: Header=BB31_3 Depth=2
	ldr	r0, [r4, #92]
	mov	r1, #0
	ldr	r2, [r4, #108]
	cmp	r0, #0
	ldrge	r1, [r4, #56]
	sub	r2, r2, r0
	mov	r3, #0
	addge	r1, r1, r0
	mov	r0, r4
	bl	_tr_flush_block
	ldr	r0, [r4, #108]
	str	r0, [r4, #92]
	ldr	r0, [r4]
	bl	flush_pending
.LBB31_22:                              @   in Loop: Header=BB31_3 Depth=2
	ldr	r0, [r4, #108]
	mov	r6, #0
	add	r0, r0, #1
	str	r0, [r4, #108]
	ldr	r0, [r4, #116]
	sub	r0, r0, #1
	str	r0, [r4, #116]
	ldr	r1, [r4]
	ldr	r1, [r1, #16]
	cmp	r1, #0
	bne	.LBB31_3
	b	.LBB31_37
.LBB31_23:                              @   in Loop: Header=BB31_3 Depth=2
	cmp	r0, r2
	bhi	.LBB31_19
@ BB#24:                                @   in Loop: Header=BB31_1 Depth=1
	ldr	r0, [r7]
	ldr	r1, [r11]
	ldr	r3, [r4, #100]
	add	r6, r1, r0, lsl #1
	ldr	r0, [r4, #108]
	mov	r1, #255
	orr	r1, r1, #65280
	add	r1, r0, r1
	sub	r3, r1, r3
	add	r2, r2, #253
	ldr	r1, .LCPI31_1
	ldr	r12, [r4, #116]
	strh	r3, [r6]
	uxtb	r5, r2
	ldr	r6, [r7]
	ldrb	r5, [r1, r5]
	add	r1, r6, #1
	str	r1, [r7]
	orr	r5, r5, #256
	ldr	r1, [r9]
	add	r5, r4, r5, lsl #2
	strb	r2, [r1, r6]
	ldrh	r1, [r5, #152]
	add	r0, r0, r12
	sub	r0, r0, #3
	add	r1, r1, #1
	strh	r1, [r5, #152]
	sub	r1, r3, #1
	mov	r3, #392
	uxth	r2, r1
	cmp	r2, #256
	movhs	r1, #256
	addhs	r2, r1, r2, lsr #7
	ldr	r1, .LCPI31_2
	orr	r3, r3, #2048
	ldrb	r1, [r1, r2]
	add	r1, r4, r1, lsl #2
	ldrh	r2, [r1, r3]
	add	r2, r2, #1
	strh	r2, [r1, r3]
	ldr	r6, [r4, #120]
	ldr	r2, [r10]
	ldr	r3, [r4, #116]
	ldr	r12, [r7]
	rsb	r1, r6, #1
	add	r1, r1, r3
	sub	r3, r6, #2
	sub	lr, r2, #1
	str	r1, [r4, #116]
	str	r3, [r4, #120]
.LBB31_25:                              @ %._crit_edge
                                        @   Parent Loop BB31_1 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r5, [r4, #108]
	add	r6, r5, #1
	str	r6, [r4, #108]
	cmp	r6, r0
	bhi	.LBB31_27
@ BB#26:                                @   in Loop: Header=BB31_25 Depth=2
	ldr	r2, [r4, #56]
	ldr	r8, [r4, #88]
	ldr	r3, [r4, #72]
	add	r2, r5, r2
	ldr	r1, [r4, #84]
	ldrb	r2, [r2, #3]
	eor	r2, r2, r3, lsl r8
	and	r1, r2, r1
	str	r1, [r4, #72]
	ldr	r5, [r4, #68]
	ldr	r2, [r4, #52]
	add	r1, r5, r1, lsl #1
	ldr	r3, [r4, #64]
	and	r2, r2, r6
	add	r2, r3, r2, lsl #1
	ldrh	r1, [r1]
	strh	r1, [r2]
	ldr	r1, [r4, #72]
	ldr	r2, [r4, #68]
	ldr	r3, [r4, #108]
	add	r1, r2, r1, lsl #1
	strh	r3, [r1]
	ldr	r3, [r4, #120]
.LBB31_27:                              @   in Loop: Header=BB31_25 Depth=2
	subs	r3, r3, #1
	str	r3, [r4, #120]
	bne	.LBB31_25
@ BB#28:                                @   in Loop: Header=BB31_1 Depth=1
	mov	r0, #0
	str	r0, [r4, #104]
	mov	r0, #2
	str	r0, [r4, #96]
	ldr	r0, [r4, #108]
	ldr	r5, [sp, #8]            @ 4-byte Reload
	cmp	r12, lr
	add	r0, r0, #1
	str	r0, [r4, #108]
	bne	.LBB31_1
@ BB#29:                                @   in Loop: Header=BB31_1 Depth=1
	ldr	r2, [r4, #92]
	mov	r6, #0
	mov	r1, r6
	cmp	r2, #0
	ldrge	r1, [r4, #56]
	mov	r3, #0
	addge	r1, r1, r2
	sub	r2, r0, r2
	mov	r0, r4
	bl	_tr_flush_block
	ldr	r0, [r4, #108]
	str	r0, [r4, #92]
	ldr	r0, [r4]
	bl	flush_pending
	ldr	r0, [r4]
	ldr	r0, [r0, #16]
	cmp	r0, #0
	bne	.LBB31_1
	b	.LBB31_37
.LBB31_30:
	ldr	r0, [r4, #104]
	cmp	r0, #0
	beq	.LBB31_32
@ BB#31:
	ldr	r0, [r7]
	ldr	r3, [r4, #56]
	ldr	r6, [r4, #108]
	ldr	r1, [r11]
	add	r2, r1, r0, lsl #1
	add	r0, r6, r3
	sub	r0, r0, #1
	ldrb	r1, [r0]
	mov	r0, #0
	strh	r0, [r2]
	ldr	r2, [r7]
	add	r3, r2, #1
	str	r3, [r7]
	ldr	r6, [r9]
	add	r3, r4, r1, lsl #2
	strb	r1, [r6, r2]
	ldrh	r1, [r3, #148]
	add	r1, r1, #1
	strh	r1, [r3, #148]
	str	r0, [r4, #104]
.LBB31_32:
	ldr	r0, [r4, #108]
	mov	r2, #692
	orr	r2, r2, #5120
	cmp	r0, #2
	mov	r1, r0
	movhs	r1, #2
	str	r1, [r4, r2]
	cmp	r5, #4
	bne	.LBB31_34
@ BB#33:
	ldr	r2, [r4, #92]
	mov	r1, #0
	mov	r3, #1
	cmp	r2, #0
	ldrge	r1, [r4, #56]
	addge	r1, r1, r2
	sub	r2, r0, r2
	mov	r0, r4
	bl	_tr_flush_block
	ldr	r0, [r4, #108]
	str	r0, [r4, #92]
	ldr	r0, [r4]
	bl	flush_pending
	ldr	r0, [r4]
	ldr	r1, [r0, #16]
	mov	r0, #3
	cmp	r1, #0
	moveq	r0, #2
	add	sp, sp, #12
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
.LBB31_34:
	ldr	r1, [r7]
	cmp	r1, #0
	beq	.LBB31_36
@ BB#35:
	ldr	r2, [r4, #92]
	mov	r6, #0
	mov	r1, r6
	cmp	r2, #0
	ldrge	r1, [r4, #56]
	mov	r3, #0
	addge	r1, r1, r2
	sub	r2, r0, r2
	mov	r0, r4
	bl	_tr_flush_block
	ldr	r0, [r4, #108]
	str	r0, [r4, #92]
	ldr	r0, [r4]
	bl	flush_pending
	ldr	r0, [r4]
	ldr	r0, [r0, #16]
	cmp	r0, #0
	movne	r6, #1
	b	.LBB31_37
.LBB31_36:
	mov	r6, #1
.LBB31_37:                              @ %.loopexit
	mov	r0, r6
	add	sp, sp, #12
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.align	2
@ BB#38:
.LCPI31_0:
	.long	4294967034              @ 0xfffffefa
.LCPI31_1:
	.long	_length_code
.LCPI31_2:
	.long	_dist_code
.Ltmp31:
	.size	deflate_slow, .Ltmp31-deflate_slow

	.align	2
	.type	longest_match,%function
longest_match:                          @ @longest_match
@ BB#0:
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	sub	sp, sp, #32
	str	r0, [sp, #24]           @ 4-byte Spill
	ldr	r3, .LCPI32_0
	ldr	r2, [r0, #52]
	ldr	r6, [r0, #140]
	ldr	r7, [r0, #44]
	str	r2, [sp, #20]           @ 4-byte Spill
	ldr	r2, [r0, #64]
	ldr	r5, [r0, #124]
	ldr	r4, [r0, #116]
	str	r2, [sp, #16]           @ 4-byte Spill
	ldr	r2, [r0, #120]
	ldr	r9, [r0, #56]
	add	r3, r7, r3
	cmp	r2, r6
	ldr	r6, [r0, #108]
	ldr	r0, [r0, #144]
	lsrhs	r5, r5, #2
	subs	r3, r6, r3
	movls	r3, #0
	cmp	r0, r4
	movhi	r0, r4
	str	r0, [sp, #8]            @ 4-byte Spill
	add	r0, r6, #1
	add	r0, r0, #256
	str	r3, [sp, #12]           @ 4-byte Spill
	str	r0, [sp, #4]            @ 4-byte Spill
	mov	r0, #2
	add	r3, r2, r6
	add	r11, r6, r9
	orr	r0, r0, #256
	str	r4, [sp]                @ 4-byte Spill
	add	r12, r11, r0
	ldrb	r0, [r3, r9]!
	sub	r3, r3, #1
	ldrb	lr, [r3]
	str	r0, [sp, #28]           @ 4-byte Spill
	b	.LBB32_9
.LBB32_1:                               @   in Loop: Header=BB32_9 Depth=1
	subs	r5, r5, #1
	bne	.LBB32_9
	b	.LBB32_29
.LBB32_2:                               @   in Loop: Header=BB32_9 Depth=1
	add	r3, r8, #1
	b	.LBB32_24
.LBB32_3:                               @   in Loop: Header=BB32_9 Depth=1
	add	r3, r8, #2
	b	.LBB32_24
.LBB32_4:                               @   in Loop: Header=BB32_9 Depth=1
	add	r3, r8, #3
	b	.LBB32_24
.LBB32_5:                               @   in Loop: Header=BB32_9 Depth=1
	add	r3, r8, #4
	b	.LBB32_24
.LBB32_6:                               @   in Loop: Header=BB32_9 Depth=1
	add	r3, r8, #5
	b	.LBB32_24
.LBB32_7:                               @   in Loop: Header=BB32_9 Depth=1
	add	r3, r8, #6
	b	.LBB32_24
.LBB32_8:                               @   in Loop: Header=BB32_9 Depth=1
	add	r3, r8, #7
	b	.LBB32_24
.LBB32_9:                               @ =>This Loop Header: Depth=1
                                        @     Child Loop BB32_14 Depth 2
	add	r3, r2, r1
	ldr	r0, [sp, #28]           @ 4-byte Reload
	ldrb	r4, [r9, r3]
	uxtb	r7, r0
	cmp	r4, r7
	bne	.LBB32_27
@ BB#10:                                @   in Loop: Header=BB32_9 Depth=1
	add	r3, r3, r9
	sub	r3, r3, #1
	uxtb	r4, lr
	ldrb	r3, [r3]
	cmp	r3, r4
	bne	.LBB32_27
@ BB#11:                                @   in Loop: Header=BB32_9 Depth=1
	ldrb	r3, [r9, r6]
	ldrb	r4, [r9, r1]
	cmp	r4, r3
	bne	.LBB32_27
@ BB#12:                                @   in Loop: Header=BB32_9 Depth=1
	add	r3, r1, r9
	ldrb	r4, [r11, #1]
	ldrb	r3, [r3, #1]
	cmp	r3, r4
	bne	.LBB32_27
@ BB#13:                                @   in Loop: Header=BB32_9 Depth=1
	add	r8, r11, #2
	mov	r3, r9
.LBB32_14:                              @   Parent Loop BB32_9 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	add	r10, r3, r6
	add	r4, r3, r1
	ldrb	r0, [r10, #3]
	ldrb	r7, [r4, #3]
	cmp	r0, r7
	bne	.LBB32_2
@ BB#15:                                @   in Loop: Header=BB32_14 Depth=2
	ldrb	r7, [r4, #4]
	ldrb	r0, [r10, #4]
	cmp	r0, r7
	bne	.LBB32_3
@ BB#16:                                @   in Loop: Header=BB32_14 Depth=2
	ldrb	r7, [r4, #5]
	ldrb	r0, [r10, #5]
	cmp	r0, r7
	bne	.LBB32_4
@ BB#17:                                @   in Loop: Header=BB32_14 Depth=2
	ldrb	r7, [r4, #6]
	ldrb	r0, [r10, #6]
	cmp	r0, r7
	bne	.LBB32_5
@ BB#18:                                @   in Loop: Header=BB32_14 Depth=2
	ldrb	r7, [r4, #7]
	ldrb	r0, [r10, #7]
	cmp	r0, r7
	bne	.LBB32_6
@ BB#19:                                @   in Loop: Header=BB32_14 Depth=2
	ldrb	r7, [r4, #8]
	ldrb	r0, [r10, #8]
	cmp	r0, r7
	bne	.LBB32_7
@ BB#20:                                @   in Loop: Header=BB32_14 Depth=2
	ldrb	r7, [r4, #9]
	ldrb	r0, [r10, #9]
	cmp	r0, r7
	bne	.LBB32_8
@ BB#21:                                @   in Loop: Header=BB32_14 Depth=2
	ldrb	r7, [r10, #10]!
	ldrb	r0, [r4, #10]
	add	r3, r3, #8
	cmp	r7, r0
	bne	.LBB32_23
@ BB#22:                                @   in Loop: Header=BB32_14 Depth=2
	add	r8, r8, #8
	cmp	r10, r12
	blo	.LBB32_14
.LBB32_23:                              @ %..critedge_crit_edge
                                        @   in Loop: Header=BB32_9 Depth=1
	add	r0, r3, r6
	add	r3, r0, #2
.LBB32_24:                              @ %.critedge
                                        @   in Loop: Header=BB32_9 Depth=1
	mov	r0, #2
	sub	r4, r3, r12
	orr	r0, r0, #256
	add	r3, r4, r0
	cmp	r3, r2
	ble	.LBB32_27
@ BB#25:                                @   in Loop: Header=BB32_9 Depth=1
	ldr	r0, [sp, #24]           @ 4-byte Reload
	str	r1, [r0, #112]
	ldr	r0, [sp, #8]            @ 4-byte Reload
	cmp	r3, r0
	bge	.LBB32_28
@ BB#26:                                @   in Loop: Header=BB32_9 Depth=1
	add	r0, r3, r6
	mov	r2, r3
	ldrb	r0, [r9, r0]
	str	r0, [sp, #28]           @ 4-byte Spill
	ldr	r0, [sp, #4]            @ 4-byte Reload
	add	r0, r0, r4
	ldrb	lr, [r9, r0]
.LBB32_27:                              @   in Loop: Header=BB32_9 Depth=1
	ldr	r0, [sp, #20]           @ 4-byte Reload
	and	r0, r1, r0
	ldr	r1, [sp, #16]           @ 4-byte Reload
	add	r0, r1, r0, lsl #1
	ldrh	r1, [r0]
	ldr	r0, [sp, #12]           @ 4-byte Reload
	cmp	r1, r0
	bls	.LBB32_29
	b	.LBB32_1
.LBB32_28:
	mov	r2, r3
.LBB32_29:                              @ %.critedge9
	ldr	r0, [sp]                @ 4-byte Reload
	cmp	r2, r0
	movhi	r2, r0
	mov	r0, r2
	add	sp, sp, #32
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.align	2
@ BB#30:
.LCPI32_0:
	.long	4294967034              @ 0xfffffefa
.Ltmp32:
	.size	longest_match, .Ltmp32-longest_match

	.globl	zlibVersion
	.align	2
	.type	zlibVersion,%function
zlibVersion:                            @ @zlibVersion
@ BB#0:
	ldr	r0, .LCPI33_0
	bx	lr
	.align	2
@ BB#1:
.LCPI33_0:
	.long	.L.str9
.Ltmp33:
	.size	zlibVersion, .Ltmp33-zlibVersion

	.globl	zlibCompileFlags
	.align	2
	.type	zlibCompileFlags,%function
zlibCompileFlags:                       @ @zlibCompileFlags
@ BB#0:
	mov	r0, #85
	bx	lr
.Ltmp34:
	.size	zlibCompileFlags, .Ltmp34-zlibCompileFlags

	.globl	zError
	.align	2
	.type	zError,%function
zError:                                 @ @zError
@ BB#0:
	ldr	r1, .LCPI35_0
	rsb	r0, r0, #2
	ldr	r0, [r1, r0, lsl #2]
	bx	lr
	.align	2
@ BB#1:
.LCPI35_0:
	.long	z_errmsg
.Ltmp35:
	.size	zError, .Ltmp35-zError

	.globl	zcalloc
	.align	2
	.type	zcalloc,%function
zcalloc:                                @ @zcalloc
@ BB#0:
	ldr	r3, .LCPI36_0
	ldr	r0, [r3]
	mla	r1, r2, r1, r0
	add	r1, r1, #3
	bic	r1, r1, #3
	str	r1, [r3]
	bx	lr
	.align	2
@ BB#1:
.LCPI36_0:
	.long	heap_offset
.Ltmp36:
	.size	zcalloc, .Ltmp36-zcalloc

	.globl	zcfree
	.align	2
	.type	zcfree,%function
zcfree:                                 @ @zcfree
@ BB#0:
	bx	lr
.Ltmp37:
	.size	zcfree, .Ltmp37-zcfree

	.globl	adler32
	.align	2
	.type	adler32,%function
adler32:                                @ @adler32
@ BB#0:
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	lsr	r12, r0, #16
	uxth	r10, r0
	cmp	r2, #1
	bne	.LBB38_2
@ BB#1:
	ldrb	r0, [r1]
	mov	r2, #4080
	ldr	r1, .LCPI38_2
	add	r0, r0, r10
	orr	r2, r2, #61440
	cmp	r0, r2
	addhi	r0, r0, r1
	add	r1, r0, r12
	cmp	r1, r2
	addhi	r1, r1, #15
	orr	r0, r0, r1, lsl #16
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
.LBB38_2:
	mov	r0, #1
	cmp	r1, #0
	beq	.LBB38_7
@ BB#3:
	cmp	r2, #16
	bhs	.LBB38_8
@ BB#4:                                 @ %.preheader
	cmp	r2, #0
	beq	.LBB38_6
.LBB38_5:                               @ %.lr.ph
                                        @ =>This Inner Loop Header: Depth=1
	ldrb	r0, [r1], #1
	subs	r2, r2, #1
	add	r10, r0, r10
	add	r12, r10, r12
	bne	.LBB38_5
.LBB38_6:                               @ %._crit_edge
	ldr	r0, .LCPI38_1
	mov	r2, #241
	orr	r2, r2, #65280
	umull	r1, r0, r12, r0
	lsr	r1, r0, #15
	ldr	r0, .LCPI38_2
	mul	r1, r1, r2
	mov	r2, #4080
	orr	r2, r2, #61440
	cmp	r10, r2
	addhi	r10, r10, r0
	sub	r0, r12, r1
	orr	r0, r10, r0, lsl #16
.LBB38_7:
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
.LBB38_8:                               @ %.preheader172
	mov	lr, #175
	orr	lr, lr, #5376
	cmp	r2, lr
	bls	.LBB38_15
@ BB#9:
	mov	r9, #241
	orr	r9, r9, #65280
.LBB38_10:                              @ %.lr.ph177
                                        @ =>This Loop Header: Depth=1
                                        @     Child Loop BB38_11 Depth 2
	ldr	r0, .LCPI38_0
	mov	r5, #0
	add	r2, r2, r0
.LBB38_11:                              @   Parent Loop BB38_10 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	mov	r6, r1
	ldrb	r7, [r6, -r5]!
	sub	r5, r5, #16
	ldrb	r3, [r6, #1]
	ldrb	r0, [r6, #2]
	add	r8, r7, r10
	add	r7, r8, r3
	ldrb	r4, [r6, #3]
	add	r3, r7, r0
	add	r0, r8, r12
	add	r0, r0, r7
	add	r0, r0, r3
	add	r3, r3, r4
	ldrb	r11, [r6, #4]
	add	r4, r0, r3
	ldrb	r0, [r6, #5]
	add	r7, r3, r11
	ldrb	r3, [r6, #6]
	add	r4, r4, r7
	add	r7, r7, r0
	ldrb	r0, [r6, #7]
	add	r4, r4, r7
	add	r7, r7, r3
	ldrb	r3, [r6, #8]
	add	r4, r4, r7
	add	r7, r7, r0
	ldrb	r0, [r6, #9]
	add	r3, r7, r3
	add	r4, r4, r7
	add	r7, r4, r3
	add	r0, r3, r0
	ldrb	r10, [r6, #15]
	ldrb	r12, [r6, #14]
	ldrb	r8, [r6, #13]
	ldrb	r4, [r6, #12]
	ldrb	r3, [r6, #11]
	ldrb	r6, [r6, #10]
	add	r7, r7, r0
	add	r6, r0, r6
	add	r7, r7, r6
	add	r3, r6, r3
	add	r6, r7, r3
	add	r3, r3, r4
	add	r4, r6, r3
	add	r3, r3, r8
	add	r4, r4, r3
	add	r3, r3, r12
	ldr	r0, .LCPI38_0
	add	r7, r4, r3
	add	r10, r3, r10
	add	r12, r7, r10
	cmp	r5, r0
	bne	.LBB38_11
@ BB#12:                                @   in Loop: Header=BB38_10 Depth=1
	ldr	r0, .LCPI38_1
	cmp	r2, lr
	umull	r4, r3, r12, r0
	umull	r4, r0, r10, r0
	lsr	r3, r3, #15
	lsr	r4, r0, #15
	mul	r0, r3, r9
	mul	r3, r4, r9
	mov	r4, #1456
	orr	r4, r4, #4096
	add	r1, r1, r4
	sub	r12, r12, r0
	sub	r10, r10, r3
	bhi	.LBB38_10
@ BB#13:                                @ %._crit_edge178
	cmp	r2, #0
	beq	.LBB38_19
@ BB#14:                                @ %.preheader159
	cmp	r2, #15
	bls	.LBB38_17
.LBB38_15:                              @ %.lr.ph164
                                        @ =>This Inner Loop Header: Depth=1
	ldrb	r7, [r1]
	ldrb	r0, [r1, #1]
	ldrb	r4, [r1, #2]
	add	r7, r7, r10
	ldrb	r6, [r1, #3]
	add	r0, r7, r0
	add	r7, r7, r12
	add	r5, r7, r0
	add	r4, r0, r4
	ldrb	r0, [r1, #4]
	add	r5, r5, r4
	add	r4, r4, r6
	ldrb	r6, [r1, #5]
	add	r5, r5, r4
	add	r4, r4, r0
	ldrb	r0, [r1, #6]
	add	r5, r5, r4
	add	r4, r4, r6
	ldrb	r6, [r1, #7]
	add	r5, r5, r4
	add	r4, r4, r0
	ldrb	r0, [r1, #8]
	add	r5, r5, r4
	add	r4, r4, r6
	ldrb	r6, [r1, #9]
	add	r5, r5, r4
	add	r4, r4, r0
	ldrb	r0, [r1, #10]
	add	r6, r4, r6
	add	r5, r5, r4
	ldrb	r4, [r1, #11]
	ldrb	r7, [r1, #12]
	ldrb	r3, [r1, #13]
	add	r5, r5, r6
	add	r0, r6, r0
	add	r6, r5, r0
	add	r0, r0, r4
	ldrb	r8, [r1, #14]
	ldrb	lr, [r1, #15]
	add	r6, r6, r0
	add	r0, r0, r7
	add	r7, r6, r0
	add	r0, r0, r3
	add	r3, r7, r0
	add	r0, r0, r8
	add	r3, r3, r0
	add	r10, r0, lr
	sub	r2, r2, #16
	add	r12, r3, r10
	add	r1, r1, #16
	cmp	r2, #15
	bhi	.LBB38_15
@ BB#16:                                @ %.preheader150
	cmp	r2, #0
	beq	.LBB38_18
.LBB38_17:                              @ %.lr.ph155
                                        @ =>This Inner Loop Header: Depth=1
	ldrb	r0, [r1], #1
	subs	r2, r2, #1
	add	r10, r0, r10
	add	r12, r10, r12
	bne	.LBB38_17
.LBB38_18:                              @ %._crit_edge156
	ldr	r0, .LCPI38_1
	umull	r2, r1, r12, r0
	umull	r0, r2, r10, r0
	lsr	r0, r1, #15
	lsr	r1, r2, #15
	mov	r2, #241
	orr	r2, r2, #65280
	mul	r0, r0, r2
	mul	r1, r1, r2
	sub	r12, r12, r0
	sub	r10, r10, r1
.LBB38_19:
	orr	r0, r10, r12, lsl #16
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.align	2
@ BB#20:
.LCPI38_0:
	.long	4294961744              @ 0xffffea50
.LCPI38_1:
	.long	2147975281              @ 0x80078071
.LCPI38_2:
	.long	4294901775              @ 0xffff000f
.Ltmp38:
	.size	adler32, .Ltmp38-adler32

	.globl	adler32_combine
	.align	2
	.type	adler32_combine,%function
adler32_combine:                        @ @adler32_combine
@ BB#0:
	push	{r4, r5, r11, lr}
	mvn	r3, #0
	cmp	r2, #0
	blt	.LBB39_4
@ BB#1:
	ldr	r3, .LCPI39_0
	mov	r12, #241
	orr	r12, r12, #65280
	uxth	lr, r0
	smmla	r4, r2, r3, r2
	lsr	r0, r0, #16
	asr	r5, r4, #15
	add	r4, r5, r4, lsr #31
	mul	r5, r4, r12
	sub	r2, r2, r5
	mul	r4, r2, lr
	umull	r5, r3, r4, r3
	lsr	r3, r3, #15
	add	r5, r0, r1, lsr #16
	mul	r3, r3, r12
	uxtah	r1, lr, r1
	sub	r0, r4, r3
	add	r3, r5, r12
	sub	r2, r3, r2
	add	r0, r2, r0
	mov	r2, #4080
	orr	r2, r2, #61440
	add	r4, r1, r2
	cmp	r4, r12
	blo	.LBB39_3
@ BB#2:
	ldr	r3, .LCPI39_1
	ldr	r1, .LCPI39_2
	add	r1, r4, r1
	cmp	r1, r2
	addhi	r1, r4, r3
	mov	r4, r1
.LBB39_3:                               @ %.thread.i
	ldr	r1, .LCPI39_1
	ldr	r3, .LCPI39_3
	cmp	r0, r3
	addhi	r0, r0, r1
	cmp	r0, r2
	addhi	r0, r0, #15
	orr	r3, r4, r0, lsl #16
.LBB39_4:                               @ %adler32_combine_.exit
	mov	r0, r3
	pop	{r4, r5, r11, pc}
	.align	2
@ BB#5:
.LCPI39_0:
	.long	2147975281              @ 0x80078071
.LCPI39_1:
	.long	4294836254              @ 0xfffe001e
.LCPI39_2:
	.long	4294901775              @ 0xffff000f
.LCPI39_3:
	.long	131041                  @ 0x1ffe1
.Ltmp39:
	.size	adler32_combine, .Ltmp39-adler32_combine

	.globl	adler32_combine64
	.align	2
	.type	adler32_combine64,%function
adler32_combine64:                      @ @adler32_combine64
@ BB#0:
	push	{r4, r5, r11, lr}
	mvn	r3, #0
	cmp	r2, #0
	blt	.LBB40_4
@ BB#1:
	ldr	r3, .LCPI40_0
	mov	r12, #241
	orr	r12, r12, #65280
	uxth	lr, r0
	smmla	r4, r2, r3, r2
	lsr	r0, r0, #16
	asr	r5, r4, #15
	add	r4, r5, r4, lsr #31
	mul	r5, r4, r12
	sub	r2, r2, r5
	mul	r4, r2, lr
	umull	r5, r3, r4, r3
	lsr	r3, r3, #15
	add	r5, r0, r1, lsr #16
	mul	r3, r3, r12
	uxtah	r1, lr, r1
	sub	r0, r4, r3
	add	r3, r5, r12
	sub	r2, r3, r2
	add	r0, r2, r0
	mov	r2, #4080
	orr	r2, r2, #61440
	add	r4, r1, r2
	cmp	r4, r12
	blo	.LBB40_3
@ BB#2:
	ldr	r3, .LCPI40_1
	ldr	r1, .LCPI40_2
	add	r1, r4, r1
	cmp	r1, r2
	addhi	r1, r4, r3
	mov	r4, r1
.LBB40_3:                               @ %.thread.i
	ldr	r1, .LCPI40_1
	ldr	r3, .LCPI40_3
	cmp	r0, r3
	addhi	r0, r0, r1
	cmp	r0, r2
	addhi	r0, r0, #15
	orr	r3, r4, r0, lsl #16
.LBB40_4:                               @ %adler32_combine_.exit
	mov	r0, r3
	pop	{r4, r5, r11, pc}
	.align	2
@ BB#5:
.LCPI40_0:
	.long	2147975281              @ 0x80078071
.LCPI40_1:
	.long	4294836254              @ 0xfffe001e
.LCPI40_2:
	.long	4294901775              @ 0xffff000f
.LCPI40_3:
	.long	131041                  @ 0x1ffe1
.Ltmp40:
	.size	adler32_combine64, .Ltmp40-adler32_combine64

	.globl	get_crc_table
	.align	2
	.type	get_crc_table,%function
get_crc_table:                          @ @get_crc_table
@ BB#0:
	ldr	r0, .LCPI41_0
	bx	lr
	.align	2
@ BB#1:
.LCPI41_0:
	.long	crc_table
.Ltmp41:
	.size	get_crc_table, .Ltmp41-get_crc_table

	.globl	crc32
	.align	2
	.type	crc32,%function
crc32:                                  @ @crc32
@ BB#0:
	push	{r4, r5, r6, lr}
	mov	r3, r0
	mov	r0, #0
	cmp	r1, #0
	beq	.LBB42_8
@ BB#1:
	mvn	r0, r3
	cmp	r2, #8
	blo	.LBB42_4
@ BB#2:
	ldr	r12, .LCPI42_0
.LBB42_3:                               @ %.lr.ph
                                        @ =>This Inner Loop Header: Depth=1
	ldrb	r5, [r1]
	uxtb	r6, r0
	ldrb	r4, [r1, #1]
	eor	r5, r5, r6
	ldrb	r3, [r1, #2]
	ldr	r5, [r12, r5, lsl #2]
	ldrb	lr, [r1, #3]
	eor	r0, r5, r0, lsr #8
	sub	r2, r2, #8
	uxtb	r5, r0
	eor	r4, r5, r4
	cmp	r2, #7
	ldr	r4, [r12, r4, lsl #2]
	eor	r0, r4, r0, lsr #8
	uxtb	r4, r0
	eor	r3, r4, r3
	ldr	r3, [r12, r3, lsl #2]
	eor	r0, r3, r0, lsr #8
	uxtb	r3, r0
	eor	r3, r3, lr
	ldr	r3, [r12, r3, lsl #2]
	eor	r0, r3, r0, lsr #8
	ldrb	r3, [r1, #4]
	uxtb	r6, r0
	eor	r3, r6, r3
	ldr	r3, [r12, r3, lsl #2]
	eor	r0, r3, r0, lsr #8
	ldrb	r3, [r1, #5]
	uxtb	r6, r0
	eor	r3, r6, r3
	ldr	r3, [r12, r3, lsl #2]
	eor	r0, r3, r0, lsr #8
	ldrb	r3, [r1, #6]
	uxtb	r6, r0
	eor	r3, r6, r3
	ldr	r3, [r12, r3, lsl #2]
	eor	r0, r3, r0, lsr #8
	ldrb	r3, [r1, #7]
	uxtb	r6, r0
	add	r1, r1, #8
	eor	r3, r6, r3
	ldr	r3, [r12, r3, lsl #2]
	eor	r0, r3, r0, lsr #8
	bhi	.LBB42_3
.LBB42_4:                               @ %._crit_edge
	cmp	r2, #0
	beq	.LBB42_7
@ BB#5:
	ldr	r3, .LCPI42_0
.LBB42_6:                               @ %.preheader
                                        @ =>This Inner Loop Header: Depth=1
	ldrb	r5, [r1], #1
	uxtb	r6, r0
	subs	r2, r2, #1
	eor	r6, r5, r6
	ldr	r6, [r3, r6, lsl #2]
	eor	r0, r6, r0, lsr #8
	bne	.LBB42_6
.LBB42_7:                               @ %.loopexit
	mvn	r0, r0
.LBB42_8:
	pop	{r4, r5, r6, pc}
	.align	2
@ BB#9:
.LCPI42_0:
	.long	crc_table
.Ltmp42:
	.size	crc32, .Ltmp42-crc32

	.globl	crc32_combine
	.align	2
	.type	crc32_combine,%function
crc32_combine:                          @ @crc32_combine
@ BB#0:
	push	{r11, lr}
	bl	crc32_combine_
	pop	{r11, pc}
.Ltmp43:
	.size	crc32_combine, .Ltmp43-crc32_combine

	.align	2
	.type	crc32_combine_,%function
crc32_combine_:                         @ @crc32_combine_
@ BB#0:
	push	{r4, r5, r6, r7, r8, r9, r11, lr}
	sub	sp, sp, #256
	cmp	r2, #1
	blt	.LBB44_33
@ BB#1:
	ldr	r3, .LCPI44_0
	mov	lr, sp
	mov	r7, #1
	str	r3, [sp]
	mov	r3, #1
.LBB44_2:                               @ =>This Inner Loop Header: Depth=1
	lsl	r6, r7, #1
	str	r7, [lr, r3, lsl #2]
	add	r3, r3, #1
	mov	r7, r6
	cmp	r3, #32
	bne	.LBB44_2
@ BB#3:
	mov	r5, #0
	add	r12, sp, #128
	mov	r8, #0
.LBB44_4:                               @ =>This Loop Header: Depth=1
                                        @     Child Loop BB44_5 Depth 2
	ldr	r7, [lr, r5, lsl #2]
	mov	r6, #0
	mov	r4, lr
	cmp	r7, #0
	beq	.LBB44_6
.LBB44_5:                               @ %.lr.ph.i.i
                                        @   Parent Loop BB44_4 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	tst	r7, #1
	ldrne	r3, [r4]
	add	r4, r4, #4
	eorne	r6, r3, r6
	lsr	r3, r7, #1
	cmp	r8, r7, lsr #1
	mov	r7, r3
	bne	.LBB44_5
.LBB44_6:                               @ %gf2_matrix_times.exit.i
                                        @   in Loop: Header=BB44_4 Depth=1
	str	r6, [r12, r5, lsl #2]
	add	r5, r5, #1
	cmp	r5, #32
	bne	.LBB44_4
@ BB#7:                                 @ %gf2_matrix_square.exit.preheader
	mov	r8, #0
	mov	lr, sp
	mov	r4, r8
.LBB44_8:                               @ %gf2_matrix_square.exit
                                        @ =>This Loop Header: Depth=1
                                        @     Child Loop BB44_9 Depth 2
	ldr	r6, [r12, r4, lsl #2]
	mov	r5, #0
	mov	r7, r12
	cmp	r6, #0
	beq	.LBB44_10
.LBB44_9:                               @ %.lr.ph.i.i26
                                        @   Parent Loop BB44_8 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	tst	r6, #1
	ldrne	r3, [r7]
	add	r7, r7, #4
	eorne	r5, r3, r5
	lsr	r3, r6, #1
	cmp	r8, r6, lsr #1
	mov	r6, r3
	bne	.LBB44_9
.LBB44_10:                              @ %gf2_matrix_times.exit.i29
                                        @   in Loop: Header=BB44_8 Depth=1
	str	r5, [lr, r4, lsl #2]
	add	r4, r4, #1
	cmp	r4, #32
	bne	.LBB44_8
@ BB#11:
	add	r12, sp, #128
	mov	r3, #0
.LBB44_12:                              @ %gf2_matrix_square.exit30
                                        @ =>This Loop Header: Depth=1
                                        @     Child Loop BB44_13 Depth 2
                                        @       Child Loop BB44_14 Depth 3
                                        @     Child Loop BB44_19 Depth 2
                                        @     Child Loop BB44_22 Depth 2
                                        @       Child Loop BB44_23 Depth 3
                                        @     Child Loop BB44_29 Depth 2
	mov	r9, r2
	mov	r2, r3
.LBB44_13:                              @   Parent Loop BB44_12 Depth=1
                                        @ =>  This Loop Header: Depth=2
                                        @       Child Loop BB44_14 Depth 3
	ldr	r6, [lr, r2, lsl #2]
	mov	r5, #0
	mov	r7, lr
	cmp	r6, #0
	beq	.LBB44_15
.LBB44_14:                              @ %.lr.ph.i.i18
                                        @   Parent Loop BB44_12 Depth=1
                                        @     Parent Loop BB44_13 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	tst	r6, #1
	ldrne	r4, [r7]
	add	r7, r7, #4
	eorne	r5, r4, r5
	lsr	r4, r6, #1
	cmp	r3, r6, lsr #1
	mov	r6, r4
	bne	.LBB44_14
.LBB44_15:                              @ %gf2_matrix_times.exit.i21
                                        @   in Loop: Header=BB44_13 Depth=2
	str	r5, [r12, r2, lsl #2]
	add	r2, r2, #1
	cmp	r2, #32
	bne	.LBB44_13
@ BB#16:                                @ %gf2_matrix_square.exit22
                                        @   in Loop: Header=BB44_12 Depth=1
	tst	r9, #1
	bne	.LBB44_18
@ BB#17:                                @   in Loop: Header=BB44_12 Depth=1
	mov	r2, r0
	b	.LBB44_20
.LBB44_18:                              @   in Loop: Header=BB44_12 Depth=1
	mov	r2, #0
	mov	r5, r12
	cmp	r0, #0
	beq	.LBB44_20
.LBB44_19:                              @ %.lr.ph.i12
                                        @   Parent Loop BB44_12 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	tst	r0, #1
	ldrne	r4, [r5]
	add	r5, r5, #4
	eorne	r2, r4, r2
	lsr	r4, r0, #1
	cmp	r3, r0, lsr #1
	mov	r0, r4
	bne	.LBB44_19
.LBB44_20:                              @ %gf2_matrix_times.exit14
                                        @   in Loop: Header=BB44_12 Depth=1
	mov	r0, #0
	cmp	r0, r9, asr #1
	beq	.LBB44_31
@ BB#21:                                @   in Loop: Header=BB44_12 Depth=1
	asr	r8, r9, #1
.LBB44_22:                              @ %.preheader
                                        @   Parent Loop BB44_12 Depth=1
                                        @ =>  This Loop Header: Depth=2
                                        @       Child Loop BB44_23 Depth 3
	add	r6, sp, #128
	ldr	r5, [r6, r0, lsl #2]
	mov	r7, #0
	cmp	r5, #0
	beq	.LBB44_24
.LBB44_23:                              @ %.lr.ph.i.i5
                                        @   Parent Loop BB44_12 Depth=1
                                        @     Parent Loop BB44_22 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	tst	r5, #1
	ldrne	r4, [r6]
	add	r6, r6, #4
	eorne	r7, r4, r7
	lsr	r4, r5, #1
	cmp	r3, r5, lsr #1
	mov	r5, r4
	bne	.LBB44_23
.LBB44_24:                              @ %gf2_matrix_times.exit.i8
                                        @   in Loop: Header=BB44_22 Depth=2
	str	r7, [lr, r0, lsl #2]
	add	r0, r0, #1
	cmp	r0, #32
	bne	.LBB44_22
@ BB#25:                                @ %gf2_matrix_square.exit9
                                        @   in Loop: Header=BB44_12 Depth=1
	tst	r8, #1
	bne	.LBB44_27
@ BB#26:                                @   in Loop: Header=BB44_12 Depth=1
	mov	r0, r2
	b	.LBB44_30
.LBB44_27:                              @   in Loop: Header=BB44_12 Depth=1
	mov	r0, #0
	cmp	r2, #0
	beq	.LBB44_30
@ BB#28:                                @   in Loop: Header=BB44_12 Depth=1
	mov	r5, sp
.LBB44_29:                              @ %.lr.ph.i
                                        @   Parent Loop BB44_12 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	tst	r2, #1
	ldrne	r4, [r5]
	add	r5, r5, #4
	eorne	r0, r4, r0
	lsr	r4, r2, #1
	cmp	r3, r2, lsr #1
	mov	r2, r4
	bne	.LBB44_29
.LBB44_30:                              @ %gf2_matrix_times.exit
                                        @   in Loop: Header=BB44_12 Depth=1
	asr	r2, r9, #2
	cmp	r3, r9, asr #2
	bne	.LBB44_12
	b	.LBB44_32
.LBB44_31:
	mov	r0, r2
.LBB44_32:
	eor	r0, r0, r1
.LBB44_33:
	add	sp, sp, #256
	pop	{r4, r5, r6, r7, r8, r9, r11, pc}
	.align	2
@ BB#34:
.LCPI44_0:
	.long	3988292384              @ 0xedb88320
.Ltmp44:
	.size	crc32_combine_, .Ltmp44-crc32_combine_

	.globl	crc32_combine64
	.align	2
	.type	crc32_combine64,%function
crc32_combine64:                        @ @crc32_combine64
@ BB#0:
	push	{r11, lr}
	bl	crc32_combine_
	pop	{r11, pc}
.Ltmp45:
	.size	crc32_combine64, .Ltmp45-crc32_combine64

	.globl	_tr_init
	.align	2
	.type	_tr_init,%function
_tr_init:                               @ @_tr_init
@ BB#0:
	push	{r11, lr}
	add	r2, r0, #148
	ldr	r1, .LCPI46_0
	str	r2, [r0, #2840]
	add	r2, r0, #392
	add	r2, r2, #2048
	str	r1, [r0, #2848]
	str	r2, [r0, #2852]
	add	r2, r1, #20
	add	r1, r1, #40
	str	r1, [r0, #2872]
	str	r2, [r0, #2860]
	mov	r2, #696
	add	r3, r0, #636
	orr	r2, r2, #5120
	add	r3, r3, #2048
	mov	r1, #0
	str	r3, [r0, #2864]
	strh	r1, [r0, r2]
	mov	r2, #700
	orr	r2, r2, #5120
	str	r1, [r0, r2]
	bl	init_block
	pop	{r11, pc}
	.align	2
@ BB#1:
.LCPI46_0:
	.long	_MergedGlobals
.Ltmp46:
	.size	_tr_init, .Ltmp46-_tr_init

	.align	2
	.type	init_block,%function
init_block:                             @ @init_block
@ BB#0:
	mov	r2, #30
	add	r1, r0, #148
	orr	r2, r2, #256
	mov	r3, #0
.LBB47_1:                               @ =>This Inner Loop Header: Depth=1
	strh	r3, [r1], #4
	subs	r2, r2, #1
	bne	.LBB47_1
@ BB#2:                                 @ %.preheader16
	mov	r2, #392
	orr	r2, r2, #2048
	mov	r1, #0
	strh	r1, [r0, r2]
	mov	r2, #396
	orr	r2, r2, #2048
	mov	r3, #1
	strh	r1, [r0, r2]
	mov	r2, #2448
	strh	r1, [r0, r2]
	mov	r2, #404
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #408
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #412
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #2464
	strh	r1, [r0, r2]
	mov	r2, #420
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #424
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #428
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #2480
	strh	r1, [r0, r2]
	mov	r2, #436
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #440
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #444
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #2496
	strh	r1, [r0, r2]
	mov	r2, #452
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #456
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #460
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #2512
	strh	r1, [r0, r2]
	mov	r2, #468
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #472
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #476
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #2528
	strh	r1, [r0, r2]
	mov	r2, #484
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #488
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #492
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #2544
	strh	r1, [r0, r2]
	mov	r2, #500
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #504
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #508
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #636
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #2688
	strh	r1, [r0, r2]
	mov	r2, #644
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #648
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #652
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #2704
	strh	r1, [r0, r2]
	mov	r2, #660
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #664
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #668
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #2720
	strh	r1, [r0, r2]
	mov	r2, #676
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #680
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #684
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #2736
	strh	r1, [r0, r2]
	mov	r2, #692
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #696
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #700
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #2752
	strh	r1, [r0, r2]
	mov	r2, #708
	orr	r2, r2, #2048
	strh	r1, [r0, r2]
	mov	r2, #148
	orr	r2, r2, #1024
	strh	r3, [r0, r2]
	mov	r2, #684
	orr	r2, r2, #5120
	str	r1, [r0, r2]
	mov	r2, #680
	orr	r2, r2, #5120
	str	r1, [r0, r2]
	mov	r2, #1712
	orr	r2, r2, #4096
	str	r1, [r0, r2]
	mov	r2, #1696
	orr	r2, r2, #4096
	str	r1, [r0, r2]
	bx	lr
.Ltmp47:
	.size	init_block, .Ltmp47-init_block

	.globl	_tr_stored_block
	.align	2
	.type	_tr_stored_block,%function
_tr_stored_block:                       @ @_tr_stored_block
@ BB#0:
	push	{r4, r5, r6, lr}
	mov	r5, #700
	orr	r5, r5, #5120
	mov	r12, r0
	mov	r4, #696
	ldr	r5, [r12, r5]!
	orr	r4, r4, #5120
	mov	lr, r0
	uxth	r3, r3
	ldrh	r4, [lr, r4]!
	cmp	r5, #14
	orr	r4, r4, r3, lsl r5
	strh	r4, [lr]
	blt	.LBB48_2
@ BB#1:
	ldr	r5, [r0, #20]
	add	r6, r5, #1
	str	r6, [r0, #20]
	ldr	r6, [r0, #8]
	strb	r4, [r6, r5]
	ldr	r4, [r0, #20]
	ldrb	r5, [lr, #1]
	add	r6, r4, #1
	str	r6, [r0, #20]
	ldr	r6, [r0, #8]
	strb	r5, [r6, r4]
	ldr	r5, [r12]
	rsb	r4, r5, #16
	lsr	r4, r3, r4
	strh	r4, [lr]
	sub	r3, r5, #13
	b	.LBB48_3
.LBB48_2:
	add	r3, r5, #3
.LBB48_3:
	str	r3, [r12]
	cmp	r3, #9
	blt	.LBB48_5
@ BB#4:
	mov	r3, r0
	ldr	r5, [r3, #20]!
	add	r6, r5, #1
	str	r6, [r3]
	ldr	r6, [r0, #8]!
	strb	r4, [r6, r5]
	ldr	r4, [r3]
	ldrb	r5, [lr, #1]
	add	r6, r4, #1
	str	r6, [r3]
	ldr	r6, [r0]
	strb	r5, [r6, r4]
	b	.LBB48_8
.LBB48_5:
	cmp	r3, #0
	ble	.LBB48_7
@ BB#6:
	mov	r3, r0
	ldr	r5, [r3, #20]!
	add	r6, r5, #1
	str	r6, [r3]
	ldr	r6, [r0, #8]!
	strb	r4, [r6, r5]
	b	.LBB48_8
.LBB48_7:                               @ %._crit_edge21.i
	add	r4, r0, #8
	add	r3, r0, #20
	mov	r0, r4
.LBB48_8:
	mov	r4, #0
	strh	r4, [lr]
	str	r4, [r12]
	ldr	r5, [r3]
	cmp	r2, #0
	add	r6, r5, #1
	str	r6, [r3]
	ldr	r6, [r0]
	strb	r2, [r6, r5]
	ldr	r5, [r3]
	add	r6, r5, #1
	str	r6, [r3]
	ldr	r4, [r0]
	lsr	r6, r2, #8
	strb	r6, [r4, r5]
	ldr	r5, [r3]
	add	r6, r5, #1
	str	r6, [r3]
	ldr	r4, [r0]
	mvn	r6, r2
	strb	r6, [r4, r5]
	ldr	r5, [r3]
	add	r6, r5, #1
	str	r6, [r3]
	ldr	r4, [r0]
	mvn	r6, r2, lsr #8
	strb	r6, [r4, r5]
	beq	.LBB48_10
.LBB48_9:                               @ %.lr.ph.i
                                        @ =>This Inner Loop Header: Depth=1
	ldr	r5, [r3]
	ldrb	r4, [r1], #1
	subs	r2, r2, #1
	add	r6, r5, #1
	str	r6, [r3]
	ldr	r6, [r0]
	strb	r4, [r6, r5]
	bne	.LBB48_9
.LBB48_10:                              @ %copy_block.exit
	pop	{r4, r5, r6, pc}
.Ltmp48:
	.size	_tr_stored_block, .Ltmp48-_tr_stored_block

	.globl	_tr_flush_bits
	.align	2
	.type	_tr_flush_bits,%function
_tr_flush_bits:                         @ @_tr_flush_bits
@ BB#0:
	push	{r11, lr}
	mov	r2, #700
	orr	r2, r2, #5120
	mov	lr, r0
	ldr	r2, [lr, r2]!
	cmp	r2, #16
	bne	.LBB49_2
@ BB#1:
	ldr	r3, [r0, #20]
	mov	r12, #696
	orr	r12, r12, #5120
	mov	r2, r0
	add	r1, r3, #1
	ldrb	r12, [r2, r12]!
	str	r1, [r0, #20]
	ldr	r1, [r0, #8]
	strb	r12, [r1, r3]
	ldr	r3, [r0, #20]
	mov	r12, #185
	orr	r12, r12, #5632
	add	r1, r3, #1
	ldrb	r12, [r0, r12]
	str	r1, [r0, #20]
	ldr	r0, [r0, #8]
	strb	r12, [r0, r3]
	mov	r0, #0
	strh	r0, [r2]
	b	.LBB49_3
.LBB49_2:
	cmp	r2, #8
	poplt	{r11, pc}
	ldr	r3, [r0, #20]
	mov	r12, #696
	orr	r12, r12, #5120
	mov	r2, r0
	add	r1, r3, #1
	ldrb	r12, [r2, r12]!
	str	r1, [r0, #20]
	ldr	r1, [r0, #8]
	strb	r12, [r1, r3]
	mov	r1, #185
	orr	r1, r1, #5632
	ldrb	r0, [r0, r1]
	strh	r0, [r2]
	ldr	r0, [lr]
	sub	r0, r0, #8
.LBB49_3:
	str	r0, [lr]
	pop	{r11, pc}
.Ltmp49:
	.size	_tr_flush_bits, .Ltmp49-_tr_flush_bits

	.globl	_tr_align
	.align	2
	.type	_tr_align,%function
_tr_align:                              @ @_tr_align
@ BB#0:
	push	{r4, lr}
	mov	r1, #700
	orr	r1, r1, #5120
	mov	lr, r0
	mov	r3, #696
	ldr	r1, [lr, r1]!
	orr	r3, r3, #5120
	mov	r2, r0
	mov	r12, #2
	ldrh	r3, [r2, r3]!
	cmp	r1, #14
	orr	r3, r3, r12, lsl r1
	strh	r3, [r2]
	blt	.LBB50_2
@ BB#1:
	ldr	r1, [r0, #20]
	add	r4, r1, #1
	str	r4, [r0, #20]
	ldr	r4, [r0, #8]
	strb	r3, [r4, r1]
	ldr	r1, [r0, #20]
	ldrb	r3, [r2, #1]
	add	r4, r1, #1
	str	r4, [r0, #20]
	ldr	r4, [r0, #8]
	strb	r3, [r4, r1]
	ldr	r1, [lr]
	rsb	r3, r1, #16
	sub	r1, r1, #13
	lsr	r3, r12, r3
	strh	r3, [r2]
	b	.LBB50_3
.LBB50_2:
	add	r1, r1, #3
.LBB50_3:
	str	r1, [lr]
	cmp	r1, #10
	blt	.LBB50_5
@ BB#4:
	ldr	r1, [r0, #20]
	add	r4, r1, #1
	str	r4, [r0, #20]
	ldr	r4, [r0, #8]
	strb	r3, [r4, r1]
	ldr	r1, [r0, #20]
	ldrb	r3, [r2, #1]
	add	r4, r1, #1
	str	r4, [r0, #20]
	ldr	r4, [r0, #8]
	strb	r3, [r4, r1]
	mov	r3, #0
	strh	r3, [r2]
	ldr	r1, [lr]
	sub	r1, r1, #9
	b	.LBB50_6
.LBB50_5:
	add	r1, r1, #7
.LBB50_6:
	str	r1, [lr]
	cmp	r1, #16
	bne	.LBB50_8
@ BB#7:
	ldr	r1, [r0, #20]
	add	r4, r1, #1
	str	r4, [r0, #20]
	ldr	r4, [r0, #8]
	strb	r3, [r4, r1]
	ldr	r1, [r0, #20]
	ldrb	r3, [r2, #1]
	add	r4, r1, #1
	str	r4, [r0, #20]
	ldr	r0, [r0, #8]
	strb	r3, [r0, r1]
	mov	r0, #0
	strh	r0, [r2]
	b	.LBB50_9
.LBB50_8:
	cmp	r1, #8
	poplt	{r4, pc}
	ldr	r1, [r0, #20]
	add	r4, r1, #1
	str	r4, [r0, #20]
	ldr	r0, [r0, #8]
	strb	r3, [r0, r1]
	ldrb	r0, [r2, #1]
	strh	r0, [r2]
	ldr	r0, [lr]
	sub	r0, r0, #8
.LBB50_9:
	str	r0, [lr]
	pop	{r4, pc}
.Ltmp50:
	.size	_tr_align, .Ltmp50-_tr_align

	.globl	_tr_flush_block
	.align	2
	.type	_tr_flush_block,%function
_tr_flush_block:                        @ @_tr_flush_block
@ BB#0:
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r4, r0
	mov	r8, r3
	ldr	r0, [r4, #132]
	mov	r10, r2
	mov	r9, r1
	cmp	r0, #1
	blt	.LBB51_18
@ BB#1:
	ldr	r0, [r4]
	ldr	r1, [r0, #44]
	cmp	r1, #2
	bne	.LBB51_14
@ BB#2:                                 @ %.preheader.preheader
	ldr	r1, .LCPI51_0
	add	r2, r4, #148
	mov	r3, #0
.LBB51_3:                               @ %.preheader
                                        @ =>This Inner Loop Header: Depth=1
	tst	r1, #1
	beq	.LBB51_5
@ BB#4:                                 @   in Loop: Header=BB51_3 Depth=1
	ldrh	r6, [r2]
	mov	r5, #0
	cmp	r6, #0
	bne	.LBB51_13
.LBB51_5:                               @   in Loop: Header=BB51_3 Depth=1
	lsr	r1, r1, #1
	add	r3, r3, #1
	add	r2, r2, #4
	cmp	r3, #32
	blt	.LBB51_3
@ BB#6:
	ldrh	r1, [r4, #184]
	cmp	r1, #0
	bne	.LBB51_12
@ BB#7:
	ldrh	r1, [r4, #188]
	cmp	r1, #0
	bne	.LBB51_12
@ BB#8:
	ldrh	r1, [r4, #200]
	cmp	r1, #0
	bne	.LBB51_12
@ BB#9:                                 @ %.preheader.i.preheader
	add	r2, r4, #276
	mov	r1, #31
.LBB51_10:                              @ %.preheader.i
                                        @ =>This Inner Loop Header: Depth=1
	add	r1, r1, #1
	mov	r5, #0
	cmp	r1, #255
	bgt	.LBB51_13
@ BB#11:                                @   in Loop: Header=BB51_10 Depth=1
	add	r3, r2, #4
	ldrh	r2, [r2]
	cmp	r2, #0
	mov	r2, r3
	beq	.LBB51_10
.LBB51_12:
	mov	r5, #1
.LBB51_13:                              @ %detect_data_type.exit
	str	r5, [r0, #44]
.LBB51_14:
	add	r0, r4, #792
	add	r1, r0, #2048
	mov	r0, r4
	bl	build_tree
	add	r0, r4, #804
	add	r1, r0, #2048
	mov	r0, r4
	bl	build_tree
	ldr	r2, [r4, #2844]
	add	r1, r4, #148
	mov	r0, r4
	bl	scan_tree
	ldr	r2, [r4, #2856]
	add	r0, r4, #392
	add	r1, r0, #2048
	mov	r0, r4
	bl	scan_tree
	add	r1, r4, #2864
	mov	r0, r4
	bl	build_tree
	ldr	r0, .LCPI51_1
	mov	r2, #126
	mov	r3, #18
	mov	r1, #81
	orr	r2, r2, #2560
.LBB51_15:                              @ =>This Inner Loop Header: Depth=1
	mov	r6, r3
	mov	r5, r1
	cmp	r6, #3
	blt	.LBB51_17
@ BB#16:                                @   in Loop: Header=BB51_15 Depth=1
	ldrb	r1, [r0, r6]
	add	r3, r4, r1, lsl #2
	sub	r1, r5, #3
	ldrh	r7, [r3, r2]
	sub	r3, r6, #1
	cmp	r7, #0
	beq	.LBB51_15
.LBB51_17:                              @ %build_bl_tree.exit
	mov	r0, #680
	orr	r0, r0, #5120
	mov	r1, r4
	ldr	r0, [r1, r0]!
	add	r0, r0, r5
	sub	r2, r0, #10
	str	r2, [r1]
	mov	r1, #684
	orr	r1, r1, #5120
	ldr	r1, [r4, r1]
	add	r1, r1, #10
	lsr	r5, r1, #3
	cmp	r5, r0, lsr #3
	mov	r1, r5
	lsrhi	r1, r0, #3
	b	.LBB51_19
.LBB51_18:
	add	r1, r10, #5
	mov	r6, #0
	mov	r5, r1
.LBB51_19:
	add	r0, r10, #4
	cmp	r0, r1
	bhi	.LBB51_21
@ BB#20:
	cmp	r9, #0
	bne	.LBB51_26
.LBB51_21:
	mov	r0, #700
	orr	r0, r0, #5120
	mov	lr, r4
	ldr	r3, [r4, #136]
	ldr	r2, [lr, r0]!
	cmp	r3, #4
	cmpne	r5, r1
	bne	.LBB51_24
@ BB#22:
	mov	r3, #696
	orr	r3, r3, #5120
	mov	r1, r4
	add	r0, r8, #2
	ldrh	r7, [r1, r3]!
	uxth	r3, r0
	orr	r0, r7, r3, lsl r2
	strh	r0, [r1]
	cmp	r2, #14
	blt	.LBB51_27
@ BB#23:
	ldr	r2, [r4, #20]
	add	r7, r2, #1
	str	r7, [r4, #20]
	ldr	r7, [r4, #8]
	strb	r0, [r7, r2]
	ldr	r0, [r4, #20]
	ldrb	r2, [r1, #1]
	add	r7, r0, #1
	str	r7, [r4, #20]
	ldr	r7, [r4, #8]
	strb	r2, [r7, r0]
	ldr	r0, [lr]
	rsb	r2, r0, #16
	sub	r0, r0, #13
	lsr	r2, r3, r2
	strh	r2, [r1]
	b	.LBB51_28
.LBB51_24:
	mov	r3, #696
	orr	r3, r3, #5120
	mov	r10, r4
	add	r0, r8, #4
	ldrh	r3, [r10, r3]!
	uxth	r0, r0
	orr	r7, r3, r0, lsl r2
	strh	r7, [r10]
	cmp	r2, #14
	blt	.LBB51_29
@ BB#25:
	ldr	r2, [r4, #20]
	add	r3, r2, #1
	str	r3, [r4, #20]
	ldr	r3, [r4, #8]
	strb	r7, [r3, r2]
	ldr	r2, [r4, #20]
	ldrb	r3, [r10, #1]
	add	r7, r2, #1
	str	r7, [r4, #20]
	ldr	r7, [r4, #8]
	strb	r3, [r7, r2]
	ldr	r2, [lr]
	rsb	r3, r2, #16
	sub	r5, r2, #13
	lsr	r7, r0, r3
	strh	r7, [r10]
	b	.LBB51_30
.LBB51_26:
	mov	r0, r4
	mov	r1, r9
	mov	r2, r10
	mov	r3, r8
	bl	_tr_stored_block
	b	.LBB51_47
.LBB51_27:
	add	r0, r2, #3
.LBB51_28:
	str	r0, [lr]
	ldr	r1, .LCPI51_2
	ldr	r2, .LCPI51_3
	mov	r0, r4
	b	.LBB51_46
.LBB51_29:
	add	r5, r2, #3
.LBB51_30:
	str	r5, [lr]
	ldr	r2, [r4, #2844]
	uxth	r0, r7
	ldr	r9, [r4, #2856]
	add	r3, r2, #65280
	add	r7, r6, #1
	uxth	r12, r3
	orr	r3, r0, r12, lsl r5
	strh	r3, [r10]
	cmp	r5, #12
	blt	.LBB51_32
@ BB#31:
	ldr	r0, [r4, #20]
	add	r5, r0, #1
	str	r5, [r4, #20]
	ldr	r5, [r4, #8]
	strb	r3, [r5, r0]
	ldr	r0, [r4, #20]
	ldrb	r3, [r10, #1]
	add	r5, r0, #1
	str	r5, [r4, #20]
	ldr	r5, [r4, #8]
	strb	r3, [r5, r0]
	ldr	r0, [lr]
	rsb	r3, r0, #16
	sub	r0, r0, #11
	lsr	r3, r12, r3
	strh	r3, [r10]
	b	.LBB51_33
.LBB51_32:
	add	r0, r5, #5
.LBB51_33:
	uxth	r3, r3
	uxth	r12, r9
	orr	r3, r3, r12, lsl r0
	str	r0, [lr]
	strh	r3, [r10]
	cmp	r0, #12
	blt	.LBB51_35
@ BB#34:
	ldr	r0, [r4, #20]
	add	r5, r0, #1
	str	r5, [r4, #20]
	ldr	r5, [r4, #8]
	strb	r3, [r5, r0]
	ldr	r0, [r4, #20]
	ldrb	r3, [r10, #1]
	add	r5, r0, #1
	str	r5, [r4, #20]
	ldr	r5, [r4, #8]
	strb	r3, [r5, r0]
	ldr	r0, [lr]
	rsb	r3, r0, #16
	sub	r5, r0, #11
	lsr	r3, r12, r3
	strh	r3, [r10]
	b	.LBB51_36
.LBB51_35:
	add	r5, r0, #5
.LBB51_36:
	add	r0, r6, #253
	add	r0, r0, #65280
	str	r5, [lr]
	uxth	r12, r0
	uxth	r0, r3
	orr	r3, r0, r12, lsl r5
	strh	r3, [r10]
	cmp	r5, #13
	blt	.LBB51_38
@ BB#37:
	ldr	r0, [r4, #20]
	add	r5, r0, #1
	str	r5, [r4, #20]
	ldr	r5, [r4, #8]
	strb	r3, [r5, r0]
	ldr	r0, [r4, #20]
	ldrb	r3, [r10, #1]
	add	r5, r0, #1
	str	r5, [r4, #20]
	ldr	r5, [r4, #8]
	strb	r3, [r5, r0]
	ldr	r0, [lr]
	rsb	r3, r0, #16
	sub	r6, r0, #12
	lsr	r3, r12, r3
	strh	r3, [r10]
	b	.LBB51_39
.LBB51_38:
	add	r6, r5, #4
.LBB51_39:                              @ %.preheader.i3
	str	r6, [lr]
	cmp	r7, #1
	blt	.LBB51_45
@ BB#40:                                @ %.lr.ph.i
	ldr	r5, .LCPI51_1
	mov	r12, #126
	orr	r12, r12, #2560
.LBB51_41:                              @ =>This Inner Loop Header: Depth=1
	ldrb	r0, [r5]
	uxth	r3, r3
	cmp	r6, #14
	add	r0, r4, r0, lsl #2
	ldrh	r0, [r0, r12]
	orr	r3, r3, r0, lsl r6
	strh	r3, [r10]
	blt	.LBB51_43
@ BB#42:                                @   in Loop: Header=BB51_41 Depth=1
	ldr	r6, [r4, #20]
	add	r1, r6, #1
	str	r1, [r4, #20]
	ldr	r1, [r4, #8]
	strb	r3, [r1, r6]
	ldr	r3, [r4, #20]
	ldrb	r6, [r10, #1]
	add	r1, r3, #1
	str	r1, [r4, #20]
	ldr	r1, [r4, #8]
	strb	r6, [r1, r3]
	ldr	r6, [lr]
	rsb	r1, r6, #16
	sub	r6, r6, #13
	lsr	r3, r0, r1
	strh	r3, [r10]
	b	.LBB51_44
.LBB51_43:                              @   in Loop: Header=BB51_41 Depth=1
	add	r6, r6, #3
.LBB51_44:                              @   in Loop: Header=BB51_41 Depth=1
	add	r5, r5, #1
	subs	r7, r7, #1
	str	r6, [lr]
	bne	.LBB51_41
.LBB51_45:                              @ %send_all_trees.exit
	add	r7, r4, #148
	mov	r0, r4
	mov	r1, r7
	bl	send_tree
	add	r0, r4, #392
	add	r5, r0, #2048
	mov	r0, r4
	mov	r1, r5
	mov	r2, r9
	bl	send_tree
	mov	r0, r4
	mov	r1, r7
	mov	r2, r5
.LBB51_46:                              @ %send_all_trees.exit
	bl	compress_block
.LBB51_47:
	mov	r0, r4
	bl	init_block
	cmp	r8, #0
	beq	.LBB51_54
@ BB#48:
	mov	r1, #700
	orr	r1, r1, #5120
	mov	r0, r4
	ldr	r2, [r0, r1]!
	cmp	r2, #9
	blt	.LBB51_50
@ BB#49:
	ldr	r2, [r4, #20]
	mov	r3, #696
	orr	r3, r3, #5120
	mov	r1, r4
	add	r7, r2, #1
	ldrb	r3, [r1, r3]!
	str	r7, [r4, #20]
	ldr	r7, [r4, #8]
	strb	r3, [r7, r2]
	mov	r3, #185
	orr	r3, r3, #5632
	ldr	r2, [r4, #20]
	ldrb	r3, [r4, r3]
	b	.LBB51_52
.LBB51_50:
	add	r1, r4, #696
	add	r1, r1, #5120
	cmp	r2, #1
	blt	.LBB51_53
@ BB#51:
	ldr	r2, [r4, #20]
	ldrb	r3, [r1]
.LBB51_52:
	add	r7, r2, #1
	str	r7, [r4, #20]
	ldr	r7, [r4, #8]
	strb	r3, [r7, r2]
.LBB51_53:                              @ %bi_windup.exit
	mov	r2, #0
	strh	r2, [r1]
	str	r2, [r0]
.LBB51_54:
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
	.align	2
@ BB#55:
.LCPI51_0:
	.long	4093624447              @ 0xf3ffc07f
.LCPI51_1:
	.long	bl_order
.LCPI51_2:
	.long	static_ltree
.LCPI51_3:
	.long	static_dtree
.Ltmp51:
	.size	_tr_flush_block, .Ltmp51-_tr_flush_block

	.align	2
	.type	build_tree,%function
build_tree:                             @ @build_tree
@ BB#0:
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	sub	sp, sp, #68
	str	r1, [sp, #20]           @ 4-byte Spill
	ldr	r8, [r1]
	ldr	r1, [r1, #8]
	mov	r7, r0
	mov	r0, #1104
	orr	r0, r0, #4096
	ldr	r3, [r1, #12]
	mov	lr, r7
	mov	r2, #0
	ldr	r12, [r1]
	str	r3, [sp, #24]           @ 4-byte Spill
	str	r2, [lr, r0]!
	mov	r0, #84
	mov	r4, #61
	orr	r0, r0, #5120
	mov	r1, r7
	orr	r4, r4, #512
	mvn	r10, #0
	str	r4, [r1, r0]!
	str	r1, [sp, #8]            @ 4-byte Spill
	cmp	r3, #1
	blt	.LBB52_7
@ BB#1:                                 @ %.lr.ph92.preheader
	ldr	r6, [sp, #24]           @ 4-byte Reload
	add	r0, r7, #88
	mov	r3, #0
	mov	r9, r7
	add	r1, r0, #5120
	add	r2, r8, #2
	mvn	r5, #0
	mov	r7, r3
.LBB52_2:                               @ %.lr.ph92
                                        @ =>This Inner Loop Header: Depth=1
	ldrh	r0, [r2, #-2]
	cmp	r0, #0
	bne	.LBB52_4
@ BB#3:                                 @   in Loop: Header=BB52_2 Depth=1
	strh	r3, [r2]
	b	.LBB52_5
.LBB52_4:                               @   in Loop: Header=BB52_2 Depth=1
	ldr	r0, [lr]
	add	r0, r0, #1
	add	r5, r9, r0, lsl #2
	str	r0, [lr]
	str	r7, [r5, #2908]
	strb	r3, [r1, r7]
	mov	r5, r7
.LBB52_5:                               @   in Loop: Header=BB52_2 Depth=1
	add	r7, r7, #1
	add	r2, r2, #4
	cmp	r6, r7
	bne	.LBB52_2
@ BB#6:                                 @ %.preheader85
	ldr	r2, [lr]
	mov	r10, r5
	mov	r7, r9
	cmp	r2, #1
	bgt	.LBB52_12
.LBB52_7:                               @ %.lr.ph87
	add	r0, r7, #680
	add	r9, r0, #5120
	cmp	r12, #0
	beq	.LBB52_10
@ BB#8:
	add	r0, r7, #684
	mov	r1, r12
	add	r11, r0, #5120
.LBB52_9:                               @ %.backedge
                                        @ =>This Inner Loop Header: Depth=1
	add	r0, r2, #1
	add	r2, r10, #1
	mov	r3, r7
	cmp	r10, #2
	mov	r5, r2
	add	r7, r3, r0, lsl #2
	movge	r5, #0
	add	r12, r8, r5, lsl #2
	str	r0, [lr]
	str	r5, [r7, #2908]
	mov	r7, #88
	mov	r0, #1
	orr	r7, r7, #5120
	strh	r0, [r12]
	add	r0, r3, r5
	mov	r6, #0
	strb	r6, [r0, r7]
	ldr	r7, [r9]
	add	r0, r1, r5, lsl #2
	sub	r7, r7, #1
	str	r7, [r9]
	ldrh	r0, [r0, #2]
	ldr	r5, [r11]
	cmp	r10, #2
	movlt	r10, r2
	sub	r0, r5, r0
	str	r0, [r11]
	ldr	r2, [lr]
	mov	r7, r3
	cmp	r2, #2
	blt	.LBB52_9
	b	.LBB52_12
.LBB52_10:
	mov	r12, #88
	mov	r6, #1
	orr	r12, r12, #5120
	mov	r11, #0
.LBB52_11:                              @ %.backedge.us
                                        @ =>This Inner Loop Header: Depth=1
	add	r0, r10, #1
	add	r5, r2, #1
	cmp	r10, #2
	mov	r2, r0
	movge	r2, #0
	add	r3, r7, r5, lsl #2
	mov	r1, r7
	add	r7, r8, r2, lsl #2
	str	r5, [lr]
	str	r2, [r3, #2908]
	strh	r6, [r7]
	mov	r7, r1
	add	r2, r7, r2
	strb	r11, [r2, r12]
	ldr	r2, [r9]
	cmp	r10, #2
	movlt	r10, r0
	sub	r0, r2, #1
	str	r0, [r9]
	ldr	r2, [lr]
	cmp	r2, #2
	blt	.LBB52_11
.LBB52_12:                              @ %._crit_edge
	ldr	r0, [sp, #20]           @ 4-byte Reload
	mov	r3, r7
	mov	r5, r8
	mov	r1, r10
	str	r10, [r0, #4]
	ldr	r0, [lr]
	mov	r2, lr
	str	lr, [sp, #32]           @ 4-byte Spill
	cmp	r0, #2
	blt	.LBB52_16
@ BB#13:                                @ %.lr.ph
	add	r0, r0, r0, lsr #31
	asr	r7, r0, #1
	mov	r9, r5
	mov	r8, r2
	mov	r5, r3
	str	r1, [sp, #16]           @ 4-byte Spill
.LBB52_14:                              @ =>This Inner Loop Header: Depth=1
	mov	r0, r5
	mov	r1, r9
	mov	r2, r7
	bl	pqdownheap
	sub	r7, r7, #1
	cmp	r7, #0
	bgt	.LBB52_14
@ BB#15:                                @ %..preheader_crit_edge
	mov	r2, r8
	mov	r3, r5
	ldr	r0, [r2]
	b	.LBB52_17
.LBB52_16:
	str	r1, [sp, #16]           @ 4-byte Spill
	mov	r9, r5
.LBB52_17:                              @ %..preheader_crit_edge
	ldr	r6, [sp, #24]           @ 4-byte Reload
	add	r1, r3, #88
	add	r1, r1, #5120
	ldr	r11, [sp, #8]           @ 4-byte Reload
	str	r1, [sp, #28]           @ 4-byte Spill
	add	r1, r3, #860
	add	r5, r9, r6, lsl #2
	mov	r8, r6
	mov	r7, r9
	mov	r6, r3
	add	r10, r1, #2048
.LBB52_18:                              @ =>This Inner Loop Header: Depth=1
	sub	r1, r0, #1
	ldr	r9, [r6, #2912]
	str	r1, [r2]
	ldr	r0, [r10, r0, lsl #2]
	mov	r1, r7
	mov	r2, #1
	str	r0, [r6, #2912]
	mov	r0, r6
	bl	pqdownheap
	ldr	r0, [r11]
	lsl	r2, r9, #2
	sub	r1, r0, #1
	ldr	r0, [r6, #2912]
	str	r1, [r11]
	str	r9, [r10, r1, lsl #2]
	ldr	r1, [r11]
	mov	lr, r7
	mov	r12, r5
	sub	r1, r1, #1
	str	r1, [r11]
	str	r0, [r10, r1, lsl #2]
	lsl	r5, r0, #2
	ldrh	r3, [lr, r2]!
	mov	r2, r7
	ldrh	r5, [r2, r5]!
	ldr	r1, [sp, #28]           @ 4-byte Reload
	add	r3, r5, r3
	mov	r5, r12
	strh	r3, [r5], #4
	ldrb	r0, [r1, r0]
	ldrb	r3, [r1, r9]
	cmp	r3, r0
	movlo	r3, r0
	add	r0, r3, #1
	strb	r0, [r1, r8]
	strh	r8, [r2, #2]
	mov	r0, r6
	mov	r1, r7
	mov	r2, #1
	strh	r8, [lr, #2]
	str	r8, [r6, #2912]
	bl	pqdownheap
	ldr	r2, [sp, #32]           @ 4-byte Reload
	add	r8, r8, #1
	ldr	r0, [r2]
	cmp	r0, #1
	bgt	.LBB52_18
@ BB#19:
	ldr	r1, [r11]
	mov	r5, r6
	mov	r3, r10
	ldr	r0, [r5, #2912]
	sub	r1, r1, #1
	str	r1, [r11]
	str	r0, [r3, r1, lsl #2]
	ldr	r0, [sp, #20]           @ 4-byte Reload
	mov	r9, #0
	str	r7, [sp, #12]           @ 4-byte Spill
	mov	r7, r5
	ldr	r1, [r0, #8]
	ldr	lr, [r0]
	ldr	r12, [r0, #4]
	mov	r0, #90
	ldr	r2, [r1, #4]
	orr	r0, r0, #2816
	ldr	r10, [r1]
	str	r2, [sp, #32]           @ 4-byte Spill
	ldr	r2, [r1, #8]
	ldr	r8, [r1, #16]
	strh	r9, [r5, r0]
	mov	r0, #856
	orr	r0, r0, #2048
	mov	r1, #828
	strh	r9, [r5, r0]
	mov	r0, #86
	orr	r0, r0, #2816
	orr	r1, r1, #2048
	strh	r9, [r5, r0]
	mov	r0, #852
	orr	r0, r0, #2048
	strh	r9, [r5, r0]
	mov	r0, #82
	orr	r0, r0, #2816
	strh	r9, [r5, r0]
	mov	r0, #2896
	strh	r9, [r5, r0]
	mov	r0, #78
	orr	r0, r0, #2816
	strh	r9, [r5, r0]
	mov	r0, #844
	orr	r0, r0, #2048
	strh	r9, [r5, r0]
	mov	r0, #74
	orr	r0, r0, #2816
	strh	r9, [r5, r0]
	mov	r0, #840
	orr	r0, r0, #2048
	strh	r9, [r5, r0]
	mov	r0, #70
	orr	r0, r0, #2816
	strh	r9, [r5, r0]
	mov	r0, #836
	orr	r0, r0, #2048
	strh	r9, [r5, r0]
	mov	r0, #66
	orr	r0, r0, #2816
	strh	r9, [r5, r0]
	mov	r0, #2880
	strh	r9, [r5, r0]
	mov	r0, #62
	orr	r0, r0, #2816
	strh	r9, [r5, r0]
	mov	r0, r5
	strh	r9, [r0, r1]!
	str	r0, [sp, #4]            @ 4-byte Spill
	ldr	r0, [r11]
	ldr	r0, [r3, r0, lsl #2]
	add	r0, lr, r0, lsl #2
	strh	r9, [r0, #2]
	ldr	r6, [r11]
	add	r0, r6, #1
	cmp	r0, #572
	bgt	.LBB52_43
@ BB#20:                                @ %.lr.ph73.i
	add	r0, r7, #680
	str	r2, [sp, #28]           @ 4-byte Spill
	add	r2, r0, #5120
	cmp	r10, #0
	beq	.LBB52_25
@ BB#21:
	add	r0, r7, #684
	add	r0, r0, #5120
	str	r10, [sp, #24]          @ 4-byte Spill
	str	r0, [sp, #20]           @ 4-byte Spill
.LBB52_22:                              @ %.lr.ph73..lr.ph73.split_crit_edge.i
                                        @ =>This Inner Loop Header: Depth=1
	add	r0, r7, r6, lsl #2
	ldr	r0, [r0, #2912]
	add	r1, lr, r0, lsl #2
	ldrh	r5, [r1, #2]
	add	r5, lr, r5, lsl #2
	ldrh	r5, [r5, #2]
	add	r10, r5, #1
	cmp	r10, r8
	movgt	r10, r8
	addgt	r9, r9, #1
	strh	r10, [r1, #2]
	cmp	r0, r12
	bgt	.LBB52_24
@ BB#23:                                @   in Loop: Header=BB52_22 Depth=1
	mov	r3, #828
	add	r5, r7, r10, lsl #1
	orr	r3, r3, #2048
	mov	r11, r7
	ldrh	r7, [r5, r3]
	add	r7, r7, #1
	strh	r7, [r5, r3]
	ldr	r3, [sp, #28]           @ 4-byte Reload
	mov	r5, #0
	ldrh	r1, [r1]
	cmp	r0, r3
	subge	r5, r0, r3
	ldrge	r3, [sp, #32]           @ 4-byte Reload
	ldr	r7, [r2]
	ldrge	r5, [r3, r5, lsl #2]
	add	r3, r5, r10
	mla	r7, r1, r3, r7
	ldr	r3, [sp, #24]           @ 4-byte Reload
	add	r0, r3, r0, lsl #2
	ldr	r3, [sp, #20]           @ 4-byte Reload
	str	r7, [r2]
	ldrh	r0, [r0, #2]
	ldr	r7, [r3]
	add	r0, r0, r5
	mla	r0, r0, r1, r7
	mov	r7, r11
	str	r0, [r3]
.LBB52_24:                              @ %.backedge.i
                                        @   in Loop: Header=BB52_22 Depth=1
	add	r6, r6, #1
	cmp	r6, #572
	bne	.LBB52_22
	b	.LBB52_28
.LBB52_25:                              @ %.lr.ph73.split.us.i
                                        @ =>This Inner Loop Header: Depth=1
	add	r0, r7, r6, lsl #2
	ldr	r5, [r0, #2912]
	add	r10, lr, r5, lsl #2
	ldrh	r1, [r10, #2]
	add	r1, lr, r1, lsl #2
	ldrh	r1, [r1, #2]
	add	r1, r1, #1
	cmp	r1, r8
	movgt	r1, r8
	addgt	r9, r9, #1
	strh	r1, [r10, #2]
	cmp	r5, r12
	bgt	.LBB52_27
@ BB#26:                                @   in Loop: Header=BB52_25 Depth=1
	mov	r0, r7
	add	r7, r0, r1, lsl #1
	mov	r11, r0
	mov	r0, #828
	orr	r0, r0, #2048
	ldrh	r3, [r7, r0]
	add	r3, r3, #1
	strh	r3, [r7, r0]
	ldr	r0, [sp, #28]           @ 4-byte Reload
	mov	r7, #0
	cmp	r5, r0
	subge	r3, r5, r0
	ldrge	r0, [sp, #32]           @ 4-byte Reload
	ldr	r5, [r2]
	ldrge	r7, [r0, r3, lsl #2]
	ldrh	r0, [r10]
	add	r1, r7, r1
	mov	r7, r11
	mla	r0, r0, r1, r5
	str	r0, [r2]
.LBB52_27:                              @ %.backedge.us.i
                                        @   in Loop: Header=BB52_25 Depth=1
	add	r6, r6, #1
	cmp	r6, #572
	bne	.LBB52_25
.LBB52_28:                              @ %._crit_edge.i
	cmp	r9, #0
	beq	.LBB52_43
@ BB#29:                                @ %.preheader69.i
	mov	r1, #62
	add	r0, r7, r8, lsl #1
	orr	r1, r1, #2816
	add	r5, r0, r1
	mov	r1, #828
	orr	r1, r1, #2048
	add	r1, r0, r1
.LBB52_30:                              @ =>This Loop Header: Depth=1
                                        @     Child Loop BB52_31 Depth 2
	mov	r0, r5
.LBB52_31:                              @   Parent Loop BB52_30 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldrh	r6, [r0, #-4]
	sub	r0, r0, #2
	cmp	r6, #0
	beq	.LBB52_31
@ BB#32:                                @   in Loop: Header=BB52_30 Depth=1
	sub	r3, r6, #1
	strh	r3, [r0, #-2]
	ldrh	r3, [r0]
	sub	r9, r9, #2
	cmp	r9, #0
	add	r3, r3, #2
	strh	r3, [r0]
	ldrh	r0, [r1]
	sub	r6, r0, #1
	strh	r6, [r1]
	bgt	.LBB52_30
@ BB#33:                                @ %.preheader.i
	cmp	r8, #0
	beq	.LBB52_43
@ BB#34:                                @ %.lr.ph.i.preheader
	mov	r0, #856
	orr	r0, r0, #2048
	mov	r9, #255
	add	r0, r7, r0
	orr	r9, r9, #65280
	b	.LBB52_36
.LBB52_35:                              @ %._crit_edge85.i
                                        @   in Loop: Header=BB52_36 Depth=1
	mov	r3, #828
	add	r1, r7, r8, lsl #1
	orr	r3, r3, #2048
	ldrh	r6, [r1, r3]
.LBB52_36:                              @ %.lr.ph.i
                                        @ =>This Loop Header: Depth=1
                                        @     Child Loop BB52_38 Depth 2
	mov	r11, r7
	tst	r6, r9
	beq	.LBB52_42
@ BB#37:                                @ %.outer..outer.split_crit_edge.i.preheader.lr.ph
                                        @   in Loop: Header=BB52_36 Depth=1
	uxth	r1, r6
.LBB52_38:                              @ %.outer..outer.split_crit_edge.i
                                        @   Parent Loop BB52_36 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r5, [r0, r4, lsl #2]
	sub	r4, r4, #1
	cmp	r5, r12
	bgt	.LBB52_38
@ BB#39:                                @ %.us-lcssa64.i
                                        @   in Loop: Header=BB52_38 Depth=2
	add	r7, lr, r5, lsl #2
	mov	r6, r7
	ldrh	r5, [r6, #2]!
	cmp	r5, r8
	beq	.LBB52_41
@ BB#40:                                @   in Loop: Header=BB52_38 Depth=2
	ldrh	r7, [r7]
	ldr	r3, [r2]
	sub	r5, r8, r5
	mla	r3, r7, r5, r3
	str	r3, [r2]
	strh	r8, [r6]
.LBB52_41:                              @ %.outer.i
                                        @   in Loop: Header=BB52_38 Depth=2
	subs	r1, r1, #1
	bne	.LBB52_38
.LBB52_42:                              @ %.us-lcssa.us.i
                                        @   in Loop: Header=BB52_36 Depth=1
	subs	r8, r8, #1
	mov	r7, r11
	bne	.LBB52_35
.LBB52_43:                              @ %gen_bitlen.exit
	ldr	r0, [sp, #4]            @ 4-byte Reload
	ldr	lr, [sp, #12]           @ 4-byte Reload
	ldrh	r0, [r0]
	lsl	r1, r0, #1
	strh	r1, [sp, #38]
	mov	r1, #62
	orr	r1, r1, #2816
	ldrh	r1, [r7, r1]
	add	r0, r1, r0, lsl #1
	lsl	r1, r0, #1
	strh	r1, [sp, #40]
	mov	r1, #2880
	ldrh	r1, [r7, r1]
	add	r0, r1, r0, lsl #1
	lsl	r1, r0, #1
	strh	r1, [sp, #42]
	mov	r1, #66
	orr	r1, r1, #2816
	ldrh	r1, [r7, r1]
	add	r0, r1, r0, lsl #1
	lsl	r1, r0, #1
	strh	r1, [sp, #44]
	mov	r1, #836
	orr	r1, r1, #2048
	ldrh	r1, [r7, r1]
	add	r0, r1, r0, lsl #1
	lsl	r1, r0, #1
	strh	r1, [sp, #46]
	mov	r1, #70
	orr	r1, r1, #2816
	ldrh	r1, [r7, r1]
	add	r0, r1, r0, lsl #1
	lsl	r1, r0, #1
	strh	r1, [sp, #48]
	mov	r1, #840
	orr	r1, r1, #2048
	ldrh	r1, [r7, r1]
	add	r0, r1, r0, lsl #1
	lsl	r1, r0, #1
	strh	r1, [sp, #50]
	mov	r1, #74
	orr	r1, r1, #2816
	ldrh	r1, [r7, r1]
	add	r0, r1, r0, lsl #1
	lsl	r1, r0, #1
	strh	r1, [sp, #52]
	mov	r1, #844
	orr	r1, r1, #2048
	ldrh	r1, [r7, r1]
	add	r0, r1, r0, lsl #1
	lsl	r1, r0, #1
	strh	r1, [sp, #54]
	mov	r1, #78
	orr	r1, r1, #2816
	ldrh	r1, [r7, r1]
	add	r0, r1, r0, lsl #1
	lsl	r1, r0, #1
	strh	r1, [sp, #56]
	mov	r1, #2896
	ldrh	r1, [r7, r1]
	add	r0, r1, r0, lsl #1
	lsl	r1, r0, #1
	strh	r1, [sp, #58]
	mov	r1, #82
	orr	r1, r1, #2816
	ldrh	r1, [r7, r1]
	add	r0, r1, r0, lsl #1
	lsl	r1, r0, #1
	strh	r1, [sp, #60]
	mov	r1, #852
	orr	r1, r1, #2048
	ldrh	r1, [r7, r1]
	add	r0, r1, r0, lsl #1
	lsl	r1, r0, #1
	strh	r1, [sp, #62]
	mov	r1, #86
	orr	r1, r1, #2816
	ldrh	r1, [r7, r1]
	add	r0, r1, r0, lsl #1
	lsl	r1, r0, #1
	strh	r1, [sp, #64]
	mov	r1, #856
	orr	r1, r1, #2048
	ldrh	r1, [r7, r1]
	add	r0, r1, r0, lsl #1
	lsl	r0, r0, #1
	strh	r0, [sp, #66]
	ldr	r0, [sp, #16]           @ 4-byte Reload
	cmp	r0, #0
	blt	.LBB52_50
@ BB#44:                                @ %.lr.ph.i3
	add	r0, r0, #1
	mov	r1, #0
	add	r12, sp, #36
.LBB52_45:                              @ =>This Loop Header: Depth=1
                                        @     Child Loop BB52_47 Depth 2
	add	r3, lr, r1, lsl #2
	ldrh	r7, [r3, #2]
	cmp	r7, #0
	beq	.LBB52_49
@ BB#46:                                @   in Loop: Header=BB52_45 Depth=1
	add	r2, r12, r7, lsl #1
	ldrh	r5, [r2]
	add	r6, r5, #1
	strh	r6, [r2]
	mov	r6, #0
.LBB52_47:                              @   Parent Loop BB52_45 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	lsr	r2, r5, #1
	and	r5, r5, #1
	orr	r4, r6, r5
	lsl	r6, r4, #1
	sub	r7, r7, #1
	mov	r5, r2
	cmp	r7, #0
	bgt	.LBB52_47
@ BB#48:                                @ %bi_reverse.exit.i
                                        @   in Loop: Header=BB52_45 Depth=1
	strh	r4, [r3]
.LBB52_49:                              @   in Loop: Header=BB52_45 Depth=1
	add	r1, r1, #1
	cmp	r1, r0
	bne	.LBB52_45
.LBB52_50:                              @ %gen_codes.exit
	add	sp, sp, #68
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
.Ltmp52:
	.size	build_tree, .Ltmp52-build_tree

	.align	2
	.type	compress_block,%function
compress_block:                         @ @compress_block
@ BB#0:
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	sub	sp, sp, #20
	str	r2, [sp, #12]           @ 4-byte Spill
	mov	r2, #1696
	orr	r2, r2, #4096
	mov	r3, r0
	str	r1, [sp, #16]           @ 4-byte Spill
	ldr	r1, [r3, r2]!
	str	r3, [sp, #8]            @ 4-byte Spill
	cmp	r1, #0
	beq	.LBB53_23
@ BB#1:                                 @ %.preheader
	add	r1, r0, #696
	add	r10, r1, #5120
	add	r1, r0, #700
	add	lr, r1, #5120
	add	r1, r0, #664
	add	r1, r1, #5120
	str	r1, [sp, #4]            @ 4-byte Spill
	add	r1, r0, #676
	add	r1, r1, #5120
	mov	r11, #0
	str	r1, [sp]                @ 4-byte Spill
	mov	r1, r11
.LBB53_2:                               @ %._crit_edge96
                                        @ =>This Inner Loop Header: Depth=1
	ldr	r3, [sp]                @ 4-byte Reload
	ldr	r2, [sp, #4]            @ 4-byte Reload
	ldr	r4, [r3]
	ldr	r2, [r2]
	add	r3, r4, r11
	ldrb	r9, [r2, r1]
	ldrh	r8, [r3]
	add	r1, r1, #1
	cmp	r8, #0
	bne	.LBB53_5
@ BB#3:                                 @   in Loop: Header=BB53_2 Depth=1
	ldr	r6, [sp, #16]           @ 4-byte Reload
	lsl	r2, r9, #2
	ldr	r5, [lr]
	ldrh	r4, [r6, r2]!
	ldrh	r3, [r10]
	ldrh	r2, [r6, #2]
	orr	r7, r3, r4, lsl r5
	rsb	r3, r2, #16
	strh	r7, [r10]
	cmp	r5, r3
	ble	.LBB53_7
@ BB#4:                                 @   in Loop: Header=BB53_2 Depth=1
	ldr	r5, [r0, #20]
	add	r3, r5, #1
	str	r3, [r0, #20]
	ldr	r3, [r0, #8]
	strb	r7, [r3, r5]
	ldr	r5, [r0, #20]
	ldrb	r6, [r10, #1]
	add	r3, r5, #1
	str	r3, [r0, #20]
	ldr	r3, [r0, #8]
	strb	r6, [r3, r5]
	ldr	r5, [lr]
	rsb	r3, r5, #16
	add	r2, r2, r5
	lsr	r7, r4, r3
	strh	r7, [r10]
	sub	r8, r2, #16
	b	.LBB53_21
.LBB53_5:                               @   in Loop: Header=BB53_2 Depth=1
	ldr	r2, .LCPI53_0
	ldr	r7, [sp, #16]           @ 4-byte Reload
	ldrb	r2, [r2, r9]
	orr	r3, r2, #256
	add	r5, r7, r3, lsl #2
	mov	r3, #4
	add	r4, r7, r2, lsl #2
	orr	r3, r3, #1024
	ldr	r7, [lr]
	ldrh	r6, [r4, r3]
	ldrh	r4, [r10]
	ldrh	r5, [r5, #6]
	orr	r4, r4, r6, lsl r7
	rsb	r12, r5, #16
	strh	r4, [r10]
	cmp	r7, r12
	ble	.LBB53_8
@ BB#6:                                 @   in Loop: Header=BB53_2 Depth=1
	ldr	r7, [r0, #20]
	add	r3, r7, #1
	str	r3, [r0, #20]
	ldr	r3, [r0, #8]
	strb	r4, [r3, r7]
	ldr	r4, [r0, #20]
	ldrb	r7, [r10, #1]
	add	r3, r4, #1
	str	r3, [r0, #20]
	ldr	r3, [r0, #8]
	strb	r7, [r3, r4]
	ldr	r7, [lr]
	rsb	r3, r7, #16
	lsr	r4, r6, r3
	add	r3, r5, r7
	strh	r4, [r10]
	sub	r5, r3, #16
	b	.LBB53_9
.LBB53_7:                               @   in Loop: Header=BB53_2 Depth=1
	add	r8, r5, r2
	b	.LBB53_21
.LBB53_8:                               @   in Loop: Header=BB53_2 Depth=1
	add	r5, r7, r5
.LBB53_9:                               @   in Loop: Header=BB53_2 Depth=1
	sub	r3, r2, #8
	str	r5, [lr]
	cmp	r3, #19
	bhi	.LBB53_14
@ BB#10:                                @   in Loop: Header=BB53_2 Depth=1
	ldr	r3, .LCPI53_1
	ldr	r6, [r3, r2, lsl #2]
	ldr	r3, .LCPI53_2
	ldr	r2, [r3, r2, lsl #2]
	uxth	r3, r4
	sub	r2, r9, r2
	uxth	r2, r2
	orr	r4, r3, r2, lsl r5
	rsb	r3, r6, #16
	strh	r4, [r10]
	cmp	r5, r3
	ble	.LBB53_12
@ BB#11:                                @   in Loop: Header=BB53_2 Depth=1
	ldr	r5, [r0, #20]
	add	r3, r5, #1
	str	r3, [r0, #20]
	ldr	r3, [r0, #8]
	strb	r4, [r3, r5]
	ldr	r4, [r0, #20]
	ldrb	r5, [r10, #1]
	add	r3, r4, #1
	str	r3, [r0, #20]
	ldr	r3, [r0, #8]
	strb	r5, [r3, r4]
	ldr	r5, [lr]
	rsb	r3, r5, #16
	lsr	r4, r2, r3
	add	r2, r6, r5
	strh	r4, [r10]
	sub	r5, r2, #16
	b	.LBB53_13
.LBB53_12:                              @   in Loop: Header=BB53_2 Depth=1
	add	r5, r5, r6
.LBB53_13:                              @   in Loop: Header=BB53_2 Depth=1
	str	r5, [lr]
.LBB53_14:                              @   in Loop: Header=BB53_2 Depth=1
	sub	r9, r8, #1
	cmp	r9, #256
	mov	r2, r9
	movhs	r2, #256
	addhs	r2, r2, r9, lsr #7
	ldr	r3, .LCPI53_3
	ldr	r7, [sp, #12]           @ 4-byte Reload
	ldrb	r2, [r3, r2]
	uxth	r3, r4
	lsl	r6, r2, #2
	ldrh	r6, [r7, r6]!
	ldrh	r4, [r7, #2]
	orr	r7, r3, r6, lsl r5
	rsb	r3, r4, #16
	strh	r7, [r10]
	cmp	r5, r3
	ble	.LBB53_16
@ BB#15:                                @   in Loop: Header=BB53_2 Depth=1
	ldr	r5, [r0, #20]
	add	r3, r5, #1
	str	r3, [r0, #20]
	ldr	r3, [r0, #8]
	strb	r7, [r3, r5]
	ldr	r5, [r0, #20]
	ldrb	r7, [r10, #1]
	add	r3, r5, #1
	str	r3, [r0, #20]
	ldr	r3, [r0, #8]
	strb	r7, [r3, r5]
	ldr	r5, [lr]
	rsb	r3, r5, #16
	lsr	r7, r6, r3
	add	r3, r4, r5
	strh	r7, [r10]
	sub	r8, r3, #16
	b	.LBB53_17
.LBB53_16:                              @   in Loop: Header=BB53_2 Depth=1
	add	r8, r5, r4
.LBB53_17:                              @   in Loop: Header=BB53_2 Depth=1
	sub	r3, r2, #4
	str	r8, [lr]
	cmp	r3, #25
	bhi	.LBB53_22
@ BB#18:                                @   in Loop: Header=BB53_2 Depth=1
	ldr	r3, .LCPI53_4
	ldr	r4, [r3, r2, lsl #2]
	ldr	r3, .LCPI53_5
	ldr	r2, [r3, r2, lsl #2]
	uxth	r3, r7
	sub	r2, r9, r2
	uxth	r2, r2
	orr	r7, r3, r2, lsl r8
	rsb	r3, r4, #16
	strh	r7, [r10]
	cmp	r8, r3
	ble	.LBB53_20
@ BB#19:                                @   in Loop: Header=BB53_2 Depth=1
	ldr	r5, [r0, #20]
	add	r3, r5, #1
	str	r3, [r0, #20]
	ldr	r3, [r0, #8]
	strb	r7, [r3, r5]
	ldr	r5, [r0, #20]
	ldrb	r6, [r10, #1]
	add	r3, r5, #1
	str	r3, [r0, #20]
	ldr	r3, [r0, #8]
	strb	r6, [r3, r5]
	ldr	r5, [lr]
	rsb	r3, r5, #16
	lsr	r7, r2, r3
	add	r2, r4, r5
	strh	r7, [r10]
	sub	r8, r2, #16
	b	.LBB53_21
.LBB53_20:                              @   in Loop: Header=BB53_2 Depth=1
	add	r8, r8, r4
.LBB53_21:                              @   in Loop: Header=BB53_2 Depth=1
	str	r8, [lr]
.LBB53_22:                              @ %._crit_edge
                                        @   in Loop: Header=BB53_2 Depth=1
	ldr	r2, [sp, #8]            @ 4-byte Reload
	add	r11, r11, #2
	ldr	r2, [r2]
	cmp	r1, r2
	blo	.LBB53_2
	b	.LBB53_24
.LBB53_23:                              @ %._crit_edge97
	mov	r1, #700
	orr	r1, r1, #5120
	ldr	r8, [r0, r1]
	mov	r1, #696
	orr	r1, r1, #5120
	ldrh	r7, [r0, r1]
.LBB53_24:                              @ %.loopexit
	ldr	r3, [sp, #16]           @ 4-byte Reload
	mov	r1, #1024
	ldrh	r2, [r3, r1]
	uxth	r1, r7
	mov	r7, r0
	orr	r6, r1, r2, lsl r8
	mov	r1, #2
	orr	r1, r1, #1024
	ldrh	r3, [r3, r1]
	mov	r1, #696
	orr	r1, r1, #5120
	rsb	r5, r3, #16
	strh	r6, [r7, r1]!
	add	r1, r0, #700
	add	r1, r1, #5120
	cmp	r8, r5
	ble	.LBB53_26
@ BB#25:
	ldr	r5, [r0, #20]
	add	r4, r5, #1
	str	r4, [r0, #20]
	ldr	r4, [r0, #8]
	strb	r6, [r4, r5]
	ldr	r6, [r0, #20]
	ldrb	r5, [r7, #1]
	add	r4, r6, #1
	str	r4, [r0, #20]
	ldr	r0, [r0, #8]
	strb	r5, [r0, r6]
	ldr	r0, [r1]
	rsb	r6, r0, #16
	add	r0, r3, r0
	lsr	r2, r2, r6
	strh	r2, [r7]
	sub	r0, r0, #16
	b	.LBB53_27
.LBB53_26:
	add	r0, r8, r3
.LBB53_27:
	str	r0, [r1]
	add	sp, sp, #20
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.align	2
@ BB#28:
.LCPI53_0:
	.long	_length_code
.LCPI53_1:
	.long	extra_lbits
.LCPI53_2:
	.long	base_length
.LCPI53_3:
	.long	_dist_code
.LCPI53_4:
	.long	extra_dbits
.LCPI53_5:
	.long	base_dist
.Ltmp53:
	.size	compress_block, .Ltmp53-compress_block

	.globl	_tr_tally
	.align	2
	.type	_tr_tally,%function
_tr_tally:                              @ @_tr_tally
@ BB#0:
	push	{r4, lr}
	mov	r3, #676
	mov	lr, #1696
	orr	r3, r3, #5120
	orr	lr, lr, #4096
	mov	r12, r0
	ldr	r4, [r0, r3]
	ldr	r3, [r12, lr]!
	cmp	r1, #0
	add	r3, r4, r3, lsl #1
	strh	r1, [r3]
	ldr	r3, [r12]
	add	r4, r3, #1
	str	r4, [r12]
	mov	r4, #664
	orr	r4, r4, #5120
	ldr	r4, [r0, r4]
	strb	r2, [r4, r3]
	beq	.LBB54_2
@ BB#1:
	ldr	r3, .LCPI54_0
	mov	lr, #1712
	orr	lr, lr, #4096
	ldrb	r3, [r3, r2]
	mov	r2, r0
	sub	r1, r1, #1
	ldr	lr, [r2, lr]!
	orr	r3, r3, #256
	add	r3, r0, r3, lsl #2
	add	r4, lr, #1
	str	r4, [r2]
	ldrh	r2, [r3, #152]
	cmp	r1, #256
	add	r2, r2, #1
	strh	r2, [r3, #152]
	movhs	r2, #256
	addhs	r1, r2, r1, lsr #7
	ldr	r2, .LCPI54_1
	ldrb	r1, [r2, r1]
	mov	r2, #392
	orr	r2, r2, #2048
	add	r1, r0, r1, lsl #2
	ldrh	r3, [r1, r2]
	add	r3, r3, #1
	strh	r3, [r1, r2]
	b	.LBB54_3
.LBB54_2:
	add	r1, r0, r2, lsl #2
	ldrh	r2, [r1, #148]
	add	r2, r2, #1
	strh	r2, [r1, #148]
.LBB54_3:
	mov	r1, #668
	orr	r1, r1, #5120
	ldr	r0, [r0, r1]
	ldr	r1, [r12]
	sub	r2, r0, #1
	mov	r0, #0
	cmp	r1, r2
	moveq	r0, #1
	pop	{r4, pc}
	.align	2
@ BB#4:
.LCPI54_0:
	.long	_length_code
.LCPI54_1:
	.long	_dist_code
.Ltmp54:
	.size	_tr_tally, .Ltmp54-_tr_tally

	.align	2
	.type	send_tree,%function
send_tree:                              @ @send_tree
@ BB#0:
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	sub	sp, sp, #44
	mov	r5, r2
	add	r2, r0, #700
	add	r2, r2, #2048
	str	r2, [sp, #24]           @ 4-byte Spill
	add	r2, r0, #190
	add	r2, r2, #2560
	str	r2, [sp, #20]           @ 4-byte Spill
	add	r2, r0, #708
	add	r2, r2, #2048
	str	r2, [sp, #16]           @ 4-byte Spill
	add	r2, r0, #198
	add	r2, r2, #2560
	str	r2, [sp, #12]           @ 4-byte Spill
	add	r2, r0, #696
	add	r12, r2, #5120
	add	r2, r0, #700
	add	r2, r2, #5120
	str	r2, [sp, #32]           @ 4-byte Spill
	add	r2, r0, #194
	add	r2, r2, #2560
	str	r2, [sp, #8]            @ 4-byte Spill
	ldrh	r2, [r1, #2]
	add	r1, r1, #6
	str	r1, [sp, #4]            @ 4-byte Spill
	add	r1, r0, #2752
	str	r1, [sp]                @ 4-byte Spill
	mov	r1, #0
	mov	r4, #4
	cmp	r2, #0
	mov	r9, #7
	str	r1, [sp, #36]           @ 4-byte Spill
	moveq	r4, #3
	moveq	r9, #138
	mvn	r1, #0
	str	r5, [sp, #28]           @ 4-byte Spill
	b	.LBB55_2
.LBB55_1:                               @   in Loop: Header=BB55_2 Depth=1
	cmp	r1, lr
	mov	r4, #4
	mov	r9, #7
	moveq	r4, #3
	moveq	r9, #6
	mov	r2, lr
.LBB55_2:                               @ %.outer
                                        @ =>This Loop Header: Depth=1
                                        @     Child Loop BB55_3 Depth 2
                                        @     Child Loop BB55_8 Depth 2
	str	r2, [sp, #40]           @ 4-byte Spill
	ldr	r2, [sp, #36]           @ 4-byte Reload
	mov	r3, r1
	ldr	r1, [sp, #4]            @ 4-byte Reload
	mov	r10, #245
	add	r1, r1, r2, lsl #2
	orr	r10, r10, #65280
	mvn	r6, #0
	mvn	r2, #0
.LBB55_3:                               @   Parent Loop BB55_2 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r7, [sp, #36]           @ 4-byte Reload
	mov	r8, r6
	add	r7, r7, r2
	add	r7, r7, #1
	cmp	r7, r5
	bgt	.LBB55_40
@ BB#4:                                 @   in Loop: Header=BB55_3 Depth=2
	ldrh	lr, [r1], #4
	add	r11, r2, #1
	add	r10, r10, #1
	add	r2, r2, #2
	cmp	r2, r9
	bge	.LBB55_6
@ BB#5:                                 @   in Loop: Header=BB55_3 Depth=2
	ldr	r2, [sp, #40]           @ 4-byte Reload
	sub	r6, r8, #1
	cmp	r2, lr
	mov	r2, r11
	beq	.LBB55_3
.LBB55_6:                               @   in Loop: Header=BB55_2 Depth=1
	ldr	r1, [sp, #36]           @ 4-byte Reload
	add	r1, r1, r11
	add	r1, r1, #1
	str	r1, [sp, #36]           @ 4-byte Spill
	add	r1, r11, #1
	cmp	r1, r4
	bge	.LBB55_12
@ BB#7:                                 @ %.preheader
                                        @   in Loop: Header=BB55_2 Depth=1
	ldr	r9, [sp, #32]           @ 4-byte Reload
	ldr	r1, [sp, #40]           @ 4-byte Reload
	mov	r5, #126
	ldrh	r4, [r12]
	add	r3, r0, r1, lsl #2
	mov	r1, #636
	ldr	r2, [r9]
	orr	r1, r1, #2048
	orr	r5, r5, #2560
	add	r1, r3, r1
	add	r3, r3, r5
.LBB55_8:                               @   Parent Loop BB55_2 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldrh	r6, [r1]
	uxth	r4, r4
	ldrh	r7, [r3]
	orr	r4, r4, r6, lsl r2
	rsb	r5, r7, #16
	strh	r4, [r12]
	cmp	r2, r5
	ble	.LBB55_10
@ BB#9:                                 @   in Loop: Header=BB55_8 Depth=2
	ldr	r2, [r0, #20]
	add	r5, r2, #1
	str	r5, [r0, #20]
	ldr	r5, [r0, #8]
	strb	r4, [r5, r2]
	ldr	r2, [r0, #20]
	ldrb	r4, [r12, #1]
	add	r5, r2, #1
	str	r5, [r0, #20]
	ldr	r5, [r0, #8]
	strb	r4, [r5, r2]
	ldr	r2, [r9]
	rsb	r4, r2, #16
	add	r2, r7, r2
	lsr	r4, r6, r4
	strh	r4, [r12]
	sub	r2, r2, #16
	b	.LBB55_11
.LBB55_10:                              @   in Loop: Header=BB55_8 Depth=2
	add	r2, r2, r7
.LBB55_11:                              @   in Loop: Header=BB55_8 Depth=2
	adds	r8, r8, #1
	str	r2, [r9]
	bne	.LBB55_8
	b	.LBB55_39
.LBB55_12:                              @   in Loop: Header=BB55_2 Depth=1
	ldr	r2, [sp, #40]           @ 4-byte Reload
	ldr	r9, [sp, #32]           @ 4-byte Reload
	cmp	r2, #0
	bne	.LBB55_16
@ BB#13:                                @   in Loop: Header=BB55_2 Depth=1
	cmp	r1, #10
	bgt	.LBB55_18
@ BB#14:                                @   in Loop: Header=BB55_2 Depth=1
	ldr	r1, [sp]                @ 4-byte Reload
	ldr	r2, [sp, #8]            @ 4-byte Reload
	ldr	r4, [r9]
	ldrh	r3, [r1]
	ldrh	r1, [r12]
	ldrh	r2, [r2]
	orr	r1, r1, r3, lsl r4
	rsb	r6, r2, #16
	strh	r1, [r12]
	cmp	r4, r6
	ble	.LBB55_22
@ BB#15:                                @   in Loop: Header=BB55_2 Depth=1
	ldr	r4, [r0, #20]
	add	r6, r4, #1
	str	r6, [r0, #20]
	ldr	r6, [r0, #8]
	strb	r1, [r6, r4]
	ldr	r1, [r0, #20]
	ldrb	r4, [r12, #1]
	add	r6, r1, #1
	str	r6, [r0, #20]
	ldr	r6, [r0, #8]
	strb	r4, [r6, r1]
	ldr	r4, [r9]
	rsb	r1, r4, #16
	add	r2, r2, r4
	lsr	r1, r3, r1
	strh	r1, [r12]
	sub	r2, r2, #16
	b	.LBB55_23
.LBB55_16:                              @   in Loop: Header=BB55_2 Depth=1
	cmp	r2, r3
	bne	.LBB55_20
@ BB#17:                                @ %._crit_edge
                                        @   in Loop: Header=BB55_2 Depth=1
	ldrh	r3, [r12]
	ldr	r2, [r9]
	b	.LBB55_30
.LBB55_18:                              @   in Loop: Header=BB55_2 Depth=1
	ldr	r1, [sp, #16]           @ 4-byte Reload
	ldr	r2, [sp, #12]           @ 4-byte Reload
	ldr	r4, [r9]
	ldrh	r3, [r1]
	ldrh	r1, [r12]
	ldrh	r2, [r2]
	orr	r1, r1, r3, lsl r4
	rsb	r6, r2, #16
	strh	r1, [r12]
	cmp	r4, r6
	ble	.LBB55_25
@ BB#19:                                @   in Loop: Header=BB55_2 Depth=1
	ldr	r4, [r0, #20]
	add	r6, r4, #1
	str	r6, [r0, #20]
	ldr	r6, [r0, #8]
	strb	r1, [r6, r4]
	ldr	r1, [r0, #20]
	ldrb	r4, [r12, #1]
	add	r6, r1, #1
	str	r6, [r0, #20]
	ldr	r6, [r0, #8]
	strb	r4, [r6, r1]
	ldr	r4, [r9]
	rsb	r1, r4, #16
	add	r2, r2, r4
	lsr	r1, r3, r1
	strh	r1, [r12]
	sub	r3, r2, #16
	b	.LBB55_26
.LBB55_20:                              @   in Loop: Header=BB55_2 Depth=1
	add	r1, r0, r2, lsl #2
	mov	r2, #636
	orr	r2, r2, #2048
	mov	r5, #126
	ldr	r4, [r9]
	ldrh	r2, [r1, r2]
	orr	r5, r5, #2560
	ldrh	r3, [r12]
	ldrh	r1, [r1, r5]
	orr	r3, r3, r2, lsl r4
	rsb	r6, r1, #16
	strh	r3, [r12]
	cmp	r4, r6
	ble	.LBB55_28
@ BB#21:                                @   in Loop: Header=BB55_2 Depth=1
	ldr	r4, [r0, #20]
	add	r6, r4, #1
	str	r6, [r0, #20]
	ldr	r6, [r0, #8]
	strb	r3, [r6, r4]
	ldr	r3, [r0, #20]
	ldrb	r4, [r12, #1]
	add	r6, r3, #1
	str	r6, [r0, #20]
	ldr	r6, [r0, #8]
	strb	r4, [r6, r3]
	ldr	r4, [r9]
	rsb	r3, r4, #16
	add	r1, r1, r4
	lsr	r3, r2, r3
	strh	r3, [r12]
	sub	r2, r1, #16
	b	.LBB55_29
.LBB55_22:                              @   in Loop: Header=BB55_2 Depth=1
	add	r2, r4, r2
.LBB55_23:                              @   in Loop: Header=BB55_2 Depth=1
	uxth	r3, r1
	add	r1, r10, #8
	str	r2, [r9]
	uxth	r1, r1
	orr	r3, r3, r1, lsl r2
	strh	r3, [r12]
	cmp	r2, #14
	blt	.LBB55_36
@ BB#24:                                @   in Loop: Header=BB55_2 Depth=1
	ldr	r2, [r0, #20]
	add	r4, r2, #1
	str	r4, [r0, #20]
	ldr	r4, [r0, #8]
	strb	r3, [r4, r2]
	ldr	r2, [r0, #20]
	ldrb	r3, [r12, #1]
	add	r4, r2, #1
	str	r4, [r0, #20]
	ldr	r4, [r0, #8]
	strb	r3, [r4, r2]
	ldr	r2, [r9]
	rsb	r3, r2, #16
	lsr	r1, r1, r3
	strh	r1, [r12]
	sub	r1, r2, #13
	b	.LBB55_38
.LBB55_25:                              @   in Loop: Header=BB55_2 Depth=1
	add	r3, r4, r2
.LBB55_26:                              @   in Loop: Header=BB55_2 Depth=1
	uxth	r1, r1
	uxth	r2, r10
	orr	r1, r1, r2, lsl r3
	str	r3, [r9]
	strh	r1, [r12]
	cmp	r3, #10
	blt	.LBB55_37
@ BB#27:                                @   in Loop: Header=BB55_2 Depth=1
	ldr	r3, [r0, #20]
	add	r4, r3, #1
	str	r4, [r0, #20]
	ldr	r4, [r0, #8]
	strb	r1, [r4, r3]
	ldr	r1, [r0, #20]
	ldrb	r3, [r12, #1]
	add	r4, r1, #1
	str	r4, [r0, #20]
	ldr	r4, [r0, #8]
	strb	r3, [r4, r1]
	ldr	r1, [r9]
	rsb	r3, r1, #16
	sub	r1, r1, #9
	lsr	r2, r2, r3
	strh	r2, [r12]
	b	.LBB55_38
.LBB55_28:                              @   in Loop: Header=BB55_2 Depth=1
	add	r2, r4, r1
.LBB55_29:                              @   in Loop: Header=BB55_2 Depth=1
	mov	r1, r11
	str	r2, [r9]
.LBB55_30:                              @   in Loop: Header=BB55_2 Depth=1
	ldr	r4, [sp, #24]           @ 4-byte Reload
	ldr	r5, [sp, #20]           @ 4-byte Reload
	uxth	r3, r3
	ldrh	r4, [r4]
	ldrh	r7, [r5]
	orr	r3, r3, r4, lsl r2
	rsb	r6, r7, #16
	strh	r3, [r12]
	cmp	r2, r6
	ble	.LBB55_32
@ BB#31:                                @   in Loop: Header=BB55_2 Depth=1
	ldr	r2, [r0, #20]
	add	r6, r2, #1
	str	r6, [r0, #20]
	ldr	r6, [r0, #8]
	strb	r3, [r6, r2]
	ldr	r2, [r0, #20]
	ldrb	r3, [r12, #1]
	add	r6, r2, #1
	str	r6, [r0, #20]
	ldr	r6, [r0, #8]
	strb	r3, [r6, r2]
	ldr	r2, [r9]
	rsb	r3, r2, #16
	add	r2, r7, r2
	lsr	r3, r4, r3
	strh	r3, [r12]
	sub	r2, r2, #16
	b	.LBB55_33
.LBB55_32:                              @   in Loop: Header=BB55_2 Depth=1
	add	r2, r2, r7
.LBB55_33:                              @   in Loop: Header=BB55_2 Depth=1
	mov	r4, #253
	orr	r4, r4, #65280
	add	r1, r1, r4
	uxth	r3, r3
	uxth	r1, r1
	orr	r3, r3, r1, lsl r2
	str	r2, [r9]
	strh	r3, [r12]
	cmp	r2, #15
	blt	.LBB55_35
@ BB#34:                                @   in Loop: Header=BB55_2 Depth=1
	ldr	r2, [r0, #20]
	add	r4, r2, #1
	str	r4, [r0, #20]
	ldr	r4, [r0, #8]
	strb	r3, [r4, r2]
	ldr	r2, [r0, #20]
	ldrb	r3, [r12, #1]
	add	r4, r2, #1
	str	r4, [r0, #20]
	ldr	r4, [r0, #8]
	strb	r3, [r4, r2]
	ldr	r2, [r9]
	rsb	r3, r2, #16
	lsr	r1, r1, r3
	strh	r1, [r12]
	sub	r1, r2, #14
	b	.LBB55_38
.LBB55_35:                              @   in Loop: Header=BB55_2 Depth=1
	add	r1, r2, #2
	b	.LBB55_38
.LBB55_36:                              @   in Loop: Header=BB55_2 Depth=1
	add	r1, r2, #3
	b	.LBB55_38
.LBB55_37:                              @   in Loop: Header=BB55_2 Depth=1
	add	r1, r3, #7
.LBB55_38:                              @   in Loop: Header=BB55_2 Depth=1
	str	r1, [r9]
.LBB55_39:                              @ %.loopexit
                                        @   in Loop: Header=BB55_2 Depth=1
	ldr	r5, [sp, #28]           @ 4-byte Reload
	ldr	r1, [sp, #40]           @ 4-byte Reload
	str	r9, [sp, #32]           @ 4-byte Spill
	mov	r4, #3
	mov	r9, #138
	mov	r2, #0
	cmp	lr, #0
	beq	.LBB55_2
	b	.LBB55_1
.LBB55_40:
	add	sp, sp, #44
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
.Ltmp55:
	.size	send_tree, .Ltmp55-send_tree

	.align	2
	.type	scan_tree,%function
scan_tree:                              @ @scan_tree
@ BB#0:
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	sub	sp, sp, #8
	add	r3, r1, r2, lsl #2
	mov	r7, #255
	ldrh	r11, [r1, #2]
	orr	r7, r7, #65280
	strh	r7, [r3, #6]
	add	r3, r0, #700
	mov	r10, #636
	add	r8, r3, #2048
	add	r3, r0, #708
	mov	r5, #7
	cmp	r11, #0
	mov	r12, #4
	str	r0, [sp, #4]            @ 4-byte Spill
	moveq	r12, #3
	moveq	r5, #138
	add	r9, r3, #2048
	add	r0, r0, #2752
	mov	r4, #0
	mvn	r6, #0
	orr	r10, r10, #2048
	add	r1, r1, #6
	str	r1, [sp]                @ 4-byte Spill
	b	.LBB56_2
.LBB56_1:                               @   in Loop: Header=BB56_2 Depth=1
	cmp	r6, r3
	mov	r12, #4
	mov	r5, #7
	moveq	r12, #3
	moveq	r5, #6
	mov	r11, r3
.LBB56_2:                               @ %.outer
                                        @ =>This Loop Header: Depth=1
                                        @     Child Loop BB56_3 Depth 2
	ldr	r1, [sp]                @ 4-byte Reload
	mov	lr, r6
	add	r7, r1, r4, lsl #2
	mov	r6, r11
	mov	r1, #0
.LBB56_3:                               @   Parent Loop BB56_2 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	add	r3, r4, r1
	cmp	r3, r2
	bgt	.LBB56_16
@ BB#4:                                 @   in Loop: Header=BB56_3 Depth=2
	ldrh	r3, [r7], #4
	add	r1, r1, #1
	cmp	r1, r5
	bge	.LBB56_6
@ BB#5:                                 @   in Loop: Header=BB56_3 Depth=2
	cmp	r6, r3
	beq	.LBB56_3
.LBB56_6:                               @   in Loop: Header=BB56_2 Depth=1
	add	r4, r4, r1
	cmp	r1, r12
	bge	.LBB56_8
@ BB#7:                                 @   in Loop: Header=BB56_2 Depth=1
	ldr	r7, [sp, #4]            @ 4-byte Reload
	add	r7, r7, r6, lsl #2
	ldrh	r5, [r7, r10]
	add	r1, r5, r1
	strh	r1, [r7, r10]
	b	.LBB56_15
.LBB56_8:                               @   in Loop: Header=BB56_2 Depth=1
	cmp	r6, #0
	bne	.LBB56_11
@ BB#9:                                 @   in Loop: Header=BB56_2 Depth=1
	cmp	r1, #10
	bgt	.LBB56_14
@ BB#10:                                @   in Loop: Header=BB56_2 Depth=1
	ldrh	r1, [r0]
	add	r1, r1, #1
	strh	r1, [r0]
	b	.LBB56_15
.LBB56_11:                              @   in Loop: Header=BB56_2 Depth=1
	cmp	r6, lr
	beq	.LBB56_13
@ BB#12:                                @   in Loop: Header=BB56_2 Depth=1
	ldr	r1, [sp, #4]            @ 4-byte Reload
	add	r1, r1, r6, lsl #2
	ldrh	r7, [r1, r10]
	add	r7, r7, #1
	strh	r7, [r1, r10]
.LBB56_13:                              @ %._crit_edge
                                        @   in Loop: Header=BB56_2 Depth=1
	ldrh	r1, [r8]
	add	r1, r1, #1
	strh	r1, [r8]
	b	.LBB56_15
.LBB56_14:                              @   in Loop: Header=BB56_2 Depth=1
	ldrh	r1, [r9]
	add	r1, r1, #1
	strh	r1, [r9]
.LBB56_15:                              @   in Loop: Header=BB56_2 Depth=1
	mov	r12, #3
	mov	r5, #138
	mov	r11, #0
	cmp	r3, #0
	beq	.LBB56_2
	b	.LBB56_1
.LBB56_16:
	add	sp, sp, #8
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
.Ltmp56:
	.size	scan_tree, .Ltmp56-scan_tree

	.align	2
	.type	pqdownheap,%function
pqdownheap:                             @ @pqdownheap
@ BB#0:
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	sub	sp, sp, #12
	add	r3, r0, r2, lsl #2
	mov	r10, r0
	ldr	r6, [r3, #2908]
	mov	r3, #1104
	orr	r3, r3, #4096
	lsl	r4, r2, #1
	ldr	r3, [r10, r3]!
	cmp	r4, r3
	ble	.LBB57_2
@ BB#1:
	str	r6, [sp]                @ 4-byte Spill
	mov	r5, r2
	b	.LBB57_16
.LBB57_2:                               @ %.lr.ph
	mov	r9, #88
	orr	r9, r9, #5120
	add	r7, r0, r6
	add	r7, r7, r9
	str	r7, [sp, #8]            @ 4-byte Spill
	add	r7, r1, r6, lsl #2
	add	lr, r0, r9
	stm	sp, {r6, r7}
	add	r7, r0, #860
	add	r11, r7, #2048
.LBB57_3:                               @ =>This Inner Loop Header: Depth=1
	cmp	r4, r3
	bge	.LBB57_6
@ BB#4:                                 @   in Loop: Header=BB57_3 Depth=1
	orr	r3, r4, #1
	ldr	r5, [r11, r4, lsl #2]
	ldr	r6, [r11, r3, lsl #2]
	add	r7, r1, r5, lsl #2
	add	r8, r1, r6, lsl #2
	ldrh	r12, [r7]
	ldrh	r7, [r8]
	cmp	r7, r12
	bhs	.LBB57_7
@ BB#5:                                 @   in Loop: Header=BB57_3 Depth=1
	mov	r5, r3
	b	.LBB57_10
.LBB57_6:                               @   in Loop: Header=BB57_3 Depth=1
	mov	r5, r4
	b	.LBB57_10
.LBB57_7:                               @   in Loop: Header=BB57_3 Depth=1
	bne	.LBB57_9
@ BB#8:                                 @   in Loop: Header=BB57_3 Depth=1
	ldrb	r7, [lr, r5]
	ldrb	r6, [lr, r6]
	mov	r5, r4
	cmp	r6, r7
	movls	r5, r3
	b	.LBB57_10
.LBB57_9:                               @   in Loop: Header=BB57_3 Depth=1
	mov	r5, r4
.LBB57_10:                              @ %._crit_edge46
                                        @   in Loop: Header=BB57_3 Depth=1
	add	r3, r0, r5, lsl #2
	ldr	r6, [sp, #4]            @ 4-byte Reload
	ldr	r3, [r3, #2908]
	add	r7, r1, r3, lsl #2
	ldrh	r6, [r6]
	ldrh	r7, [r7]
	cmp	r6, r7
	blo	.LBB57_14
@ BB#11:                                @   in Loop: Header=BB57_3 Depth=1
	bne	.LBB57_13
@ BB#12:                                @   in Loop: Header=BB57_3 Depth=1
	ldr	r6, [sp, #8]            @ 4-byte Reload
	add	r7, r0, r3
	ldrb	r7, [r7, r9]
	ldrb	r6, [r6]
	cmp	r6, r7
	bls	.LBB57_15
.LBB57_13:                              @   in Loop: Header=BB57_3 Depth=1
	add	r2, r0, r2, lsl #2
	lsl	r4, r5, #1
	str	r3, [r2, #2908]
	ldr	r3, [r10]
	mov	r2, r5
	cmp	r4, r3
	ble	.LBB57_3
	b	.LBB57_16
.LBB57_14:
	mov	r5, r2
	b	.LBB57_16
.LBB57_15:
	mov	r5, r2
.LBB57_16:                              @ %split43
	add	r0, r0, r5, lsl #2
	ldr	r1, [sp]                @ 4-byte Reload
	str	r1, [r0, #2908]
	add	sp, sp, #12
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
.Ltmp57:
	.size	pqdownheap, .Ltmp57-pqdownheap

	.globl	inflateResetKeep
	.align	2
	.type	inflateResetKeep,%function
inflateResetKeep:                       @ @inflateResetKeep
@ BB#0:
	mov	r1, r0
	cmp	r1, #0
	ldrne	r2, [r1, #28]
	mvn	r0, #1
	cmpne	r2, #0
	beq	.LBB58_2
@ BB#1:
	mov	r0, #0
	str	r0, [r2, #28]
	str	r0, [r1, #20]
	str	r0, [r1, #8]
	str	r0, [r1, #24]
	ldr	r3, [r2, #8]
	cmp	r3, #0
	andne	r3, r3, #1
	strne	r3, [r1, #48]
	mov	r1, #32768
	str	r0, [r2]
	str	r0, [r2, #4]
	str	r0, [r2, #12]
	str	r1, [r2, #20]
	add	r1, r2, #1328
	str	r0, [r2, #32]
	str	r0, [r2, #56]
	str	r0, [r2, #60]
	str	r1, [r2, #108]
	str	r1, [r2, #80]
	str	r1, [r2, #76]
	mov	r1, #7104
	mov	r3, #1
	str	r3, [r2, r1]
	mov	r1, #964
	orr	r1, r1, #6144
	mvn	r3, #0
	str	r3, [r2, r1]
.LBB58_2:
	bx	lr
.Ltmp58:
	.size	inflateResetKeep, .Ltmp58-inflateResetKeep

	.globl	inflateReset
	.align	2
	.type	inflateReset,%function
inflateReset:                           @ @inflateReset
@ BB#0:
	mov	r1, r0
	cmp	r1, #0
	ldrne	r2, [r1, #28]
	mvn	r0, #1
	cmpne	r2, #0
	beq	.LBB59_2
@ BB#1:
	mov	r3, #0
	str	r3, [r2, #40]
	str	r3, [r2, #44]
	str	r3, [r2, #48]
	ldr	r2, [r1, #28]
	cmp	r2, #0
	bxeq	lr
	str	r3, [r2, #28]
	str	r3, [r1, #20]
	str	r3, [r1, #8]
	str	r3, [r1, #24]
	ldr	r0, [r2, #8]
	mov	r3, #1
	cmp	r0, #0
	andne	r0, r0, #1
	strne	r0, [r1, #48]
	mov	r0, #0
	mov	r1, #32768
	str	r0, [r2]
	str	r0, [r2, #4]
	str	r0, [r2, #12]
	str	r1, [r2, #20]
	add	r1, r2, #1328
	str	r0, [r2, #32]
	str	r0, [r2, #56]
	str	r0, [r2, #60]
	str	r1, [r2, #108]
	str	r1, [r2, #80]
	str	r1, [r2, #76]
	mov	r1, #7104
	str	r3, [r2, r1]
	mov	r1, #964
	orr	r1, r1, #6144
	mvn	r3, #0
	str	r3, [r2, r1]
.LBB59_2:                               @ %inflateResetKeep.exit
	bx	lr
.Ltmp59:
	.size	inflateReset, .Ltmp59-inflateReset

	.globl	inflateReset2
	.align	2
	.type	inflateReset2,%function
inflateReset2:                          @ @inflateReset2
@ BB#0:
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, r0
	cmp	r5, #0
	ldrne	r6, [r5, #28]
	mvn	r4, #1
	cmpne	r6, #0
	beq	.LBB60_12
@ BB#1:
	cmp	r1, #0
	blt	.LBB60_4
@ BB#2:
	cmp	r1, #47
	bgt	.LBB60_12
@ BB#3:
	mov	r0, #1
	add	r8, r0, r1, asr #4
	and	r0, r1, #15
	b	.LBB60_5
.LBB60_4:
	rsb	r0, r1, #0
	mov	r8, #0
.LBB60_5:
	mov	r7, #0
	cmp	r0, #0
	beq	.LBB60_7
@ BB#6:
	mov	r7, r0
	sub	r1, r0, #8
	cmp	r1, #7
	bhi	.LBB60_12
.LBB60_7:
	ldr	r1, [r6, #52]
	cmp	r1, #0
	ldrne	r0, [r6, #36]
	cmpne	r0, r7
	beq	.LBB60_9
@ BB#8:
	ldr	r2, [r5, #36]
	ldr	r0, [r5, #40]
	blx	r2
	mov	r0, #0
	str	r0, [r6, #52]
.LBB60_9:                               @ %._crit_edge
	str	r8, [r6, #8]
	str	r7, [r6, #36]
	ldr	r0, [r5, #28]
	cmp	r0, #0
	beq	.LBB60_12
@ BB#10:
	mov	r1, #0
	str	r1, [r0, #40]
	str	r1, [r0, #44]
	str	r1, [r0, #48]
	ldr	r0, [r5, #28]
	cmp	r0, #0
	beq	.LBB60_12
@ BB#11:
	str	r1, [r0, #28]
	str	r1, [r5, #20]
	str	r1, [r5, #8]
	str	r1, [r5, #24]
	ldr	r1, [r0, #8]
	mov	r4, #0
	mov	r2, #1
	cmp	r1, #0
	andne	r1, r1, #1
	strne	r1, [r5, #48]
	mov	r1, #32768
	str	r4, [r0]
	str	r4, [r0, #4]
	str	r4, [r0, #12]
	str	r1, [r0, #20]
	add	r1, r0, #1328
	str	r4, [r0, #32]
	str	r4, [r0, #56]
	str	r4, [r0, #60]
	str	r1, [r0, #108]
	str	r1, [r0, #80]
	str	r1, [r0, #76]
	mov	r1, #7104
	str	r2, [r0, r1]
	mov	r1, #964
	orr	r1, r1, #6144
	mvn	r2, #0
	str	r2, [r0, r1]
.LBB60_12:                              @ %inflateReset.exit
	mov	r0, r4
	pop	{r4, r5, r6, r7, r8, pc}
.Ltmp60:
	.size	inflateReset2, .Ltmp60-inflateReset2

	.globl	inflateInit2_
	.align	2
	.type	inflateInit2_,%function
inflateInit2_:                          @ @inflateInit2_
@ BB#0:
	push	{r4, r5, r6, r7, r11, lr}
	mov	r5, r1
	mov	r4, r0
	mvn	r6, #5
	cmp	r2, #0
	beq	.LBB61_6
@ BB#1:
	ldrb	r0, [r2]
	cmp	r0, #49
	cmpeq	r3, #56
	bne	.LBB61_6
@ BB#2:
	mvn	r6, #1
	cmp	r4, #0
	beq	.LBB61_6
@ BB#3:
	mov	r0, #0
	str	r0, [r4, #24]
	ldr	r3, [r4, #32]
	mov	r2, #972
	orr	r2, r2, #6144
	cmp	r3, #0
	ldreq	r3, .LCPI61_0
	mov	r1, #1
	streq	r3, [r4, #32]
	streq	r0, [r4, #40]
	ldr	r0, [r4, #36]
	cmp	r0, #0
	ldreq	r0, .LCPI61_1
	streq	r0, [r4, #36]
	ldr	r0, [r4, #40]
	blx	r3
	mov	r7, r0
	mvn	r6, #3
	cmp	r7, #0
	beq	.LBB61_6
@ BB#4:
	mov	r0, r4
	mov	r1, r5
	mov	r6, #0
	str	r7, [r4, #28]
	str	r6, [r7, #52]
	bl	inflateReset2
	mov	r5, r0
	cmp	r5, #0
	beq	.LBB61_6
@ BB#5:
	ldr	r2, [r4, #36]
	ldr	r0, [r4, #40]
	mov	r1, r7
	blx	r2
	mov	r6, r5
	mov	r0, #0
	str	r0, [r4, #28]
.LBB61_6:
	mov	r0, r6
	pop	{r4, r5, r6, r7, r11, pc}
	.align	2
@ BB#7:
.LCPI61_0:
	.long	zcalloc
.LCPI61_1:
	.long	zcfree
.Ltmp61:
	.size	inflateInit2_, .Ltmp61-inflateInit2_

	.globl	inflateInit_
	.align	2
	.type	inflateInit_,%function
inflateInit_:                           @ @inflateInit_
@ BB#0:
	push	{r4, r5, r6, r7, r11, lr}
	mov	r4, r0
	mvn	r5, #5
	cmp	r1, #0
	beq	.LBB62_6
@ BB#1:
	ldrb	r0, [r1]
	cmp	r0, #49
	cmpeq	r2, #56
	bne	.LBB62_6
@ BB#2:
	mvn	r5, #1
	cmp	r4, #0
	beq	.LBB62_6
@ BB#3:
	mov	r0, #0
	str	r0, [r4, #24]
	ldr	r3, [r4, #32]
	mov	r2, #972
	orr	r2, r2, #6144
	cmp	r3, #0
	ldreq	r3, .LCPI62_0
	mov	r1, #1
	streq	r3, [r4, #32]
	streq	r0, [r4, #40]
	ldr	r0, [r4, #36]
	cmp	r0, #0
	ldreq	r0, .LCPI62_1
	streq	r0, [r4, #36]
	ldr	r0, [r4, #40]
	blx	r3
	mov	r6, r0
	mvn	r5, #3
	cmp	r6, #0
	beq	.LBB62_6
@ BB#4:
	mov	r0, r4
	mov	r1, #15
	mov	r5, #0
	str	r6, [r4, #28]
	str	r5, [r6, #52]
	bl	inflateReset2
	mov	r7, r0
	cmp	r7, #0
	beq	.LBB62_6
@ BB#5:
	ldr	r2, [r4, #36]
	ldr	r0, [r4, #40]
	mov	r1, r6
	blx	r2
	mov	r5, r7
	mov	r0, #0
	str	r0, [r4, #28]
.LBB62_6:                               @ %inflateInit2_.exit
	mov	r0, r5
	pop	{r4, r5, r6, r7, r11, pc}
	.align	2
@ BB#7:
.LCPI62_0:
	.long	zcalloc
.LCPI62_1:
	.long	zcfree
.Ltmp62:
	.size	inflateInit_, .Ltmp62-inflateInit_

	.globl	inflatePrime
	.align	2
	.type	inflatePrime,%function
inflatePrime:                           @ @inflatePrime
@ BB#0:
	push	{r4, lr}
	mov	r3, r0
	cmp	r3, #0
	ldrne	r3, [r3, #28]
	mvn	r0, #1
	cmpne	r3, #0
	beq	.LBB63_4
@ BB#1:
	cmp	r1, #0
	blt	.LBB63_5
@ BB#2:
	cmp	r1, #16
	bgt	.LBB63_4
@ BB#3:
	ldr	lr, [r3, #60]
	add	r12, lr, r1
	cmp	r12, #32
	pophi	{r4, pc}
	mov	r0, #1
	mvn	r4, #0
	add	r0, r4, r0, lsl r1
	ldr	r1, [r3, #56]
	and	r0, r0, r2
	add	r0, r1, r0, lsl lr
	str	r0, [r3, #56]
	mov	r0, #0
	str	r12, [r3, #60]
.LBB63_4:
	pop	{r4, pc}
.LBB63_5:
	mov	r0, #0
	str	r0, [r3, #56]
	str	r0, [r3, #60]
	pop	{r4, pc}
.Ltmp63:
	.size	inflatePrime, .Ltmp63-inflatePrime

	.globl	inflate
	.align	2
	.type	inflate,%function
inflate:                                @ @inflate
@ BB#0:
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	sub	sp, sp, #84
	mov	lr, r0
	str	r1, [sp, #56]           @ 4-byte Spill
	mvn	r1, #1
	str	lr, [sp, #28]           @ 4-byte Spill
	cmp	lr, #0
	beq	.LBB64_6
@ BB#1:
	ldr	r11, [lr, #28]
	cmp	r11, #0
	beq	.LBB64_7
@ BB#2:
	ldr	r0, [lr, #12]
	cmp	r0, #0
	beq	.LBB64_306
@ BB#3:
	ldr	r7, [lr]
	str	r0, [sp, #76]           @ 4-byte Spill
	cmp	r7, #0
	bne	.LBB64_8
@ BB#4:
	ldr	r0, [lr, #4]
	cmp	r0, #0
	beq	.LBB64_8
@ BB#5:
	str	r1, [sp, #32]           @ 4-byte Spill
	b	.LBB64_319
.LBB64_6:
	str	r1, [sp, #32]           @ 4-byte Spill
	b	.LBB64_319
.LBB64_7:
	str	r1, [sp, #32]           @ 4-byte Spill
	b	.LBB64_319
.LBB64_8:
	ldr	r0, [r11]
	cmp	r0, #11
	bne	.LBB64_10
@ BB#9:
	mov	r0, #12
	str	r0, [r11]
	ldr	r7, [lr]
	ldr	r1, [lr, #12]
	str	r1, [sp, #76]           @ 4-byte Spill
.LBB64_10:                              @ %._crit_edge2203
	add	r1, r11, #968
	add	r1, r1, #6144
	str	r1, [sp, #24]           @ 4-byte Spill
	add	r1, r11, #964
	add	r9, r1, #6144
	add	r1, r11, #624
	str	r1, [sp, #20]           @ 4-byte Spill
	add	r1, r11, #752
	str	r1, [sp, #52]           @ 4-byte Spill
	add	r1, r11, #112
	str	r1, [sp, #48]           @ 4-byte Spill
	add	r1, r11, #108
	str	r1, [sp, #44]           @ 4-byte Spill
	add	r1, r11, #1328
	str	r1, [sp, #40]           @ 4-byte Spill
	add	r1, r11, #7104
	str	r1, [sp, #16]           @ 4-byte Spill
	add	r1, r11, #88
	str	r1, [sp, #36]           @ 4-byte Spill
	add	r1, r11, #84
	str	r1, [sp, #72]           @ 4-byte Spill
	ldr	r1, [sp, #56]           @ 4-byte Reload
	ldr	r10, [lr, #4]
	ldr	r12, [lr, #16]
	ldr	r8, [r11, #56]
	ldr	r5, [r11, #60]
	sub	r1, r1, #5
	str	r1, [sp, #12]           @ 4-byte Spill
	mov	r1, #0
	str	r10, [sp, #8]           @ 4-byte Spill
	str	r9, [sp, #68]           @ 4-byte Spill
	str	r1, [sp, #64]           @ 4-byte Spill
	str	r12, [sp, #60]          @ 4-byte Spill
	b	.LBB64_12
.LBB64_11:                              @   in Loop: Header=BB64_12 Depth=1
	str	r0, [r11]
	ldr	r0, [r11]
.LBB64_12:                              @ %.thread
                                        @ =>This Loop Header: Depth=1
                                        @     Child Loop BB64_39 Depth 2
                                        @     Child Loop BB64_291 Depth 2
                                        @     Child Loop BB64_89 Depth 2
                                        @     Child Loop BB64_94 Depth 2
                                        @       Child Loop BB64_95 Depth 3
                                        @     Child Loop BB64_99 Depth 2
                                        @     Child Loop BB64_103 Depth 2
                                        @       Child Loop BB64_105 Depth 3
                                        @       Child Loop BB64_124 Depth 3
                                        @       Child Loop BB64_120 Depth 3
                                        @       Child Loop BB64_114 Depth 3
                                        @       Child Loop BB64_130 Depth 3
                                        @     Child Loop BB64_158 Depth 2
                                        @     Child Loop BB64_219 Depth 2
                                        @     Child Loop BB64_230 Depth 2
                                        @     Child Loop BB64_236 Depth 2
                                        @     Child Loop BB64_242 Depth 2
                                        @     Child Loop BB64_253 Depth 2
                                        @     Child Loop BB64_268 Depth 2
                                        @     Child Loop BB64_21 Depth 2
                                        @     Child Loop BB64_29 Depth 2
                                        @     Child Loop BB64_74 Depth 2
                                        @     Child Loop BB64_83 Depth 2
                                        @     Child Loop BB64_45 Depth 2
                                        @     Child Loop BB64_54 Depth 2
                                        @     Child Loop BB64_59 Depth 2
                                        @     Child Loop BB64_69 Depth 2
                                        @     Child Loop BB64_174 Depth 2
                                        @     Child Loop BB64_184 Depth 2
                                        @     Child Loop BB64_197 Depth 2
                                        @     Child Loop BB64_209 Depth 2
                                        @     Child Loop BB64_136 Depth 2
	cmp	r0, #30
	bhi	.LBB64_317
@ BB#13:                                @ %.thread
                                        @   in Loop: Header=BB64_12 Depth=1
	mvn	r1, #3
	lsl	r0, r0, #2
	str	r1, [sp, #32]           @ 4-byte Spill
	adr	r1, .LJTI64_0_0
	mov	r2, #1
	ldr	pc, [r0, r1]
.LJTI64_0_0:
	.long	.LBB64_14
	.long	.LBB64_45
	.long	.LBB64_16
	.long	.LBB64_17
	.long	.LBB64_18
	.long	.LBB64_144
	.long	.LBB64_19
	.long	.LBB64_194
	.long	.LBB64_207
	.long	.LBB64_74
	.long	.LBB64_77
	.long	.LBB64_79
	.long	.LBB64_80
	.long	.LBB64_20
	.long	.LBB64_25
	.long	.LBB64_26
	.long	.LBB64_89
	.long	.LBB64_31
	.long	.LBB64_32
	.long	.LBB64_151
	.long	.LBB64_152
	.long	.LBB64_33
	.long	.LBB64_234
	.long	.LBB64_34
	.long	.LBB64_258
	.long	.LBB64_35
	.long	.LBB64_37
	.long	.LBB64_289
	.long	.LBB64_310
	.long	.LBB64_332
	.long	.LBB64_319
.LBB64_14:                              @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, [r11, #8]
	cmp	r0, #0
	bne	.LBB64_136
@ BB#15:                                @   in Loop: Header=BB64_12 Depth=1
	mov	r0, #12
	b	.LBB64_11
.LBB64_16:                              @ %.preheader1270
                                        @   in Loop: Header=BB64_12 Depth=1
	cmp	r5, #31
	bhi	.LBB64_56
	b	.LBB64_54
.LBB64_17:                              @ %.preheader1290
                                        @   in Loop: Header=BB64_12 Depth=1
	cmp	r5, #15
	bhi	.LBB64_61
	b	.LBB64_59
.LBB64_18:                              @ %.thread._crit_edge2199
                                        @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, [r11, #16]
	b	.LBB64_66
.LBB64_19:                              @ %.thread._crit_edge2197
                                        @   in Loop: Header=BB64_12 Depth=1
	ldr	r9, [r11, #16]
	b	.LBB64_181
.LBB64_20:                              @   in Loop: Header=BB64_12 Depth=1
	and	r0, r5, #7
	bic	r5, r5, #7
	lsr	r8, r8, r0
	cmp	r5, #31
	bhi	.LBB64_23
.LBB64_21:                              @ %.lr.ph1216
                                        @   Parent Loop BB64_12 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	cmp	r10, #0
	beq	.LBB64_309
@ BB#22:                                @   in Loop: Header=BB64_21 Depth=2
	ldrb	r0, [r7], #1
	sub	r10, r10, #1
	add	r8, r8, r0, lsl r5
	add	r5, r5, #8
	cmp	r5, #32
	blo	.LBB64_21
.LBB64_23:                              @ %._crit_edge1217
                                        @   in Loop: Header=BB64_12 Depth=1
	mov	r0, #255
	orr	r0, r0, #65280
	eor	r1, r0, r8, lsr #16
	uxth	r0, r8
	cmp	r0, r1
	bne	.LBB64_141
@ BB#24:                                @   in Loop: Header=BB64_12 Depth=1
	mov	r8, #0
	ldr	r1, [sp, #56]           @ 4-byte Reload
	mov	r5, r8
	str	r0, [r11, #64]
	mov	r0, #14
	str	r0, [r11]
	cmp	r1, #6
	beq	.LBB64_336
.LBB64_25:                              @   in Loop: Header=BB64_12 Depth=1
	mov	r0, #15
	str	r0, [r11]
.LBB64_26:                              @ %.thread._crit_edge2188
                                        @   in Loop: Header=BB64_12 Depth=1
	ldr	r1, [r11, #64]
	cmp	r1, #0
	beq	.LBB64_216
@ BB#27:                                @   in Loop: Header=BB64_12 Depth=1
	cmp	r1, r10
	mov	r0, r1
	movhi	r0, r10
	cmp	r0, r12
	movhi	r0, r12
	cmp	r0, #0
	beq	.LBB64_337
@ BB#28:                                @ %.lr.ph.i30.preheader
                                        @   in Loop: Header=BB64_12 Depth=1
	mvn	r3, r10
	mvn	r2, r12
	cmp	r3, r2
	movhi	r2, r3
	mvn	r1, r1
	cmp	r2, r1
	ldr	r3, [sp, #76]           @ 4-byte Reload
	movls	r2, r1
	mvn	r1, r2
	mov	r2, r7
.LBB64_29:                              @ %.lr.ph.i30
                                        @   Parent Loop BB64_12 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldrb	r6, [r2], #1
	subs	r1, r1, #1
	strb	r6, [r3], #1
	bne	.LBB64_29
@ BB#30:                                @ %ZMEMCPY.exit31
                                        @   in Loop: Header=BB64_12 Depth=1
	ldr	r1, [r11, #64]
	sub	r12, r12, r0
	add	r7, r7, r0
	sub	r1, r1, r0
	str	r1, [r11, #64]
	ldr	r1, [sp, #76]           @ 4-byte Reload
	sub	r10, r10, r0
	add	r1, r1, r0
	str	r1, [sp, #76]           @ 4-byte Spill
	ldr	r0, [r11]
	b	.LBB64_12
.LBB64_31:                              @ %.preheader884
                                        @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, [r11, #104]
	ldr	r1, [r11, #92]
	mov	r4, r8
	cmp	r0, r1
	bhs	.LBB64_98
	b	.LBB64_94
.LBB64_32:                              @ %.thread..preheader986_crit_edge
                                        @   in Loop: Header=BB64_12 Depth=1
	str	r12, [sp, #80]          @ 4-byte Spill
	ldr	r6, [r11, #104]
	b	.LBB64_102
.LBB64_33:                              @ %.thread._crit_edge2186
                                        @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, [r11, #72]
	b	.LBB64_227
.LBB64_34:                              @ %.thread._crit_edge2183
                                        @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, [r11, #72]
	b	.LBB64_247
.LBB64_35:                              @   in Loop: Header=BB64_12 Depth=1
	cmp	r12, #0
	beq	.LBB64_335
@ BB#36:                                @   in Loop: Header=BB64_12 Depth=1
	ldr	r1, [sp, #76]           @ 4-byte Reload
	ldr	r0, [r11, #64]
	sub	r12, r12, #1
	strb	r0, [r1], #1
	mov	r0, #20
	str	r0, [r11]
	str	r1, [sp, #76]           @ 4-byte Spill
	ldr	r0, [r11]
	b	.LBB64_12
.LBB64_37:                              @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, [r11, #8]
	cmp	r0, #0
	beq	.LBB64_288
@ BB#38:                                @ %.preheader
                                        @   in Loop: Header=BB64_12 Depth=1
	cmp	r5, #31
	bhi	.LBB64_41
.LBB64_39:                              @ %.lr.ph
                                        @   Parent Loop BB64_12 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	cmp	r10, #0
	beq	.LBB64_309
@ BB#40:                                @   in Loop: Header=BB64_39 Depth=2
	ldrb	r0, [r7], #1
	sub	r10, r10, #1
	add	r8, r8, r0, lsl r5
	add	r5, r5, #8
	cmp	r5, #32
	blo	.LBB64_39
.LBB64_41:                              @ %._crit_edge
                                        @   in Loop: Header=BB64_12 Depth=1
	ldr	r1, [sp, #60]           @ 4-byte Reload
	ldr	r0, [lr, #20]
	subs	r2, r1, r12
	add	r0, r0, r2
	str	r0, [lr, #20]
	ldr	r0, [r11, #28]
	add	r0, r0, r2
	str	r0, [r11, #28]
	beq	.LBB64_286
@ BB#42:                                @   in Loop: Header=BB64_12 Depth=1
	ldr	r1, [sp, #76]           @ 4-byte Reload
	ldr	r0, [r11, #24]
	ldr	r3, [r11, #16]
	mov	r6, r12
	mov	r4, lr
	sub	r1, r1, r2
	cmp	r3, #0
	bne	.LBB64_284
@ BB#43:                                @   in Loop: Header=BB64_12 Depth=1
	bl	adler32
	b	.LBB64_285
.LBB64_44:                              @   in Loop: Header=BB64_45 Depth=2
	ldrb	r0, [r7], #1
	sub	r10, r10, #1
	add	r8, r8, r0, lsl r5
	add	r5, r5, #8
.LBB64_45:                              @ %.preheader1253
                                        @   Parent Loop BB64_12 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	cmp	r5, #16
	bhs	.LBB64_47
@ BB#46:                                @ %.lr.ph1263
                                        @   in Loop: Header=BB64_45 Depth=2
	cmp	r10, #0
	beq	.LBB64_309
	b	.LBB64_44
.LBB64_47:                              @ %._crit_edge1264
                                        @   in Loop: Header=BB64_12 Depth=1
	uxtb	r0, r8
	str	r8, [r11, #16]
	cmp	r0, #8
	bne	.LBB64_170
@ BB#48:                                @   in Loop: Header=BB64_12 Depth=1
	tst	r8, #57344
	bne	.LBB64_274
@ BB#49:                                @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, [r11, #32]
	mov	r1, r8
	cmp	r0, #0
	beq	.LBB64_51
@ BB#50:                                @   in Loop: Header=BB64_12 Depth=1
	mov	r1, #1
	and	r1, r1, r8, lsr #8
	str	r1, [r0]
	ldr	r1, [r11, #16]
.LBB64_51:                              @   in Loop: Header=BB64_12 Depth=1
	tst	r1, #512
	beq	.LBB64_53
@ BB#52:                                @ %.preheader.i8
                                        @   in Loop: Header=BB64_12 Depth=1
	ldr	r1, [r11, #24]
	ldr	r0, .LCPI64_24
	mvn	r1, r1
	eor	r2, r8, r1
	uxtb	r2, r2
	ldr	r2, [r0, r2, lsl #2]
	eor	r1, r2, r1, lsr #8
	eor	r2, r1, r8, lsr #8
	uxtb	r2, r2
	ldr	r0, [r0, r2, lsl #2]
	eor	r0, r0, r1, lsr #8
	mvn	r0, r0
	str	r0, [r11, #24]
.LBB64_53:                              @ %.preheader1270.thread
                                        @   in Loop: Header=BB64_12 Depth=1
	mov	r0, #2
	str	r0, [r11]
	mov	r5, #0
	mov	r8, #0
.LBB64_54:                              @ %.lr.ph1284
                                        @   Parent Loop BB64_12 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	cmp	r10, #0
	beq	.LBB64_309
@ BB#55:                                @   in Loop: Header=BB64_54 Depth=2
	ldrb	r0, [r7], #1
	sub	r10, r10, #1
	add	r8, r8, r0, lsl r5
	add	r5, r5, #8
	cmp	r5, #32
	blo	.LBB64_54
.LBB64_56:                              @ %.preheader1270._crit_edge
                                        @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, [r11, #32]
	cmp	r0, #0
	strne	r8, [r0, #4]
	ldrb	r0, [r11, #17]
	tst	r0, #2
	beq	.LBB64_58
@ BB#57:                                @ %.preheader.i14
                                        @   in Loop: Header=BB64_12 Depth=1
	ldr	r1, [r11, #24]
	ldr	r0, .LCPI64_24
	mvn	r1, r1
	eor	r2, r8, r1
	uxtb	r2, r2
	ldr	r2, [r0, r2, lsl #2]
	eor	r1, r2, r1, lsr #8
	eor	r2, r1, r8, lsr #8
	uxtb	r2, r2
	ldr	r2, [r0, r2, lsl #2]
	eor	r1, r2, r1, lsr #8
	eor	r2, r1, r8, lsr #16
	uxtb	r2, r2
	ldr	r2, [r0, r2, lsl #2]
	eor	r1, r2, r1, lsr #8
	uxtb	r2, r1
	eor	r2, r2, r8, lsr #24
	ldr	r0, [r0, r2, lsl #2]
	eor	r0, r0, r1, lsr #8
	mvn	r0, r0
	str	r0, [r11, #24]
.LBB64_58:                              @ %.preheader1290.thread
                                        @   in Loop: Header=BB64_12 Depth=1
	mov	r0, #3
	mov	r5, #0
	str	r0, [r11]
	mov	r8, r5
.LBB64_59:                              @ %.lr.ph1304
                                        @   Parent Loop BB64_12 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	cmp	r10, #0
	beq	.LBB64_309
@ BB#60:                                @   in Loop: Header=BB64_59 Depth=2
	ldrb	r0, [r7], #1
	sub	r10, r10, #1
	add	r8, r8, r0, lsl r5
	add	r5, r5, #8
	cmp	r5, #16
	blo	.LBB64_59
.LBB64_61:                              @ %.preheader1290._crit_edge
                                        @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, [r11, #32]
	cmp	r0, #0
	beq	.LBB64_63
@ BB#62:                                @   in Loop: Header=BB64_12 Depth=1
	uxtb	r1, r8
	str	r1, [r0, #8]
	ldr	r0, [r11, #32]
	lsr	r1, r8, #8
	str	r1, [r0, #12]
.LBB64_63:                              @ %._crit_edge2200
                                        @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, [r11, #16]
	tst	r0, #512
	beq	.LBB64_65
@ BB#64:                                @ %.preheader.i20
                                        @   in Loop: Header=BB64_12 Depth=1
	ldr	r2, [r11, #24]
	ldr	r1, .LCPI64_24
	mvn	r2, r2
	eor	r3, r8, r2
	uxtb	r3, r3
	ldr	r3, [r1, r3, lsl #2]
	eor	r2, r3, r2, lsr #8
	eor	r3, r2, r8, lsr #8
	uxtb	r3, r3
	ldr	r1, [r1, r3, lsl #2]
	eor	r1, r1, r2, lsr #8
	mvn	r1, r1
	str	r1, [r11, #24]
.LBB64_65:                              @   in Loop: Header=BB64_12 Depth=1
	mov	r8, #0
	mov	r5, #0
	mov	r1, #4
	str	r1, [r11]
.LBB64_66:                              @   in Loop: Header=BB64_12 Depth=1
	tst	r0, #1024
	bne	.LBB64_68
@ BB#67:                                @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, [r11, #32]
	cmp	r0, #0
	movne	r1, #0
	strne	r1, [r0, #16]
	b	.LBB64_143
.LBB64_68:                              @ %.preheader1310
                                        @   in Loop: Header=BB64_12 Depth=1
	cmp	r5, #15
	bhi	.LBB64_71
.LBB64_69:                              @ %.lr.ph1320
                                        @   Parent Loop BB64_12 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	cmp	r10, #0
	beq	.LBB64_309
@ BB#70:                                @   in Loop: Header=BB64_69 Depth=2
	ldrb	r1, [r7], #1
	sub	r10, r10, #1
	add	r8, r8, r1, lsl r5
	add	r5, r5, #8
	cmp	r5, #16
	blo	.LBB64_69
.LBB64_71:                              @ %.preheader1310._crit_edge
                                        @   in Loop: Header=BB64_12 Depth=1
	str	r8, [r11, #64]
	ldr	r1, [r11, #32]
	mov	r5, #0
	cmp	r1, #0
	strne	r8, [r1, #20]
	ldrne	r0, [r11, #16]
	tst	r0, #512
	bne	.LBB64_142
@ BB#72:                                @   in Loop: Header=BB64_12 Depth=1
	mov	r8, r5
	b	.LBB64_143
.LBB64_73:                              @   in Loop: Header=BB64_74 Depth=2
	ldrb	r0, [r7], #1
	sub	r10, r10, #1
	add	r8, r8, r0, lsl r5
	add	r5, r5, #8
.LBB64_74:                              @ %.preheader1222
                                        @   Parent Loop BB64_12 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	cmp	r5, #32
	bhs	.LBB64_76
@ BB#75:                                @ %.lr.ph1232
                                        @   in Loop: Header=BB64_74 Depth=2
	cmp	r10, #0
	beq	.LBB64_309
	b	.LBB64_73
.LBB64_76:                              @ %._crit_edge1233
                                        @   in Loop: Header=BB64_12 Depth=1
	rev	r0, r8
	mov	r8, #0
	mov	r5, r8
	mov	r1, #10
	str	r0, [r11, #24]
	str	r0, [lr, #48]
	str	r1, [r11]
.LBB64_77:                              @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, [r11, #12]
	cmp	r0, #0
	beq	.LBB64_333
@ BB#78:                                @   in Loop: Header=BB64_12 Depth=1
	mov	r0, #1
	mov	r1, #11
	str	r0, [r11, #24]
	str	r0, [lr, #48]
	str	r1, [r11]
.LBB64_79:                              @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, [sp, #12]           @ 4-byte Reload
	cmp	r0, #2
	blo	.LBB64_334
.LBB64_80:                              @ %.thread._crit_edge2189
                                        @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, [r11, #4]
	cmp	r0, #0
	beq	.LBB64_83
@ BB#81:                                @   in Loop: Header=BB64_12 Depth=1
	and	r0, r5, #7
	bic	r5, r5, #7
	lsr	r8, r8, r0
	mov	r0, #26
	str	r0, [r11]
	ldr	r0, [r11]
	b	.LBB64_12
.LBB64_82:                              @   in Loop: Header=BB64_83 Depth=2
	ldrb	r0, [r7], #1
	sub	r10, r10, #1
	add	r8, r8, r0, lsl r5
	add	r5, r5, #8
.LBB64_83:                              @ %.preheader1237
                                        @   Parent Loop BB64_12 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	cmp	r5, #3
	bhs	.LBB64_85
@ BB#84:                                @ %.lr.ph1247
                                        @   in Loop: Header=BB64_83 Depth=2
	cmp	r10, #0
	beq	.LBB64_309
	b	.LBB64_82
.LBB64_85:                              @ %._crit_edge1248
                                        @   in Loop: Header=BB64_12 Depth=1
	mov	r0, #3
	and	r0, r0, r8, lsr #1
	and	r1, r8, #1
	str	r1, [r11, #4]
	cmp	r0, #3
	bhi	.LBB64_282
@ BB#86:                                @ %._crit_edge1248
                                        @   in Loop: Header=BB64_12 Depth=1
	lsl	r0, r0, #2
	adr	r1, .LJTI64_1_1
	ldr	pc, [r0, r1]
.LJTI64_1_1:
	.long	.LBB64_87
	.long	.LBB64_278
	.long	.LBB64_279
	.long	.LBB64_280
.LBB64_87:                              @   in Loop: Header=BB64_12 Depth=1
	mov	r0, #13
	b	.LBB64_281
.LBB64_88:                              @   in Loop: Header=BB64_89 Depth=2
	ldrb	r0, [r7], #1
	sub	r10, r10, #1
	add	r8, r8, r0, lsl r5
	add	r5, r5, #8
.LBB64_89:                              @ %.preheader852
                                        @   Parent Loop BB64_12 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	cmp	r5, #14
	bhs	.LBB64_91
@ BB#90:                                @ %.lr.ph862
                                        @   in Loop: Header=BB64_89 Depth=2
	cmp	r10, #0
	beq	.LBB64_309
	b	.LBB64_88
.LBB64_91:                              @ %._crit_edge863
                                        @   in Loop: Header=BB64_12 Depth=1
	mov	r1, #15
	and	r3, r1, r8, lsr #10
	mov	r0, #31
	and	r2, r8, #31
	add	r3, r3, #4
	and	r0, r0, r8, lsr #5
	add	r2, r2, #1
	str	r3, [r11, #92]
	mov	r3, #30
	lsr	r1, r8, #14
	add	r2, r2, #256
	sub	r5, r5, #14
	orr	r3, r3, #256
	add	r0, r0, #1
	cmp	r2, r3
	str	r2, [r11, #96]
	str	r0, [r11, #100]
	cmpls	r0, #31
	blo	.LBB64_93
@ BB#92:                                @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, .LCPI64_25
	mov	r8, r1
	str	r0, [lr, #24]
	mov	r0, #29
	str	r0, [r11]
	ldr	r0, [r11]
	b	.LBB64_12
.LBB64_93:                              @ %.preheader884.thread
                                        @   in Loop: Header=BB64_12 Depth=1
	mov	r0, #0
	mov	r2, #17
	str	r0, [r11, #104]
	str	r2, [r11]
	mov	r8, r1
.LBB64_94:                              @ %.preheader868
                                        @   Parent Loop BB64_12 Depth=1
                                        @ =>  This Loop Header: Depth=2
                                        @       Child Loop BB64_95 Depth 3
	cmp	r5, #2
	bhi	.LBB64_97
.LBB64_95:                              @ %.lr.ph878
                                        @   Parent Loop BB64_12 Depth=1
                                        @     Parent Loop BB64_94 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	cmp	r10, #0
	beq	.LBB64_309
@ BB#96:                                @   in Loop: Header=BB64_95 Depth=3
	ldrb	r1, [r7], #1
	sub	r10, r10, #1
	add	r8, r8, r1, lsl r5
	add	r5, r5, #8
	cmp	r5, #3
	blo	.LBB64_95
.LBB64_97:                              @ %._crit_edge879
                                        @   in Loop: Header=BB64_94 Depth=2
	ldr	r1, .LCPI64_26
	lsr	r4, r8, #3
	add	r1, r1, r0, lsl #1
	add	r0, r0, #1
	ldrh	r1, [r1]
	str	r0, [r11, #104]
	and	r0, r8, #7
	add	r1, r11, r1, lsl #1
	sub	r5, r5, #3
	strh	r0, [r1, #112]
	ldr	r0, [r11, #104]
	ldr	r1, [r11, #92]
	mov	r8, r4
	cmp	r0, r1
	blo	.LBB64_94
.LBB64_98:                              @ %.loopexit888
                                        @   in Loop: Header=BB64_12 Depth=1
	ldr	r2, [sp, #52]           @ 4-byte Reload
	ldr	r3, [sp, #44]           @ 4-byte Reload
	mov	r9, lr
	str	r12, [sp, #80]          @ 4-byte Spill
	cmp	r0, #18
	bhi	.LBB64_100
.LBB64_99:                              @ %.lr.ph907
                                        @   Parent Loop BB64_12 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r1, .LCPI64_26
	add	r1, r1, r0, lsl #1
	add	r0, r0, #1
	ldrh	r1, [r1]
	str	r0, [r11, #104]
	mov	r0, #0
	add	r1, r11, r1, lsl #1
	strh	r0, [r1, #112]
	ldr	r0, [r11, #104]
	cmp	r0, #19
	blo	.LBB64_99
.LBB64_100:                             @ %._crit_edge908
                                        @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, [sp, #40]           @ 4-byte Reload
	ldr	r1, [sp, #72]           @ 4-byte Reload
	mov	r6, #0
	str	r0, [r3]
	str	r0, [r11, #76]
	mov	r0, #7
	str	r0, [r1]
	stm	sp, {r1, r2}
	ldr	r1, [sp, #48]           @ 4-byte Reload
	mov	r0, #0
	mov	r2, #19
	bl	inflate_table
	str	r0, [sp, #64]           @ 4-byte Spill
	cmp	r0, #0
	bne	.LBB64_275
@ BB#101:                               @   in Loop: Header=BB64_12 Depth=1
	mov	lr, r9
	ldr	r9, [sp, #68]           @ 4-byte Reload
	mov	r8, r4
	mov	r1, #0
	mov	r0, #18
	str	r6, [r11, #104]
	str	r1, [sp, #64]           @ 4-byte Spill
	str	r0, [r11]
.LBB64_102:                             @ %.preheader986
                                        @   in Loop: Header=BB64_12 Depth=1
	ldr	r2, [r11, #96]
	ldr	r12, [r11, #100]
	add	r0, r12, r2
	cmp	r6, r0
	bhs	.LBB64_133
.LBB64_103:                             @ %.preheader909
                                        @   Parent Loop BB64_12 Depth=1
                                        @ =>  This Loop Header: Depth=2
                                        @       Child Loop BB64_105 Depth 3
                                        @       Child Loop BB64_124 Depth 3
                                        @       Child Loop BB64_120 Depth 3
                                        @       Child Loop BB64_114 Depth 3
                                        @       Child Loop BB64_130 Depth 3
	ldr	r0, [sp, #72]           @ 4-byte Reload
	mov	r1, #1
	mvn	r3, #0
	ldr	r4, [r11, #76]
	ldr	r0, [r0]
	add	r3, r3, r1, lsl r0
	and	r0, r3, r8
	lsl	r0, r0, #2
	mov	r1, r4
	ldrh	r0, [r1, r0]!
	ldrh	r1, [r1, #2]
	orr	r0, r0, r1, lsl #16
	lsr	r1, r0, #8
	uxtb	r1, r1
	b	.LBB64_105
.LBB64_104:                             @   in Loop: Header=BB64_105 Depth=3
	ldrb	r0, [r7], #1
	mov	r1, r4
	sub	r10, r10, #1
	add	r8, r8, r0, lsl r5
	and	r0, r3, r8
	lsl	r0, r0, #2
	add	r5, r5, #8
	ldrh	r0, [r1, r0]!
	ldrh	r1, [r1, #2]
	orr	r0, r0, r1, lsl #16
	lsr	r1, r0, #8
	uxtb	r1, r1
.LBB64_105:                             @ %.preheader909
                                        @   Parent Loop BB64_12 Depth=1
                                        @     Parent Loop BB64_103 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	cmp	r1, r5
	bls	.LBB64_107
@ BB#106:                               @ %.lr.ph927
                                        @   in Loop: Header=BB64_105 Depth=3
	cmp	r10, #0
	bne	.LBB64_104
	b	.LBB64_330
.LBB64_107:                             @ %._crit_edge928
                                        @   in Loop: Header=BB64_103 Depth=2
	lsr	r0, r0, #16
	cmp	r0, #15
	bhi	.LBB64_109
@ BB#108:                               @   in Loop: Header=BB64_103 Depth=2
	add	r2, r11, r6, lsl #1
	lsr	r8, r8, r1
	sub	r5, r5, r1
	add	r3, r6, #1
	str	r3, [r11, #104]
	strh	r0, [r2, #112]
	b	.LBB64_131
.LBB64_109:                             @   in Loop: Header=BB64_103 Depth=2
	cmp	r0, #16
	bne	.LBB64_111
@ BB#110:                               @ %.preheader952
                                        @   in Loop: Header=BB64_103 Depth=2
	add	r0, r1, #2
	b	.LBB64_114
.LBB64_111:                             @   in Loop: Header=BB64_103 Depth=2
	cmp	r0, #17
	bne	.LBB64_118
@ BB#112:                               @ %.preheader936
                                        @   in Loop: Header=BB64_103 Depth=2
	add	r0, r1, #3
	b	.LBB64_120
.LBB64_113:                             @   in Loop: Header=BB64_114 Depth=3
	ldrb	r3, [r7], #1
	sub	r10, r10, #1
	add	r8, r8, r3, lsl r5
	add	r5, r5, #8
.LBB64_114:                             @ %.preheader952
                                        @   Parent Loop BB64_12 Depth=1
                                        @     Parent Loop BB64_103 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	cmp	r5, r0
	bhs	.LBB64_116
@ BB#115:                               @ %.lr.ph962
                                        @   in Loop: Header=BB64_114 Depth=3
	cmp	r10, #0
	beq	.LBB64_330
	b	.LBB64_113
.LBB64_116:                             @ %._crit_edge963
                                        @   in Loop: Header=BB64_103 Depth=2
	lsr	r0, r8, r1
	sub	r5, r5, r1
	cmp	r6, #0
	beq	.LBB64_301
@ BB#117:                               @   in Loop: Header=BB64_103 Depth=2
	add	r1, r11, r6, lsl #1
	lsr	r8, r0, #2
	and	r0, r0, #3
	sub	r5, r5, #2
	ldrh	r1, [r1, #110]
	add	r3, r0, #3
	b	.LBB64_128
.LBB64_118:                             @ %.preheader968
                                        @   in Loop: Header=BB64_103 Depth=2
	add	r0, r1, #7
	b	.LBB64_124
.LBB64_119:                             @   in Loop: Header=BB64_120 Depth=3
	ldrb	r3, [r7], #1
	sub	r10, r10, #1
	add	r8, r8, r3, lsl r5
	add	r5, r5, #8
.LBB64_120:                             @ %.preheader936
                                        @   Parent Loop BB64_12 Depth=1
                                        @     Parent Loop BB64_103 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	cmp	r5, r0
	bhs	.LBB64_122
@ BB#121:                               @ %.lr.ph946
                                        @   in Loop: Header=BB64_120 Depth=3
	cmp	r10, #0
	beq	.LBB64_330
	b	.LBB64_119
.LBB64_122:                             @ %._crit_edge947
                                        @   in Loop: Header=BB64_103 Depth=2
	mov	r3, #7
	and	r3, r3, r8, lsr r1
	lsr	r0, r8, r1
	lsr	r8, r0, #3
	add	r3, r3, #3
	mvn	r0, #2
	b	.LBB64_127
.LBB64_123:                             @   in Loop: Header=BB64_124 Depth=3
	ldrb	r3, [r7], #1
	sub	r10, r10, #1
	add	r8, r8, r3, lsl r5
	add	r5, r5, #8
.LBB64_124:                             @ %.preheader968
                                        @   Parent Loop BB64_12 Depth=1
                                        @     Parent Loop BB64_103 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	cmp	r5, r0
	bhs	.LBB64_126
@ BB#125:                               @ %.lr.ph978
                                        @   in Loop: Header=BB64_124 Depth=3
	cmp	r10, #0
	beq	.LBB64_330
	b	.LBB64_123
.LBB64_126:                             @ %._crit_edge979
                                        @   in Loop: Header=BB64_103 Depth=2
	mov	r3, #127
	lsr	r0, r8, r1
	and	r3, r3, r8, lsr r1
	lsr	r8, r0, #7
	add	r3, r3, #11
	mvn	r0, #6
.LBB64_127:                             @ %._crit_edge979
                                        @   in Loop: Header=BB64_103 Depth=2
	sub	r0, r0, r1
	add	r5, r0, r5
	mov	r1, #0
.LBB64_128:                             @   in Loop: Header=BB64_103 Depth=2
	add	r0, r12, r2
	add	r2, r6, r3
	cmp	r2, r0
	bls	.LBB64_130
	b	.LBB64_297
.LBB64_129:                             @ %._crit_edge2187
                                        @   in Loop: Header=BB64_130 Depth=3
	ldr	r6, [r11, #104]
.LBB64_130:                             @ %.preheader984
                                        @   Parent Loop BB64_12 Depth=1
                                        @     Parent Loop BB64_103 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	add	r0, r11, r6, lsl #1
	subs	r3, r3, #1
	add	r2, r6, #1
	str	r2, [r11, #104]
	strh	r1, [r0, #112]
	bne	.LBB64_129
.LBB64_131:                             @ %.backedge
                                        @   in Loop: Header=BB64_103 Depth=2
	ldr	r2, [r11, #96]
	ldr	r12, [r11, #100]
	ldr	r6, [r11, #104]
	add	r0, r12, r2
	cmp	r6, r0
	blo	.LBB64_103
@ BB#132:                               @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, [r11]
	cmp	r0, #29
	beq	.LBB64_251
.LBB64_133:                             @ %.thread2228
                                        @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, [sp, #20]           @ 4-byte Reload
	ldrh	r0, [r0]
	cmp	r0, #0
	bne	.LBB64_148
@ BB#134:                               @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, .LCPI64_10
	b	.LBB64_249
.LBB64_135:                             @   in Loop: Header=BB64_136 Depth=2
	ldrb	r1, [r7], #1
	sub	r10, r10, #1
	add	r8, r8, r1, lsl r5
	add	r5, r5, #8
.LBB64_136:                             @ %.preheader1348
                                        @   Parent Loop BB64_12 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	cmp	r5, #16
	bhs	.LBB64_138
@ BB#137:                               @ %.lr.ph1358
                                        @   in Loop: Header=BB64_136 Depth=2
	cmp	r10, #0
	beq	.LBB64_309
	b	.LBB64_135
.LBB64_138:                             @ %._crit_edge1359
                                        @   in Loop: Header=BB64_12 Depth=1
	tst	r0, #2
	beq	.LBB64_165
@ BB#139:                               @ %._crit_edge1359
                                        @   in Loop: Header=BB64_12 Depth=1
	mov	r1, #31
	orr	r1, r1, #35584
	cmp	r8, r1
	bne	.LBB64_165
@ BB#140:                               @ %.preheader.i
                                        @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, .LCPI64_23
	str	r0, [r11, #24]
	mov	r0, #1
	b	.LBB64_305
.LBB64_141:                             @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, .LCPI64_12
	b	.LBB64_295
.LBB64_142:                             @ %.preheader.i26
                                        @   in Loop: Header=BB64_12 Depth=1
	ldr	r1, [r11, #24]
	ldr	r0, .LCPI64_18
	mvn	r1, r1
	eor	r2, r8, r1
	uxtb	r2, r2
	ldr	r2, [r0, r2, lsl #2]
	eor	r1, r2, r1, lsr #8
	eor	r2, r1, r8, lsr #8
	mov	r8, r5
	uxtb	r2, r2
	ldr	r0, [r0, r2, lsl #2]
	eor	r0, r0, r1, lsr #8
	mvn	r0, r0
	str	r0, [r11, #24]
.LBB64_143:                             @   in Loop: Header=BB64_12 Depth=1
	mov	r0, #5
	str	r0, [r11]
.LBB64_144:                             @ %.thread._crit_edge2198
                                        @   in Loop: Header=BB64_12 Depth=1
	ldr	r9, [r11, #16]
	tst	r9, #1024
	beq	.LBB64_180
@ BB#145:                               @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, [r11, #64]
	cmp	r0, r10
	mov	r6, r0
	movhi	r6, r10
	cmp	r6, #0
	beq	.LBB64_179
@ BB#146:                               @   in Loop: Header=BB64_12 Depth=1
	ldr	r3, [r11, #32]
	cmp	r3, #0
	bne	.LBB64_171
@ BB#147:                               @   in Loop: Header=BB64_12 Depth=1
	str	r12, [sp, #80]          @ 4-byte Spill
	b	.LBB64_176
.LBB64_148:                             @   in Loop: Header=BB64_12 Depth=1
	ldr	r4, [sp, #44]           @ 4-byte Reload
	ldr	r0, [sp, #40]           @ 4-byte Reload
	ldr	r1, [sp, #72]           @ 4-byte Reload
	ldr	r6, [sp, #52]           @ 4-byte Reload
	str	r0, [r4]
	str	r0, [r11, #76]
	mov	r0, #9
	str	r0, [r1]
	str	r1, [sp]
	ldr	r1, [sp, #48]           @ 4-byte Reload
	mov	r0, #1
	mov	r3, r4
	str	r6, [sp, #4]
	mov	r9, lr
	bl	inflate_table
	str	r0, [sp, #64]           @ 4-byte Spill
	cmp	r0, #0
	bne	.LBB64_283
@ BB#149:                               @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, [r11, #108]
	ldr	r1, [sp, #36]           @ 4-byte Reload
	mov	r3, r4
	str	r0, [r11, #80]
	mov	r0, #6
	str	r0, [r11, #88]
	ldr	r0, [r11, #96]
	ldr	r2, [r11, #100]
	stm	sp, {r1, r6}
	add	r0, r11, r0, lsl #1
	add	r1, r0, #112
	mov	r0, #2
	bl	inflate_table
	str	r0, [sp, #64]           @ 4-byte Spill
	cmp	r0, #0
	bne	.LBB64_298
@ BB#150:                               @   in Loop: Header=BB64_12 Depth=1
	mov	lr, r9
	ldr	r12, [sp, #80]          @ 4-byte Reload
	ldr	r9, [sp, #68]           @ 4-byte Reload
	ldr	r1, [sp, #56]           @ 4-byte Reload
	mov	r0, #19
	str	r0, [r11]
	mov	r0, #0
	str	r0, [sp, #64]           @ 4-byte Spill
	cmp	r1, #6
	beq	.LBB64_338
.LBB64_151:                             @   in Loop: Header=BB64_12 Depth=1
	mov	r0, #20
	str	r0, [r11]
.LBB64_152:                             @   in Loop: Header=BB64_12 Depth=1
	cmp	r10, #6
	blo	.LBB64_156
@ BB#153:                               @   in Loop: Header=BB64_12 Depth=1
	lsr	r0, r12, #1
	cmp	r0, #129
	blo	.LBB64_156
@ BB#154:                               @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, [sp, #76]           @ 4-byte Reload
	mov	r4, lr
	str	r0, [lr, #12]
	str	r12, [lr, #16]
	stm	lr, {r7, r10}
	ldr	r1, [sp, #60]           @ 4-byte Reload
	mov	r0, lr
	str	r8, [r11, #56]
	str	r5, [r11, #60]
	bl	inflate_fast
	mov	lr, r4
	ldm	lr, {r7, r10}
	ldr	r12, [lr, #16]
	ldr	r8, [r11, #56]
	ldr	r5, [r11, #60]
	ldr	r0, [lr, #12]
	ldr	r1, [r11]
	str	r0, [sp, #76]           @ 4-byte Spill
	cmp	r1, #11
	bne	.LBB64_271
@ BB#155:                               @   in Loop: Header=BB64_12 Depth=1
	mvn	r0, #0
	str	r0, [r9]
	ldr	r0, [r11]
	b	.LBB64_12
.LBB64_156:                             @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, [sp, #72]           @ 4-byte Reload
	mov	r4, #0
	str	r4, [r9]
	mov	r1, #1
	ldr	r0, [r0]
	mvn	r2, #0
	add	r6, r2, r1, lsl r0
	ldr	r2, [r11, #76]
	and	r0, r6, r8
	lsl	r0, r0, #2
	mov	r1, r2
	ldrh	r0, [r1, r0]!
	ldrh	r1, [r1, #2]
	orr	r1, r0, r1, lsl #16
	lsr	r3, r1, #8
	uxtb	r0, r3
	b	.LBB64_158
.LBB64_157:                             @   in Loop: Header=BB64_158 Depth=2
	ldrb	r0, [r7], #1
	mov	r1, r2
	sub	r10, r10, #1
	add	r8, r8, r0, lsl r5
	and	r0, r6, r8
	lsl	r0, r0, #2
	add	r5, r5, #8
	ldrh	r0, [r1, r0]!
	ldrh	r1, [r1, #2]
	orr	r1, r0, r1, lsl #16
	lsr	r3, r1, #8
	uxtb	r0, r3
.LBB64_158:                             @   Parent Loop BB64_12 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	cmp	r0, r5
	bls	.LBB64_160
@ BB#159:                               @ %.lr.ph1072
                                        @   in Loop: Header=BB64_158 Depth=2
	cmp	r10, #0
	beq	.LBB64_309
	b	.LBB64_157
.LBB64_160:                             @ %._crit_edge1073
                                        @   in Loop: Header=BB64_12 Depth=1
	str	r12, [sp, #80]          @ 4-byte Spill
	lsr	r12, r1, #16
	tst	r1, #255
	bne	.LBB64_162
@ BB#161:                               @   in Loop: Header=BB64_12 Depth=1
	mov	r0, r4
	mov	r1, r4
	b	.LBB64_222
.LBB64_162:                             @   in Loop: Header=BB64_12 Depth=1
	uxtb	r6, r1
	cmp	r6, #15
	bhi	.LBB64_164
@ BB#163:                               @ %.preheader1084
                                        @   in Loop: Header=BB64_12 Depth=1
	uxtab	r1, r0, r1
	mov	r3, #1
	mvn	r6, #0
	add	r4, r6, r3, lsl r1
	and	r1, r8, r4
	add	r1, r12, r1, lsr r0
	lsl	r1, r1, #2
	mov	r3, r2
	ldrh	r1, [r3, r1]!
	ldrh	r3, [r3, #2]
	orr	r1, r1, r3, lsl #16
	lsr	r3, r1, #8
	uxtab	r6, r0, r3
	b	.LBB64_219
.LBB64_164:                             @   in Loop: Header=BB64_12 Depth=1
	mov	r0, #0
	b	.LBB64_222
.LBB64_165:                             @   in Loop: Header=BB64_12 Depth=1
	mov	r1, #0
	str	r1, [r11, #16]
	ldr	r1, [r11, #32]
	cmp	r1, #0
	mvnne	r0, #0
	strne	r0, [r1, #48]
	ldrne	r0, [r11, #8]
	tst	r0, #1
	beq	.LBB64_276
@ BB#166:                               @   in Loop: Header=BB64_12 Depth=1
	lsl	r0, r8, #8
	lsr	r1, r8, #8
	ldr	r2, .LCPI64_20
	uxtah	r0, r1, r0
	umull	r2, r1, r0, r2
	sub	r2, r0, r1
	add	r1, r1, r2, lsr #1
	lsr	r2, r1, #4
	lsl	r2, r2, #5
	sub	r1, r2, r1, lsr #4
	subs	r0, r0, r1
	bne	.LBB64_276
@ BB#167:                               @   in Loop: Header=BB64_12 Depth=1
	and	r0, r8, #15
	cmp	r0, #8
	bne	.LBB64_170
@ BB#168:                               @   in Loop: Header=BB64_12 Depth=1
	mov	r0, #15
	and	r0, r0, r8, lsr #4
	ldr	r1, [r11, #36]
	add	r0, r0, #8
	cmp	r1, #0
	bne	.LBB64_302
@ BB#169:                               @   in Loop: Header=BB64_12 Depth=1
	str	r0, [r11, #36]
	b	.LBB64_304
.LBB64_170:                             @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, .LCPI64_16
	b	.LBB64_295
.LBB64_171:                             @   in Loop: Header=BB64_12 Depth=1
	str	r12, [sp, #80]          @ 4-byte Spill
	ldr	r12, [r3, #16]
	cmp	r12, #0
	beq	.LBB64_176
@ BB#172:                               @   in Loop: Header=BB64_12 Depth=1
	ldr	lr, [r3, #20]
	ldr	r4, [r3, #24]
	sub	r3, lr, r0
	add	r1, r3, r6
	cmp	r1, r4
	mov	r1, r6
	subhi	r1, r4, r3
	cmp	r1, #0
	beq	.LBB64_176
@ BB#173:                               @ %.lr.ph.i.preheader
                                        @   in Loop: Header=BB64_12 Depth=1
	mvn	r1, r10
	mvn	r2, r0
	cmp	r1, r2
	movhi	r2, r1
	add	r1, r0, r2
	sub	r1, r1, lr
	mvn	r4, r4
	sub	r0, r0, #1
	cmp	r1, r4
	movhi	r4, r1
	sub	r0, r0, lr
	sub	r0, r0, r4
	add	r1, r12, r3
	mov	r2, r7
.LBB64_174:                             @ %.lr.ph.i
                                        @   Parent Loop BB64_12 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldrb	r3, [r2], #1
	subs	r0, r0, #1
	strb	r3, [r1], #1
	bne	.LBB64_174
@ BB#175:                               @ %ZMEMCPY.exit.loopexit
                                        @   in Loop: Header=BB64_12 Depth=1
	ldr	r9, [r11, #16]
.LBB64_176:                             @ %ZMEMCPY.exit
                                        @   in Loop: Header=BB64_12 Depth=1
	tst	r9, #512
	beq	.LBB64_178
@ BB#177:                               @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, [r11, #24]
	mov	r1, r7
	mov	r2, r6
	bl	crc32
	str	r0, [r11, #24]
.LBB64_178:                             @ %ZMEMCPY.exit._crit_edge
                                        @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, [r11, #64]
	ldr	lr, [sp, #28]           @ 4-byte Reload
	ldr	r12, [sp, #80]          @ 4-byte Reload
	sub	r0, r0, r6
	add	r7, r7, r6
	sub	r10, r10, r6
	str	r0, [r11, #64]
.LBB64_179:                             @ %thread-pre-split
                                        @   in Loop: Header=BB64_12 Depth=1
	cmp	r0, #0
	bne	.LBB64_339
.LBB64_180:                             @   in Loop: Header=BB64_12 Depth=1
	mov	r0, #0
	mov	r1, #6
	str	r0, [r11, #64]
	str	r1, [r11]
.LBB64_181:                             @   in Loop: Header=BB64_12 Depth=1
	tst	r9, #2048
	bne	.LBB64_183
@ BB#182:                               @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, [r11, #32]
	cmp	r0, #0
	movne	r1, #0
	strne	r1, [r0, #28]
	b	.LBB64_193
.LBB64_183:                             @   in Loop: Header=BB64_12 Depth=1
	mov	r6, #0
	cmp	r10, #0
	beq	.LBB64_309
.LBB64_184:                             @ %.preheader1326
                                        @   Parent Loop BB64_12 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, [r11, #32]
	ldrb	r4, [r7, r6]
	cmp	r0, #0
	ldrne	r1, [r0, #28]
	cmpne	r1, #0
	beq	.LBB64_187
@ BB#185:                               @   in Loop: Header=BB64_184 Depth=2
	ldr	r1, [r11, #64]
	ldr	r2, [r0, #32]
	cmp	r1, r2
	bhs	.LBB64_187
@ BB#186:                               @   in Loop: Header=BB64_184 Depth=2
	add	r2, r1, #1
	str	r2, [r11, #64]
	ldr	r0, [r0, #28]
	strb	r4, [r0, r1]
.LBB64_187:                             @   in Loop: Header=BB64_184 Depth=2
	uxtb	r0, r4
	cmp	r0, #0
	add	r6, r6, #1
	movne	r0, #1
	cmp	r6, r10
	bhs	.LBB64_189
@ BB#188:                               @   in Loop: Header=BB64_184 Depth=2
	cmp	r0, #0
	bne	.LBB64_184
.LBB64_189:                             @ %.critedge
                                        @   in Loop: Header=BB64_12 Depth=1
	ldrb	r0, [r11, #17]
	mov	r9, lr
	str	r12, [sp, #80]          @ 4-byte Spill
	tst	r0, #2
	beq	.LBB64_191
@ BB#190:                               @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, [r11, #24]
	mov	r1, r7
	mov	r2, r6
	bl	crc32
	str	r0, [r11, #24]
.LBB64_191:                             @   in Loop: Header=BB64_12 Depth=1
	ldr	r12, [sp, #80]          @ 4-byte Reload
	mov	lr, r9
	tst	r4, #255
	bne	.LBB64_331
@ BB#192:                               @   in Loop: Header=BB64_12 Depth=1
	add	r7, r7, r6
	sub	r10, r10, r6
.LBB64_193:                             @   in Loop: Header=BB64_12 Depth=1
	ldr	r9, [sp, #68]           @ 4-byte Reload
	mov	r0, #0
	mov	r1, #7
	str	r0, [r11, #64]
	str	r1, [r11]
.LBB64_194:                             @ %.thread._crit_edge2195
                                        @   in Loop: Header=BB64_12 Depth=1
	ldrb	r0, [r11, #17]
	tst	r0, #16
	bne	.LBB64_196
@ BB#195:                               @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, [r11, #32]
	cmp	r0, #0
	movne	r1, #0
	strne	r1, [r0, #36]
	b	.LBB64_206
.LBB64_196:                             @   in Loop: Header=BB64_12 Depth=1
	mov	r6, #0
	cmp	r10, #0
	beq	.LBB64_309
.LBB64_197:                             @ %.preheader1329
                                        @   Parent Loop BB64_12 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, [r11, #32]
	ldrb	r4, [r7, r6]
	cmp	r0, #0
	ldrne	r1, [r0, #36]
	cmpne	r1, #0
	beq	.LBB64_200
@ BB#198:                               @   in Loop: Header=BB64_197 Depth=2
	ldr	r1, [r11, #64]
	ldr	r2, [r0, #40]
	cmp	r1, r2
	bhs	.LBB64_200
@ BB#199:                               @   in Loop: Header=BB64_197 Depth=2
	add	r2, r1, #1
	str	r2, [r11, #64]
	ldr	r0, [r0, #36]
	strb	r4, [r0, r1]
.LBB64_200:                             @   in Loop: Header=BB64_197 Depth=2
	uxtb	r0, r4
	cmp	r0, #0
	add	r6, r6, #1
	movne	r0, #1
	cmp	r6, r10
	bhs	.LBB64_202
@ BB#201:                               @   in Loop: Header=BB64_197 Depth=2
	cmp	r0, #0
	bne	.LBB64_197
.LBB64_202:                             @ %.critedge2
                                        @   in Loop: Header=BB64_12 Depth=1
	ldrb	r0, [r11, #17]
	mov	r9, lr
	str	r12, [sp, #80]          @ 4-byte Spill
	tst	r0, #2
	beq	.LBB64_204
@ BB#203:                               @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, [r11, #24]
	mov	r1, r7
	mov	r2, r6
	bl	crc32
	str	r0, [r11, #24]
.LBB64_204:                             @   in Loop: Header=BB64_12 Depth=1
	ldr	r12, [sp, #80]          @ 4-byte Reload
	mov	lr, r9
	tst	r4, #255
	bne	.LBB64_331
@ BB#205:                               @   in Loop: Header=BB64_12 Depth=1
	add	r7, r7, r6
	sub	r10, r10, r6
	ldr	r9, [sp, #68]           @ 4-byte Reload
.LBB64_206:                             @   in Loop: Header=BB64_12 Depth=1
	mov	r0, #8
	str	r0, [r11]
.LBB64_207:                             @ %.thread._crit_edge2193
                                        @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, [r11, #16]
	tst	r0, #512
	beq	.LBB64_213
@ BB#208:                               @ %.preheader1332
                                        @   in Loop: Header=BB64_12 Depth=1
	cmp	r5, #15
	bhi	.LBB64_211
.LBB64_209:                             @ %.lr.ph1342
                                        @   Parent Loop BB64_12 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	cmp	r10, #0
	beq	.LBB64_309
@ BB#210:                               @   in Loop: Header=BB64_209 Depth=2
	ldrb	r1, [r7], #1
	sub	r10, r10, #1
	add	r8, r8, r1, lsl r5
	add	r5, r5, #8
	cmp	r5, #16
	blo	.LBB64_209
.LBB64_211:                             @ %.preheader1332._crit_edge
                                        @   in Loop: Header=BB64_12 Depth=1
	ldrh	r2, [r11, #24]
	mov	r1, #0
	cmp	r8, r2
	bne	.LBB64_217
@ BB#212:                               @   in Loop: Header=BB64_12 Depth=1
	mov	r8, r1
	mov	r5, r1
.LBB64_213:                             @ %._crit_edge2191
                                        @   in Loop: Header=BB64_12 Depth=1
	ldr	r1, [r11, #32]
	cmp	r1, #0
	beq	.LBB64_215
@ BB#214:                               @   in Loop: Header=BB64_12 Depth=1
	mov	r2, #1
	and	r0, r2, r0, lsr #9
	str	r0, [r1, #44]
	ldr	r0, [r11, #32]
	str	r2, [r0, #48]
.LBB64_215:                             @   in Loop: Header=BB64_12 Depth=1
	mov	r0, #0
	str	r0, [r11, #24]
	str	r0, [lr, #48]
.LBB64_216:                             @   in Loop: Header=BB64_12 Depth=1
	mov	r0, #11
	b	.LBB64_11
.LBB64_217:                             @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, .LCPI64_19
	b	.LBB64_295
.LBB64_218:                             @   in Loop: Header=BB64_219 Depth=2
	ldrb	r1, [r7], #1
	mov	r3, r2
	sub	r10, r10, #1
	add	r8, r8, r1, lsl r5
	and	r1, r8, r4
	add	r1, r12, r1, lsr r0
	lsl	r1, r1, #2
	add	r5, r5, #8
	ldrh	r1, [r3, r1]!
	ldrh	r3, [r3, #2]
	orr	r1, r1, r3, lsl #16
	lsr	r3, r1, #8
	uxtab	r6, r0, r3
.LBB64_219:                             @ %.preheader1084
                                        @   Parent Loop BB64_12 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	cmp	r6, r5
	bls	.LBB64_221
@ BB#220:                               @ %.lr.ph1098
                                        @   in Loop: Header=BB64_219 Depth=2
	cmp	r10, #0
	beq	.LBB64_330
	b	.LBB64_218
.LBB64_221:                             @ %._crit_edge1099
                                        @   in Loop: Header=BB64_12 Depth=1
	lsr	r8, r8, r0
	lsr	r12, r1, #16
	sub	r5, r5, r0
	str	r0, [r9]
.LBB64_222:                             @   in Loop: Header=BB64_12 Depth=1
	uxtb	r2, r3
	lsr	r8, r8, r2
	sub	r5, r5, r2
	uxtab	r0, r0, r3
	str	r0, [r9]
	str	r12, [r11, #64]
	tst	r1, #255
	bne	.LBB64_224
@ BB#223:                               @   in Loop: Header=BB64_12 Depth=1
	mov	r0, #25
	b	.LBB64_250
.LBB64_224:                             @   in Loop: Header=BB64_12 Depth=1
	ldr	r12, [sp, #80]          @ 4-byte Reload
	tst	r1, #32
	bne	.LBB64_272
@ BB#225:                               @   in Loop: Header=BB64_12 Depth=1
	tst	r1, #64
	bne	.LBB64_277
@ BB#226:                               @   in Loop: Header=BB64_12 Depth=1
	and	r0, r1, #15
	mov	r1, #21
	str	r0, [r11, #72]
	str	r1, [r11]
.LBB64_227:                             @   in Loop: Header=BB64_12 Depth=1
	cmp	r0, #0
	bne	.LBB64_230
@ BB#228:                               @ %._crit_edge2185
                                        @   in Loop: Header=BB64_12 Depth=1
	ldr	r1, [r11, #64]
	b	.LBB64_233
.LBB64_229:                             @   in Loop: Header=BB64_230 Depth=2
	ldrb	r1, [r7], #1
	sub	r10, r10, #1
	add	r8, r8, r1, lsl r5
	add	r5, r5, #8
.LBB64_230:                             @ %.preheader1106
                                        @   Parent Loop BB64_12 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	cmp	r5, r0
	bhs	.LBB64_232
@ BB#231:                               @ %.lr.ph1118
                                        @   in Loop: Header=BB64_230 Depth=2
	cmp	r10, #0
	beq	.LBB64_309
	b	.LBB64_229
.LBB64_232:                             @ %.preheader1106._crit_edge
                                        @   in Loop: Header=BB64_12 Depth=1
	mov	r1, #1
	mvn	r2, #0
	add	r1, r2, r1, lsl r0
	ldr	r2, [r11, #64]
	and	r1, r1, r8
	lsr	r8, r8, r0
	add	r1, r2, r1
	str	r1, [r11, #64]
	ldr	r2, [r9]
	sub	r5, r5, r0
	add	r2, r2, r0
	str	r2, [r9]
.LBB64_233:                             @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, [sp, #24]           @ 4-byte Reload
	str	r1, [r0]
	mov	r1, #22
	str	r1, [r11]
.LBB64_234:                             @ %.preheader1125
                                        @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, [sp, #36]           @ 4-byte Reload
	mov	r1, #1
	mvn	r2, #0
	ldr	r0, [r0]
	add	r6, r2, r1, lsl r0
	ldr	r1, [r11, #80]
	and	r0, r6, r8
	lsl	r0, r0, #2
	mov	r2, r1
	ldrh	r0, [r2, r0]!
	ldrh	r2, [r2, #2]
	orr	r0, r0, r2, lsl #16
	lsr	r2, r0, #8
	uxtb	r3, r2
	b	.LBB64_236
.LBB64_235:                             @   in Loop: Header=BB64_236 Depth=2
	ldrb	r0, [r7], #1
	mov	r2, r1
	sub	r10, r10, #1
	add	r8, r8, r0, lsl r5
	and	r0, r6, r8
	lsl	r0, r0, #2
	add	r5, r5, #8
	ldrh	r0, [r2, r0]!
	ldrh	r2, [r2, #2]
	orr	r0, r0, r2, lsl #16
	lsr	r2, r0, #8
	uxtb	r3, r2
.LBB64_236:                             @ %.preheader1125
                                        @   Parent Loop BB64_12 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	cmp	r3, r5
	bls	.LBB64_238
@ BB#237:                               @ %.lr.ph1152
                                        @   in Loop: Header=BB64_236 Depth=2
	cmp	r10, #0
	beq	.LBB64_309
	b	.LBB64_235
.LBB64_238:                             @ %._crit_edge1153
                                        @   in Loop: Header=BB64_12 Depth=1
	str	r12, [sp, #80]          @ 4-byte Spill
	lsr	r12, r0, #16
	uxtb	r6, r0
	cmp	r6, #16
	bhs	.LBB64_240
@ BB#239:                               @ %.preheader1164
                                        @   in Loop: Header=BB64_12 Depth=1
	uxtab	r0, r3, r0
	mov	r2, #1
	mvn	r6, #0
	add	r4, r6, r2, lsl r0
	and	r0, r8, r4
	add	r0, r12, r0, lsr r3
	lsl	r0, r0, #2
	mov	r2, r1
	ldrh	r0, [r2, r0]!
	ldrh	r2, [r2, #2]
	orr	r0, r0, r2, lsl #16
	lsr	r2, r0, #8
	uxtab	r6, r3, r2
	b	.LBB64_242
.LBB64_240:                             @ %._crit_edge2184
                                        @   in Loop: Header=BB64_12 Depth=1
	ldr	r1, [r9]
	b	.LBB64_245
.LBB64_241:                             @   in Loop: Header=BB64_242 Depth=2
	ldrb	r0, [r7], #1
	mov	r2, r1
	sub	r10, r10, #1
	add	r8, r8, r0, lsl r5
	and	r0, r8, r4
	add	r0, r12, r0, lsr r3
	lsl	r0, r0, #2
	add	r5, r5, #8
	ldrh	r0, [r2, r0]!
	ldrh	r2, [r2, #2]
	orr	r0, r0, r2, lsl #16
	lsr	r2, r0, #8
	uxtab	r6, r3, r2
.LBB64_242:                             @ %.preheader1164
                                        @   Parent Loop BB64_12 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	cmp	r6, r5
	bls	.LBB64_244
@ BB#243:                               @ %.lr.ph1178
                                        @   in Loop: Header=BB64_242 Depth=2
	cmp	r10, #0
	beq	.LBB64_330
	b	.LBB64_241
.LBB64_244:                             @ %.preheader1164._crit_edge
                                        @   in Loop: Header=BB64_12 Depth=1
	ldr	r1, [r9]
	lsr	r8, r8, r3
	lsr	r12, r0, #16
	add	r1, r1, r3
	sub	r5, r5, r3
	str	r1, [r9]
.LBB64_245:                             @   in Loop: Header=BB64_12 Depth=1
	uxtb	r3, r2
	lsr	r8, r8, r3
	sub	r5, r5, r3
	uxtab	r1, r1, r2
	str	r1, [r9]
	tst	r0, #64
	bne	.LBB64_248
@ BB#246:                               @   in Loop: Header=BB64_12 Depth=1
	str	r12, [r11, #68]
	ldr	r12, [sp, #80]          @ 4-byte Reload
	and	r0, r0, #15
	mov	r1, #23
	str	r0, [r11, #72]
	str	r1, [r11]
.LBB64_247:                             @   in Loop: Header=BB64_12 Depth=1
	cmp	r0, #0
	beq	.LBB64_257
	b	.LBB64_253
.LBB64_248:                             @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, .LCPI64_8
.LBB64_249:                             @   in Loop: Header=BB64_12 Depth=1
	str	r0, [lr, #24]
	mov	r0, #29
.LBB64_250:                             @   in Loop: Header=BB64_12 Depth=1
	str	r0, [r11]
.LBB64_251:                             @   in Loop: Header=BB64_12 Depth=1
	ldr	r12, [sp, #80]          @ 4-byte Reload
	ldr	r0, [r11]
	b	.LBB64_12
.LBB64_252:                             @   in Loop: Header=BB64_253 Depth=2
	ldrb	r1, [r7], #1
	sub	r10, r10, #1
	add	r8, r8, r1, lsl r5
	add	r5, r5, #8
.LBB64_253:                             @ %.preheader1186
                                        @   Parent Loop BB64_12 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	cmp	r5, r0
	bhs	.LBB64_256
@ BB#254:                               @ %.lr.ph1198
                                        @   in Loop: Header=BB64_253 Depth=2
	cmp	r10, #0
	beq	.LBB64_309
	b	.LBB64_252
	.align	2
@ BB#255:
.LCPI64_24:
	.long	crc_table
.LBB64_256:                             @ %.preheader1186._crit_edge
                                        @   in Loop: Header=BB64_12 Depth=1
	mov	r1, #1
	mvn	r2, #0
	add	r1, r2, r1, lsl r0
	ldr	r2, [r11, #68]
	and	r1, r1, r8
	lsr	r8, r8, r0
	add	r1, r2, r1
	str	r1, [r11, #68]
	ldr	r1, [r9]
	sub	r5, r5, r0
	add	r1, r1, r0
	str	r1, [r9]
.LBB64_257:                             @   in Loop: Header=BB64_12 Depth=1
	mov	r0, #24
	str	r0, [r11]
.LBB64_258:                             @   in Loop: Header=BB64_12 Depth=1
	cmp	r12, #0
	beq	.LBB64_335
@ BB#259:                               @   in Loop: Header=BB64_12 Depth=1
	ldr	r1, [sp, #60]           @ 4-byte Reload
	ldr	r0, [r11, #68]
	sub	r1, r1, r12
	cmp	r0, r1
	bls	.LBB64_264
@ BB#260:                               @   in Loop: Header=BB64_12 Depth=1
	ldr	r2, [r11, #44]
	sub	r0, r0, r1
	cmp	r0, r2
	bls	.LBB64_262
@ BB#261:                               @   in Loop: Header=BB64_12 Depth=1
	ldr	r1, [sp, #16]           @ 4-byte Reload
	ldr	r1, [r1]
	cmp	r1, #0
	bne	.LBB64_273
.LBB64_262:                             @   in Loop: Header=BB64_12 Depth=1
	ldr	r1, [r11, #48]
	cmp	r0, r1
	bls	.LBB64_265
@ BB#263:                               @   in Loop: Header=BB64_12 Depth=1
	ldr	r2, [r11, #40]
	ldr	r3, [r11, #52]
	sub	r0, r0, r1
	sub	r1, r2, r0
	add	r1, r3, r1
	b	.LBB64_266
.LBB64_264:                             @   in Loop: Header=BB64_12 Depth=1
	ldr	r4, [sp, #76]           @ 4-byte Reload
	ldr	r3, [r11, #64]
	sub	r1, r4, r0
	mov	r0, r3
	b	.LBB64_267
.LBB64_265:                             @   in Loop: Header=BB64_12 Depth=1
	ldr	r2, [r11, #52]
	sub	r1, r1, r0
	add	r1, r2, r1
.LBB64_266:                             @   in Loop: Header=BB64_12 Depth=1
	ldr	r3, [r11, #64]
	ldr	r4, [sp, #76]           @ 4-byte Reload
	cmp	r0, r3
	movhi	r0, r3
.LBB64_267:                             @   in Loop: Header=BB64_12 Depth=1
	cmp	r0, r12
	mvn	r2, r0
	mvn	r6, r12
	movhi	r0, r12
	cmp	r6, r2
	movhi	r2, r6
	sub	r3, r3, r0
	str	r3, [r11, #64]
	add	r3, r2, #1
	mov	r6, r4
	str	r4, [sp, #76]           @ 4-byte Spill
.LBB64_268:                             @   Parent Loop BB64_12 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldrb	r4, [r1], #1
	adds	r3, r3, #1
	strb	r4, [r6], #1
	bne	.LBB64_268
@ BB#269:                               @   in Loop: Header=BB64_12 Depth=1
	mvn	r1, r2
	ldr	r2, [sp, #76]           @ 4-byte Reload
	sub	r12, r12, r0
	ldr	r0, [r11, #64]
	add	r2, r2, r1
	str	r2, [sp, #76]           @ 4-byte Spill
	cmp	r0, #0
	bne	.LBB64_271
@ BB#270:                               @   in Loop: Header=BB64_12 Depth=1
	mov	r0, #20
	b	.LBB64_11
.LBB64_271:                             @ %.thread.backedge
                                        @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, [r11]
	b	.LBB64_12
.LBB64_272:                             @   in Loop: Header=BB64_12 Depth=1
	mvn	r0, #0
	str	r0, [r9]
	b	.LBB64_216
.LBB64_273:                             @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, .LCPI64_9
	b	.LBB64_295
.LBB64_274:                             @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, .LCPI64_17
	b	.LBB64_295
.LBB64_275:                             @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, .LCPI64_3
	mov	lr, r9
	mov	r1, #29
	str	r0, [lr, #24]
	str	r1, [r11]
	mov	r8, r4
	b	.LBB64_300
.LBB64_276:                             @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, .LCPI64_22
	b	.LBB64_295
.LBB64_277:                             @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, .LCPI64_7
	b	.LBB64_295
.LBB64_278:                             @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, .LCPI64_14
	ldr	r1, .LCPI64_15
	mov	r2, #9
	mov	r3, #5
	add	r4, r11, #76
	stm	r4, {r0, r1, r2, r3}
	ldr	r1, [sp, #56]           @ 4-byte Reload
	mov	r0, #19
	str	r0, [r11]
	cmp	r1, #6
	bne	.LBB64_282
	b	.LBB64_340
.LBB64_279:                             @   in Loop: Header=BB64_12 Depth=1
	mov	r0, #16
	b	.LBB64_281
.LBB64_280:                             @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, .LCPI64_13
	str	r0, [lr, #24]
	mov	r0, #29
.LBB64_281:                             @   in Loop: Header=BB64_12 Depth=1
	str	r0, [r11]
.LBB64_282:                             @   in Loop: Header=BB64_12 Depth=1
	lsr	r8, r8, #3
	sub	r5, r5, #3
	ldr	r0, [r11]
	b	.LBB64_12
.LBB64_283:                             @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, .LCPI64_5
	b	.LBB64_299
.LBB64_284:                             @   in Loop: Header=BB64_12 Depth=1
	bl	crc32
.LBB64_285:                             @   in Loop: Header=BB64_12 Depth=1
	mov	lr, r4
	mov	r12, r6
	str	r0, [r11, #24]
	str	r0, [lr, #48]
.LBB64_286:                             @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, [r11, #16]
	ldr	r2, [r11, #24]
	mov	r1, #0
	cmp	r0, #0
	mov	r0, r8
	reveq	r0, r8
	cmp	r0, r2
	bne	.LBB64_296
@ BB#287:                               @   in Loop: Header=BB64_12 Depth=1
	mov	r8, r1
	mov	r5, r1
	mov	r2, #1
	str	r12, [sp, #60]          @ 4-byte Spill
.LBB64_288:                             @   in Loop: Header=BB64_12 Depth=1
	mov	r0, #27
	str	r0, [r11]
.LBB64_289:                             @ %.thread._crit_edge
                                        @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, [r11, #8]
	cmp	r0, #0
	ldrne	r0, [r11, #16]
	cmpne	r0, #0
	beq	.LBB64_342
@ BB#290:                               @ %.preheader836
                                        @   in Loop: Header=BB64_12 Depth=1
	cmp	r5, #31
	bhi	.LBB64_293
.LBB64_291:                             @ %.lr.ph846
                                        @   Parent Loop BB64_12 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	cmp	r10, #0
	beq	.LBB64_309
@ BB#292:                               @   in Loop: Header=BB64_291 Depth=2
	ldrb	r0, [r7], #1
	sub	r10, r10, #1
	add	r8, r8, r0, lsl r5
	add	r5, r5, #8
	cmp	r5, #32
	blo	.LBB64_291
.LBB64_293:                             @ %.preheader836._crit_edge
                                        @   in Loop: Header=BB64_12 Depth=1
	ldr	r1, [r11, #28]
	mov	r0, #0
	cmp	r8, r1
	beq	.LBB64_341
@ BB#294:                               @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, .LCPI64_1
.LBB64_295:                             @   in Loop: Header=BB64_12 Depth=1
	str	r0, [lr, #24]
	mov	r0, #29
	b	.LBB64_11
.LBB64_296:                             @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, .LCPI64_0
	str	r12, [sp, #60]          @ 4-byte Spill
	str	r0, [lr, #24]
	mov	r0, #29
	str	r0, [r11]
	ldr	r0, [r11]
	b	.LBB64_12
.LBB64_297:                             @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, .LCPI64_4
	b	.LBB64_249
.LBB64_298:                             @   in Loop: Header=BB64_12 Depth=1
	ldr	r0, .LCPI64_6
.LBB64_299:                             @   in Loop: Header=BB64_12 Depth=1
	mov	lr, r9
	mov	r1, #29
	str	r0, [lr, #24]
	str	r1, [r11]
.LBB64_300:                             @   in Loop: Header=BB64_12 Depth=1
	ldr	r12, [sp, #80]          @ 4-byte Reload
	ldr	r9, [sp, #68]           @ 4-byte Reload
	ldr	r0, [r11]
	b	.LBB64_12
.LBB64_301:                             @   in Loop: Header=BB64_12 Depth=1
	ldr	r1, .LCPI64_4
	mov	r2, #29
	mov	r8, r0
	str	r1, [lr, #24]
	str	r2, [r11]
	b	.LBB64_251
.LBB64_302:                             @   in Loop: Header=BB64_12 Depth=1
	cmp	r0, r1
	bls	.LBB64_304
@ BB#303:                               @   in Loop: Header=BB64_12 Depth=1
	lsr	r8, r8, #4
	sub	r5, r5, #4
	ldr	r0, .LCPI64_21
	b	.LBB64_295
.LBB64_304:                             @   in Loop: Header=BB64_12 Depth=1
	mov	r1, #1
	lsl	r2, r1, r0
	mov	r0, #2
	and	r0, r0, r8, lsr #12
	str	r2, [r11, #20]
	str	r1, [r11, #24]
	str	r1, [lr, #48]
	eor	r0, r0, #11
.LBB64_305:                             @ %.preheader.i
                                        @   in Loop: Header=BB64_12 Depth=1
	str	r0, [r11]
	mov	r8, #0
	mov	r5, r8
	ldr	r0, [r11]
	b	.LBB64_12
.LBB64_306:
	str	r1, [sp, #32]           @ 4-byte Spill
	b	.LBB64_319
	.align	2
@ BB#307:
.LCPI64_25:
	.long	.L.str846
	.align	2
@ BB#308:
.LCPI64_26:
	.long	inflate.order
.LBB64_309:
	mov	r10, #0
	ldr	r2, [sp, #64]           @ 4-byte Reload
.LBB64_310:                             @ %.loopexit
	ldr	r0, [sp, #76]           @ 4-byte Reload
	mov	r9, r2
	str	r0, [lr, #12]
	str	r12, [lr, #16]
	stm	lr, {r7, r10}
	str	r8, [r11, #56]
	str	r5, [r11, #60]
	ldr	r8, [sp, #8]            @ 4-byte Reload
	ldr	r0, [r11, #40]
	cmp	r0, #0
	bne	.LBB64_315
@ BB#311:
	ldr	r1, [sp, #60]           @ 4-byte Reload
	ldr	r0, [lr, #16]
	mov	r6, r1
	cmp	r1, r0
	beq	.LBB64_322
@ BB#312:
	ldr	r1, [r11]
	cmp	r1, #28
	bhi	.LBB64_321
@ BB#313:
	cmp	r1, #26
	blo	.LBB64_315
@ BB#314:
	ldr	r1, [sp, #56]           @ 4-byte Reload
	mov	r6, r0
	cmp	r1, #4
	beq	.LBB64_322
.LBB64_315:
	ldr	r1, [sp, #60]           @ 4-byte Reload
	mov	r0, lr
	mov	r5, lr
	bl	updatewindow
	cmp	r0, #0
	beq	.LBB64_320
@ BB#316:
	mov	r0, #30
	str	r0, [r11]
	b	.LBB64_319
.LBB64_317:                             @ %.loopexit35
	mvn	r0, #1
.LBB64_318:                             @ %.loopexit35
	str	r0, [sp, #32]           @ 4-byte Spill
.LBB64_319:
	ldr	r0, [sp, #32]           @ 4-byte Reload
	add	sp, sp, #84
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
.LBB64_320:                             @ %._crit_edge2202
	ldr	r6, [r5, #16]
	mov	lr, r5
	b	.LBB64_322
.LBB64_321:
	mov	r6, r0
.LBB64_322:
	ldr	r5, [lr, #4]
	ldr	r0, [lr, #8]
	sub	r1, r8, r5
	add	r0, r1, r0
	str	r0, [lr, #8]
	ldr	r1, [sp, #60]           @ 4-byte Reload
	ldr	r0, [lr, #20]
	sub	r2, r1, r6
	add	r0, r0, r2
	str	r0, [lr, #20]
	ldr	r0, [r11, #28]
	add	r0, r0, r2
	str	r0, [r11, #28]
	ldr	r0, [r11, #8]
	cmp	r0, #0
	ldrne	r0, [sp, #60]           @ 4-byte Reload
	cmpne	r0, r6
	beq	.LBB64_327
@ BB#323:
	ldr	r1, [lr, #12]
	ldr	r0, [r11, #24]
	ldr	r3, [r11, #16]
	mov	r7, lr
	sub	r1, r1, r2
	cmp	r3, #0
	beq	.LBB64_325
@ BB#324:
	bl	crc32
	b	.LBB64_326
.LBB64_325:
	bl	adler32
.LBB64_326:
	mov	lr, r7
	str	r0, [r11, #24]
	str	r0, [lr, #48]
.LBB64_327:
	ldr	r1, [r11, #4]
	ldr	r4, [r11, #60]
	ldr	r2, [r11]
	cmp	r1, #0
	mov	r1, #256
	addne	r4, r4, #64
	cmp	r2, #11
	addeq	r4, r4, #128
	cmp	r2, #19
	beq	.LBB64_329
@ BB#328:
	mov	r1, #0
	cmp	r2, #14
	moveq	r1, #256
.LBB64_329:
	ldr	r3, [sp, #60]           @ 4-byte Reload
	mov	r12, #0
	mov	r7, #0
	cmp	r3, r6
	moveq	r12, #1
	cmp	r8, r5
	ldr	r5, [sp, #56]           @ 4-byte Reload
	mov	r0, r9
	moveq	r7, #1
	cmp	r0, #0
	mov	r6, #0
	moveq	r6, #1
	add	r1, r4, r1
	mov	r2, #0
	cmp	r5, #4
	str	r1, [lr, #44]
	moveq	r2, #1
	and	r1, r7, r12
	orr	r1, r1, r2
	tst	r1, r6
	mvnne	r0, #4
	add	sp, sp, #84
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
.LBB64_330:
	mov	r10, #0
	ldr	r2, [sp, #64]           @ 4-byte Reload
	ldr	r12, [sp, #80]          @ 4-byte Reload
	b	.LBB64_310
.LBB64_331:                             @ %..loopexit1365_crit_edge
	sub	r10, r10, r6
	add	r7, r7, r6
	ldr	r2, [sp, #64]           @ 4-byte Reload
	b	.LBB64_310
.LBB64_332:                             @ %.loopexit.loopexit36
	mvn	r2, #2
	b	.LBB64_310
.LBB64_333:
	ldr	r0, [sp, #76]           @ 4-byte Reload
	str	r0, [lr, #12]
	str	r12, [lr, #16]
	stm	lr, {r7, r10}
	str	r8, [r11, #56]
	str	r5, [r11, #60]
	mov	r0, #2
	b	.LBB64_318
.LBB64_334:
	ldr	r2, [sp, #64]           @ 4-byte Reload
	b	.LBB64_310
.LBB64_335:
	mov	r12, #0
	ldr	r2, [sp, #64]           @ 4-byte Reload
	b	.LBB64_310
.LBB64_336:
	mov	r0, #6
	str	r0, [sp, #56]           @ 4-byte Spill
	mov	r5, r8
	ldr	r2, [sp, #64]           @ 4-byte Reload
	b	.LBB64_310
.LBB64_337:
	ldr	r2, [sp, #64]           @ 4-byte Reload
	b	.LBB64_310
.LBB64_338:
	mov	r0, #6
	mov	r1, #0
	str	r0, [sp, #56]           @ 4-byte Spill
	mov	r2, r1
	b	.LBB64_310
.LBB64_339:
	ldr	r2, [sp, #64]           @ 4-byte Reload
	b	.LBB64_310
.LBB64_340:
	mov	r0, #6
	str	r0, [sp, #56]           @ 4-byte Spill
	lsr	r8, r8, #3
	sub	r5, r5, #3
	ldr	r2, [sp, #64]           @ 4-byte Reload
	b	.LBB64_310
.LBB64_341:
	mov	r8, r0
	mov	r5, r0
.LBB64_342:
	mov	r0, #28
	str	r0, [r11]
	b	.LBB64_310
	.align	2
@ BB#343:
.LCPI64_0:
	.long	.L.str17
.LCPI64_1:
	.long	.L.str18
.LCPI64_3:
	.long	.L.str947
.LCPI64_4:
	.long	.L.str10
.LCPI64_5:
	.long	.L.str12
.LCPI64_6:
	.long	.L.str1348
.LCPI64_7:
	.long	.L.str256
.LCPI64_8:
	.long	.L.str155
.LCPI64_9:
	.long	.L.str54
.LCPI64_10:
	.long	.L.str11
.LCPI64_12:
	.long	.L.str745
.LCPI64_13:
	.long	.L.str644
.LCPI64_14:
	.long	fixedtables.lenfix
.LCPI64_15:
	.long	fixedtables.distfix
.LCPI64_16:
	.long	.L.str240
.LCPI64_17:
	.long	.L.str442
.LCPI64_18:
	.long	crc_table
.LCPI64_19:
	.long	.L.str543
.LCPI64_20:
	.long	138547333               @ 0x8421085
.LCPI64_21:
	.long	.L.str341
.LCPI64_22:
	.long	.L.str139
.LCPI64_23:
	.long	4142483145              @ 0xf6e946c9
.Ltmp64:
	.size	inflate, .Ltmp64-inflate

	.align	2
	.type	updatewindow,%function
updatewindow:                           @ @updatewindow
@ BB#0:
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r9, r0
	mov	r8, r1
	ldr	r7, [r9, #28]
	ldr	r0, [r7, #52]
	cmp	r0, #0
	bne	.LBB65_2
@ BB#1:
	ldr	r1, [r7, #36]
	mov	r6, #1
	ldr	r3, [r9, #32]
	ldr	r0, [r9, #40]
	lsl	r1, r6, r1
	mov	r2, #1
	blx	r3
	str	r0, [r7, #52]
	cmp	r0, #0
	beq	.LBB65_10
.LBB65_2:
	ldr	r1, [r7, #40]
	cmp	r1, #0
	bne	.LBB65_4
@ BB#3:
	ldr	r1, [r7, #36]
	mov	r2, #1
	lsl	r1, r2, r1
	mov	r2, #0
	str	r1, [r7, #40]
	str	r2, [r7, #44]
	str	r2, [r7, #48]
.LBB65_4:
	ldr	r12, [r9, #16]
	sub	r2, r8, r12
	cmp	r2, r1
	bhs	.LBB65_11
@ BB#5:
	ldr	r10, [r7, #48]
	sub	r4, r1, r10
	cmp	r4, r2
	movhi	r4, r2
	cmp	r4, #0
	beq	.LBB65_8
@ BB#6:                                 @ %.lr.ph.i7.preheader
	sub	r3, r10, #1
	sub	r5, r3, r1
	sub	r3, r12, #1
	sub	r3, r3, r8
	cmp	r5, r3
	ldr	lr, [r9, #12]
	movhi	r3, r5
	mvn	r5, r3
	sub	r3, r12, r8
	add	r0, r0, r10
	add	r3, lr, r3
.LBB65_7:                               @ %.lr.ph.i7
                                        @ =>This Inner Loop Header: Depth=1
	ldrb	r6, [r3], #1
	subs	r5, r5, #1
	strb	r6, [r0], #1
	bne	.LBB65_7
.LBB65_8:                               @ %ZMEMCPY.exit8
	cmp	r2, r4
	bne	.LBB65_16
@ BB#9:
	ldr	r0, [r7, #48]
	mov	r6, #0
	add	r1, r0, r2
	str	r1, [r7, #48]
	ldr	r0, [r7, #40]
	cmp	r1, r0
	moveq	r1, #0
	streq	r1, [r7, #48]
	ldr	r1, [r7, #44]
	cmp	r1, r0
	addlo	r0, r1, r2
	strlo	r0, [r7, #44]
.LBB65_10:
	mov	r0, r6
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.LBB65_11:
	mov	r6, #0
	mov	r2, #0
	cmp	r1, #0
	beq	.LBB65_15
@ BB#12:
	ldr	r2, [r9, #12]
.LBB65_13:                              @ %.lr.ph.i
                                        @ =>This Inner Loop Header: Depth=1
	ldrb	r3, [r2, -r1]
	subs	r1, r1, #1
	strb	r3, [r0], #1
	bne	.LBB65_13
@ BB#14:                                @ %ZMEMCPY.exit.loopexit
	ldr	r2, [r7, #40]
.LBB65_15:                              @ %ZMEMCPY.exit
	mov	r0, r6
	str	r2, [r7, #44]
	str	r6, [r7, #48]
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.LBB65_16:                              @ %.lr.ph.i3.preheader
	sub	r3, r10, #1
	sub	r1, r3, r1
	sub	r3, r12, #1
	sub	r3, r3, r8
	cmp	r1, r3
	movhi	r3, r1
	add	r3, r8, r3
	sub	r0, r2, r4
	ldr	r2, [r9, #12]
	ldr	r1, [r7, #52]
	add	r3, r3, #1
	sub	r3, r3, r12
.LBB65_17:                              @ %.lr.ph.i3
                                        @ =>This Inner Loop Header: Depth=1
	ldrb	r6, [r2, -r3]
	subs	r3, r3, #1
	strb	r6, [r1], #1
	bne	.LBB65_17
@ BB#18:                                @ %ZMEMCPY.exit4
	str	r0, [r7, #48]
	ldr	r0, [r7, #40]
	mov	r6, #0
	str	r0, [r7, #44]
	mov	r0, r6
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.Ltmp65:
	.size	updatewindow, .Ltmp65-updatewindow

	.globl	inflateEnd
	.align	2
	.type	inflateEnd,%function
inflateEnd:                             @ @inflateEnd
@ BB#0:
	push	{r4, lr}
	mov	r4, r0
	mvn	r0, #1
	cmp	r4, #0
	beq	.LBB66_5
@ BB#1:
	ldr	r1, [r4, #28]
	cmp	r1, #0
	ldrne	r3, [r4, #36]
	cmpne	r3, #0
	beq	.LBB66_5
@ BB#2:
	ldr	r2, [r1, #52]
	cmp	r2, #0
	beq	.LBB66_4
@ BB#3:
	ldr	r0, [r4, #40]
	mov	r1, r2
	blx	r3
	ldr	r1, [r4, #28]
	ldr	r3, [r4, #36]
.LBB66_4:                               @ %._crit_edge
	ldr	r0, [r4, #40]
	blx	r3
	mov	r0, #0
	str	r0, [r4, #28]
.LBB66_5:
	pop	{r4, pc}
.Ltmp66:
	.size	inflateEnd, .Ltmp66-inflateEnd

	.globl	inflateSetDictionary
	.align	2
	.type	inflateSetDictionary,%function
inflateSetDictionary:                   @ @inflateSetDictionary
@ BB#0:
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r4, r0
	cmp	r4, #0
	ldrne	r7, [r4, #28]
	mov	r9, r2
	mov	r8, r1
	mvn	r6, #1
	cmpne	r7, #0
	beq	.LBB67_8
@ BB#1:
	ldr	r0, [r7]
	ldr	r1, [r7, #8]
	cmp	r1, #0
	beq	.LBB67_3
@ BB#2:
	cmp	r0, #10
	beq	.LBB67_4
	b	.LBB67_8
.LBB67_3:
	cmp	r0, #10
	bne	.LBB67_5
.LBB67_4:
	mov	r0, #1
	mov	r1, r8
	mov	r2, r9
	bl	adler32
	ldr	r1, [r7, #24]
	mvn	r6, #2
	cmp	r0, r1
	bne	.LBB67_8
.LBB67_5:
	add	r0, r8, r9
	ldr	r5, [r4, #12]
	ldr	r10, [r4, #16]
	str	r0, [r4, #12]
	mov	r0, r4
	mov	r1, r9
	mov	r6, #0
	str	r6, [r4, #16]
	bl	updatewindow
	str	r5, [r4, #12]
	str	r10, [r4, #16]
	cmp	r0, #0
	beq	.LBB67_7
@ BB#6:
	mov	r0, #30
	mvn	r6, #3
	str	r0, [r7]
	mov	r0, r6
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.LBB67_7:
	mov	r0, #1
	str	r0, [r7, #12]
.LBB67_8:
	mov	r0, r6
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.Ltmp67:
	.size	inflateSetDictionary, .Ltmp67-inflateSetDictionary

	.globl	inflateGetHeader
	.align	2
	.type	inflateGetHeader,%function
inflateGetHeader:                       @ @inflateGetHeader
@ BB#0:
	mov	r2, r0
	cmp	r2, #0
	ldrne	r2, [r2, #28]
	mvn	r0, #1
	cmpne	r2, #0
	beq	.LBB68_2
@ BB#1:
	ldrb	r3, [r2, #8]
	tst	r3, #2
	movne	r0, #0
	strne	r1, [r2, #32]
	strne	r0, [r1, #48]
.LBB68_2:
	bx	lr
.Ltmp68:
	.size	inflateGetHeader, .Ltmp68-inflateGetHeader

	.globl	inflateSync
	.align	2
	.type	inflateSync,%function
inflateSync:                            @ @inflateSync
@ BB#0:
	push	{r4, r5, r6, lr}
	sub	sp, sp, #4
	cmp	r0, #0
	ldrne	r12, [r0, #28]
	mvn	r1, #1
	cmpne	r12, #0
	beq	.LBB69_28
@ BB#1:
	ldr	lr, [r0, #4]
	cmp	lr, #0
	bne	.LBB69_3
@ BB#2:
	ldr	r2, [r12, #60]
	mvn	r1, #4
	cmp	r2, #8
	blo	.LBB69_28
.LBB69_3:
	ldr	r1, [r12]
	cmp	r1, #31
	bne	.LBB69_5
@ BB#4:                                 @ %._crit_edge42
	ldr	r1, [r12, #104]
	b	.LBB69_16
.LBB69_5:
	mov	r1, #31
	str	r1, [r12]
	ldr	r3, [r12, #60]
	ldr	r1, [r12, #56]
	and	r2, r3, #7
	lsl	r2, r1, r2
	bic	r1, r3, #7
	str	r2, [r12, #56]
	str	r1, [r12, #60]
	cmp	r1, #7
	bls	.LBB69_14
@ BB#6:
	mov	r3, #0
	mov	r5, sp
.LBB69_7:                               @ %.lr.ph
                                        @ =>This Inner Loop Header: Depth=1
	lsr	r4, r2, #8
	strb	r2, [r5, -r3]
	sub	r1, r1, #8
	sub	r3, r3, #1
	mov	r2, r4
	cmp	r1, #7
	bhi	.LBB69_7
@ BB#8:
	mov	lr, r12
	str	r4, [r12, #56]
	str	r1, [r12, #60]
	mov	r1, #0
	str	r1, [lr, #104]!
	cmp	r3, #0
	beq	.LBB69_15
@ BB#9:
	rsb	r3, r3, #0
	mov	r4, #1
.LBB69_10:                              @ %.lr.ph.i
                                        @ =>This Inner Loop Header: Depth=1
	add	r2, r5, r4
	sub	r2, r2, #1
	cmp	r1, #2
	ldrb	r2, [r2]
	mov	r6, #255
	movlo	r6, #0
	cmp	r2, r6
	bne	.LBB69_12
@ BB#11:                                @   in Loop: Header=BB69_10 Depth=1
	add	r1, r1, #1
	b	.LBB69_13
.LBB69_12:                              @   in Loop: Header=BB69_10 Depth=1
	rsb	r1, r1, #4
	cmp	r2, #0
	movne	r1, #0
.LBB69_13:                              @   in Loop: Header=BB69_10 Depth=1
	cmp	r4, r3
	addlo	r4, r4, #1
	cmplo	r1, #4
	blo	.LBB69_10
	b	.LBB69_15
.LBB69_14:                              @ %.thread
	mov	lr, r12
	mov	r1, #0
	str	r1, [lr, #104]!
.LBB69_15:                              @ %syncsearch.exit
	str	r1, [lr]
	ldr	lr, [r0, #4]
.LBB69_16:
	mov	r2, #0
	cmp	lr, #0
	beq	.LBB69_23
@ BB#17:
	cmp	r1, #3
	bhi	.LBB69_23
@ BB#18:
	ldr	r3, [r0]
.LBB69_19:                              @ %.lr.ph.i3
                                        @ =>This Inner Loop Header: Depth=1
	ldrb	r4, [r3, r2]
	cmp	r1, #2
	mov	r5, #255
	movlo	r5, #0
	cmp	r4, r5
	bne	.LBB69_21
@ BB#20:                                @   in Loop: Header=BB69_19 Depth=1
	add	r1, r1, #1
	b	.LBB69_22
.LBB69_21:                              @   in Loop: Header=BB69_19 Depth=1
	rsb	r1, r1, #4
	cmp	r4, #0
	movne	r1, #0
.LBB69_22:                              @   in Loop: Header=BB69_19 Depth=1
	add	r2, r2, #1
	cmp	r2, lr
	cmplo	r1, #4
	blo	.LBB69_19
.LBB69_23:                              @ %syncsearch.exit9
	str	r1, [r12, #104]
	ldr	r1, [r0, #4]
	sub	r1, r1, r2
	str	r1, [r0, #4]
	ldr	r1, [r0]
	add	r1, r1, r2
	str	r1, [r0]
	ldr	r1, [r0, #8]
	add	r2, r1, r2
	str	r2, [r0, #8]
	ldr	r3, [r12, #104]
	mvn	r1, #2
	cmp	r3, #4
	bne	.LBB69_28
@ BB#24:
	ldr	r3, [r0, #28]
	ldr	r1, [r0, #20]
	cmp	r3, #0
	beq	.LBB69_27
@ BB#25:
	mov	r4, #0
	str	r4, [r3, #40]
	str	r4, [r3, #44]
	str	r4, [r3, #48]
	ldr	r3, [r0, #28]
	cmp	r3, #0
	beq	.LBB69_27
@ BB#26:
	str	r4, [r3, #28]
	str	r4, [r0, #20]
	str	r4, [r0, #8]
	str	r4, [r0, #24]
	ldr	r5, [r3, #8]
	cmp	r5, #0
	andne	r6, r5, #1
	strne	r6, [r0, #48]
	mov	r5, #0
	mov	r6, #32768
	str	r5, [r3]
	str	r5, [r3, #4]
	str	r5, [r3, #12]
	str	r6, [r3, #20]
	str	r5, [r3, #32]
	str	r5, [r3, #56]
	str	r5, [r3, #60]
	add	r5, r3, #1328
	mov	r6, #7104
	str	r5, [r3, #108]
	str	r5, [r3, #80]
	str	r5, [r3, #76]
	mov	r5, #1
	str	r5, [r3, r6]
	mov	r6, #964
	orr	r6, r6, #6144
	mvn	r5, #0
	str	r5, [r3, r6]
.LBB69_27:                              @ %inflateReset.exit
	str	r2, [r0, #8]
	str	r1, [r0, #20]
	mov	r1, #0
	mov	r0, #11
	str	r0, [r12]
.LBB69_28:
	mov	r0, r1
	add	sp, sp, #4
	pop	{r4, r5, r6, pc}
.Ltmp69:
	.size	inflateSync, .Ltmp69-inflateSync

	.globl	inflateSyncPoint
	.align	2
	.type	inflateSyncPoint,%function
inflateSyncPoint:                       @ @inflateSyncPoint
@ BB#0:
	mov	r1, r0
	cmp	r1, #0
	ldrne	r1, [r1, #28]
	mvn	r0, #1
	cmpne	r1, #0
	beq	.LBB70_2
@ BB#1:
	ldr	r2, [r1]
	mov	r0, #0
	cmp	r2, #13
	bxne	lr
	ldr	r1, [r1, #60]
	mov	r0, #0
	cmp	r1, #0
	moveq	r0, #1
.LBB70_2:
	bx	lr
.Ltmp70:
	.size	inflateSyncPoint, .Ltmp70-inflateSyncPoint

	.globl	inflateCopy
	.align	2
	.type	inflateCopy,%function
inflateCopy:                            @ @inflateCopy
@ BB#0:
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r10, r0
	mov	r7, r1
	mvn	r8, #1
	cmp	r10, #0
	beq	.LBB71_16
@ BB#1:
	cmp	r7, #0
	ldrne	r5, [r7, #28]
	cmpne	r5, #0
	beq	.LBB71_16
@ BB#2:
	ldr	r3, [r7, #32]
	cmp	r3, #0
	ldrne	r0, [r7, #36]
	cmpne	r0, #0
	beq	.LBB71_16
@ BB#3:
	mov	r6, #972
	ldr	r0, [r7, #40]
	orr	r6, r6, #6144
	mov	r1, #1
	mov	r2, r6
	blx	r3
	mov	r9, r0
	mvn	r8, #3
	cmp	r9, #0
	beq	.LBB71_16
@ BB#4:
	ldr	r0, [r5, #52]
	mov	r4, #0
	cmp	r0, #0
	mov	r0, #0
	beq	.LBB71_6
@ BB#5:
	ldr	r1, [r5, #36]
	mov	r2, #1
	ldr	r3, [r7, #32]
	ldr	r0, [r7, #40]
	lsl	r1, r2, r1
	mov	r2, #1
	blx	r3
	cmp	r0, #0
	beq	.LBB71_17
.LBB71_6:                               @ %.lr.ph.i
                                        @ =>This Inner Loop Header: Depth=1
	ldrb	r1, [r7, -r4]
	strb	r1, [r10, -r4]
	sub	r4, r4, #1
	cmn	r4, #56
	bne	.LBB71_6
@ BB#7:
	mov	r1, r5
	mov	r2, r9
.LBB71_8:                               @ %.lr.ph.i7
                                        @ =>This Inner Loop Header: Depth=1
	ldrb	r3, [r1], #1
	subs	r6, r6, #1
	strb	r3, [r2], #1
	bne	.LBB71_8
@ BB#9:                                 @ %ZMEMCPY.exit8
	ldr	r2, [r5, #76]
	add	r1, r5, #1328
	cmp	r2, r1
	blo	.LBB71_12
@ BB#10:                                @ %ZMEMCPY.exit8
	add	r3, r5, #956
	add	r3, r3, #6144
	cmp	r2, r3
	bhi	.LBB71_12
@ BB#11:
	sub	r2, r2, r1
	bic	r3, r2, #3
	add	r2, r9, #1328
	add	r3, r2, r3
	str	r3, [r9, #76]
	ldr	r3, [r5, #80]
	sub	r3, r3, r1
	bic	r3, r3, #3
	add	r2, r2, r3
	str	r2, [r9, #80]
.LBB71_12:
	ldr	r2, [r5, #108]
	cmp	r0, #0
	sub	r1, r2, r1
	bic	r1, r1, #3
	add	r1, r9, r1
	add	r1, r1, #1328
	str	r1, [r9, #108]
	beq	.LBB71_15
@ BB#13:
	ldr	r2, [r5, #36]
	mov	r3, #1
	ldr	r1, [r5, #52]
	lsl	r2, r3, r2
	mov	r3, r0
.LBB71_14:                              @ %.lr.ph.i3
                                        @ =>This Inner Loop Header: Depth=1
	ldrb	r7, [r1], #1
	subs	r2, r2, #1
	strb	r7, [r3], #1
	bne	.LBB71_14
.LBB71_15:                              @ %ZMEMCPY.exit4
	mov	r8, #0
	str	r0, [r9, #52]
	str	r9, [r10, #28]
.LBB71_16:
	mov	r0, r8
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.LBB71_17:
	ldr	r2, [r7, #36]
	ldr	r0, [r7, #40]
	mov	r1, r9
	blx	r2
	mov	r0, r8
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.Ltmp71:
	.size	inflateCopy, .Ltmp71-inflateCopy

	.globl	inflateUndermine
	.align	2
	.type	inflateUndermine,%function
inflateUndermine:                       @ @inflateUndermine
@ BB#0:
	mov	r1, r0
	mvn	r0, #1
	cmp	r1, #0
	bxeq	lr
	ldr	r1, [r1, #28]
	cmp	r1, #0
	movne	r0, #7104
	movne	r2, #1
	strne	r2, [r1, r0]
	mvnne	r0, #2
	bx	lr
.Ltmp72:
	.size	inflateUndermine, .Ltmp72-inflateUndermine

	.globl	inflateMark
	.align	2
	.type	inflateMark,%function
inflateMark:                            @ @inflateMark
@ BB#0:
	mov	r1, r0
	cmp	r1, #0
	ldrne	r1, [r1, #28]
	mov	r0, #16711680
	orr	r0, r0, #4278190080
	cmpne	r1, #0
	beq	.LBB73_5
@ BB#1:
	mov	r0, #964
	orr	r0, r0, #6144
	mov	r2, r1
	ldr	r3, [r2], r0
	ldr	r0, [r2]
	cmp	r3, #24
	lsl	r0, r0, #16
	bne	.LBB73_3
@ BB#2:
	mov	r2, #968
	orr	r2, r2, #6144
	ldr	r2, [r1, r2]
	ldr	r1, [r1, #64]
	sub	r2, r2, r1
	b	.LBB73_4
.LBB73_3:
	mov	r2, #0
	cmp	r3, #15
	ldreq	r2, [r1, #64]
.LBB73_4:
	add	r0, r2, r0
.LBB73_5:
	bx	lr
.Ltmp73:
	.size	inflateMark, .Ltmp73-inflateMark

	.globl	uncompress
	.align	2
	.type	uncompress,%function
uncompress:                             @ @uncompress
@ BB#0:                                 @ %._crit_edge.i.i
	push	{r4, r5, r6, lr}
	sub	sp, sp, #56
	mov	r6, r1
	ldr	r1, .LCPI74_0
	stm	sp, {r2, r3}
	str	r0, [sp, #12]
	ldr	r0, [r6]
	ldr	r4, [r1]
	ldr	r2, .LCPI74_1
	ldr	r3, .LCPI74_2
	str	r0, [sp, #16]
	mov	r0, #0
	str	r0, [sp, #24]
	str	r3, [sp, #32]
	str	r0, [sp, #40]
	str	r2, [sp, #36]
	add	r2, r4, #207
	add	r2, r2, #6912
	mvn	r5, #3
	bic	r2, r2, #3
	str	r2, [r1]
	cmp	r4, #0
	beq	.LBB74_3
@ BB#1:
	str	r4, [sp, #28]
	str	r0, [r4, #52]
	mov	r0, sp
	mov	r1, #15
	bl	inflateReset2
	mov	r5, r0
	cmp	r5, #0
	beq	.LBB74_4
@ BB#2:
	ldr	r2, [sp, #36]
	ldr	r0, [sp, #40]
	mov	r1, r4
	blx	r2
	mov	r0, #0
	str	r0, [sp, #28]
.LBB74_3:                               @ %inflateEnd.exit6
	mov	r0, r5
	add	sp, sp, #56
	pop	{r4, r5, r6, pc}
.LBB74_4:
	mov	r0, sp
	mov	r1, #4
	bl	inflate
	mov	r4, r0
	cmp	r4, #1
	bne	.LBB74_9
@ BB#5:
	ldr	r0, [sp, #20]
	mvn	r5, #1
	str	r0, [r6]
	ldr	r1, [sp, #28]
	cmp	r1, #0
	ldrne	r3, [sp, #36]
	cmpne	r3, #0
	beq	.LBB74_3
@ BB#6:
	ldr	r2, [r1, #52]
	cmp	r2, #0
	beq	.LBB74_8
@ BB#7:
	ldr	r0, [sp, #40]
	mov	r1, r2
	blx	r3
	ldr	r1, [sp, #28]
	ldr	r3, [sp, #36]
.LBB74_8:                               @ %._crit_edge.i4
	ldr	r0, [sp, #40]
	blx	r3
	mov	r5, #0
	str	r5, [sp, #28]
	b	.LBB74_3
.LBB74_9:
	ldr	r1, [sp, #28]
	cmp	r1, #0
	ldrne	r3, [sp, #36]
	cmpne	r3, #0
	beq	.LBB74_13
@ BB#10:
	ldr	r2, [r1, #52]
	cmp	r2, #0
	beq	.LBB74_12
@ BB#11:
	ldr	r0, [sp, #40]
	mov	r1, r2
	blx	r3
	ldr	r1, [sp, #28]
	ldr	r3, [sp, #36]
.LBB74_12:                              @ %._crit_edge.i
	ldr	r0, [sp, #40]
	blx	r3
	mov	r0, #0
	str	r0, [sp, #28]
.LBB74_13:                              @ %inflateEnd.exit
	mvn	r5, #2
	cmp	r4, #2
	beq	.LBB74_3
@ BB#14:                                @ %inflateEnd.exit
	cmn	r4, #5
	bne	.LBB74_16
@ BB#15:
	ldr	r0, [sp, #4]
	cmp	r0, #0
	movne	r5, r4
	b	.LBB74_3
.LBB74_16:
	mov	r5, r4
	b	.LBB74_3
	.align	2
@ BB#17:
.LCPI74_0:
	.long	heap_offset
.LCPI74_1:
	.long	zcfree
.LCPI74_2:
	.long	zcalloc
.Ltmp74:
	.size	uncompress, .Ltmp74-uncompress

	.globl	inflate_table
	.align	2
	.type	inflate_table,%function
inflate_table:                          @ @inflate_table
@ BB#0:                                 @ %.preheader208
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	sub	sp, sp, #128
	mov	r4, r0
	str	r1, [sp, #36]           @ 4-byte Spill
	mov	r1, #0
	str	r1, [sp, #124]
	str	r1, [sp, #120]
	str	r1, [sp, #116]
	str	r1, [sp, #112]
	str	r1, [sp, #108]
	str	r1, [sp, #104]
	str	r1, [sp, #100]
	str	r3, [sp, #12]           @ 4-byte Spill
	str	r1, [sp, #96]
	cmp	r2, #0
	beq	.LBB75_3
@ BB#1:
	ldr	r1, [sp, #36]           @ 4-byte Reload
	add	r0, sp, #96
	mov	r3, r2
.LBB75_2:                               @ %.lr.ph210
                                        @ =>This Inner Loop Header: Depth=1
	ldrh	r7, [r1], #2
	subs	r3, r3, #1
	add	r7, r0, r7, lsl #1
	ldrh	r6, [r7]
	add	r6, r6, #1
	strh	r6, [r7]
	bne	.LBB75_2
.LBB75_3:                               @ %._crit_edge211
	ldr	r7, [sp, #164]
	add	r1, sp, #96
	add	r0, sp, #66
	add	r1, r1, #30
	ldr	r6, [r7]
	mov	r5, #16
.LBB75_4:                               @ =>This Inner Loop Header: Depth=1
	cmp	r5, #1
	beq	.LBB75_12
@ BB#5:                                 @   in Loop: Header=BB75_4 Depth=1
	ldrh	r3, [r1], #-2
	sub	r5, r5, #1
	cmp	r3, #0
	beq	.LBB75_4
@ BB#6:                                 @ %.preheader206
	cmp	r6, r5
	add	r1, sp, #96
	movhi	r6, r5
	orr	r1, r1, #2
	mov	r3, #1
.LBB75_7:                               @ =>This Inner Loop Header: Depth=1
	mov	r9, r3
	cmp	r9, r5
	bhs	.LBB75_9
@ BB#8:                                 @   in Loop: Header=BB75_7 Depth=1
	ldrh	r7, [r1], #2
	add	r3, r9, #1
	cmp	r7, #0
	beq	.LBB75_7
.LBB75_9:
	add	r1, sp, #96
	mov	r7, #1
	cmp	r6, r9
	orr	r3, r1, #2
	mov	r1, r7
	mvn	r12, #0
	movlo	r6, r9
	str	r5, [sp, #48]           @ 4-byte Spill
	str	r6, [sp, #60]           @ 4-byte Spill
.LBB75_10:                              @ =>This Inner Loop Header: Depth=1
	cmp	r1, #15
	bhi	.LBB75_14
@ BB#11:                                @   in Loop: Header=BB75_10 Depth=1
	ldrh	r6, [r3], #2
	add	r1, r1, #1
	rsb	r7, r6, r7, lsl #1
	cmp	r7, #0
	bge	.LBB75_10
	b	.LBB75_13
.LBB75_12:
	ldr	r3, [sp, #12]           @ 4-byte Reload
	mov	r12, #0
	ldr	r0, [r3]
	add	r1, r0, #4
	str	r1, [r3]
	mov	r1, #320
	strh	r12, [r0, #2]
	strh	r1, [r0]
	ldr	r0, [r3]
	add	r2, r0, #4
	str	r2, [r3]
	strh	r12, [r0, #2]
	strh	r1, [r0]
	mov	r1, #1
	str	r1, [r7]
.LBB75_13:                              @ %.loopexit
	mov	r0, r12
	add	sp, sp, #128
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
.LBB75_14:
	cmp	r7, #1
	blt	.LBB75_17
@ BB#15:
	mvn	r12, #0
	cmp	r4, #0
	beq	.LBB75_13
@ BB#16:
	ldr	r1, [sp, #48]           @ 4-byte Reload
	cmp	r1, #1
	bne	.LBB75_13
.LBB75_17:                              @ %.preheader
	ldrh	r3, [sp, #98]
	ldrh	r7, [sp, #100]
	ldrh	lr, [sp, #102]
	mov	r1, #0
	ldrh	r12, [sp, #104]
	strh	r1, [r0]
	strh	r3, [r0, #2]
	add	r3, r7, r3
	strh	r3, [r0, #4]
	add	r3, lr, r3
	ldrh	lr, [sp, #106]
	strh	r3, [r0, #6]
	add	r3, r12, r3
	ldrh	r12, [sp, #108]
	strh	r3, [r0, #8]
	add	r3, lr, r3
	ldrh	lr, [sp, #110]
	strh	r3, [r0, #10]
	add	r3, r12, r3
	ldrh	r12, [sp, #112]
	strh	r3, [r0, #12]
	add	r3, lr, r3
	ldrh	lr, [sp, #114]
	strh	r3, [r0, #14]
	add	r3, r12, r3
	ldrh	r12, [sp, #116]
	strh	r3, [r0, #16]
	add	r3, lr, r3
	ldrh	lr, [sp, #118]
	strh	r3, [r0, #18]
	add	r3, r12, r3
	ldrh	r12, [sp, #120]
	strh	r3, [r0, #20]
	add	r3, lr, r3
	ldrh	lr, [sp, #122]
	strh	r3, [r0, #22]
	add	r3, r12, r3
	ldrh	r12, [sp, #124]
	strh	r3, [r0, #24]
	add	r3, lr, r3
	strh	r3, [r0, #26]
	add	r3, r12, r3
	strh	r3, [r0, #28]
	cmp	r2, #0
	beq	.LBB75_22
@ BB#18:
	ldr	r3, [sp, #36]           @ 4-byte Reload
	add	r0, sp, #64
.LBB75_19:                              @ %.lr.ph200
                                        @ =>This Inner Loop Header: Depth=1
	ldrh	r7, [r3]
	cmp	r7, #0
	beq	.LBB75_21
@ BB#20:                                @   in Loop: Header=BB75_19 Depth=1
	add	r7, r0, r7, lsl #1
	ldr	r6, [sp, #168]
	ldrh	r5, [r7]
	add	r6, r6, r5, lsl #1
	add	r5, r5, #1
	strh	r5, [r7]
	strh	r1, [r6]
.LBB75_21:                              @   in Loop: Header=BB75_19 Depth=1
	add	r1, r1, #1
	add	r3, r3, #2
	cmp	r2, r1
	bne	.LBB75_19
.LBB75_22:                              @ %._crit_edge201
	cmp	r4, #1
	bne	.LBB75_25
@ BB#23:
	ldr	r0, [sp, #60]           @ 4-byte Reload
	mov	r12, #1
	lsl	r0, r12, r0
	lsr	r1, r0, #2
	str	r0, [sp, #16]           @ 4-byte Spill
	ldr	r0, .LCPI75_0
	cmp	r1, #212
	bhi	.LBB75_13
@ BB#24:
	ldr	r2, [sp, #60]           @ 4-byte Reload
	mov	r1, #256
	ldr	r3, [sp, #12]           @ 4-byte Reload
	str	r1, [sp, #32]           @ 4-byte Spill
	mvn	r1, #0
	add	r1, r1, r12, lsl r2
	str	r1, [sp, #28]           @ 4-byte Spill
	ldr	r1, .LCPI75_1
	ldr	r2, .LCPI75_2
	ldr	r3, [r3]
	add	r1, r1, r0
	add	r0, r2, r0
	str	r3, [sp, #56]           @ 4-byte Spill
	str	r1, [sp, #24]           @ 4-byte Spill
	str	r0, [sp, #20]           @ 4-byte Spill
	mov	r2, #0
	mov	r3, r12
	b	.LBB75_30
.LBB75_25:                              @ %._crit_edge201
	cmp	r4, #0
	bne	.LBB75_27
@ BB#26:                                @ %.thread172
	ldr	r2, [sp, #60]           @ 4-byte Reload
	mov	r0, #1
	mvn	r1, #0
	add	r1, r1, r0, lsl r2
	lsl	r0, r0, r2
	str	r0, [sp, #16]           @ 4-byte Spill
	mov	r0, #19
	str	r0, [sp, #32]           @ 4-byte Spill
	ldr	r0, [sp, #12]           @ 4-byte Reload
	str	r1, [sp, #28]           @ 4-byte Spill
	ldr	r1, [sp, #168]
	mov	r2, #0
	ldr	r0, [r0]
	str	r1, [sp, #20]           @ 4-byte Spill
	str	r1, [sp, #24]           @ 4-byte Spill
	str	r0, [sp, #56]           @ 4-byte Spill
	mov	r3, r2
	b	.LBB75_30
.LBB75_27:
	ldr	r0, [sp, #60]           @ 4-byte Reload
	mov	r2, #1
	mvn	r1, #0
	mov	r3, #0
	add	r1, r1, r2, lsl r0
	str	r1, [sp, #28]           @ 4-byte Spill
	mvn	r1, #0
	str	r1, [sp, #32]           @ 4-byte Spill
	lsl	r1, r2, r0
	ldr	r0, .LCPI75_3
	cmp	r4, #2
	str	r0, [sp, #24]           @ 4-byte Spill
	ldr	r0, .LCPI75_4
	str	r0, [sp, #20]           @ 4-byte Spill
	ldr	r0, [sp, #12]           @ 4-byte Reload
	ldr	r0, [r0]
	str	r0, [sp, #56]           @ 4-byte Spill
	bne	.LBB75_29
@ BB#28:
	lsr	r0, r1, #4
	mov	r12, r2
	str	r1, [sp, #16]           @ 4-byte Spill
	cmp	r0, #36
	bhi	.LBB75_13
	b	.LBB75_30
.LBB75_29:
	str	r1, [sp, #16]           @ 4-byte Spill
	mov	r2, r3
.LBB75_30:                              @ %.thread.preheader
	ldr	lr, [sp, #60]           @ 4-byte Reload
	mov	r1, #0
	mov	r10, #0
	mov	r8, r1
	mov	r4, r1
	mvn	r0, #0
	str	r3, [sp, #4]            @ 4-byte Spill
	str	r2, [sp, #8]            @ 4-byte Spill
	str	r0, [sp, #44]           @ 4-byte Spill
	b	.LBB75_32
.LBB75_31:                              @   in Loop: Header=BB75_32 Depth=1
	ldr	r1, [sp, #12]           @ 4-byte Reload
	ldr	r0, [sp, #52]           @ 4-byte Reload
	ldr	r7, [sp, #56]           @ 4-byte Reload
	ldr	r3, [sp, #60]           @ 4-byte Reload
	add	r7, r7, r0, lsl #2
	ldr	r0, [r1]
	str	r7, [sp, #56]           @ 4-byte Spill
	str	r2, [sp, #44]           @ 4-byte Spill
	strb	lr, [r0, r2, lsl #2]
	ldr	r0, [r1]
	mov	r4, r11
	add	r0, r0, r2, lsl #2
	strb	r3, [r0, #1]
	ldr	r1, [r1]
	add	r0, r1, r2, lsl #2
	sub	r1, r7, r1
	lsr	r1, r1, #2
	strh	r1, [r0, #2]
.LBB75_32:                              @ %.thread.outer
                                        @ =>This Loop Header: Depth=1
                                        @     Child Loop BB75_33 Depth 2
                                        @       Child Loop BB75_39 Depth 3
                                        @       Child Loop BB75_41 Depth 3
                                        @     Child Loop BB75_49 Depth 2
	mov	r0, #0
	mov	r1, #1
	sub	r0, r0, r1, lsl lr
	str	r0, [sp, #40]           @ 4-byte Spill
	lsl	r0, r1, lr
	str	r0, [sp, #52]           @ 4-byte Spill
.LBB75_33:                              @ %.thread
                                        @   Parent Loop BB75_32 Depth=1
                                        @ =>  This Loop Header: Depth=2
                                        @       Child Loop BB75_39 Depth 3
                                        @       Child Loop BB75_41 Depth 3
	ldr	r0, [sp, #168]
	ldr	r1, [sp, #32]           @ 4-byte Reload
	add	r0, r0, r10, lsl #1
	sub	r2, r9, r8
	ldrh	r7, [r0]
	cmp	r7, r1
	bge	.LBB75_35
@ BB#34:                                @   in Loop: Header=BB75_33 Depth=2
	mov	r0, #0
	b	.LBB75_38
.LBB75_35:                              @   in Loop: Header=BB75_33 Depth=2
	ble	.LBB75_37
@ BB#36:                                @   in Loop: Header=BB75_33 Depth=2
	ldr	r0, [sp, #20]           @ 4-byte Reload
	add	r3, r0, r7, lsl #1
	ldr	r0, [sp, #24]           @ 4-byte Reload
	ldrb	r0, [r0, r7, lsl #1]
	ldrh	r7, [r3]
	b	.LBB75_38
.LBB75_37:                              @   in Loop: Header=BB75_33 Depth=2
	mov	r7, #0
	mov	r0, #96
.LBB75_38:                              @   in Loop: Header=BB75_33 Depth=2
	ldr	r1, [sp, #52]           @ 4-byte Reload
	mov	r12, #1
	add	r3, r1, r4, lsr r8
	mov	r1, #1
	lsl	r6, r1, r2
	sub	r5, r3, r1, lsl r2
	lsl	r2, r2, #8
	mov	r1, #0
	sub	r3, r1, r6, lsl #2
	ldr	r1, [sp, #56]           @ 4-byte Reload
	uxth	r2, r2
	orr	r0, r0, r2
	orr	r0, r0, r7, lsl #16
	ldr	r7, [sp, #40]           @ 4-byte Reload
	add	r5, r1, r5, lsl #2
.LBB75_39:                              @   Parent Loop BB75_32 Depth=1
                                        @     Parent Loop BB75_33 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	lsr	r1, r0, #16
	strh	r0, [r5]
	strh	r1, [r5, #2]
	add	r5, r5, r3
	adds	r7, r7, r6
	bne	.LBB75_39
@ BB#40:                                @   in Loop: Header=BB75_33 Depth=2
	sub	r0, r9, #1
	lsl	r3, r12, r0
.LBB75_41:                              @   Parent Loop BB75_32 Depth=1
                                        @     Parent Loop BB75_33 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	mov	r0, r3
	lsr	r3, r0, #1
	tst	r0, r4
	bne	.LBB75_41
@ BB#42:                                @   in Loop: Header=BB75_33 Depth=2
	cmp	r0, #0
	subne	r1, r0, #1
	mov	r11, #0
	andne	r1, r1, r4
	addne	r11, r1, r0
	add	r0, sp, #96
	add	r0, r0, r9, lsl #1
	add	r10, r10, #1
	ldrh	r1, [r0]
	sub	r3, r1, #1
	strh	r3, [r0]
	mov	r0, #255
	orr	r0, r0, #65280
	tst	r3, r0
	bne	.LBB75_45
@ BB#43:                                @   in Loop: Header=BB75_33 Depth=2
	ldr	r0, [sp, #48]           @ 4-byte Reload
	cmp	r9, r0
	beq	.LBB75_53
@ BB#44:                                @   in Loop: Header=BB75_33 Depth=2
	ldr	r0, [sp, #168]
	ldr	r1, [sp, #36]           @ 4-byte Reload
	add	r0, r0, r10, lsl #1
	ldrh	r0, [r0]
	add	r0, r1, r0, lsl #1
	ldrh	r9, [r0]
.LBB75_45:                              @   in Loop: Header=BB75_33 Depth=2
	ldr	r0, [sp, #60]           @ 4-byte Reload
	mov	r4, r11
	cmp	r9, r0
	bls	.LBB75_33
@ BB#46:                                @   in Loop: Header=BB75_33 Depth=2
	ldr	r0, [sp, #28]           @ 4-byte Reload
	ldr	r1, [sp, #44]           @ 4-byte Reload
	mov	r4, r11
	and	r2, r11, r0
	cmp	r2, r1
	beq	.LBB75_33
@ BB#47:                                @   in Loop: Header=BB75_32 Depth=1
	ldr	r0, [sp, #60]           @ 4-byte Reload
	cmp	r8, #0
	ldr	r7, [sp, #48]           @ 4-byte Reload
	ldr	r4, [sp, #8]            @ 4-byte Reload
	ldr	r5, [sp, #4]            @ 4-byte Reload
	moveq	r8, r0
	sub	lr, r9, r8
	cmp	r9, r7
	bhs	.LBB75_52
@ BB#48:                                @ %.lr.ph
                                        @   in Loop: Header=BB75_32 Depth=1
	add	r0, sp, #96
	add	r0, r0, r9, lsl #1
	lsl	r3, r12, lr
	mov	r6, r9
.LBB75_49:                              @   Parent Loop BB75_32 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldrh	r1, [r0]
	sub	r3, r3, r1
	cmp	r3, #1
	blt	.LBB75_51
@ BB#50:                                @   in Loop: Header=BB75_49 Depth=2
	lsl	r3, r3, #1
	add	r6, r6, #1
	add	r0, r0, #2
	cmp	r6, r7
	blo	.LBB75_49
.LBB75_51:                              @ %.split184.loopexit_crit_edge
                                        @   in Loop: Header=BB75_32 Depth=1
	sub	lr, r6, r8
.LBB75_52:                              @ %split184
                                        @   in Loop: Header=BB75_32 Depth=1
	ldr	r1, [sp, #16]           @ 4-byte Reload
	mov	r12, #1
	add	r1, r1, r12, lsl lr
	lsr	r0, r1, #4
	lsr	r3, r1, #2
	cmp	r0, #36
	mov	r0, #0
	str	r1, [sp, #16]           @ 4-byte Spill
	movhi	r0, #1
	cmp	r3, #212
	mov	r1, #0
	movhi	r1, #1
	tst	r5, r1
	andseq	r0, r4, r0
	bne	.LBB75_13
	b	.LBB75_31
.LBB75_53:
	cmp	r11, #0
	beq	.LBB75_55
@ BB#54:
	orr	r1, r2, #64
	ldr	r2, [sp, #56]           @ 4-byte Reload
	lsl	r0, r11, #2
	strh	r1, [r2, r0]!
	mov	r0, #0
	strh	r0, [r2, #2]
.LBB75_55:
	ldr	r1, [sp, #12]           @ 4-byte Reload
	ldr	r2, [sp, #16]           @ 4-byte Reload
	mov	r12, #0
	ldr	r0, [r1]
	add	r0, r0, r2, lsl #2
	str	r0, [r1]
	ldr	r0, [sp, #164]
	ldr	r1, [sp, #60]           @ 4-byte Reload
	str	r1, [r0]
	b	.LBB75_13
	.align	2
@ BB#56:
.LCPI75_0:
	.long	4294966782              @ 0xfffffdfe
.LCPI75_1:
	.long	inflate_table.lext
.LCPI75_2:
	.long	inflate_table.lbase
.LCPI75_3:
	.long	inflate_table.dext
.LCPI75_4:
	.long	inflate_table.dbase
.Ltmp75:
	.size	inflate_table, .Ltmp75-inflate_table

	.globl	inflate_fast
	.align	2
	.type	inflate_fast,%function
inflate_fast:                           @ @inflate_fast
@ BB#0:
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	sub	sp, sp, #96
	ldr	r6, [r0, #28]
	mov	r8, #1
	mvn	r10, #0
	str	r0, [sp]                @ 4-byte Spill
	ldr	r3, [r6, #88]
	str	r6, [sp, #4]            @ 4-byte Spill
	ldr	r2, [r6, #84]
	mvn	r1, r1
	add	r3, r10, r8, lsl r3
	str	r3, [sp, #68]           @ 4-byte Spill
	ldr	r4, .LCPI76_0
	ldr	r3, [r0, #4]
	ldr	r5, [r0, #16]
	ldr	r11, [r0]
	str	r3, [sp, #84]           @ 4-byte Spill
	ldr	r3, [r0, #12]
	add	r0, r10, r8, lsl r2
	add	r2, r5, r3
	str	r0, [sp, #64]           @ 4-byte Spill
	add	r0, r2, r4
	add	r1, r5, r1
	str	r0, [sp, #76]           @ 4-byte Spill
	ldr	r0, [r6, #44]
	ldr	lr, [r6, #48]
	ldr	r2, [r6, #40]
	add	r5, r3, r1
	ldr	r7, [r6, #52]
	add	r1, r5, #1
	str	r0, [sp, #60]           @ 4-byte Spill
	sub	r0, r1, lr
	sub	r1, r2, r5
	str	r0, [sp, #52]           @ 4-byte Spill
	add	r0, r7, r1
	str	r0, [sp, #48]           @ 4-byte Spill
	ldr	r0, [sp, #84]           @ 4-byte Reload
	add	r1, r6, #7104
	str	r1, [sp, #40]           @ 4-byte Spill
	add	r0, r0, r11
	sub	r1, r5, lr
	sub	r0, r0, #6
	str	r1, [sp, #36]           @ 4-byte Spill
	sub	r1, r2, #1
	str	r0, [sp, #72]           @ 4-byte Spill
	ldr	r0, [r6, #80]
	str	r1, [sp, #32]           @ 4-byte Spill
	add	r1, r1, lr
	str	r1, [sp, #28]           @ 4-byte Spill
	add	r1, r7, r2
	str	r1, [sp, #24]           @ 4-byte Spill
	add	r1, r7, lr
	str	r0, [sp, #44]           @ 4-byte Spill
	ldr	r0, [r6, #76]
	str	r1, [sp, #20]           @ 4-byte Spill
	sub	r1, lr, #1
	sub	r9, r11, #1
	str	r1, [sp, #16]           @ 4-byte Spill
	sub	r1, r7, #1
	ldr	r4, [r6, #60]
	ldr	r11, [r6, #56]
	str	r1, [sp, #12]           @ 4-byte Spill
	rsb	r1, r5, #0
	str	r1, [sp, #8]            @ 4-byte Spill
	sub	r1, r5, #1
	str	r5, [sp, #92]           @ 4-byte Spill
	sub	r12, r3, #1
	mov	r5, r0
	str	lr, [sp, #56]           @ 4-byte Spill
	str	r7, [sp, #88]           @ 4-byte Spill
	str	r0, [sp, #84]           @ 4-byte Spill
	str	r1, [sp, #80]           @ 4-byte Spill
	b	.LBB76_52
.LBB76_1:                               @   in Loop: Header=BB76_52 Depth=1
	ands	r5, r2, #15
	bne	.LBB76_3
@ BB#2:                                 @   in Loop: Header=BB76_52 Depth=1
	mov	r2, r11
	b	.LBB76_4
.LBB76_3:                               @   in Loop: Header=BB76_52 Depth=1
	cmp	r4, r5
	ldrblo	r0, [r9, #1]!
	addlo	r11, r11, r0, lsl r4
	add	r0, r10, r8, lsl r5
	addlo	r4, r4, #8
	and	r0, r11, r0
	lsr	r2, r11, r5
	add	lr, r0, lr
	sub	r4, r4, r5
.LBB76_4:                               @   in Loop: Header=BB76_52 Depth=1
	ldr	r1, [sp, #44]           @ 4-byte Reload
	cmp	r4, #14
	bhi	.LBB76_6
@ BB#5:                                 @   in Loop: Header=BB76_52 Depth=1
	ldrb	r0, [r9, #1]
	add	r3, r4, #8
	add	r0, r2, r0, lsl r4
	ldrb	r2, [r9, #2]!
	add	r4, r4, #16
	add	r2, r0, r2, lsl r3
.LBB76_6:                               @   in Loop: Header=BB76_52 Depth=1
	ldr	r0, [sp, #68]           @ 4-byte Reload
	and	r0, r2, r0
	b	.LBB76_8
.LBB76_7:                               @   in Loop: Header=BB76_8 Depth=2
	uxtb	r0, r5
	add	r0, r10, r8, lsl r0
	and	r0, r2, r0
	add	r0, r0, r7
.LBB76_8:                               @   Parent Loop BB76_52 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	lsl	r0, r0, #2
	mov	r5, r1
	ldrh	r0, [r5, r0]!
	ldrh	r3, [r5, #2]
	orr	r5, r0, r3, lsl #16
	lsr	r0, r5, #8
	lsr	r7, r5, #16
	uxtb	r0, r0
	lsr	r2, r2, r0
	sub	r4, r4, r0
	tst	r5, #16
	bne	.LBB76_10
@ BB#9:                                 @ %.lr.ph227
                                        @   in Loop: Header=BB76_8 Depth=2
	tst	r5, #64
	bne	.LBB76_67
	b	.LBB76_7
.LBB76_10:                              @ %._crit_edge228
                                        @   in Loop: Header=BB76_52 Depth=1
	and	r10, r5, #15
	mvn	r1, #0
	cmp	r4, r10
	bhs	.LBB76_14
@ BB#11:                                @   in Loop: Header=BB76_52 Depth=1
	mov	r5, r9
	ldrb	r0, [r5, #1]!
	add	r2, r2, r0, lsl r4
	add	r0, r4, #8
	cmp	r0, r10
	bhs	.LBB76_13
@ BB#12:                                @   in Loop: Header=BB76_52 Depth=1
	ldrb	r3, [r9, #2]!
	add	r4, r4, #16
	add	r2, r2, r3, lsl r0
	b	.LBB76_14
.LBB76_13:                              @   in Loop: Header=BB76_52 Depth=1
	mov	r9, r5
	mov	r4, r0
.LBB76_14:                              @   in Loop: Header=BB76_52 Depth=1
	add	r0, r1, r8, lsl r10
	and	r5, r2, r0
	ldr	r0, [sp, #92]           @ 4-byte Reload
	lsr	r11, r2, r10
	add	r8, r5, r7
	sub	r0, r12, r0
	sub	r4, r4, r10
	cmp	r8, r0
	bls	.LBB76_21
@ BB#15:                                @   in Loop: Header=BB76_52 Depth=1
	ldr	r1, [sp, #60]           @ 4-byte Reload
	sub	r2, r8, r0
	cmp	r2, r1
	bls	.LBB76_17
@ BB#16:                                @   in Loop: Header=BB76_52 Depth=1
	ldr	r0, [sp, #40]           @ 4-byte Reload
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.LBB76_68
.LBB76_17:                              @   in Loop: Header=BB76_52 Depth=1
	ldr	r1, [sp, #56]           @ 4-byte Reload
	cmp	r1, #0
	bne	.LBB76_27
@ BB#18:                                @   in Loop: Header=BB76_52 Depth=1
	cmp	r2, lr
	bhs	.LBB76_35
@ BB#19:                                @   in Loop: Header=BB76_52 Depth=1
	ldr	r1, [sp, #24]           @ 4-byte Reload
	sub	r5, r8, r12
	sub	lr, lr, r2
	add	r6, r12, #1
.LBB76_20:                              @   Parent Loop BB76_52 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldrb	r0, [r1, -r2]
	subs	r2, r2, #1
	strb	r0, [r6], #1
	bne	.LBB76_20
	b	.LBB76_40
.LBB76_21:                              @   in Loop: Header=BB76_52 Depth=1
	sub	r5, r12, r8
	mov	r7, #0
	mov	r2, #0
.LBB76_22:                              @   Parent Loop BB76_52 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	sub	r0, r5, r7
	add	r6, r12, r2
	ldrb	r3, [r0, #1]
	sub	r7, r7, #3
	add	r2, r2, #3
	strb	r3, [r6, #1]
	ldrb	r3, [r0, #2]
	strb	r3, [r6, #2]
	ldrb	r0, [r0, #3]
	strb	r0, [r6, #3]
	add	r6, lr, r7
	cmp	r6, #2
	bhi	.LBB76_22
@ BB#23:                                @   in Loop: Header=BB76_52 Depth=1
	mov	r8, #1
	mvn	r10, #0
	cmp	r6, #0
	bne	.LBB76_25
@ BB#24:                                @   in Loop: Header=BB76_52 Depth=1
	add	r12, r12, r2
	ldr	r5, [sp, #84]           @ 4-byte Reload
	b	.LBB76_60
.LBB76_25:                              @   in Loop: Header=BB76_52 Depth=1
	sub	r0, r5, r7
	add	r12, r12, r2
	ldrb	r7, [r0, #1]
	mov	r2, r12
	cmp	r6, #2
	strb	r7, [r2, #1]!
	blo	.LBB76_36
@ BB#26:                                @   in Loop: Header=BB76_52 Depth=1
	ldrb	r0, [r0, #2]
	ldr	r5, [sp, #84]           @ 4-byte Reload
	strb	r0, [r12, #2]!
	b	.LBB76_60
.LBB76_27:                              @   in Loop: Header=BB76_52 Depth=1
	cmp	r1, r2
	bhs	.LBB76_37
@ BB#28:                                @   in Loop: Header=BB76_52 Depth=1
	sub	r0, r2, r1
	cmp	r0, lr
	bhs	.LBB76_42
@ BB#29:                                @   in Loop: Header=BB76_52 Depth=1
	ldr	r3, [sp, #48]           @ 4-byte Reload
	sub	lr, lr, r0
	sub	r0, r12, r7
	sub	r0, r0, r5
	add	r0, r3, r0
	add	r6, r0, r1
	ldr	r0, [sp, #8]            @ 4-byte Reload
	sub	r2, r8, r12
	add	r0, r0, r12
	sub	r0, r0, r7
	sub	r0, r0, r5
	add	r5, r1, r0
	add	r7, r12, #1
	mov	r0, #0
.LBB76_30:                              @   Parent Loop BB76_52 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldrb	r3, [r6, -r0]
	strb	r3, [r7, -r0]
	sub	r0, r0, #1
	cmp	r5, r0
	bne	.LBB76_30
@ BB#31:                                @   in Loop: Header=BB76_52 Depth=1
	cmp	r1, lr
	bhs	.LBB76_51
@ BB#32:                                @   in Loop: Header=BB76_52 Depth=1
	ldr	r0, [sp, #52]           @ 4-byte Reload
	ldr	r6, [sp, #88]           @ 4-byte Reload
	sub	lr, lr, r1
	add	r0, r12, r0
	add	r5, r0, r2
	mov	r7, r1
.LBB76_33:                              @   Parent Loop BB76_52 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldrb	r0, [r6], #1
	subs	r7, r7, #1
	strb	r0, [r5], #1
	bne	.LBB76_33
@ BB#34:                                @   in Loop: Header=BB76_52 Depth=1
	ldr	r0, [sp, #92]           @ 4-byte Reload
	ldr	r1, [sp, #80]           @ 4-byte Reload
	add	r0, r0, r2
	add	r0, r12, r0
	add	r2, r1, r2
	b	.LBB76_41
.LBB76_35:                              @   in Loop: Header=BB76_52 Depth=1
	ldr	r0, [sp, #32]           @ 4-byte Reload
	b	.LBB76_44
.LBB76_36:                              @   in Loop: Header=BB76_52 Depth=1
	mov	r12, r2
	ldr	r5, [sp, #84]           @ 4-byte Reload
	b	.LBB76_60
.LBB76_37:                              @   in Loop: Header=BB76_52 Depth=1
	cmp	r2, lr
	bhs	.LBB76_43
@ BB#38:                                @   in Loop: Header=BB76_52 Depth=1
	ldr	r1, [sp, #20]           @ 4-byte Reload
	sub	r5, r8, r12
	sub	lr, lr, r2
	add	r6, r12, #1
.LBB76_39:                              @   Parent Loop BB76_52 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldrb	r0, [r1, -r2]
	subs	r2, r2, #1
	strb	r0, [r6], #1
	bne	.LBB76_39
.LBB76_40:                              @   in Loop: Header=BB76_52 Depth=1
	ldr	r0, [sp, #92]           @ 4-byte Reload
	ldr	r1, [sp, #80]           @ 4-byte Reload
	add	r0, r0, r5
	add	r0, r12, r0
	add	r2, r1, r5
.LBB76_41:                              @   in Loop: Header=BB76_52 Depth=1
	rsb	r3, r8, #1
	add	r2, r2, r3
	add	r2, r12, r2
	mov	r12, r0
	b	.LBB76_45
.LBB76_42:                              @   in Loop: Header=BB76_52 Depth=1
	ldr	r0, [sp, #28]           @ 4-byte Reload
	b	.LBB76_44
.LBB76_43:                              @   in Loop: Header=BB76_52 Depth=1
	ldr	r0, [sp, #16]           @ 4-byte Reload
.LBB76_44:                              @   in Loop: Header=BB76_52 Depth=1
	ldr	r1, [sp, #88]           @ 4-byte Reload
	sub	r0, r0, r2
	add	r2, r1, r0
.LBB76_45:                              @ %.preheader
                                        @   in Loop: Header=BB76_52 Depth=1
	mov	r5, #0
	mov	r6, #0
	cmp	lr, #3
	blo	.LBB76_48
.LBB76_46:                              @ %.lr.ph249
                                        @   Parent Loop BB76_52 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	add	r0, r2, r6
	add	r7, r12, r6
	ldrb	r3, [r0, #1]
	sub	r1, r12, r5
	add	r6, r6, #3
	strb	r3, [r7, #1]
	sub	r3, r2, r5
	sub	r5, r5, #3
	ldrb	r3, [r3, #2]
	strb	r3, [r1, #2]
	ldrb	r0, [r0, #3]
	strb	r0, [r7, #3]
	add	r7, lr, r5
	cmp	r7, #2
	bhi	.LBB76_46
@ BB#47:                                @ %._crit_edge250.loopexit
                                        @   in Loop: Header=BB76_52 Depth=1
	add	r12, r12, r6
	add	r2, r2, r6
	b	.LBB76_49
.LBB76_48:                              @   in Loop: Header=BB76_52 Depth=1
	mov	r7, lr
.LBB76_49:                              @ %._crit_edge250.loopexit
                                        @   in Loop: Header=BB76_52 Depth=1
	ldr	r5, [sp, #84]           @ 4-byte Reload
	mvn	r10, #0
	mov	r8, #1
	cmp	r7, #0
	beq	.LBB76_60
@ BB#50:                                @   in Loop: Header=BB76_52 Depth=1
	ldrb	r3, [r2, #1]
	mov	r0, r12
	cmp	r7, #2
	strb	r3, [r0, #1]!
	ldrbhs	r0, [r2, #2]
	strbhs	r0, [r12, #2]!
	movlo	r12, r0
	b	.LBB76_60
.LBB76_51:                              @   in Loop: Header=BB76_52 Depth=1
	ldr	r0, [sp, #36]           @ 4-byte Reload
	add	r0, r0, r2
	add	r12, r12, r0
	ldr	r2, [sp, #12]           @ 4-byte Reload
	b	.LBB76_45
.LBB76_52:                              @ =>This Loop Header: Depth=1
                                        @     Child Loop BB76_56 Depth 2
                                        @     Child Loop BB76_8 Depth 2
                                        @     Child Loop BB76_22 Depth 2
                                        @     Child Loop BB76_39 Depth 2
                                        @     Child Loop BB76_30 Depth 2
                                        @     Child Loop BB76_33 Depth 2
                                        @     Child Loop BB76_20 Depth 2
                                        @     Child Loop BB76_46 Depth 2
	cmp	r4, #14
	bhi	.LBB76_54
@ BB#53:                                @   in Loop: Header=BB76_52 Depth=1
	ldrb	r0, [r9, #1]
	ldrb	r2, [r9, #2]!
	add	r3, r4, #8
	add	r0, r11, r0, lsl r4
	add	r11, r0, r2, lsl r3
	add	r4, r4, #16
.LBB76_54:                              @   in Loop: Header=BB76_52 Depth=1
	ldr	r0, [sp, #64]           @ 4-byte Reload
	mov	r2, r5
	and	r0, r11, r0
	lsl	r0, r0, #2
	ldrh	r0, [r2, r0]!
	ldrh	r2, [r2, #2]
	orr	r2, r0, r2, lsl #16
	b	.LBB76_56
.LBB76_55:                              @   in Loop: Header=BB76_56 Depth=2
	uxtb	r0, r2
	add	r0, r10, r8, lsl r0
	and	r0, r11, r0
	add	r0, r0, lr
	lsl	r0, r0, #2
	mov	r2, r5
	ldrh	r0, [r2, r0]!
	ldrh	r1, [r2, #2]
	orr	r2, r0, r1, lsl #16
.LBB76_56:                              @   Parent Loop BB76_52 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	lsr	r0, r2, #8
	lsr	lr, r2, #16
	uxtb	r0, r0
	lsr	r11, r11, r0
	sub	r4, r4, r0
	tst	r2, #255
	beq	.LBB76_59
@ BB#57:                                @ %.lr.ph
                                        @   in Loop: Header=BB76_56 Depth=2
	tst	r2, #16
	bne	.LBB76_1
@ BB#58:                                @   in Loop: Header=BB76_56 Depth=2
	tst	r2, #64
	bne	.LBB76_61
	b	.LBB76_55
.LBB76_59:                              @ %._crit_edge
                                        @   in Loop: Header=BB76_52 Depth=1
	strb	lr, [r12, #1]!
.LBB76_60:                              @   in Loop: Header=BB76_52 Depth=1
	ldr	r0, [sp, #72]           @ 4-byte Reload
	cmp	r9, r0
	ldrlo	r0, [sp, #76]           @ 4-byte Reload
	cmplo	r12, r0
	blo	.LBB76_52
	b	.LBB76_66
.LBB76_61:
	tst	r2, #32
	beq	.LBB76_63
@ BB#62:
	mov	r0, #11
	b	.LBB76_65
.LBB76_63:
	ldr	r0, .LCPI76_3
.LBB76_64:
	ldr	r1, [sp]                @ 4-byte Reload
	str	r0, [r1, #24]
	mov	r0, #29
.LBB76_65:
	ldr	r1, [sp, #4]            @ 4-byte Reload
	str	r0, [r1]
.LBB76_66:                              @ %.critedge
	lsr	r0, r4, #3
	sub	r0, r4, r0, lsl #3
	ldr	r3, [sp]                @ 4-byte Reload
	mov	r2, #1
	sub	r6, r2, r4, lsr #3
	mvn	r1, #0
	add	r2, r1, r2, lsl r0
	add	r1, r9, r6
	str	r1, [r3]
	add	r1, r12, #1
	str	r1, [r3, #12]
	ldr	r1, [sp, #72]           @ 4-byte Reload
	sub	r7, r9, r4, lsr #3
	mov	r6, r3
	cmp	r7, r1
	sub	r3, r1, r7
	ldr	r7, [sp, #76]           @ 4-byte Reload
	add	r1, r3, #5
	ldr	r3, [sp, #4]            @ 4-byte Reload
	str	r1, [r6, #4]
	sub	r1, r7, r12
	add	r1, r1, #1
	add	r1, r1, #256
	and	r2, r2, r11
	str	r1, [r6, #16]
	str	r2, [r3, #56]
	cmp	r12, r7
	str	r0, [r3, #60]
	add	sp, sp, #96
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
.LBB76_67:
	ldr	r1, [sp]                @ 4-byte Reload
	ldr	r0, .LCPI76_1
	ldr	r3, [sp, #4]            @ 4-byte Reload
	mov	r11, r2
	str	r0, [r1, #24]
	mov	r0, #29
	str	r0, [r3]
	b	.LBB76_66
.LBB76_68:
	ldr	r0, .LCPI76_2
	b	.LBB76_64
	.align	2
@ BB#69:
.LCPI76_0:
	.long	4294967038              @ 0xfffffefe
.LCPI76_1:
	.long	.L.str155
.LCPI76_2:
	.long	.L.str54
.LCPI76_3:
	.long	.L.str256
.Ltmp76:
	.size	inflate_fast, .Ltmp76-inflate_fast

	.type	testdata,%object        @ @testdata
	.section	.rodata,"a",%progbits
	.globl	testdata
testdata:
	.ascii	 "\nMost of the Parthenon's imposing columns are still standing, but the roof\nis gone.  It was a perfect building two hundred and fifty years ago, when\na shell dropped into the Venetian magazine stored here, and the explosion\nwhich followed wrecked and unroofed it.  I remember but little about the\nParthenon, and I have put in one or two facts and figures for the use of\nother people with short memories.  Got them from the guide-book.\n\nAs we wandered thoughtfully down the marble-paved length of this stately\ntemple, the scene about us was strangely impressive.  Here and there, in\nlavish profusion, were gleaming white statues of men and women, propped\nagainst blocks of marble, some of them armless, some without legs, others\nheadless--but all looking mournful in the moonlight, and startlingly\nhuman!  They rose up and confronted the midnight intruder on every side\n--they stared at him with stony eyes from unlooked-for nooks and recesses;\nthey peered at him over fragmentary heaps far down the desolate\ncorridors; they barred his way in the midst of the broad forum, and\nsolemnly pointed with handless arms the way from the sacred fane; and\nthrough the roofless temple the moon looked down, and banded the floor\nand darkened the scattered fragments and broken statues with the slanting\nshadows of the columns.\n\nWhat a world of ruined sculpture was about us!  Set up in rows--stacked\nup in piles--scattered broadcast over the wide area of the Acropolis\n--were hundreds of crippled statues of all sizes and of the most exquisite\nworkmanship; and vast fragments of marble that once belonged to the\nentablatures, covered with bas-reliefs representing battles and sieges,\nships of war with three and four tiers of oars, pageants and processions\n--every thing one could think of.  History says that the temples of the\nAcropolis were filled with the noblest works of Praxiteles and Phidias,\nand of many a great master in sculpture besides--and surely these elegant\nfragments attest it.\n\nWe walked out into the grass-grown, fragment-strewn court beyond the\nParthenon.  It startled us, every now and then, to see a stony white face\nstare suddenly up at us out of the grass with its dead eyes.  The place\nseemed alive with ghosts.  I half expected to see the Athenian heroes of\ntwenty centuries ago glide out of the shadows and steal into the old\ntemple they knew so well and regarded with such boundless pride.\n\nThe full moon was riding high in the cloudless heavens, now.  We\nsauntered carelessly and unthinkingly to the edge of the lofty\nbattlements of the citadel, and looked down--a vision!  And such a\nvision!  Athens by moonlight!  The prophet that thought the splendors of\nthe New Jerusalem were revealed to him, surely saw this instead!  It lay\nin the level plain right under our feet--all spread abroad like a\npicture--and we looked down upon it as we might have looked from a\nballoon.  We saw no semblance of a street, but every house, every window,\nevery clinging vine, every projection was as distinct and sharply marked\nas if the time were noon-day; and yet there was no glare, no glitter,\nnothing harsh or repulsive--the noiseless city was flooded with the\nmellowest light that ever streamed from the moon, and seemed like some\nliving creature wrapped in peaceful slumber.  On its further side was a\nlittle temple, whose delicate pillars and ornate front glowed with a rich\nlustre that chained the eye like a spell; and nearer by, the palace of\nthe king reared its creamy walls out of the midst of a great garden of\nshrubbery that was flecked all over with a random shower of amber lights\n--a spray of golden sparks that lost their brightness in the glory of the\nmoon, and glinted softly upon the sea of dark foliage like the pallid\nstars of the milky-way.  Overhead the stately columns, majestic still in\ntheir ruin--under foot the dreaming city--in the distance the silver sea\n--not on the broad earth is there an other picture half so beautiful!\n\nAs we turned and moved again through the temple, I wished that the\nillustrious men who had sat in it in the remote ages could visit it again\nand reveal themselves to our curious eyes--Plato, Aristotle, Demosthenes,\nSocrates, Phocion, Pythagoras, Euclid, Pindar, Xenophon, Herodotus,\nPraxiteles and Phidias, Zeuxis the painter.  What a constellation of\ncelebrated names!  But more than all, I wished that old Diogenes, groping\nso patiently with his lantern, searching so zealously for one solitary\nhonest man in all the world, might meander along and stumble on our\nparty.  I ought not to say it, may be, but still I suppose he would have\nput out his light.\n\nWe left the Parthenon to keep its watch over old Athens, as it had kept\nit for twenty-three hundred years, and went and stood outside the walls\nof the citadel.  In the distance was the ancient, but still almost\nperfect Temple of Theseus, and close by, looking to the west, was the\nBema, from whence Demosthenes thundered his philippics and fired the\nwavering patriotism of his countrymen.  To the right was Mars Hill, where\nthe Areopagus sat in ancient times and where St. Paul defined his\nposition, and below was the market-place where he \"disputed daily\" with\nthe gossip-loving Athenians.  We climbed the stone steps St. Paul\nascended, and stood in the square-cut place he stood in, and tried to\nrecollect the Bible account of the matter--but for certain reasons, I\ncould not recall the words.  I have found them since:\n\n     \"Now while Paul waited for them at Athens, his spirit was stirred in\n     him, when he saw the city wholly given up to idolatry.  Therefore\n     disputed he in the synagogue with the Jews, and with the devout\n     persons, and in the market daily with them that met with him.\n                         * * * * * * * * *\n     \"And they took him and brought him unto Areopagus, saying, May we\n     know what this new doctrine whereof thou speakest is?\n                         * * * * * * * * *\n     \"Then Paul stood in the midst of Mars hill, and said, Ye men of\n     Athens, I perceive that in all things ye are too superstitious; For\n     as I passed by and beheld your devotions, I found an altar with this\n     inscription: To THE UNKNOWN GOD.  Whom, therefore, ye ignorantly\n     worship, him declare I unto you.\"--Acts, ch. xvii.\"\n\nIt occurred to us, after a while, that if we wanted to get home before\ndaylight betrayed us, we had better be moving.  So we hurried away.  When\nfar on our road, we had a parting view of the Parthenon, with the\nmoonlight streaming through its open colonnades and touching its capitals\nwith silver.  As it looked then, solemn, grand, and beautiful it will\nalways remain in our memories.\n\nAs we marched along, we began to get over our fears, and ceased to care\nmuch about quarantine scouts or any body else.  We grew bold and\nreckless; and once, in a sudden burst of courage, I even threw a stone at\na dog.  It was a pleasant reflection, though, that I did not hit him,\nbecause his master might just possibly have been a policeman.  Inspired\nby this happy failure, my valor became utterly uncontrollable, and at\nintervals I absolutely whistled, though on a moderate key.  But boldness\nbreeds boldness, and shortly I plunged into a Vineyard, in the full light\nof the moon, and captured a gallon of superb grapes, not even minding the\npresence of a peasant who rode by on a mule.  Denny and Birch followed my\nexample.\n\nNow I had grapes enough for a dozen, but then Jackson was all swollen up\nwith courage, too, and he was obliged to enter a vineyard presently.  The\nfirst bunch he seized brought trouble.  A frowsy, bearded brigand sprang\ninto the road with a shout, and flourished a musket in the light of the\nmoon!  We sidled toward the Piraeus--not running you understand, but only\nadvancing with celerity.  The brigand shouted again, but still we\nadvanced.  It was getting late, and we had no time to fool away on every\nass that wanted to drivel Greek platitudes to us.  We would just as soon\nhave talked with him as not if we had not been in a hurry.  Presently\nDenny said, \"Those fellows are following us!\"\n\nWe turned, and, sure enough, there they were--three fantastic pirates\narmed with guns.  We slackened our pace to let them come up, and in the\nmeantime I got out my cargo of grapes and dropped them firmly but\nreluctantly into the shadows by the wayside.  But I was not afraid.  I\nonly felt that it was not right to steal grapes.  And all the more so\nwhen the owner was around--and not only around, but with his friends\naround also.  The villains came up and searched a bundle Dr. Birch had in\nhis hand, and scowled upon him when they found it had nothing in it but\nsome holy rocks from Mars Hill, and these were not contraband.  They\nevidently suspected him of playing some wretched fraud upon them, and\nseemed half inclined to scalp the party.  But finally they dismissed us\nwith a warning, couched in excellent Greek, I suppose, and dropped\ntranquilly in our wake.  When they had gone three hundred yards they\nstopped, and we went on rejoiced.  But behold, another armed rascal came\nout of the shadows and took their place, and followed us two hundred\nyards.  Then he delivered us over to another miscreant, who emerged from\nsome mysterious place, and he in turn to another!  For a mile and a half\nour rear was guarded all the while by armed men.  I never traveled in so\nmuch state before in all my life.\n\nIt was a good while after that before we ventured to steal any more\ngrapes, and when we did we stirred up another troublesome brigand, and\nthen we ceased all further speculation in that line.  I suppose that\nfellow that rode by on the mule posted all the sentinels, from Athens to\nthe Piraeus, about us.\n\nEvery field on that long route was watched by an armed sentinel, some of\nwhom had fallen asleep, no doubt, but were on hand, nevertheless.  This\nshows what sort of a country modern Attica is--a community of\nquestionable characters.  These men were not there to guard their\npossessions against stra"
	.size	testdata, 10000

	.type	heap_offset,%object     @ @heap_offset
	.comm	heap_offset,4,4
	.type	complen,%object         @ @complen
	.comm	complen,4,4
	.type	compressed,%object      @ @compressed
	.comm	compressed,10000,1
	.type	uncomplen,%object       @ @uncomplen
	.comm	uncomplen,4,4
	.type	uncompressed,%object    @ @uncompressed
	.comm	uncompressed,10000,1
	.type	deflate_copyright,%object @ @deflate_copyright
	.globl	deflate_copyright
deflate_copyright:
	.asciz	 " deflate 1.2.7 Copyright 1995-2012 Jean-loup Gailly and Mark Adler "
	.size	deflate_copyright, 68

	.type	configuration_table,%object @ @configuration_table
	.section	.data.rel.ro.local,"aw",%progbits
	.align	2
configuration_table:
	.short	0                       @ 0x0
	.short	0                       @ 0x0
	.short	0                       @ 0x0
	.short	0                       @ 0x0
	.long	deflate_stored
	.short	4                       @ 0x4
	.short	4                       @ 0x4
	.short	8                       @ 0x8
	.short	4                       @ 0x4
	.long	deflate_fast
	.short	4                       @ 0x4
	.short	5                       @ 0x5
	.short	16                      @ 0x10
	.short	8                       @ 0x8
	.long	deflate_fast
	.short	4                       @ 0x4
	.short	6                       @ 0x6
	.short	32                      @ 0x20
	.short	32                      @ 0x20
	.long	deflate_fast
	.short	4                       @ 0x4
	.short	4                       @ 0x4
	.short	16                      @ 0x10
	.short	16                      @ 0x10
	.long	deflate_slow
	.short	8                       @ 0x8
	.short	16                      @ 0x10
	.short	32                      @ 0x20
	.short	32                      @ 0x20
	.long	deflate_slow
	.short	8                       @ 0x8
	.short	16                      @ 0x10
	.short	128                     @ 0x80
	.short	128                     @ 0x80
	.long	deflate_slow
	.short	8                       @ 0x8
	.short	32                      @ 0x20
	.short	128                     @ 0x80
	.short	256                     @ 0x100
	.long	deflate_slow
	.short	32                      @ 0x20
	.short	128                     @ 0x80
	.short	258                     @ 0x102
	.short	1024                    @ 0x400
	.long	deflate_slow
	.short	32                      @ 0x20
	.short	258                     @ 0x102
	.short	258                     @ 0x102
	.short	4096                    @ 0x1000
	.long	deflate_slow
	.size	configuration_table, 120

	.type	.L.str13,%object        @ @.str13
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str13:
	.asciz	 "need dictionary"
	.size	.L.str13, 16

	.type	.L.str1,%object         @ @.str1
.L.str1:
	.asciz	 "stream end"
	.size	.L.str1, 11

	.type	.L.str2,%object         @ @.str2
.L.str2:
	.zero	1
	.size	.L.str2, 1

	.type	.L.str3,%object         @ @.str3
.L.str3:
	.asciz	 "file error"
	.size	.L.str3, 11

	.type	.L.str4,%object         @ @.str4
.L.str4:
	.asciz	 "stream error"
	.size	.L.str4, 13

	.type	.L.str5,%object         @ @.str5
.L.str5:
	.asciz	 "data error"
	.size	.L.str5, 11

	.type	.L.str6,%object         @ @.str6
.L.str6:
	.asciz	 "insufficient memory"
	.size	.L.str6, 20

	.type	.L.str7,%object         @ @.str7
.L.str7:
	.asciz	 "buffer error"
	.size	.L.str7, 13

	.type	.L.str8,%object         @ @.str8
.L.str8:
	.asciz	 "incompatible version"
	.size	.L.str8, 21

	.type	z_errmsg,%object        @ @z_errmsg
	.section	.data.rel.ro.local,"aw",%progbits
	.globl	z_errmsg
	.align	2
z_errmsg:
	.long	.L.str13
	.long	.L.str1
	.long	.L.str2
	.long	.L.str3
	.long	.L.str4
	.long	.L.str5
	.long	.L.str6
	.long	.L.str7
	.long	.L.str8
	.long	.L.str2
	.size	z_errmsg, 40

	.type	.L.str9,%object         @ @.str9
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str9:
	.asciz	 "1.2.7"
	.size	.L.str9, 6

	.type	crc_table,%object       @ @crc_table
	.section	.rodata,"a",%progbits
	.align	2
crc_table:
	.long	0                       @ 0x0
	.long	1996959894              @ 0x77073096
	.long	3993919788              @ 0xee0e612c
	.long	2567524794              @ 0x990951ba
	.long	124634137               @ 0x76dc419
	.long	1886057615              @ 0x706af48f
	.long	3915621685              @ 0xe963a535
	.long	2657392035              @ 0x9e6495a3
	.long	249268274               @ 0xedb8832
	.long	2044508324              @ 0x79dcb8a4
	.long	3772115230              @ 0xe0d5e91e
	.long	2547177864              @ 0x97d2d988
	.long	162941995               @ 0x9b64c2b
	.long	2125561021              @ 0x7eb17cbd
	.long	3887607047              @ 0xe7b82d07
	.long	2428444049              @ 0x90bf1d91
	.long	498536548               @ 0x1db71064
	.long	1789927666              @ 0x6ab020f2
	.long	4089016648              @ 0xf3b97148
	.long	2227061214              @ 0x84be41de
	.long	450548861               @ 0x1adad47d
	.long	1843258603              @ 0x6ddde4eb
	.long	4107580753              @ 0xf4d4b551
	.long	2211677639              @ 0x83d385c7
	.long	325883990               @ 0x136c9856
	.long	1684777152              @ 0x646ba8c0
	.long	4251122042              @ 0xfd62f97a
	.long	2321926636              @ 0x8a65c9ec
	.long	335633487               @ 0x14015c4f
	.long	1661365465              @ 0x63066cd9
	.long	4195302755              @ 0xfa0f3d63
	.long	2366115317              @ 0x8d080df5
	.long	997073096               @ 0x3b6e20c8
	.long	1281953886              @ 0x4c69105e
	.long	3579855332              @ 0xd56041e4
	.long	2724688242              @ 0xa2677172
	.long	1006888145              @ 0x3c03e4d1
	.long	1258607687              @ 0x4b04d447
	.long	3524101629              @ 0xd20d85fd
	.long	2768942443              @ 0xa50ab56b
	.long	901097722               @ 0x35b5a8fa
	.long	1119000684              @ 0x42b2986c
	.long	3686517206              @ 0xdbbbc9d6
	.long	2898065728              @ 0xacbcf940
	.long	853044451               @ 0x32d86ce3
	.long	1172266101              @ 0x45df5c75
	.long	3705015759              @ 0xdcd60dcf
	.long	2882616665              @ 0xabd13d59
	.long	651767980               @ 0x26d930ac
	.long	1373503546              @ 0x51de003a
	.long	3369554304              @ 0xc8d75180
	.long	3218104598              @ 0xbfd06116
	.long	565507253               @ 0x21b4f4b5
	.long	1454621731              @ 0x56b3c423
	.long	3485111705              @ 0xcfba9599
	.long	3099436303              @ 0xb8bda50f
	.long	671266974               @ 0x2802b89e
	.long	1594198024              @ 0x5f058808
	.long	3322730930              @ 0xc60cd9b2
	.long	2970347812              @ 0xb10be924
	.long	795835527               @ 0x2f6f7c87
	.long	1483230225              @ 0x58684c11
	.long	3244367275              @ 0xc1611dab
	.long	3060149565              @ 0xb6662d3d
	.long	1994146192              @ 0x76dc4190
	.long	31158534                @ 0x1db7106
	.long	2563907772              @ 0x98d220bc
	.long	4023717930              @ 0xefd5102a
	.long	1907459465              @ 0x71b18589
	.long	112637215               @ 0x6b6b51f
	.long	2680153253              @ 0x9fbfe4a5
	.long	3904427059              @ 0xe8b8d433
	.long	2013776290              @ 0x7807c9a2
	.long	251722036               @ 0xf00f934
	.long	2517215374              @ 0x9609a88e
	.long	3775830040              @ 0xe10e9818
	.long	2137656763              @ 0x7f6a0dbb
	.long	141376813               @ 0x86d3d2d
	.long	2439277719              @ 0x91646c97
	.long	3865271297              @ 0xe6635c01
	.long	1802195444              @ 0x6b6b51f4
	.long	476864866               @ 0x1c6c6162
	.long	2238001368              @ 0x856530d8
	.long	4066508878              @ 0xf262004e
	.long	1812370925              @ 0x6c0695ed
	.long	453092731               @ 0x1b01a57b
	.long	2181625025              @ 0x8208f4c1
	.long	4111451223              @ 0xf50fc457
	.long	1706088902              @ 0x65b0d9c6
	.long	314042704               @ 0x12b7e950
	.long	2344532202              @ 0x8bbeb8ea
	.long	4240017532              @ 0xfcb9887c
	.long	1658658271              @ 0x62dd1ddf
	.long	366619977               @ 0x15da2d49
	.long	2362670323              @ 0x8cd37cf3
	.long	4224994405              @ 0xfbd44c65
	.long	1303535960              @ 0x4db26158
	.long	984961486               @ 0x3ab551ce
	.long	2747007092              @ 0xa3bc0074
	.long	3569037538              @ 0xd4bb30e2
	.long	1256170817              @ 0x4adfa541
	.long	1037604311              @ 0x3dd895d7
	.long	2765210733              @ 0xa4d1c46d
	.long	3554079995              @ 0xd3d6f4fb
	.long	1131014506              @ 0x4369e96a
	.long	879679996               @ 0x346ed9fc
	.long	2909243462              @ 0xad678846
	.long	3663771856              @ 0xda60b8d0
	.long	1141124467              @ 0x44042d73
	.long	855842277               @ 0x33031de5
	.long	2852801631              @ 0xaa0a4c5f
	.long	3708648649              @ 0xdd0d7cc9
	.long	1342533948              @ 0x5005713c
	.long	654459306               @ 0x270241aa
	.long	3188396048              @ 0xbe0b1010
	.long	3373015174              @ 0xc90c2086
	.long	1466479909              @ 0x5768b525
	.long	544179635               @ 0x206f85b3
	.long	3110523913              @ 0xb966d409
	.long	3462522015              @ 0xce61e49f
	.long	1591671054              @ 0x5edef90e
	.long	702138776               @ 0x29d9c998
	.long	2966460450              @ 0xb0d09822
	.long	3352799412              @ 0xc7d7a8b4
	.long	1504918807              @ 0x59b33d17
	.long	783551873               @ 0x2eb40d81
	.long	3082640443              @ 0xb7bd5c3b
	.long	3233442989              @ 0xc0ba6cad
	.long	3988292384              @ 0xedb88320
	.long	2596254646              @ 0x9abfb3b6
	.long	62317068                @ 0x3b6e20c
	.long	1957810842              @ 0x74b1d29a
	.long	3939845945              @ 0xead54739
	.long	2647816111              @ 0x9dd277af
	.long	81470997                @ 0x4db2615
	.long	1943803523              @ 0x73dc1683
	.long	3814918930              @ 0xe3630b12
	.long	2489596804              @ 0x94643b84
	.long	225274430               @ 0xd6d6a3e
	.long	2053790376              @ 0x7a6a5aa8
	.long	3826175755              @ 0xe40ecf0b
	.long	2466906013              @ 0x9309ff9d
	.long	167816743               @ 0xa00ae27
	.long	2097651377              @ 0x7d079eb1
	.long	4027552580              @ 0xf00f9344
	.long	2265490386              @ 0x8708a3d2
	.long	503444072               @ 0x1e01f268
	.long	1762050814              @ 0x6906c2fe
	.long	4150417245              @ 0xf762575d
	.long	2154129355              @ 0x806567cb
	.long	426522225               @ 0x196c3671
	.long	1852507879              @ 0x6e6b06e7
	.long	4275313526              @ 0xfed41b76
	.long	2312317920              @ 0x89d32be0
	.long	282753626               @ 0x10da7a5a
	.long	1742555852              @ 0x67dd4acc
	.long	4189708143              @ 0xf9b9df6f
	.long	2394877945              @ 0x8ebeeff9
	.long	397917763               @ 0x17b7be43
	.long	1622183637              @ 0x60b08ed5
	.long	3604390888              @ 0xd6d6a3e8
	.long	2714866558              @ 0xa1d1937e
	.long	953729732               @ 0x38d8c2c4
	.long	1340076626              @ 0x4fdff252
	.long	3518719985              @ 0xd1bb67f1
	.long	2797360999              @ 0xa6bc5767
	.long	1068828381              @ 0x3fb506dd
	.long	1219638859              @ 0x48b2364b
	.long	3624741850              @ 0xd80d2bda
	.long	2936675148              @ 0xaf0a1b4c
	.long	906185462               @ 0x36034af6
	.long	1090812512              @ 0x41047a60
	.long	3747672003              @ 0xdf60efc3
	.long	2825379669              @ 0xa867df55
	.long	829329135               @ 0x316e8eef
	.long	1181335161              @ 0x4669be79
	.long	3412177804              @ 0xcb61b38c
	.long	3160834842              @ 0xbc66831a
	.long	628085408               @ 0x256fd2a0
	.long	1382605366              @ 0x5268e236
	.long	3423369109              @ 0xcc0c7795
	.long	3138078467              @ 0xbb0b4703
	.long	570562233               @ 0x220216b9
	.long	1426400815              @ 0x5505262f
	.long	3317316542              @ 0xc5ba3bbe
	.long	2998733608              @ 0xb2bd0b28
	.long	733239954               @ 0x2bb45a92
	.long	1555261956              @ 0x5cb36a04
	.long	3268935591              @ 0xc2d7ffa7
	.long	3050360625              @ 0xb5d0cf31
	.long	752459403               @ 0x2cd99e8b
	.long	1541320221              @ 0x5bdeae1d
	.long	2607071920              @ 0x9b64c2b0
	.long	3965973030              @ 0xec63f226
	.long	1969922972              @ 0x756aa39c
	.long	40735498                @ 0x26d930a
	.long	2617837225              @ 0x9c0906a9
	.long	3943577151              @ 0xeb0e363f
	.long	1913087877              @ 0x72076785
	.long	83908371                @ 0x5005713
	.long	2512341634              @ 0x95bf4a82
	.long	3803740692              @ 0xe2b87a14
	.long	2075208622              @ 0x7bb12bae
	.long	213261112               @ 0xcb61b38
	.long	2463272603              @ 0x92d28e9b
	.long	3855990285              @ 0xe5d5be0d
	.long	2094854071              @ 0x7cdcefb7
	.long	198958881               @ 0xbdbdf21
	.long	2262029012              @ 0x86d3d2d4
	.long	4057260610              @ 0xf1d4e242
	.long	1759359992              @ 0x68ddb3f8
	.long	534414190               @ 0x1fda836e
	.long	2176718541              @ 0x81be16cd
	.long	4139329115              @ 0xf6b9265b
	.long	1873836001              @ 0x6fb077e1
	.long	414664567               @ 0x18b74777
	.long	2282248934              @ 0x88085ae6
	.long	4279200368              @ 0xff0f6a70
	.long	1711684554              @ 0x66063bca
	.long	285281116               @ 0x11010b5c
	.long	2405801727              @ 0x8f659eff
	.long	4167216745              @ 0xf862ae69
	.long	1634467795              @ 0x616bffd3
	.long	376229701               @ 0x166ccf45
	.long	2685067896              @ 0xa00ae278
	.long	3608007406              @ 0xd70dd2ee
	.long	1308918612              @ 0x4e048354
	.long	956543938               @ 0x3903b3c2
	.long	2808555105              @ 0xa7672661
	.long	3495958263              @ 0xd06016f7
	.long	1231636301              @ 0x4969474d
	.long	1047427035              @ 0x3e6e77db
	.long	2932959818              @ 0xaed16a4a
	.long	3654703836              @ 0xd9d65adc
	.long	1088359270              @ 0x40df0b66
	.long	936918000               @ 0x37d83bf0
	.long	2847714899              @ 0xa9bcae53
	.long	3736837829              @ 0xdebb9ec5
	.long	1202900863              @ 0x47b2cf7f
	.long	817233897               @ 0x30b5ffe9
	.long	3183342108              @ 0xbdbdf21c
	.long	3401237130              @ 0xcabac28a
	.long	1404277552              @ 0x53b39330
	.long	615818150               @ 0x24b4a3a6
	.long	3134207493              @ 0xbad03605
	.long	3453421203              @ 0xcdd70693
	.long	1423857449              @ 0x54de5729
	.long	601450431               @ 0x23d967bf
	.long	3009837614              @ 0xb3667a2e
	.long	3294710456              @ 0xc4614ab8
	.long	1567103746              @ 0x5d681b02
	.long	711928724               @ 0x2a6f2b94
	.long	3020668471              @ 0xb40bbe37
	.long	3272380065              @ 0xc30c8ea1
	.long	1510334235              @ 0x5a05df1b
	.long	755167117               @ 0x2d02ef8d
	.size	crc_table, 1024

	.type	_dist_code,%object      @ @_dist_code
	.globl	_dist_code
_dist_code:
	.ascii	 "\000\001\002\003\004\004\005\005\006\006\006\006\007\007\007\007\b\b\b\b\b\b\b\b\t\t\t\t\t\t\t\t\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\013\013\013\013\013\013\013\013\013\013\013\013\013\013\013\013\f\f\f\f\f\f\f\f\f\f\f\f\f\f\f\f\f\f\f\f\f\f\f\f\f\f\f\f\f\f\f\f\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\016\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\017\000\000\020\021\022\022\023\023\024\024\024\024\025\025\025\025\026\026\026\026\026\026\026\026\027\027\027\027\027\027\027\027\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\031\031\031\031\031\031\031\031\031\031\031\031\031\031\031\031\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\034\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035\035"
	.size	_dist_code, 512

	.type	_length_code,%object    @ @_length_code
	.globl	_length_code
_length_code:
	.ascii	 "\000\001\002\003\004\005\006\007\b\b\t\t\n\n\013\013\f\f\f\f\r\r\r\r\016\016\016\016\017\017\017\017\020\020\020\020\020\020\020\020\021\021\021\021\021\021\021\021\022\022\022\022\022\022\022\022\023\023\023\023\023\023\023\023\024\024\024\024\024\024\024\024\024\024\024\024\024\024\024\024\025\025\025\025\025\025\025\025\025\025\025\025\025\025\025\025\026\026\026\026\026\026\026\026\026\026\026\026\026\026\026\026\027\027\027\027\027\027\027\027\027\027\027\027\027\027\027\027\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\031\031\031\031\031\031\031\031\031\031\031\031\031\031\031\031\031\031\031\031\031\031\031\031\031\031\031\031\031\031\031\031\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\032\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\033\034"
	.size	_length_code, 256

	.type	static_ltree,%object    @ @static_ltree
	.align	1
static_ltree:
	.short	12                      @ 0xc
	.short	8                       @ 0x8
	.short	140                     @ 0x8c
	.short	8                       @ 0x8
	.short	76                      @ 0x4c
	.short	8                       @ 0x8
	.short	204                     @ 0xcc
	.short	8                       @ 0x8
	.short	44                      @ 0x2c
	.short	8                       @ 0x8
	.short	172                     @ 0xac
	.short	8                       @ 0x8
	.short	108                     @ 0x6c
	.short	8                       @ 0x8
	.short	236                     @ 0xec
	.short	8                       @ 0x8
	.short	28                      @ 0x1c
	.short	8                       @ 0x8
	.short	156                     @ 0x9c
	.short	8                       @ 0x8
	.short	92                      @ 0x5c
	.short	8                       @ 0x8
	.short	220                     @ 0xdc
	.short	8                       @ 0x8
	.short	60                      @ 0x3c
	.short	8                       @ 0x8
	.short	188                     @ 0xbc
	.short	8                       @ 0x8
	.short	124                     @ 0x7c
	.short	8                       @ 0x8
	.short	252                     @ 0xfc
	.short	8                       @ 0x8
	.short	2                       @ 0x2
	.short	8                       @ 0x8
	.short	130                     @ 0x82
	.short	8                       @ 0x8
	.short	66                      @ 0x42
	.short	8                       @ 0x8
	.short	194                     @ 0xc2
	.short	8                       @ 0x8
	.short	34                      @ 0x22
	.short	8                       @ 0x8
	.short	162                     @ 0xa2
	.short	8                       @ 0x8
	.short	98                      @ 0x62
	.short	8                       @ 0x8
	.short	226                     @ 0xe2
	.short	8                       @ 0x8
	.short	18                      @ 0x12
	.short	8                       @ 0x8
	.short	146                     @ 0x92
	.short	8                       @ 0x8
	.short	82                      @ 0x52
	.short	8                       @ 0x8
	.short	210                     @ 0xd2
	.short	8                       @ 0x8
	.short	50                      @ 0x32
	.short	8                       @ 0x8
	.short	178                     @ 0xb2
	.short	8                       @ 0x8
	.short	114                     @ 0x72
	.short	8                       @ 0x8
	.short	242                     @ 0xf2
	.short	8                       @ 0x8
	.short	10                      @ 0xa
	.short	8                       @ 0x8
	.short	138                     @ 0x8a
	.short	8                       @ 0x8
	.short	74                      @ 0x4a
	.short	8                       @ 0x8
	.short	202                     @ 0xca
	.short	8                       @ 0x8
	.short	42                      @ 0x2a
	.short	8                       @ 0x8
	.short	170                     @ 0xaa
	.short	8                       @ 0x8
	.short	106                     @ 0x6a
	.short	8                       @ 0x8
	.short	234                     @ 0xea
	.short	8                       @ 0x8
	.short	26                      @ 0x1a
	.short	8                       @ 0x8
	.short	154                     @ 0x9a
	.short	8                       @ 0x8
	.short	90                      @ 0x5a
	.short	8                       @ 0x8
	.short	218                     @ 0xda
	.short	8                       @ 0x8
	.short	58                      @ 0x3a
	.short	8                       @ 0x8
	.short	186                     @ 0xba
	.short	8                       @ 0x8
	.short	122                     @ 0x7a
	.short	8                       @ 0x8
	.short	250                     @ 0xfa
	.short	8                       @ 0x8
	.short	6                       @ 0x6
	.short	8                       @ 0x8
	.short	134                     @ 0x86
	.short	8                       @ 0x8
	.short	70                      @ 0x46
	.short	8                       @ 0x8
	.short	198                     @ 0xc6
	.short	8                       @ 0x8
	.short	38                      @ 0x26
	.short	8                       @ 0x8
	.short	166                     @ 0xa6
	.short	8                       @ 0x8
	.short	102                     @ 0x66
	.short	8                       @ 0x8
	.short	230                     @ 0xe6
	.short	8                       @ 0x8
	.short	22                      @ 0x16
	.short	8                       @ 0x8
	.short	150                     @ 0x96
	.short	8                       @ 0x8
	.short	86                      @ 0x56
	.short	8                       @ 0x8
	.short	214                     @ 0xd6
	.short	8                       @ 0x8
	.short	54                      @ 0x36
	.short	8                       @ 0x8
	.short	182                     @ 0xb6
	.short	8                       @ 0x8
	.short	118                     @ 0x76
	.short	8                       @ 0x8
	.short	246                     @ 0xf6
	.short	8                       @ 0x8
	.short	14                      @ 0xe
	.short	8                       @ 0x8
	.short	142                     @ 0x8e
	.short	8                       @ 0x8
	.short	78                      @ 0x4e
	.short	8                       @ 0x8
	.short	206                     @ 0xce
	.short	8                       @ 0x8
	.short	46                      @ 0x2e
	.short	8                       @ 0x8
	.short	174                     @ 0xae
	.short	8                       @ 0x8
	.short	110                     @ 0x6e
	.short	8                       @ 0x8
	.short	238                     @ 0xee
	.short	8                       @ 0x8
	.short	30                      @ 0x1e
	.short	8                       @ 0x8
	.short	158                     @ 0x9e
	.short	8                       @ 0x8
	.short	94                      @ 0x5e
	.short	8                       @ 0x8
	.short	222                     @ 0xde
	.short	8                       @ 0x8
	.short	62                      @ 0x3e
	.short	8                       @ 0x8
	.short	190                     @ 0xbe
	.short	8                       @ 0x8
	.short	126                     @ 0x7e
	.short	8                       @ 0x8
	.short	254                     @ 0xfe
	.short	8                       @ 0x8
	.short	1                       @ 0x1
	.short	8                       @ 0x8
	.short	129                     @ 0x81
	.short	8                       @ 0x8
	.short	65                      @ 0x41
	.short	8                       @ 0x8
	.short	193                     @ 0xc1
	.short	8                       @ 0x8
	.short	33                      @ 0x21
	.short	8                       @ 0x8
	.short	161                     @ 0xa1
	.short	8                       @ 0x8
	.short	97                      @ 0x61
	.short	8                       @ 0x8
	.short	225                     @ 0xe1
	.short	8                       @ 0x8
	.short	17                      @ 0x11
	.short	8                       @ 0x8
	.short	145                     @ 0x91
	.short	8                       @ 0x8
	.short	81                      @ 0x51
	.short	8                       @ 0x8
	.short	209                     @ 0xd1
	.short	8                       @ 0x8
	.short	49                      @ 0x31
	.short	8                       @ 0x8
	.short	177                     @ 0xb1
	.short	8                       @ 0x8
	.short	113                     @ 0x71
	.short	8                       @ 0x8
	.short	241                     @ 0xf1
	.short	8                       @ 0x8
	.short	9                       @ 0x9
	.short	8                       @ 0x8
	.short	137                     @ 0x89
	.short	8                       @ 0x8
	.short	73                      @ 0x49
	.short	8                       @ 0x8
	.short	201                     @ 0xc9
	.short	8                       @ 0x8
	.short	41                      @ 0x29
	.short	8                       @ 0x8
	.short	169                     @ 0xa9
	.short	8                       @ 0x8
	.short	105                     @ 0x69
	.short	8                       @ 0x8
	.short	233                     @ 0xe9
	.short	8                       @ 0x8
	.short	25                      @ 0x19
	.short	8                       @ 0x8
	.short	153                     @ 0x99
	.short	8                       @ 0x8
	.short	89                      @ 0x59
	.short	8                       @ 0x8
	.short	217                     @ 0xd9
	.short	8                       @ 0x8
	.short	57                      @ 0x39
	.short	8                       @ 0x8
	.short	185                     @ 0xb9
	.short	8                       @ 0x8
	.short	121                     @ 0x79
	.short	8                       @ 0x8
	.short	249                     @ 0xf9
	.short	8                       @ 0x8
	.short	5                       @ 0x5
	.short	8                       @ 0x8
	.short	133                     @ 0x85
	.short	8                       @ 0x8
	.short	69                      @ 0x45
	.short	8                       @ 0x8
	.short	197                     @ 0xc5
	.short	8                       @ 0x8
	.short	37                      @ 0x25
	.short	8                       @ 0x8
	.short	165                     @ 0xa5
	.short	8                       @ 0x8
	.short	101                     @ 0x65
	.short	8                       @ 0x8
	.short	229                     @ 0xe5
	.short	8                       @ 0x8
	.short	21                      @ 0x15
	.short	8                       @ 0x8
	.short	149                     @ 0x95
	.short	8                       @ 0x8
	.short	85                      @ 0x55
	.short	8                       @ 0x8
	.short	213                     @ 0xd5
	.short	8                       @ 0x8
	.short	53                      @ 0x35
	.short	8                       @ 0x8
	.short	181                     @ 0xb5
	.short	8                       @ 0x8
	.short	117                     @ 0x75
	.short	8                       @ 0x8
	.short	245                     @ 0xf5
	.short	8                       @ 0x8
	.short	13                      @ 0xd
	.short	8                       @ 0x8
	.short	141                     @ 0x8d
	.short	8                       @ 0x8
	.short	77                      @ 0x4d
	.short	8                       @ 0x8
	.short	205                     @ 0xcd
	.short	8                       @ 0x8
	.short	45                      @ 0x2d
	.short	8                       @ 0x8
	.short	173                     @ 0xad
	.short	8                       @ 0x8
	.short	109                     @ 0x6d
	.short	8                       @ 0x8
	.short	237                     @ 0xed
	.short	8                       @ 0x8
	.short	29                      @ 0x1d
	.short	8                       @ 0x8
	.short	157                     @ 0x9d
	.short	8                       @ 0x8
	.short	93                      @ 0x5d
	.short	8                       @ 0x8
	.short	221                     @ 0xdd
	.short	8                       @ 0x8
	.short	61                      @ 0x3d
	.short	8                       @ 0x8
	.short	189                     @ 0xbd
	.short	8                       @ 0x8
	.short	125                     @ 0x7d
	.short	8                       @ 0x8
	.short	253                     @ 0xfd
	.short	8                       @ 0x8
	.short	19                      @ 0x13
	.short	9                       @ 0x9
	.short	275                     @ 0x113
	.short	9                       @ 0x9
	.short	147                     @ 0x93
	.short	9                       @ 0x9
	.short	403                     @ 0x193
	.short	9                       @ 0x9
	.short	83                      @ 0x53
	.short	9                       @ 0x9
	.short	339                     @ 0x153
	.short	9                       @ 0x9
	.short	211                     @ 0xd3
	.short	9                       @ 0x9
	.short	467                     @ 0x1d3
	.short	9                       @ 0x9
	.short	51                      @ 0x33
	.short	9                       @ 0x9
	.short	307                     @ 0x133
	.short	9                       @ 0x9
	.short	179                     @ 0xb3
	.short	9                       @ 0x9
	.short	435                     @ 0x1b3
	.short	9                       @ 0x9
	.short	115                     @ 0x73
	.short	9                       @ 0x9
	.short	371                     @ 0x173
	.short	9                       @ 0x9
	.short	243                     @ 0xf3
	.short	9                       @ 0x9
	.short	499                     @ 0x1f3
	.short	9                       @ 0x9
	.short	11                      @ 0xb
	.short	9                       @ 0x9
	.short	267                     @ 0x10b
	.short	9                       @ 0x9
	.short	139                     @ 0x8b
	.short	9                       @ 0x9
	.short	395                     @ 0x18b
	.short	9                       @ 0x9
	.short	75                      @ 0x4b
	.short	9                       @ 0x9
	.short	331                     @ 0x14b
	.short	9                       @ 0x9
	.short	203                     @ 0xcb
	.short	9                       @ 0x9
	.short	459                     @ 0x1cb
	.short	9                       @ 0x9
	.short	43                      @ 0x2b
	.short	9                       @ 0x9
	.short	299                     @ 0x12b
	.short	9                       @ 0x9
	.short	171                     @ 0xab
	.short	9                       @ 0x9
	.short	427                     @ 0x1ab
	.short	9                       @ 0x9
	.short	107                     @ 0x6b
	.short	9                       @ 0x9
	.short	363                     @ 0x16b
	.short	9                       @ 0x9
	.short	235                     @ 0xeb
	.short	9                       @ 0x9
	.short	491                     @ 0x1eb
	.short	9                       @ 0x9
	.short	27                      @ 0x1b
	.short	9                       @ 0x9
	.short	283                     @ 0x11b
	.short	9                       @ 0x9
	.short	155                     @ 0x9b
	.short	9                       @ 0x9
	.short	411                     @ 0x19b
	.short	9                       @ 0x9
	.short	91                      @ 0x5b
	.short	9                       @ 0x9
	.short	347                     @ 0x15b
	.short	9                       @ 0x9
	.short	219                     @ 0xdb
	.short	9                       @ 0x9
	.short	475                     @ 0x1db
	.short	9                       @ 0x9
	.short	59                      @ 0x3b
	.short	9                       @ 0x9
	.short	315                     @ 0x13b
	.short	9                       @ 0x9
	.short	187                     @ 0xbb
	.short	9                       @ 0x9
	.short	443                     @ 0x1bb
	.short	9                       @ 0x9
	.short	123                     @ 0x7b
	.short	9                       @ 0x9
	.short	379                     @ 0x17b
	.short	9                       @ 0x9
	.short	251                     @ 0xfb
	.short	9                       @ 0x9
	.short	507                     @ 0x1fb
	.short	9                       @ 0x9
	.short	7                       @ 0x7
	.short	9                       @ 0x9
	.short	263                     @ 0x107
	.short	9                       @ 0x9
	.short	135                     @ 0x87
	.short	9                       @ 0x9
	.short	391                     @ 0x187
	.short	9                       @ 0x9
	.short	71                      @ 0x47
	.short	9                       @ 0x9
	.short	327                     @ 0x147
	.short	9                       @ 0x9
	.short	199                     @ 0xc7
	.short	9                       @ 0x9
	.short	455                     @ 0x1c7
	.short	9                       @ 0x9
	.short	39                      @ 0x27
	.short	9                       @ 0x9
	.short	295                     @ 0x127
	.short	9                       @ 0x9
	.short	167                     @ 0xa7
	.short	9                       @ 0x9
	.short	423                     @ 0x1a7
	.short	9                       @ 0x9
	.short	103                     @ 0x67
	.short	9                       @ 0x9
	.short	359                     @ 0x167
	.short	9                       @ 0x9
	.short	231                     @ 0xe7
	.short	9                       @ 0x9
	.short	487                     @ 0x1e7
	.short	9                       @ 0x9
	.short	23                      @ 0x17
	.short	9                       @ 0x9
	.short	279                     @ 0x117
	.short	9                       @ 0x9
	.short	151                     @ 0x97
	.short	9                       @ 0x9
	.short	407                     @ 0x197
	.short	9                       @ 0x9
	.short	87                      @ 0x57
	.short	9                       @ 0x9
	.short	343                     @ 0x157
	.short	9                       @ 0x9
	.short	215                     @ 0xd7
	.short	9                       @ 0x9
	.short	471                     @ 0x1d7
	.short	9                       @ 0x9
	.short	55                      @ 0x37
	.short	9                       @ 0x9
	.short	311                     @ 0x137
	.short	9                       @ 0x9
	.short	183                     @ 0xb7
	.short	9                       @ 0x9
	.short	439                     @ 0x1b7
	.short	9                       @ 0x9
	.short	119                     @ 0x77
	.short	9                       @ 0x9
	.short	375                     @ 0x177
	.short	9                       @ 0x9
	.short	247                     @ 0xf7
	.short	9                       @ 0x9
	.short	503                     @ 0x1f7
	.short	9                       @ 0x9
	.short	15                      @ 0xf
	.short	9                       @ 0x9
	.short	271                     @ 0x10f
	.short	9                       @ 0x9
	.short	143                     @ 0x8f
	.short	9                       @ 0x9
	.short	399                     @ 0x18f
	.short	9                       @ 0x9
	.short	79                      @ 0x4f
	.short	9                       @ 0x9
	.short	335                     @ 0x14f
	.short	9                       @ 0x9
	.short	207                     @ 0xcf
	.short	9                       @ 0x9
	.short	463                     @ 0x1cf
	.short	9                       @ 0x9
	.short	47                      @ 0x2f
	.short	9                       @ 0x9
	.short	303                     @ 0x12f
	.short	9                       @ 0x9
	.short	175                     @ 0xaf
	.short	9                       @ 0x9
	.short	431                     @ 0x1af
	.short	9                       @ 0x9
	.short	111                     @ 0x6f
	.short	9                       @ 0x9
	.short	367                     @ 0x16f
	.short	9                       @ 0x9
	.short	239                     @ 0xef
	.short	9                       @ 0x9
	.short	495                     @ 0x1ef
	.short	9                       @ 0x9
	.short	31                      @ 0x1f
	.short	9                       @ 0x9
	.short	287                     @ 0x11f
	.short	9                       @ 0x9
	.short	159                     @ 0x9f
	.short	9                       @ 0x9
	.short	415                     @ 0x19f
	.short	9                       @ 0x9
	.short	95                      @ 0x5f
	.short	9                       @ 0x9
	.short	351                     @ 0x15f
	.short	9                       @ 0x9
	.short	223                     @ 0xdf
	.short	9                       @ 0x9
	.short	479                     @ 0x1df
	.short	9                       @ 0x9
	.short	63                      @ 0x3f
	.short	9                       @ 0x9
	.short	319                     @ 0x13f
	.short	9                       @ 0x9
	.short	191                     @ 0xbf
	.short	9                       @ 0x9
	.short	447                     @ 0x1bf
	.short	9                       @ 0x9
	.short	127                     @ 0x7f
	.short	9                       @ 0x9
	.short	383                     @ 0x17f
	.short	9                       @ 0x9
	.short	255                     @ 0xff
	.short	9                       @ 0x9
	.short	511                     @ 0x1ff
	.short	9                       @ 0x9
	.zero	2
	.short	7                       @ 0x7
	.short	64                      @ 0x40
	.short	7                       @ 0x7
	.short	32                      @ 0x20
	.short	7                       @ 0x7
	.short	96                      @ 0x60
	.short	7                       @ 0x7
	.short	16                      @ 0x10
	.short	7                       @ 0x7
	.short	80                      @ 0x50
	.short	7                       @ 0x7
	.short	48                      @ 0x30
	.short	7                       @ 0x7
	.short	112                     @ 0x70
	.short	7                       @ 0x7
	.short	8                       @ 0x8
	.short	7                       @ 0x7
	.short	72                      @ 0x48
	.short	7                       @ 0x7
	.short	40                      @ 0x28
	.short	7                       @ 0x7
	.short	104                     @ 0x68
	.short	7                       @ 0x7
	.short	24                      @ 0x18
	.short	7                       @ 0x7
	.short	88                      @ 0x58
	.short	7                       @ 0x7
	.short	56                      @ 0x38
	.short	7                       @ 0x7
	.short	120                     @ 0x78
	.short	7                       @ 0x7
	.short	4                       @ 0x4
	.short	7                       @ 0x7
	.short	68                      @ 0x44
	.short	7                       @ 0x7
	.short	36                      @ 0x24
	.short	7                       @ 0x7
	.short	100                     @ 0x64
	.short	7                       @ 0x7
	.short	20                      @ 0x14
	.short	7                       @ 0x7
	.short	84                      @ 0x54
	.short	7                       @ 0x7
	.short	52                      @ 0x34
	.short	7                       @ 0x7
	.short	116                     @ 0x74
	.short	7                       @ 0x7
	.short	3                       @ 0x3
	.short	8                       @ 0x8
	.short	131                     @ 0x83
	.short	8                       @ 0x8
	.short	67                      @ 0x43
	.short	8                       @ 0x8
	.short	195                     @ 0xc3
	.short	8                       @ 0x8
	.short	35                      @ 0x23
	.short	8                       @ 0x8
	.short	163                     @ 0xa3
	.short	8                       @ 0x8
	.short	99                      @ 0x63
	.short	8                       @ 0x8
	.short	227                     @ 0xe3
	.short	8                       @ 0x8
	.size	static_ltree, 1152

	.type	static_dtree,%object    @ @static_dtree
	.align	1
static_dtree:
	.zero	2
	.short	5                       @ 0x5
	.short	16                      @ 0x10
	.short	5                       @ 0x5
	.short	8                       @ 0x8
	.short	5                       @ 0x5
	.short	24                      @ 0x18
	.short	5                       @ 0x5
	.short	4                       @ 0x4
	.short	5                       @ 0x5
	.short	20                      @ 0x14
	.short	5                       @ 0x5
	.short	12                      @ 0xc
	.short	5                       @ 0x5
	.short	28                      @ 0x1c
	.short	5                       @ 0x5
	.short	2                       @ 0x2
	.short	5                       @ 0x5
	.short	18                      @ 0x12
	.short	5                       @ 0x5
	.short	10                      @ 0xa
	.short	5                       @ 0x5
	.short	26                      @ 0x1a
	.short	5                       @ 0x5
	.short	6                       @ 0x6
	.short	5                       @ 0x5
	.short	22                      @ 0x16
	.short	5                       @ 0x5
	.short	14                      @ 0xe
	.short	5                       @ 0x5
	.short	30                      @ 0x1e
	.short	5                       @ 0x5
	.short	1                       @ 0x1
	.short	5                       @ 0x5
	.short	17                      @ 0x11
	.short	5                       @ 0x5
	.short	9                       @ 0x9
	.short	5                       @ 0x5
	.short	25                      @ 0x19
	.short	5                       @ 0x5
	.short	5                       @ 0x5
	.short	5                       @ 0x5
	.short	21                      @ 0x15
	.short	5                       @ 0x5
	.short	13                      @ 0xd
	.short	5                       @ 0x5
	.short	29                      @ 0x1d
	.short	5                       @ 0x5
	.short	3                       @ 0x3
	.short	5                       @ 0x5
	.short	19                      @ 0x13
	.short	5                       @ 0x5
	.short	11                      @ 0xb
	.short	5                       @ 0x5
	.short	27                      @ 0x1b
	.short	5                       @ 0x5
	.short	7                       @ 0x7
	.short	5                       @ 0x5
	.short	23                      @ 0x17
	.short	5                       @ 0x5
	.size	static_dtree, 120

	.type	extra_lbits,%object     @ @extra_lbits
	.align	2
extra_lbits:
	.long	0                       @ 0x0
	.long	0                       @ 0x0
	.long	0                       @ 0x0
	.long	0                       @ 0x0
	.long	0                       @ 0x0
	.long	0                       @ 0x0
	.long	0                       @ 0x0
	.long	0                       @ 0x0
	.long	1                       @ 0x1
	.long	1                       @ 0x1
	.long	1                       @ 0x1
	.long	1                       @ 0x1
	.long	2                       @ 0x2
	.long	2                       @ 0x2
	.long	2                       @ 0x2
	.long	2                       @ 0x2
	.long	3                       @ 0x3
	.long	3                       @ 0x3
	.long	3                       @ 0x3
	.long	3                       @ 0x3
	.long	4                       @ 0x4
	.long	4                       @ 0x4
	.long	4                       @ 0x4
	.long	4                       @ 0x4
	.long	5                       @ 0x5
	.long	5                       @ 0x5
	.long	5                       @ 0x5
	.long	5                       @ 0x5
	.long	0                       @ 0x0
	.size	extra_lbits, 116

	.type	base_length,%object     @ @base_length
	.align	2
base_length:
	.long	0                       @ 0x0
	.long	1                       @ 0x1
	.long	2                       @ 0x2
	.long	3                       @ 0x3
	.long	4                       @ 0x4
	.long	5                       @ 0x5
	.long	6                       @ 0x6
	.long	7                       @ 0x7
	.long	8                       @ 0x8
	.long	10                      @ 0xa
	.long	12                      @ 0xc
	.long	14                      @ 0xe
	.long	16                      @ 0x10
	.long	20                      @ 0x14
	.long	24                      @ 0x18
	.long	28                      @ 0x1c
	.long	32                      @ 0x20
	.long	40                      @ 0x28
	.long	48                      @ 0x30
	.long	56                      @ 0x38
	.long	64                      @ 0x40
	.long	80                      @ 0x50
	.long	96                      @ 0x60
	.long	112                     @ 0x70
	.long	128                     @ 0x80
	.long	160                     @ 0xa0
	.long	192                     @ 0xc0
	.long	224                     @ 0xe0
	.long	0                       @ 0x0
	.size	base_length, 116

	.type	extra_dbits,%object     @ @extra_dbits
	.align	2
extra_dbits:
	.long	0                       @ 0x0
	.long	0                       @ 0x0
	.long	0                       @ 0x0
	.long	0                       @ 0x0
	.long	1                       @ 0x1
	.long	1                       @ 0x1
	.long	2                       @ 0x2
	.long	2                       @ 0x2
	.long	3                       @ 0x3
	.long	3                       @ 0x3
	.long	4                       @ 0x4
	.long	4                       @ 0x4
	.long	5                       @ 0x5
	.long	5                       @ 0x5
	.long	6                       @ 0x6
	.long	6                       @ 0x6
	.long	7                       @ 0x7
	.long	7                       @ 0x7
	.long	8                       @ 0x8
	.long	8                       @ 0x8
	.long	9                       @ 0x9
	.long	9                       @ 0x9
	.long	10                      @ 0xa
	.long	10                      @ 0xa
	.long	11                      @ 0xb
	.long	11                      @ 0xb
	.long	12                      @ 0xc
	.long	12                      @ 0xc
	.long	13                      @ 0xd
	.long	13                      @ 0xd
	.size	extra_dbits, 120

	.type	base_dist,%object       @ @base_dist
	.align	2
base_dist:
	.long	0                       @ 0x0
	.long	1                       @ 0x1
	.long	2                       @ 0x2
	.long	3                       @ 0x3
	.long	4                       @ 0x4
	.long	6                       @ 0x6
	.long	8                       @ 0x8
	.long	12                      @ 0xc
	.long	16                      @ 0x10
	.long	24                      @ 0x18
	.long	32                      @ 0x20
	.long	48                      @ 0x30
	.long	64                      @ 0x40
	.long	96                      @ 0x60
	.long	128                     @ 0x80
	.long	192                     @ 0xc0
	.long	256                     @ 0x100
	.long	384                     @ 0x180
	.long	512                     @ 0x200
	.long	768                     @ 0x300
	.long	1024                    @ 0x400
	.long	1536                    @ 0x600
	.long	2048                    @ 0x800
	.long	3072                    @ 0xc00
	.long	4096                    @ 0x1000
	.long	6144                    @ 0x1800
	.long	8192                    @ 0x2000
	.long	12288                   @ 0x3000
	.long	16384                   @ 0x4000
	.long	24576                   @ 0x6000
	.size	base_dist, 120

	.type	bl_order,%object        @ @bl_order
bl_order:
	.ascii	 "\020\021\022\000\b\007\t\006\n\005\013\004\f\003\r\002\016\001\017"
	.size	bl_order, 19

	.type	extra_blbits,%object    @ @extra_blbits
	.align	2
extra_blbits:
	.long	0                       @ 0x0
	.long	0                       @ 0x0
	.long	0                       @ 0x0
	.long	0                       @ 0x0
	.long	0                       @ 0x0
	.long	0                       @ 0x0
	.long	0                       @ 0x0
	.long	0                       @ 0x0
	.long	0                       @ 0x0
	.long	0                       @ 0x0
	.long	0                       @ 0x0
	.long	0                       @ 0x0
	.long	0                       @ 0x0
	.long	0                       @ 0x0
	.long	0                       @ 0x0
	.long	0                       @ 0x0
	.long	2                       @ 0x2
	.long	3                       @ 0x3
	.long	7                       @ 0x7
	.size	extra_blbits, 76

	.type	inflate.order,%object   @ @inflate.order
	.align	1
inflate.order:
	.short	16                      @ 0x10
	.short	17                      @ 0x11
	.short	18                      @ 0x12
	.short	0                       @ 0x0
	.short	8                       @ 0x8
	.short	7                       @ 0x7
	.short	9                       @ 0x9
	.short	6                       @ 0x6
	.short	10                      @ 0xa
	.short	5                       @ 0x5
	.short	11                      @ 0xb
	.short	4                       @ 0x4
	.short	12                      @ 0xc
	.short	3                       @ 0x3
	.short	13                      @ 0xd
	.short	2                       @ 0x2
	.short	14                      @ 0xe
	.short	1                       @ 0x1
	.short	15                      @ 0xf
	.size	inflate.order, 38

	.type	.L.str139,%object       @ @.str139
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str139:
	.asciz	 "incorrect header check"
	.size	.L.str139, 23

	.type	.L.str240,%object       @ @.str240
.L.str240:
	.asciz	 "unknown compression method"
	.size	.L.str240, 27

	.type	.L.str341,%object       @ @.str341
.L.str341:
	.asciz	 "invalid window size"
	.size	.L.str341, 20

	.type	.L.str442,%object       @ @.str442
.L.str442:
	.asciz	 "unknown header flags set"
	.size	.L.str442, 25

	.type	.L.str543,%object       @ @.str543
.L.str543:
	.asciz	 "header crc mismatch"
	.size	.L.str543, 20

	.type	.L.str644,%object       @ @.str644
.L.str644:
	.asciz	 "invalid block type"
	.size	.L.str644, 19

	.type	.L.str745,%object       @ @.str745
.L.str745:
	.asciz	 "invalid stored block lengths"
	.size	.L.str745, 29

	.type	.L.str846,%object       @ @.str846
.L.str846:
	.asciz	 "too many length or distance symbols"
	.size	.L.str846, 36

	.type	.L.str947,%object       @ @.str947
.L.str947:
	.asciz	 "invalid code lengths set"
	.size	.L.str947, 25

	.type	.L.str10,%object        @ @.str10
.L.str10:
	.asciz	 "invalid bit length repeat"
	.size	.L.str10, 26

	.type	.L.str11,%object        @ @.str11
.L.str11:
	.asciz	 "invalid code -- missing end-of-block"
	.size	.L.str11, 37

	.type	.L.str12,%object        @ @.str12
.L.str12:
	.asciz	 "invalid literal/lengths set"
	.size	.L.str12, 28

	.type	.L.str1348,%object      @ @.str1348
.L.str1348:
	.asciz	 "invalid distances set"
	.size	.L.str1348, 22

	.type	.L.str17,%object        @ @.str17
.L.str17:
	.asciz	 "incorrect data check"
	.size	.L.str17, 21

	.type	.L.str18,%object        @ @.str18
.L.str18:
	.asciz	 "incorrect length check"
	.size	.L.str18, 23

	.type	fixedtables.lenfix,%object @ @fixedtables.lenfix
	.section	.rodata,"a",%progbits
	.align	1
fixedtables.lenfix:
	.byte	96                      @ 0x60
	.byte	7                       @ 0x7
	.short	0                       @ 0x0
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	80                      @ 0x50
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	16                      @ 0x10
	.byte	20                      @ 0x14
	.byte	8                       @ 0x8
	.short	115                     @ 0x73
	.byte	18                      @ 0x12
	.byte	7                       @ 0x7
	.short	31                      @ 0x1f
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	112                     @ 0x70
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	48                      @ 0x30
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	192                     @ 0xc0
	.byte	16                      @ 0x10
	.byte	7                       @ 0x7
	.short	10                      @ 0xa
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	96                      @ 0x60
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	32                      @ 0x20
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	160                     @ 0xa0
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	0                       @ 0x0
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	128                     @ 0x80
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	64                      @ 0x40
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	224                     @ 0xe0
	.byte	16                      @ 0x10
	.byte	7                       @ 0x7
	.short	6                       @ 0x6
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	88                      @ 0x58
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	24                      @ 0x18
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	144                     @ 0x90
	.byte	19                      @ 0x13
	.byte	7                       @ 0x7
	.short	59                      @ 0x3b
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	120                     @ 0x78
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	56                      @ 0x38
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	208                     @ 0xd0
	.byte	17                      @ 0x11
	.byte	7                       @ 0x7
	.short	17                      @ 0x11
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	104                     @ 0x68
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	40                      @ 0x28
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	176                     @ 0xb0
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	8                       @ 0x8
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	136                     @ 0x88
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	72                      @ 0x48
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	240                     @ 0xf0
	.byte	16                      @ 0x10
	.byte	7                       @ 0x7
	.short	4                       @ 0x4
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	84                      @ 0x54
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	20                      @ 0x14
	.byte	21                      @ 0x15
	.byte	8                       @ 0x8
	.short	227                     @ 0xe3
	.byte	19                      @ 0x13
	.byte	7                       @ 0x7
	.short	43                      @ 0x2b
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	116                     @ 0x74
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	52                      @ 0x34
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	200                     @ 0xc8
	.byte	17                      @ 0x11
	.byte	7                       @ 0x7
	.short	13                      @ 0xd
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	100                     @ 0x64
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	36                      @ 0x24
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	168                     @ 0xa8
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	4                       @ 0x4
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	132                     @ 0x84
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	68                      @ 0x44
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	232                     @ 0xe8
	.byte	16                      @ 0x10
	.byte	7                       @ 0x7
	.short	8                       @ 0x8
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	92                      @ 0x5c
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	28                      @ 0x1c
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	152                     @ 0x98
	.byte	20                      @ 0x14
	.byte	7                       @ 0x7
	.short	83                      @ 0x53
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	124                     @ 0x7c
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	60                      @ 0x3c
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	216                     @ 0xd8
	.byte	18                      @ 0x12
	.byte	7                       @ 0x7
	.short	23                      @ 0x17
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	108                     @ 0x6c
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	44                      @ 0x2c
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	184                     @ 0xb8
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	12                      @ 0xc
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	140                     @ 0x8c
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	76                      @ 0x4c
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	248                     @ 0xf8
	.byte	16                      @ 0x10
	.byte	7                       @ 0x7
	.short	3                       @ 0x3
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	82                      @ 0x52
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	18                      @ 0x12
	.byte	21                      @ 0x15
	.byte	8                       @ 0x8
	.short	163                     @ 0xa3
	.byte	19                      @ 0x13
	.byte	7                       @ 0x7
	.short	35                      @ 0x23
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	114                     @ 0x72
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	50                      @ 0x32
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	196                     @ 0xc4
	.byte	17                      @ 0x11
	.byte	7                       @ 0x7
	.short	11                      @ 0xb
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	98                      @ 0x62
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	34                      @ 0x22
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	164                     @ 0xa4
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	2                       @ 0x2
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	130                     @ 0x82
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	66                      @ 0x42
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	228                     @ 0xe4
	.byte	16                      @ 0x10
	.byte	7                       @ 0x7
	.short	7                       @ 0x7
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	90                      @ 0x5a
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	26                      @ 0x1a
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	148                     @ 0x94
	.byte	20                      @ 0x14
	.byte	7                       @ 0x7
	.short	67                      @ 0x43
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	122                     @ 0x7a
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	58                      @ 0x3a
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	212                     @ 0xd4
	.byte	18                      @ 0x12
	.byte	7                       @ 0x7
	.short	19                      @ 0x13
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	106                     @ 0x6a
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	42                      @ 0x2a
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	180                     @ 0xb4
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	10                      @ 0xa
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	138                     @ 0x8a
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	74                      @ 0x4a
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	244                     @ 0xf4
	.byte	16                      @ 0x10
	.byte	7                       @ 0x7
	.short	5                       @ 0x5
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	86                      @ 0x56
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	22                      @ 0x16
	.byte	64                      @ 0x40
	.byte	8                       @ 0x8
	.short	0                       @ 0x0
	.byte	19                      @ 0x13
	.byte	7                       @ 0x7
	.short	51                      @ 0x33
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	118                     @ 0x76
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	54                      @ 0x36
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	204                     @ 0xcc
	.byte	17                      @ 0x11
	.byte	7                       @ 0x7
	.short	15                      @ 0xf
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	102                     @ 0x66
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	38                      @ 0x26
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	172                     @ 0xac
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	6                       @ 0x6
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	134                     @ 0x86
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	70                      @ 0x46
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	236                     @ 0xec
	.byte	16                      @ 0x10
	.byte	7                       @ 0x7
	.short	9                       @ 0x9
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	94                      @ 0x5e
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	30                      @ 0x1e
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	156                     @ 0x9c
	.byte	20                      @ 0x14
	.byte	7                       @ 0x7
	.short	99                      @ 0x63
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	126                     @ 0x7e
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	62                      @ 0x3e
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	220                     @ 0xdc
	.byte	18                      @ 0x12
	.byte	7                       @ 0x7
	.short	27                      @ 0x1b
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	110                     @ 0x6e
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	46                      @ 0x2e
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	188                     @ 0xbc
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	14                      @ 0xe
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	142                     @ 0x8e
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	78                      @ 0x4e
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	252                     @ 0xfc
	.byte	96                      @ 0x60
	.byte	7                       @ 0x7
	.short	0                       @ 0x0
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	81                      @ 0x51
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	17                      @ 0x11
	.byte	21                      @ 0x15
	.byte	8                       @ 0x8
	.short	131                     @ 0x83
	.byte	18                      @ 0x12
	.byte	7                       @ 0x7
	.short	31                      @ 0x1f
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	113                     @ 0x71
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	49                      @ 0x31
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	194                     @ 0xc2
	.byte	16                      @ 0x10
	.byte	7                       @ 0x7
	.short	10                      @ 0xa
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	97                      @ 0x61
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	33                      @ 0x21
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	162                     @ 0xa2
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	1                       @ 0x1
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	129                     @ 0x81
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	65                      @ 0x41
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	226                     @ 0xe2
	.byte	16                      @ 0x10
	.byte	7                       @ 0x7
	.short	6                       @ 0x6
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	89                      @ 0x59
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	25                      @ 0x19
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	146                     @ 0x92
	.byte	19                      @ 0x13
	.byte	7                       @ 0x7
	.short	59                      @ 0x3b
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	121                     @ 0x79
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	57                      @ 0x39
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	210                     @ 0xd2
	.byte	17                      @ 0x11
	.byte	7                       @ 0x7
	.short	17                      @ 0x11
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	105                     @ 0x69
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	41                      @ 0x29
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	178                     @ 0xb2
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	9                       @ 0x9
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	137                     @ 0x89
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	73                      @ 0x49
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	242                     @ 0xf2
	.byte	16                      @ 0x10
	.byte	7                       @ 0x7
	.short	4                       @ 0x4
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	85                      @ 0x55
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	21                      @ 0x15
	.byte	16                      @ 0x10
	.byte	8                       @ 0x8
	.short	258                     @ 0x102
	.byte	19                      @ 0x13
	.byte	7                       @ 0x7
	.short	43                      @ 0x2b
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	117                     @ 0x75
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	53                      @ 0x35
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	202                     @ 0xca
	.byte	17                      @ 0x11
	.byte	7                       @ 0x7
	.short	13                      @ 0xd
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	101                     @ 0x65
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	37                      @ 0x25
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	170                     @ 0xaa
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	5                       @ 0x5
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	133                     @ 0x85
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	69                      @ 0x45
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	234                     @ 0xea
	.byte	16                      @ 0x10
	.byte	7                       @ 0x7
	.short	8                       @ 0x8
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	93                      @ 0x5d
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	29                      @ 0x1d
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	154                     @ 0x9a
	.byte	20                      @ 0x14
	.byte	7                       @ 0x7
	.short	83                      @ 0x53
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	125                     @ 0x7d
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	61                      @ 0x3d
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	218                     @ 0xda
	.byte	18                      @ 0x12
	.byte	7                       @ 0x7
	.short	23                      @ 0x17
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	109                     @ 0x6d
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	45                      @ 0x2d
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	186                     @ 0xba
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	13                      @ 0xd
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	141                     @ 0x8d
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	77                      @ 0x4d
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	250                     @ 0xfa
	.byte	16                      @ 0x10
	.byte	7                       @ 0x7
	.short	3                       @ 0x3
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	83                      @ 0x53
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	19                      @ 0x13
	.byte	21                      @ 0x15
	.byte	8                       @ 0x8
	.short	195                     @ 0xc3
	.byte	19                      @ 0x13
	.byte	7                       @ 0x7
	.short	35                      @ 0x23
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	115                     @ 0x73
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	51                      @ 0x33
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	198                     @ 0xc6
	.byte	17                      @ 0x11
	.byte	7                       @ 0x7
	.short	11                      @ 0xb
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	99                      @ 0x63
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	35                      @ 0x23
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	166                     @ 0xa6
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	3                       @ 0x3
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	131                     @ 0x83
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	67                      @ 0x43
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	230                     @ 0xe6
	.byte	16                      @ 0x10
	.byte	7                       @ 0x7
	.short	7                       @ 0x7
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	91                      @ 0x5b
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	27                      @ 0x1b
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	150                     @ 0x96
	.byte	20                      @ 0x14
	.byte	7                       @ 0x7
	.short	67                      @ 0x43
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	123                     @ 0x7b
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	59                      @ 0x3b
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	214                     @ 0xd6
	.byte	18                      @ 0x12
	.byte	7                       @ 0x7
	.short	19                      @ 0x13
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	107                     @ 0x6b
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	43                      @ 0x2b
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	182                     @ 0xb6
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	11                      @ 0xb
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	139                     @ 0x8b
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	75                      @ 0x4b
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	246                     @ 0xf6
	.byte	16                      @ 0x10
	.byte	7                       @ 0x7
	.short	5                       @ 0x5
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	87                      @ 0x57
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	23                      @ 0x17
	.byte	64                      @ 0x40
	.byte	8                       @ 0x8
	.short	0                       @ 0x0
	.byte	19                      @ 0x13
	.byte	7                       @ 0x7
	.short	51                      @ 0x33
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	119                     @ 0x77
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	55                      @ 0x37
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	206                     @ 0xce
	.byte	17                      @ 0x11
	.byte	7                       @ 0x7
	.short	15                      @ 0xf
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	103                     @ 0x67
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	39                      @ 0x27
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	174                     @ 0xae
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	7                       @ 0x7
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	135                     @ 0x87
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	71                      @ 0x47
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	238                     @ 0xee
	.byte	16                      @ 0x10
	.byte	7                       @ 0x7
	.short	9                       @ 0x9
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	95                      @ 0x5f
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	31                      @ 0x1f
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	158                     @ 0x9e
	.byte	20                      @ 0x14
	.byte	7                       @ 0x7
	.short	99                      @ 0x63
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	127                     @ 0x7f
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	63                      @ 0x3f
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	222                     @ 0xde
	.byte	18                      @ 0x12
	.byte	7                       @ 0x7
	.short	27                      @ 0x1b
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	111                     @ 0x6f
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	47                      @ 0x2f
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	190                     @ 0xbe
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	15                      @ 0xf
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	143                     @ 0x8f
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	79                      @ 0x4f
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	254                     @ 0xfe
	.byte	96                      @ 0x60
	.byte	7                       @ 0x7
	.short	0                       @ 0x0
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	80                      @ 0x50
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	16                      @ 0x10
	.byte	20                      @ 0x14
	.byte	8                       @ 0x8
	.short	115                     @ 0x73
	.byte	18                      @ 0x12
	.byte	7                       @ 0x7
	.short	31                      @ 0x1f
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	112                     @ 0x70
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	48                      @ 0x30
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	193                     @ 0xc1
	.byte	16                      @ 0x10
	.byte	7                       @ 0x7
	.short	10                      @ 0xa
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	96                      @ 0x60
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	32                      @ 0x20
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	161                     @ 0xa1
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	0                       @ 0x0
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	128                     @ 0x80
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	64                      @ 0x40
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	225                     @ 0xe1
	.byte	16                      @ 0x10
	.byte	7                       @ 0x7
	.short	6                       @ 0x6
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	88                      @ 0x58
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	24                      @ 0x18
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	145                     @ 0x91
	.byte	19                      @ 0x13
	.byte	7                       @ 0x7
	.short	59                      @ 0x3b
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	120                     @ 0x78
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	56                      @ 0x38
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	209                     @ 0xd1
	.byte	17                      @ 0x11
	.byte	7                       @ 0x7
	.short	17                      @ 0x11
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	104                     @ 0x68
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	40                      @ 0x28
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	177                     @ 0xb1
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	8                       @ 0x8
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	136                     @ 0x88
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	72                      @ 0x48
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	241                     @ 0xf1
	.byte	16                      @ 0x10
	.byte	7                       @ 0x7
	.short	4                       @ 0x4
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	84                      @ 0x54
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	20                      @ 0x14
	.byte	21                      @ 0x15
	.byte	8                       @ 0x8
	.short	227                     @ 0xe3
	.byte	19                      @ 0x13
	.byte	7                       @ 0x7
	.short	43                      @ 0x2b
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	116                     @ 0x74
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	52                      @ 0x34
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	201                     @ 0xc9
	.byte	17                      @ 0x11
	.byte	7                       @ 0x7
	.short	13                      @ 0xd
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	100                     @ 0x64
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	36                      @ 0x24
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	169                     @ 0xa9
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	4                       @ 0x4
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	132                     @ 0x84
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	68                      @ 0x44
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	233                     @ 0xe9
	.byte	16                      @ 0x10
	.byte	7                       @ 0x7
	.short	8                       @ 0x8
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	92                      @ 0x5c
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	28                      @ 0x1c
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	153                     @ 0x99
	.byte	20                      @ 0x14
	.byte	7                       @ 0x7
	.short	83                      @ 0x53
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	124                     @ 0x7c
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	60                      @ 0x3c
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	217                     @ 0xd9
	.byte	18                      @ 0x12
	.byte	7                       @ 0x7
	.short	23                      @ 0x17
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	108                     @ 0x6c
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	44                      @ 0x2c
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	185                     @ 0xb9
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	12                      @ 0xc
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	140                     @ 0x8c
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	76                      @ 0x4c
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	249                     @ 0xf9
	.byte	16                      @ 0x10
	.byte	7                       @ 0x7
	.short	3                       @ 0x3
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	82                      @ 0x52
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	18                      @ 0x12
	.byte	21                      @ 0x15
	.byte	8                       @ 0x8
	.short	163                     @ 0xa3
	.byte	19                      @ 0x13
	.byte	7                       @ 0x7
	.short	35                      @ 0x23
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	114                     @ 0x72
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	50                      @ 0x32
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	197                     @ 0xc5
	.byte	17                      @ 0x11
	.byte	7                       @ 0x7
	.short	11                      @ 0xb
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	98                      @ 0x62
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	34                      @ 0x22
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	165                     @ 0xa5
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	2                       @ 0x2
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	130                     @ 0x82
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	66                      @ 0x42
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	229                     @ 0xe5
	.byte	16                      @ 0x10
	.byte	7                       @ 0x7
	.short	7                       @ 0x7
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	90                      @ 0x5a
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	26                      @ 0x1a
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	149                     @ 0x95
	.byte	20                      @ 0x14
	.byte	7                       @ 0x7
	.short	67                      @ 0x43
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	122                     @ 0x7a
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	58                      @ 0x3a
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	213                     @ 0xd5
	.byte	18                      @ 0x12
	.byte	7                       @ 0x7
	.short	19                      @ 0x13
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	106                     @ 0x6a
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	42                      @ 0x2a
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	181                     @ 0xb5
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	10                      @ 0xa
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	138                     @ 0x8a
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	74                      @ 0x4a
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	245                     @ 0xf5
	.byte	16                      @ 0x10
	.byte	7                       @ 0x7
	.short	5                       @ 0x5
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	86                      @ 0x56
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	22                      @ 0x16
	.byte	64                      @ 0x40
	.byte	8                       @ 0x8
	.short	0                       @ 0x0
	.byte	19                      @ 0x13
	.byte	7                       @ 0x7
	.short	51                      @ 0x33
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	118                     @ 0x76
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	54                      @ 0x36
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	205                     @ 0xcd
	.byte	17                      @ 0x11
	.byte	7                       @ 0x7
	.short	15                      @ 0xf
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	102                     @ 0x66
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	38                      @ 0x26
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	173                     @ 0xad
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	6                       @ 0x6
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	134                     @ 0x86
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	70                      @ 0x46
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	237                     @ 0xed
	.byte	16                      @ 0x10
	.byte	7                       @ 0x7
	.short	9                       @ 0x9
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	94                      @ 0x5e
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	30                      @ 0x1e
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	157                     @ 0x9d
	.byte	20                      @ 0x14
	.byte	7                       @ 0x7
	.short	99                      @ 0x63
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	126                     @ 0x7e
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	62                      @ 0x3e
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	221                     @ 0xdd
	.byte	18                      @ 0x12
	.byte	7                       @ 0x7
	.short	27                      @ 0x1b
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	110                     @ 0x6e
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	46                      @ 0x2e
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	189                     @ 0xbd
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	14                      @ 0xe
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	142                     @ 0x8e
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	78                      @ 0x4e
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	253                     @ 0xfd
	.byte	96                      @ 0x60
	.byte	7                       @ 0x7
	.short	0                       @ 0x0
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	81                      @ 0x51
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	17                      @ 0x11
	.byte	21                      @ 0x15
	.byte	8                       @ 0x8
	.short	131                     @ 0x83
	.byte	18                      @ 0x12
	.byte	7                       @ 0x7
	.short	31                      @ 0x1f
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	113                     @ 0x71
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	49                      @ 0x31
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	195                     @ 0xc3
	.byte	16                      @ 0x10
	.byte	7                       @ 0x7
	.short	10                      @ 0xa
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	97                      @ 0x61
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	33                      @ 0x21
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	163                     @ 0xa3
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	1                       @ 0x1
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	129                     @ 0x81
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	65                      @ 0x41
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	227                     @ 0xe3
	.byte	16                      @ 0x10
	.byte	7                       @ 0x7
	.short	6                       @ 0x6
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	89                      @ 0x59
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	25                      @ 0x19
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	147                     @ 0x93
	.byte	19                      @ 0x13
	.byte	7                       @ 0x7
	.short	59                      @ 0x3b
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	121                     @ 0x79
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	57                      @ 0x39
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	211                     @ 0xd3
	.byte	17                      @ 0x11
	.byte	7                       @ 0x7
	.short	17                      @ 0x11
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	105                     @ 0x69
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	41                      @ 0x29
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	179                     @ 0xb3
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	9                       @ 0x9
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	137                     @ 0x89
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	73                      @ 0x49
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	243                     @ 0xf3
	.byte	16                      @ 0x10
	.byte	7                       @ 0x7
	.short	4                       @ 0x4
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	85                      @ 0x55
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	21                      @ 0x15
	.byte	16                      @ 0x10
	.byte	8                       @ 0x8
	.short	258                     @ 0x102
	.byte	19                      @ 0x13
	.byte	7                       @ 0x7
	.short	43                      @ 0x2b
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	117                     @ 0x75
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	53                      @ 0x35
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	203                     @ 0xcb
	.byte	17                      @ 0x11
	.byte	7                       @ 0x7
	.short	13                      @ 0xd
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	101                     @ 0x65
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	37                      @ 0x25
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	171                     @ 0xab
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	5                       @ 0x5
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	133                     @ 0x85
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	69                      @ 0x45
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	235                     @ 0xeb
	.byte	16                      @ 0x10
	.byte	7                       @ 0x7
	.short	8                       @ 0x8
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	93                      @ 0x5d
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	29                      @ 0x1d
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	155                     @ 0x9b
	.byte	20                      @ 0x14
	.byte	7                       @ 0x7
	.short	83                      @ 0x53
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	125                     @ 0x7d
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	61                      @ 0x3d
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	219                     @ 0xdb
	.byte	18                      @ 0x12
	.byte	7                       @ 0x7
	.short	23                      @ 0x17
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	109                     @ 0x6d
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	45                      @ 0x2d
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	187                     @ 0xbb
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	13                      @ 0xd
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	141                     @ 0x8d
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	77                      @ 0x4d
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	251                     @ 0xfb
	.byte	16                      @ 0x10
	.byte	7                       @ 0x7
	.short	3                       @ 0x3
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	83                      @ 0x53
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	19                      @ 0x13
	.byte	21                      @ 0x15
	.byte	8                       @ 0x8
	.short	195                     @ 0xc3
	.byte	19                      @ 0x13
	.byte	7                       @ 0x7
	.short	35                      @ 0x23
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	115                     @ 0x73
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	51                      @ 0x33
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	199                     @ 0xc7
	.byte	17                      @ 0x11
	.byte	7                       @ 0x7
	.short	11                      @ 0xb
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	99                      @ 0x63
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	35                      @ 0x23
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	167                     @ 0xa7
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	3                       @ 0x3
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	131                     @ 0x83
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	67                      @ 0x43
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	231                     @ 0xe7
	.byte	16                      @ 0x10
	.byte	7                       @ 0x7
	.short	7                       @ 0x7
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	91                      @ 0x5b
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	27                      @ 0x1b
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	151                     @ 0x97
	.byte	20                      @ 0x14
	.byte	7                       @ 0x7
	.short	67                      @ 0x43
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	123                     @ 0x7b
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	59                      @ 0x3b
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	215                     @ 0xd7
	.byte	18                      @ 0x12
	.byte	7                       @ 0x7
	.short	19                      @ 0x13
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	107                     @ 0x6b
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	43                      @ 0x2b
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	183                     @ 0xb7
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	11                      @ 0xb
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	139                     @ 0x8b
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	75                      @ 0x4b
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	247                     @ 0xf7
	.byte	16                      @ 0x10
	.byte	7                       @ 0x7
	.short	5                       @ 0x5
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	87                      @ 0x57
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	23                      @ 0x17
	.byte	64                      @ 0x40
	.byte	8                       @ 0x8
	.short	0                       @ 0x0
	.byte	19                      @ 0x13
	.byte	7                       @ 0x7
	.short	51                      @ 0x33
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	119                     @ 0x77
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	55                      @ 0x37
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	207                     @ 0xcf
	.byte	17                      @ 0x11
	.byte	7                       @ 0x7
	.short	15                      @ 0xf
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	103                     @ 0x67
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	39                      @ 0x27
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	175                     @ 0xaf
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	7                       @ 0x7
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	135                     @ 0x87
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	71                      @ 0x47
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	239                     @ 0xef
	.byte	16                      @ 0x10
	.byte	7                       @ 0x7
	.short	9                       @ 0x9
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	95                      @ 0x5f
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	31                      @ 0x1f
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	159                     @ 0x9f
	.byte	20                      @ 0x14
	.byte	7                       @ 0x7
	.short	99                      @ 0x63
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	127                     @ 0x7f
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	63                      @ 0x3f
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	223                     @ 0xdf
	.byte	18                      @ 0x12
	.byte	7                       @ 0x7
	.short	27                      @ 0x1b
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	111                     @ 0x6f
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	47                      @ 0x2f
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	191                     @ 0xbf
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	15                      @ 0xf
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	143                     @ 0x8f
	.byte	0                       @ 0x0
	.byte	8                       @ 0x8
	.short	79                      @ 0x4f
	.byte	0                       @ 0x0
	.byte	9                       @ 0x9
	.short	255                     @ 0xff
	.size	fixedtables.lenfix, 2048

	.type	fixedtables.distfix,%object @ @fixedtables.distfix
	.align	1
fixedtables.distfix:
	.byte	16                      @ 0x10
	.byte	5                       @ 0x5
	.short	1                       @ 0x1
	.byte	23                      @ 0x17
	.byte	5                       @ 0x5
	.short	257                     @ 0x101
	.byte	19                      @ 0x13
	.byte	5                       @ 0x5
	.short	17                      @ 0x11
	.byte	27                      @ 0x1b
	.byte	5                       @ 0x5
	.short	4097                    @ 0x1001
	.byte	17                      @ 0x11
	.byte	5                       @ 0x5
	.short	5                       @ 0x5
	.byte	25                      @ 0x19
	.byte	5                       @ 0x5
	.short	1025                    @ 0x401
	.byte	21                      @ 0x15
	.byte	5                       @ 0x5
	.short	65                      @ 0x41
	.byte	29                      @ 0x1d
	.byte	5                       @ 0x5
	.short	16385                   @ 0x4001
	.byte	16                      @ 0x10
	.byte	5                       @ 0x5
	.short	3                       @ 0x3
	.byte	24                      @ 0x18
	.byte	5                       @ 0x5
	.short	513                     @ 0x201
	.byte	20                      @ 0x14
	.byte	5                       @ 0x5
	.short	33                      @ 0x21
	.byte	28                      @ 0x1c
	.byte	5                       @ 0x5
	.short	8193                    @ 0x2001
	.byte	18                      @ 0x12
	.byte	5                       @ 0x5
	.short	9                       @ 0x9
	.byte	26                      @ 0x1a
	.byte	5                       @ 0x5
	.short	2049                    @ 0x801
	.byte	22                      @ 0x16
	.byte	5                       @ 0x5
	.short	129                     @ 0x81
	.byte	64                      @ 0x40
	.byte	5                       @ 0x5
	.short	0                       @ 0x0
	.byte	16                      @ 0x10
	.byte	5                       @ 0x5
	.short	2                       @ 0x2
	.byte	23                      @ 0x17
	.byte	5                       @ 0x5
	.short	385                     @ 0x181
	.byte	19                      @ 0x13
	.byte	5                       @ 0x5
	.short	25                      @ 0x19
	.byte	27                      @ 0x1b
	.byte	5                       @ 0x5
	.short	6145                    @ 0x1801
	.byte	17                      @ 0x11
	.byte	5                       @ 0x5
	.short	7                       @ 0x7
	.byte	25                      @ 0x19
	.byte	5                       @ 0x5
	.short	1537                    @ 0x601
	.byte	21                      @ 0x15
	.byte	5                       @ 0x5
	.short	97                      @ 0x61
	.byte	29                      @ 0x1d
	.byte	5                       @ 0x5
	.short	24577                   @ 0x6001
	.byte	16                      @ 0x10
	.byte	5                       @ 0x5
	.short	4                       @ 0x4
	.byte	24                      @ 0x18
	.byte	5                       @ 0x5
	.short	769                     @ 0x301
	.byte	20                      @ 0x14
	.byte	5                       @ 0x5
	.short	49                      @ 0x31
	.byte	28                      @ 0x1c
	.byte	5                       @ 0x5
	.short	12289                   @ 0x3001
	.byte	18                      @ 0x12
	.byte	5                       @ 0x5
	.short	13                      @ 0xd
	.byte	26                      @ 0x1a
	.byte	5                       @ 0x5
	.short	3073                    @ 0xc01
	.byte	22                      @ 0x16
	.byte	5                       @ 0x5
	.short	193                     @ 0xc1
	.byte	64                      @ 0x40
	.byte	5                       @ 0x5
	.short	0                       @ 0x0
	.size	fixedtables.distfix, 128

	.type	inflate_copyright,%object @ @inflate_copyright
	.globl	inflate_copyright
inflate_copyright:
	.asciz	 " inflate 1.2.7 Copyright 1995-2012 Mark Adler "
	.size	inflate_copyright, 47

	.type	inflate_table.lbase,%object @ @inflate_table.lbase
	.align	1
inflate_table.lbase:
	.short	3                       @ 0x3
	.short	4                       @ 0x4
	.short	5                       @ 0x5
	.short	6                       @ 0x6
	.short	7                       @ 0x7
	.short	8                       @ 0x8
	.short	9                       @ 0x9
	.short	10                      @ 0xa
	.short	11                      @ 0xb
	.short	13                      @ 0xd
	.short	15                      @ 0xf
	.short	17                      @ 0x11
	.short	19                      @ 0x13
	.short	23                      @ 0x17
	.short	27                      @ 0x1b
	.short	31                      @ 0x1f
	.short	35                      @ 0x23
	.short	43                      @ 0x2b
	.short	51                      @ 0x33
	.short	59                      @ 0x3b
	.short	67                      @ 0x43
	.short	83                      @ 0x53
	.short	99                      @ 0x63
	.short	115                     @ 0x73
	.short	131                     @ 0x83
	.short	163                     @ 0xa3
	.short	195                     @ 0xc3
	.short	227                     @ 0xe3
	.short	258                     @ 0x102
	.short	0                       @ 0x0
	.short	0                       @ 0x0
	.size	inflate_table.lbase, 62

	.type	inflate_table.lext,%object @ @inflate_table.lext
	.align	1
inflate_table.lext:
	.short	16                      @ 0x10
	.short	16                      @ 0x10
	.short	16                      @ 0x10
	.short	16                      @ 0x10
	.short	16                      @ 0x10
	.short	16                      @ 0x10
	.short	16                      @ 0x10
	.short	16                      @ 0x10
	.short	17                      @ 0x11
	.short	17                      @ 0x11
	.short	17                      @ 0x11
	.short	17                      @ 0x11
	.short	18                      @ 0x12
	.short	18                      @ 0x12
	.short	18                      @ 0x12
	.short	18                      @ 0x12
	.short	19                      @ 0x13
	.short	19                      @ 0x13
	.short	19                      @ 0x13
	.short	19                      @ 0x13
	.short	20                      @ 0x14
	.short	20                      @ 0x14
	.short	20                      @ 0x14
	.short	20                      @ 0x14
	.short	21                      @ 0x15
	.short	21                      @ 0x15
	.short	21                      @ 0x15
	.short	21                      @ 0x15
	.short	16                      @ 0x10
	.short	78                      @ 0x4e
	.short	68                      @ 0x44
	.size	inflate_table.lext, 62

	.type	inflate_table.dbase,%object @ @inflate_table.dbase
	.align	1
inflate_table.dbase:
	.short	1                       @ 0x1
	.short	2                       @ 0x2
	.short	3                       @ 0x3
	.short	4                       @ 0x4
	.short	5                       @ 0x5
	.short	7                       @ 0x7
	.short	9                       @ 0x9
	.short	13                      @ 0xd
	.short	17                      @ 0x11
	.short	25                      @ 0x19
	.short	33                      @ 0x21
	.short	49                      @ 0x31
	.short	65                      @ 0x41
	.short	97                      @ 0x61
	.short	129                     @ 0x81
	.short	193                     @ 0xc1
	.short	257                     @ 0x101
	.short	385                     @ 0x181
	.short	513                     @ 0x201
	.short	769                     @ 0x301
	.short	1025                    @ 0x401
	.short	1537                    @ 0x601
	.short	2049                    @ 0x801
	.short	3073                    @ 0xc01
	.short	4097                    @ 0x1001
	.short	6145                    @ 0x1801
	.short	8193                    @ 0x2001
	.short	12289                   @ 0x3001
	.short	16385                   @ 0x4001
	.short	24577                   @ 0x6001
	.short	0                       @ 0x0
	.short	0                       @ 0x0
	.size	inflate_table.dbase, 64

	.type	inflate_table.dext,%object @ @inflate_table.dext
	.align	1
inflate_table.dext:
	.short	16                      @ 0x10
	.short	16                      @ 0x10
	.short	16                      @ 0x10
	.short	16                      @ 0x10
	.short	17                      @ 0x11
	.short	17                      @ 0x11
	.short	18                      @ 0x12
	.short	18                      @ 0x12
	.short	19                      @ 0x13
	.short	19                      @ 0x13
	.short	20                      @ 0x14
	.short	20                      @ 0x14
	.short	21                      @ 0x15
	.short	21                      @ 0x15
	.short	22                      @ 0x16
	.short	22                      @ 0x16
	.short	23                      @ 0x17
	.short	23                      @ 0x17
	.short	24                      @ 0x18
	.short	24                      @ 0x18
	.short	25                      @ 0x19
	.short	25                      @ 0x19
	.short	26                      @ 0x1a
	.short	26                      @ 0x1a
	.short	27                      @ 0x1b
	.short	27                      @ 0x1b
	.short	28                      @ 0x1c
	.short	28                      @ 0x1c
	.short	29                      @ 0x1d
	.short	29                      @ 0x1d
	.short	64                      @ 0x40
	.short	64                      @ 0x40
	.size	inflate_table.dext, 64

	.type	.L.str54,%object        @ @.str54
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str54:
	.asciz	 "invalid distance too far back"
	.size	.L.str54, 30

	.type	.L.str155,%object       @ @.str155
.L.str155:
	.asciz	 "invalid distance code"
	.size	.L.str155, 22

	.type	.L.str256,%object       @ @.str256
.L.str256:
	.asciz	 "invalid literal/length code"
	.size	.L.str256, 28

	.type	_MergedGlobals,%object  @ @_MergedGlobals
	.section	.data.rel.local,"aw",%progbits
	.align	4
_MergedGlobals:
	.long	static_ltree
	.long	extra_lbits
	.long	257                     @ 0x101
	.long	286                     @ 0x11e
	.long	15                      @ 0xf
	.long	static_dtree
	.long	extra_dbits
	.long	0                       @ 0x0
	.long	30                      @ 0x1e
	.long	15                      @ 0xf
	.long	0
	.long	extra_blbits
	.long	0                       @ 0x0
	.long	19                      @ 0x13
	.long	7                       @ 0x7
	.size	_MergedGlobals, 60


