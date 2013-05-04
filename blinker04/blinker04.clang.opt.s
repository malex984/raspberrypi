	.syntax unified
	.eabi_attribute 6, 6
	.eabi_attribute 10, 2
	.fpu vfpv2
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.file	"blinker04.clang.opt.bc"
	.text
	.globl	notmain
	.align	2
	.type	notmain,%function
notmain:                                @ @notmain
@ BB#0:
	push	{r4, r5, lr}
	ldr	r4, .LCPI0_0
	mov	r0, r4
	bl	GET32
	bic	r0, r0, #1835008
	orr	r1, r0, #262144
	mov	r0, r4
	bl	PUT32
	ldr	r4, .LCPI0_1
	mov	r1, #4063232
	mov	r0, r4
	bl	PUT32
	ldr	r5, .LCPI0_2
	mov	r0, #46080
	orr	r0, r0, #536870912
	mov	r1, r5
	bl	PUT32
	ldr	r0, .LCPI0_3
	mov	r1, r5
	bl	PUT32
	ldr	r0, .LCPI0_4
	mov	r1, #249
	bl	PUT32
	ldr	r0, .LCPI0_5
	mov	r1, #0
	bl	PUT32
	mov	r1, #130
	orr	r1, r1, #4063232
	mov	r0, r4
	b	.LBB0_2
.LBB0_1:                                @   in Loop: Header=BB0_2 Depth=1
	ldr	r0, .LCPI0_5
	mov	r1, #0
.LBB0_2:                                @ =>This Loop Header: Depth=1
                                        @     Child Loop BB0_3 Depth 2
                                        @     Child Loop BB0_5 Depth 2
	bl	PUT32
	ldr	r0, .LCPI0_6
	mov	r1, #65536
	bl	PUT32
.LBB0_3:                                @   Parent Loop BB0_2 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, .LCPI0_7
	bl	GET32
	cmp	r0, #0
	beq	.LBB0_3
@ BB#4:                                 @   in Loop: Header=BB0_2 Depth=1
	ldr	r0, .LCPI0_5
	mov	r1, #0
	bl	PUT32
	ldr	r0, .LCPI0_8
	mov	r1, #65536
	bl	PUT32
.LBB0_5:                                @   Parent Loop BB0_2 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, .LCPI0_7
	bl	GET32
	cmp	r0, #0
	beq	.LBB0_5
	b	.LBB0_1
	.align	2
@ BB#6:
.LCPI0_0:
	.long	538968068               @ 0x20200004
.LCPI0_1:
	.long	536917000               @ 0x2000b408
.LCPI0_2:
	.long	3999999                 @ 0x3d08ff
.LCPI0_3:
	.long	536917016               @ 0x2000b418
.LCPI0_4:
	.long	536917020               @ 0x2000b41c
.LCPI0_5:
	.long	536917004               @ 0x2000b40c
.LCPI0_6:
	.long	538968092               @ 0x2020001c
.LCPI0_7:
	.long	536917008               @ 0x2000b410
.LCPI0_8:
	.long	538968104               @ 0x20200028
.Ltmp0:
	.size	notmain, .Ltmp0-notmain


