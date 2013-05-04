	.syntax unified
	.eabi_attribute 6, 6
	.eabi_attribute 10, 2
	.fpu vfpv2
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.file	"uartx01.clang.opt.bc"
	.text
	.globl	uart_putc
	.align	2
	.type	uart_putc,%function
uart_putc:                              @ @uart_putc
@ BB#0:
	push	{r4, lr}
	mov	r4, r0
.LBB0_1:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI0_0
	bl	GET32
	tst	r0, #32
	bne	.LBB0_1
@ BB#2:
	ldr	r0, .LCPI0_1
	mov	r1, r4
	bl	PUT32
	pop	{r4, pc}
	.align	2
@ BB#3:
.LCPI0_0:
	.long	538972184               @ 0x20201018
.LCPI0_1:
	.long	538972160               @ 0x20201000
.Ltmp0:
	.size	uart_putc, .Ltmp0-uart_putc

	.globl	uart_getc
	.align	2
	.type	uart_getc,%function
uart_getc:                              @ @uart_getc
@ BB#0:
	push	{lr}
.LBB1_1:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI1_0
	bl	GET32
	tst	r0, #16
	bne	.LBB1_1
@ BB#2:
	ldr	r0, .LCPI1_1
	bl	GET32
	pop	{lr}
	bx	lr
	.align	2
@ BB#3:
.LCPI1_0:
	.long	538972184               @ 0x20201018
.LCPI1_1:
	.long	538972160               @ 0x20201000
.Ltmp1:
	.size	uart_getc, .Ltmp1-uart_getc

	.globl	uart_init
	.align	2
	.type	uart_init,%function
uart_init:                              @ @uart_init
@ BB#0:
	push	{r4, r5, lr}
	ldr	r0, .LCPI2_0
	mov	r1, #0
	mov	r4, #0
	bl	PUT32
	ldr	r5, .LCPI2_1
	mov	r0, r5
	bl	GET32
	bic	r0, r0, #258048
	orr	r1, r0, #147456
	mov	r0, r5
	bl	PUT32
	ldr	r0, .LCPI2_2
	mov	r1, #0
	bl	PUT32
.LBB2_1:                                @ =>This Inner Loop Header: Depth=1
	mov	r0, r4
	bl	dummy
	add	r4, r4, #1
	cmp	r4, #150
	bne	.LBB2_1
@ BB#2:
	ldr	r0, .LCPI2_3
	mov	r1, #49152
	bl	PUT32
	mov	r4, #0
.LBB2_3:                                @ =>This Inner Loop Header: Depth=1
	mov	r0, r4
	bl	dummy
	add	r4, r4, #1
	cmp	r4, #150
	bne	.LBB2_3
@ BB#4:
	ldr	r0, .LCPI2_3
	mov	r1, #0
	bl	PUT32
	ldr	r0, .LCPI2_4
	mov	r1, #255
	orr	r1, r1, #1792
	bl	PUT32
	ldr	r0, .LCPI2_5
	mov	r1, #1
	bl	PUT32
	ldr	r0, .LCPI2_6
	mov	r1, #40
	bl	PUT32
	ldr	r0, .LCPI2_7
	mov	r1, #112
	bl	PUT32
	ldr	r0, .LCPI2_0
	mov	r1, #1
	orr	r1, r1, #768
	bl	PUT32
	pop	{r4, r5, pc}
	.align	2
@ BB#5:
.LCPI2_0:
	.long	538972208               @ 0x20201030
.LCPI2_1:
	.long	538968068               @ 0x20200004
.LCPI2_2:
	.long	538968212               @ 0x20200094
.LCPI2_3:
	.long	538968216               @ 0x20200098
.LCPI2_4:
	.long	538972228               @ 0x20201044
.LCPI2_5:
	.long	538972196               @ 0x20201024
.LCPI2_6:
	.long	538972200               @ 0x20201028
.LCPI2_7:
	.long	538972204               @ 0x2020102c
.Ltmp2:
	.size	uart_init, .Ltmp2-uart_init

	.globl	hexstrings
	.align	2
	.type	hexstrings,%function
hexstrings:                             @ @hexstrings
@ BB#0:
	push	{r4, r5, r6, lr}
	mov	r4, r0
	lsr	r6, r4, #28
	mov	r5, #55
.LBB3_1:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI3_0
	bl	GET32
	tst	r0, #32
	bne	.LBB3_1
@ BB#2:                                 @ %uart_putc.exit
	ldr	r0, .LCPI3_1
	orr	r1, r6, #48
	cmp	r4, #-1610612736
	addhs	r1, r5, r4, lsr #28
	bl	PUT32
	mov	r0, #15
	and	r5, r0, r4, lsr #24
.LBB3_3:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI3_0
	bl	GET32
	tst	r0, #32
	bne	.LBB3_3
@ BB#4:                                 @ %uart_putc.exit.1
	ldr	r0, .LCPI3_1
	orr	r1, r5, #48
	cmp	r5, #9
	addhi	r1, r5, #55
	bl	PUT32
	mov	r0, #15
	and	r5, r0, r4, lsr #20
.LBB3_5:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI3_0
	bl	GET32
	tst	r0, #32
	bne	.LBB3_5
@ BB#6:                                 @ %uart_putc.exit.2
	ldr	r0, .LCPI3_1
	orr	r1, r5, #48
	cmp	r5, #9
	addhi	r1, r5, #55
	bl	PUT32
	mov	r0, #15
	and	r5, r0, r4, lsr #16
.LBB3_7:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI3_0
	bl	GET32
	tst	r0, #32
	bne	.LBB3_7
@ BB#8:                                 @ %uart_putc.exit.3
	ldr	r0, .LCPI3_1
	orr	r1, r5, #48
	cmp	r5, #9
	addhi	r1, r5, #55
	bl	PUT32
	mov	r0, #15
	and	r5, r0, r4, lsr #12
.LBB3_9:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI3_0
	bl	GET32
	tst	r0, #32
	bne	.LBB3_9
@ BB#10:                                @ %uart_putc.exit.4
	ldr	r0, .LCPI3_1
	orr	r1, r5, #48
	cmp	r5, #9
	addhi	r1, r5, #55
	bl	PUT32
	mov	r0, #15
	and	r5, r0, r4, lsr #8
.LBB3_11:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI3_0
	bl	GET32
	tst	r0, #32
	bne	.LBB3_11
@ BB#12:                                @ %uart_putc.exit.5
	ldr	r0, .LCPI3_1
	orr	r1, r5, #48
	cmp	r5, #9
	addhi	r1, r5, #55
	bl	PUT32
	mov	r0, #15
	and	r5, r0, r4, lsr #4
.LBB3_13:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI3_0
	bl	GET32
	tst	r0, #32
	bne	.LBB3_13
@ BB#14:                                @ %uart_putc.exit.6
	ldr	r0, .LCPI3_1
	orr	r1, r5, #48
	cmp	r5, #9
	addhi	r1, r5, #55
	bl	PUT32
	and	r4, r4, #15
.LBB3_15:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI3_0
	bl	GET32
	tst	r0, #32
	bne	.LBB3_15
@ BB#16:                                @ %uart_putc.exit.7
	ldr	r0, .LCPI3_1
	orr	r1, r4, #48
	cmp	r4, #9
	addhi	r1, r4, #55
	bl	PUT32
.LBB3_17:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI3_0
	bl	GET32
	tst	r0, #32
	bne	.LBB3_17
@ BB#18:                                @ %uart_putc.exit1
	ldr	r0, .LCPI3_1
	mov	r1, #32
	bl	PUT32
	pop	{r4, r5, r6, pc}
	.align	2
@ BB#19:
.LCPI3_0:
	.long	538972184               @ 0x20201018
.LCPI3_1:
	.long	538972160               @ 0x20201000
.Ltmp3:
	.size	hexstrings, .Ltmp3-hexstrings

	.globl	hexstring
	.align	2
	.type	hexstring,%function
hexstring:                              @ @hexstring
@ BB#0:
	push	{lr}
	bl	hexstrings
.LBB4_1:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI4_0
	bl	GET32
	tst	r0, #32
	bne	.LBB4_1
@ BB#2:                                 @ %uart_putc.exit
	ldr	r0, .LCPI4_1
	mov	r1, #13
	bl	PUT32
.LBB4_3:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI4_0
	bl	GET32
	tst	r0, #32
	bne	.LBB4_3
@ BB#4:                                 @ %uart_putc.exit1
	ldr	r0, .LCPI4_1
	mov	r1, #10
	bl	PUT32
	pop	{lr}
	bx	lr
	.align	2
@ BB#5:
.LCPI4_0:
	.long	538972184               @ 0x20201018
.LCPI4_1:
	.long	538972160               @ 0x20201000
.Ltmp4:
	.size	hexstring, .Ltmp4-hexstring

	.globl	notmain
	.align	2
	.type	notmain,%function
notmain:                                @ @notmain
@ BB#0:
	push	{r4, r5, r6, lr}
	mov	r4, r0
	bl	uart_init
	ldr	r0, .LCPI5_0
	bl	hexstrings
.LBB5_1:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_1
	bl	GET32
	tst	r0, #32
	bne	.LBB5_1
@ BB#2:                                 @ %uart_putc.exit.i
	ldr	r0, .LCPI5_2
	mov	r1, #13
	bl	PUT32
.LBB5_3:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_1
	bl	GET32
	tst	r0, #32
	bne	.LBB5_3
@ BB#4:                                 @ %hexstring.exit
	ldr	r0, .LCPI5_2
	mov	r1, #10
	bl	PUT32
	mov	r0, r4
	bl	hexstrings
.LBB5_5:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_1
	bl	GET32
	tst	r0, #32
	bne	.LBB5_5
@ BB#6:                                 @ %uart_putc.exit.i2
	ldr	r0, .LCPI5_2
	mov	r1, #13
	bl	PUT32
.LBB5_7:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_1
	bl	GET32
	tst	r0, #32
	bne	.LBB5_7
@ BB#8:                                 @ %hexstring.exit3
	ldr	r0, .LCPI5_2
	mov	r1, #10
	bl	PUT32
	mov	r5, #1328
	mov	r4, #0
	orr	r5, r5, #28672
.LBB5_9:                                @ =>This Loop Header: Depth=1
                                        @     Child Loop BB5_10 Depth 2
	and	r6, r4, #7
.LBB5_10:                               @   Parent Loop BB5_9 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, .LCPI5_1
	bl	GET32
	tst	r0, #32
	bne	.LBB5_10
@ BB#11:                                @ %uart_putc.exit
                                        @   in Loop: Header=BB5_9 Depth=1
	ldr	r0, .LCPI5_2
	orr	r1, r6, #48
	bl	PUT32
	add	r4, r4, #1
	cmp	r4, r5
	bne	.LBB5_9
@ BB#12:
	mov	r4, #0
.LBB5_13:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_1
	bl	GET32
	tst	r0, #32
	bne	.LBB5_13
@ BB#14:                                @ %uart_putc.exit4
                                        @   in Loop: Header=BB5_13 Depth=1
	ldr	r0, .LCPI5_2
	mov	r1, #85
	bl	PUT32
	add	r4, r4, #1
	cmp	r4, #100
	bne	.LBB5_13
	b	.LBB5_16
.LBB5_15:                               @ %.lr.ph
                                        @   in Loop: Header=BB5_16 Depth=1
	ldr	r0, .LCPI5_2
	bl	GET32
.LBB5_16:                               @ %.preheader12
                                        @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_1
	bl	GET32
	tst	r0, #16
	bne	.LBB5_18
	b	.LBB5_15
.LBB5_17:                               @ %uart_putc.exit6
                                        @   in Loop: Header=BB5_18 Depth=1
	ldr	r0, .LCPI5_2
	mov	r1, r4
	bl	PUT32
.LBB5_18:                               @ %.preheader11
                                        @ =>This Loop Header: Depth=1
                                        @     Child Loop BB5_20 Depth 2
                                        @     Child Loop BB5_22 Depth 2
	ldr	r0, .LCPI5_1
	bl	GET32
	tst	r0, #16
	bne	.LBB5_18
@ BB#19:                                @ %uart_getc.exit
                                        @   in Loop: Header=BB5_18 Depth=1
	ldr	r0, .LCPI5_2
	bl	GET32
	mov	r4, r0
	cmp	r4, #13
	bne	.LBB5_22
.LBB5_20:                               @ %.preheader
                                        @   Parent Loop BB5_18 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, .LCPI5_1
	bl	GET32
	tst	r0, #32
	bne	.LBB5_20
@ BB#21:                                @ %uart_putc.exit5
                                        @   in Loop: Header=BB5_18 Depth=1
	ldr	r0, .LCPI5_2
	mov	r1, #10
	bl	PUT32
.LBB5_22:                               @ %.preheader10
                                        @   Parent Loop BB5_18 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, .LCPI5_1
	bl	GET32
	tst	r0, #32
	bne	.LBB5_22
	b	.LBB5_17
	.align	2
@ BB#23:
.LCPI5_0:
	.long	305419896               @ 0x12345678
.LCPI5_1:
	.long	538972184               @ 0x20201018
.LCPI5_2:
	.long	538972160               @ 0x20201000
.Ltmp5:
	.size	notmain, .Ltmp5-notmain


