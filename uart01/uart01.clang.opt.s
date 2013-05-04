	.syntax unified
	.eabi_attribute 6, 6
	.eabi_attribute 10, 2
	.fpu vfpv2
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.file	"uart01.clang.opt.bc"
	.text
	.globl	notmain
	.align	2
	.type	notmain,%function
notmain:                                @ @notmain
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
	mov	r1, #0
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
	bic	r0, r0, #28672
	orr	r1, r0, #8192
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
	mov	r1, #16384
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
	mov	r4, #0
	bl	PUT32
	ldr	r0, .LCPI0_2
	mov	r1, #2
	bl	PUT32
	b	.LBB0_6
.LBB0_5:                                @   in Loop: Header=BB0_6 Depth=1
	ldr	r0, .LCPI0_11
	and	r1, r4, #7
	orr	r1, r1, #48
	bl	PUT32
	add	r4, r4, #1
.LBB0_6:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI0_10
	bl	GET32
	tst	r0, #32
	beq	.LBB0_6
	b	.LBB0_5
	.align	2
@ BB#7:
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
.LCPI0_10:
	.long	539054164               @ 0x20215054
.LCPI0_11:
	.long	539054144               @ 0x20215040
.Ltmp0:
	.size	notmain, .Ltmp0-notmain


