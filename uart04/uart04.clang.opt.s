	.syntax unified
	.eabi_attribute 6, 6
	.eabi_attribute 10, 2
	.fpu vfpv2
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.file	"uart04.clang.opt.bc"
	.text
	.globl	uart_init
	.align	2
	.type	uart_init,%function
uart_init:                              @ @uart_init
@ BB#0:
	push	{r4, r5, lr}
	ldr	r0, .LCPI0_0
	mov	r1, #1
	bl	PUT32
	ldr	r5, .LCPI0_1
	mov	r1, #0
	mov	r4, #0
	mov	r0, r5
	bl	PUT32
	ldr	r0, .LCPI0_2
	mov	r1, #0
	bl	PUT32
	ldr	r0, .LCPI0_3
	mov	r1, #3
	bl	PUT32
	ldr	r0, .LCPI0_4
	mov	r1, #0
	bl	PUT32
	mov	r0, r5
	mov	r1, #5
	bl	PUT32
	ldr	r0, .LCPI0_5
	mov	r1, #198
	bl	PUT32
	ldr	r0, .LCPI0_6
	mov	r1, #14
	orr	r1, r1, #256
	bl	PUT32
	ldr	r5, .LCPI0_7
	mov	r0, r5
	bl	GET32
	bic	r0, r0, #258048
	orr	r1, r0, #73728
	mov	r0, r5
	bl	PUT32
	ldr	r0, .LCPI0_8
	mov	r1, #0
	bl	PUT32
.LBB0_1:                                @ =>This Inner Loop Header: Depth=1
	mov	r0, r4
	bl	dummy
	add	r4, r4, #1
	cmp	r4, #150
	bne	.LBB0_1
@ BB#2:
	ldr	r0, .LCPI0_9
	mov	r1, #49152
	bl	PUT32
	mov	r4, #0
.LBB0_3:                                @ =>This Inner Loop Header: Depth=1
	mov	r0, r4
	bl	dummy
	add	r4, r4, #1
	cmp	r4, #150
	bne	.LBB0_3
@ BB#4:
	ldr	r0, .LCPI0_9
	mov	r1, #0
	bl	PUT32
	ldr	r0, .LCPI0_2
	mov	r1, #3
	bl	PUT32
	pop	{r4, r5, pc}
	.align	2
@ BB#5:
.LCPI0_0:
	.long	539054084               @ 0x20215004
.LCPI0_1:
	.long	539054148               @ 0x20215044
.LCPI0_2:
	.long	539054176               @ 0x20215060
.LCPI0_3:
	.long	539054156               @ 0x2021504c
.LCPI0_4:
	.long	539054160               @ 0x20215050
.LCPI0_5:
	.long	539054152               @ 0x20215048
.LCPI0_6:
	.long	539054184               @ 0x20215068
.LCPI0_7:
	.long	538968068               @ 0x20200004
.LCPI0_8:
	.long	538968212               @ 0x20200094
.LCPI0_9:
	.long	538968216               @ 0x20200098
.Ltmp0:
	.size	uart_init, .Ltmp0-uart_init

	.globl	uart_putc
	.align	2
	.type	uart_putc,%function
uart_putc:                              @ @uart_putc
@ BB#0:
	push	{r4, lr}
	mov	r4, r0
.LBB1_1:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI1_0
	bl	GET32
	tst	r0, #32
	beq	.LBB1_1
@ BB#2:
	ldr	r0, .LCPI1_1
	mov	r1, r4
	bl	PUT32
	pop	{r4, pc}
	.align	2
@ BB#3:
.LCPI1_0:
	.long	539054164               @ 0x20215054
.LCPI1_1:
	.long	539054144               @ 0x20215040
.Ltmp1:
	.size	uart_putc, .Ltmp1-uart_putc

	.globl	hexstrings
	.align	2
	.type	hexstrings,%function
hexstrings:                             @ @hexstrings
@ BB#0:
	push	{r4, r5, r6, lr}
	mov	r4, r0
	lsr	r6, r4, #28
	mov	r5, #55
.LBB2_1:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI2_0
	bl	GET32
	tst	r0, #32
	beq	.LBB2_1
@ BB#2:                                 @ %uart_putc.exit
	ldr	r0, .LCPI2_1
	orr	r1, r6, #48
	cmp	r4, #-1610612736
	addhs	r1, r5, r4, lsr #28
	bl	PUT32
	mov	r0, #15
	and	r5, r0, r4, lsr #24
.LBB2_3:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI2_0
	bl	GET32
	tst	r0, #32
	beq	.LBB2_3
@ BB#4:                                 @ %uart_putc.exit.1
	ldr	r0, .LCPI2_1
	orr	r1, r5, #48
	cmp	r5, #9
	addhi	r1, r5, #55
	bl	PUT32
	mov	r0, #15
	and	r5, r0, r4, lsr #20
.LBB2_5:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI2_0
	bl	GET32
	tst	r0, #32
	beq	.LBB2_5
@ BB#6:                                 @ %uart_putc.exit.2
	ldr	r0, .LCPI2_1
	orr	r1, r5, #48
	cmp	r5, #9
	addhi	r1, r5, #55
	bl	PUT32
	mov	r0, #15
	and	r5, r0, r4, lsr #16
.LBB2_7:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI2_0
	bl	GET32
	tst	r0, #32
	beq	.LBB2_7
@ BB#8:                                 @ %uart_putc.exit.3
	ldr	r0, .LCPI2_1
	orr	r1, r5, #48
	cmp	r5, #9
	addhi	r1, r5, #55
	bl	PUT32
	mov	r0, #15
	and	r5, r0, r4, lsr #12
.LBB2_9:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI2_0
	bl	GET32
	tst	r0, #32
	beq	.LBB2_9
@ BB#10:                                @ %uart_putc.exit.4
	ldr	r0, .LCPI2_1
	orr	r1, r5, #48
	cmp	r5, #9
	addhi	r1, r5, #55
	bl	PUT32
	mov	r0, #15
	and	r5, r0, r4, lsr #8
.LBB2_11:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI2_0
	bl	GET32
	tst	r0, #32
	beq	.LBB2_11
@ BB#12:                                @ %uart_putc.exit.5
	ldr	r0, .LCPI2_1
	orr	r1, r5, #48
	cmp	r5, #9
	addhi	r1, r5, #55
	bl	PUT32
	mov	r0, #15
	and	r5, r0, r4, lsr #4
.LBB2_13:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI2_0
	bl	GET32
	tst	r0, #32
	beq	.LBB2_13
@ BB#14:                                @ %uart_putc.exit.6
	ldr	r0, .LCPI2_1
	orr	r1, r5, #48
	cmp	r5, #9
	addhi	r1, r5, #55
	bl	PUT32
	and	r4, r4, #15
.LBB2_15:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI2_0
	bl	GET32
	tst	r0, #32
	beq	.LBB2_15
@ BB#16:                                @ %uart_putc.exit.7
	ldr	r0, .LCPI2_1
	orr	r1, r4, #48
	cmp	r4, #9
	addhi	r1, r4, #55
	bl	PUT32
.LBB2_17:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI2_0
	bl	GET32
	tst	r0, #32
	beq	.LBB2_17
@ BB#18:                                @ %uart_putc.exit1
	ldr	r0, .LCPI2_1
	mov	r1, #32
	bl	PUT32
	pop	{r4, r5, r6, pc}
	.align	2
@ BB#19:
.LCPI2_0:
	.long	539054164               @ 0x20215054
.LCPI2_1:
	.long	539054144               @ 0x20215040
.Ltmp2:
	.size	hexstrings, .Ltmp2-hexstrings

	.globl	hexstring
	.align	2
	.type	hexstring,%function
hexstring:                              @ @hexstring
@ BB#0:
	push	{lr}
	bl	hexstrings
.LBB3_1:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI3_0
	bl	GET32
	tst	r0, #32
	beq	.LBB3_1
@ BB#2:                                 @ %uart_putc.exit
	ldr	r0, .LCPI3_1
	mov	r1, #13
	bl	PUT32
.LBB3_3:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI3_0
	bl	GET32
	tst	r0, #32
	beq	.LBB3_3
@ BB#4:                                 @ %uart_putc.exit1
	ldr	r0, .LCPI3_1
	mov	r1, #10
	bl	PUT32
	pop	{lr}
	bx	lr
	.align	2
@ BB#5:
.LCPI3_0:
	.long	539054164               @ 0x20215054
.LCPI3_1:
	.long	539054144               @ 0x20215040
.Ltmp3:
	.size	hexstring, .Ltmp3-hexstring

	.globl	c_irq_handler
	.align	2
	.type	c_irq_handler,%function
c_irq_handler:                          @ @c_irq_handler
@ BB#0:
	push	{r4, r5, r6, lr}
	ldr	r0, .LCPI4_0
	bl	GET32
	tst	r0, #1
	popne	{r4, r5, r6, pc}
	ldr	r4, .LCPI4_2
	ldr	r5, .LCPI4_3
	mov	r6, #255
	orr	r6, r6, #3840
.LBB4_1:                                @ %.lr.ph
                                        @ =>This Inner Loop Header: Depth=1
	and	r0, r0, #6
	cmp	r0, #4
	bne	.LBB4_3
@ BB#2:                                 @   in Loop: Header=BB4_1 Depth=1
	ldr	r0, .LCPI4_1
	bl	GET32
	ldr	r1, [r4]
	strb	r0, [r5, r1]
	ldr	r0, [r4]
	add	r0, r0, #1
	and	r0, r0, r6
	str	r0, [r4]
.LBB4_3:                                @ %.backedge
                                        @   in Loop: Header=BB4_1 Depth=1
	ldr	r0, .LCPI4_0
	bl	GET32
	tst	r0, #1
	beq	.LBB4_1
@ BB#4:                                 @ %._crit_edge
	pop	{r4, r5, r6, pc}
	.align	2
@ BB#5:
.LCPI4_0:
	.long	539054152               @ 0x20215048
.LCPI4_1:
	.long	539054144               @ 0x20215040
.LCPI4_2:
	.long	rxhead
.LCPI4_3:
	.long	rxbuffer
.Ltmp4:
	.size	c_irq_handler, .Ltmp4-c_irq_handler

	.globl	notmain
	.align	2
	.type	notmain,%function
notmain:                                @ @notmain
@ BB#0:
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r4, r0
	ldr	r0, .LCPI5_0
	mov	r1, #536870912
	bl	PUT32
	bl	uart_init
	ldr	r0, .LCPI5_1
	bl	hexstrings
.LBB5_1:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_1
@ BB#2:                                 @ %uart_putc.exit.i
	ldr	r0, .LCPI5_3
	mov	r1, #13
	bl	PUT32
.LBB5_3:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_3
@ BB#4:                                 @ %hexstring.exit
	ldr	r0, .LCPI5_3
	mov	r1, #10
	bl	PUT32
	mov	r5, #0
.LBB5_5:                                @ =>This Loop Header: Depth=1
                                        @     Child Loop BB5_6 Depth 2
                                        @     Child Loop BB5_8 Depth 2
	mov	r0, r5
	bl	hexstrings
.LBB5_6:                                @   Parent Loop BB5_5 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_6
@ BB#7:                                 @ %uart_putc.exit.i1
                                        @   in Loop: Header=BB5_5 Depth=1
	ldr	r0, .LCPI5_3
	mov	r1, #13
	bl	PUT32
.LBB5_8:                                @   Parent Loop BB5_5 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_8
@ BB#9:                                 @ %hexstring.exit2
                                        @   in Loop: Header=BB5_5 Depth=1
	ldr	r0, .LCPI5_3
	mov	r1, #10
	bl	PUT32
	add	r5, r5, #1
	cmp	r5, #20
	bne	.LBB5_5
@ BB#10:
	ldr	r0, .LCPI5_1
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
	mov	r0, r4
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
	ldr	r0, .LCPI5_4
	mov	r1, #536870912
	bl	PUT32
	mov	r5, #0
.LBB5_19:                               @ =>This Loop Header: Depth=1
                                        @     Child Loop BB5_21 Depth 2
                                        @     Child Loop BB5_23 Depth 2
                                        @     Child Loop BB5_25 Depth 2
                                        @     Child Loop BB5_27 Depth 2
                                        @     Child Loop BB5_29 Depth 2
                                        @     Child Loop BB5_31 Depth 2
	ldr	r0, .LCPI5_5
	bl	GET32
	tst	r0, #536870912
	beq	.LBB5_19
@ BB#20:                                @   in Loop: Header=BB5_19 Depth=1
	bl	hexstrings
	ldr	r0, .LCPI5_6
	bl	GET32
	bl	hexstrings
	ldr	r0, .LCPI5_7
	bl	GET32
	bl	hexstrings
.LBB5_21:                               @   Parent Loop BB5_19 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_21
@ BB#22:                                @ %uart_putc.exit.i7
                                        @   in Loop: Header=BB5_19 Depth=1
	ldr	r0, .LCPI5_3
	mov	r1, #13
	bl	PUT32
.LBB5_23:                               @   Parent Loop BB5_19 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_23
@ BB#24:                                @ %hexstring.exit8
                                        @   in Loop: Header=BB5_19 Depth=1
	ldr	r4, .LCPI5_3
	mov	r1, #10
	mov	r0, r4
	bl	PUT32
	mov	r0, r4
	bl	GET32
	bl	hexstrings
.LBB5_25:                               @   Parent Loop BB5_19 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_25
@ BB#26:                                @ %uart_putc.exit.i9
                                        @   in Loop: Header=BB5_19 Depth=1
	ldr	r0, .LCPI5_3
	mov	r1, #13
	bl	PUT32
.LBB5_27:                               @   Parent Loop BB5_19 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_27
@ BB#28:                                @ %hexstring.exit10
                                        @   in Loop: Header=BB5_19 Depth=1
	ldr	r0, .LCPI5_3
	mov	r1, #10
	bl	PUT32
	ldr	r0, .LCPI5_5
	bl	GET32
	bl	hexstrings
	ldr	r0, .LCPI5_6
	bl	GET32
	bl	hexstrings
	ldr	r0, .LCPI5_7
	bl	GET32
	bl	hexstrings
.LBB5_29:                               @   Parent Loop BB5_19 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_29
@ BB#30:                                @ %uart_putc.exit.i11
                                        @   in Loop: Header=BB5_19 Depth=1
	ldr	r0, .LCPI5_3
	mov	r1, #13
	bl	PUT32
.LBB5_31:                               @   Parent Loop BB5_19 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_31
@ BB#32:                                @ %hexstring.exit12
                                        @   in Loop: Header=BB5_19 Depth=1
	ldr	r0, .LCPI5_3
	mov	r1, #10
	bl	PUT32
	add	r5, r5, #1
	cmp	r5, #5
	blo	.LBB5_19
@ BB#33:                                @ %.split
	ldr	r0, .LCPI5_1
	bl	hexstrings
.LBB5_34:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_34
@ BB#35:                                @ %uart_putc.exit.i13
	ldr	r0, .LCPI5_3
	mov	r1, #13
	bl	PUT32
.LBB5_36:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_36
@ BB#37:                                @ %hexstring.exit14
	ldr	r0, .LCPI5_3
	mov	r1, #10
	bl	PUT32
	ldr	r5, .LCPI5_8
	ldr	r6, .LCPI5_9
	ldr	r8, .LCPI5_10
	mov	r9, #255
	ldr	r0, [r5]
	mov	r7, #0
	orr	r9, r9, #3840
	str	r0, [r6]
.LBB5_38:                               @ %.preheader
                                        @ =>This Loop Header: Depth=1
                                        @     Child Loop BB5_40 Depth 2
                                        @       Child Loop BB5_42 Depth 3
                                        @     Child Loop BB5_45 Depth 2
	ldr	r0, [r5]
	ldr	r1, [r6]
	b	.LBB5_40
.LBB5_39:                               @ %uart_putc.exit
                                        @   in Loop: Header=BB5_40 Depth=2
	ldr	r0, .LCPI5_3
	mov	r1, r4
	bl	PUT32
	ldr	r0, [r5]
	add	r7, r7, #1
	add	r0, r0, #1
	and	r0, r0, r9
	str	r0, [r5]
	ldr	r0, [r5]
	ldr	r1, [r6]
.LBB5_40:                               @ %.preheader
                                        @   Parent Loop BB5_38 Depth=1
                                        @ =>  This Loop Header: Depth=2
                                        @       Child Loop BB5_42 Depth 3
	cmp	r0, r1
	beq	.LBB5_43
@ BB#41:                                @ %.lr.ph
                                        @   in Loop: Header=BB5_40 Depth=2
	ldr	r0, [r5]
	ldrb	r4, [r8, r0]
.LBB5_42:                               @   Parent Loop BB5_38 Depth=1
                                        @     Parent Loop BB5_40 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_42
	b	.LBB5_39
.LBB5_43:                               @ %._crit_edge
                                        @   in Loop: Header=BB5_38 Depth=1
	ldr	r0, .LCPI5_5
	bl	GET32
	tst	r0, #536870912
	bne	.LBB5_45
	b	.LBB5_47
.LBB5_44:                               @   in Loop: Header=BB5_45 Depth=2
	ldr	r0, .LCPI5_3
	bl	GET32
	ldr	r1, [r6]
	strb	r0, [r8, r1]
	ldr	r0, [r6]
	add	r0, r0, #1
	and	r0, r0, r9
	str	r0, [r6]
.LBB5_45:                               @ %.preheader24
                                        @   Parent Loop BB5_38 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, .LCPI5_6
	bl	GET32
	tst	r0, #1
	bne	.LBB5_47
@ BB#46:                                @ %.lr.ph25
                                        @   in Loop: Header=BB5_45 Depth=2
	and	r0, r0, #6
	cmp	r0, #4
	bne	.LBB5_45
	b	.LBB5_44
.LBB5_47:                               @ %.backedge26
                                        @   in Loop: Header=BB5_38 Depth=1
	cmp	r7, #5
	blo	.LBB5_38
@ BB#48:
	ldr	r0, .LCPI5_1
	bl	hexstrings
.LBB5_49:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_49
@ BB#50:                                @ %uart_putc.exit.i15
	ldr	r0, .LCPI5_3
	mov	r1, #13
	bl	PUT32
.LBB5_51:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_51
@ BB#52:                                @ %hexstring.exit16
	ldr	r0, .LCPI5_3
	mov	r1, #10
	bl	PUT32
	bl	enable_irq
	b	.LBB5_54
.LBB5_53:                               @ %uart_putc.exit17
                                        @   in Loop: Header=BB5_54 Depth=1
	ldr	r0, .LCPI5_3
	mov	r1, r4
	bl	PUT32
	ldr	r0, [r5]
	add	r0, r0, #1
	and	r0, r0, r9
	str	r0, [r5]
.LBB5_54:                               @ %.outer
                                        @ =>This Loop Header: Depth=1
                                        @     Child Loop BB5_56 Depth 2
	ldr	r0, [r5]
	ldr	r1, [r6]
	cmp	r0, r1
	beq	.LBB5_54
@ BB#55:                                @   in Loop: Header=BB5_54 Depth=1
	ldr	r0, [r5]
	ldrb	r4, [r8, r0]
.LBB5_56:                               @   Parent Loop BB5_54 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, .LCPI5_2
	bl	GET32
	tst	r0, #32
	beq	.LBB5_56
	b	.LBB5_53
	.align	2
@ BB#57:
.LCPI5_0:
	.long	536916508               @ 0x2000b21c
.LCPI5_1:
	.long	305419896               @ 0x12345678
.LCPI5_2:
	.long	539054164               @ 0x20215054
.LCPI5_3:
	.long	539054144               @ 0x20215040
.LCPI5_4:
	.long	536916496               @ 0x2000b210
.LCPI5_5:
	.long	536916484               @ 0x2000b204
.LCPI5_6:
	.long	539054152               @ 0x20215048
.LCPI5_7:
	.long	539054180               @ 0x20215064
.LCPI5_8:
	.long	rxtail
.LCPI5_9:
	.long	rxhead
.LCPI5_10:
	.long	rxbuffer
.Ltmp5:
	.size	notmain, .Ltmp5-notmain

	.type	rxhead,%object          @ @rxhead
	.comm	rxhead,4,4
	.type	rxbuffer,%object        @ @rxbuffer
	.comm	rxbuffer,4096,1
	.type	rxtail,%object          @ @rxtail
	.comm	rxtail,4,4

