	.syntax unified
	.eabi_attribute 6, 6
	.eabi_attribute 10, 2
	.fpu vfpv2
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.file	"bootloader03.opt.bc"
	.text
	.globl	uart_lcr
	.align	2
	.type	uart_lcr,%function
uart_lcr:                               @ @uart_lcr
@ BB#0:
	push	{lr}
	ldr	r0, .LCPI0_0
	bl	GET32
	pop	{lr}
	bx	lr
	.align	2
@ BB#1:
.LCPI0_0:
	.long	539054164               @ 0x20215054
.Ltmp0:
	.size	uart_lcr, .Ltmp0-uart_lcr

	.globl	uart_recv
	.align	2
	.type	uart_recv,%function
uart_recv:                              @ @uart_recv
@ BB#0:
	push	{lr}
.LBB1_1:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI1_0
	bl	GET32
	tst	r0, #1
	beq	.LBB1_1
@ BB#2:
	ldr	r0, .LCPI1_1
	bl	GET32
	uxtb	r0, r0
	pop	{lr}
	bx	lr
	.align	2
@ BB#3:
.LCPI1_0:
	.long	539054164               @ 0x20215054
.LCPI1_1:
	.long	539054144               @ 0x20215040
.Ltmp1:
	.size	uart_recv, .Ltmp1-uart_recv

	.globl	uart_send
	.align	2
	.type	uart_send,%function
uart_send:                              @ @uart_send
@ BB#0:
	push	{r4, lr}
	mov	r4, r0
.LBB2_1:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI2_0
	bl	GET32
	tst	r0, #32
	beq	.LBB2_1
@ BB#2:
	ldr	r0, .LCPI2_1
	mov	r1, r4
	bl	PUT32
	pop	{r4, pc}
	.align	2
@ BB#3:
.LCPI2_0:
	.long	539054164               @ 0x20215054
.LCPI2_1:
	.long	539054144               @ 0x20215040
.Ltmp2:
	.size	uart_send, .Ltmp2-uart_send

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
	beq	.LBB3_1
@ BB#2:                                 @ %uart_send.exit
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
	beq	.LBB3_3
@ BB#4:                                 @ %uart_send.exit.1
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
	beq	.LBB3_5
@ BB#6:                                 @ %uart_send.exit.2
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
	beq	.LBB3_7
@ BB#8:                                 @ %uart_send.exit.3
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
	beq	.LBB3_9
@ BB#10:                                @ %uart_send.exit.4
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
	beq	.LBB3_11
@ BB#12:                                @ %uart_send.exit.5
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
	beq	.LBB3_13
@ BB#14:                                @ %uart_send.exit.6
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
	beq	.LBB3_15
@ BB#16:                                @ %uart_send.exit.7
	ldr	r0, .LCPI3_1
	orr	r1, r4, #48
	cmp	r4, #9
	addhi	r1, r4, #55
	bl	PUT32
.LBB3_17:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI3_0
	bl	GET32
	tst	r0, #32
	beq	.LBB3_17
@ BB#18:                                @ %uart_send.exit1
	ldr	r0, .LCPI3_1
	mov	r1, #32
	bl	PUT32
	pop	{r4, r5, r6, pc}
	.align	2
@ BB#19:
.LCPI3_0:
	.long	539054164               @ 0x20215054
.LCPI3_1:
	.long	539054144               @ 0x20215040
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
	beq	.LBB4_1
@ BB#2:                                 @ %uart_send.exit
	ldr	r0, .LCPI4_1
	mov	r1, #13
	bl	PUT32
.LBB4_3:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI4_0
	bl	GET32
	tst	r0, #32
	beq	.LBB4_3
@ BB#4:                                 @ %uart_send.exit1
	ldr	r0, .LCPI4_1
	mov	r1, #10
	bl	PUT32
	pop	{lr}
	bx	lr
	.align	2
@ BB#5:
.LCPI4_0:
	.long	539054164               @ 0x20215054
.LCPI4_1:
	.long	539054144               @ 0x20215040
.Ltmp4:
	.size	hexstring, .Ltmp4-hexstring

	.globl	uart_init
	.align	2
	.type	uart_init,%function
uart_init:                              @ @uart_init
@ BB#0:
	push	{r4, r5, lr}
	ldr	r0, .LCPI5_0
	mov	r1, #1
	bl	PUT32
	ldr	r5, .LCPI5_1
	mov	r1, #0
	mov	r4, #0
	mov	r0, r5
	bl	PUT32
	ldr	r0, .LCPI5_2
	mov	r1, #0
	bl	PUT32
	ldr	r0, .LCPI5_3
	mov	r1, #3
	bl	PUT32
	ldr	r0, .LCPI5_4
	mov	r1, #0
	bl	PUT32
	mov	r0, r5
	mov	r1, #0
	bl	PUT32
	ldr	r0, .LCPI5_5
	mov	r1, #198
	bl	PUT32
	ldr	r0, .LCPI5_6
	mov	r1, #14
	orr	r1, r1, #256
	bl	PUT32
	ldr	r5, .LCPI5_7
	mov	r0, r5
	bl	GET32
	bic	r0, r0, #258048
	orr	r1, r0, #73728
	mov	r0, r5
	bl	PUT32
	ldr	r0, .LCPI5_8
	mov	r1, #0
	bl	PUT32
.LBB5_1:                                @ =>This Inner Loop Header: Depth=1
	mov	r0, r4
	bl	dummy
	add	r4, r4, #1
	cmp	r4, #150
	bne	.LBB5_1
@ BB#2:
	ldr	r0, .LCPI5_9
	mov	r1, #49152
	bl	PUT32
	mov	r4, #0
.LBB5_3:                                @ =>This Inner Loop Header: Depth=1
	mov	r0, r4
	bl	dummy
	add	r4, r4, #1
	cmp	r4, #150
	bne	.LBB5_3
@ BB#4:
	ldr	r0, .LCPI5_9
	mov	r1, #0
	bl	PUT32
	ldr	r0, .LCPI5_2
	mov	r1, #3
	bl	PUT32
	pop	{r4, r5, pc}
	.align	2
@ BB#5:
.LCPI5_0:
	.long	539054084               @ 0x20215004
.LCPI5_1:
	.long	539054148               @ 0x20215044
.LCPI5_2:
	.long	539054176               @ 0x20215060
.LCPI5_3:
	.long	539054156               @ 0x2021504c
.LCPI5_4:
	.long	539054160               @ 0x20215050
.LCPI5_5:
	.long	539054152               @ 0x20215048
.LCPI5_6:
	.long	539054184               @ 0x20215068
.LCPI5_7:
	.long	538968068               @ 0x20200004
.LCPI5_8:
	.long	538968212               @ 0x20200094
.LCPI5_9:
	.long	538968216               @ 0x20200098
.Ltmp5:
	.size	uart_init, .Ltmp5-uart_init

	.globl	timer_init
	.align	2
	.type	timer_init,%function
timer_init:                             @ @timer_init
@ BB#0:
	push	{r4, lr}
	ldr	r4, .LCPI6_0
	mov	r1, #16318464
	mov	r0, r4
	bl	PUT32
	mov	r1, #512
	orr	r1, r1, #16318464
	mov	r0, r4
	bl	PUT32
	pop	{r4, pc}
	.align	2
@ BB#1:
.LCPI6_0:
	.long	536917000               @ 0x2000b408
.Ltmp6:
	.size	timer_init, .Ltmp6-timer_init

	.globl	timer_tick
	.align	2
	.type	timer_tick,%function
timer_tick:                             @ @timer_tick
@ BB#0:
	push	{lr}
	ldr	r0, .LCPI7_0
	bl	GET32
	pop	{lr}
	bx	lr
	.align	2
@ BB#1:
.LCPI7_0:
	.long	536917024               @ 0x2000b420
.Ltmp7:
	.size	timer_tick, .Ltmp7-timer_tick

	.globl	notmain
	.align	2
	.type	notmain,%function
notmain:                                @ @notmain
@ BB#0:
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	bl	uart_init
	ldr	r0, .LCPI8_0
	bl	hexstrings
.LBB8_1:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI8_1
	bl	GET32
	tst	r0, #32
	beq	.LBB8_1
@ BB#2:                                 @ %uart_send.exit.i
	ldr	r0, .LCPI8_2
	mov	r1, #13
	bl	PUT32
.LBB8_3:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI8_1
	bl	GET32
	tst	r0, #32
	beq	.LBB8_3
@ BB#4:                                 @ %hexstring.exit
	ldr	r0, .LCPI8_2
	mov	r1, #10
	bl	PUT32
	bl	GETPC
	bl	hexstrings
.LBB8_5:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI8_1
	bl	GET32
	tst	r0, #32
	beq	.LBB8_5
@ BB#6:                                 @ %uart_send.exit.i2
	ldr	r0, .LCPI8_2
	mov	r1, #13
	bl	PUT32
.LBB8_7:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI8_1
	bl	GET32
	tst	r0, #32
	beq	.LBB8_7
@ BB#8:                                 @ %hexstring.exit3
	ldr	r0, .LCPI8_2
	mov	r1, #10
	bl	PUT32
	ldr	r4, .LCPI8_3
	mov	r1, #16318464
	mov	r0, r4
	bl	PUT32
	mov	r1, #512
	orr	r1, r1, #16318464
	mov	r0, r4
	bl	PUT32
	ldr	r0, .LCPI8_4
	bl	GET32
	ldr	r5, .LCPI8_5
	mov	r9, #0
	mov	r11, r0
	mov	r10, #1
	mov	r6, #32768
	mov	r4, r9
	mov	r7, r9
	b	.LBB8_10
.LBB8_9:                                @   in Loop: Header=BB8_10 Depth=1
	ldrb	r0, [r5, r4]
	add	r4, r4, #1
	add	r7, r0, r8
.LBB8_10:                               @ %.backedge
                                        @ =>This Loop Header: Depth=1
                                        @     Child Loop BB8_11 Depth 2
                                        @     Child Loop BB8_14 Depth 2
                                        @     Child Loop BB8_26 Depth 2
                                        @     Child Loop BB8_23 Depth 2
                                        @     Child Loop BB8_24 Depth 2
                                        @     Child Loop BB8_34 Depth 2
                                        @     Child Loop BB8_20 Depth 2
                                        @     Child Loop BB8_30 Depth 2
	ldr	r0, .LCPI8_4
	mov	r8, r7
	bl	GET32
	mov	r1, #2304
	sub	r0, r0, r11
	orr	r1, r1, #3997696
	cmp	r0, r1
	blo	.LBB8_13
.LBB8_11:                               @ %.preheader30
                                        @   Parent Loop BB8_10 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, .LCPI8_1
	bl	GET32
	tst	r0, #32
	beq	.LBB8_11
@ BB#12:                                @ %uart_send.exit
                                        @   in Loop: Header=BB8_10 Depth=1
	ldr	r0, .LCPI8_2
	mov	r1, #21
	bl	PUT32
	mov	r0, #2304
	orr	r0, r0, #3997696
	add	r11, r11, r0
.LBB8_13:                               @   in Loop: Header=BB8_10 Depth=1
	ldr	r0, .LCPI8_1
	bl	GET32
	mov	r7, r8
	tst	r0, #1
	beq	.LBB8_10
.LBB8_14:                               @ %.preheader31
                                        @   Parent Loop BB8_10 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, .LCPI8_1
	bl	GET32
	tst	r0, #1
	beq	.LBB8_14
@ BB#15:                                @ %uart_recv.exit
                                        @   in Loop: Header=BB8_10 Depth=1
	ldr	r0, .LCPI8_2
	bl	GET32
	mov	r1, r0
	ldr	r0, .LCPI8_4
	strb	r1, [r5, r4]
	bl	GET32
	mov	r11, r0
	cmp	r4, #130
	bhi	.LBB8_21
@ BB#16:                                @ %uart_recv.exit
                                        @   in Loop: Header=BB8_10 Depth=1
	cmp	r4, #0
	beq	.LBB8_28
@ BB#17:                                @ %uart_recv.exit
                                        @   in Loop: Header=BB8_10 Depth=1
	cmp	r4, #1
	bne	.LBB8_31
@ BB#18:                                @   in Loop: Header=BB8_10 Depth=1
	ldrb	r0, [r5, r4]
	cmp	r0, r10
	bne	.LBB8_20
@ BB#19:                                @   in Loop: Header=BB8_10 Depth=1
	add	r7, r10, r8
	mov	r4, #2
	b	.LBB8_10
.LBB8_20:                               @ %.preheader33
                                        @   Parent Loop BB8_10 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, .LCPI8_1
	bl	GET32
	tst	r0, #32
	beq	.LBB8_20
	b	.LBB8_35
.LBB8_21:                               @ %uart_recv.exit
                                        @   in Loop: Header=BB8_10 Depth=1
	cmp	r4, #131
	bne	.LBB8_9
@ BB#22:                                @   in Loop: Header=BB8_10 Depth=1
	ldrb	r0, [r5, r4]
	mov	r4, #0
	uxtb	r7, r8
	cmp	r0, r7
	bne	.LBB8_26
.LBB8_23:                               @ %.preheader35
                                        @   Parent Loop BB8_10 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	add	r1, r5, r4
	add	r0, r6, r4
	ldrb	r1, [r1, #3]
	bl	PUT8
	add	r4, r4, #1
	cmp	r4, #128
	bne	.LBB8_23
.LBB8_24:                               @ %.loopexit
                                        @   Parent Loop BB8_10 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, .LCPI8_1
	bl	GET32
	tst	r0, #32
	beq	.LBB8_24
@ BB#25:                                @ %uart_send.exit8
                                        @   in Loop: Header=BB8_10 Depth=1
	ldr	r0, .LCPI8_2
	mov	r1, #6
	bl	PUT32
	add	r0, r10, #1
	add	r6, r6, #128
	uxtb	r10, r0
	mov	r4, #0
	b	.LBB8_10
.LBB8_26:                               @ %.preheader34
                                        @   Parent Loop BB8_10 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, .LCPI8_1
	bl	GET32
	tst	r0, #32
	beq	.LBB8_26
@ BB#27:                                @ %uart_send.exit9
                                        @   in Loop: Header=BB8_10 Depth=1
	ldr	r0, .LCPI8_2
	mov	r1, #21
	bl	PUT32
	mov	r4, #0
	b	.LBB8_10
.LBB8_28:                               @   in Loop: Header=BB8_10 Depth=1
	ldrb	r0, [r5, r4]
	mov	r4, #1
	mov	r7, r4
	cmp	r0, #1
	beq	.LBB8_10
@ BB#29:                                @   in Loop: Header=BB8_10 Depth=1
	cmp	r0, #4
	beq	.LBB8_36
.LBB8_30:                               @ %.preheader37
                                        @   Parent Loop BB8_10 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, .LCPI8_1
	bl	GET32
	tst	r0, #32
	beq	.LBB8_30
	b	.LBB8_35
.LBB8_31:                               @ %uart_recv.exit
                                        @   in Loop: Header=BB8_10 Depth=1
	cmp	r4, #2
	bne	.LBB8_9
@ BB#32:                                @   in Loop: Header=BB8_10 Depth=1
	ldrb	r0, [r5, r4]
	ldrb	r1, [r5, #1]
	eor	r1, r1, #255
	cmp	r0, r1
	bne	.LBB8_34
@ BB#33:                                @   in Loop: Header=BB8_10 Depth=1
	add	r7, r0, r8
	mov	r4, #3
	b	.LBB8_10
.LBB8_34:                               @ %.preheader32
                                        @   Parent Loop BB8_10 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, .LCPI8_1
	bl	GET32
	tst	r0, #32
	beq	.LBB8_34
.LBB8_35:                               @ %uart_send.exit5
                                        @   in Loop: Header=BB8_10 Depth=1
	ldr	r0, .LCPI8_2
	mov	r1, #21
	bl	PUT32
	mov	r4, r9
	mov	r7, r8
	b	.LBB8_10
.LBB8_36:                               @ %.preheader
                                        @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI8_1
	bl	GET32
	tst	r0, #32
	beq	.LBB8_36
@ BB#37:                                @ %uart_send.exit4
	ldr	r0, .LCPI8_2
	mov	r1, #6
	bl	PUT32
	mov	r0, #32768
	bl	BRANCHTO
	mov	r0, #0
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.align	2
@ BB#38:
.LCPI8_0:
	.long	305419896               @ 0x12345678
.LCPI8_1:
	.long	539054164               @ 0x20215054
.LCPI8_2:
	.long	539054144               @ 0x20215040
.LCPI8_3:
	.long	536917000               @ 0x2000b408
.LCPI8_4:
	.long	536917024               @ 0x2000b420
.LCPI8_5:
	.long	xstring
.Ltmp8:
	.size	notmain, .Ltmp8-notmain

	.type	xstring,%object         @ @xstring
	.comm	xstring,256,1

