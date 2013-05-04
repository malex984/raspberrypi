	.syntax unified
	.eabi_attribute 6, 6
	.eabi_attribute 10, 2
	.fpu vfpv2
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.file	"bootloader05.opt.bc"
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

	.globl	uart_flush
	.align	2
	.type	uart_flush,%function
uart_flush:                             @ @uart_flush
@ BB#0:
	push	{lr}
.LBB3_1:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI3_0
	bl	GET32
	tst	r0, #256
	bne	.LBB3_1
@ BB#2:
	pop	{lr}
	bx	lr
	.align	2
@ BB#3:
.LCPI3_0:
	.long	539054164               @ 0x20215054
.Ltmp3:
	.size	uart_flush, .Ltmp3-uart_flush

	.globl	hexstrings
	.align	2
	.type	hexstrings,%function
hexstrings:                             @ @hexstrings
@ BB#0:
	push	{r4, r5, r6, lr}
	mov	r4, r0
	lsr	r6, r4, #28
	mov	r5, #55
.LBB4_1:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI4_0
	bl	GET32
	tst	r0, #32
	beq	.LBB4_1
@ BB#2:                                 @ %uart_send.exit
	ldr	r0, .LCPI4_1
	orr	r1, r6, #48
	cmp	r4, #-1610612736
	addhs	r1, r5, r4, lsr #28
	bl	PUT32
	mov	r0, #15
	and	r5, r0, r4, lsr #24
.LBB4_3:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI4_0
	bl	GET32
	tst	r0, #32
	beq	.LBB4_3
@ BB#4:                                 @ %uart_send.exit.1
	ldr	r0, .LCPI4_1
	orr	r1, r5, #48
	cmp	r5, #9
	addhi	r1, r5, #55
	bl	PUT32
	mov	r0, #15
	and	r5, r0, r4, lsr #20
.LBB4_5:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI4_0
	bl	GET32
	tst	r0, #32
	beq	.LBB4_5
@ BB#6:                                 @ %uart_send.exit.2
	ldr	r0, .LCPI4_1
	orr	r1, r5, #48
	cmp	r5, #9
	addhi	r1, r5, #55
	bl	PUT32
	mov	r0, #15
	and	r5, r0, r4, lsr #16
.LBB4_7:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI4_0
	bl	GET32
	tst	r0, #32
	beq	.LBB4_7
@ BB#8:                                 @ %uart_send.exit.3
	ldr	r0, .LCPI4_1
	orr	r1, r5, #48
	cmp	r5, #9
	addhi	r1, r5, #55
	bl	PUT32
	mov	r0, #15
	and	r5, r0, r4, lsr #12
.LBB4_9:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI4_0
	bl	GET32
	tst	r0, #32
	beq	.LBB4_9
@ BB#10:                                @ %uart_send.exit.4
	ldr	r0, .LCPI4_1
	orr	r1, r5, #48
	cmp	r5, #9
	addhi	r1, r5, #55
	bl	PUT32
	mov	r0, #15
	and	r5, r0, r4, lsr #8
.LBB4_11:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI4_0
	bl	GET32
	tst	r0, #32
	beq	.LBB4_11
@ BB#12:                                @ %uart_send.exit.5
	ldr	r0, .LCPI4_1
	orr	r1, r5, #48
	cmp	r5, #9
	addhi	r1, r5, #55
	bl	PUT32
	mov	r0, #15
	and	r5, r0, r4, lsr #4
.LBB4_13:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI4_0
	bl	GET32
	tst	r0, #32
	beq	.LBB4_13
@ BB#14:                                @ %uart_send.exit.6
	ldr	r0, .LCPI4_1
	orr	r1, r5, #48
	cmp	r5, #9
	addhi	r1, r5, #55
	bl	PUT32
	and	r4, r4, #15
.LBB4_15:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI4_0
	bl	GET32
	tst	r0, #32
	beq	.LBB4_15
@ BB#16:                                @ %uart_send.exit.7
	ldr	r0, .LCPI4_1
	orr	r1, r4, #48
	cmp	r4, #9
	addhi	r1, r4, #55
	bl	PUT32
.LBB4_17:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI4_0
	bl	GET32
	tst	r0, #32
	beq	.LBB4_17
@ BB#18:                                @ %uart_send.exit1
	ldr	r0, .LCPI4_1
	mov	r1, #32
	bl	PUT32
	pop	{r4, r5, r6, pc}
	.align	2
@ BB#19:
.LCPI4_0:
	.long	539054164               @ 0x20215054
.LCPI4_1:
	.long	539054144               @ 0x20215040
.Ltmp4:
	.size	hexstrings, .Ltmp4-hexstrings

	.globl	hexstring
	.align	2
	.type	hexstring,%function
hexstring:                              @ @hexstring
@ BB#0:
	push	{lr}
	bl	hexstrings
.LBB5_1:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_0
	bl	GET32
	tst	r0, #32
	beq	.LBB5_1
@ BB#2:                                 @ %uart_send.exit
	ldr	r0, .LCPI5_1
	mov	r1, #13
	bl	PUT32
.LBB5_3:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI5_0
	bl	GET32
	tst	r0, #32
	beq	.LBB5_3
@ BB#4:                                 @ %uart_send.exit1
	ldr	r0, .LCPI5_1
	mov	r1, #10
	bl	PUT32
	pop	{lr}
	bx	lr
	.align	2
@ BB#5:
.LCPI5_0:
	.long	539054164               @ 0x20215054
.LCPI5_1:
	.long	539054144               @ 0x20215040
.Ltmp5:
	.size	hexstring, .Ltmp5-hexstring

	.globl	uart_init
	.align	2
	.type	uart_init,%function
uart_init:                              @ @uart_init
@ BB#0:
	push	{r4, r5, lr}
	ldr	r0, .LCPI6_0
	mov	r1, #1
	bl	PUT32
	ldr	r5, .LCPI6_1
	mov	r1, #0
	mov	r4, #0
	mov	r0, r5
	bl	PUT32
	ldr	r0, .LCPI6_2
	mov	r1, #0
	bl	PUT32
	ldr	r0, .LCPI6_3
	mov	r1, #3
	bl	PUT32
	ldr	r0, .LCPI6_4
	mov	r1, #0
	bl	PUT32
	mov	r0, r5
	mov	r1, #0
	bl	PUT32
	ldr	r0, .LCPI6_5
	mov	r1, #198
	bl	PUT32
	ldr	r0, .LCPI6_6
	mov	r1, #14
	orr	r1, r1, #256
	bl	PUT32
	ldr	r5, .LCPI6_7
	mov	r0, r5
	bl	GET32
	bic	r0, r0, #258048
	orr	r1, r0, #73728
	mov	r0, r5
	bl	PUT32
	ldr	r0, .LCPI6_8
	mov	r1, #0
	bl	PUT32
.LBB6_1:                                @ =>This Inner Loop Header: Depth=1
	mov	r0, r4
	bl	dummy
	add	r4, r4, #1
	cmp	r4, #150
	bne	.LBB6_1
@ BB#2:
	ldr	r0, .LCPI6_9
	mov	r1, #49152
	bl	PUT32
	mov	r4, #0
.LBB6_3:                                @ =>This Inner Loop Header: Depth=1
	mov	r0, r4
	bl	dummy
	add	r4, r4, #1
	cmp	r4, #150
	bne	.LBB6_3
@ BB#4:
	ldr	r0, .LCPI6_9
	mov	r1, #0
	bl	PUT32
	ldr	r0, .LCPI6_2
	mov	r1, #3
	bl	PUT32
	pop	{r4, r5, pc}
	.align	2
@ BB#5:
.LCPI6_0:
	.long	539054084               @ 0x20215004
.LCPI6_1:
	.long	539054148               @ 0x20215044
.LCPI6_2:
	.long	539054176               @ 0x20215060
.LCPI6_3:
	.long	539054156               @ 0x2021504c
.LCPI6_4:
	.long	539054160               @ 0x20215050
.LCPI6_5:
	.long	539054152               @ 0x20215048
.LCPI6_6:
	.long	539054184               @ 0x20215068
.LCPI6_7:
	.long	538968068               @ 0x20200004
.LCPI6_8:
	.long	538968212               @ 0x20200094
.LCPI6_9:
	.long	538968216               @ 0x20200098
.Ltmp6:
	.size	uart_init, .Ltmp6-uart_init

	.globl	timer_init
	.align	2
	.type	timer_init,%function
timer_init:                             @ @timer_init
@ BB#0:
	push	{r4, lr}
	ldr	r4, .LCPI7_0
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
.LCPI7_0:
	.long	536917000               @ 0x2000b408
.Ltmp7:
	.size	timer_init, .Ltmp7-timer_init

	.globl	timer_tick
	.align	2
	.type	timer_tick,%function
timer_tick:                             @ @timer_tick
@ BB#0:
	push	{lr}
	ldr	r0, .LCPI8_0
	bl	GET32
	pop	{lr}
	bx	lr
	.align	2
@ BB#1:
.LCPI8_0:
	.long	536917024               @ 0x2000b420
.Ltmp8:
	.size	timer_tick, .Ltmp8-timer_tick

	.globl	notmain
	.align	2
	.type	notmain,%function
notmain:                                @ @notmain
@ BB#0:
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	bl	uart_init
	ldr	r0, .LCPI9_0
	bl	hexstrings
.LBB9_1:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI9_1
	bl	GET32
	tst	r0, #32
	beq	.LBB9_1
@ BB#2:                                 @ %uart_send.exit.i
	ldr	r0, .LCPI9_2
	mov	r1, #13
	bl	PUT32
.LBB9_3:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI9_1
	bl	GET32
	tst	r0, #32
	beq	.LBB9_3
@ BB#4:                                 @ %hexstring.exit
	ldr	r0, .LCPI9_2
	mov	r1, #10
	bl	PUT32
	bl	GETPC
	bl	hexstrings
.LBB9_5:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI9_1
	bl	GET32
	tst	r0, #32
	beq	.LBB9_5
@ BB#6:                                 @ %uart_send.exit.i3
	ldr	r0, .LCPI9_2
	mov	r1, #13
	bl	PUT32
.LBB9_7:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI9_1
	bl	GET32
	tst	r0, #32
	beq	.LBB9_7
@ BB#8:                                 @ %hexstring.exit4
	ldr	r0, .LCPI9_2
	mov	r1, #10
	bl	PUT32
	mov	r0, #32768
	bl	hexstrings
.LBB9_9:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI9_1
	bl	GET32
	tst	r0, #32
	beq	.LBB9_9
@ BB#10:                                @ %uart_send.exit.i5
	ldr	r0, .LCPI9_2
	mov	r1, #13
	bl	PUT32
.LBB9_11:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI9_1
	bl	GET32
	tst	r0, #32
	beq	.LBB9_11
@ BB#12:                                @ %hexstring.exit6
	ldr	r0, .LCPI9_2
	mov	r1, #10
	bl	PUT32
	ldr	r4, .LCPI9_3
	mov	r1, #16318464
	mov	r0, r4
	bl	PUT32
	mov	r1, #512
	orr	r1, r1, #16318464
	mov	r0, r4
	bl	PUT32
	ldr	r0, .LCPI9_4
	bl	GET32
	ldr	r5, .LCPI9_5
	mov	r9, #0
	mov	r11, r0
	mov	r10, #1
	mov	r6, #32768
	mov	r4, r9
	mov	r7, r9
	b	.LBB9_14
.LBB9_13:                               @   in Loop: Header=BB9_14 Depth=1
	ldrb	r0, [r5, r4]
	add	r4, r4, #1
	add	r7, r0, r8
.LBB9_14:                               @ %.backedge
                                        @ =>This Loop Header: Depth=1
                                        @     Child Loop BB9_15 Depth 2
                                        @     Child Loop BB9_18 Depth 2
                                        @     Child Loop BB9_30 Depth 2
                                        @     Child Loop BB9_27 Depth 2
                                        @     Child Loop BB9_28 Depth 2
                                        @     Child Loop BB9_38 Depth 2
                                        @     Child Loop BB9_24 Depth 2
                                        @     Child Loop BB9_34 Depth 2
	ldr	r0, .LCPI9_4
	mov	r8, r7
	bl	GET32
	mov	r1, #2304
	sub	r0, r0, r11
	orr	r1, r1, #3997696
	cmp	r0, r1
	blo	.LBB9_17
.LBB9_15:                               @ %.preheader44
                                        @   Parent Loop BB9_14 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, .LCPI9_1
	bl	GET32
	tst	r0, #32
	beq	.LBB9_15
@ BB#16:                                @ %uart_send.exit
                                        @   in Loop: Header=BB9_14 Depth=1
	ldr	r0, .LCPI9_2
	mov	r1, #21
	bl	PUT32
	mov	r0, #2304
	orr	r0, r0, #3997696
	add	r11, r11, r0
.LBB9_17:                               @   in Loop: Header=BB9_14 Depth=1
	ldr	r0, .LCPI9_1
	bl	GET32
	mov	r7, r8
	tst	r0, #1
	beq	.LBB9_14
.LBB9_18:                               @ %.preheader45
                                        @   Parent Loop BB9_14 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, .LCPI9_1
	bl	GET32
	tst	r0, #1
	beq	.LBB9_18
@ BB#19:                                @ %uart_recv.exit
                                        @   in Loop: Header=BB9_14 Depth=1
	ldr	r0, .LCPI9_2
	bl	GET32
	mov	r1, r0
	ldr	r0, .LCPI9_4
	strb	r1, [r5, r4]
	bl	GET32
	mov	r11, r0
	cmp	r4, #130
	bhi	.LBB9_25
@ BB#20:                                @ %uart_recv.exit
                                        @   in Loop: Header=BB9_14 Depth=1
	cmp	r4, #0
	beq	.LBB9_32
@ BB#21:                                @ %uart_recv.exit
                                        @   in Loop: Header=BB9_14 Depth=1
	cmp	r4, #1
	bne	.LBB9_35
@ BB#22:                                @   in Loop: Header=BB9_14 Depth=1
	ldrb	r0, [r5, r4]
	cmp	r0, r10
	bne	.LBB9_24
@ BB#23:                                @   in Loop: Header=BB9_14 Depth=1
	add	r7, r10, r8
	mov	r4, #2
	b	.LBB9_14
.LBB9_24:                               @ %.preheader47
                                        @   Parent Loop BB9_14 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, .LCPI9_1
	bl	GET32
	tst	r0, #32
	beq	.LBB9_24
	b	.LBB9_39
.LBB9_25:                               @ %uart_recv.exit
                                        @   in Loop: Header=BB9_14 Depth=1
	cmp	r4, #131
	bne	.LBB9_13
@ BB#26:                                @   in Loop: Header=BB9_14 Depth=1
	ldrb	r0, [r5, r4]
	mov	r4, #0
	uxtb	r7, r8
	cmp	r0, r7
	bne	.LBB9_30
.LBB9_27:                               @ %.preheader49
                                        @   Parent Loop BB9_14 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	add	r1, r5, r4
	add	r0, r6, r4
	ldrb	r1, [r1, #3]
	bl	PUT8
	add	r4, r4, #1
	cmp	r4, #128
	bne	.LBB9_27
.LBB9_28:                               @ %.loopexit
                                        @   Parent Loop BB9_14 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, .LCPI9_1
	bl	GET32
	tst	r0, #32
	beq	.LBB9_28
@ BB#29:                                @ %uart_send.exit19
                                        @   in Loop: Header=BB9_14 Depth=1
	ldr	r0, .LCPI9_2
	mov	r1, #6
	bl	PUT32
	add	r0, r10, #1
	add	r6, r6, #128
	uxtb	r10, r0
	mov	r4, #0
	b	.LBB9_14
.LBB9_30:                               @ %.preheader48
                                        @   Parent Loop BB9_14 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, .LCPI9_1
	bl	GET32
	tst	r0, #32
	beq	.LBB9_30
@ BB#31:                                @ %uart_send.exit20
                                        @   in Loop: Header=BB9_14 Depth=1
	ldr	r0, .LCPI9_2
	mov	r1, #21
	bl	PUT32
	mov	r4, #0
	b	.LBB9_14
.LBB9_32:                               @   in Loop: Header=BB9_14 Depth=1
	ldrb	r0, [r5, r4]
	mov	r4, #1
	mov	r7, r4
	cmp	r0, #1
	beq	.LBB9_14
@ BB#33:                                @   in Loop: Header=BB9_14 Depth=1
	cmp	r0, #4
	beq	.LBB9_40
.LBB9_34:                               @ %.preheader51
                                        @   Parent Loop BB9_14 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, .LCPI9_1
	bl	GET32
	tst	r0, #32
	beq	.LBB9_34
	b	.LBB9_39
.LBB9_35:                               @ %uart_recv.exit
                                        @   in Loop: Header=BB9_14 Depth=1
	cmp	r4, #2
	bne	.LBB9_13
@ BB#36:                                @   in Loop: Header=BB9_14 Depth=1
	ldrb	r0, [r5, r4]
	ldrb	r1, [r5, #1]
	eor	r1, r1, #255
	cmp	r0, r1
	bne	.LBB9_38
@ BB#37:                                @   in Loop: Header=BB9_14 Depth=1
	add	r7, r0, r8
	mov	r4, #3
	b	.LBB9_14
.LBB9_38:                               @ %.preheader46
                                        @   Parent Loop BB9_14 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, .LCPI9_1
	bl	GET32
	tst	r0, #32
	beq	.LBB9_38
.LBB9_39:                               @ %uart_send.exit16
                                        @   in Loop: Header=BB9_14 Depth=1
	ldr	r0, .LCPI9_2
	mov	r1, #21
	bl	PUT32
	mov	r4, r9
	mov	r7, r8
	b	.LBB9_14
.LBB9_40:                               @ %.preheader
                                        @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI9_1
	bl	GET32
	tst	r0, #32
	beq	.LBB9_40
@ BB#41:                                @ %uart_send.exit7
	ldr	r0, .LCPI9_2
	mov	r1, #6
	bl	PUT32
	mov	r4, #0
.LBB9_42:                               @ =>This Loop Header: Depth=1
                                        @     Child Loop BB9_43 Depth 2
                                        @     Child Loop BB9_45 Depth 2
	mov	r0, r4
	bl	hexstrings
.LBB9_43:                               @   Parent Loop BB9_42 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, .LCPI9_1
	bl	GET32
	tst	r0, #32
	beq	.LBB9_43
@ BB#44:                                @ %uart_send.exit.i8
                                        @   in Loop: Header=BB9_42 Depth=1
	ldr	r0, .LCPI9_2
	mov	r1, #13
	bl	PUT32
.LBB9_45:                               @   Parent Loop BB9_42 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, .LCPI9_1
	bl	GET32
	tst	r0, #32
	beq	.LBB9_45
@ BB#46:                                @ %hexstring.exit9
                                        @   in Loop: Header=BB9_42 Depth=1
	ldr	r0, .LCPI9_2
	mov	r1, #10
	bl	PUT32
	add	r4, r4, #1
	cmp	r4, #30
	bne	.LBB9_42
@ BB#47:
	ldr	r0, .LCPI9_6
	bl	hexstrings
.LBB9_48:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI9_1
	bl	GET32
	tst	r0, #32
	beq	.LBB9_48
@ BB#49:                                @ %uart_send.exit.i10
	ldr	r0, .LCPI9_2
	mov	r1, #13
	bl	PUT32
.LBB9_50:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI9_1
	bl	GET32
	tst	r0, #32
	beq	.LBB9_50
@ BB#51:                                @ %hexstring.exit11
	ldr	r0, .LCPI9_2
	mov	r1, #10
	bl	PUT32
	ldr	r0, .LCPI9_7
	bl	hexstrings
.LBB9_52:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI9_1
	bl	GET32
	tst	r0, #32
	beq	.LBB9_52
@ BB#53:                                @ %uart_send.exit.i12
	ldr	r0, .LCPI9_2
	mov	r1, #13
	bl	PUT32
.LBB9_54:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI9_1
	bl	GET32
	tst	r0, #32
	beq	.LBB9_54
@ BB#55:                                @ %hexstring.exit13
	ldr	r0, .LCPI9_2
	mov	r1, #10
	bl	PUT32
	ldr	r0, .LCPI9_8
	bl	hexstrings
.LBB9_56:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI9_1
	bl	GET32
	tst	r0, #32
	beq	.LBB9_56
@ BB#57:                                @ %uart_send.exit.i14
	ldr	r0, .LCPI9_2
	mov	r1, #13
	bl	PUT32
.LBB9_58:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI9_1
	bl	GET32
	tst	r0, #32
	beq	.LBB9_58
@ BB#59:                                @ %hexstring.exit15
	ldr	r0, .LCPI9_2
	mov	r1, #10
	bl	PUT32
.LBB9_60:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI9_1
	bl	GET32
	tst	r0, #256
	bne	.LBB9_60
@ BB#61:                                @ %uart_flush.exit
	mov	r0, #32768
	bl	BRANCHTO
	mov	r0, #0
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.align	2
@ BB#62:
.LCPI9_0:
	.long	305419896               @ 0x12345678
.LCPI9_1:
	.long	539054164               @ 0x20215054
.LCPI9_2:
	.long	539054144               @ 0x20215040
.LCPI9_3:
	.long	536917000               @ 0x2000b408
.LCPI9_4:
	.long	536917024               @ 0x2000b420
.LCPI9_5:
	.long	xstring
.LCPI9_6:
	.long	286331153               @ 0x11111111
.LCPI9_7:
	.long	572662306               @ 0x22222222
.LCPI9_8:
	.long	858993459               @ 0x33333333
.Ltmp9:
	.size	notmain, .Ltmp9-notmain

	.type	xstring,%object         @ @xstring
	.comm	xstring,256,1

