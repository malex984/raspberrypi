	.syntax unified
	.eabi_attribute 6, 6
	.eabi_attribute 10, 2
	.fpu vfpv2
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.file	"blinker05.clang.opt.bc"
	.text
	.globl	c_irq_handler
	.align	2
	.type	c_irq_handler,%function
c_irq_handler:                          @ @c_irq_handler
@ BB#0:
	push	{lr}
	ldr	r0, .LCPI0_0
	ldr	r1, [r0]
	add	r1, r1, #1
	str	r1, [r0]
	ldr	r0, [r0]
	mov	r1, #65536
	tst	r0, #1
	ldreq	r0, .LCPI0_2
	ldrne	r0, .LCPI0_1
	bl	PUT32
	ldr	r0, .LCPI0_3
	mov	r1, #0
	bl	PUT32
	pop	{lr}
	bx	lr
	.align	2
@ BB#1:
.LCPI0_0:
	.long	icount
.LCPI0_1:
	.long	538968104               @ 0x20200028
.LCPI0_2:
	.long	538968092               @ 0x2020001c
.LCPI0_3:
	.long	536917004               @ 0x2000b40c
.Ltmp0:
	.size	c_irq_handler, .Ltmp0-c_irq_handler

	.globl	notmain
	.align	2
	.type	notmain,%function
notmain:                                @ @notmain
@ BB#0:
	push	{r4, r5, lr}
	ldr	r0, .LCPI1_0
	mov	r1, #1
	bl	PUT32
	ldr	r4, .LCPI1_1
	mov	r0, r4
	bl	GET32
	bic	r0, r0, #1835008
	orr	r1, r0, #262144
	mov	r0, r4
	bl	PUT32
	ldr	r0, .LCPI1_2
	mov	r1, #65536
	bl	PUT32
	ldr	r4, .LCPI1_3
	mov	r1, #4063232
	mov	r0, r4
	bl	PUT32
	ldr	r5, .LCPI1_4
	mov	r0, #46080
	orr	r0, r0, #536870912
	mov	r1, r5
	bl	PUT32
	ldr	r0, .LCPI1_5
	mov	r1, r5
	bl	PUT32
	ldr	r0, .LCPI1_6
	mov	r1, #249
	bl	PUT32
	ldr	r0, .LCPI1_7
	mov	r1, #0
	bl	PUT32
	mov	r1, #162
	orr	r1, r1, #4063232
	mov	r0, r4
	bl	PUT32
	ldr	r0, .LCPI1_8
	mov	r1, #65536
	bl	PUT32
.LBB1_1:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI1_9
	bl	GET32
	cmp	r0, #0
	beq	.LBB1_1
@ BB#2:
	ldr	r0, .LCPI1_7
	mov	r1, #0
	bl	PUT32
	ldr	r0, .LCPI1_2
	mov	r1, #65536
	bl	PUT32
.LBB1_3:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI1_9
	bl	GET32
	cmp	r0, #0
	beq	.LBB1_3
@ BB#4:
	ldr	r0, .LCPI1_7
	mov	r1, #0
	bl	PUT32
	ldr	r0, .LCPI1_8
	mov	r1, #65536
	bl	PUT32
.LBB1_5:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI1_9
	bl	GET32
	cmp	r0, #0
	beq	.LBB1_5
@ BB#6:
	ldr	r0, .LCPI1_7
	mov	r1, #0
	bl	PUT32
	ldr	r0, .LCPI1_2
	mov	r1, #65536
	bl	PUT32
.LBB1_7:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI1_9
	bl	GET32
	cmp	r0, #0
	beq	.LBB1_7
@ BB#8:
	ldr	r0, .LCPI1_7
	mov	r1, #0
	bl	PUT32
	ldr	r0, .LCPI1_8
	mov	r1, #65536
	bl	PUT32
.LBB1_9:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI1_9
	bl	GET32
	cmp	r0, #0
	beq	.LBB1_9
@ BB#10:
	ldr	r0, .LCPI1_7
	mov	r1, #0
	bl	PUT32
	ldr	r0, .LCPI1_2
	mov	r1, #65536
	bl	PUT32
.LBB1_11:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI1_9
	bl	GET32
	cmp	r0, #0
	beq	.LBB1_11
@ BB#12:
	ldr	r0, .LCPI1_7
	mov	r1, #0
	bl	PUT32
	ldr	r0, .LCPI1_8
	mov	r1, #65536
	bl	PUT32
.LBB1_13:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI1_9
	bl	GET32
	cmp	r0, #0
	beq	.LBB1_13
@ BB#14:
	ldr	r0, .LCPI1_7
	mov	r1, #0
	bl	PUT32
	ldr	r0, .LCPI1_2
	mov	r1, #65536
	bl	PUT32
.LBB1_15:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI1_9
	bl	GET32
	cmp	r0, #0
	beq	.LBB1_15
@ BB#16:
	ldr	r0, .LCPI1_7
	mov	r1, #0
	bl	PUT32
	ldr	r0, .LCPI1_8
	mov	r1, #65536
	bl	PUT32
.LBB1_17:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI1_9
	bl	GET32
	cmp	r0, #0
	beq	.LBB1_17
@ BB#18:
	ldr	r0, .LCPI1_7
	mov	r1, #0
	bl	PUT32
	ldr	r0, .LCPI1_2
	mov	r1, #65536
	bl	PUT32
.LBB1_19:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI1_9
	bl	GET32
	cmp	r0, #0
	beq	.LBB1_19
@ BB#20:
	ldr	r4, .LCPI1_7
	mov	r1, #0
	mov	r0, r4
	bl	PUT32
	ldr	r5, .LCPI1_10
	mov	r0, #46080
	orr	r0, r0, #536870912
	mov	r1, r5
	bl	PUT32
	ldr	r0, .LCPI1_5
	mov	r1, r5
	bl	PUT32
	mov	r0, r4
	mov	r1, #0
	bl	PUT32
	ldr	r0, .LCPI1_11
	mov	r1, #1
	bl	PUT32
	ldr	r0, .LCPI1_8
	mov	r1, #65536
	bl	PUT32
	mov	r4, #45568
	orr	r4, r4, #536870912
.LBB1_21:                               @ =>This Inner Loop Header: Depth=1
	mov	r0, r4
	bl	GET32
	tst	r0, #1
	beq	.LBB1_21
@ BB#22:
	ldr	r0, .LCPI1_7
	mov	r1, #0
	bl	PUT32
	ldr	r0, .LCPI1_2
	mov	r1, #65536
	bl	PUT32
	mov	r4, #45568
	orr	r4, r4, #536870912
.LBB1_23:                               @ =>This Inner Loop Header: Depth=1
	mov	r0, r4
	bl	GET32
	tst	r0, #1
	beq	.LBB1_23
@ BB#24:
	ldr	r0, .LCPI1_7
	mov	r1, #0
	bl	PUT32
	ldr	r0, .LCPI1_8
	mov	r1, #65536
	bl	PUT32
	mov	r4, #45568
	orr	r4, r4, #536870912
.LBB1_25:                               @ =>This Inner Loop Header: Depth=1
	mov	r0, r4
	bl	GET32
	tst	r0, #1
	beq	.LBB1_25
@ BB#26:
	ldr	r0, .LCPI1_7
	mov	r1, #0
	bl	PUT32
	ldr	r0, .LCPI1_2
	mov	r1, #65536
	bl	PUT32
	mov	r4, #45568
	orr	r4, r4, #536870912
.LBB1_27:                               @ =>This Inner Loop Header: Depth=1
	mov	r0, r4
	bl	GET32
	tst	r0, #1
	beq	.LBB1_27
@ BB#28:
	ldr	r0, .LCPI1_7
	mov	r1, #0
	bl	PUT32
	ldr	r0, .LCPI1_8
	mov	r1, #65536
	bl	PUT32
	mov	r4, #45568
	orr	r4, r4, #536870912
.LBB1_29:                               @ =>This Inner Loop Header: Depth=1
	mov	r0, r4
	bl	GET32
	tst	r0, #1
	beq	.LBB1_29
@ BB#30:
	ldr	r0, .LCPI1_7
	mov	r1, #0
	bl	PUT32
	ldr	r0, .LCPI1_2
	mov	r1, #65536
	bl	PUT32
	mov	r4, #45568
	orr	r4, r4, #536870912
.LBB1_31:                               @ =>This Inner Loop Header: Depth=1
	mov	r0, r4
	bl	GET32
	tst	r0, #1
	beq	.LBB1_31
@ BB#32:
	ldr	r0, .LCPI1_7
	mov	r1, #0
	bl	PUT32
	ldr	r0, .LCPI1_8
	mov	r1, #65536
	bl	PUT32
	mov	r4, #45568
	orr	r4, r4, #536870912
.LBB1_33:                               @ =>This Inner Loop Header: Depth=1
	mov	r0, r4
	bl	GET32
	tst	r0, #1
	beq	.LBB1_33
@ BB#34:
	ldr	r0, .LCPI1_7
	mov	r1, #0
	bl	PUT32
	ldr	r0, .LCPI1_2
	mov	r1, #65536
	bl	PUT32
	mov	r4, #45568
	orr	r4, r4, #536870912
.LBB1_35:                               @ =>This Inner Loop Header: Depth=1
	mov	r0, r4
	bl	GET32
	tst	r0, #1
	beq	.LBB1_35
@ BB#36:
	ldr	r0, .LCPI1_7
	mov	r1, #0
	bl	PUT32
	ldr	r0, .LCPI1_8
	mov	r1, #65536
	bl	PUT32
	mov	r4, #45568
	orr	r4, r4, #536870912
.LBB1_37:                               @ =>This Inner Loop Header: Depth=1
	mov	r0, r4
	bl	GET32
	tst	r0, #1
	beq	.LBB1_37
@ BB#38:
	ldr	r0, .LCPI1_7
	mov	r1, #0
	bl	PUT32
	ldr	r0, .LCPI1_2
	mov	r1, #65536
	bl	PUT32
	mov	r4, #45568
	orr	r4, r4, #536870912
.LBB1_39:                               @ =>This Inner Loop Header: Depth=1
	mov	r0, r4
	bl	GET32
	tst	r0, #1
	beq	.LBB1_39
@ BB#40:
	ldr	r0, .LCPI1_7
	mov	r1, #0
	mov	r5, #0
	bl	PUT32
	ldr	r4, .LCPI1_12
	mov	r0, #46080
	orr	r0, r0, #536870912
	mov	r1, r4
	bl	PUT32
	ldr	r0, .LCPI1_5
	mov	r1, r4
	bl	PUT32
	ldr	r0, .LCPI1_13
	str	r5, [r0]
	bl	enable_irq
.LBB1_41:                               @ =>This Inner Loop Header: Depth=1
	b	.LBB1_41
	.align	2
@ BB#42:
.LCPI1_0:
	.long	536916516               @ 0x2000b224
.LCPI1_1:
	.long	538968068               @ 0x20200004
.LCPI1_2:
	.long	538968092               @ 0x2020001c
.LCPI1_3:
	.long	536917000               @ 0x2000b408
.LCPI1_4:
	.long	999999                  @ 0xf423f
.LCPI1_5:
	.long	536917016               @ 0x2000b418
.LCPI1_6:
	.long	536917020               @ 0x2000b41c
.LCPI1_7:
	.long	536917004               @ 0x2000b40c
.LCPI1_8:
	.long	538968104               @ 0x20200028
.LCPI1_9:
	.long	536917012               @ 0x2000b414
.LCPI1_10:
	.long	1999999                 @ 0x1e847f
.LCPI1_11:
	.long	536916504               @ 0x2000b218
.LCPI1_12:
	.long	3999999                 @ 0x3d08ff
.LCPI1_13:
	.long	icount
.Ltmp1:
	.size	notmain, .Ltmp1-notmain

	.type	icount,%object          @ @icount
	.comm	icount,4,4

