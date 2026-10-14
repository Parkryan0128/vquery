	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 26, 0	sdk_version 26, 0
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4, 0x0                          ; -- Begin function _ZN6vquery7executeENS_9QuerySpecERKNS_6TablesERNS_16ExecutionContextE
lCPI0_0:
	.quad	1000000                         ; 0xf4240
	.quad	100000                          ; 0x186a0
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3, 0x0
lCPI0_1:
	.long	10000                           ; 0x2710
	.long	0                               ; 0x0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN6vquery7executeENS_9QuerySpecERKNS_6TablesERNS_16ExecutionContextE
	.p2align	2
__ZN6vquery7executeENS_9QuerySpecERKNS_6TablesERNS_16ExecutionContextE: ; @_ZN6vquery7executeENS_9QuerySpecERKNS_6TablesERNS_16ExecutionContextE
Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception0
; %bb.0:
	sub	sp, sp, #464
	stp	x28, x27, [sp, #368]            ; 16-byte Folded Spill
	stp	x26, x25, [sp, #384]            ; 16-byte Folded Spill
	stp	x24, x23, [sp, #400]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #416]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #432]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #448]            ; 16-byte Folded Spill
	add	x29, sp, #448
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	stur	x0, [x29, #-136]
	mov	x25, x2
	ldr	x8, [x25, #24]!
	ldr	x9, [x1]
	cmp	x8, x9
	b.ne	LBB0_131
; %bb.1:
	mov	x8, #-238521008783361           ; =0xffff2710ffffffff
	movk	x8, #0, lsl #48
	cmp	x0, x8
	b.hi	LBB0_131
; %bb.2:
	mov	x22, x1
	ldr	w8, [x1, #20]
	cmp	w8, w0
	b.ne	LBB0_131
; %bb.3:
	mov	x26, x2
	ldrb	w9, [x22, #16]
	ldr	w8, [x2]
	cmp	w8, #0
	cset	w10, eq
	cmp	w9, w10
	b.ne	LBB0_131
; %bb.4:
Lloh0:
	adrp	x9, lCPI0_0@PAGE
Lloh1:
	ldr	q0, [x9, lCPI0_0@PAGEOFF]
	lsr	x9, x0, #32
	stur	q0, [x29, #-200]
	mov	w10, #1024                      ; =0x400
Lloh2:
	adrp	x11, lCPI0_1@PAGE
Lloh3:
	ldr	d0, [x11, lCPI0_1@PAGEOFF]
	stur	d0, [x29, #-176]
	mov	x11, #4294967296                ; =0x100000000
	stur	x11, [x29, #-144]
	mov	w11, #42                        ; =0x2a
	stp	w8, w0, [x29, #-208]
	ldr	x8, [x26, #8]
	stp	x11, x8, [x29, #-168]
	ldr	w8, [x26, #16]
	stur	w8, [x29, #-152]
	stp	w10, w9, [x29, #-184]
Ltmp0:
	sub	x0, x29, #208
	bl	__ZN6vquery15validate_configERKNS_6ConfigE
Ltmp1:
; %bb.5:
Ltmp2:
	mov	x0, x22
	bl	__ZNK6vquery6Tables14validate_shapeEv
Ltmp3:
; %bb.6:
	stur	xzr, [x29, #-216]
	ldur	w8, [x29, #-136]
	cmp	w8, #2
	b.ne	LBB0_24
; %bb.7:
	ldr	x19, [x22, #32]
	mov	w24, #1                         ; =0x1
	mov	x20, #-3689348814741910324      ; =0xcccccccccccccccc
	movk	x20, #52429
	mov	w21, #10                        ; =0xa
	mov	w23, #205                       ; =0xcd
LBB0_8:                                 ; =>This Inner Loop Header: Depth=1
	umulh	x8, x24, x20
	lsr	x8, x8, #3
	lsl	x9, x8, #3
	msub	w10, w8, w21, w24
	lsl	w11, w10, #3
	sub	w10, w11, w10
	and	w10, w10, #0xff
	mul	w10, w10, w23
	lsr	w10, w10, #11
	sub	x8, x9, x8
	add	x8, x8, x10
	cmp	x8, x19
	b.hs	LBB0_10
; %bb.9:                                ;   in Loop: Header=BB0_8 Depth=1
Ltmp76:
	mov	x0, x24
	bl	__ZN6vquery9HashTableIjNS_7KeyHashEE7doubledEm
	mov	x24, x0
Ltmp77:
	b	LBB0_8
LBB0_10:
Ltmp5:
	mov	w0, #176                        ; =0xb0
	bl	__Znwm
Ltmp6:
; %bb.11:
	mov	x23, x0
	ldp	x9, x8, [x26, #24]
	stp	x9, x8, [sp, #32]
	cbz	x8, LBB0_13
; %bb.12:
	add	x8, x8, #8
	mov	w9, #1                          ; =0x1
	ldadd	x9, x8, [x8]
LBB0_13:
Ltmp8:
	add	x1, sp, #32
	mov	x0, x23
	mov	x2, x24
	bl	__ZN6vquery9HashTableIjNS_7KeyHashEEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEEm
Ltmp9:
; %bb.14:
	ldr	x24, [sp, #40]
	cbz	x24, LBB0_17
; %bb.15:
	add	x8, x24, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbnz	x8, LBB0_17
; %bb.16:
	ldr	x8, [x24]
	ldr	x8, [x8, #16]
	mov	x0, x24
	blr	x8
	mov	x0, x24
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
LBB0_17:
	ldur	x0, [x29, #-216]
	stur	x23, [x29, #-216]
	cbz	x0, LBB0_19
; %bb.18:
	bl	__ZN6vquery9HashTableIjNS_7KeyHashEED2Ev
	bl	__ZdlPv
LBB0_19:
	ldr	x8, [x22, #32]
	cbz	x8, LBB0_24
; %bb.20:
	mov	x23, #0                         ; =0x0
LBB0_21:                                ; =>This Inner Loop Header: Depth=1
Ltmp11:
	mov	x0, x22
	mov	x1, x23
	bl	__ZNK6vquery6Tables8customerEm
	mov	x1, x0
Ltmp12:
; %bb.22:                               ;   in Loop: Header=BB0_21 Depth=1
	lsr	x2, x1, #32
	ldur	x0, [x29, #-216]
Ltmp13:
                                        ; kill: def $w1 killed $w1 killed $x1
                                        ; kill: def $w2 killed $w2 killed $x2
	bl	__ZN6vquery9HashTableIjNS_7KeyHashEE13insert_uniqueEjj
Ltmp14:
; %bb.23:                               ;   in Loop: Header=BB0_21 Depth=1
	add	x23, x23, #1
	ldr	x8, [x22, #32]
	cmp	x23, x8
	b.lo	LBB0_21
LBB0_24:
	ldr	w23, [x26, #16]
	cmp	w23, #1
	b.ne	LBB0_41
; %bb.25:
	ldur	x1, [x29, #-136]
	ldr	q0, [x26]
	str	q0, [sp, #32]
	ldr	w8, [x26, #16]
	str	w8, [sp, #48]
	ldp	x9, x8, [x26, #24]
	stp	x9, x8, [sp, #56]
	cbz	x8, LBB0_27
; %bb.26:
	add	x8, x8, #8
	mov	w9, #1                          ; =0x1
	ldadd	x9, x8, [x8]
LBB0_27:
	ldp	x9, x8, [x26, #40]
	stp	x9, x8, [sp, #72]
	cbz	x8, LBB0_29
; %bb.28:
	add	x8, x8, #4
	mov	w9, #1                          ; =0x1
	ldadd	w9, w8, [x8]
LBB0_29:
	ldr	x5, [x22, #24]
	ldur	x6, [x29, #-216]
	str	xzr, [sp, #192]
Ltmp70:
	sub	x0, x29, #128
	add	x3, sp, #32
	add	x7, sp, #192
	mov	x2, x22
	mov	x4, #0                          ; =0x0
	bl	__ZN6vquery12_GLOBAL__N_19run_rangeENS_9QuerySpecERKNS_6TablesENS_16ExecutionContextEmmPKNS_9HashTableIjNS_7KeyHashEEERKNSt3__110stop_tokenE
Ltmp71:
; %bb.30:
	ldr	x0, [sp, #80]
	cbz	x0, LBB0_33
; %bb.31:
	add	x8, x0, #4
	mov	w9, #-1                         ; =0xffffffff
	ldaddal	w9, w8, [x8]
	cmp	w8, #1
	b.ne	LBB0_33
; %bb.32:
	bl	__ZdlPv
LBB0_33:
	ldr	x21, [sp, #64]
	cbz	x21, LBB0_36
; %bb.34:
	add	x8, x21, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbnz	x8, LBB0_36
; %bb.35:
	ldr	x8, [x21]
	ldr	x8, [x8, #16]
	mov	x0, x21
	blr	x8
	mov	x0, x21
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
LBB0_36:
	ldur	x1, [x29, #-128]
	ldur	w2, [x29, #-136]
Ltmp73:
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	mov	x3, x25
	bl	__ZNK6vquery12_GLOBAL__N_15State6finishENS_5QueryERKNSt3__110shared_ptrINS_12MemoryBudgetEEE
Ltmp74:
; %bb.37:
	ldur	x19, [x29, #-128]
	stur	xzr, [x29, #-128]
	cbz	x19, LBB0_125
; %bb.38:
	ldr	x0, [x19, #16]
	str	xzr, [x19, #16]
	cbz	x0, LBB0_40
; %bb.39:
	bl	__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEED2Ev
	bl	__ZdlPv
LBB0_40:
	mov	x0, x19
	bl	__ZdlPv
	b	LBB0_125
LBB0_41:
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [sp, #192]
	stp	q0, q0, [sp, #160]
Ltmp16:
	mov	w0, #24                         ; =0x18
	bl	__Znwm
Ltmp17:
; %bb.42:
	stp	xzr, xzr, [x0]
	str	xzr, [x0, #16]
	stp	xzr, x0, [sp, #144]
	add	x8, x0, #4
	mov	w9, #1                          ; =0x1
	ldadd	w9, w8, [x8]
	mov	w8, #4                          ; =0x4
	ldadd	w8, w8, [x0]
	stp	xzr, xzr, [sp, #128]
Ltmp19:
	add	x0, sp, #128
	mov	x1, x23
	bl	__ZNSt3__16vectorINS_7jthreadENS_9allocatorIS1_EEE7reserveEm
Ltmp20:
; %bb.43:
	str	x25, [sp, #8]                   ; 8-byte Folded Spill
	ldr	w8, [x26, #16]
	str	x26, [sp, #24]                  ; 8-byte Folded Spill
	cbz	w8, LBB0_67
; %bb.44:
	mov	x23, #0                         ; =0x0
	add	x19, sp, #192
	sub	x20, x29, #136
	sub	x21, x29, #216
	add	x24, sp, #160
	add	x25, sp, #152
	mov	w28, #1                         ; =0x1
	b	LBB0_46
LBB0_45:                                ;   in Loop: Header=BB0_46 Depth=1
	ldr	x26, [sp, #24]                  ; 8-byte Folded Reload
	ldr	w8, [x26, #16]
	mov	x23, x27
	cmp	x27, x8
	b.hs	LBB0_68
LBB0_46:                                ; =>This Inner Loop Header: Depth=1
	ldr	x9, [x26, #40]
	cbz	x9, LBB0_50
; %bb.47:                               ;   in Loop: Header=BB0_46 Depth=1
	ldr	x0, [x9, #24]
	cbz	x0, LBB0_50
; %bb.48:                               ;   in Loop: Header=BB0_46 Depth=1
	str	w23, [sp, #32]
	ldr	x8, [x0]
	ldr	x8, [x8, #48]
Ltmp22:
	add	x1, sp, #32
	blr	x8
Ltmp23:
; %bb.49:                               ;   in Loop: Header=BB0_46 Depth=1
	ldr	w8, [x26, #16]
LBB0_50:                                ;   in Loop: Header=BB0_46 Depth=1
	ldr	x9, [x22, #24]
	udiv	x10, x9, x8
	msub	x8, x10, x8, x9
	cmp	x8, x23
	csel	x9, x8, x23, lo
	add	x27, x23, #1
	madd	x9, x10, x23, x9
	cmp	x8, x27
	csinc	x8, x8, x23, lo
	madd	x8, x10, x27, x8
	str	w23, [sp, #32]
	stp	x9, x8, [sp, #40]
	ldr	x8, [sp, #152]
	str	x8, [sp, #56]
	cbz	x8, LBB0_52
; %bb.51:                               ;   in Loop: Header=BB0_46 Depth=1
	add	x8, x8, #4
	ldadd	w28, w8, [x8]
LBB0_52:                                ;   in Loop: Header=BB0_46 Depth=1
	stp	x26, x19, [sp, #64]
	stp	x20, x22, [sp, #80]
	stp	x21, x24, [sp, #96]
	str	x25, [sp, #112]
	ldp	x23, x8, [sp, #136]
	cmp	x23, x8
	b.hs	LBB0_55
; %bb.53:                               ;   in Loop: Header=BB0_46 Depth=1
Ltmp38:
	add	x1, sp, #32
	mov	x0, x23
	bl	__ZNSt3__116allocator_traitsINS_9allocatorINS_7jthreadEEEE9constructB8ne200100IS2_JZN6vquery12_GLOBAL__N_112execute_implENS6_9QuerySpecERKNS6_6TablesERNS6_16ExecutionContextEE3$_0EvLi0EEEvRS3_PT_DpOT0_
Ltmp39:
; %bb.54:                               ;   in Loop: Header=BB0_46 Depth=1
	add	x26, x23, #16
	b	LBB0_64
LBB0_55:                                ;   in Loop: Header=BB0_46 Depth=1
	ldr	x9, [sp, #128]
	sub	x10, x23, x9
	asr	x23, x10, #4
	add	x10, x23, #1
	lsr	x11, x10, #60
	cbnz	x11, LBB0_129
; %bb.56:                               ;   in Loop: Header=BB0_46 Depth=1
	sub	x8, x8, x9
	asr	x9, x8, #3
	cmp	x9, x10
	csel	x9, x9, x10, hi
	mov	x10, #9223372036854775792       ; =0x7ffffffffffffff0
	cmp	x8, x10
	mov	x8, #1152921504606846975        ; =0xfffffffffffffff
	csel	x26, x9, x8, lo
	add	x8, sp, #128
	stur	x8, [x29, #-96]
	cbz	x26, LBB0_59
; %bb.57:                               ;   in Loop: Header=BB0_46 Depth=1
	lsr	x8, x26, #60
	cbnz	x8, LBB0_130
; %bb.58:                               ;   in Loop: Header=BB0_46 Depth=1
	lsl	x0, x26, #4
Ltmp25:
	bl	__Znwm
Ltmp26:
	b	LBB0_60
LBB0_59:                                ;   in Loop: Header=BB0_46 Depth=1
	mov	x0, #0                          ; =0x0
LBB0_60:                                ;   in Loop: Header=BB0_46 Depth=1
	add	x8, x0, x23, lsl #4
	stp	x0, x8, [x29, #-128]
	add	x9, x0, x26, lsl #4
	stp	x8, x9, [x29, #-112]
Ltmp30:
	add	x1, sp, #32
	mov	x0, x8
	bl	__ZNSt3__116allocator_traitsINS_9allocatorINS_7jthreadEEEE9constructB8ne200100IS2_JZN6vquery12_GLOBAL__N_112execute_implENS6_9QuerySpecERKNS6_6TablesERNS6_16ExecutionContextEE3$_0EvLi0EEEvRS3_PT_DpOT0_
Ltmp31:
; %bb.61:                               ;   in Loop: Header=BB0_46 Depth=1
	ldp	x9, x8, [x29, #-120]
	add	x26, x8, #16
	stur	x26, [x29, #-112]
	ldp	x1, x2, [sp, #128]
	sub	x8, x1, x2
	add	x23, x9, x8
Ltmp32:
	add	x0, sp, #128
	mov	x3, x23
	bl	__ZNSt3__134__uninitialized_allocator_relocateB8ne200100INS_9allocatorINS_7jthreadEEEPS2_EEvRT_T0_S7_S7_
Ltmp33:
; %bb.62:                               ;   in Loop: Header=BB0_46 Depth=1
	ldr	x0, [sp, #128]
	stp	x23, x26, [sp, #128]
	ldur	x8, [x29, #-104]
	str	x8, [sp, #144]
	cbz	x0, LBB0_64
; %bb.63:                               ;   in Loop: Header=BB0_46 Depth=1
	bl	__ZdlPv
LBB0_64:                                ;   in Loop: Header=BB0_46 Depth=1
	str	x26, [sp, #136]
	ldr	x0, [sp, #56]
	cbz	x0, LBB0_45
; %bb.65:                               ;   in Loop: Header=BB0_46 Depth=1
	add	x8, x0, #4
	mov	w9, #-1                         ; =0xffffffff
	ldaddal	w9, w8, [x8]
	cmp	w8, #1
	b.ne	LBB0_45
; %bb.66:                               ;   in Loop: Header=BB0_46 Depth=1
	bl	__ZdlPv
	b	LBB0_45
LBB0_67:
	mov	x8, #0                          ; =0x0
LBB0_68:
	ldp	x19, x20, [sp, #128]
	cmp	x19, x20
	ldr	x21, [sp, #8]                   ; 8-byte Folded Reload
	b.eq	LBB0_72
LBB0_69:                                ; =>This Inner Loop Header: Depth=1
Ltmp50:
	add	x0, x19, #8
	bl	__ZNSt3__16thread4joinEv
Ltmp51:
; %bb.70:                               ;   in Loop: Header=BB0_69 Depth=1
	add	x19, x19, #16
	cmp	x19, x20
	b.ne	LBB0_69
; %bb.71:
	ldr	w8, [x26, #16]
LBB0_72:
	cbz	x8, LBB0_76
; %bb.73:
	add	x1, sp, #160
LBB0_74:                                ; =>This Inner Loop Header: Depth=1
	ldr	x9, [x1]
	cbnz	x9, LBB0_128
; %bb.75:                               ;   in Loop: Header=BB0_74 Depth=1
	add	x1, x1, #8
	subs	x8, x8, #1
	b.ne	LBB0_74
LBB0_76:
	ldur	w1, [x29, #-136]
Ltmp56:
	add	x0, sp, #32
	mov	x2, x21
	bl	__ZN6vquery12_GLOBAL__N_15StateC1ENS_5QueryERKNSt3__110shared_ptrINS_12MemoryBudgetEEE
Ltmp57:
; %bb.77:
	ldr	w8, [x26, #16]
	cbz	w8, LBB0_103
; %bb.78:
	mov	x23, #0                         ; =0x0
	add	x19, sp, #192
	mov	x25, #64915                     ; =0xfd93
	movk	x25, #26201, lsl #16
	movk	x25, #65208, lsl #32
	movk	x25, #55016, lsl #48
	mov	x26, #58809                     ; =0xe5b9
	movk	x26, #7396, lsl #16
	movk	x26, #18285, lsl #32
	movk	x26, #48984, lsl #48
	mov	x27, #4587                      ; =0x11eb
	movk	x27, #4913, lsl #16
	movk	x27, #18875, lsl #32
	movk	x27, #38096, lsl #48
	b	LBB0_81
LBB0_79:                                ;   in Loop: Header=BB0_81 Depth=1
	mov	x0, x22
	bl	__ZdlPv
LBB0_80:                                ;   in Loop: Header=BB0_81 Depth=1
	add	x23, x23, #1
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	ldr	w8, [x8, #16]
	cmp	x23, x8
	b.hs	LBB0_103
LBB0_81:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_87 Depth 2
                                        ;       Child Loop BB0_89 Depth 3
                                        ;       Child Loop BB0_95 Depth 3
	ldr	x22, [x19, x23, lsl #3]
	ldr	x8, [sp, #48]
	cbz	x8, LBB0_100
; %bb.82:                               ;   in Loop: Header=BB0_81 Depth=1
	ldr	x21, [x22, #16]
	ldp	x9, x8, [x21, #16]
	cmp	x8, x9
	b.eq	LBB0_101
; %bb.83:                               ;   in Loop: Header=BB0_81 Depth=1
	mov	x28, #0                         ; =0x0
	b	LBB0_87
LBB0_84:                                ;   in Loop: Header=BB0_87 Depth=2
	mov	x12, #0                         ; =0x0
	mov	w8, #1                          ; =0x1
	strb	w8, [x11, x10]
	ldr	x8, [x22, #16]
	str	w19, [x8, x10, lsl #2]
	ldr	x8, [x22, #64]
	add	x10, x8, x10, lsl #4
	stp	xzr, xzr, [x10]
	ldr	x8, [x22, #160]
	add	x8, x8, #1
	str	x8, [x22, #160]
	ldp	x9, x8, [x21, #16]
LBB0_85:                                ;   in Loop: Header=BB0_87 Depth=2
	add	x11, x20, x28, lsl #4
	ldr	x13, [x11]
	add	x12, x13, x12
	str	x12, [x10]
	ldr	x11, [x11, #8]
	ldr	x12, [x10, #8]
	add	x11, x12, x11
	str	x11, [x10, #8]
LBB0_86:                                ;   in Loop: Header=BB0_87 Depth=2
	add	x28, x28, #1
	sub	x10, x8, x9
	cmp	x28, x10, asr #2
	b.hs	LBB0_98
LBB0_87:                                ;   Parent Loop BB0_81 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_89 Depth 3
                                        ;       Child Loop BB0_95 Depth 3
	ldr	x10, [x21, #112]
	ldrb	w10, [x10, x28]
	cbz	w10, LBB0_86
; %bb.88:                               ;   in Loop: Header=BB0_87 Depth=2
	ldr	w19, [x9, x28, lsl #2]
	ldr	x20, [x21, #64]
	ldr	x22, [sp, #48]
	eor	x10, x19, x25
	eor	x10, x10, x10, lsr #30
	mul	x10, x10, x26
	eor	x10, x10, x10, lsr #27
	mul	x10, x10, x27
	eor	x24, x10, x10, lsr #31
	ldp	x12, x10, [x22, #16]
	sub	x10, x10, x12
	asr	x0, x10, #2
	sub	x13, x0, #1
	ldr	x11, [x22, #112]
	and	x10, x24, x13
	ldrb	w14, [x11, x10]
	cbz	w14, LBB0_91
LBB0_89:                                ;   Parent Loop BB0_81 Depth=1
                                        ;     Parent Loop BB0_87 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	w14, [x12, x10, lsl #2]
	cmp	w14, w19
	b.eq	LBB0_97
; %bb.90:                               ;   in Loop: Header=BB0_89 Depth=3
	add	x10, x10, #1
	and	x10, x10, x13
	ldrb	w14, [x11, x10]
	cbnz	w14, LBB0_89
LBB0_91:                                ;   in Loop: Header=BB0_87 Depth=2
	ldr	x8, [x22, #160]
	add	x8, x8, #1
	mov	x9, #-3689348814741910324       ; =0xcccccccccccccccc
	movk	x9, #52429
	umulh	x9, x0, x9
	lsr	x9, x9, #3
	lsl	x12, x9, #3
	mov	w13, #10                        ; =0xa
	msub	w13, w9, w13, w0
	lsl	w14, w13, #3
	sub	w13, w14, w13
	and	w13, w13, #0xff
	mov	w14, #205                       ; =0xcd
	mul	w13, w13, w14
	lsr	w13, w13, #11
	sub	x9, x12, x9
	add	x9, x9, x13
	cmp	x8, x9
	b.ls	LBB0_84
; %bb.92:                               ;   in Loop: Header=BB0_87 Depth=2
Ltmp59:
	bl	__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEE7doubledEm
	mov	x1, x0
Ltmp60:
; %bb.93:                               ;   in Loop: Header=BB0_87 Depth=2
Ltmp61:
	mov	x0, x22
	bl	__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEE6rehashEm
Ltmp62:
; %bb.94:                               ;   in Loop: Header=BB0_87 Depth=2
	ldp	x8, x9, [x22, #16]
	sub	x9, x9, x8
	asr	x9, x9, #2
	sub	x9, x9, #1
	ldr	x11, [x22, #112]
	and	x10, x9, x24
	ldrb	w12, [x11, x10]
	cbz	w12, LBB0_84
LBB0_95:                                ;   Parent Loop BB0_81 Depth=1
                                        ;     Parent Loop BB0_87 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	w12, [x8, x10, lsl #2]
	cmp	w12, w19
	b.eq	LBB0_84
; %bb.96:                               ;   in Loop: Header=BB0_95 Depth=3
	add	x10, x10, #1
	and	x10, x10, x9
	ldrb	w12, [x11, x10]
	cbnz	w12, LBB0_95
	b	LBB0_84
LBB0_97:                                ;   in Loop: Header=BB0_87 Depth=2
	ldr	x11, [x22, #64]
	add	x10, x11, x10, lsl #4
	ldr	x12, [x10]
	b	LBB0_85
LBB0_98:                                ;   in Loop: Header=BB0_81 Depth=1
	add	x19, sp, #192
	ldr	x22, [x19, x23, lsl #3]
	str	xzr, [x19, x23, lsl #3]
	cbz	x22, LBB0_80
; %bb.99:                               ;   in Loop: Header=BB0_81 Depth=1
	ldr	x0, [x22, #16]
	str	xzr, [x22, #16]
	cbnz	x0, LBB0_102
	b	LBB0_79
LBB0_100:                               ;   in Loop: Header=BB0_81 Depth=1
	ldr	q0, [x22]
	ldr	q1, [sp, #32]
	add.2d	v0, v1, v0
	str	q0, [sp, #32]
LBB0_101:                               ;   in Loop: Header=BB0_81 Depth=1
	str	xzr, [x19, x23, lsl #3]
	ldr	x0, [x22, #16]
	str	xzr, [x22, #16]
	cbz	x0, LBB0_79
LBB0_102:                               ;   in Loop: Header=BB0_81 Depth=1
	bl	__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEED2Ev
	bl	__ZdlPv
	b	LBB0_79
LBB0_103:
	ldur	w2, [x29, #-136]
Ltmp64:
	add	x1, sp, #32
	ldp	x3, x0, [sp, #8]                ; 16-byte Folded Reload
	bl	__ZNK6vquery12_GLOBAL__N_15State6finishENS_5QueryERKNSt3__110shared_ptrINS_12MemoryBudgetEEE
Ltmp65:
; %bb.104:
	ldr	x0, [sp, #48]
	str	xzr, [sp, #48]
	cbz	x0, LBB0_106
; %bb.105:
	bl	__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEED2Ev
	bl	__ZdlPv
LBB0_106:
	ldr	x20, [sp, #128]
	cbz	x20, LBB0_120
; %bb.107:
	ldr	x8, [sp, #136]
	mov	x0, x20
	cmp	x8, x20
	b.eq	LBB0_119
; %bb.108:
	sub	x19, x8, #8
	mov	w21, #-4                        ; =0xfffffffc
	mov	w22, #-1                        ; =0xffffffff
	b	LBB0_110
LBB0_109:                               ;   in Loop: Header=BB0_110 Depth=1
	sub	x8, x19, #8
	sub	x19, x19, #16
	cmp	x8, x20
	b.eq	LBB0_118
LBB0_110:                               ; =>This Inner Loop Header: Depth=1
	ldr	x8, [x19]
	cbz	x8, LBB0_114
; %bb.111:                              ;   in Loop: Header=BB0_110 Depth=1
	ldur	x0, [x19, #-8]
	cbz	x0, LBB0_113
; %bb.112:                              ;   in Loop: Header=BB0_110 Depth=1
	bl	__ZNSt3__112__stop_state14__request_stopB8ne200100Ev
LBB0_113:                               ;   in Loop: Header=BB0_110 Depth=1
Ltmp67:
	mov	x0, x19
	bl	__ZNSt3__16thread4joinEv
Ltmp68:
LBB0_114:                               ;   in Loop: Header=BB0_110 Depth=1
	mov	x0, x19
	bl	__ZNSt3__16threadD1Ev
	ldur	x8, [x19, #-8]
	cbz	x8, LBB0_109
; %bb.115:                              ;   in Loop: Header=BB0_110 Depth=1
	ldadd	w21, w8, [x8]
	ldur	x0, [x19, #-8]
	cbz	x0, LBB0_109
; %bb.116:                              ;   in Loop: Header=BB0_110 Depth=1
	add	x8, x0, #4
	ldaddal	w22, w8, [x8]
	cmp	w8, #1
	b.ne	LBB0_109
; %bb.117:                              ;   in Loop: Header=BB0_110 Depth=1
	bl	__ZdlPv
	b	LBB0_109
LBB0_118:
	ldr	x0, [sp, #128]
LBB0_119:
	str	x20, [sp, #136]
	bl	__ZdlPv
LBB0_120:
	ldr	x8, [sp, #152]
	cbz	x8, LBB0_124
; %bb.121:
	mov	w9, #-4                         ; =0xfffffffc
	ldadd	w9, w8, [x8]
	ldr	x0, [sp, #152]
	cbz	x0, LBB0_124
; %bb.122:
	add	x8, x0, #4
	mov	w9, #-1                         ; =0xffffffff
	ldaddal	w9, w8, [x8]
	cmp	w8, #1
	b.ne	LBB0_124
; %bb.123:
	bl	__ZdlPv
LBB0_124:
	add	x19, sp, #160
	add	x0, x19, #24
	bl	__ZNSt13exception_ptrD1Ev
	add	x0, x19, #16
	bl	__ZNSt13exception_ptrD1Ev
	orr	x0, x19, #0x8
	bl	__ZNSt13exception_ptrD1Ev
	add	x0, sp, #160
	bl	__ZNSt13exception_ptrD1Ev
	add	x0, sp, #192
	bl	__ZNSt3__15arrayINS_10unique_ptrIN6vquery12_GLOBAL__N_15StateENS_14default_deleteIS4_EEEELm4EED1Ev
LBB0_125:
	ldur	x0, [x29, #-216]
	stur	xzr, [x29, #-216]
	cbz	x0, LBB0_127
; %bb.126:
	bl	__ZN6vquery9HashTableIjNS_7KeyHashEED2Ev
	bl	__ZdlPv
LBB0_127:
	ldp	x29, x30, [sp, #448]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #432]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #416]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #400]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #384]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #368]            ; 16-byte Folded Reload
	add	sp, sp, #464
	ret
LBB0_128:
	add	x0, sp, #32
	bl	__ZNSt13exception_ptrC1ERKS_
Ltmp53:
	add	x0, sp, #32
	bl	__ZSt17rethrow_exceptionSt13exception_ptr
Ltmp54:
	b	LBB0_199
LBB0_129:
Ltmp35:
	bl	__ZNSt3__16vectorINS_7jthreadENS_9allocatorIS1_EEE20__throw_length_errorB8ne200100Ev
Ltmp36:
	b	LBB0_199
LBB0_130:
Ltmp28:
	bl	__ZSt28__throw_bad_array_new_lengthB8ne200100v
Ltmp29:
	b	LBB0_199
LBB0_131:
	mov	w0, #24                         ; =0x18
	bl	___cxa_allocate_exception
	mov	x21, x0
Ltmp79:
Lloh4:
	adrp	x1, l_.str.2@PAGE
Lloh5:
	add	x1, x1, l_.str.2@PAGEOFF
	add	x0, sp, #32
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
Ltmp80:
; %bb.132:
	mov	w22, #1                         ; =0x1
Ltmp82:
	add	x1, sp, #32
	mov	x0, x21
	bl	__ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE
Ltmp83:
; %bb.133:
Lloh6:
	adrp	x8, __ZTVN6vquery5ErrorE@GOTPAGE
Lloh7:
	ldr	x8, [x8, __ZTVN6vquery5ErrorE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x21]
	str	wzr, [x21, #16]
Ltmp84:
	mov	w22, #0                         ; =0x0
Lloh8:
	adrp	x1, __ZTIN6vquery5ErrorE@PAGE
Lloh9:
	add	x1, x1, __ZTIN6vquery5ErrorE@PAGEOFF
Lloh10:
	adrp	x2, __ZN6vquery5ErrorD1Ev@GOTPAGE
Lloh11:
	ldr	x2, [x2, __ZN6vquery5ErrorD1Ev@GOTPAGEOFF]
	mov	x0, x21
	bl	___cxa_throw
Ltmp85:
	b	LBB0_199
LBB0_134:
Ltmp66:
	b	LBB0_175
LBB0_135:
Ltmp58:
	b	LBB0_167
LBB0_136:
Ltmp21:
	b	LBB0_167
LBB0_137:
Ltmp75:
	mov	x19, x1
	mov	x20, x0
	sub	x0, x29, #128
	bl	__ZNSt3__110unique_ptrIN6vquery12_GLOBAL__N_15StateENS_14default_deleteIS3_EEED1B8ne200100Ev
	b	LBB0_181
LBB0_138:
Ltmp18:
	mov	x19, x1
	mov	x20, x0
	b	LBB0_180
LBB0_139:
Ltmp72:
	mov	x19, x1
	mov	x20, x0
	add	x0, sp, #32
	bl	__ZN6vquery16ExecutionContextD1Ev
	b	LBB0_181
LBB0_140:
Ltmp10:
	mov	x19, x1
	mov	x20, x0
	add	x0, sp, #32
	bl	__ZNSt3__110shared_ptrIN6vquery12MemoryBudgetEED1B8ne200100Ev
	mov	x0, x23
	bl	__ZdlPv
	b	LBB0_181
LBB0_141:
Ltmp7:
	b	LBB0_170
LBB0_142:
Ltmp86:
	mov	x19, x1
	mov	x20, x0
	ldrsb	w8, [sp, #55]
	tbz	w8, #31, LBB0_144
; %bb.143:
	ldr	x0, [sp, #32]
	bl	__ZdlPv
	tbnz	w22, #0, LBB0_146
	b	LBB0_182
LBB0_144:
	cbnz	w22, LBB0_146
	b	LBB0_182
LBB0_145:
Ltmp81:
	mov	x19, x1
	mov	x20, x0
LBB0_146:
	mov	x0, x21
	bl	___cxa_free_exception
	b	LBB0_182
LBB0_147:
Ltmp4:
	mov	x19, x1
	mov	x20, x0
	b	LBB0_182
LBB0_148:
Ltmp27:
	b	LBB0_153
LBB0_149:
Ltmp69:
	bl	___clang_call_terminate
LBB0_150:
Ltmp24:
	mov	x19, x0
	b	LBB0_159
LBB0_151:
Ltmp40:
	mov	x19, x0
	str	x23, [sp, #136]
	b	LBB0_156
LBB0_152:
Ltmp37:
LBB0_153:
	mov	x19, x0
	b	LBB0_156
LBB0_154:
Ltmp55:
	mov	x19, x1
	mov	x20, x0
	add	x0, sp, #32
	bl	__ZNSt13exception_ptrD1Ev
	b	LBB0_176
LBB0_155:
Ltmp34:
	mov	x19, x0
	sub	x0, x29, #128
	bl	__ZNSt3__114__split_bufferINS_7jthreadERNS_9allocatorIS1_EEED1Ev
LBB0_156:
	ldr	x0, [sp, #56]
	cbz	x0, LBB0_159
; %bb.157:
	add	x8, x0, #4
	mov	w9, #-1                         ; =0xffffffff
	ldaddal	w9, w8, [x8]
	cmp	w8, #1
	b.ne	LBB0_159
; %bb.158:
	bl	__ZdlPv
LBB0_159:
	mov	x0, x19
	bl	___cxa_begin_catch
	ldr	x0, [sp, #152]
	cbz	x0, LBB0_161
; %bb.160:
	bl	__ZNSt3__112__stop_state14__request_stopB8ne200100Ev
LBB0_161:
	ldp	x19, x20, [sp, #128]
	cmp	x19, x20
	b.eq	LBB0_164
LBB0_162:                               ; =>This Inner Loop Header: Depth=1
Ltmp41:
	add	x0, x19, #8
	bl	__ZNSt3__16thread4joinEv
Ltmp42:
; %bb.163:                              ;   in Loop: Header=BB0_162 Depth=1
	add	x19, x19, #16
	cmp	x19, x20
	b.ne	LBB0_162
LBB0_164:
Ltmp44:
	bl	___cxa_rethrow
Ltmp45:
	b	LBB0_199
LBB0_165:
Ltmp43:
	b	LBB0_172
LBB0_166:
Ltmp52:
LBB0_167:
	mov	x19, x1
	mov	x20, x0
	b	LBB0_176
LBB0_168:
Ltmp78:
	b	LBB0_170
LBB0_169:
Ltmp15:
LBB0_170:
	mov	x19, x1
	mov	x20, x0
	b	LBB0_181
LBB0_171:
Ltmp46:
LBB0_172:
	mov	x19, x1
	mov	x20, x0
Ltmp47:
	bl	___cxa_end_catch
Ltmp48:
	b	LBB0_176
LBB0_173:
Ltmp49:
	bl	___clang_call_terminate
LBB0_174:
Ltmp63:
LBB0_175:
	mov	x19, x1
	mov	x20, x0
	add	x0, sp, #32
	bl	__ZN6vquery12_GLOBAL__N_15StateD1Ev
LBB0_176:
	add	x0, sp, #128
	bl	__ZNSt3__16vectorINS_7jthreadENS_9allocatorIS1_EEED1B8ne200100Ev
	ldr	x8, [sp, #152]
	cbz	x8, LBB0_180
; %bb.177:
	mov	w9, #-4                         ; =0xfffffffc
	ldadd	w9, w8, [x8]
	ldr	x0, [sp, #152]
	cbz	x0, LBB0_180
; %bb.178:
	add	x8, x0, #4
	mov	w9, #-1                         ; =0xffffffff
	ldaddal	w9, w8, [x8]
	cmp	w8, #1
	b.ne	LBB0_180
; %bb.179:
	bl	__ZdlPv
LBB0_180:
	add	x0, sp, #160
	bl	__ZNSt3__15arrayISt13exception_ptrLm4EED1Ev
	add	x0, sp, #192
	bl	__ZNSt3__15arrayINS_10unique_ptrIN6vquery12_GLOBAL__N_15StateENS_14default_deleteIS4_EEEELm4EED1Ev
LBB0_181:
	sub	x0, x29, #216
	bl	__ZNSt3__110unique_ptrIN6vquery9HashTableIjNS1_7KeyHashEEENS_14default_deleteIS4_EEED1B8ne200100Ev
LBB0_182:
	mov	x0, x20
	cmp	w19, #5
	b.ne	LBB0_184
; %bb.183:
	bl	___cxa_begin_catch
Ltmp127:
	bl	___cxa_rethrow
Ltmp128:
	b	LBB0_199
LBB0_184:
	cmp	w19, #4
	b.ne	LBB0_188
; %bb.185:
	bl	___cxa_begin_catch
	mov	w0, #24                         ; =0x18
	bl	___cxa_allocate_exception
	mov	x20, x0
Ltmp117:
Lloh12:
	adrp	x1, l_.str.1@PAGE
Lloh13:
	add	x1, x1, l_.str.1@PAGEOFF
	add	x0, sp, #192
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
Ltmp118:
; %bb.186:
	mov	w21, #1                         ; =0x1
Ltmp120:
	add	x1, sp, #192
	mov	x0, x20
	bl	__ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE
Ltmp121:
; %bb.187:
Lloh14:
	adrp	x8, __ZTVN6vquery5ErrorE@GOTPAGE
Lloh15:
	ldr	x8, [x8, __ZTVN6vquery5ErrorE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x20]
	mov	w8, #3                          ; =0x3
	str	w8, [x20, #16]
Ltmp122:
	mov	w21, #0                         ; =0x0
Lloh16:
	adrp	x1, __ZTIN6vquery5ErrorE@PAGE
Lloh17:
	add	x1, x1, __ZTIN6vquery5ErrorE@PAGEOFF
Lloh18:
	adrp	x2, __ZN6vquery5ErrorD1Ev@GOTPAGE
Lloh19:
	ldr	x2, [x2, __ZN6vquery5ErrorD1Ev@GOTPAGEOFF]
	mov	x0, x20
	bl	___cxa_throw
Ltmp123:
	b	LBB0_199
LBB0_188:
	cmp	w19, #3
	b.ne	LBB0_192
; %bb.189:
	bl	___cxa_begin_catch
	mov	x19, x0
	mov	w0, #24                         ; =0x18
	bl	___cxa_allocate_exception
	mov	x20, x0
	ldr	x8, [x19]
	ldr	x8, [x8, #16]
	mov	x0, x19
	blr	x8
	mov	x1, x0
Ltmp107:
	add	x0, sp, #192
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
Ltmp108:
; %bb.190:
	mov	w21, #1                         ; =0x1
Ltmp110:
	add	x1, sp, #192
	mov	x0, x20
	bl	__ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE
Ltmp111:
; %bb.191:
Lloh20:
	adrp	x8, __ZTVN6vquery5ErrorE@GOTPAGE
Lloh21:
	ldr	x8, [x8, __ZTVN6vquery5ErrorE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x20]
	mov	w8, #4                          ; =0x4
	str	w8, [x20, #16]
Ltmp112:
	mov	w21, #0                         ; =0x0
Lloh22:
	adrp	x1, __ZTIN6vquery5ErrorE@PAGE
Lloh23:
	add	x1, x1, __ZTIN6vquery5ErrorE@PAGEOFF
Lloh24:
	adrp	x2, __ZN6vquery5ErrorD1Ev@GOTPAGE
Lloh25:
	ldr	x2, [x2, __ZN6vquery5ErrorD1Ev@GOTPAGEOFF]
	mov	x0, x20
	bl	___cxa_throw
Ltmp113:
	b	LBB0_199
LBB0_192:
	bl	___cxa_begin_catch
	mov	x21, x0
	mov	w0, #24                         ; =0x18
	bl	___cxa_allocate_exception
	mov	x20, x0
	cmp	w19, #2
	b.ne	LBB0_196
; %bb.193:
	ldr	x8, [x21]
	ldr	x8, [x8, #16]
	mov	x0, x21
	blr	x8
	mov	x1, x0
Ltmp97:
	add	x0, sp, #192
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
Ltmp98:
; %bb.194:
	mov	w21, #1                         ; =0x1
Ltmp100:
	add	x1, sp, #192
	mov	x0, x20
	bl	__ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE
Ltmp101:
; %bb.195:
Lloh26:
	adrp	x8, __ZTVN6vquery5ErrorE@GOTPAGE
Lloh27:
	ldr	x8, [x8, __ZTVN6vquery5ErrorE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x20]
	mov	w8, #4                          ; =0x4
	str	w8, [x20, #16]
Ltmp102:
	mov	w21, #0                         ; =0x0
Lloh28:
	adrp	x1, __ZTIN6vquery5ErrorE@PAGE
Lloh29:
	add	x1, x1, __ZTIN6vquery5ErrorE@PAGEOFF
Lloh30:
	adrp	x2, __ZN6vquery5ErrorD1Ev@GOTPAGE
Lloh31:
	ldr	x2, [x2, __ZN6vquery5ErrorD1Ev@GOTPAGEOFF]
	mov	x0, x20
	bl	___cxa_throw
Ltmp103:
	b	LBB0_199
LBB0_196:
Ltmp87:
Lloh32:
	adrp	x1, l_.str@PAGE
Lloh33:
	add	x1, x1, l_.str@PAGEOFF
	add	x0, sp, #192
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
Ltmp88:
; %bb.197:
	mov	w21, #1                         ; =0x1
Ltmp90:
	add	x1, sp, #192
	mov	x0, x20
	bl	__ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE
Ltmp91:
; %bb.198:
Lloh34:
	adrp	x8, __ZTVN6vquery5ErrorE@GOTPAGE
Lloh35:
	ldr	x8, [x8, __ZTVN6vquery5ErrorE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x20]
	mov	w8, #4                          ; =0x4
	str	w8, [x20, #16]
Ltmp92:
	mov	w21, #0                         ; =0x0
Lloh36:
	adrp	x1, __ZTIN6vquery5ErrorE@PAGE
Lloh37:
	add	x1, x1, __ZTIN6vquery5ErrorE@PAGEOFF
Lloh38:
	adrp	x2, __ZN6vquery5ErrorD1Ev@GOTPAGE
Lloh39:
	ldr	x2, [x2, __ZN6vquery5ErrorD1Ev@GOTPAGEOFF]
	mov	x0, x20
	bl	___cxa_throw
Ltmp93:
LBB0_199:
	brk	#0x1
LBB0_200:
Ltmp94:
	mov	x19, x0
	ldrsb	w8, [sp, #215]
	tbz	w8, #31, LBB0_202
; %bb.201:
	ldr	x0, [sp, #192]
	bl	__ZdlPv
	tbnz	w21, #0, LBB0_204
	b	LBB0_205
LBB0_202:
	cbnz	w21, LBB0_204
	b	LBB0_205
LBB0_203:
Ltmp89:
	mov	x19, x0
LBB0_204:
	mov	x0, x20
	bl	___cxa_free_exception
LBB0_205:
Ltmp95:
	bl	___cxa_end_catch
Ltmp96:
	b	LBB0_225
LBB0_206:
Ltmp104:
	mov	x19, x0
	ldrsb	w8, [sp, #215]
	tbz	w8, #31, LBB0_208
; %bb.207:
	ldr	x0, [sp, #192]
	bl	__ZdlPv
	tbnz	w21, #0, LBB0_210
	b	LBB0_211
LBB0_208:
	cbnz	w21, LBB0_210
	b	LBB0_211
LBB0_209:
Ltmp99:
	mov	x19, x0
LBB0_210:
	mov	x0, x20
	bl	___cxa_free_exception
LBB0_211:
Ltmp105:
	bl	___cxa_end_catch
Ltmp106:
	b	LBB0_225
LBB0_212:
Ltmp114:
	mov	x19, x0
	ldrsb	w8, [sp, #215]
	tbz	w8, #31, LBB0_214
; %bb.213:
	ldr	x0, [sp, #192]
	bl	__ZdlPv
	tbnz	w21, #0, LBB0_216
	b	LBB0_217
LBB0_214:
	cbnz	w21, LBB0_216
	b	LBB0_217
LBB0_215:
Ltmp109:
	mov	x19, x0
LBB0_216:
	mov	x0, x20
	bl	___cxa_free_exception
LBB0_217:
Ltmp115:
	bl	___cxa_end_catch
Ltmp116:
	b	LBB0_225
LBB0_218:
Ltmp124:
	mov	x19, x0
	ldrsb	w8, [sp, #215]
	tbz	w8, #31, LBB0_220
; %bb.219:
	ldr	x0, [sp, #192]
	bl	__ZdlPv
	tbnz	w21, #0, LBB0_222
	b	LBB0_223
LBB0_220:
	cbnz	w21, LBB0_222
	b	LBB0_223
LBB0_221:
Ltmp119:
	mov	x19, x0
LBB0_222:
	mov	x0, x20
	bl	___cxa_free_exception
LBB0_223:
Ltmp125:
	bl	___cxa_end_catch
Ltmp126:
	b	LBB0_225
LBB0_224:
Ltmp129:
	mov	x19, x0
Ltmp130:
	bl	___cxa_end_catch
Ltmp131:
LBB0_225:
	mov	x0, x19
	bl	__Unwind_Resume
LBB0_226:
Ltmp132:
	bl	___clang_call_terminate
	.loh AdrpLdr	Lloh2, Lloh3
	.loh AdrpLdr	Lloh0, Lloh1
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpLdrGot	Lloh10, Lloh11
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpLdrGot	Lloh6, Lloh7
	.loh AdrpAdd	Lloh12, Lloh13
	.loh AdrpLdrGot	Lloh18, Lloh19
	.loh AdrpAdd	Lloh16, Lloh17
	.loh AdrpLdrGot	Lloh14, Lloh15
	.loh AdrpLdrGot	Lloh24, Lloh25
	.loh AdrpAdd	Lloh22, Lloh23
	.loh AdrpLdrGot	Lloh20, Lloh21
	.loh AdrpLdrGot	Lloh30, Lloh31
	.loh AdrpAdd	Lloh28, Lloh29
	.loh AdrpLdrGot	Lloh26, Lloh27
	.loh AdrpAdd	Lloh32, Lloh33
	.loh AdrpLdrGot	Lloh38, Lloh39
	.loh AdrpAdd	Lloh36, Lloh37
	.loh AdrpLdrGot	Lloh34, Lloh35
Lfunc_end0:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table0:
Lexception0:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase0-Lttbaseref0
Lttbaseref0:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end0-Lcst_begin0
Lcst_begin0:
	.uleb128 Ltmp0-Lfunc_begin0             ; >> Call Site 1 <<
	.uleb128 Ltmp3-Ltmp0                    ;   Call between Ltmp0 and Ltmp3
	.uleb128 Ltmp4-Lfunc_begin0             ;     jumps to Ltmp4
	.byte	9                               ;   On action: 5
	.uleb128 Ltmp76-Lfunc_begin0            ; >> Call Site 2 <<
	.uleb128 Ltmp77-Ltmp76                  ;   Call between Ltmp76 and Ltmp77
	.uleb128 Ltmp78-Lfunc_begin0            ;     jumps to Ltmp78
	.byte	9                               ;   On action: 5
	.uleb128 Ltmp5-Lfunc_begin0             ; >> Call Site 3 <<
	.uleb128 Ltmp6-Ltmp5                    ;   Call between Ltmp5 and Ltmp6
	.uleb128 Ltmp7-Lfunc_begin0             ;     jumps to Ltmp7
	.byte	9                               ;   On action: 5
	.uleb128 Ltmp8-Lfunc_begin0             ; >> Call Site 4 <<
	.uleb128 Ltmp9-Ltmp8                    ;   Call between Ltmp8 and Ltmp9
	.uleb128 Ltmp10-Lfunc_begin0            ;     jumps to Ltmp10
	.byte	9                               ;   On action: 5
	.uleb128 Ltmp9-Lfunc_begin0             ; >> Call Site 5 <<
	.uleb128 Ltmp11-Ltmp9                   ;   Call between Ltmp9 and Ltmp11
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp11-Lfunc_begin0            ; >> Call Site 6 <<
	.uleb128 Ltmp14-Ltmp11                  ;   Call between Ltmp11 and Ltmp14
	.uleb128 Ltmp15-Lfunc_begin0            ;     jumps to Ltmp15
	.byte	9                               ;   On action: 5
	.uleb128 Ltmp70-Lfunc_begin0            ; >> Call Site 7 <<
	.uleb128 Ltmp71-Ltmp70                  ;   Call between Ltmp70 and Ltmp71
	.uleb128 Ltmp72-Lfunc_begin0            ;     jumps to Ltmp72
	.byte	9                               ;   On action: 5
	.uleb128 Ltmp71-Lfunc_begin0            ; >> Call Site 8 <<
	.uleb128 Ltmp73-Ltmp71                  ;   Call between Ltmp71 and Ltmp73
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp73-Lfunc_begin0            ; >> Call Site 9 <<
	.uleb128 Ltmp74-Ltmp73                  ;   Call between Ltmp73 and Ltmp74
	.uleb128 Ltmp75-Lfunc_begin0            ;     jumps to Ltmp75
	.byte	9                               ;   On action: 5
	.uleb128 Ltmp16-Lfunc_begin0            ; >> Call Site 10 <<
	.uleb128 Ltmp17-Ltmp16                  ;   Call between Ltmp16 and Ltmp17
	.uleb128 Ltmp18-Lfunc_begin0            ;     jumps to Ltmp18
	.byte	9                               ;   On action: 5
	.uleb128 Ltmp19-Lfunc_begin0            ; >> Call Site 11 <<
	.uleb128 Ltmp20-Ltmp19                  ;   Call between Ltmp19 and Ltmp20
	.uleb128 Ltmp21-Lfunc_begin0            ;     jumps to Ltmp21
	.byte	9                               ;   On action: 5
	.uleb128 Ltmp22-Lfunc_begin0            ; >> Call Site 12 <<
	.uleb128 Ltmp23-Ltmp22                  ;   Call between Ltmp22 and Ltmp23
	.uleb128 Ltmp24-Lfunc_begin0            ;     jumps to Ltmp24
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp38-Lfunc_begin0            ; >> Call Site 13 <<
	.uleb128 Ltmp39-Ltmp38                  ;   Call between Ltmp38 and Ltmp39
	.uleb128 Ltmp40-Lfunc_begin0            ;     jumps to Ltmp40
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp25-Lfunc_begin0            ; >> Call Site 14 <<
	.uleb128 Ltmp26-Ltmp25                  ;   Call between Ltmp25 and Ltmp26
	.uleb128 Ltmp27-Lfunc_begin0            ;     jumps to Ltmp27
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp30-Lfunc_begin0            ; >> Call Site 15 <<
	.uleb128 Ltmp33-Ltmp30                  ;   Call between Ltmp30 and Ltmp33
	.uleb128 Ltmp34-Lfunc_begin0            ;     jumps to Ltmp34
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp50-Lfunc_begin0            ; >> Call Site 16 <<
	.uleb128 Ltmp51-Ltmp50                  ;   Call between Ltmp50 and Ltmp51
	.uleb128 Ltmp52-Lfunc_begin0            ;     jumps to Ltmp52
	.byte	9                               ;   On action: 5
	.uleb128 Ltmp56-Lfunc_begin0            ; >> Call Site 17 <<
	.uleb128 Ltmp57-Ltmp56                  ;   Call between Ltmp56 and Ltmp57
	.uleb128 Ltmp58-Lfunc_begin0            ;     jumps to Ltmp58
	.byte	9                               ;   On action: 5
	.uleb128 Ltmp59-Lfunc_begin0            ; >> Call Site 18 <<
	.uleb128 Ltmp62-Ltmp59                  ;   Call between Ltmp59 and Ltmp62
	.uleb128 Ltmp63-Lfunc_begin0            ;     jumps to Ltmp63
	.byte	9                               ;   On action: 5
	.uleb128 Ltmp64-Lfunc_begin0            ; >> Call Site 19 <<
	.uleb128 Ltmp65-Ltmp64                  ;   Call between Ltmp64 and Ltmp65
	.uleb128 Ltmp66-Lfunc_begin0            ;     jumps to Ltmp66
	.byte	9                               ;   On action: 5
	.uleb128 Ltmp67-Lfunc_begin0            ; >> Call Site 20 <<
	.uleb128 Ltmp68-Ltmp67                  ;   Call between Ltmp67 and Ltmp68
	.uleb128 Ltmp69-Lfunc_begin0            ;     jumps to Ltmp69
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp53-Lfunc_begin0            ; >> Call Site 21 <<
	.uleb128 Ltmp54-Ltmp53                  ;   Call between Ltmp53 and Ltmp54
	.uleb128 Ltmp55-Lfunc_begin0            ;     jumps to Ltmp55
	.byte	9                               ;   On action: 5
	.uleb128 Ltmp35-Lfunc_begin0            ; >> Call Site 22 <<
	.uleb128 Ltmp29-Ltmp35                  ;   Call between Ltmp35 and Ltmp29
	.uleb128 Ltmp37-Lfunc_begin0            ;     jumps to Ltmp37
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp29-Lfunc_begin0            ; >> Call Site 23 <<
	.uleb128 Ltmp79-Ltmp29                  ;   Call between Ltmp29 and Ltmp79
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp79-Lfunc_begin0            ; >> Call Site 24 <<
	.uleb128 Ltmp80-Ltmp79                  ;   Call between Ltmp79 and Ltmp80
	.uleb128 Ltmp81-Lfunc_begin0            ;     jumps to Ltmp81
	.byte	9                               ;   On action: 5
	.uleb128 Ltmp82-Lfunc_begin0            ; >> Call Site 25 <<
	.uleb128 Ltmp85-Ltmp82                  ;   Call between Ltmp82 and Ltmp85
	.uleb128 Ltmp86-Lfunc_begin0            ;     jumps to Ltmp86
	.byte	9                               ;   On action: 5
	.uleb128 Ltmp85-Lfunc_begin0            ; >> Call Site 26 <<
	.uleb128 Ltmp41-Ltmp85                  ;   Call between Ltmp85 and Ltmp41
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp41-Lfunc_begin0            ; >> Call Site 27 <<
	.uleb128 Ltmp42-Ltmp41                  ;   Call between Ltmp41 and Ltmp42
	.uleb128 Ltmp43-Lfunc_begin0            ;     jumps to Ltmp43
	.byte	9                               ;   On action: 5
	.uleb128 Ltmp44-Lfunc_begin0            ; >> Call Site 28 <<
	.uleb128 Ltmp45-Ltmp44                  ;   Call between Ltmp44 and Ltmp45
	.uleb128 Ltmp46-Lfunc_begin0            ;     jumps to Ltmp46
	.byte	9                               ;   On action: 5
	.uleb128 Ltmp47-Lfunc_begin0            ; >> Call Site 29 <<
	.uleb128 Ltmp48-Ltmp47                  ;   Call between Ltmp47 and Ltmp48
	.uleb128 Ltmp49-Lfunc_begin0            ;     jumps to Ltmp49
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp48-Lfunc_begin0            ; >> Call Site 30 <<
	.uleb128 Ltmp127-Ltmp48                 ;   Call between Ltmp48 and Ltmp127
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp127-Lfunc_begin0           ; >> Call Site 31 <<
	.uleb128 Ltmp128-Ltmp127                ;   Call between Ltmp127 and Ltmp128
	.uleb128 Ltmp129-Lfunc_begin0           ;     jumps to Ltmp129
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp128-Lfunc_begin0           ; >> Call Site 32 <<
	.uleb128 Ltmp117-Ltmp128                ;   Call between Ltmp128 and Ltmp117
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp117-Lfunc_begin0           ; >> Call Site 33 <<
	.uleb128 Ltmp118-Ltmp117                ;   Call between Ltmp117 and Ltmp118
	.uleb128 Ltmp119-Lfunc_begin0           ;     jumps to Ltmp119
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp120-Lfunc_begin0           ; >> Call Site 34 <<
	.uleb128 Ltmp123-Ltmp120                ;   Call between Ltmp120 and Ltmp123
	.uleb128 Ltmp124-Lfunc_begin0           ;     jumps to Ltmp124
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp123-Lfunc_begin0           ; >> Call Site 35 <<
	.uleb128 Ltmp107-Ltmp123                ;   Call between Ltmp123 and Ltmp107
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp107-Lfunc_begin0           ; >> Call Site 36 <<
	.uleb128 Ltmp108-Ltmp107                ;   Call between Ltmp107 and Ltmp108
	.uleb128 Ltmp109-Lfunc_begin0           ;     jumps to Ltmp109
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp110-Lfunc_begin0           ; >> Call Site 37 <<
	.uleb128 Ltmp113-Ltmp110                ;   Call between Ltmp110 and Ltmp113
	.uleb128 Ltmp114-Lfunc_begin0           ;     jumps to Ltmp114
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp113-Lfunc_begin0           ; >> Call Site 38 <<
	.uleb128 Ltmp97-Ltmp113                 ;   Call between Ltmp113 and Ltmp97
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp97-Lfunc_begin0            ; >> Call Site 39 <<
	.uleb128 Ltmp98-Ltmp97                  ;   Call between Ltmp97 and Ltmp98
	.uleb128 Ltmp99-Lfunc_begin0            ;     jumps to Ltmp99
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp100-Lfunc_begin0           ; >> Call Site 40 <<
	.uleb128 Ltmp103-Ltmp100                ;   Call between Ltmp100 and Ltmp103
	.uleb128 Ltmp104-Lfunc_begin0           ;     jumps to Ltmp104
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp87-Lfunc_begin0            ; >> Call Site 41 <<
	.uleb128 Ltmp88-Ltmp87                  ;   Call between Ltmp87 and Ltmp88
	.uleb128 Ltmp89-Lfunc_begin0            ;     jumps to Ltmp89
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp90-Lfunc_begin0            ; >> Call Site 42 <<
	.uleb128 Ltmp93-Ltmp90                  ;   Call between Ltmp90 and Ltmp93
	.uleb128 Ltmp94-Lfunc_begin0            ;     jumps to Ltmp94
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp93-Lfunc_begin0            ; >> Call Site 43 <<
	.uleb128 Ltmp95-Ltmp93                  ;   Call between Ltmp93 and Ltmp95
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp95-Lfunc_begin0            ; >> Call Site 44 <<
	.uleb128 Ltmp96-Ltmp95                  ;   Call between Ltmp95 and Ltmp96
	.uleb128 Ltmp132-Lfunc_begin0           ;     jumps to Ltmp132
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp96-Lfunc_begin0            ; >> Call Site 45 <<
	.uleb128 Ltmp105-Ltmp96                 ;   Call between Ltmp96 and Ltmp105
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp105-Lfunc_begin0           ; >> Call Site 46 <<
	.uleb128 Ltmp106-Ltmp105                ;   Call between Ltmp105 and Ltmp106
	.uleb128 Ltmp132-Lfunc_begin0           ;     jumps to Ltmp132
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp106-Lfunc_begin0           ; >> Call Site 47 <<
	.uleb128 Ltmp115-Ltmp106                ;   Call between Ltmp106 and Ltmp115
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp115-Lfunc_begin0           ; >> Call Site 48 <<
	.uleb128 Ltmp116-Ltmp115                ;   Call between Ltmp115 and Ltmp116
	.uleb128 Ltmp132-Lfunc_begin0           ;     jumps to Ltmp132
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp116-Lfunc_begin0           ; >> Call Site 49 <<
	.uleb128 Ltmp125-Ltmp116                ;   Call between Ltmp116 and Ltmp125
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp125-Lfunc_begin0           ; >> Call Site 50 <<
	.uleb128 Ltmp131-Ltmp125                ;   Call between Ltmp125 and Ltmp131
	.uleb128 Ltmp132-Lfunc_begin0           ;     jumps to Ltmp132
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp131-Lfunc_begin0           ; >> Call Site 51 <<
	.uleb128 Lfunc_end0-Ltmp131             ;   Call between Ltmp131 and Lfunc_end0
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end0:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.byte	2                               ; >> Action Record 2 <<
                                        ;   Catch TypeInfo 2
	.byte	125                             ;   Continue to action 1
	.byte	3                               ; >> Action Record 3 <<
                                        ;   Catch TypeInfo 3
	.byte	125                             ;   Continue to action 2
	.byte	4                               ; >> Action Record 4 <<
                                        ;   Catch TypeInfo 4
	.byte	125                             ;   Continue to action 3
	.byte	5                               ; >> Action Record 5 <<
                                        ;   Catch TypeInfo 5
	.byte	125                             ;   Continue to action 4
	.p2align	2, 0x0
                                        ; >> Catch TypeInfos <<
Ltmp429:                                ; TypeInfo 5
	.long	__ZTIN6vquery5ErrorE@GOT-Ltmp429
Ltmp430:                                ; TypeInfo 4
	.long	__ZTISt9bad_alloc@GOT-Ltmp430
Ltmp431:                                ; TypeInfo 3
	.long	__ZTINSt3__112system_errorE@GOT-Ltmp431
Ltmp432:                                ; TypeInfo 2
	.long	__ZTISt9exception@GOT-Ltmp432
	.long	0                               ; TypeInfo 1
Lttbase0:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc ; -- Begin function _ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
	.weak_def_can_be_hidden	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
	.p2align	2
__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc: ; @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
	.cfi_startproc
; %bb.0:
	stp	x24, x23, [sp, #-64]!           ; 16-byte Folded Spill
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	mov	x21, x1
	mov	x19, x0
	mov	x0, x1
	bl	_strlen
	mov	x8, #9223372036854775800        ; =0x7ffffffffffffff8
	cmp	x0, x8
	b.hs	LBB1_6
; %bb.1:
	mov	x20, x0
	cmp	x0, #23
	b.hs	LBB1_3
; %bb.2:
	strb	w20, [x19, #23]
	mov	x22, x19
	cbnz	x20, LBB1_4
	b	LBB1_5
LBB1_3:
	orr	x8, x20, #0x7
	cmp	x8, #23
	mov	w9, #25                         ; =0x19
	csinc	x23, x9, x8, eq
	mov	x0, x23
	bl	__Znwm
	mov	x22, x0
	orr	x8, x23, #0x8000000000000000
	stp	x20, x8, [x19, #8]
	str	x0, [x19]
LBB1_4:
	mov	x0, x22
	mov	x1, x21
	mov	x2, x20
	bl	_memmove
LBB1_5:
	strb	wzr, [x22, x20]
	mov	x0, x19
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
LBB1_6:
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorB8ne200100Ev
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN6vquery5ErrorD1Ev           ; -- Begin function _ZN6vquery5ErrorD1Ev
	.weak_def_can_be_hidden	__ZN6vquery5ErrorD1Ev
	.p2align	2
__ZN6vquery5ErrorD1Ev:                  ; @_ZN6vquery5ErrorD1Ev
	.cfi_startproc
; %bb.0:
	b	__ZNSt13runtime_errorD2Ev
	.cfi_endproc
                                        ; -- End function
	.private_extern	___clang_call_terminate ; -- Begin function __clang_call_terminate
	.globl	___clang_call_terminate
	.weak_def_can_be_hidden	___clang_call_terminate
	.p2align	2
___clang_call_terminate:                ; @__clang_call_terminate
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	bl	___cxa_begin_catch
	bl	__ZSt9terminatev
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__110unique_ptrIN6vquery9HashTableIjNS1_7KeyHashEEENS_14default_deleteIS4_EEED1B8ne200100Ev ; -- Begin function _ZNSt3__110unique_ptrIN6vquery9HashTableIjNS1_7KeyHashEEENS_14default_deleteIS4_EEED1B8ne200100Ev
	.globl	__ZNSt3__110unique_ptrIN6vquery9HashTableIjNS1_7KeyHashEEENS_14default_deleteIS4_EEED1B8ne200100Ev
	.weak_def_can_be_hidden	__ZNSt3__110unique_ptrIN6vquery9HashTableIjNS1_7KeyHashEEENS_14default_deleteIS4_EEED1B8ne200100Ev
	.p2align	2
__ZNSt3__110unique_ptrIN6vquery9HashTableIjNS1_7KeyHashEEENS_14default_deleteIS4_EEED1B8ne200100Ev: ; @_ZNSt3__110unique_ptrIN6vquery9HashTableIjNS1_7KeyHashEEENS_14default_deleteIS4_EEED1B8ne200100Ev
	.cfi_startproc
; %bb.0:
	mov	x8, x0
	ldr	x0, [x0]
	str	xzr, [x8]
	cbz	x0, LBB4_2
; %bb.1:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x8
	bl	__ZN6vquery9HashTableIjNS_7KeyHashEED2Ev
	bl	__ZdlPv
	mov	x8, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
LBB4_2:
	mov	x0, x8
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN6vquery9HashTableIjNS_7KeyHashEE13insert_uniqueEjj ; -- Begin function _ZN6vquery9HashTableIjNS_7KeyHashEE13insert_uniqueEjj
	.weak_def_can_be_hidden	__ZN6vquery9HashTableIjNS_7KeyHashEE13insert_uniqueEjj
	.p2align	2
__ZN6vquery9HashTableIjNS_7KeyHashEE13insert_uniqueEjj: ; @_ZN6vquery9HashTableIjNS_7KeyHashEE13insert_uniqueEjj
Lfunc_begin1:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception1
; %bb.0:
	sub	sp, sp, #80
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x19, x2
	mov	w8, w1
	mov	x9, #64915                      ; =0xfd93
	movk	x9, #26201, lsl #16
	movk	x9, #65208, lsl #32
	movk	x9, #55016, lsl #48
	eor	x8, x8, x9
	eor	x8, x8, x8, lsr #30
	mov	x9, #58809                      ; =0xe5b9
	movk	x9, #7396, lsl #16
	movk	x9, #18285, lsl #32
	movk	x9, #48984, lsl #48
	mul	x8, x8, x9
	eor	x8, x8, x8, lsr #27
	mov	x9, #4587                       ; =0x11eb
	movk	x9, #4913, lsl #16
	movk	x9, #18875, lsl #32
	movk	x9, #38096, lsl #48
	mul	x8, x8, x9
	eor	x11, x8, x8, lsr #31
	ldp	x8, x9, [x0, #16]
	sub	x9, x9, x8
	asr	x9, x9, #2
	sub	x9, x9, #1
	ldr	x10, [x0, #112]
	and	x11, x9, x11
	ldrb	w12, [x10, x11]
	cbz	w12, LBB5_4
LBB5_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w12, [x8, x11, lsl #2]
	cmp	w12, w1
	b.eq	LBB5_3
; %bb.2:                                ;   in Loop: Header=BB5_1 Depth=1
	add	x11, x11, #1
	and	x11, x11, x9
	ldrb	w12, [x10, x11]
	cbnz	w12, LBB5_1
	b	LBB5_4
LBB5_3:
	ldr	x8, [x0, #64]
	cbnz	x8, LBB5_5
LBB5_4:
	bl	__ZN6vquery9HashTableIjNS_7KeyHashEE14find_or_insertEj
	str	w19, [x0]
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB5_5:
	mov	w0, #24                         ; =0x18
	bl	___cxa_allocate_exception
	mov	x19, x0
Ltmp133:
Lloh40:
	adrp	x1, l_.str.8@PAGE
Lloh41:
	add	x1, x1, l_.str.8@PAGEOFF
	add	x0, sp, #8
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
Ltmp134:
; %bb.6:
	mov	w21, #1                         ; =0x1
Ltmp136:
	add	x1, sp, #8
	mov	x0, x19
	bl	__ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE
Ltmp137:
; %bb.7:
Lloh42:
	adrp	x8, __ZTVN6vquery5ErrorE@GOTPAGE
Lloh43:
	ldr	x8, [x8, __ZTVN6vquery5ErrorE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x19]
	str	w21, [x19, #16]
Ltmp138:
	mov	w21, #0                         ; =0x0
Lloh44:
	adrp	x1, __ZTIN6vquery5ErrorE@PAGE
Lloh45:
	add	x1, x1, __ZTIN6vquery5ErrorE@PAGEOFF
Lloh46:
	adrp	x2, __ZN6vquery5ErrorD1Ev@GOTPAGE
Lloh47:
	ldr	x2, [x2, __ZN6vquery5ErrorD1Ev@GOTPAGEOFF]
	mov	x0, x19
	bl	___cxa_throw
Ltmp139:
; %bb.8:
	brk	#0x1
LBB5_9:
Ltmp140:
	mov	x20, x0
	ldrsb	w8, [sp, #31]
	tbz	w8, #31, LBB5_11
; %bb.10:
	ldr	x0, [sp, #8]
	bl	__ZdlPv
	tbnz	w21, #0, LBB5_13
	b	LBB5_14
LBB5_11:
	cbnz	w21, LBB5_13
	b	LBB5_14
LBB5_12:
Ltmp135:
	mov	x20, x0
LBB5_13:
	mov	x0, x19
	bl	___cxa_free_exception
LBB5_14:
	mov	x0, x20
	bl	__Unwind_Resume
	.loh AdrpAdd	Lloh40, Lloh41
	.loh AdrpLdrGot	Lloh46, Lloh47
	.loh AdrpAdd	Lloh44, Lloh45
	.loh AdrpLdrGot	Lloh42, Lloh43
Lfunc_end1:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table5:
Lexception1:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end1-Lcst_begin1
Lcst_begin1:
	.uleb128 Lfunc_begin1-Lfunc_begin1      ; >> Call Site 1 <<
	.uleb128 Ltmp133-Lfunc_begin1           ;   Call between Lfunc_begin1 and Ltmp133
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp133-Lfunc_begin1           ; >> Call Site 2 <<
	.uleb128 Ltmp134-Ltmp133                ;   Call between Ltmp133 and Ltmp134
	.uleb128 Ltmp135-Lfunc_begin1           ;     jumps to Ltmp135
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp136-Lfunc_begin1           ; >> Call Site 3 <<
	.uleb128 Ltmp139-Ltmp136                ;   Call between Ltmp136 and Ltmp139
	.uleb128 Ltmp140-Lfunc_begin1           ;     jumps to Ltmp140
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp139-Lfunc_begin1           ; >> Call Site 4 <<
	.uleb128 Lfunc_end1-Ltmp139             ;   Call between Ltmp139 and Lfunc_end1
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end1:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_19run_rangeENS_9QuerySpecERKNS_6TablesENS_16ExecutionContextEmmPKNS_9HashTableIjNS_7KeyHashEEERKNSt3__110stop_tokenE
__ZN6vquery12_GLOBAL__N_19run_rangeENS_9QuerySpecERKNS_6TablesENS_16ExecutionContextEmmPKNS_9HashTableIjNS_7KeyHashEEERKNSt3__110stop_tokenE: ; @_ZN6vquery12_GLOBAL__N_19run_rangeENS_9QuerySpecERKNS_6TablesENS_16ExecutionContextEmmPKNS_9HashTableIjNS_7KeyHashEEERKNSt3__110stop_tokenE
Lfunc_begin2:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception2
; %bb.0:
	sub	sp, sp, #240
	stp	x28, x27, [sp, #144]            ; 16-byte Folded Spill
	stp	x26, x25, [sp, #160]            ; 16-byte Folded Spill
	stp	x24, x23, [sp, #176]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #192]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #208]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #224]            ; 16-byte Folded Spill
	add	x29, sp, #224
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	mov	x24, x6
	mov	x25, x5
	mov	x26, x4
	mov	x22, x3
	mov	x27, x2
	mov	x20, x1
	mov	x19, x0
	str	x7, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x8, [x7]
	ldr	x0, [x3, #48]
	cmp	x8, x0
	b.eq	LBB6_7
; %bb.1:
	cbz	x8, LBB6_3
; %bb.2:
	add	x8, x8, #4
	mov	w9, #1                          ; =0x1
	ldadd	w9, w8, [x8]
	ldr	x0, [x22, #48]
LBB6_3:
	cbz	x0, LBB6_6
; %bb.4:
	add	x8, x0, #4
	mov	w9, #-1                         ; =0xffffffff
	ldaddal	w9, w8, [x8]
	cmp	w8, #1
	b.ne	LBB6_6
; %bb.5:
	bl	__ZdlPv
LBB6_6:
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x8, [x8]
	str	x8, [x22, #48]
LBB6_7:
	mov	w0, #24                         ; =0x18
	bl	__Znwm
	mov	x23, x0
Ltmp141:
	add	x2, x22, #24
	mov	x1, x20
	bl	__ZN6vquery12_GLOBAL__N_15StateC1ENS_5QueryERKNSt3__110shared_ptrINS_12MemoryBudgetEEE
Ltmp142:
; %bb.8:
	str	x23, [x19]
	ldr	w8, [x22]
	cmp	w8, #2
	b.ne	LBB6_35
; %bb.9:
Ltmp155:
	sub	x8, x29, #88
	mov	x0, x27
	mov	x1, x20
	mov	x2, x26
	mov	x3, x25
	mov	x4, x24
	bl	__ZN6vquery14batch_pipelineERKNS_6TablesENS_9QuerySpecEmmPKNS_9HashTableIjNS_7KeyHashEEE
Ltmp156:
; %bb.10:
	ldur	x0, [x29, #-88]
	ldr	x8, [x0]
	ldr	x8, [x8, #16]
Ltmp158:
	mov	x1, x22
	blr	x8
Ltmp159:
; %bb.11:
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [sp, #96]
	stp	q0, q0, [sp, #64]
	stp	q0, q0, [sp, #32]
	mov	w8, #1                          ; =0x1
	mov	x24, #64915                     ; =0xfd93
	movk	x24, #26201, lsl #16
	movk	x24, #65208, lsl #32
	movk	x24, #55016, lsl #48
	mov	x25, #58809                     ; =0xe5b9
	movk	x25, #7396, lsl #16
	movk	x25, #18285, lsl #32
	movk	x25, #48984, lsl #48
	mov	x26, #4587                      ; =0x11eb
	movk	x26, #4913, lsl #16
	movk	x26, #18875, lsl #32
	movk	x26, #38096, lsl #48
	dup.2d	v0, x8
	str	q0, [sp, #16]                   ; 16-byte Folded Spill
LBB6_12:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB6_20 Depth 2
                                        ;       Child Loop BB6_26 Depth 3
                                        ;       Child Loop BB6_32 Depth 3
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x8, [x8]
	cbz	x8, LBB6_14
; %bb.13:                               ;   in Loop: Header=BB6_12 Depth=1
	ldapr	w8, [x8]
	tbnz	w8, #0, LBB6_43
LBB6_14:                                ;   in Loop: Header=BB6_12 Depth=1
	ldur	x0, [x29, #-88]
	ldr	x8, [x0]
	ldr	x8, [x8, #24]
Ltmp161:
	add	x1, sp, #32
	blr	x8
Ltmp162:
; %bb.15:                               ;   in Loop: Header=BB6_12 Depth=1
	cbz	w0, LBB6_43
; %bb.16:                               ;   in Loop: Header=BB6_12 Depth=1
	ldr	x8, [sp, #120]
	cbz	x8, LBB6_12
; %bb.17:                               ;   in Loop: Header=BB6_12 Depth=1
	mov	x23, #0                         ; =0x0
	b	LBB6_20
LBB6_18:                                ;   in Loop: Header=BB6_20 Depth=2
	mov	w8, #1                          ; =0x1
	strb	w8, [x10, x9]
	ldr	x8, [x22, #16]
	str	w28, [x8, x9, lsl #2]
	ldr	x8, [x22, #64]
	add	x9, x8, x9, lsl #4
	stp	xzr, xzr, [x9]
	ldr	x8, [x22, #160]
	add	x8, x8, #1
	str	x8, [x22, #160]
	ldr	x8, [sp, #120]
LBB6_19:                                ;   in Loop: Header=BB6_20 Depth=2
	ldr	q0, [x9]
	ldr	q1, [sp, #16]                   ; 16-byte Folded Reload
	mov.d	v1[1], x27
	add.2d	v0, v0, v1
	str	q0, [x9]
	add	x23, x23, #1
	cmp	x23, x8
	b.hs	LBB6_12
LBB6_20:                                ;   Parent Loop BB6_12 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB6_26 Depth 3
                                        ;       Child Loop BB6_32 Depth 3
	ldr	x9, [sp, #104]
	mov	x10, x23
	cbz	x9, LBB6_22
; %bb.21:                               ;   in Loop: Header=BB6_20 Depth=2
	ldr	x9, [sp, #96]
	ldr	w10, [x9, x23, lsl #2]
LBB6_22:                                ;   in Loop: Header=BB6_20 Depth=2
	cbz	w20, LBB6_24
; %bb.23:                               ;   in Loop: Header=BB6_20 Depth=2
	ldr	x9, [sp, #48]
	ldr	w28, [x9, x10, lsl #2]
	ldr	x9, [x19]
	ldr	x11, [sp, #80]
	ldr	x27, [x11, x10, lsl #3]
	ldr	x22, [x9, #16]
	cbnz	x22, LBB6_25
	b	LBB6_19
LBB6_24:                                ;   in Loop: Header=BB6_20 Depth=2
	mov	x28, #0                         ; =0x0
	ldr	x9, [x19]
	ldr	x11, [sp, #80]
	ldr	x27, [x11, x10, lsl #3]
	ldr	x22, [x9, #16]
	cbz	x22, LBB6_19
LBB6_25:                                ;   in Loop: Header=BB6_20 Depth=2
	eor	x9, x28, x24
	eor	x9, x9, x9, lsr #30
	mul	x9, x9, x25
	eor	x9, x9, x9, lsr #27
	mul	x9, x9, x26
	eor	x21, x9, x9, lsr #31
	ldp	x11, x9, [x22, #16]
	sub	x9, x9, x11
	asr	x0, x9, #2
	sub	x12, x0, #1
	ldr	x10, [x22, #112]
	and	x9, x12, x21
	ldrb	w13, [x10, x9]
	cbz	w13, LBB6_28
LBB6_26:                                ;   Parent Loop BB6_12 Depth=1
                                        ;     Parent Loop BB6_20 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	w13, [x11, x9, lsl #2]
	cmp	x13, x28
	b.eq	LBB6_34
; %bb.27:                               ;   in Loop: Header=BB6_26 Depth=3
	add	x9, x9, #1
	and	x9, x9, x12
	ldrb	w13, [x10, x9]
	cbnz	w13, LBB6_26
LBB6_28:                                ;   in Loop: Header=BB6_20 Depth=2
	ldr	x8, [x22, #160]
	add	x8, x8, #1
	mov	x11, #-3689348814741910324      ; =0xcccccccccccccccc
	movk	x11, #52429
	umulh	x11, x0, x11
	lsr	x11, x11, #3
	lsl	x12, x11, #3
	mov	w13, #10                        ; =0xa
	msub	w13, w11, w13, w0
	lsl	w14, w13, #3
	sub	w13, w14, w13
	and	w13, w13, #0xff
	mov	w14, #205                       ; =0xcd
	mul	w13, w13, w14
	lsr	w13, w13, #11
	sub	x11, x12, x11
	add	x11, x11, x13
	cmp	x8, x11
	b.ls	LBB6_18
; %bb.29:                               ;   in Loop: Header=BB6_20 Depth=2
Ltmp164:
	bl	__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEE7doubledEm
	mov	x1, x0
Ltmp165:
; %bb.30:                               ;   in Loop: Header=BB6_20 Depth=2
Ltmp166:
	mov	x0, x22
	bl	__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEE6rehashEm
Ltmp167:
; %bb.31:                               ;   in Loop: Header=BB6_20 Depth=2
	ldp	x8, x9, [x22, #16]
	sub	x9, x9, x8
	asr	x9, x9, #2
	sub	x11, x9, #1
	ldr	x10, [x22, #112]
	and	x9, x11, x21
	ldrb	w12, [x10, x9]
	cbz	w12, LBB6_18
LBB6_32:                                ;   Parent Loop BB6_12 Depth=1
                                        ;     Parent Loop BB6_20 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	w12, [x8, x9, lsl #2]
	cmp	x12, x28
	b.eq	LBB6_18
; %bb.33:                               ;   in Loop: Header=BB6_32 Depth=3
	add	x9, x9, #1
	and	x9, x9, x11
	ldrb	w12, [x10, x9]
	cbnz	w12, LBB6_32
	b	LBB6_18
LBB6_34:                                ;   in Loop: Header=BB6_20 Depth=2
	ldr	x10, [x22, #64]
	add	x9, x10, x9, lsl #4
	b	LBB6_19
LBB6_35:
Ltmp144:
	sub	x8, x29, #88
	mov	x0, x27
	mov	x1, x20
	mov	x2, x26
	mov	x3, x25
	mov	x4, x24
	bl	__ZN6vquery12row_pipelineERKNS_6TablesENS_9QuerySpecEmmPKNS_9HashTableIjNS_7KeyHashEEE
Ltmp145:
; %bb.36:
	ldur	x0, [x29, #-88]
	ldr	x8, [x0]
	ldr	x8, [x8, #16]
Ltmp147:
	mov	x1, x22
	blr	x8
Ltmp148:
; %bb.37:
	str	xzr, [sp, #32]
	str	wzr, [sp, #40]
	str	xzr, [sp, #48]
	mov	w8, #1                          ; =0x1
	dup.2d	v0, x8
	str	q0, [sp, #16]                   ; 16-byte Folded Spill
	b	LBB6_39
LBB6_38:                                ;   in Loop: Header=BB6_39 Depth=1
	ldr	q0, [x0]
	ldr	q1, [sp, #16]                   ; 16-byte Folded Reload
	mov.d	v1[1], x20
	add.2d	v0, v0, v1
	str	q0, [x0]
LBB6_39:                                ; =>This Inner Loop Header: Depth=1
	ldur	x0, [x29, #-88]
	ldr	x8, [x0]
	ldr	x8, [x8, #24]
Ltmp150:
	add	x1, sp, #32
	blr	x8
Ltmp151:
; %bb.40:                               ;   in Loop: Header=BB6_39 Depth=1
	cbz	w0, LBB6_43
; %bb.41:                               ;   in Loop: Header=BB6_39 Depth=1
	ldr	x20, [sp, #48]
	ldr	x8, [x23, #16]
	mov	x0, x23
	cbz	x8, LBB6_38
; %bb.42:                               ;   in Loop: Header=BB6_39 Depth=1
	ldr	w1, [sp, #36]
Ltmp152:
	mov	x0, x8
	bl	__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEE14find_or_insertEj
Ltmp153:
	b	LBB6_38
LBB6_43:
	ldur	x0, [x29, #-88]
	ldr	x8, [x0]
	ldr	x8, [x8, #32]
	blr	x8
	ldur	x0, [x29, #-88]
	stur	xzr, [x29, #-88]
	cbz	x0, LBB6_45
; %bb.44:
	ldr	x8, [x0]
	ldr	x8, [x8, #8]
	blr	x8
LBB6_45:
	ldp	x29, x30, [sp, #224]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #208]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #192]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #176]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #160]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #144]            ; 16-byte Folded Reload
	add	sp, sp, #240
	ret
LBB6_46:
Ltmp149:
	b	LBB6_54
LBB6_47:
Ltmp160:
	b	LBB6_54
LBB6_48:
Ltmp146:
	mov	x20, x0
	mov	x0, x19
	bl	__ZNSt3__110unique_ptrIN6vquery12_GLOBAL__N_15StateENS_14default_deleteIS3_EEED1B8ne200100Ev
	mov	x0, x20
	bl	__Unwind_Resume
LBB6_49:
Ltmp157:
	mov	x20, x0
	mov	x0, x19
	bl	__ZNSt3__110unique_ptrIN6vquery12_GLOBAL__N_15StateENS_14default_deleteIS3_EEED1B8ne200100Ev
	mov	x0, x20
	bl	__Unwind_Resume
LBB6_50:
Ltmp143:
	mov	x20, x0
	mov	x0, x23
	bl	__ZdlPv
	mov	x0, x20
	bl	__Unwind_Resume
LBB6_51:
Ltmp163:
	b	LBB6_54
LBB6_52:
Ltmp154:
	b	LBB6_54
LBB6_53:
Ltmp168:
LBB6_54:
	mov	x20, x0
	ldur	x0, [x29, #-88]
	stur	xzr, [x29, #-88]
	cbz	x0, LBB6_56
; %bb.55:
	ldr	x8, [x0]
	ldr	x8, [x8, #8]
	blr	x8
LBB6_56:
	mov	x0, x19
	bl	__ZNSt3__110unique_ptrIN6vquery12_GLOBAL__N_15StateENS_14default_deleteIS3_EEED1B8ne200100Ev
	mov	x0, x20
	bl	__Unwind_Resume
Lfunc_end2:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table6:
Lexception2:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end2-Lcst_begin2
Lcst_begin2:
	.uleb128 Lfunc_begin2-Lfunc_begin2      ; >> Call Site 1 <<
	.uleb128 Ltmp141-Lfunc_begin2           ;   Call between Lfunc_begin2 and Ltmp141
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp141-Lfunc_begin2           ; >> Call Site 2 <<
	.uleb128 Ltmp142-Ltmp141                ;   Call between Ltmp141 and Ltmp142
	.uleb128 Ltmp143-Lfunc_begin2           ;     jumps to Ltmp143
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp155-Lfunc_begin2           ; >> Call Site 3 <<
	.uleb128 Ltmp156-Ltmp155                ;   Call between Ltmp155 and Ltmp156
	.uleb128 Ltmp157-Lfunc_begin2           ;     jumps to Ltmp157
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp158-Lfunc_begin2           ; >> Call Site 4 <<
	.uleb128 Ltmp159-Ltmp158                ;   Call between Ltmp158 and Ltmp159
	.uleb128 Ltmp160-Lfunc_begin2           ;     jumps to Ltmp160
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp161-Lfunc_begin2           ; >> Call Site 5 <<
	.uleb128 Ltmp162-Ltmp161                ;   Call between Ltmp161 and Ltmp162
	.uleb128 Ltmp163-Lfunc_begin2           ;     jumps to Ltmp163
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp164-Lfunc_begin2           ; >> Call Site 6 <<
	.uleb128 Ltmp167-Ltmp164                ;   Call between Ltmp164 and Ltmp167
	.uleb128 Ltmp168-Lfunc_begin2           ;     jumps to Ltmp168
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp144-Lfunc_begin2           ; >> Call Site 7 <<
	.uleb128 Ltmp145-Ltmp144                ;   Call between Ltmp144 and Ltmp145
	.uleb128 Ltmp146-Lfunc_begin2           ;     jumps to Ltmp146
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp147-Lfunc_begin2           ; >> Call Site 8 <<
	.uleb128 Ltmp148-Ltmp147                ;   Call between Ltmp147 and Ltmp148
	.uleb128 Ltmp149-Lfunc_begin2           ;     jumps to Ltmp149
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp150-Lfunc_begin2           ; >> Call Site 9 <<
	.uleb128 Ltmp153-Ltmp150                ;   Call between Ltmp150 and Ltmp153
	.uleb128 Ltmp154-Lfunc_begin2           ;     jumps to Ltmp154
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp153-Lfunc_begin2           ; >> Call Site 10 <<
	.uleb128 Lfunc_end2-Ltmp153             ;   Call between Ltmp153 and Lfunc_end2
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end2:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN6vquery16ExecutionContextD1Ev ; -- Begin function _ZN6vquery16ExecutionContextD1Ev
	.weak_def_can_be_hidden	__ZN6vquery16ExecutionContextD1Ev
	.p2align	2
__ZN6vquery16ExecutionContextD1Ev:      ; @_ZN6vquery16ExecutionContextD1Ev
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	ldr	x8, [x0, #48]
	cbz	x8, LBB7_3
; %bb.1:
	add	x9, x8, #4
	mov	w10, #-1                        ; =0xffffffff
	ldaddal	w10, w9, [x9]
	cmp	w9, #1
	b.ne	LBB7_3
; %bb.2:
	mov	x19, x0
	mov	x0, x8
	bl	__ZdlPv
	mov	x0, x19
LBB7_3:
	ldr	x19, [x0, #32]
	cbz	x19, LBB7_5
; %bb.4:
	add	x8, x19, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbz	x8, LBB7_6
LBB7_5:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
LBB7_6:
	ldr	x8, [x19]
	ldr	x8, [x8, #16]
	mov	x20, x0
	mov	x0, x19
	blr	x8
	mov	x0, x19
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
	mov	x0, x20
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNK6vquery12_GLOBAL__N_15State6finishENS_5QueryERKNSt3__110shared_ptrINS_12MemoryBudgetEEE
__ZNK6vquery12_GLOBAL__N_15State6finishENS_5QueryERKNSt3__110shared_ptrINS_12MemoryBudgetEEE: ; @_ZNK6vquery12_GLOBAL__N_15State6finishENS_5QueryERKNSt3__110shared_ptrINS_12MemoryBudgetEEE
Lfunc_begin3:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception3
; %bb.0:
	sub	sp, sp, #96
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	mov	x21, x1
	mov	x19, x0
	mov	x20, x0
	str	w2, [x20], #8
	mov	x8, x20
	mov	x0, x3
	mov	w1, #1                          ; =0x1
	bl	__ZN6vquery11make_bufferINS_9ResultRowEEENSt3__16vectorIT_NS_15BudgetAllocatorIS4_EEEERKNS2_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
	ldr	x8, [x21, #16]
	cbz	x8, LBB8_12
; %bb.1:
	ldr	x22, [x8, #160]
	ldr	x8, [x19, #24]
	ldr	x23, [x19, #8]
	sub	x8, x8, x23
	asr	x8, x8, #3
	mov	x9, #-6148914691236517206       ; =0xaaaaaaaaaaaaaaaa
	movk	x9, #43691
	mul	x8, x8, x9
	cmp	x8, x22
	b.hs	LBB8_6
; %bb.2:
	mov	x8, #-6148914691236517206       ; =0xaaaaaaaaaaaaaaaa
	movk	x8, #43691
	movk	x8, #2730, lsl #48
	cmp	x22, x8
	b.hs	LBB8_14
; %bb.3:
	ldr	x24, [x19, #16]
Ltmp169:
	add	x0, x19, #32
	mov	x1, x22
	bl	__ZN6vquery15BudgetAllocatorINS_9ResultRowEE8allocateEm
Ltmp170:
; %bb.4:
	sub	x8, x24, x23
	add	x23, x0, x8
	mov	w8, #24                         ; =0x18
	madd	x24, x22, x8, x0
	ldp	x1, x8, [x19, #8]
	sub	x2, x8, x1
	sub	x22, x23, x2
	mov	x0, x22
	bl	_memcpy
	ldr	x0, [x19, #8]
	stp	x22, x23, [x19, #8]
	ldr	x8, [x19, #24]
	str	x24, [x19, #24]
	cbz	x0, LBB8_6
; %bb.5:
	sub	x22, x8, x0
	bl	__ZdlPv
	ldr	x0, [x19, #32]
	ldr	x2, [x19, #48]
	mov	x1, x22
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
LBB8_6:
	ldr	x21, [x21, #16]
	ldp	x9, x8, [x21, #16]
	cmp	x8, x9
	b.eq	LBB8_13
; %bb.7:
	mov	x22, #0                         ; =0x0
	b	LBB8_9
LBB8_8:                                 ;   in Loop: Header=BB8_9 Depth=1
	add	x22, x22, #1
	sub	x10, x8, x9
	cmp	x22, x10, asr #2
	b.hs	LBB8_13
LBB8_9:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x10, [x21, #112]
	ldrb	w10, [x10, x22]
	cbz	w10, LBB8_8
; %bb.10:                               ;   in Loop: Header=BB8_9 Depth=1
	ldr	w8, [x9, x22, lsl #2]
	ldr	x9, [x21, #64]
	ldr	q0, [x9, x22, lsl #4]
	str	w8, [sp, #8]
	stur	q0, [sp, #16]
Ltmp171:
	add	x1, sp, #8
	mov	x0, x20
	bl	__ZNSt3__16vectorIN6vquery9ResultRowENS1_15BudgetAllocatorIS2_EEE9push_backB8ne200100EOS2_
Ltmp172:
; %bb.11:                               ;   in Loop: Header=BB8_9 Depth=1
	ldp	x9, x8, [x21, #16]
	b	LBB8_8
LBB8_12:
	str	wzr, [sp, #8]
	ldr	q0, [x21]
	stur	q0, [sp, #16]
Ltmp177:
	add	x1, sp, #8
	mov	x0, x20
	bl	__ZNSt3__16vectorIN6vquery9ResultRowENS1_15BudgetAllocatorIS2_EEE9push_backB8ne200100EOS2_
Ltmp178:
LBB8_13:
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
LBB8_14:
Ltmp174:
	bl	__ZNSt3__16vectorIN6vquery9ResultRowENS1_15BudgetAllocatorIS2_EEE20__throw_length_errorB8ne200100Ev
Ltmp175:
; %bb.15:
	brk	#0x1
LBB8_16:
Ltmp179:
	mov	x20, x0
	mov	x0, x19
	bl	__ZN6vquery11QueryResultD1Ev
	mov	x0, x20
	bl	__Unwind_Resume
LBB8_17:
Ltmp176:
	mov	x20, x0
	mov	x0, x19
	bl	__ZN6vquery11QueryResultD1Ev
	mov	x0, x20
	bl	__Unwind_Resume
LBB8_18:
Ltmp173:
	mov	x20, x0
	mov	x0, x19
	bl	__ZN6vquery11QueryResultD1Ev
	mov	x0, x20
	bl	__Unwind_Resume
Lfunc_end3:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table8:
Lexception3:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end3-Lcst_begin3
Lcst_begin3:
	.uleb128 Lfunc_begin3-Lfunc_begin3      ; >> Call Site 1 <<
	.uleb128 Ltmp169-Lfunc_begin3           ;   Call between Lfunc_begin3 and Ltmp169
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp169-Lfunc_begin3           ; >> Call Site 2 <<
	.uleb128 Ltmp170-Ltmp169                ;   Call between Ltmp169 and Ltmp170
	.uleb128 Ltmp176-Lfunc_begin3           ;     jumps to Ltmp176
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp170-Lfunc_begin3           ; >> Call Site 3 <<
	.uleb128 Ltmp171-Ltmp170                ;   Call between Ltmp170 and Ltmp171
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp171-Lfunc_begin3           ; >> Call Site 4 <<
	.uleb128 Ltmp172-Ltmp171                ;   Call between Ltmp171 and Ltmp172
	.uleb128 Ltmp173-Lfunc_begin3           ;     jumps to Ltmp173
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp177-Lfunc_begin3           ; >> Call Site 5 <<
	.uleb128 Ltmp178-Ltmp177                ;   Call between Ltmp177 and Ltmp178
	.uleb128 Ltmp179-Lfunc_begin3           ;     jumps to Ltmp179
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp174-Lfunc_begin3           ; >> Call Site 6 <<
	.uleb128 Ltmp175-Ltmp174                ;   Call between Ltmp174 and Ltmp175
	.uleb128 Ltmp176-Lfunc_begin3           ;     jumps to Ltmp176
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp175-Lfunc_begin3           ; >> Call Site 7 <<
	.uleb128 Lfunc_end3-Ltmp175             ;   Call between Ltmp175 and Lfunc_end3
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end3:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	2                               ; -- Begin function _ZNSt3__110unique_ptrIN6vquery12_GLOBAL__N_15StateENS_14default_deleteIS3_EEED1B8ne200100Ev
__ZNSt3__110unique_ptrIN6vquery12_GLOBAL__N_15StateENS_14default_deleteIS3_EEED1B8ne200100Ev: ; @_ZNSt3__110unique_ptrIN6vquery12_GLOBAL__N_15StateENS_14default_deleteIS3_EEED1B8ne200100Ev
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	ldr	x19, [x0]
	str	xzr, [x0]
	cbz	x19, LBB9_4
; %bb.1:
	mov	x20, x0
	ldr	x0, [x19, #16]
	str	xzr, [x19, #16]
	cbz	x0, LBB9_3
; %bb.2:
	bl	__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEED2Ev
	bl	__ZdlPv
LBB9_3:
	mov	x0, x19
	bl	__ZdlPv
	mov	x0, x20
LBB9_4:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorINS_7jthreadENS_9allocatorIS1_EEE7reserveEm ; -- Begin function _ZNSt3__16vectorINS_7jthreadENS_9allocatorIS1_EEE7reserveEm
	.globl	__ZNSt3__16vectorINS_7jthreadENS_9allocatorIS1_EEE7reserveEm
	.weak_def_can_be_hidden	__ZNSt3__16vectorINS_7jthreadENS_9allocatorIS1_EEE7reserveEm
	.p2align	2
__ZNSt3__16vectorINS_7jthreadENS_9allocatorIS1_EEE7reserveEm: ; @_ZNSt3__16vectorINS_7jthreadENS_9allocatorIS1_EEE7reserveEm
Lfunc_begin4:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception4
; %bb.0:
	sub	sp, sp, #112
	stp	x24, x23, [sp, #48]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #64]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #80]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	ldr	x8, [x0, #16]
	ldr	x20, [x0]
	sub	x8, x8, x20
	cmp	x1, x8, asr #4
	b.ls	LBB10_5
; %bb.1:
	lsr	x8, x1, #60
	cbnz	x8, LBB10_6
; %bb.2:
	mov	x19, x0
	ldr	x22, [x0, #8]
	sub	x24, x22, x20
	str	x0, [sp, #40]
	lsl	x23, x1, #4
	mov	x0, x23
	bl	__Znwm
	mov	x21, x0
	add	x24, x0, x24
	stp	x0, x24, [sp, #8]
	add	x23, x0, x23
	stp	x24, x23, [sp, #24]
Ltmp180:
	mov	x0, x19
	mov	x1, x20
	mov	x2, x22
	mov	x3, x21
	bl	__ZNSt3__134__uninitialized_allocator_relocateB8ne200100INS_9allocatorINS_7jthreadEEEPS2_EEvRT_T0_S7_S7_
Ltmp181:
; %bb.3:
	ldr	x0, [x19]
	stp	x21, x24, [x19]
	str	x23, [x19, #16]
	cbz	x0, LBB10_5
; %bb.4:
	bl	__ZdlPv
LBB10_5:
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
LBB10_6:
	bl	__ZNSt3__16vectorINS_7jthreadENS_9allocatorIS1_EEE20__throw_length_errorB8ne200100Ev
LBB10_7:
Ltmp182:
	mov	x19, x0
	add	x0, sp, #8
	bl	__ZNSt3__114__split_bufferINS_7jthreadERNS_9allocatorIS1_EEED1Ev
	mov	x0, x19
	bl	__Unwind_Resume
Lfunc_end4:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table10:
Lexception4:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end4-Lcst_begin4
Lcst_begin4:
	.uleb128 Lfunc_begin4-Lfunc_begin4      ; >> Call Site 1 <<
	.uleb128 Ltmp180-Lfunc_begin4           ;   Call between Lfunc_begin4 and Ltmp180
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp180-Lfunc_begin4           ; >> Call Site 2 <<
	.uleb128 Ltmp181-Ltmp180                ;   Call between Ltmp180 and Ltmp181
	.uleb128 Ltmp182-Lfunc_begin4           ;     jumps to Ltmp182
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp181-Lfunc_begin4           ; >> Call Site 3 <<
	.uleb128 Lfunc_end4-Ltmp181             ;   Call between Ltmp181 and Lfunc_end4
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end4:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_15StateC1ENS_5QueryERKNSt3__110shared_ptrINS_12MemoryBudgetEEE
__ZN6vquery12_GLOBAL__N_15StateC1ENS_5QueryERKNSt3__110shared_ptrINS_12MemoryBudgetEEE: ; @_ZN6vquery12_GLOBAL__N_15StateC1ENS_5QueryERKNSt3__110shared_ptrINS_12MemoryBudgetEEE
Lfunc_begin5:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception5
; %bb.0:
	sub	sp, sp, #64
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x20, x0
	mov	x19, x0
	str	xzr, [x19, #16]!
	stp	xzr, xzr, [x0]
	cbz	w1, LBB11_10
; %bb.1:
Ltmp183:
	mov	x22, x2
	mov	w0, #176                        ; =0xb0
	bl	__Znwm
Ltmp184:
; %bb.2:
	mov	x21, x0
	ldp	x9, x8, [x22]
	stp	x9, x8, [sp]
	cbz	x8, LBB11_4
; %bb.3:
	add	x8, x8, #8
	mov	w9, #1                          ; =0x1
	ldadd	x9, x8, [x8]
LBB11_4:
Ltmp186:
	mov	x1, sp
	mov	x0, x21
	mov	w2, #1024                       ; =0x400
	bl	__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEEm
Ltmp187:
; %bb.5:
	ldr	x22, [sp, #8]
	cbz	x22, LBB11_8
; %bb.6:
	add	x8, x22, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbnz	x8, LBB11_8
; %bb.7:
	ldr	x8, [x22]
	ldr	x8, [x8, #16]
	mov	x0, x22
	blr	x8
	mov	x0, x22
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
LBB11_8:
	ldr	x0, [x19]
	str	x21, [x19]
	cbz	x0, LBB11_10
; %bb.9:
	bl	__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEED2Ev
	bl	__ZdlPv
LBB11_10:
	mov	x0, x20
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB11_11:
Ltmp188:
	mov	x20, x0
	mov	x0, sp
	bl	__ZNSt3__110shared_ptrIN6vquery12MemoryBudgetEED1B8ne200100Ev
	mov	x0, x21
	bl	__ZdlPv
	mov	x0, x19
	bl	__ZNSt3__110unique_ptrIN6vquery9HashTableINS1_9AggregateENS1_7KeyHashEEENS_14default_deleteIS5_EEED1B8ne200100Ev
	mov	x0, x20
	bl	__Unwind_Resume
LBB11_12:
Ltmp185:
	mov	x20, x0
	mov	x0, x19
	bl	__ZNSt3__110unique_ptrIN6vquery9HashTableINS1_9AggregateENS1_7KeyHashEEENS_14default_deleteIS5_EEED1B8ne200100Ev
	mov	x0, x20
	bl	__Unwind_Resume
Lfunc_end5:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table11:
Lexception5:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end5-Lcst_begin5
Lcst_begin5:
	.uleb128 Ltmp183-Lfunc_begin5           ; >> Call Site 1 <<
	.uleb128 Ltmp184-Ltmp183                ;   Call between Ltmp183 and Ltmp184
	.uleb128 Ltmp185-Lfunc_begin5           ;     jumps to Ltmp185
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp186-Lfunc_begin5           ; >> Call Site 2 <<
	.uleb128 Ltmp187-Ltmp186                ;   Call between Ltmp186 and Ltmp187
	.uleb128 Ltmp188-Lfunc_begin5           ;     jumps to Ltmp188
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp187-Lfunc_begin5           ; >> Call Site 3 <<
	.uleb128 Lfunc_end5-Ltmp187             ;   Call between Ltmp187 and Lfunc_end5
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end5:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_15StateD1Ev
__ZN6vquery12_GLOBAL__N_15StateD1Ev:    ; @_ZN6vquery12_GLOBAL__N_15StateD1Ev
	.cfi_startproc
; %bb.0:
	mov	x8, x0
	ldr	x0, [x0, #16]
	str	xzr, [x8, #16]
	cbz	x0, LBB12_2
; %bb.1:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x8
	bl	__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEED2Ev
	bl	__ZdlPv
	mov	x8, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
LBB12_2:
	mov	x0, x8
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorINS_7jthreadENS_9allocatorIS1_EEED1B8ne200100Ev ; -- Begin function _ZNSt3__16vectorINS_7jthreadENS_9allocatorIS1_EEED1B8ne200100Ev
	.globl	__ZNSt3__16vectorINS_7jthreadENS_9allocatorIS1_EEED1B8ne200100Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorINS_7jthreadENS_9allocatorIS1_EEED1B8ne200100Ev
	.p2align	2
__ZNSt3__16vectorINS_7jthreadENS_9allocatorIS1_EEED1B8ne200100Ev: ; @_ZNSt3__16vectorINS_7jthreadENS_9allocatorIS1_EEED1B8ne200100Ev
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	ldr	x1, [x0]
	cbz	x1, LBB13_2
; %bb.1:
	mov	x0, x19
	bl	__ZNSt3__16vectorINS_7jthreadENS_9allocatorIS1_EEE22__base_destruct_at_endB8ne200100EPS1_
	ldr	x0, [x19]
	bl	__ZdlPv
LBB13_2:
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__111stop_sourceD1B8ne200100Ev ; -- Begin function _ZNSt3__111stop_sourceD1B8ne200100Ev
	.globl	__ZNSt3__111stop_sourceD1B8ne200100Ev
	.weak_def_can_be_hidden	__ZNSt3__111stop_sourceD1B8ne200100Ev
	.p2align	2
__ZNSt3__111stop_sourceD1B8ne200100Ev:  ; @_ZNSt3__111stop_sourceD1B8ne200100Ev
	.cfi_startproc
; %bb.0:
	ldr	x8, [x0]
	cbz	x8, LBB14_4
; %bb.1:
	mov	w9, #-4                         ; =0xfffffffc
	ldadd	w9, w8, [x8]
	ldr	x8, [x0]
	cbz	x8, LBB14_4
; %bb.2:
	add	x9, x8, #4
	mov	w10, #-1                        ; =0xffffffff
	ldaddal	w10, w9, [x9]
	cmp	w9, #1
	b.ne	LBB14_4
; %bb.3:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	x0, x8
	bl	__ZdlPv
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
LBB14_4:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__15arrayISt13exception_ptrLm4EED1Ev ; -- Begin function _ZNSt3__15arrayISt13exception_ptrLm4EED1Ev
	.weak_def_can_be_hidden	__ZNSt3__15arrayISt13exception_ptrLm4EED1Ev
	.p2align	2
__ZNSt3__15arrayISt13exception_ptrLm4EED1Ev: ; @_ZNSt3__15arrayISt13exception_ptrLm4EED1Ev
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	add	x0, x0, #24
	bl	__ZNSt13exception_ptrD1Ev
	add	x0, x19, #16
	bl	__ZNSt13exception_ptrD1Ev
	add	x0, x19, #8
	bl	__ZNSt13exception_ptrD1Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	b	__ZNSt13exception_ptrD1Ev
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNSt3__15arrayINS_10unique_ptrIN6vquery12_GLOBAL__N_15StateENS_14default_deleteIS4_EEEELm4EED1Ev
__ZNSt3__15arrayINS_10unique_ptrIN6vquery12_GLOBAL__N_15StateENS_14default_deleteIS4_EEEELm4EED1Ev: ; @_ZNSt3__15arrayINS_10unique_ptrIN6vquery12_GLOBAL__N_15StateENS_14default_deleteIS4_EEEELm4EED1Ev
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	ldr	x20, [x0, #24]
	str	xzr, [x0, #24]
	cbz	x20, LBB16_4
; %bb.1:
	ldr	x0, [x20, #16]
	str	xzr, [x20, #16]
	cbz	x0, LBB16_3
; %bb.2:
	bl	__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEED2Ev
	bl	__ZdlPv
LBB16_3:
	mov	x0, x20
	bl	__ZdlPv
LBB16_4:
	ldr	x20, [x19, #16]
	str	xzr, [x19, #16]
	cbz	x20, LBB16_8
; %bb.5:
	ldr	x0, [x20, #16]
	str	xzr, [x20, #16]
	cbz	x0, LBB16_7
; %bb.6:
	bl	__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEED2Ev
	bl	__ZdlPv
LBB16_7:
	mov	x0, x20
	bl	__ZdlPv
LBB16_8:
	ldr	x20, [x19, #8]
	str	xzr, [x19, #8]
	cbz	x20, LBB16_12
; %bb.9:
	ldr	x0, [x20, #16]
	str	xzr, [x20, #16]
	cbz	x0, LBB16_11
; %bb.10:
	bl	__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEED2Ev
	bl	__ZdlPv
LBB16_11:
	mov	x0, x20
	bl	__ZdlPv
LBB16_12:
	ldr	x20, [x19]
	str	xzr, [x19]
	cbz	x20, LBB16_16
; %bb.13:
	ldr	x0, [x20, #16]
	str	xzr, [x20, #16]
	cbz	x0, LBB16_15
; %bb.14:
	bl	__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEED2Ev
	bl	__ZdlPv
LBB16_15:
	mov	x0, x20
	bl	__ZdlPv
LBB16_16:
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__110shared_ptrIN6vquery12MemoryBudgetEED1B8ne200100Ev ; -- Begin function _ZNSt3__110shared_ptrIN6vquery12MemoryBudgetEED1B8ne200100Ev
	.globl	__ZNSt3__110shared_ptrIN6vquery12MemoryBudgetEED1B8ne200100Ev
	.weak_def_can_be_hidden	__ZNSt3__110shared_ptrIN6vquery12MemoryBudgetEED1B8ne200100Ev
	.p2align	2
__ZNSt3__110shared_ptrIN6vquery12MemoryBudgetEED1B8ne200100Ev: ; @_ZNSt3__110shared_ptrIN6vquery12MemoryBudgetEED1B8ne200100Ev
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	ldr	x19, [x0, #8]
	cbz	x19, LBB17_2
; %bb.1:
	add	x8, x19, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbz	x8, LBB17_3
LBB17_2:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
LBB17_3:
	ldr	x8, [x19]
	ldr	x8, [x8, #16]
	mov	x20, x0
	mov	x0, x19
	blr	x8
	mov	x0, x19
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
	mov	x0, x20
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN6vquery9HashTableIjNS_7KeyHashEEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEEm ; -- Begin function _ZN6vquery9HashTableIjNS_7KeyHashEEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEEm
	.weak_def_can_be_hidden	__ZN6vquery9HashTableIjNS_7KeyHashEEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEEm
	.p2align	2
__ZN6vquery9HashTableIjNS_7KeyHashEEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEEm: ; @_ZN6vquery9HashTableIjNS_7KeyHashEEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEEm
Lfunc_begin6:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception6
; %bb.0:
	sub	sp, sp, #96
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	mov	x21, x2
	mov	x19, x0
	ldr	q0, [x1]
	mov	x20, x0
	str	q0, [x20], #16
	stp	xzr, xzr, [x1]
Ltmp189:
	mov	x8, x20
	mov	w1, #1                          ; =0x1
	bl	__ZN6vquery11make_bufferIjEENSt3__16vectorIT_NS_15BudgetAllocatorIS3_EEEERKNS1_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
Ltmp190:
; %bb.1:
Ltmp192:
	add	x8, x19, #64
	mov	x0, x19
	mov	w1, #1                          ; =0x1
	bl	__ZN6vquery11make_bufferIjEENSt3__16vectorIT_NS_15BudgetAllocatorIS3_EEEERKNS1_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
Ltmp193:
; %bb.2:
Ltmp195:
	add	x8, x19, #112
	mov	x0, x19
	mov	w1, #1                          ; =0x1
	bl	__ZN6vquery11make_bufferIhEENSt3__16vectorIT_NS_15BudgetAllocatorIS3_EEEERKNS1_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
Ltmp196:
; %bb.3:
	str	xzr, [x19, #160]
	sub	x8, x21, #1
	eor	x9, x21, x8
	cmp	x9, x8
	b.ls	LBB18_6
; %bb.4:
Ltmp206:
	mov	x0, x19
	mov	x1, x21
	bl	__ZN6vquery9HashTableIjNS_7KeyHashEE6rehashEm
Ltmp207:
; %bb.5:
	mov	x0, x19
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
LBB18_6:
	mov	w0, #24                         ; =0x18
	bl	___cxa_allocate_exception
	mov	x21, x0
Ltmp198:
Lloh48:
	adrp	x1, l_.str.3@PAGE
Lloh49:
	add	x1, x1, l_.str.3@PAGEOFF
	add	x0, sp, #8
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
Ltmp199:
; %bb.7:
	mov	w23, #1                         ; =0x1
Ltmp201:
	add	x1, sp, #8
	mov	x0, x21
	bl	__ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE
Ltmp202:
; %bb.8:
Lloh50:
	adrp	x8, __ZTVN6vquery5ErrorE@GOTPAGE
Lloh51:
	ldr	x8, [x8, __ZTVN6vquery5ErrorE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x21]
	str	wzr, [x21, #16]
Ltmp203:
	mov	w23, #0                         ; =0x0
Lloh52:
	adrp	x1, __ZTIN6vquery5ErrorE@PAGE
Lloh53:
	add	x1, x1, __ZTIN6vquery5ErrorE@PAGEOFF
Lloh54:
	adrp	x2, __ZN6vquery5ErrorD1Ev@GOTPAGE
Lloh55:
	ldr	x2, [x2, __ZN6vquery5ErrorD1Ev@GOTPAGEOFF]
	mov	x0, x21
	bl	___cxa_throw
Ltmp204:
; %bb.9:
	brk	#0x1
LBB18_10:
Ltmp205:
	mov	x22, x0
	ldrsb	w8, [sp, #31]
	tbz	w8, #31, LBB18_12
; %bb.11:
	ldr	x0, [sp, #8]
	bl	__ZdlPv
	tbnz	w23, #0, LBB18_14
	b	LBB18_16
LBB18_12:
	cbnz	w23, LBB18_14
	b	LBB18_16
LBB18_13:
Ltmp200:
	mov	x22, x0
LBB18_14:
	mov	x0, x21
	bl	___cxa_free_exception
	b	LBB18_16
LBB18_15:
Ltmp208:
	mov	x22, x0
LBB18_16:
	add	x0, x19, #112
	bl	__ZNSt3__16vectorIhN6vquery15BudgetAllocatorIhEEED1B8ne200100Ev
	b	LBB18_18
LBB18_17:
Ltmp197:
	mov	x22, x0
LBB18_18:
	add	x0, x19, #64
	bl	__ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEED1B8ne200100Ev
	b	LBB18_20
LBB18_19:
Ltmp194:
	mov	x22, x0
LBB18_20:
	mov	x0, x20
	bl	__ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEED1B8ne200100Ev
	mov	x0, x19
	bl	__ZNSt3__110shared_ptrIN6vquery12MemoryBudgetEED1B8ne200100Ev
	mov	x0, x22
	bl	__Unwind_Resume
LBB18_21:
Ltmp191:
	mov	x22, x0
	mov	x0, x19
	bl	__ZNSt3__110shared_ptrIN6vquery12MemoryBudgetEED1B8ne200100Ev
	mov	x0, x22
	bl	__Unwind_Resume
	.loh AdrpAdd	Lloh48, Lloh49
	.loh AdrpLdrGot	Lloh54, Lloh55
	.loh AdrpAdd	Lloh52, Lloh53
	.loh AdrpLdrGot	Lloh50, Lloh51
Lfunc_end6:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table18:
Lexception6:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end6-Lcst_begin6
Lcst_begin6:
	.uleb128 Ltmp189-Lfunc_begin6           ; >> Call Site 1 <<
	.uleb128 Ltmp190-Ltmp189                ;   Call between Ltmp189 and Ltmp190
	.uleb128 Ltmp191-Lfunc_begin6           ;     jumps to Ltmp191
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp192-Lfunc_begin6           ; >> Call Site 2 <<
	.uleb128 Ltmp193-Ltmp192                ;   Call between Ltmp192 and Ltmp193
	.uleb128 Ltmp194-Lfunc_begin6           ;     jumps to Ltmp194
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp195-Lfunc_begin6           ; >> Call Site 3 <<
	.uleb128 Ltmp196-Ltmp195                ;   Call between Ltmp195 and Ltmp196
	.uleb128 Ltmp197-Lfunc_begin6           ;     jumps to Ltmp197
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp206-Lfunc_begin6           ; >> Call Site 4 <<
	.uleb128 Ltmp207-Ltmp206                ;   Call between Ltmp206 and Ltmp207
	.uleb128 Ltmp208-Lfunc_begin6           ;     jumps to Ltmp208
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp207-Lfunc_begin6           ; >> Call Site 5 <<
	.uleb128 Ltmp198-Ltmp207                ;   Call between Ltmp207 and Ltmp198
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp198-Lfunc_begin6           ; >> Call Site 6 <<
	.uleb128 Ltmp199-Ltmp198                ;   Call between Ltmp198 and Ltmp199
	.uleb128 Ltmp200-Lfunc_begin6           ;     jumps to Ltmp200
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp201-Lfunc_begin6           ; >> Call Site 7 <<
	.uleb128 Ltmp204-Ltmp201                ;   Call between Ltmp201 and Ltmp204
	.uleb128 Ltmp205-Lfunc_begin6           ;     jumps to Ltmp205
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp204-Lfunc_begin6           ; >> Call Site 8 <<
	.uleb128 Lfunc_end6-Ltmp204             ;   Call between Ltmp204 and Lfunc_end6
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end6:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN6vquery11make_bufferIjEENSt3__16vectorIT_NS_15BudgetAllocatorIS3_EEEERKNS1_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE ; -- Begin function _ZN6vquery11make_bufferIjEENSt3__16vectorIT_NS_15BudgetAllocatorIS3_EEEERKNS1_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
	.weak_def_can_be_hidden	__ZN6vquery11make_bufferIjEENSt3__16vectorIT_NS_15BudgetAllocatorIS3_EEEERKNS1_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
	.p2align	2
__ZN6vquery11make_bufferIjEENSt3__16vectorIT_NS_15BudgetAllocatorIS3_EEEERKNS1_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE: ; @_ZN6vquery11make_bufferIjEENSt3__16vectorIT_NS_15BudgetAllocatorIS3_EEEERKNS1_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
Lfunc_begin7:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception7
; %bb.0:
	sub	sp, sp, #80
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x2, x1
	mov	x19, x8
	ldp	x9, x8, [x0]
	stp	x9, x8, [sp, #8]
	cbz	x8, LBB19_2
; %bb.1:
	add	x8, x8, #8
	mov	w9, #1                          ; =0x1
	ldadd	x9, x8, [x8]
LBB19_2:
Ltmp209:
	add	x0, sp, #24
	add	x1, sp, #8
	bl	__ZN6vquery15BudgetAllocatorIjEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
Ltmp210:
; %bb.3:
	stp	xzr, xzr, [x19]
	ldp	x9, x8, [sp, #24]
	stp	xzr, x9, [x19, #16]
	str	x8, [x19, #32]
	cbz	x8, LBB19_7
; %bb.4:
	add	x8, x8, #8
	mov	w9, #1                          ; =0x1
	ldadd	x9, x8, [x8]
	ldp	x20, x8, [sp, #32]
	str	x8, [x19, #40]
	cbz	x20, LBB19_8
; %bb.5:
	add	x8, x20, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbnz	x8, LBB19_8
; %bb.6:
	ldr	x8, [x20]
	ldr	x8, [x8, #16]
	mov	x0, x20
	blr	x8
	mov	x0, x20
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
	b	LBB19_8
LBB19_7:
	ldr	x8, [sp, #40]
	str	x8, [x19, #40]
LBB19_8:
	ldr	x19, [sp, #16]
	cbz	x19, LBB19_10
; %bb.9:
	add	x8, x19, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbz	x8, LBB19_11
LBB19_10:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB19_11:
	ldr	x8, [x19]
	ldr	x8, [x8, #16]
	mov	x0, x19
	blr	x8
	mov	x0, x19
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB19_12:
Ltmp211:
	mov	x19, x0
	add	x0, sp, #8
	bl	__ZNSt3__110shared_ptrIN6vquery12MemoryBudgetEED1B8ne200100Ev
	mov	x0, x19
	bl	__Unwind_Resume
Lfunc_end7:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table19:
Lexception7:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end7-Lcst_begin7
Lcst_begin7:
	.uleb128 Ltmp209-Lfunc_begin7           ; >> Call Site 1 <<
	.uleb128 Ltmp210-Ltmp209                ;   Call between Ltmp209 and Ltmp210
	.uleb128 Ltmp211-Lfunc_begin7           ;     jumps to Ltmp211
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp210-Lfunc_begin7           ; >> Call Site 2 <<
	.uleb128 Lfunc_end7-Ltmp210             ;   Call between Ltmp210 and Lfunc_end7
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end7:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN6vquery11make_bufferIhEENSt3__16vectorIT_NS_15BudgetAllocatorIS3_EEEERKNS1_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE ; -- Begin function _ZN6vquery11make_bufferIhEENSt3__16vectorIT_NS_15BudgetAllocatorIS3_EEEERKNS1_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
	.weak_def_can_be_hidden	__ZN6vquery11make_bufferIhEENSt3__16vectorIT_NS_15BudgetAllocatorIS3_EEEERKNS1_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
	.p2align	2
__ZN6vquery11make_bufferIhEENSt3__16vectorIT_NS_15BudgetAllocatorIS3_EEEERKNS1_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE: ; @_ZN6vquery11make_bufferIhEENSt3__16vectorIT_NS_15BudgetAllocatorIS3_EEEERKNS1_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
Lfunc_begin8:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception8
; %bb.0:
	sub	sp, sp, #80
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x2, x1
	mov	x19, x8
	ldp	x9, x8, [x0]
	stp	x9, x8, [sp, #8]
	cbz	x8, LBB20_2
; %bb.1:
	add	x8, x8, #8
	mov	w9, #1                          ; =0x1
	ldadd	x9, x8, [x8]
LBB20_2:
Ltmp212:
	add	x0, sp, #24
	add	x1, sp, #8
	bl	__ZN6vquery15BudgetAllocatorIhEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
Ltmp213:
; %bb.3:
	stp	xzr, xzr, [x19]
	ldp	x9, x8, [sp, #24]
	stp	xzr, x9, [x19, #16]
	str	x8, [x19, #32]
	cbz	x8, LBB20_7
; %bb.4:
	add	x8, x8, #8
	mov	w9, #1                          ; =0x1
	ldadd	x9, x8, [x8]
	ldp	x20, x8, [sp, #32]
	str	x8, [x19, #40]
	cbz	x20, LBB20_8
; %bb.5:
	add	x8, x20, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbnz	x8, LBB20_8
; %bb.6:
	ldr	x8, [x20]
	ldr	x8, [x8, #16]
	mov	x0, x20
	blr	x8
	mov	x0, x20
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
	b	LBB20_8
LBB20_7:
	ldr	x8, [sp, #40]
	str	x8, [x19, #40]
LBB20_8:
	ldr	x19, [sp, #16]
	cbz	x19, LBB20_10
; %bb.9:
	add	x8, x19, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbz	x8, LBB20_11
LBB20_10:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB20_11:
	ldr	x8, [x19]
	ldr	x8, [x8, #16]
	mov	x0, x19
	blr	x8
	mov	x0, x19
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB20_12:
Ltmp214:
	mov	x19, x0
	add	x0, sp, #8
	bl	__ZNSt3__110shared_ptrIN6vquery12MemoryBudgetEED1B8ne200100Ev
	mov	x0, x19
	bl	__Unwind_Resume
Lfunc_end8:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table20:
Lexception8:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end8-Lcst_begin8
Lcst_begin8:
	.uleb128 Ltmp212-Lfunc_begin8           ; >> Call Site 1 <<
	.uleb128 Ltmp213-Ltmp212                ;   Call between Ltmp212 and Ltmp213
	.uleb128 Ltmp214-Lfunc_begin8           ;     jumps to Ltmp214
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp213-Lfunc_begin8           ; >> Call Site 2 <<
	.uleb128 Lfunc_end8-Ltmp213             ;   Call between Ltmp213 and Lfunc_end8
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end8:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN6vquery9HashTableIjNS_7KeyHashEE6rehashEm ; -- Begin function _ZN6vquery9HashTableIjNS_7KeyHashEE6rehashEm
	.weak_def_can_be_hidden	__ZN6vquery9HashTableIjNS_7KeyHashEE6rehashEm
	.p2align	2
__ZN6vquery9HashTableIjNS_7KeyHashEE6rehashEm: ; @_ZN6vquery9HashTableIjNS_7KeyHashEE6rehashEm
Lfunc_begin9:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception9
; %bb.0:
	sub	sp, sp, #176
	stp	x20, x19, [sp, #144]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #160]            ; 16-byte Folded Spill
	add	x29, sp, #160
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x20, x1
	mov	x19, x0
	sub	x8, x29, #64
	mov	w1, #1                          ; =0x1
	bl	__ZN6vquery11make_bufferIjEENSt3__16vectorIT_NS_15BudgetAllocatorIS3_EEEERKNS1_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
Ltmp215:
	add	x8, sp, #48
	mov	x0, x19
	mov	w1, #1                          ; =0x1
	bl	__ZN6vquery11make_bufferIjEENSt3__16vectorIT_NS_15BudgetAllocatorIS3_EEEERKNS1_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
Ltmp216:
; %bb.1:
Ltmp218:
	mov	x8, sp
	mov	x0, x19
	mov	w1, #1                          ; =0x1
	bl	__ZN6vquery11make_bufferIhEENSt3__16vectorIT_NS_15BudgetAllocatorIS3_EEEERKNS1_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
Ltmp219:
; %bb.2:
	ldp	x8, x9, [x29, #-64]
	sub	x9, x9, x8
	asr	x9, x9, #2
	subs	x1, x20, x9
	b.ls	LBB21_4
; %bb.3:
Ltmp221:
	sub	x0, x29, #64
	bl	__ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEE8__appendEm
Ltmp222:
	b	LBB21_6
LBB21_4:
	b.hs	LBB21_6
; %bb.5:
	add	x8, x8, x20, lsl #2
	stur	x8, [x29, #-56]
LBB21_6:
	ldp	x8, x9, [sp, #48]
	sub	x9, x9, x8
	asr	x9, x9, #2
	subs	x1, x20, x9
	b.ls	LBB21_8
; %bb.7:
Ltmp223:
	add	x0, sp, #48
	bl	__ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEE8__appendEm
Ltmp224:
	b	LBB21_10
LBB21_8:
	b.hs	LBB21_10
; %bb.9:
	add	x8, x8, x20, lsl #2
	str	x8, [sp, #56]
LBB21_10:
	ldp	x8, x9, [sp]
	sub	x9, x9, x8
	subs	x1, x20, x9
	b.ls	LBB21_12
; %bb.11:
Ltmp225:
	mov	x0, sp
	bl	__ZNSt3__16vectorIhN6vquery15BudgetAllocatorIhEEE8__appendEm
Ltmp226:
	b	LBB21_14
LBB21_12:
	b.hs	LBB21_14
; %bb.13:
	add	x8, x8, x20
	str	x8, [sp, #8]
LBB21_14:
	ldp	x15, x14, [x19, #16]
	cmp	x14, x15
	b.eq	LBB21_21
; %bb.15:
	mov	x8, #0                          ; =0x0
	sub	x9, x20, #1
	mov	x10, #64915                     ; =0xfd93
	movk	x10, #26201, lsl #16
	movk	x10, #65208, lsl #32
	movk	x10, #55016, lsl #48
	mov	x11, #58809                     ; =0xe5b9
	movk	x11, #7396, lsl #16
	movk	x11, #18285, lsl #32
	movk	x11, #48984, lsl #48
	mov	x12, #4587                      ; =0x11eb
	movk	x12, #4913, lsl #16
	movk	x12, #18875, lsl #32
	movk	x12, #38096, lsl #48
	mov	w13, #1                         ; =0x1
	b	LBB21_17
LBB21_16:                               ;   in Loop: Header=BB21_17 Depth=1
	add	x8, x8, #1
	sub	x16, x14, x15
	cmp	x8, x16, asr #2
	b.hs	LBB21_21
LBB21_17:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB21_19 Depth 2
	ldr	x16, [x19, #112]
	ldrb	w16, [x16, x8]
	cbz	w16, LBB21_16
; %bb.18:                               ;   in Loop: Header=BB21_17 Depth=1
	ldr	w14, [x15, x8, lsl #2]
	ldr	x15, [x19, #64]
	eor	x16, x14, x10
	eor	x16, x16, x16, lsr #30
	mul	x16, x16, x11
	eor	x16, x16, x16, lsr #27
	mul	x16, x16, x12
	eor	x0, x16, x16, lsr #31
	ldr	x16, [sp]
LBB21_19:                               ;   Parent Loop BB21_17 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	and	x17, x0, x9
	ldrb	w1, [x16, x17]
	add	x0, x17, #1
	cbnz	w1, LBB21_19
; %bb.20:                               ;   in Loop: Header=BB21_17 Depth=1
	strb	w13, [x16, x17]
	ldur	x16, [x29, #-64]
	str	w14, [x16, x17, lsl #2]
	ldr	w14, [x15, x8, lsl #2]
	ldr	x15, [sp, #48]
	str	w14, [x15, x17, lsl #2]
	ldp	x15, x14, [x19, #16]
	b	LBB21_16
LBB21_21:
	ldp	q0, q1, [x29, #-64]
	stp	x15, x14, [x29, #-64]
	ldr	q2, [x19, #32]
	stp	q0, q1, [x19, #16]
	stur	q2, [x29, #-48]
	ldp	x8, x9, [x19, #48]
	ldp	x10, x11, [x29, #-32]
	stp	x10, x11, [x19, #48]
	stp	x8, x9, [x29, #-32]
	ldp	q0, q1, [sp, #48]
	ldp	q2, q3, [x19, #64]
	stp	q0, q1, [x19, #64]
	stp	q2, q3, [sp, #48]
	ldp	x8, x9, [x19, #96]
	ldp	x10, x11, [sp, #80]
	stp	x10, x11, [x19, #96]
	stp	x8, x9, [sp, #80]
	ldp	q1, q2, [sp]
	ldp	q3, q0, [x19, #112]
	stp	q1, q2, [x19, #112]
	stp	q3, q0, [sp]
	ldp	x20, x8, [x19, #144]
	ldp	x9, x10, [sp, #32]
	stp	x9, x10, [x19, #144]
	fmov	x0, d3
	stp	x20, x8, [sp, #32]
	cbz	x0, LBB21_23
; %bb.22:
	str	x0, [sp, #8]
	fmov	x8, d0
	sub	x19, x8, x0
	bl	__ZdlPv
	ldr	x0, [sp, #24]
	ldr	x2, [sp, #40]
	mov	x1, x19
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
	ldr	x20, [sp, #32]
LBB21_23:
	cbz	x20, LBB21_26
; %bb.24:
	add	x8, x20, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbnz	x8, LBB21_26
; %bb.25:
	ldr	x8, [x20]
	ldr	x8, [x8, #16]
	mov	x0, x20
	blr	x8
	mov	x0, x20
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
LBB21_26:
	ldr	x0, [sp, #48]
	cbz	x0, LBB21_28
; %bb.27:
	str	x0, [sp, #56]
	ldr	x8, [sp, #64]
	sub	x19, x8, x0
	bl	__ZdlPv
	ldr	x0, [sp, #72]
	ldr	x2, [sp, #88]
	mov	x1, x19
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
LBB21_28:
	ldr	x19, [sp, #80]
	cbz	x19, LBB21_31
; %bb.29:
	add	x8, x19, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbnz	x8, LBB21_31
; %bb.30:
	ldr	x8, [x19]
	ldr	x8, [x8, #16]
	mov	x0, x19
	blr	x8
	mov	x0, x19
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
LBB21_31:
	ldur	x0, [x29, #-64]
	cbz	x0, LBB21_33
; %bb.32:
	stur	x0, [x29, #-56]
	ldur	x8, [x29, #-48]
	sub	x19, x8, x0
	bl	__ZdlPv
	ldur	x0, [x29, #-40]
	ldur	x2, [x29, #-24]
	mov	x1, x19
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
LBB21_33:
	ldur	x19, [x29, #-32]
	cbz	x19, LBB21_35
; %bb.34:
	add	x8, x19, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbz	x8, LBB21_36
LBB21_35:
	ldp	x29, x30, [sp, #160]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #144]            ; 16-byte Folded Reload
	add	sp, sp, #176
	ret
LBB21_36:
	ldr	x8, [x19]
	ldr	x8, [x8, #16]
	mov	x0, x19
	blr	x8
	mov	x0, x19
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
	ldp	x29, x30, [sp, #160]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #144]            ; 16-byte Folded Reload
	add	sp, sp, #176
	ret
LBB21_37:
Ltmp220:
	mov	x19, x0
	add	x0, sp, #48
	bl	__ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEED1B8ne200100Ev
	sub	x0, x29, #64
	bl	__ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEED1B8ne200100Ev
	mov	x0, x19
	bl	__Unwind_Resume
LBB21_38:
Ltmp217:
	mov	x19, x0
	sub	x0, x29, #64
	bl	__ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEED1B8ne200100Ev
	mov	x0, x19
	bl	__Unwind_Resume
LBB21_39:
Ltmp227:
	mov	x19, x0
	mov	x0, sp
	bl	__ZNSt3__16vectorIhN6vquery15BudgetAllocatorIhEEED1B8ne200100Ev
	add	x0, sp, #48
	bl	__ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEED1B8ne200100Ev
	sub	x0, x29, #64
	bl	__ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEED1B8ne200100Ev
	mov	x0, x19
	bl	__Unwind_Resume
Lfunc_end9:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table21:
Lexception9:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end9-Lcst_begin9
Lcst_begin9:
	.uleb128 Lfunc_begin9-Lfunc_begin9      ; >> Call Site 1 <<
	.uleb128 Ltmp215-Lfunc_begin9           ;   Call between Lfunc_begin9 and Ltmp215
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp215-Lfunc_begin9           ; >> Call Site 2 <<
	.uleb128 Ltmp216-Ltmp215                ;   Call between Ltmp215 and Ltmp216
	.uleb128 Ltmp217-Lfunc_begin9           ;     jumps to Ltmp217
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp218-Lfunc_begin9           ; >> Call Site 3 <<
	.uleb128 Ltmp219-Ltmp218                ;   Call between Ltmp218 and Ltmp219
	.uleb128 Ltmp220-Lfunc_begin9           ;     jumps to Ltmp220
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp221-Lfunc_begin9           ; >> Call Site 4 <<
	.uleb128 Ltmp226-Ltmp221                ;   Call between Ltmp221 and Ltmp226
	.uleb128 Ltmp227-Lfunc_begin9           ;     jumps to Ltmp227
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp226-Lfunc_begin9           ; >> Call Site 5 <<
	.uleb128 Lfunc_end9-Ltmp226             ;   Call between Ltmp226 and Lfunc_end9
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end9:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__16vectorIhN6vquery15BudgetAllocatorIhEEED1B8ne200100Ev ; -- Begin function _ZNSt3__16vectorIhN6vquery15BudgetAllocatorIhEEED1B8ne200100Ev
	.globl	__ZNSt3__16vectorIhN6vquery15BudgetAllocatorIhEEED1B8ne200100Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorIhN6vquery15BudgetAllocatorIhEEED1B8ne200100Ev
	.p2align	2
__ZNSt3__16vectorIhN6vquery15BudgetAllocatorIhEEED1B8ne200100Ev: ; @_ZNSt3__16vectorIhN6vquery15BudgetAllocatorIhEEED1B8ne200100Ev
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	ldr	x0, [x0]
	cbz	x0, LBB22_2
; %bb.1:
	str	x0, [x19, #8]
	ldr	x8, [x19, #16]
	sub	x20, x8, x0
	bl	__ZdlPv
	ldr	x0, [x19, #24]
	ldr	x2, [x19, #40]
	mov	x1, x20
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
LBB22_2:
	ldr	x20, [x19, #32]
	cbz	x20, LBB22_4
; %bb.3:
	add	x8, x20, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbz	x8, LBB22_5
LBB22_4:
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
LBB22_5:
	ldr	x8, [x20]
	ldr	x8, [x8, #16]
	mov	x0, x20
	blr	x8
	mov	x0, x20
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEED1B8ne200100Ev ; -- Begin function _ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEED1B8ne200100Ev
	.globl	__ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEED1B8ne200100Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEED1B8ne200100Ev
	.p2align	2
__ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEED1B8ne200100Ev: ; @_ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEED1B8ne200100Ev
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	ldr	x0, [x0]
	cbz	x0, LBB23_2
; %bb.1:
	str	x0, [x19, #8]
	ldr	x8, [x19, #16]
	sub	x20, x8, x0
	bl	__ZdlPv
	ldr	x0, [x19, #24]
	ldr	x2, [x19, #40]
	mov	x1, x20
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
LBB23_2:
	ldr	x20, [x19, #32]
	cbz	x20, LBB23_4
; %bb.3:
	add	x8, x20, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbz	x8, LBB23_5
LBB23_4:
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
LBB23_5:
	ldr	x8, [x20]
	ldr	x8, [x8, #16]
	mov	x0, x20
	blr	x8
	mov	x0, x20
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN6vquery15BudgetAllocatorIjEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE ; -- Begin function _ZN6vquery15BudgetAllocatorIjEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
	.weak_def_can_be_hidden	__ZN6vquery15BudgetAllocatorIjEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
	.p2align	2
__ZN6vquery15BudgetAllocatorIjEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE: ; @_ZN6vquery15BudgetAllocatorIjEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
Lfunc_begin10:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception10
; %bb.0:
	sub	sp, sp, #80
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	ldr	q0, [x1]
	str	q0, [x0]
	stp	xzr, xzr, [x1]
	str	x2, [x0, #16]
	ldr	x8, [x0]
	cbz	x8, LBB24_2
; %bb.1:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB24_2:
	str	x0, [sp]                        ; 8-byte Folded Spill
	mov	w0, #24                         ; =0x18
	bl	___cxa_allocate_exception
	mov	x19, x0
Ltmp228:
Lloh56:
	adrp	x1, l_.str.4@PAGE
Lloh57:
	add	x1, x1, l_.str.4@PAGEOFF
	add	x0, sp, #8
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
Ltmp229:
; %bb.3:
	mov	w21, #1                         ; =0x1
Ltmp231:
	add	x1, sp, #8
	mov	x0, x19
	bl	__ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE
Ltmp232:
; %bb.4:
Lloh58:
	adrp	x8, __ZTVN6vquery5ErrorE@GOTPAGE
Lloh59:
	ldr	x8, [x8, __ZTVN6vquery5ErrorE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x19]
	str	wzr, [x19, #16]
Ltmp233:
	mov	w21, #0                         ; =0x0
Lloh60:
	adrp	x1, __ZTIN6vquery5ErrorE@PAGE
Lloh61:
	add	x1, x1, __ZTIN6vquery5ErrorE@PAGEOFF
Lloh62:
	adrp	x2, __ZN6vquery5ErrorD1Ev@GOTPAGE
Lloh63:
	ldr	x2, [x2, __ZN6vquery5ErrorD1Ev@GOTPAGEOFF]
	mov	x0, x19
	bl	___cxa_throw
Ltmp234:
; %bb.5:
	brk	#0x1
LBB24_6:
Ltmp235:
	mov	x20, x0
	ldrsb	w8, [sp, #31]
	tbz	w8, #31, LBB24_8
; %bb.7:
	ldr	x0, [sp, #8]
	bl	__ZdlPv
	tbnz	w21, #0, LBB24_10
	b	LBB24_11
LBB24_8:
	cbnz	w21, LBB24_10
	b	LBB24_11
LBB24_9:
Ltmp230:
	mov	x20, x0
LBB24_10:
	mov	x0, x19
	bl	___cxa_free_exception
LBB24_11:
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	bl	__ZNSt3__110shared_ptrIN6vquery12MemoryBudgetEED1B8ne200100Ev
	mov	x0, x20
	bl	__Unwind_Resume
	.loh AdrpAdd	Lloh56, Lloh57
	.loh AdrpLdrGot	Lloh62, Lloh63
	.loh AdrpAdd	Lloh60, Lloh61
	.loh AdrpLdrGot	Lloh58, Lloh59
Lfunc_end10:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table24:
Lexception10:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end10-Lcst_begin10
Lcst_begin10:
	.uleb128 Lfunc_begin10-Lfunc_begin10    ; >> Call Site 1 <<
	.uleb128 Ltmp228-Lfunc_begin10          ;   Call between Lfunc_begin10 and Ltmp228
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp228-Lfunc_begin10          ; >> Call Site 2 <<
	.uleb128 Ltmp229-Ltmp228                ;   Call between Ltmp228 and Ltmp229
	.uleb128 Ltmp230-Lfunc_begin10          ;     jumps to Ltmp230
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp231-Lfunc_begin10          ; >> Call Site 3 <<
	.uleb128 Ltmp234-Ltmp231                ;   Call between Ltmp231 and Ltmp234
	.uleb128 Ltmp235-Lfunc_begin10          ;     jumps to Ltmp235
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp234-Lfunc_begin10          ; >> Call Site 4 <<
	.uleb128 Lfunc_end10-Ltmp234            ;   Call between Ltmp234 and Lfunc_end10
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end10:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN6vquery15BudgetAllocatorIhEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE ; -- Begin function _ZN6vquery15BudgetAllocatorIhEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
	.weak_def_can_be_hidden	__ZN6vquery15BudgetAllocatorIhEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
	.p2align	2
__ZN6vquery15BudgetAllocatorIhEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE: ; @_ZN6vquery15BudgetAllocatorIhEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
Lfunc_begin11:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception11
; %bb.0:
	sub	sp, sp, #80
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	ldr	q0, [x1]
	str	q0, [x0]
	stp	xzr, xzr, [x1]
	str	x2, [x0, #16]
	ldr	x8, [x0]
	cbz	x8, LBB25_2
; %bb.1:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB25_2:
	str	x0, [sp]                        ; 8-byte Folded Spill
	mov	w0, #24                         ; =0x18
	bl	___cxa_allocate_exception
	mov	x19, x0
Ltmp236:
Lloh64:
	adrp	x1, l_.str.4@PAGE
Lloh65:
	add	x1, x1, l_.str.4@PAGEOFF
	add	x0, sp, #8
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
Ltmp237:
; %bb.3:
	mov	w21, #1                         ; =0x1
Ltmp239:
	add	x1, sp, #8
	mov	x0, x19
	bl	__ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE
Ltmp240:
; %bb.4:
Lloh66:
	adrp	x8, __ZTVN6vquery5ErrorE@GOTPAGE
Lloh67:
	ldr	x8, [x8, __ZTVN6vquery5ErrorE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x19]
	str	wzr, [x19, #16]
Ltmp241:
	mov	w21, #0                         ; =0x0
Lloh68:
	adrp	x1, __ZTIN6vquery5ErrorE@PAGE
Lloh69:
	add	x1, x1, __ZTIN6vquery5ErrorE@PAGEOFF
Lloh70:
	adrp	x2, __ZN6vquery5ErrorD1Ev@GOTPAGE
Lloh71:
	ldr	x2, [x2, __ZN6vquery5ErrorD1Ev@GOTPAGEOFF]
	mov	x0, x19
	bl	___cxa_throw
Ltmp242:
; %bb.5:
	brk	#0x1
LBB25_6:
Ltmp243:
	mov	x20, x0
	ldrsb	w8, [sp, #31]
	tbz	w8, #31, LBB25_8
; %bb.7:
	ldr	x0, [sp, #8]
	bl	__ZdlPv
	tbnz	w21, #0, LBB25_10
	b	LBB25_11
LBB25_8:
	cbnz	w21, LBB25_10
	b	LBB25_11
LBB25_9:
Ltmp238:
	mov	x20, x0
LBB25_10:
	mov	x0, x19
	bl	___cxa_free_exception
LBB25_11:
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	bl	__ZNSt3__110shared_ptrIN6vquery12MemoryBudgetEED1B8ne200100Ev
	mov	x0, x20
	bl	__Unwind_Resume
	.loh AdrpAdd	Lloh64, Lloh65
	.loh AdrpLdrGot	Lloh70, Lloh71
	.loh AdrpAdd	Lloh68, Lloh69
	.loh AdrpLdrGot	Lloh66, Lloh67
Lfunc_end11:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table25:
Lexception11:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end11-Lcst_begin11
Lcst_begin11:
	.uleb128 Lfunc_begin11-Lfunc_begin11    ; >> Call Site 1 <<
	.uleb128 Ltmp236-Lfunc_begin11          ;   Call between Lfunc_begin11 and Ltmp236
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp236-Lfunc_begin11          ; >> Call Site 2 <<
	.uleb128 Ltmp237-Ltmp236                ;   Call between Ltmp236 and Ltmp237
	.uleb128 Ltmp238-Lfunc_begin11          ;     jumps to Ltmp238
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp239-Lfunc_begin11          ; >> Call Site 3 <<
	.uleb128 Ltmp242-Ltmp239                ;   Call between Ltmp239 and Ltmp242
	.uleb128 Ltmp243-Lfunc_begin11          ;     jumps to Ltmp243
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp242-Lfunc_begin11          ; >> Call Site 4 <<
	.uleb128 Lfunc_end11-Ltmp242            ;   Call between Ltmp242 and Lfunc_end11
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end11:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEE8__appendEm ; -- Begin function _ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEE8__appendEm
	.globl	__ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEE8__appendEm
	.weak_def_can_be_hidden	__ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEE8__appendEm
	.p2align	2
__ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEE8__appendEm: ; @_ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEE8__appendEm
	.cfi_startproc
; %bb.0:
	stp	x26, x25, [sp, #-80]!           ; 16-byte Folded Spill
	stp	x24, x23, [sp, #16]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	mov	x19, x0
	ldp	x21, x8, [x0, #8]
	sub	x9, x8, x21
	cmp	x1, x9, asr #2
	b.ls	LBB26_4
; %bb.1:
	ldr	x20, [x19]
	sub	x21, x21, x20
	asr	x23, x21, #2
	add	x9, x23, x1
	lsr	x10, x9, #62
	cbnz	x10, LBB26_11
; %bb.2:
	mov	x10, #9223372036854775804       ; =0x7ffffffffffffffc
	sub	x8, x8, x20
	asr	x11, x8, #1
	cmp	x11, x9
	csel	x9, x11, x9, hi
	cmp	x8, x10
	mov	x8, #4611686018427387903        ; =0x3fffffffffffffff
	csel	x22, x9, x8, lo
	cbz	x22, LBB26_7
; %bb.3:
	add	x0, x19, #24
	mov	x20, x1
	mov	x1, x22
	bl	__ZN6vquery15BudgetAllocatorIjE8allocateEm
	mov	x1, x20
	ldp	x20, x8, [x19]
	sub	x21, x8, x20
	asr	x25, x21, #2
	b	LBB26_8
LBB26_4:
	cbz	x1, LBB26_6
; %bb.5:
	lsl	x20, x1, #2
	mov	x0, x21
	mov	x1, x20
	bl	_bzero
	add	x21, x21, x20
LBB26_6:
	str	x21, [x19, #8]
	b	LBB26_10
LBB26_7:
	mov	x0, #0                          ; =0x0
	mov	x25, x23
LBB26_8:
	add	x23, x0, x23, lsl #2
	lsl	x24, x1, #2
	add	x26, x0, x22, lsl #2
	mov	x0, x23
	mov	x1, x24
	bl	_bzero
	add	x24, x23, x24
	sub	x22, x23, x25, lsl #2
	mov	x0, x22
	mov	x1, x20
	mov	x2, x21
	bl	_memcpy
	ldr	x0, [x19]
	stp	x22, x24, [x19]
	ldr	x8, [x19, #16]
	str	x26, [x19, #16]
	cbz	x0, LBB26_10
; %bb.9:
	sub	x20, x8, x0
	bl	__ZdlPv
	ldr	x0, [x19, #24]
	ldr	x2, [x19, #40]
	mov	x1, x20
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp], #80             ; 16-byte Folded Reload
	b	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
LBB26_10:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp], #80             ; 16-byte Folded Reload
	ret
LBB26_11:
	bl	__ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEE20__throw_length_errorB8ne200100Ev
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEE20__throw_length_errorB8ne200100Ev ; -- Begin function _ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEE20__throw_length_errorB8ne200100Ev
	.globl	__ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEE20__throw_length_errorB8ne200100Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEE20__throw_length_errorB8ne200100Ev
	.p2align	2
__ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEE20__throw_length_errorB8ne200100Ev: ; @_ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEE20__throw_length_errorB8ne200100Ev
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh72:
	adrp	x0, l_.str.5@PAGE
Lloh73:
	add	x0, x0, l_.str.5@PAGEOFF
	bl	__ZNSt3__120__throw_length_errorB8ne200100EPKc
	.loh AdrpAdd	Lloh72, Lloh73
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__120__throw_length_errorB8ne200100EPKc ; -- Begin function _ZNSt3__120__throw_length_errorB8ne200100EPKc
	.globl	__ZNSt3__120__throw_length_errorB8ne200100EPKc
	.weak_def_can_be_hidden	__ZNSt3__120__throw_length_errorB8ne200100EPKc
	.p2align	2
__ZNSt3__120__throw_length_errorB8ne200100EPKc: ; @_ZNSt3__120__throw_length_errorB8ne200100EPKc
Lfunc_begin12:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception12
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x20, x0
	mov	w0, #16                         ; =0x10
	bl	___cxa_allocate_exception
	mov	x19, x0
Ltmp244:
	mov	x1, x20
	bl	__ZNSt12length_errorC1B8ne200100EPKc
Ltmp245:
; %bb.1:
Lloh74:
	adrp	x1, __ZTISt12length_error@GOTPAGE
Lloh75:
	ldr	x1, [x1, __ZTISt12length_error@GOTPAGEOFF]
Lloh76:
	adrp	x2, __ZNSt12length_errorD1Ev@GOTPAGE
Lloh77:
	ldr	x2, [x2, __ZNSt12length_errorD1Ev@GOTPAGEOFF]
	mov	x0, x19
	bl	___cxa_throw
LBB28_2:
Ltmp246:
	mov	x20, x0
	mov	x0, x19
	bl	___cxa_free_exception
	mov	x0, x20
	bl	__Unwind_Resume
	.loh AdrpLdrGot	Lloh76, Lloh77
	.loh AdrpLdrGot	Lloh74, Lloh75
Lfunc_end12:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table28:
Lexception12:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end12-Lcst_begin12
Lcst_begin12:
	.uleb128 Lfunc_begin12-Lfunc_begin12    ; >> Call Site 1 <<
	.uleb128 Ltmp244-Lfunc_begin12          ;   Call between Lfunc_begin12 and Ltmp244
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp244-Lfunc_begin12          ; >> Call Site 2 <<
	.uleb128 Ltmp245-Ltmp244                ;   Call between Ltmp244 and Ltmp245
	.uleb128 Ltmp246-Lfunc_begin12          ;     jumps to Ltmp246
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp245-Lfunc_begin12          ; >> Call Site 3 <<
	.uleb128 Lfunc_end12-Ltmp245            ;   Call between Ltmp245 and Lfunc_end12
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end12:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt12length_errorC1B8ne200100EPKc ; -- Begin function _ZNSt12length_errorC1B8ne200100EPKc
	.globl	__ZNSt12length_errorC1B8ne200100EPKc
	.weak_def_can_be_hidden	__ZNSt12length_errorC1B8ne200100EPKc
	.p2align	2
__ZNSt12length_errorC1B8ne200100EPKc:   ; @_ZNSt12length_errorC1B8ne200100EPKc
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	bl	__ZNSt11logic_errorC2EPKc
Lloh78:
	adrp	x8, __ZTVSt12length_error@GOTPAGE
Lloh79:
	ldr	x8, [x8, __ZTVSt12length_error@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x0]
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.loh AdrpLdrGot	Lloh78, Lloh79
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN6vquery15BudgetAllocatorIjE8allocateEm ; -- Begin function _ZN6vquery15BudgetAllocatorIjE8allocateEm
	.weak_def_can_be_hidden	__ZN6vquery15BudgetAllocatorIjE8allocateEm
	.p2align	2
__ZN6vquery15BudgetAllocatorIjE8allocateEm: ; @_ZN6vquery15BudgetAllocatorIjE8allocateEm
Lfunc_begin13:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception13
; %bb.0:
	sub	sp, sp, #80
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	lsr	x8, x1, #62
	cbnz	x8, LBB30_3
; %bb.1:
	mov	x19, x0
	lsl	x20, x1, #2
	ldr	x0, [x0]
	ldr	x2, [x19, #16]
	mov	x1, x20
	bl	__ZN6vquery12MemoryBudget7reserveEmNS_14MemoryCategoryE
Ltmp247:
	mov	x0, x20
	bl	__Znwm
Ltmp248:
; %bb.2:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB30_3:
	mov	w0, #24                         ; =0x18
	bl	___cxa_allocate_exception
	mov	x19, x0
Ltmp256:
Lloh80:
	adrp	x1, l_.str.6@PAGE
Lloh81:
	add	x1, x1, l_.str.6@PAGEOFF
	add	x0, sp, #8
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
Ltmp257:
; %bb.4:
	mov	w21, #1                         ; =0x1
Ltmp259:
	add	x1, sp, #8
	mov	x0, x19
	bl	__ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE
Ltmp260:
; %bb.5:
Lloh82:
	adrp	x8, __ZTVN6vquery5ErrorE@GOTPAGE
Lloh83:
	ldr	x8, [x8, __ZTVN6vquery5ErrorE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x19]
	mov	w8, #3                          ; =0x3
	str	w8, [x19, #16]
Ltmp261:
	mov	w21, #0                         ; =0x0
Lloh84:
	adrp	x1, __ZTIN6vquery5ErrorE@PAGE
Lloh85:
	add	x1, x1, __ZTIN6vquery5ErrorE@PAGEOFF
Lloh86:
	adrp	x2, __ZN6vquery5ErrorD1Ev@GOTPAGE
Lloh87:
	ldr	x2, [x2, __ZN6vquery5ErrorD1Ev@GOTPAGEOFF]
	mov	x0, x19
	bl	___cxa_throw
Ltmp262:
	b	LBB30_12
LBB30_6:
Ltmp263:
	mov	x20, x0
	ldrsb	w8, [sp, #31]
	tbz	w8, #31, LBB30_8
; %bb.7:
	ldr	x0, [sp, #8]
	bl	__ZdlPv
	tbnz	w21, #0, LBB30_10
	b	LBB30_14
LBB30_8:
	cbnz	w21, LBB30_10
	b	LBB30_14
LBB30_9:
Ltmp258:
	mov	x20, x0
LBB30_10:
	mov	x0, x19
	bl	___cxa_free_exception
	mov	x0, x20
	bl	__Unwind_Resume
LBB30_11:
Ltmp249:
	bl	___cxa_begin_catch
	ldr	x0, [x19]
	ldr	x2, [x19, #16]
	mov	x1, x20
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
Ltmp250:
	bl	___cxa_rethrow
Ltmp251:
LBB30_12:
	brk	#0x1
LBB30_13:
Ltmp252:
	mov	x20, x0
Ltmp253:
	bl	___cxa_end_catch
Ltmp254:
LBB30_14:
	mov	x0, x20
	bl	__Unwind_Resume
LBB30_15:
Ltmp255:
	bl	___clang_call_terminate
	.loh AdrpAdd	Lloh80, Lloh81
	.loh AdrpLdrGot	Lloh86, Lloh87
	.loh AdrpAdd	Lloh84, Lloh85
	.loh AdrpLdrGot	Lloh82, Lloh83
Lfunc_end13:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table30:
Lexception13:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase1-Lttbaseref1
Lttbaseref1:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end13-Lcst_begin13
Lcst_begin13:
	.uleb128 Lfunc_begin13-Lfunc_begin13    ; >> Call Site 1 <<
	.uleb128 Ltmp247-Lfunc_begin13          ;   Call between Lfunc_begin13 and Ltmp247
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp247-Lfunc_begin13          ; >> Call Site 2 <<
	.uleb128 Ltmp248-Ltmp247                ;   Call between Ltmp247 and Ltmp248
	.uleb128 Ltmp249-Lfunc_begin13          ;     jumps to Ltmp249
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp248-Lfunc_begin13          ; >> Call Site 3 <<
	.uleb128 Ltmp256-Ltmp248                ;   Call between Ltmp248 and Ltmp256
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp256-Lfunc_begin13          ; >> Call Site 4 <<
	.uleb128 Ltmp257-Ltmp256                ;   Call between Ltmp256 and Ltmp257
	.uleb128 Ltmp258-Lfunc_begin13          ;     jumps to Ltmp258
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp259-Lfunc_begin13          ; >> Call Site 5 <<
	.uleb128 Ltmp262-Ltmp259                ;   Call between Ltmp259 and Ltmp262
	.uleb128 Ltmp263-Lfunc_begin13          ;     jumps to Ltmp263
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp262-Lfunc_begin13          ; >> Call Site 6 <<
	.uleb128 Ltmp250-Ltmp262                ;   Call between Ltmp262 and Ltmp250
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp250-Lfunc_begin13          ; >> Call Site 7 <<
	.uleb128 Ltmp251-Ltmp250                ;   Call between Ltmp250 and Ltmp251
	.uleb128 Ltmp252-Lfunc_begin13          ;     jumps to Ltmp252
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp253-Lfunc_begin13          ; >> Call Site 8 <<
	.uleb128 Ltmp254-Ltmp253                ;   Call between Ltmp253 and Ltmp254
	.uleb128 Ltmp255-Lfunc_begin13          ;     jumps to Ltmp255
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp254-Lfunc_begin13          ; >> Call Site 9 <<
	.uleb128 Lfunc_end13-Ltmp254            ;   Call between Ltmp254 and Lfunc_end13
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end13:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2, 0x0
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase1:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZSt28__throw_bad_array_new_lengthB8ne200100v ; -- Begin function _ZSt28__throw_bad_array_new_lengthB8ne200100v
	.globl	__ZSt28__throw_bad_array_new_lengthB8ne200100v
	.weak_def_can_be_hidden	__ZSt28__throw_bad_array_new_lengthB8ne200100v
	.p2align	2
__ZSt28__throw_bad_array_new_lengthB8ne200100v: ; @_ZSt28__throw_bad_array_new_lengthB8ne200100v
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w0, #8                          ; =0x8
	bl	___cxa_allocate_exception
	bl	__ZNSt20bad_array_new_lengthC1Ev
Lloh88:
	adrp	x1, __ZTISt20bad_array_new_length@GOTPAGE
Lloh89:
	ldr	x1, [x1, __ZTISt20bad_array_new_length@GOTPAGEOFF]
Lloh90:
	adrp	x2, __ZNSt20bad_array_new_lengthD1Ev@GOTPAGE
Lloh91:
	ldr	x2, [x2, __ZNSt20bad_array_new_lengthD1Ev@GOTPAGEOFF]
	bl	___cxa_throw
	.loh AdrpLdrGot	Lloh90, Lloh91
	.loh AdrpLdrGot	Lloh88, Lloh89
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIhN6vquery15BudgetAllocatorIhEEE8__appendEm ; -- Begin function _ZNSt3__16vectorIhN6vquery15BudgetAllocatorIhEEE8__appendEm
	.globl	__ZNSt3__16vectorIhN6vquery15BudgetAllocatorIhEEE8__appendEm
	.weak_def_can_be_hidden	__ZNSt3__16vectorIhN6vquery15BudgetAllocatorIhEEE8__appendEm
	.p2align	2
__ZNSt3__16vectorIhN6vquery15BudgetAllocatorIhEEE8__appendEm: ; @_ZNSt3__16vectorIhN6vquery15BudgetAllocatorIhEEE8__appendEm
	.cfi_startproc
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x19, x0
	ldp	x0, x8, [x0, #8]
	sub	x9, x8, x0
	cmp	x9, x1
	b.hs	LBB32_4
; %bb.1:
	ldr	x10, [x19]
	sub	x21, x0, x10
	adds	x9, x21, x1
	b.mi	LBB32_11
; %bb.2:
	mov	x11, #4611686018427387903       ; =0x3fffffffffffffff
	sub	x8, x8, x10
	lsl	x10, x8, #1
	cmp	x10, x9
	csel	x9, x10, x9, hi
	cmp	x8, x11
	mov	x8, #9223372036854775807        ; =0x7fffffffffffffff
	csel	x20, x9, x8, lo
	cbz	x20, LBB32_7
; %bb.3:
	add	x0, x19, #24
	mov	x22, x1
	mov	x1, x20
	bl	__ZN6vquery15BudgetAllocatorIhE8allocateEm
	mov	x1, x22
	b	LBB32_8
LBB32_4:
	cbz	x1, LBB32_6
; %bb.5:
	add	x20, x0, x1
	bl	_bzero
	mov	x0, x20
LBB32_6:
	str	x0, [x19, #8]
	b	LBB32_10
LBB32_7:
	mov	x0, #0                          ; =0x0
LBB32_8:
	add	x22, x0, x20
	add	x20, x0, x21
	add	x21, x20, x1
	mov	x0, x20
	bl	_bzero
	ldp	x1, x8, [x19]
	sub	x9, x1, x8
	add	x20, x20, x9
	sub	x2, x8, x1
	mov	x0, x20
	bl	_memcpy
	ldr	x0, [x19]
	stp	x20, x21, [x19]
	ldr	x8, [x19, #16]
	str	x22, [x19, #16]
	cbz	x0, LBB32_10
; %bb.9:
	sub	x20, x8, x0
	bl	__ZdlPv
	ldr	x0, [x19, #24]
	ldr	x2, [x19, #40]
	mov	x1, x20
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	b	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
LBB32_10:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
LBB32_11:
	bl	__ZNSt3__16vectorIhN6vquery15BudgetAllocatorIhEEE20__throw_length_errorB8ne200100Ev
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIhN6vquery15BudgetAllocatorIhEEE20__throw_length_errorB8ne200100Ev ; -- Begin function _ZNSt3__16vectorIhN6vquery15BudgetAllocatorIhEEE20__throw_length_errorB8ne200100Ev
	.globl	__ZNSt3__16vectorIhN6vquery15BudgetAllocatorIhEEE20__throw_length_errorB8ne200100Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorIhN6vquery15BudgetAllocatorIhEEE20__throw_length_errorB8ne200100Ev
	.p2align	2
__ZNSt3__16vectorIhN6vquery15BudgetAllocatorIhEEE20__throw_length_errorB8ne200100Ev: ; @_ZNSt3__16vectorIhN6vquery15BudgetAllocatorIhEEE20__throw_length_errorB8ne200100Ev
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh92:
	adrp	x0, l_.str.5@PAGE
Lloh93:
	add	x0, x0, l_.str.5@PAGEOFF
	bl	__ZNSt3__120__throw_length_errorB8ne200100EPKc
	.loh AdrpAdd	Lloh92, Lloh93
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN6vquery15BudgetAllocatorIhE8allocateEm ; -- Begin function _ZN6vquery15BudgetAllocatorIhE8allocateEm
	.weak_def_can_be_hidden	__ZN6vquery15BudgetAllocatorIhE8allocateEm
	.p2align	2
__ZN6vquery15BudgetAllocatorIhE8allocateEm: ; @_ZN6vquery15BudgetAllocatorIhE8allocateEm
Lfunc_begin14:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception14
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x1
	mov	x20, x0
	ldr	x0, [x0]
	ldr	x2, [x20, #16]
	bl	__ZN6vquery12MemoryBudget7reserveEmNS_14MemoryCategoryE
Ltmp264:
	mov	x0, x19
	bl	__Znwm
Ltmp265:
; %bb.1:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
LBB34_2:
Ltmp266:
	bl	___cxa_begin_catch
	ldr	x0, [x20]
	ldr	x2, [x20, #16]
	mov	x1, x19
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
Ltmp267:
	bl	___cxa_rethrow
Ltmp268:
; %bb.3:
	brk	#0x1
LBB34_4:
Ltmp269:
	mov	x19, x0
Ltmp270:
	bl	___cxa_end_catch
Ltmp271:
; %bb.5:
	mov	x0, x19
	bl	__Unwind_Resume
LBB34_6:
Ltmp272:
	bl	___clang_call_terminate
Lfunc_end14:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table34:
Lexception14:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase2-Lttbaseref2
Lttbaseref2:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end14-Lcst_begin14
Lcst_begin14:
	.uleb128 Lfunc_begin14-Lfunc_begin14    ; >> Call Site 1 <<
	.uleb128 Ltmp264-Lfunc_begin14          ;   Call between Lfunc_begin14 and Ltmp264
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp264-Lfunc_begin14          ; >> Call Site 2 <<
	.uleb128 Ltmp265-Ltmp264                ;   Call between Ltmp264 and Ltmp265
	.uleb128 Ltmp266-Lfunc_begin14          ;     jumps to Ltmp266
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp265-Lfunc_begin14          ; >> Call Site 3 <<
	.uleb128 Ltmp267-Ltmp265                ;   Call between Ltmp265 and Ltmp267
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp267-Lfunc_begin14          ; >> Call Site 4 <<
	.uleb128 Ltmp268-Ltmp267                ;   Call between Ltmp267 and Ltmp268
	.uleb128 Ltmp269-Lfunc_begin14          ;     jumps to Ltmp269
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp270-Lfunc_begin14          ; >> Call Site 5 <<
	.uleb128 Ltmp271-Ltmp270                ;   Call between Ltmp270 and Ltmp271
	.uleb128 Ltmp272-Lfunc_begin14          ;     jumps to Ltmp272
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp271-Lfunc_begin14          ; >> Call Site 6 <<
	.uleb128 Lfunc_end14-Ltmp271            ;   Call between Ltmp271 and Lfunc_end14
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end14:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2, 0x0
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase2:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN6vquery9HashTableIjNS_7KeyHashEE7doubledEm ; -- Begin function _ZN6vquery9HashTableIjNS_7KeyHashEE7doubledEm
	.weak_def_can_be_hidden	__ZN6vquery9HashTableIjNS_7KeyHashEE7doubledEm
	.p2align	2
__ZN6vquery9HashTableIjNS_7KeyHashEE7doubledEm: ; @_ZN6vquery9HashTableIjNS_7KeyHashEE7doubledEm
Lfunc_begin15:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception15
; %bb.0:
	sub	sp, sp, #80
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	tbnz	x0, #63, LBB35_2
; %bb.1:
	lsl	x0, x0, #1
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB35_2:
	mov	w0, #24                         ; =0x18
	bl	___cxa_allocate_exception
	mov	x19, x0
Ltmp273:
Lloh94:
	adrp	x1, l_.str.7@PAGE
Lloh95:
	add	x1, x1, l_.str.7@PAGEOFF
	add	x0, sp, #8
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
Ltmp274:
; %bb.3:
	mov	w21, #1                         ; =0x1
Ltmp276:
	add	x1, sp, #8
	mov	x0, x19
	bl	__ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE
Ltmp277:
; %bb.4:
Lloh96:
	adrp	x8, __ZTVN6vquery5ErrorE@GOTPAGE
Lloh97:
	ldr	x8, [x8, __ZTVN6vquery5ErrorE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x19]
	mov	w8, #3                          ; =0x3
	str	w8, [x19, #16]
Ltmp278:
	mov	w21, #0                         ; =0x0
Lloh98:
	adrp	x1, __ZTIN6vquery5ErrorE@PAGE
Lloh99:
	add	x1, x1, __ZTIN6vquery5ErrorE@PAGEOFF
Lloh100:
	adrp	x2, __ZN6vquery5ErrorD1Ev@GOTPAGE
Lloh101:
	ldr	x2, [x2, __ZN6vquery5ErrorD1Ev@GOTPAGEOFF]
	mov	x0, x19
	bl	___cxa_throw
Ltmp279:
; %bb.5:
	brk	#0x1
LBB35_6:
Ltmp280:
	mov	x20, x0
	ldrsb	w8, [sp, #31]
	tbz	w8, #31, LBB35_8
; %bb.7:
	ldr	x0, [sp, #8]
	bl	__ZdlPv
	tbnz	w21, #0, LBB35_10
	b	LBB35_11
LBB35_8:
	cbnz	w21, LBB35_10
	b	LBB35_11
LBB35_9:
Ltmp275:
	mov	x20, x0
LBB35_10:
	mov	x0, x19
	bl	___cxa_free_exception
LBB35_11:
	mov	x0, x20
	bl	__Unwind_Resume
	.loh AdrpAdd	Lloh94, Lloh95
	.loh AdrpLdrGot	Lloh100, Lloh101
	.loh AdrpAdd	Lloh98, Lloh99
	.loh AdrpLdrGot	Lloh96, Lloh97
Lfunc_end15:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table35:
Lexception15:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end15-Lcst_begin15
Lcst_begin15:
	.uleb128 Lfunc_begin15-Lfunc_begin15    ; >> Call Site 1 <<
	.uleb128 Ltmp273-Lfunc_begin15          ;   Call between Lfunc_begin15 and Ltmp273
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp273-Lfunc_begin15          ; >> Call Site 2 <<
	.uleb128 Ltmp274-Ltmp273                ;   Call between Ltmp273 and Ltmp274
	.uleb128 Ltmp275-Lfunc_begin15          ;     jumps to Ltmp275
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp276-Lfunc_begin15          ; >> Call Site 3 <<
	.uleb128 Ltmp279-Ltmp276                ;   Call between Ltmp276 and Ltmp279
	.uleb128 Ltmp280-Lfunc_begin15          ;     jumps to Ltmp280
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp279-Lfunc_begin15          ; >> Call Site 4 <<
	.uleb128 Lfunc_end15-Ltmp279            ;   Call between Ltmp279 and Lfunc_end15
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end15:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN6vquery9HashTableIjNS_7KeyHashEED2Ev ; -- Begin function _ZN6vquery9HashTableIjNS_7KeyHashEED2Ev
	.weak_def_can_be_hidden	__ZN6vquery9HashTableIjNS_7KeyHashEED2Ev
	.p2align	2
__ZN6vquery9HashTableIjNS_7KeyHashEED2Ev: ; @_ZN6vquery9HashTableIjNS_7KeyHashEED2Ev
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	ldr	x0, [x0, #112]
	cbz	x0, LBB36_2
; %bb.1:
	str	x0, [x19, #120]
	ldr	x8, [x19, #128]
	sub	x20, x8, x0
	bl	__ZdlPv
	ldr	x0, [x19, #136]
	ldr	x2, [x19, #152]
	mov	x1, x20
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
LBB36_2:
	ldr	x20, [x19, #144]
	cbz	x20, LBB36_5
; %bb.3:
	add	x8, x20, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbnz	x8, LBB36_5
; %bb.4:
	ldr	x8, [x20]
	ldr	x8, [x8, #16]
	mov	x0, x20
	blr	x8
	mov	x0, x20
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
LBB36_5:
	ldr	x0, [x19, #64]
	cbz	x0, LBB36_7
; %bb.6:
	str	x0, [x19, #72]
	ldr	x8, [x19, #80]
	sub	x20, x8, x0
	bl	__ZdlPv
	ldr	x0, [x19, #88]
	ldr	x2, [x19, #104]
	mov	x1, x20
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
LBB36_7:
	ldr	x20, [x19, #96]
	cbz	x20, LBB36_10
; %bb.8:
	add	x8, x20, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbnz	x8, LBB36_10
; %bb.9:
	ldr	x8, [x20]
	ldr	x8, [x8, #16]
	mov	x0, x20
	blr	x8
	mov	x0, x20
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
LBB36_10:
	ldr	x0, [x19, #16]
	cbz	x0, LBB36_12
; %bb.11:
	str	x0, [x19, #24]
	ldr	x8, [x19, #32]
	sub	x20, x8, x0
	bl	__ZdlPv
	ldr	x0, [x19, #40]
	ldr	x2, [x19, #56]
	mov	x1, x20
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
LBB36_12:
	ldr	x20, [x19, #48]
	cbz	x20, LBB36_15
; %bb.13:
	add	x8, x20, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbnz	x8, LBB36_15
; %bb.14:
	ldr	x8, [x20]
	ldr	x8, [x8, #16]
	mov	x0, x20
	blr	x8
	mov	x0, x20
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
LBB36_15:
	ldr	x20, [x19, #8]
	cbz	x20, LBB36_17
; %bb.16:
	add	x8, x20, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbz	x8, LBB36_18
LBB36_17:
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
LBB36_18:
	ldr	x8, [x20]
	ldr	x8, [x8, #16]
	mov	x0, x20
	blr	x8
	mov	x0, x20
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN6vquery9HashTableIjNS_7KeyHashEE14find_or_insertEj ; -- Begin function _ZN6vquery9HashTableIjNS_7KeyHashEE14find_or_insertEj
	.weak_def_can_be_hidden	__ZN6vquery9HashTableIjNS_7KeyHashEE14find_or_insertEj
	.p2align	2
__ZN6vquery9HashTableIjNS_7KeyHashEE14find_or_insertEj: ; @_ZN6vquery9HashTableIjNS_7KeyHashEE14find_or_insertEj
	.cfi_startproc
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x19, x0
	mov	w8, w1
	mov	x9, #64915                      ; =0xfd93
	movk	x9, #26201, lsl #16
	movk	x9, #65208, lsl #32
	movk	x9, #55016, lsl #48
	eor	x8, x8, x9
	eor	x8, x8, x8, lsr #30
	mov	x9, #58809                      ; =0xe5b9
	movk	x9, #7396, lsl #16
	movk	x9, #18285, lsl #32
	movk	x9, #48984, lsl #48
	mul	x8, x8, x9
	eor	x8, x8, x8, lsr #27
	mov	x9, #4587                       ; =0x11eb
	movk	x9, #4913, lsl #16
	movk	x9, #18875, lsl #32
	movk	x9, #38096, lsl #48
	mul	x8, x8, x9
	eor	x20, x8, x8, lsr #31
	ldp	x10, x8, [x0, #16]
	sub	x8, x8, x10
	asr	x0, x8, #2
	sub	x11, x0, #1
	ldr	x8, [x19, #112]
	and	x9, x11, x20
	ldrb	w12, [x8, x9]
	cbz	w12, LBB37_3
LBB37_1:                                ; =>This Inner Loop Header: Depth=1
	ldr	w12, [x10, x9, lsl #2]
	cmp	w12, w1
	b.eq	LBB37_8
; %bb.2:                                ;   in Loop: Header=BB37_1 Depth=1
	add	x9, x9, #1
	and	x9, x9, x11
	ldrb	w12, [x8, x9]
	cbnz	w12, LBB37_1
LBB37_3:
	ldr	x10, [x19, #160]
	add	x10, x10, #1
	mov	x11, #-3689348814741910324      ; =0xcccccccccccccccc
	movk	x11, #52429
	umulh	x11, x0, x11
	lsr	x11, x11, #3
	mov	w12, #10                        ; =0xa
	msub	w12, w11, w12, w0
	lsl	w13, w12, #3
	sub	w12, w13, w12
	and	w12, w12, #0xff
	mov	w13, #205                       ; =0xcd
	mul	w12, w12, w13
	lsl	x13, x11, #3
	lsr	w12, w12, #11
	sub	x11, x13, x11
	add	x11, x11, x12
	cmp	x10, x11
	b.ls	LBB37_10
; %bb.4:
	mov	x21, x1
	bl	__ZN6vquery9HashTableIjNS_7KeyHashEE7doubledEm
	mov	x1, x0
	mov	x0, x19
	bl	__ZN6vquery9HashTableIjNS_7KeyHashEE6rehashEm
	ldp	x10, x8, [x19, #16]
	sub	x8, x8, x10
	asr	x8, x8, #2
	sub	x11, x8, #1
	ldr	x8, [x19, #112]
	and	x9, x11, x20
	ldrb	w12, [x8, x9]
	cbz	w12, LBB37_9
; %bb.5:
	mov	x1, x21
LBB37_6:                                ; =>This Inner Loop Header: Depth=1
	ldr	w12, [x10, x9, lsl #2]
	cmp	w12, w1
	b.eq	LBB37_10
; %bb.7:                                ;   in Loop: Header=BB37_6 Depth=1
	add	x9, x9, #1
	and	x9, x9, x11
	ldrb	w12, [x8, x9]
	cbnz	w12, LBB37_6
	b	LBB37_10
LBB37_8:
	ldr	x8, [x19, #64]
	add	x0, x8, x9, lsl #2
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
LBB37_9:
	mov	x1, x21
LBB37_10:
	mov	w10, #1                         ; =0x1
	strb	w10, [x8, x9]
	ldr	x8, [x19, #16]
	lsl	x9, x9, #2
	str	w1, [x8, x9]
	ldr	x8, [x19, #64]
	add	x0, x8, x9
	str	wzr, [x0]
	ldr	x8, [x19, #160]
	add	x8, x8, #1
	str	x8, [x19, #160]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEE14find_or_insertEj ; -- Begin function _ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEE14find_or_insertEj
	.weak_def_can_be_hidden	__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEE14find_or_insertEj
	.p2align	2
__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEE14find_or_insertEj: ; @_ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEE14find_or_insertEj
	.cfi_startproc
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x19, x0
	mov	w8, w1
	mov	x9, #64915                      ; =0xfd93
	movk	x9, #26201, lsl #16
	movk	x9, #65208, lsl #32
	movk	x9, #55016, lsl #48
	eor	x8, x8, x9
	eor	x8, x8, x8, lsr #30
	mov	x9, #58809                      ; =0xe5b9
	movk	x9, #7396, lsl #16
	movk	x9, #18285, lsl #32
	movk	x9, #48984, lsl #48
	mul	x8, x8, x9
	eor	x8, x8, x8, lsr #27
	mov	x9, #4587                       ; =0x11eb
	movk	x9, #4913, lsl #16
	movk	x9, #18875, lsl #32
	movk	x9, #38096, lsl #48
	mul	x8, x8, x9
	eor	x20, x8, x8, lsr #31
	ldp	x10, x8, [x0, #16]
	sub	x8, x8, x10
	asr	x0, x8, #2
	sub	x11, x0, #1
	ldr	x9, [x19, #112]
	and	x8, x11, x20
	ldrb	w12, [x9, x8]
	cbz	w12, LBB38_3
LBB38_1:                                ; =>This Inner Loop Header: Depth=1
	ldr	w12, [x10, x8, lsl #2]
	cmp	w12, w1
	b.eq	LBB38_8
; %bb.2:                                ;   in Loop: Header=BB38_1 Depth=1
	add	x8, x8, #1
	and	x8, x8, x11
	ldrb	w12, [x9, x8]
	cbnz	w12, LBB38_1
LBB38_3:
	ldr	x10, [x19, #160]
	add	x10, x10, #1
	mov	x11, #-3689348814741910324      ; =0xcccccccccccccccc
	movk	x11, #52429
	umulh	x11, x0, x11
	lsr	x11, x11, #3
	mov	w12, #10                        ; =0xa
	msub	w12, w11, w12, w0
	lsl	w13, w12, #3
	sub	w12, w13, w12
	and	w12, w12, #0xff
	mov	w13, #205                       ; =0xcd
	mul	w12, w12, w13
	lsl	x13, x11, #3
	lsr	w12, w12, #11
	sub	x11, x13, x11
	add	x11, x11, x12
	cmp	x10, x11
	b.ls	LBB38_10
; %bb.4:
	mov	x21, x1
	bl	__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEE7doubledEm
	mov	x1, x0
	mov	x0, x19
	bl	__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEE6rehashEm
	ldp	x10, x8, [x19, #16]
	sub	x8, x8, x10
	asr	x8, x8, #2
	sub	x11, x8, #1
	ldr	x9, [x19, #112]
	and	x8, x11, x20
	ldrb	w12, [x9, x8]
	cbz	w12, LBB38_9
; %bb.5:
	mov	x1, x21
LBB38_6:                                ; =>This Inner Loop Header: Depth=1
	ldr	w12, [x10, x8, lsl #2]
	cmp	w12, w1
	b.eq	LBB38_10
; %bb.7:                                ;   in Loop: Header=BB38_6 Depth=1
	add	x8, x8, #1
	and	x8, x8, x11
	ldrb	w12, [x9, x8]
	cbnz	w12, LBB38_6
	b	LBB38_10
LBB38_8:
	ldr	x9, [x19, #64]
	add	x0, x9, x8, lsl #4
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
LBB38_9:
	mov	x1, x21
LBB38_10:
	mov	w10, #1                         ; =0x1
	strb	w10, [x9, x8]
	ldr	x9, [x19, #16]
	str	w1, [x9, x8, lsl #2]
	ldr	x9, [x19, #64]
	add	x0, x9, x8, lsl #4
	stp	xzr, xzr, [x0]
	ldr	x8, [x19, #160]
	add	x8, x8, #1
	str	x8, [x19, #160]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEE6rehashEm ; -- Begin function _ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEE6rehashEm
	.weak_def_can_be_hidden	__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEE6rehashEm
	.p2align	2
__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEE6rehashEm: ; @_ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEE6rehashEm
Lfunc_begin16:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception16
; %bb.0:
	sub	sp, sp, #176
	stp	x20, x19, [sp, #144]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #160]            ; 16-byte Folded Spill
	add	x29, sp, #160
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x20, x1
	mov	x19, x0
	sub	x8, x29, #64
	mov	w1, #1                          ; =0x1
	bl	__ZN6vquery11make_bufferIjEENSt3__16vectorIT_NS_15BudgetAllocatorIS3_EEEERKNS1_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
Ltmp281:
	add	x8, sp, #48
	mov	x0, x19
	mov	w1, #1                          ; =0x1
	bl	__ZN6vquery11make_bufferINS_9AggregateEEENSt3__16vectorIT_NS_15BudgetAllocatorIS4_EEEERKNS2_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
Ltmp282:
; %bb.1:
Ltmp284:
	mov	x8, sp
	mov	x0, x19
	mov	w1, #1                          ; =0x1
	bl	__ZN6vquery11make_bufferIhEENSt3__16vectorIT_NS_15BudgetAllocatorIS3_EEEERKNS1_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
Ltmp285:
; %bb.2:
	ldp	x8, x9, [x29, #-64]
	sub	x9, x9, x8
	asr	x9, x9, #2
	subs	x1, x20, x9
	b.ls	LBB39_4
; %bb.3:
Ltmp287:
	sub	x0, x29, #64
	bl	__ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEE8__appendEm
Ltmp288:
	b	LBB39_6
LBB39_4:
	b.hs	LBB39_6
; %bb.5:
	add	x8, x8, x20, lsl #2
	stur	x8, [x29, #-56]
LBB39_6:
	ldp	x8, x9, [sp, #48]
	sub	x9, x9, x8
	asr	x9, x9, #4
	subs	x1, x20, x9
	b.ls	LBB39_8
; %bb.7:
Ltmp289:
	add	x0, sp, #48
	bl	__ZNSt3__16vectorIN6vquery9AggregateENS1_15BudgetAllocatorIS2_EEE8__appendEm
Ltmp290:
	b	LBB39_10
LBB39_8:
	b.hs	LBB39_10
; %bb.9:
	add	x8, x8, x20, lsl #4
	str	x8, [sp, #56]
LBB39_10:
	ldp	x8, x9, [sp]
	sub	x9, x9, x8
	subs	x1, x20, x9
	b.ls	LBB39_12
; %bb.11:
Ltmp291:
	mov	x0, sp
	bl	__ZNSt3__16vectorIhN6vquery15BudgetAllocatorIhEEE8__appendEm
Ltmp292:
	b	LBB39_14
LBB39_12:
	b.hs	LBB39_14
; %bb.13:
	add	x8, x8, x20
	str	x8, [sp, #8]
LBB39_14:
	ldp	x15, x14, [x19, #16]
	cmp	x14, x15
	b.eq	LBB39_21
; %bb.15:
	mov	x8, #0                          ; =0x0
	sub	x9, x20, #1
	mov	x10, #64915                     ; =0xfd93
	movk	x10, #26201, lsl #16
	movk	x10, #65208, lsl #32
	movk	x10, #55016, lsl #48
	mov	x11, #58809                     ; =0xe5b9
	movk	x11, #7396, lsl #16
	movk	x11, #18285, lsl #32
	movk	x11, #48984, lsl #48
	mov	x12, #4587                      ; =0x11eb
	movk	x12, #4913, lsl #16
	movk	x12, #18875, lsl #32
	movk	x12, #38096, lsl #48
	mov	w13, #1                         ; =0x1
	b	LBB39_17
LBB39_16:                               ;   in Loop: Header=BB39_17 Depth=1
	add	x8, x8, #1
	sub	x16, x14, x15
	cmp	x8, x16, asr #2
	b.hs	LBB39_21
LBB39_17:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB39_19 Depth 2
	ldr	x16, [x19, #112]
	ldrb	w16, [x16, x8]
	cbz	w16, LBB39_16
; %bb.18:                               ;   in Loop: Header=BB39_17 Depth=1
	ldr	w14, [x15, x8, lsl #2]
	ldr	x15, [x19, #64]
	eor	x16, x14, x10
	eor	x16, x16, x16, lsr #30
	mul	x16, x16, x11
	eor	x16, x16, x16, lsr #27
	mul	x16, x16, x12
	eor	x0, x16, x16, lsr #31
	ldr	x16, [sp]
LBB39_19:                               ;   Parent Loop BB39_17 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	and	x17, x0, x9
	ldrb	w1, [x16, x17]
	add	x0, x17, #1
	cbnz	w1, LBB39_19
; %bb.20:                               ;   in Loop: Header=BB39_17 Depth=1
	strb	w13, [x16, x17]
	ldur	x16, [x29, #-64]
	str	w14, [x16, x17, lsl #2]
	ldr	x14, [sp, #48]
	ldr	q0, [x15, x8, lsl #4]
	str	q0, [x14, x17, lsl #4]
	ldp	x15, x14, [x19, #16]
	b	LBB39_16
LBB39_21:
	ldp	q0, q1, [x29, #-64]
	stp	x15, x14, [x29, #-64]
	ldr	q2, [x19, #32]
	stp	q0, q1, [x19, #16]
	stur	q2, [x29, #-48]
	ldp	x8, x9, [x19, #48]
	ldp	x10, x11, [x29, #-32]
	stp	x10, x11, [x19, #48]
	stp	x8, x9, [x29, #-32]
	ldp	q0, q1, [sp, #48]
	ldp	q2, q3, [x19, #64]
	stp	q0, q1, [x19, #64]
	stp	q2, q3, [sp, #48]
	ldp	x8, x9, [x19, #96]
	ldp	x10, x11, [sp, #80]
	stp	x10, x11, [x19, #96]
	stp	x8, x9, [sp, #80]
	ldp	q1, q2, [sp]
	ldp	q3, q0, [x19, #112]
	stp	q1, q2, [x19, #112]
	stp	q3, q0, [sp]
	ldp	x20, x8, [x19, #144]
	ldp	x9, x10, [sp, #32]
	stp	x9, x10, [x19, #144]
	fmov	x0, d3
	stp	x20, x8, [sp, #32]
	cbz	x0, LBB39_23
; %bb.22:
	str	x0, [sp, #8]
	fmov	x8, d0
	sub	x19, x8, x0
	bl	__ZdlPv
	ldr	x0, [sp, #24]
	ldr	x2, [sp, #40]
	mov	x1, x19
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
	ldr	x20, [sp, #32]
LBB39_23:
	cbz	x20, LBB39_26
; %bb.24:
	add	x8, x20, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbnz	x8, LBB39_26
; %bb.25:
	ldr	x8, [x20]
	ldr	x8, [x8, #16]
	mov	x0, x20
	blr	x8
	mov	x0, x20
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
LBB39_26:
	ldr	x0, [sp, #48]
	cbz	x0, LBB39_28
; %bb.27:
	str	x0, [sp, #56]
	ldr	x8, [sp, #64]
	sub	x19, x8, x0
	bl	__ZdlPv
	ldr	x0, [sp, #72]
	ldr	x2, [sp, #88]
	mov	x1, x19
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
LBB39_28:
	ldr	x19, [sp, #80]
	cbz	x19, LBB39_31
; %bb.29:
	add	x8, x19, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbnz	x8, LBB39_31
; %bb.30:
	ldr	x8, [x19]
	ldr	x8, [x8, #16]
	mov	x0, x19
	blr	x8
	mov	x0, x19
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
LBB39_31:
	ldur	x0, [x29, #-64]
	cbz	x0, LBB39_33
; %bb.32:
	stur	x0, [x29, #-56]
	ldur	x8, [x29, #-48]
	sub	x19, x8, x0
	bl	__ZdlPv
	ldur	x0, [x29, #-40]
	ldur	x2, [x29, #-24]
	mov	x1, x19
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
LBB39_33:
	ldur	x19, [x29, #-32]
	cbz	x19, LBB39_35
; %bb.34:
	add	x8, x19, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbz	x8, LBB39_36
LBB39_35:
	ldp	x29, x30, [sp, #160]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #144]            ; 16-byte Folded Reload
	add	sp, sp, #176
	ret
LBB39_36:
	ldr	x8, [x19]
	ldr	x8, [x8, #16]
	mov	x0, x19
	blr	x8
	mov	x0, x19
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
	ldp	x29, x30, [sp, #160]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #144]            ; 16-byte Folded Reload
	add	sp, sp, #176
	ret
LBB39_37:
Ltmp286:
	mov	x19, x0
	add	x0, sp, #48
	bl	__ZNSt3__16vectorIN6vquery9AggregateENS1_15BudgetAllocatorIS2_EEED1B8ne200100Ev
	sub	x0, x29, #64
	bl	__ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEED1B8ne200100Ev
	mov	x0, x19
	bl	__Unwind_Resume
LBB39_38:
Ltmp283:
	mov	x19, x0
	sub	x0, x29, #64
	bl	__ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEED1B8ne200100Ev
	mov	x0, x19
	bl	__Unwind_Resume
LBB39_39:
Ltmp293:
	mov	x19, x0
	mov	x0, sp
	bl	__ZNSt3__16vectorIhN6vquery15BudgetAllocatorIhEEED1B8ne200100Ev
	add	x0, sp, #48
	bl	__ZNSt3__16vectorIN6vquery9AggregateENS1_15BudgetAllocatorIS2_EEED1B8ne200100Ev
	sub	x0, x29, #64
	bl	__ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEED1B8ne200100Ev
	mov	x0, x19
	bl	__Unwind_Resume
Lfunc_end16:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table39:
Lexception16:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end16-Lcst_begin16
Lcst_begin16:
	.uleb128 Lfunc_begin16-Lfunc_begin16    ; >> Call Site 1 <<
	.uleb128 Ltmp281-Lfunc_begin16          ;   Call between Lfunc_begin16 and Ltmp281
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp281-Lfunc_begin16          ; >> Call Site 2 <<
	.uleb128 Ltmp282-Ltmp281                ;   Call between Ltmp281 and Ltmp282
	.uleb128 Ltmp283-Lfunc_begin16          ;     jumps to Ltmp283
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp284-Lfunc_begin16          ; >> Call Site 3 <<
	.uleb128 Ltmp285-Ltmp284                ;   Call between Ltmp284 and Ltmp285
	.uleb128 Ltmp286-Lfunc_begin16          ;     jumps to Ltmp286
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp287-Lfunc_begin16          ; >> Call Site 4 <<
	.uleb128 Ltmp292-Ltmp287                ;   Call between Ltmp287 and Ltmp292
	.uleb128 Ltmp293-Lfunc_begin16          ;     jumps to Ltmp293
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp292-Lfunc_begin16          ; >> Call Site 5 <<
	.uleb128 Lfunc_end16-Ltmp292            ;   Call between Ltmp292 and Lfunc_end16
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end16:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEE7doubledEm ; -- Begin function _ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEE7doubledEm
	.weak_def_can_be_hidden	__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEE7doubledEm
	.p2align	2
__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEE7doubledEm: ; @_ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEE7doubledEm
Lfunc_begin17:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception17
; %bb.0:
	sub	sp, sp, #80
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	tbnz	x0, #63, LBB40_2
; %bb.1:
	lsl	x0, x0, #1
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB40_2:
	mov	w0, #24                         ; =0x18
	bl	___cxa_allocate_exception
	mov	x19, x0
Ltmp294:
Lloh102:
	adrp	x1, l_.str.7@PAGE
Lloh103:
	add	x1, x1, l_.str.7@PAGEOFF
	add	x0, sp, #8
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
Ltmp295:
; %bb.3:
	mov	w21, #1                         ; =0x1
Ltmp297:
	add	x1, sp, #8
	mov	x0, x19
	bl	__ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE
Ltmp298:
; %bb.4:
Lloh104:
	adrp	x8, __ZTVN6vquery5ErrorE@GOTPAGE
Lloh105:
	ldr	x8, [x8, __ZTVN6vquery5ErrorE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x19]
	mov	w8, #3                          ; =0x3
	str	w8, [x19, #16]
Ltmp299:
	mov	w21, #0                         ; =0x0
Lloh106:
	adrp	x1, __ZTIN6vquery5ErrorE@PAGE
Lloh107:
	add	x1, x1, __ZTIN6vquery5ErrorE@PAGEOFF
Lloh108:
	adrp	x2, __ZN6vquery5ErrorD1Ev@GOTPAGE
Lloh109:
	ldr	x2, [x2, __ZN6vquery5ErrorD1Ev@GOTPAGEOFF]
	mov	x0, x19
	bl	___cxa_throw
Ltmp300:
; %bb.5:
	brk	#0x1
LBB40_6:
Ltmp301:
	mov	x20, x0
	ldrsb	w8, [sp, #31]
	tbz	w8, #31, LBB40_8
; %bb.7:
	ldr	x0, [sp, #8]
	bl	__ZdlPv
	tbnz	w21, #0, LBB40_10
	b	LBB40_11
LBB40_8:
	cbnz	w21, LBB40_10
	b	LBB40_11
LBB40_9:
Ltmp296:
	mov	x20, x0
LBB40_10:
	mov	x0, x19
	bl	___cxa_free_exception
LBB40_11:
	mov	x0, x20
	bl	__Unwind_Resume
	.loh AdrpAdd	Lloh102, Lloh103
	.loh AdrpLdrGot	Lloh108, Lloh109
	.loh AdrpAdd	Lloh106, Lloh107
	.loh AdrpLdrGot	Lloh104, Lloh105
Lfunc_end17:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table40:
Lexception17:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end17-Lcst_begin17
Lcst_begin17:
	.uleb128 Lfunc_begin17-Lfunc_begin17    ; >> Call Site 1 <<
	.uleb128 Ltmp294-Lfunc_begin17          ;   Call between Lfunc_begin17 and Ltmp294
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp294-Lfunc_begin17          ; >> Call Site 2 <<
	.uleb128 Ltmp295-Ltmp294                ;   Call between Ltmp294 and Ltmp295
	.uleb128 Ltmp296-Lfunc_begin17          ;     jumps to Ltmp296
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp297-Lfunc_begin17          ; >> Call Site 3 <<
	.uleb128 Ltmp300-Ltmp297                ;   Call between Ltmp297 and Ltmp300
	.uleb128 Ltmp301-Lfunc_begin17          ;     jumps to Ltmp301
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp300-Lfunc_begin17          ; >> Call Site 4 <<
	.uleb128 Lfunc_end17-Ltmp300            ;   Call between Ltmp300 and Lfunc_end17
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end17:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN6vquery11make_bufferINS_9AggregateEEENSt3__16vectorIT_NS_15BudgetAllocatorIS4_EEEERKNS2_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE ; -- Begin function _ZN6vquery11make_bufferINS_9AggregateEEENSt3__16vectorIT_NS_15BudgetAllocatorIS4_EEEERKNS2_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
	.weak_def_can_be_hidden	__ZN6vquery11make_bufferINS_9AggregateEEENSt3__16vectorIT_NS_15BudgetAllocatorIS4_EEEERKNS2_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
	.p2align	2
__ZN6vquery11make_bufferINS_9AggregateEEENSt3__16vectorIT_NS_15BudgetAllocatorIS4_EEEERKNS2_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE: ; @_ZN6vquery11make_bufferINS_9AggregateEEENSt3__16vectorIT_NS_15BudgetAllocatorIS4_EEEERKNS2_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
Lfunc_begin18:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception18
; %bb.0:
	sub	sp, sp, #80
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x2, x1
	mov	x19, x8
	ldp	x9, x8, [x0]
	stp	x9, x8, [sp, #8]
	cbz	x8, LBB41_2
; %bb.1:
	add	x8, x8, #8
	mov	w9, #1                          ; =0x1
	ldadd	x9, x8, [x8]
LBB41_2:
Ltmp302:
	add	x0, sp, #24
	add	x1, sp, #8
	bl	__ZN6vquery15BudgetAllocatorINS_9AggregateEEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
Ltmp303:
; %bb.3:
	stp	xzr, xzr, [x19]
	ldp	x9, x8, [sp, #24]
	stp	xzr, x9, [x19, #16]
	str	x8, [x19, #32]
	cbz	x8, LBB41_7
; %bb.4:
	add	x8, x8, #8
	mov	w9, #1                          ; =0x1
	ldadd	x9, x8, [x8]
	ldp	x20, x8, [sp, #32]
	str	x8, [x19, #40]
	cbz	x20, LBB41_8
; %bb.5:
	add	x8, x20, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbnz	x8, LBB41_8
; %bb.6:
	ldr	x8, [x20]
	ldr	x8, [x8, #16]
	mov	x0, x20
	blr	x8
	mov	x0, x20
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
	b	LBB41_8
LBB41_7:
	ldr	x8, [sp, #40]
	str	x8, [x19, #40]
LBB41_8:
	ldr	x19, [sp, #16]
	cbz	x19, LBB41_10
; %bb.9:
	add	x8, x19, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbz	x8, LBB41_11
LBB41_10:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB41_11:
	ldr	x8, [x19]
	ldr	x8, [x8, #16]
	mov	x0, x19
	blr	x8
	mov	x0, x19
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB41_12:
Ltmp304:
	mov	x19, x0
	add	x0, sp, #8
	bl	__ZNSt3__110shared_ptrIN6vquery12MemoryBudgetEED1B8ne200100Ev
	mov	x0, x19
	bl	__Unwind_Resume
Lfunc_end18:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table41:
Lexception18:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end18-Lcst_begin18
Lcst_begin18:
	.uleb128 Ltmp302-Lfunc_begin18          ; >> Call Site 1 <<
	.uleb128 Ltmp303-Ltmp302                ;   Call between Ltmp302 and Ltmp303
	.uleb128 Ltmp304-Lfunc_begin18          ;     jumps to Ltmp304
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp303-Lfunc_begin18          ; >> Call Site 2 <<
	.uleb128 Lfunc_end18-Ltmp303            ;   Call between Ltmp303 and Lfunc_end18
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end18:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__16vectorIN6vquery9AggregateENS1_15BudgetAllocatorIS2_EEED1B8ne200100Ev ; -- Begin function _ZNSt3__16vectorIN6vquery9AggregateENS1_15BudgetAllocatorIS2_EEED1B8ne200100Ev
	.globl	__ZNSt3__16vectorIN6vquery9AggregateENS1_15BudgetAllocatorIS2_EEED1B8ne200100Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorIN6vquery9AggregateENS1_15BudgetAllocatorIS2_EEED1B8ne200100Ev
	.p2align	2
__ZNSt3__16vectorIN6vquery9AggregateENS1_15BudgetAllocatorIS2_EEED1B8ne200100Ev: ; @_ZNSt3__16vectorIN6vquery9AggregateENS1_15BudgetAllocatorIS2_EEED1B8ne200100Ev
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	ldr	x0, [x0]
	cbz	x0, LBB42_2
; %bb.1:
	str	x0, [x19, #8]
	ldr	x8, [x19, #16]
	sub	x20, x8, x0
	bl	__ZdlPv
	ldr	x0, [x19, #24]
	ldr	x2, [x19, #40]
	mov	x1, x20
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
LBB42_2:
	ldr	x20, [x19, #32]
	cbz	x20, LBB42_4
; %bb.3:
	add	x8, x20, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbz	x8, LBB42_5
LBB42_4:
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
LBB42_5:
	ldr	x8, [x20]
	ldr	x8, [x8, #16]
	mov	x0, x20
	blr	x8
	mov	x0, x20
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN6vquery15BudgetAllocatorINS_9AggregateEEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE ; -- Begin function _ZN6vquery15BudgetAllocatorINS_9AggregateEEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
	.weak_def_can_be_hidden	__ZN6vquery15BudgetAllocatorINS_9AggregateEEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
	.p2align	2
__ZN6vquery15BudgetAllocatorINS_9AggregateEEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE: ; @_ZN6vquery15BudgetAllocatorINS_9AggregateEEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
Lfunc_begin19:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception19
; %bb.0:
	sub	sp, sp, #80
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	ldr	q0, [x1]
	str	q0, [x0]
	stp	xzr, xzr, [x1]
	str	x2, [x0, #16]
	ldr	x8, [x0]
	cbz	x8, LBB43_2
; %bb.1:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB43_2:
	str	x0, [sp]                        ; 8-byte Folded Spill
	mov	w0, #24                         ; =0x18
	bl	___cxa_allocate_exception
	mov	x19, x0
Ltmp305:
Lloh110:
	adrp	x1, l_.str.4@PAGE
Lloh111:
	add	x1, x1, l_.str.4@PAGEOFF
	add	x0, sp, #8
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
Ltmp306:
; %bb.3:
	mov	w21, #1                         ; =0x1
Ltmp308:
	add	x1, sp, #8
	mov	x0, x19
	bl	__ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE
Ltmp309:
; %bb.4:
Lloh112:
	adrp	x8, __ZTVN6vquery5ErrorE@GOTPAGE
Lloh113:
	ldr	x8, [x8, __ZTVN6vquery5ErrorE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x19]
	str	wzr, [x19, #16]
Ltmp310:
	mov	w21, #0                         ; =0x0
Lloh114:
	adrp	x1, __ZTIN6vquery5ErrorE@PAGE
Lloh115:
	add	x1, x1, __ZTIN6vquery5ErrorE@PAGEOFF
Lloh116:
	adrp	x2, __ZN6vquery5ErrorD1Ev@GOTPAGE
Lloh117:
	ldr	x2, [x2, __ZN6vquery5ErrorD1Ev@GOTPAGEOFF]
	mov	x0, x19
	bl	___cxa_throw
Ltmp311:
; %bb.5:
	brk	#0x1
LBB43_6:
Ltmp312:
	mov	x20, x0
	ldrsb	w8, [sp, #31]
	tbz	w8, #31, LBB43_8
; %bb.7:
	ldr	x0, [sp, #8]
	bl	__ZdlPv
	tbnz	w21, #0, LBB43_10
	b	LBB43_11
LBB43_8:
	cbnz	w21, LBB43_10
	b	LBB43_11
LBB43_9:
Ltmp307:
	mov	x20, x0
LBB43_10:
	mov	x0, x19
	bl	___cxa_free_exception
LBB43_11:
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	bl	__ZNSt3__110shared_ptrIN6vquery12MemoryBudgetEED1B8ne200100Ev
	mov	x0, x20
	bl	__Unwind_Resume
	.loh AdrpAdd	Lloh110, Lloh111
	.loh AdrpLdrGot	Lloh116, Lloh117
	.loh AdrpAdd	Lloh114, Lloh115
	.loh AdrpLdrGot	Lloh112, Lloh113
Lfunc_end19:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table43:
Lexception19:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end19-Lcst_begin19
Lcst_begin19:
	.uleb128 Lfunc_begin19-Lfunc_begin19    ; >> Call Site 1 <<
	.uleb128 Ltmp305-Lfunc_begin19          ;   Call between Lfunc_begin19 and Ltmp305
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp305-Lfunc_begin19          ; >> Call Site 2 <<
	.uleb128 Ltmp306-Ltmp305                ;   Call between Ltmp305 and Ltmp306
	.uleb128 Ltmp307-Lfunc_begin19          ;     jumps to Ltmp307
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp308-Lfunc_begin19          ; >> Call Site 3 <<
	.uleb128 Ltmp311-Ltmp308                ;   Call between Ltmp308 and Ltmp311
	.uleb128 Ltmp312-Lfunc_begin19          ;     jumps to Ltmp312
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp311-Lfunc_begin19          ; >> Call Site 4 <<
	.uleb128 Lfunc_end19-Ltmp311            ;   Call between Ltmp311 and Lfunc_end19
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end19:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__16vectorIN6vquery9AggregateENS1_15BudgetAllocatorIS2_EEE8__appendEm ; -- Begin function _ZNSt3__16vectorIN6vquery9AggregateENS1_15BudgetAllocatorIS2_EEE8__appendEm
	.globl	__ZNSt3__16vectorIN6vquery9AggregateENS1_15BudgetAllocatorIS2_EEE8__appendEm
	.weak_def_can_be_hidden	__ZNSt3__16vectorIN6vquery9AggregateENS1_15BudgetAllocatorIS2_EEE8__appendEm
	.p2align	2
__ZNSt3__16vectorIN6vquery9AggregateENS1_15BudgetAllocatorIS2_EEE8__appendEm: ; @_ZNSt3__16vectorIN6vquery9AggregateENS1_15BudgetAllocatorIS2_EEE8__appendEm
	.cfi_startproc
; %bb.0:
	stp	x24, x23, [sp, #-64]!           ; 16-byte Folded Spill
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	mov	x19, x0
	ldp	x20, x8, [x0, #8]
	sub	x9, x8, x20
	cmp	x1, x9, asr #4
	b.ls	LBB44_4
; %bb.1:
	ldr	x9, [x19]
	sub	x10, x20, x9
	asr	x21, x10, #4
	add	x10, x21, x1
	lsr	x11, x10, #60
	cbnz	x11, LBB44_11
; %bb.2:
	mov	x11, #9223372036854775792       ; =0x7ffffffffffffff0
	sub	x8, x8, x9
	asr	x9, x8, #3
	cmp	x9, x10
	csel	x9, x9, x10, hi
	cmp	x8, x11
	mov	x8, #1152921504606846975        ; =0xfffffffffffffff
	csel	x20, x9, x8, lo
	cbz	x20, LBB44_7
; %bb.3:
	add	x0, x19, #24
	mov	x22, x1
	mov	x1, x20
	bl	__ZN6vquery15BudgetAllocatorINS_9AggregateEE8allocateEm
	mov	x1, x22
	b	LBB44_8
LBB44_4:
	cbz	x1, LBB44_6
; %bb.5:
	lsl	x21, x1, #4
	mov	x0, x20
	mov	x1, x21
	bl	_bzero
	add	x20, x20, x21
LBB44_6:
	str	x20, [x19, #8]
	b	LBB44_10
LBB44_7:
	mov	x0, #0                          ; =0x0
LBB44_8:
	add	x21, x0, x21, lsl #4
	lsl	x22, x1, #4
	add	x23, x0, x20, lsl #4
	mov	x0, x21
	mov	x1, x22
	bl	_bzero
	add	x22, x21, x22
	ldp	x1, x8, [x19]
	sub	x2, x8, x1
	sub	x20, x21, x2
	mov	x0, x20
	bl	_memcpy
	ldr	x0, [x19]
	stp	x20, x22, [x19]
	ldr	x8, [x19, #16]
	str	x23, [x19, #16]
	cbz	x0, LBB44_10
; %bb.9:
	sub	x20, x8, x0
	bl	__ZdlPv
	ldr	x0, [x19, #24]
	ldr	x2, [x19, #40]
	mov	x1, x20
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	b	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
LBB44_10:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
LBB44_11:
	bl	__ZNSt3__16vectorIN6vquery9AggregateENS1_15BudgetAllocatorIS2_EEE20__throw_length_errorB8ne200100Ev
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIN6vquery9AggregateENS1_15BudgetAllocatorIS2_EEE20__throw_length_errorB8ne200100Ev ; -- Begin function _ZNSt3__16vectorIN6vquery9AggregateENS1_15BudgetAllocatorIS2_EEE20__throw_length_errorB8ne200100Ev
	.globl	__ZNSt3__16vectorIN6vquery9AggregateENS1_15BudgetAllocatorIS2_EEE20__throw_length_errorB8ne200100Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorIN6vquery9AggregateENS1_15BudgetAllocatorIS2_EEE20__throw_length_errorB8ne200100Ev
	.p2align	2
__ZNSt3__16vectorIN6vquery9AggregateENS1_15BudgetAllocatorIS2_EEE20__throw_length_errorB8ne200100Ev: ; @_ZNSt3__16vectorIN6vquery9AggregateENS1_15BudgetAllocatorIS2_EEE20__throw_length_errorB8ne200100Ev
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh118:
	adrp	x0, l_.str.5@PAGE
Lloh119:
	add	x0, x0, l_.str.5@PAGEOFF
	bl	__ZNSt3__120__throw_length_errorB8ne200100EPKc
	.loh AdrpAdd	Lloh118, Lloh119
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN6vquery15BudgetAllocatorINS_9AggregateEE8allocateEm ; -- Begin function _ZN6vquery15BudgetAllocatorINS_9AggregateEE8allocateEm
	.weak_def_can_be_hidden	__ZN6vquery15BudgetAllocatorINS_9AggregateEE8allocateEm
	.p2align	2
__ZN6vquery15BudgetAllocatorINS_9AggregateEE8allocateEm: ; @_ZN6vquery15BudgetAllocatorINS_9AggregateEE8allocateEm
Lfunc_begin20:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception20
; %bb.0:
	sub	sp, sp, #80
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	lsr	x8, x1, #60
	cbnz	x8, LBB46_3
; %bb.1:
	mov	x19, x0
	lsl	x20, x1, #4
	ldr	x0, [x0]
	ldr	x2, [x19, #16]
	mov	x1, x20
	bl	__ZN6vquery12MemoryBudget7reserveEmNS_14MemoryCategoryE
Ltmp313:
	mov	x0, x20
	bl	__Znwm
Ltmp314:
; %bb.2:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB46_3:
	mov	w0, #24                         ; =0x18
	bl	___cxa_allocate_exception
	mov	x19, x0
Ltmp322:
Lloh120:
	adrp	x1, l_.str.6@PAGE
Lloh121:
	add	x1, x1, l_.str.6@PAGEOFF
	add	x0, sp, #8
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
Ltmp323:
; %bb.4:
	mov	w21, #1                         ; =0x1
Ltmp325:
	add	x1, sp, #8
	mov	x0, x19
	bl	__ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE
Ltmp326:
; %bb.5:
Lloh122:
	adrp	x8, __ZTVN6vquery5ErrorE@GOTPAGE
Lloh123:
	ldr	x8, [x8, __ZTVN6vquery5ErrorE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x19]
	mov	w8, #3                          ; =0x3
	str	w8, [x19, #16]
Ltmp327:
	mov	w21, #0                         ; =0x0
Lloh124:
	adrp	x1, __ZTIN6vquery5ErrorE@PAGE
Lloh125:
	add	x1, x1, __ZTIN6vquery5ErrorE@PAGEOFF
Lloh126:
	adrp	x2, __ZN6vquery5ErrorD1Ev@GOTPAGE
Lloh127:
	ldr	x2, [x2, __ZN6vquery5ErrorD1Ev@GOTPAGEOFF]
	mov	x0, x19
	bl	___cxa_throw
Ltmp328:
	b	LBB46_12
LBB46_6:
Ltmp329:
	mov	x20, x0
	ldrsb	w8, [sp, #31]
	tbz	w8, #31, LBB46_8
; %bb.7:
	ldr	x0, [sp, #8]
	bl	__ZdlPv
	tbnz	w21, #0, LBB46_10
	b	LBB46_14
LBB46_8:
	cbnz	w21, LBB46_10
	b	LBB46_14
LBB46_9:
Ltmp324:
	mov	x20, x0
LBB46_10:
	mov	x0, x19
	bl	___cxa_free_exception
	mov	x0, x20
	bl	__Unwind_Resume
LBB46_11:
Ltmp315:
	bl	___cxa_begin_catch
	ldr	x0, [x19]
	ldr	x2, [x19, #16]
	mov	x1, x20
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
Ltmp316:
	bl	___cxa_rethrow
Ltmp317:
LBB46_12:
	brk	#0x1
LBB46_13:
Ltmp318:
	mov	x20, x0
Ltmp319:
	bl	___cxa_end_catch
Ltmp320:
LBB46_14:
	mov	x0, x20
	bl	__Unwind_Resume
LBB46_15:
Ltmp321:
	bl	___clang_call_terminate
	.loh AdrpAdd	Lloh120, Lloh121
	.loh AdrpLdrGot	Lloh126, Lloh127
	.loh AdrpAdd	Lloh124, Lloh125
	.loh AdrpLdrGot	Lloh122, Lloh123
Lfunc_end20:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table46:
Lexception20:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase3-Lttbaseref3
Lttbaseref3:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end20-Lcst_begin20
Lcst_begin20:
	.uleb128 Lfunc_begin20-Lfunc_begin20    ; >> Call Site 1 <<
	.uleb128 Ltmp313-Lfunc_begin20          ;   Call between Lfunc_begin20 and Ltmp313
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp313-Lfunc_begin20          ; >> Call Site 2 <<
	.uleb128 Ltmp314-Ltmp313                ;   Call between Ltmp313 and Ltmp314
	.uleb128 Ltmp315-Lfunc_begin20          ;     jumps to Ltmp315
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp314-Lfunc_begin20          ; >> Call Site 3 <<
	.uleb128 Ltmp322-Ltmp314                ;   Call between Ltmp314 and Ltmp322
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp322-Lfunc_begin20          ; >> Call Site 4 <<
	.uleb128 Ltmp323-Ltmp322                ;   Call between Ltmp322 and Ltmp323
	.uleb128 Ltmp324-Lfunc_begin20          ;     jumps to Ltmp324
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp325-Lfunc_begin20          ; >> Call Site 5 <<
	.uleb128 Ltmp328-Ltmp325                ;   Call between Ltmp325 and Ltmp328
	.uleb128 Ltmp329-Lfunc_begin20          ;     jumps to Ltmp329
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp328-Lfunc_begin20          ; >> Call Site 6 <<
	.uleb128 Ltmp316-Ltmp328                ;   Call between Ltmp328 and Ltmp316
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp316-Lfunc_begin20          ; >> Call Site 7 <<
	.uleb128 Ltmp317-Ltmp316                ;   Call between Ltmp316 and Ltmp317
	.uleb128 Ltmp318-Lfunc_begin20          ;     jumps to Ltmp318
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp319-Lfunc_begin20          ; >> Call Site 8 <<
	.uleb128 Ltmp320-Ltmp319                ;   Call between Ltmp319 and Ltmp320
	.uleb128 Ltmp321-Lfunc_begin20          ;     jumps to Ltmp321
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp320-Lfunc_begin20          ; >> Call Site 9 <<
	.uleb128 Lfunc_end20-Ltmp320            ;   Call between Ltmp320 and Lfunc_end20
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end20:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2, 0x0
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase3:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN6vquery11make_bufferINS_9ResultRowEEENSt3__16vectorIT_NS_15BudgetAllocatorIS4_EEEERKNS2_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE ; -- Begin function _ZN6vquery11make_bufferINS_9ResultRowEEENSt3__16vectorIT_NS_15BudgetAllocatorIS4_EEEERKNS2_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
	.weak_def_can_be_hidden	__ZN6vquery11make_bufferINS_9ResultRowEEENSt3__16vectorIT_NS_15BudgetAllocatorIS4_EEEERKNS2_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
	.p2align	2
__ZN6vquery11make_bufferINS_9ResultRowEEENSt3__16vectorIT_NS_15BudgetAllocatorIS4_EEEERKNS2_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE: ; @_ZN6vquery11make_bufferINS_9ResultRowEEENSt3__16vectorIT_NS_15BudgetAllocatorIS4_EEEERKNS2_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
Lfunc_begin21:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception21
; %bb.0:
	sub	sp, sp, #80
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x2, x1
	mov	x19, x8
	ldp	x9, x8, [x0]
	stp	x9, x8, [sp, #8]
	cbz	x8, LBB47_2
; %bb.1:
	add	x8, x8, #8
	mov	w9, #1                          ; =0x1
	ldadd	x9, x8, [x8]
LBB47_2:
Ltmp330:
	add	x0, sp, #24
	add	x1, sp, #8
	bl	__ZN6vquery15BudgetAllocatorINS_9ResultRowEEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
Ltmp331:
; %bb.3:
	stp	xzr, xzr, [x19]
	ldp	x9, x8, [sp, #24]
	stp	xzr, x9, [x19, #16]
	str	x8, [x19, #32]
	cbz	x8, LBB47_7
; %bb.4:
	add	x8, x8, #8
	mov	w9, #1                          ; =0x1
	ldadd	x9, x8, [x8]
	ldp	x20, x8, [sp, #32]
	str	x8, [x19, #40]
	cbz	x20, LBB47_8
; %bb.5:
	add	x8, x20, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbnz	x8, LBB47_8
; %bb.6:
	ldr	x8, [x20]
	ldr	x8, [x8, #16]
	mov	x0, x20
	blr	x8
	mov	x0, x20
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
	b	LBB47_8
LBB47_7:
	ldr	x8, [sp, #40]
	str	x8, [x19, #40]
LBB47_8:
	ldr	x19, [sp, #16]
	cbz	x19, LBB47_10
; %bb.9:
	add	x8, x19, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbz	x8, LBB47_11
LBB47_10:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB47_11:
	ldr	x8, [x19]
	ldr	x8, [x8, #16]
	mov	x0, x19
	blr	x8
	mov	x0, x19
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB47_12:
Ltmp332:
	mov	x19, x0
	add	x0, sp, #8
	bl	__ZNSt3__110shared_ptrIN6vquery12MemoryBudgetEED1B8ne200100Ev
	mov	x0, x19
	bl	__Unwind_Resume
Lfunc_end21:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table47:
Lexception21:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end21-Lcst_begin21
Lcst_begin21:
	.uleb128 Ltmp330-Lfunc_begin21          ; >> Call Site 1 <<
	.uleb128 Ltmp331-Ltmp330                ;   Call between Ltmp330 and Ltmp331
	.uleb128 Ltmp332-Lfunc_begin21          ;     jumps to Ltmp332
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp331-Lfunc_begin21          ; >> Call Site 2 <<
	.uleb128 Lfunc_end21-Ltmp331            ;   Call between Ltmp331 and Lfunc_end21
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end21:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__16vectorIN6vquery9ResultRowENS1_15BudgetAllocatorIS2_EEE9push_backB8ne200100EOS2_ ; -- Begin function _ZNSt3__16vectorIN6vquery9ResultRowENS1_15BudgetAllocatorIS2_EEE9push_backB8ne200100EOS2_
	.globl	__ZNSt3__16vectorIN6vquery9ResultRowENS1_15BudgetAllocatorIS2_EEE9push_backB8ne200100EOS2_
	.weak_def_can_be_hidden	__ZNSt3__16vectorIN6vquery9ResultRowENS1_15BudgetAllocatorIS2_EEE9push_backB8ne200100EOS2_
	.p2align	2
__ZNSt3__16vectorIN6vquery9ResultRowENS1_15BudgetAllocatorIS2_EEE9push_backB8ne200100EOS2_: ; @_ZNSt3__16vectorIN6vquery9ResultRowENS1_15BudgetAllocatorIS2_EEE9push_backB8ne200100EOS2_
	.cfi_startproc
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x19, x0
	ldp	x10, x9, [x0, #8]
	cmp	x10, x9
	b.hs	LBB48_3
; %bb.1:
	ldr	q0, [x1]
	ldr	x8, [x1, #16]
	str	x8, [x10, #16]
	str	q0, [x10]
	add	x21, x10, #24
LBB48_2:
	str	x21, [x19, #8]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
LBB48_3:
	mov	x8, #-6148914691236517206       ; =0xaaaaaaaaaaaaaaaa
	movk	x8, #2730, lsl #48
	ldr	x11, [x19]
	sub	x10, x10, x11
	asr	x10, x10, #3
	mov	x12, #-6148914691236517206      ; =0xaaaaaaaaaaaaaaaa
	movk	x12, #43691
	mul	x21, x10, x12
	add	x10, x21, #1
	cmp	x10, x8
	b.hi	LBB48_9
; %bb.4:
	sub	x9, x9, x11
	asr	x9, x9, #3
	mul	x9, x9, x12
	lsl	x11, x9, #1
	cmp	x11, x10
	csel	x10, x11, x10, hi
	mov	x11, #6148914691236517205       ; =0x5555555555555555
	movk	x11, #1365, lsl #48
	cmp	x9, x11
	csel	x20, x10, x8, lo
	cbz	x20, LBB48_6
; %bb.5:
	add	x0, x19, #24
	mov	x22, x1
	mov	x1, x20
	bl	__ZN6vquery15BudgetAllocatorINS_9ResultRowEE8allocateEm
	mov	x1, x22
	b	LBB48_7
LBB48_6:
	mov	x0, #0                          ; =0x0
LBB48_7:
	mov	w8, #24                         ; =0x18
	madd	x9, x21, x8, x0
	madd	x22, x20, x8, x0
	ldr	q0, [x1]
	ldr	x8, [x1, #16]
	str	x8, [x9, #16]
	str	q0, [x9]
	add	x21, x9, #24
	ldp	x1, x8, [x19]
	sub	x2, x8, x1
	sub	x20, x9, x2
	mov	x0, x20
	bl	_memcpy
	ldr	x0, [x19]
	stp	x20, x21, [x19]
	ldr	x8, [x19, #16]
	str	x22, [x19, #16]
	cbz	x0, LBB48_2
; %bb.8:
	sub	x20, x8, x0
	bl	__ZdlPv
	ldr	x0, [x19, #24]
	ldr	x2, [x19, #40]
	mov	x1, x20
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
	str	x21, [x19, #8]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
LBB48_9:
	bl	__ZNSt3__16vectorIN6vquery9ResultRowENS1_15BudgetAllocatorIS2_EEE20__throw_length_errorB8ne200100Ev
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN6vquery11QueryResultD1Ev    ; -- Begin function _ZN6vquery11QueryResultD1Ev
	.weak_def_can_be_hidden	__ZN6vquery11QueryResultD1Ev
	.p2align	2
__ZN6vquery11QueryResultD1Ev:           ; @_ZN6vquery11QueryResultD1Ev
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	ldr	x0, [x0, #8]
	cbz	x0, LBB49_2
; %bb.1:
	str	x0, [x19, #16]
	ldr	x8, [x19, #24]
	sub	x20, x8, x0
	bl	__ZdlPv
	ldr	x0, [x19, #32]
	ldr	x2, [x19, #48]
	mov	x1, x20
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
LBB49_2:
	ldr	x20, [x19, #40]
	cbz	x20, LBB49_4
; %bb.3:
	add	x8, x20, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbz	x8, LBB49_5
LBB49_4:
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
LBB49_5:
	ldr	x8, [x20]
	ldr	x8, [x8, #16]
	mov	x0, x20
	blr	x8
	mov	x0, x20
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN6vquery15BudgetAllocatorINS_9ResultRowEEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE ; -- Begin function _ZN6vquery15BudgetAllocatorINS_9ResultRowEEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
	.weak_def_can_be_hidden	__ZN6vquery15BudgetAllocatorINS_9ResultRowEEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
	.p2align	2
__ZN6vquery15BudgetAllocatorINS_9ResultRowEEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE: ; @_ZN6vquery15BudgetAllocatorINS_9ResultRowEEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
Lfunc_begin22:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception22
; %bb.0:
	sub	sp, sp, #80
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	ldr	q0, [x1]
	str	q0, [x0]
	stp	xzr, xzr, [x1]
	str	x2, [x0, #16]
	ldr	x8, [x0]
	cbz	x8, LBB50_2
; %bb.1:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB50_2:
	str	x0, [sp]                        ; 8-byte Folded Spill
	mov	w0, #24                         ; =0x18
	bl	___cxa_allocate_exception
	mov	x19, x0
Ltmp333:
Lloh128:
	adrp	x1, l_.str.4@PAGE
Lloh129:
	add	x1, x1, l_.str.4@PAGEOFF
	add	x0, sp, #8
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
Ltmp334:
; %bb.3:
	mov	w21, #1                         ; =0x1
Ltmp336:
	add	x1, sp, #8
	mov	x0, x19
	bl	__ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE
Ltmp337:
; %bb.4:
Lloh130:
	adrp	x8, __ZTVN6vquery5ErrorE@GOTPAGE
Lloh131:
	ldr	x8, [x8, __ZTVN6vquery5ErrorE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x19]
	str	wzr, [x19, #16]
Ltmp338:
	mov	w21, #0                         ; =0x0
Lloh132:
	adrp	x1, __ZTIN6vquery5ErrorE@PAGE
Lloh133:
	add	x1, x1, __ZTIN6vquery5ErrorE@PAGEOFF
Lloh134:
	adrp	x2, __ZN6vquery5ErrorD1Ev@GOTPAGE
Lloh135:
	ldr	x2, [x2, __ZN6vquery5ErrorD1Ev@GOTPAGEOFF]
	mov	x0, x19
	bl	___cxa_throw
Ltmp339:
; %bb.5:
	brk	#0x1
LBB50_6:
Ltmp340:
	mov	x20, x0
	ldrsb	w8, [sp, #31]
	tbz	w8, #31, LBB50_8
; %bb.7:
	ldr	x0, [sp, #8]
	bl	__ZdlPv
	tbnz	w21, #0, LBB50_10
	b	LBB50_11
LBB50_8:
	cbnz	w21, LBB50_10
	b	LBB50_11
LBB50_9:
Ltmp335:
	mov	x20, x0
LBB50_10:
	mov	x0, x19
	bl	___cxa_free_exception
LBB50_11:
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	bl	__ZNSt3__110shared_ptrIN6vquery12MemoryBudgetEED1B8ne200100Ev
	mov	x0, x20
	bl	__Unwind_Resume
	.loh AdrpAdd	Lloh128, Lloh129
	.loh AdrpLdrGot	Lloh134, Lloh135
	.loh AdrpAdd	Lloh132, Lloh133
	.loh AdrpLdrGot	Lloh130, Lloh131
Lfunc_end22:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table50:
Lexception22:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end22-Lcst_begin22
Lcst_begin22:
	.uleb128 Lfunc_begin22-Lfunc_begin22    ; >> Call Site 1 <<
	.uleb128 Ltmp333-Lfunc_begin22          ;   Call between Lfunc_begin22 and Ltmp333
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp333-Lfunc_begin22          ; >> Call Site 2 <<
	.uleb128 Ltmp334-Ltmp333                ;   Call between Ltmp333 and Ltmp334
	.uleb128 Ltmp335-Lfunc_begin22          ;     jumps to Ltmp335
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp336-Lfunc_begin22          ; >> Call Site 3 <<
	.uleb128 Ltmp339-Ltmp336                ;   Call between Ltmp336 and Ltmp339
	.uleb128 Ltmp340-Lfunc_begin22          ;     jumps to Ltmp340
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp339-Lfunc_begin22          ; >> Call Site 4 <<
	.uleb128 Lfunc_end22-Ltmp339            ;   Call between Ltmp339 and Lfunc_end22
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end22:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__16vectorIN6vquery9ResultRowENS1_15BudgetAllocatorIS2_EEE20__throw_length_errorB8ne200100Ev ; -- Begin function _ZNSt3__16vectorIN6vquery9ResultRowENS1_15BudgetAllocatorIS2_EEE20__throw_length_errorB8ne200100Ev
	.globl	__ZNSt3__16vectorIN6vquery9ResultRowENS1_15BudgetAllocatorIS2_EEE20__throw_length_errorB8ne200100Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorIN6vquery9ResultRowENS1_15BudgetAllocatorIS2_EEE20__throw_length_errorB8ne200100Ev
	.p2align	2
__ZNSt3__16vectorIN6vquery9ResultRowENS1_15BudgetAllocatorIS2_EEE20__throw_length_errorB8ne200100Ev: ; @_ZNSt3__16vectorIN6vquery9ResultRowENS1_15BudgetAllocatorIS2_EEE20__throw_length_errorB8ne200100Ev
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh136:
	adrp	x0, l_.str.5@PAGE
Lloh137:
	add	x0, x0, l_.str.5@PAGEOFF
	bl	__ZNSt3__120__throw_length_errorB8ne200100EPKc
	.loh AdrpAdd	Lloh136, Lloh137
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN6vquery15BudgetAllocatorINS_9ResultRowEE8allocateEm ; -- Begin function _ZN6vquery15BudgetAllocatorINS_9ResultRowEE8allocateEm
	.weak_def_can_be_hidden	__ZN6vquery15BudgetAllocatorINS_9ResultRowEE8allocateEm
	.p2align	2
__ZN6vquery15BudgetAllocatorINS_9ResultRowEE8allocateEm: ; @_ZN6vquery15BudgetAllocatorINS_9ResultRowEE8allocateEm
Lfunc_begin23:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception23
; %bb.0:
	sub	sp, sp, #80
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x8, #-6148914691236517206       ; =0xaaaaaaaaaaaaaaaa
	movk	x8, #43691
	movk	x8, #2730, lsl #48
	cmp	x1, x8
	b.hs	LBB52_3
; %bb.1:
	mov	x19, x0
	add	x8, x1, x1, lsl #1
	lsl	x20, x8, #3
	ldr	x0, [x0]
	ldr	x2, [x19, #16]
	mov	x1, x20
	bl	__ZN6vquery12MemoryBudget7reserveEmNS_14MemoryCategoryE
Ltmp341:
	mov	x0, x20
	bl	__Znwm
Ltmp342:
; %bb.2:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB52_3:
	mov	w0, #24                         ; =0x18
	bl	___cxa_allocate_exception
	mov	x19, x0
Ltmp350:
Lloh138:
	adrp	x1, l_.str.6@PAGE
Lloh139:
	add	x1, x1, l_.str.6@PAGEOFF
	add	x0, sp, #8
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
Ltmp351:
; %bb.4:
	mov	w21, #1                         ; =0x1
Ltmp353:
	add	x1, sp, #8
	mov	x0, x19
	bl	__ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE
Ltmp354:
; %bb.5:
Lloh140:
	adrp	x8, __ZTVN6vquery5ErrorE@GOTPAGE
Lloh141:
	ldr	x8, [x8, __ZTVN6vquery5ErrorE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x19]
	mov	w8, #3                          ; =0x3
	str	w8, [x19, #16]
Ltmp355:
	mov	w21, #0                         ; =0x0
Lloh142:
	adrp	x1, __ZTIN6vquery5ErrorE@PAGE
Lloh143:
	add	x1, x1, __ZTIN6vquery5ErrorE@PAGEOFF
Lloh144:
	adrp	x2, __ZN6vquery5ErrorD1Ev@GOTPAGE
Lloh145:
	ldr	x2, [x2, __ZN6vquery5ErrorD1Ev@GOTPAGEOFF]
	mov	x0, x19
	bl	___cxa_throw
Ltmp356:
	b	LBB52_12
LBB52_6:
Ltmp357:
	mov	x20, x0
	ldrsb	w8, [sp, #31]
	tbz	w8, #31, LBB52_8
; %bb.7:
	ldr	x0, [sp, #8]
	bl	__ZdlPv
	tbnz	w21, #0, LBB52_10
	b	LBB52_14
LBB52_8:
	cbnz	w21, LBB52_10
	b	LBB52_14
LBB52_9:
Ltmp352:
	mov	x20, x0
LBB52_10:
	mov	x0, x19
	bl	___cxa_free_exception
	mov	x0, x20
	bl	__Unwind_Resume
LBB52_11:
Ltmp343:
	bl	___cxa_begin_catch
	ldr	x0, [x19]
	ldr	x2, [x19, #16]
	mov	x1, x20
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
Ltmp344:
	bl	___cxa_rethrow
Ltmp345:
LBB52_12:
	brk	#0x1
LBB52_13:
Ltmp346:
	mov	x20, x0
Ltmp347:
	bl	___cxa_end_catch
Ltmp348:
LBB52_14:
	mov	x0, x20
	bl	__Unwind_Resume
LBB52_15:
Ltmp349:
	bl	___clang_call_terminate
	.loh AdrpAdd	Lloh138, Lloh139
	.loh AdrpLdrGot	Lloh144, Lloh145
	.loh AdrpAdd	Lloh142, Lloh143
	.loh AdrpLdrGot	Lloh140, Lloh141
Lfunc_end23:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table52:
Lexception23:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase4-Lttbaseref4
Lttbaseref4:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end23-Lcst_begin23
Lcst_begin23:
	.uleb128 Lfunc_begin23-Lfunc_begin23    ; >> Call Site 1 <<
	.uleb128 Ltmp341-Lfunc_begin23          ;   Call between Lfunc_begin23 and Ltmp341
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp341-Lfunc_begin23          ; >> Call Site 2 <<
	.uleb128 Ltmp342-Ltmp341                ;   Call between Ltmp341 and Ltmp342
	.uleb128 Ltmp343-Lfunc_begin23          ;     jumps to Ltmp343
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp342-Lfunc_begin23          ; >> Call Site 3 <<
	.uleb128 Ltmp350-Ltmp342                ;   Call between Ltmp342 and Ltmp350
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp350-Lfunc_begin23          ; >> Call Site 4 <<
	.uleb128 Ltmp351-Ltmp350                ;   Call between Ltmp350 and Ltmp351
	.uleb128 Ltmp352-Lfunc_begin23          ;     jumps to Ltmp352
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp353-Lfunc_begin23          ; >> Call Site 5 <<
	.uleb128 Ltmp356-Ltmp353                ;   Call between Ltmp353 and Ltmp356
	.uleb128 Ltmp357-Lfunc_begin23          ;     jumps to Ltmp357
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp356-Lfunc_begin23          ; >> Call Site 6 <<
	.uleb128 Ltmp344-Ltmp356                ;   Call between Ltmp356 and Ltmp344
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp344-Lfunc_begin23          ; >> Call Site 7 <<
	.uleb128 Ltmp345-Ltmp344                ;   Call between Ltmp344 and Ltmp345
	.uleb128 Ltmp346-Lfunc_begin23          ;     jumps to Ltmp346
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp347-Lfunc_begin23          ; >> Call Site 8 <<
	.uleb128 Ltmp348-Ltmp347                ;   Call between Ltmp347 and Ltmp348
	.uleb128 Ltmp349-Lfunc_begin23          ;     jumps to Ltmp349
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp348-Lfunc_begin23          ; >> Call Site 9 <<
	.uleb128 Lfunc_end23-Ltmp348            ;   Call between Ltmp348 and Lfunc_end23
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end23:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2, 0x0
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase4:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__16vectorINS_7jthreadENS_9allocatorIS1_EEE20__throw_length_errorB8ne200100Ev ; -- Begin function _ZNSt3__16vectorINS_7jthreadENS_9allocatorIS1_EEE20__throw_length_errorB8ne200100Ev
	.globl	__ZNSt3__16vectorINS_7jthreadENS_9allocatorIS1_EEE20__throw_length_errorB8ne200100Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorINS_7jthreadENS_9allocatorIS1_EEE20__throw_length_errorB8ne200100Ev
	.p2align	2
__ZNSt3__16vectorINS_7jthreadENS_9allocatorIS1_EEE20__throw_length_errorB8ne200100Ev: ; @_ZNSt3__16vectorINS_7jthreadENS_9allocatorIS1_EEE20__throw_length_errorB8ne200100Ev
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh146:
	adrp	x0, l_.str.5@PAGE
Lloh147:
	add	x0, x0, l_.str.5@PAGEOFF
	bl	__ZNSt3__120__throw_length_errorB8ne200100EPKc
	.loh AdrpAdd	Lloh146, Lloh147
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__114__split_bufferINS_7jthreadERNS_9allocatorIS1_EEED1Ev ; -- Begin function _ZNSt3__114__split_bufferINS_7jthreadERNS_9allocatorIS1_EEED1Ev
	.globl	__ZNSt3__114__split_bufferINS_7jthreadERNS_9allocatorIS1_EEED1Ev
	.weak_def_can_be_hidden	__ZNSt3__114__split_bufferINS_7jthreadERNS_9allocatorIS1_EEED1Ev
	.p2align	2
__ZNSt3__114__split_bufferINS_7jthreadERNS_9allocatorIS1_EEED1Ev: ; @_ZNSt3__114__split_bufferINS_7jthreadERNS_9allocatorIS1_EEED1Ev
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	ldr	x1, [x0, #8]
	bl	__ZNSt3__114__split_bufferINS_7jthreadERNS_9allocatorIS1_EEE17__destruct_at_endB8ne200100EPS1_
	ldr	x0, [x19]
	cbz	x0, LBB54_2
; %bb.1:
	bl	__ZdlPv
LBB54_2:
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__134__uninitialized_allocator_relocateB8ne200100INS_9allocatorINS_7jthreadEEEPS2_EEvRT_T0_S7_S7_ ; -- Begin function _ZNSt3__134__uninitialized_allocator_relocateB8ne200100INS_9allocatorINS_7jthreadEEEPS2_EEvRT_T0_S7_S7_
	.globl	__ZNSt3__134__uninitialized_allocator_relocateB8ne200100INS_9allocatorINS_7jthreadEEEPS2_EEvRT_T0_S7_S7_
	.weak_def_can_be_hidden	__ZNSt3__134__uninitialized_allocator_relocateB8ne200100INS_9allocatorINS_7jthreadEEEPS2_EEvRT_T0_S7_S7_
	.p2align	2
__ZNSt3__134__uninitialized_allocator_relocateB8ne200100INS_9allocatorINS_7jthreadEEEPS2_EEvRT_T0_S7_S7_: ; @_ZNSt3__134__uninitialized_allocator_relocateB8ne200100INS_9allocatorINS_7jthreadEEEPS2_EEvRT_T0_S7_S7_
Lfunc_begin24:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception24
; %bb.0:
	sub	sp, sp, #112
	stp	x24, x23, [sp, #48]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #64]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #80]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	str	x3, [sp, #32]
	add	x8, sp, #32
	stp	x0, x8, [sp]
	add	x8, sp, #40
	str	x8, [sp, #16]
	cmp	x1, x2
	b.eq	LBB55_16
; %bb.1:
	mov	x19, x2
	mov	x20, x1
	sub	x8, x2, x1
	sub	x8, x8, #16
	cmp	x8, #144
	b.hs	LBB55_17
LBB55_2:
	mov	x8, x20
	mov	x9, x3
LBB55_3:                                ; =>This Inner Loop Header: Depth=1
	ldr	q0, [x8]
	str	q0, [x9], #16
	stp	xzr, xzr, [x8], #16
	cmp	x8, x19
	b.ne	LBB55_3
LBB55_4:
	str	x9, [sp, #40]
	mov	w8, #1                          ; =0x1
	strb	w8, [sp, #24]
	mov	w22, #-4                        ; =0xfffffffc
	mov	w23, #-1                        ; =0xffffffff
	b	LBB55_6
LBB55_5:                                ;   in Loop: Header=BB55_6 Depth=1
	add	x20, x20, #16
	cmp	x20, x19
	b.eq	LBB55_14
LBB55_6:                                ; =>This Inner Loop Header: Depth=1
	mov	x21, x20
	ldr	x8, [x21, #8]!
	cbz	x8, LBB55_10
; %bb.7:                                ;   in Loop: Header=BB55_6 Depth=1
	ldr	x0, [x20]
	cbz	x0, LBB55_9
; %bb.8:                                ;   in Loop: Header=BB55_6 Depth=1
	bl	__ZNSt3__112__stop_state14__request_stopB8ne200100Ev
LBB55_9:                                ;   in Loop: Header=BB55_6 Depth=1
Ltmp358:
	mov	x0, x21
	bl	__ZNSt3__16thread4joinEv
Ltmp359:
LBB55_10:                               ;   in Loop: Header=BB55_6 Depth=1
	mov	x0, x21
	bl	__ZNSt3__16threadD1Ev
	ldr	x8, [x20]
	cbz	x8, LBB55_5
; %bb.11:                               ;   in Loop: Header=BB55_6 Depth=1
	ldadd	w22, w8, [x8]
	ldr	x0, [x20]
	cbz	x0, LBB55_5
; %bb.12:                               ;   in Loop: Header=BB55_6 Depth=1
	add	x8, x0, #4
	ldaddal	w23, w8, [x8]
	cmp	w8, #1
	b.ne	LBB55_5
; %bb.13:                               ;   in Loop: Header=BB55_6 Depth=1
	bl	__ZdlPv
	b	LBB55_5
LBB55_14:
	ldrb	w8, [sp, #24]
	tbnz	w8, #0, LBB55_16
; %bb.15:
Ltmp361:
	mov	x0, sp
	bl	__ZNKSt3__129_AllocatorDestroyRangeReverseINS_9allocatorINS_7jthreadEEEPS2_EclB8ne200100Ev
Ltmp362:
LBB55_16:
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
LBB55_17:
	and	x9, x8, #0xfffffffffffffff0
	orr	x10, x9, #0x8
	add	x11, x20, x10
	add	x12, x3, #8
	add	x9, x9, #16
	add	x13, x3, x9
	add	x14, x20, #8
	add	x9, x20, x9
	cmp	x12, x9
	ccmp	x14, x13, #2, lo
	cset	w9, lo
	add	x10, x3, x10
	cmp	x10, x20
	ccmp	x11, x3, #0, hi
	b.hi	LBB55_2
; %bb.18:
	tbnz	w9, #0, LBB55_2
; %bb.19:
	lsr	x8, x8, #4
	add	x10, x8, #1
	and	x11, x10, #0x1ffffffffffffffc
	lsl	x9, x11, #4
	add	x8, x20, x9
	add	x9, x3, x9
	add	x12, x3, #32
	add	x13, x20, #32
	movi.2d	v0, #0000000000000000
	mov	x14, x11
LBB55_20:                               ; =>This Inner Loop Header: Depth=1
	ldp	q1, q2, [x13, #-32]
	ldp	q3, q4, [x13]
	stp	q1, q2, [x12, #-32]
	stp	q3, q4, [x12], #64
	stp	q0, q0, [x13, #-32]
	stp	q0, q0, [x13], #64
	subs	x14, x14, #4
	b.ne	LBB55_20
; %bb.21:
	cmp	x10, x11
	b.ne	LBB55_3
	b	LBB55_4
LBB55_22:
Ltmp363:
	bl	___clang_call_terminate
LBB55_23:
Ltmp360:
	bl	___clang_call_terminate
Lfunc_end24:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table55:
Lexception24:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase5-Lttbaseref5
Lttbaseref5:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end24-Lcst_begin24
Lcst_begin24:
	.uleb128 Ltmp358-Lfunc_begin24          ; >> Call Site 1 <<
	.uleb128 Ltmp359-Ltmp358                ;   Call between Ltmp358 and Ltmp359
	.uleb128 Ltmp360-Lfunc_begin24          ;     jumps to Ltmp360
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp361-Lfunc_begin24          ; >> Call Site 2 <<
	.uleb128 Ltmp362-Ltmp361                ;   Call between Ltmp361 and Ltmp362
	.uleb128 Ltmp363-Lfunc_begin24          ;     jumps to Ltmp363
	.byte	1                               ;   On action: 1
Lcst_end24:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2, 0x0
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase5:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNKSt3__129_AllocatorDestroyRangeReverseINS_9allocatorINS_7jthreadEEEPS2_EclB8ne200100Ev ; -- Begin function _ZNKSt3__129_AllocatorDestroyRangeReverseINS_9allocatorINS_7jthreadEEEPS2_EclB8ne200100Ev
	.globl	__ZNKSt3__129_AllocatorDestroyRangeReverseINS_9allocatorINS_7jthreadEEEPS2_EclB8ne200100Ev
	.weak_def_can_be_hidden	__ZNKSt3__129_AllocatorDestroyRangeReverseINS_9allocatorINS_7jthreadEEEPS2_EclB8ne200100Ev
	.p2align	2
__ZNKSt3__129_AllocatorDestroyRangeReverseINS_9allocatorINS_7jthreadEEEPS2_EclB8ne200100Ev: ; @_ZNKSt3__129_AllocatorDestroyRangeReverseINS_9allocatorINS_7jthreadEEEPS2_EclB8ne200100Ev
Lfunc_begin25:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception25
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	ldp	x9, x8, [x0, #8]
	ldr	x8, [x8]
	ldr	x20, [x9]
	cmp	x8, x20
	b.eq	LBB56_11
; %bb.1:
	sub	x19, x8, #8
	mov	w21, #-4                        ; =0xfffffffc
	mov	w22, #-1                        ; =0xffffffff
	b	LBB56_3
LBB56_2:                                ;   in Loop: Header=BB56_3 Depth=1
	sub	x8, x19, #8
	sub	x19, x19, #16
	cmp	x8, x20
	b.eq	LBB56_11
LBB56_3:                                ; =>This Inner Loop Header: Depth=1
	ldr	x8, [x19]
	cbz	x8, LBB56_7
; %bb.4:                                ;   in Loop: Header=BB56_3 Depth=1
	ldur	x0, [x19, #-8]
	cbz	x0, LBB56_6
; %bb.5:                                ;   in Loop: Header=BB56_3 Depth=1
	bl	__ZNSt3__112__stop_state14__request_stopB8ne200100Ev
LBB56_6:                                ;   in Loop: Header=BB56_3 Depth=1
Ltmp364:
	mov	x0, x19
	bl	__ZNSt3__16thread4joinEv
Ltmp365:
LBB56_7:                                ;   in Loop: Header=BB56_3 Depth=1
	mov	x0, x19
	bl	__ZNSt3__16threadD1Ev
	ldur	x8, [x19, #-8]
	cbz	x8, LBB56_2
; %bb.8:                                ;   in Loop: Header=BB56_3 Depth=1
	ldadd	w21, w8, [x8]
	ldur	x0, [x19, #-8]
	cbz	x0, LBB56_2
; %bb.9:                                ;   in Loop: Header=BB56_3 Depth=1
	add	x8, x0, #4
	ldaddal	w22, w8, [x8]
	cmp	w8, #1
	b.ne	LBB56_2
; %bb.10:                               ;   in Loop: Header=BB56_3 Depth=1
	bl	__ZdlPv
	b	LBB56_2
LBB56_11:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
LBB56_12:
Ltmp366:
	bl	___clang_call_terminate
Lfunc_end25:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table56:
Lexception25:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase6-Lttbaseref6
Lttbaseref6:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end25-Lcst_begin25
Lcst_begin25:
	.uleb128 Ltmp364-Lfunc_begin25          ; >> Call Site 1 <<
	.uleb128 Ltmp365-Ltmp364                ;   Call between Ltmp364 and Ltmp365
	.uleb128 Ltmp366-Lfunc_begin25          ;     jumps to Ltmp366
	.byte	1                               ;   On action: 1
Lcst_end25:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2, 0x0
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase6:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__114__split_bufferINS_7jthreadERNS_9allocatorIS1_EEE17__destruct_at_endB8ne200100EPS1_ ; -- Begin function _ZNSt3__114__split_bufferINS_7jthreadERNS_9allocatorIS1_EEE17__destruct_at_endB8ne200100EPS1_
	.globl	__ZNSt3__114__split_bufferINS_7jthreadERNS_9allocatorIS1_EEE17__destruct_at_endB8ne200100EPS1_
	.weak_def_can_be_hidden	__ZNSt3__114__split_bufferINS_7jthreadERNS_9allocatorIS1_EEE17__destruct_at_endB8ne200100EPS1_
	.p2align	2
__ZNSt3__114__split_bufferINS_7jthreadERNS_9allocatorIS1_EEE17__destruct_at_endB8ne200100EPS1_: ; @_ZNSt3__114__split_bufferINS_7jthreadERNS_9allocatorIS1_EEE17__destruct_at_endB8ne200100EPS1_
Lfunc_begin26:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception26
; %bb.0:
	stp	x24, x23, [sp, #-64]!           ; 16-byte Folded Spill
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	ldr	x21, [x0, #16]
	cmp	x21, x1
	b.eq	LBB57_11
; %bb.1:
	mov	x19, x1
	mov	x20, x0
	mov	w22, #-4                        ; =0xfffffffc
	mov	w23, #-1                        ; =0xffffffff
	b	LBB57_3
LBB57_2:                                ;   in Loop: Header=BB57_3 Depth=1
	ldr	x21, [x20, #16]
	cmp	x21, x19
	b.eq	LBB57_11
LBB57_3:                                ; =>This Inner Loop Header: Depth=1
	ldr	x8, [x21, #-8]!
	sub	x24, x21, #8
	str	x24, [x20, #16]
	cbz	x8, LBB57_7
; %bb.4:                                ;   in Loop: Header=BB57_3 Depth=1
	ldr	x0, [x24]
	cbz	x0, LBB57_6
; %bb.5:                                ;   in Loop: Header=BB57_3 Depth=1
	bl	__ZNSt3__112__stop_state14__request_stopB8ne200100Ev
LBB57_6:                                ;   in Loop: Header=BB57_3 Depth=1
Ltmp367:
	mov	x0, x21
	bl	__ZNSt3__16thread4joinEv
Ltmp368:
LBB57_7:                                ;   in Loop: Header=BB57_3 Depth=1
	mov	x0, x21
	bl	__ZNSt3__16threadD1Ev
	ldr	x8, [x24]
	cbz	x8, LBB57_2
; %bb.8:                                ;   in Loop: Header=BB57_3 Depth=1
	ldadd	w22, w8, [x8]
	ldr	x0, [x24]
	cbz	x0, LBB57_2
; %bb.9:                                ;   in Loop: Header=BB57_3 Depth=1
	add	x8, x0, #4
	ldaddal	w23, w8, [x8]
	cmp	w8, #1
	b.ne	LBB57_2
; %bb.10:                               ;   in Loop: Header=BB57_3 Depth=1
	bl	__ZdlPv
	b	LBB57_2
LBB57_11:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
LBB57_12:
Ltmp369:
	bl	___clang_call_terminate
Lfunc_end26:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table57:
Lexception26:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase7-Lttbaseref7
Lttbaseref7:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end26-Lcst_begin26
Lcst_begin26:
	.uleb128 Ltmp367-Lfunc_begin26          ; >> Call Site 1 <<
	.uleb128 Ltmp368-Ltmp367                ;   Call between Ltmp367 and Ltmp368
	.uleb128 Ltmp369-Lfunc_begin26          ;     jumps to Ltmp369
	.byte	1                               ;   On action: 1
Lcst_end26:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2, 0x0
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase7:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	2                               ; -- Begin function _ZNSt3__116allocator_traitsINS_9allocatorINS_7jthreadEEEE9constructB8ne200100IS2_JZN6vquery12_GLOBAL__N_112execute_implENS6_9QuerySpecERKNS6_6TablesERNS6_16ExecutionContextEE3$_0EvLi0EEEvRS3_PT_DpOT0_
__ZNSt3__116allocator_traitsINS_9allocatorINS_7jthreadEEEE9constructB8ne200100IS2_JZN6vquery12_GLOBAL__N_112execute_implENS6_9QuerySpecERKNS6_6TablesERNS6_16ExecutionContextEE3$_0EvLi0EEEvRS3_PT_DpOT0_: ; @"_ZNSt3__116allocator_traitsINS_9allocatorINS_7jthreadEEEE9constructB8ne200100IS2_JZN6vquery12_GLOBAL__N_112execute_implENS6_9QuerySpecERKNS6_6TablesERNS6_16ExecutionContextEE3$_0EvLi0EEEvRS3_PT_DpOT0_"
Lfunc_begin27:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception27
; %bb.0:
	sub	sp, sp, #64
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x20, x1
	mov	x19, x0
	mov	w0, #24                         ; =0x18
	bl	__Znwm
	stp	xzr, xzr, [x0, #8]
	mov	x21, x19
	str	x0, [x21], #8
	str	xzr, [x0]
	add	x8, x0, #4
	mov	w9, #1                          ; =0x1
	ldadd	w9, w8, [x8]
	mov	w8, #4                          ; =0x4
	ldadd	w8, w8, [x0]
Ltmp370:
	mov	w0, #8                          ; =0x8
	bl	__Znwm
Ltmp371:
; %bb.1:
Ltmp373:
	mov	x22, x0
	bl	__ZNSt3__115__thread_structC1Ev
Ltmp374:
; %bb.2:
	str	x22, [sp, #8]
Ltmp376:
	mov	w0, #96                         ; =0x60
	bl	__Znwm
Ltmp377:
; %bb.3:
	mov	x3, x0
	ldr	q0, [x20]
	stur	q0, [x0, #8]
	ldp	q0, q1, [x20, #32]
	stur	q0, [x0, #40]
	stp	x0, xzr, [sp]
	str	x22, [x0]
	ldp	x8, x9, [x20, #16]
	stp	x8, x9, [x0, #24]
	str	xzr, [x20, #24]
	stur	q1, [x0, #56]
	ldr	q0, [x20, #64]
	stur	q0, [x0, #72]
	ldr	x8, [x20, #80]
	str	x8, [x0, #88]
Ltmp379:
Lloh148:
	adrp	x2, __ZNSt3__114__thread_proxyB8ne200100INS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEZN6vquery12_GLOBAL__N_112execute_implENS7_9QuerySpecERKNS7_6TablesERNS7_16ExecutionContextEE3$_0EEEEEPvSH_@PAGE
Lloh149:
	add	x2, x2, __ZNSt3__114__thread_proxyB8ne200100INS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEZN6vquery12_GLOBAL__N_112execute_implENS7_9QuerySpecERKNS7_6TablesERNS7_16ExecutionContextEE3$_0EEEEEPvSH_@PAGEOFF
	mov	x0, x21
	mov	x1, #0                          ; =0x0
	bl	_pthread_create
Ltmp380:
; %bb.4:
	cbnz	w0, LBB58_6
; %bb.5:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB58_6:
Ltmp381:
Lloh150:
	adrp	x1, l_.str.9@PAGE
Lloh151:
	add	x1, x1, l_.str.9@PAGEOFF
	bl	__ZNSt3__120__throw_system_errorEiPKc
Ltmp382:
; %bb.7:
	brk	#0x1
LBB58_8:
Ltmp378:
	mov	x20, x0
	add	x0, sp, #8
	bl	__ZNSt3__110unique_ptrINS_15__thread_structENS_14default_deleteIS1_EEED1B8ne200100Ev
	mov	x0, x19
	bl	__ZNSt3__111stop_sourceD1B8ne200100Ev
	mov	x0, x20
	bl	__Unwind_Resume
LBB58_9:
Ltmp375:
	mov	x20, x0
	mov	x0, x22
	bl	__ZdlPv
	mov	x0, x19
	bl	__ZNSt3__111stop_sourceD1B8ne200100Ev
	mov	x0, x20
	bl	__Unwind_Resume
LBB58_10:
Ltmp372:
	mov	x20, x0
	mov	x0, x19
	bl	__ZNSt3__111stop_sourceD1B8ne200100Ev
	mov	x0, x20
	bl	__Unwind_Resume
LBB58_11:
Ltmp383:
	mov	x20, x0
	mov	x0, sp
	bl	__ZNSt3__110unique_ptrINS_5tupleIJNS0_INS_15__thread_structENS_14default_deleteIS2_EEEEZN6vquery12_GLOBAL__N_112execute_implENS6_9QuerySpecERKNS6_6TablesERNS6_16ExecutionContextEE3$_0EEENS3_ISF_EEED1B8ne200100Ev
	add	x0, sp, #8
	bl	__ZNSt3__110unique_ptrINS_15__thread_structENS_14default_deleteIS1_EEED1B8ne200100Ev
	mov	x0, x19
	bl	__ZNSt3__111stop_sourceD1B8ne200100Ev
	mov	x0, x20
	bl	__Unwind_Resume
	.loh AdrpAdd	Lloh148, Lloh149
	.loh AdrpAdd	Lloh150, Lloh151
Lfunc_end27:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table58:
Lexception27:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end27-Lcst_begin27
Lcst_begin27:
	.uleb128 Lfunc_begin27-Lfunc_begin27    ; >> Call Site 1 <<
	.uleb128 Ltmp370-Lfunc_begin27          ;   Call between Lfunc_begin27 and Ltmp370
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp370-Lfunc_begin27          ; >> Call Site 2 <<
	.uleb128 Ltmp371-Ltmp370                ;   Call between Ltmp370 and Ltmp371
	.uleb128 Ltmp372-Lfunc_begin27          ;     jumps to Ltmp372
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp373-Lfunc_begin27          ; >> Call Site 3 <<
	.uleb128 Ltmp374-Ltmp373                ;   Call between Ltmp373 and Ltmp374
	.uleb128 Ltmp375-Lfunc_begin27          ;     jumps to Ltmp375
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp376-Lfunc_begin27          ; >> Call Site 4 <<
	.uleb128 Ltmp377-Ltmp376                ;   Call between Ltmp376 and Ltmp377
	.uleb128 Ltmp378-Lfunc_begin27          ;     jumps to Ltmp378
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp379-Lfunc_begin27          ; >> Call Site 5 <<
	.uleb128 Ltmp382-Ltmp379                ;   Call between Ltmp379 and Ltmp382
	.uleb128 Ltmp383-Lfunc_begin27          ;     jumps to Ltmp383
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp382-Lfunc_begin27          ; >> Call Site 6 <<
	.uleb128 Lfunc_end27-Ltmp382            ;   Call between Ltmp382 and Lfunc_end27
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end27:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	2                               ; -- Begin function _ZNSt3__114__thread_proxyB8ne200100INS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEZN6vquery12_GLOBAL__N_112execute_implENS7_9QuerySpecERKNS7_6TablesERNS7_16ExecutionContextEE3$_0EEEEEPvSH_
__ZNSt3__114__thread_proxyB8ne200100INS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEZN6vquery12_GLOBAL__N_112execute_implENS7_9QuerySpecERKNS7_6TablesERNS7_16ExecutionContextEE3$_0EEEEEPvSH_: ; @"_ZNSt3__114__thread_proxyB8ne200100INS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEZN6vquery12_GLOBAL__N_112execute_implENS7_9QuerySpecERKNS7_6TablesERNS7_16ExecutionContextEE3$_0EEEEEPvSH_"
Lfunc_begin28:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception28
; %bb.0:
	sub	sp, sp, #112
	stp	x20, x19, [sp, #80]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	str	x0, [sp, #8]
Ltmp384:
	bl	__ZNSt3__119__thread_local_dataEv
Ltmp385:
; %bb.1:
	ldr	x1, [x19]
	str	xzr, [x19]
	ldr	x0, [x0]
Ltmp386:
	bl	_pthread_setspecific
Ltmp387:
; %bb.2:
	ldr	x8, [x19, #40]
	ldr	x9, [x8, #40]
	cbz	x9, LBB59_6
; %bb.3:
	ldr	x0, [x9, #56]
	cbz	x0, LBB59_6
; %bb.4:
	ldr	w8, [x19, #8]
	str	w8, [sp, #16]
	ldr	x8, [x0]
	ldr	x8, [x8, #48]
Ltmp388:
	add	x1, sp, #16
	blr	x8
Ltmp389:
; %bb.5:
	ldr	x8, [x19, #40]
LBB59_6:
	ldp	x9, x2, [x19, #56]
	ldr	x1, [x9]
	ldr	q0, [x8]
	ldr	w9, [x8, #16]
	str	w9, [sp, #32]
	str	q0, [sp, #16]
	ldp	x10, x9, [x8, #24]
	stp	x10, x9, [sp, #40]
	cbz	x9, LBB59_8
; %bb.7:
	add	x9, x9, #8
	mov	w10, #1                         ; =0x1
	ldadd	x10, x9, [x9]
LBB59_8:
	ldp	x9, x8, [x8, #40]
	stp	x9, x8, [sp, #56]
	cbz	x8, LBB59_10
; %bb.9:
	add	x8, x8, #4
	mov	w9, #1                          ; =0x1
	ldadd	w9, w8, [x8]
LBB59_10:
	ldp	x4, x5, [x19, #16]
	ldr	x8, [x19, #72]
	ldr	x6, [x8]
Ltmp391:
	sub	x0, x29, #24
	add	x3, sp, #16
	add	x7, x19, #32
	bl	__ZN6vquery12_GLOBAL__N_19run_rangeENS_9QuerySpecERKNS_6TablesENS_16ExecutionContextEmmPKNS_9HashTableIjNS_7KeyHashEEERKNSt3__110stop_tokenE
Ltmp392:
; %bb.11:
	ldr	x8, [x19, #48]
	ldr	w9, [x19, #8]
	ldur	x10, [x29, #-24]
	stur	xzr, [x29, #-24]
	ldr	x19, [x8, x9, lsl #3]
	str	x10, [x8, x9, lsl #3]
	cbz	x19, LBB59_15
; %bb.12:
	ldr	x0, [x19, #16]
	str	xzr, [x19, #16]
	cbz	x0, LBB59_14
; %bb.13:
	bl	__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEED2Ev
	bl	__ZdlPv
LBB59_14:
	mov	x0, x19
	bl	__ZdlPv
LBB59_15:
	ldur	x19, [x29, #-24]
	stur	xzr, [x29, #-24]
	cbz	x19, LBB59_19
; %bb.16:
	ldr	x0, [x19, #16]
	str	xzr, [x19, #16]
	cbz	x0, LBB59_18
; %bb.17:
	bl	__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEED2Ev
	bl	__ZdlPv
LBB59_18:
	mov	x0, x19
	bl	__ZdlPv
LBB59_19:
	ldr	x0, [sp, #64]
	cbz	x0, LBB59_22
; %bb.20:
	add	x8, x0, #4
	mov	w9, #-1                         ; =0xffffffff
	ldaddal	w9, w8, [x8]
	cmp	w8, #1
	b.ne	LBB59_22
; %bb.21:
	bl	__ZdlPv
LBB59_22:
	ldr	x19, [sp, #48]
	cbz	x19, LBB59_25
; %bb.23:
	add	x8, x19, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbnz	x8, LBB59_25
; %bb.24:
	ldr	x8, [x19]
	ldr	x8, [x8, #16]
	mov	x0, x19
	blr	x8
	mov	x0, x19
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
LBB59_25:
	ldr	x19, [sp, #8]
	str	xzr, [sp, #8]
	cbz	x19, LBB59_32
; %bb.26:
	ldr	x0, [x19, #32]
	cbz	x0, LBB59_29
; %bb.27:
	add	x8, x0, #4
	mov	w9, #-1                         ; =0xffffffff
	ldaddal	w9, w8, [x8]
	cmp	w8, #1
	b.ne	LBB59_29
; %bb.28:
	bl	__ZdlPv
LBB59_29:
	ldr	x0, [x19]
	str	xzr, [x19]
	cbz	x0, LBB59_31
; %bb.30:
	bl	__ZNSt3__115__thread_structD1Ev
	bl	__ZdlPv
LBB59_31:
	mov	x0, x19
	bl	__ZdlPv
LBB59_32:
	mov	x0, #0                          ; =0x0
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
LBB59_33:
Ltmp390:
	mov	x20, x0
	b	LBB59_35
LBB59_34:
Ltmp393:
	mov	x20, x0
	add	x0, sp, #16
	bl	__ZN6vquery16ExecutionContextD1Ev
LBB59_35:
	mov	x0, x20
	bl	___cxa_begin_catch
	sub	x8, x29, #24
	bl	__ZSt17current_exceptionv
	ldr	x8, [x19, #80]
	ldr	w9, [x19, #8]
	add	x0, x8, x9, lsl #3
	sub	x1, x29, #24
	bl	__ZNSt13exception_ptraSERKS_
	sub	x0, x29, #24
	bl	__ZNSt13exception_ptrD1Ev
	ldr	x8, [x19, #88]
	ldr	x0, [x8]
	cbz	x0, LBB59_37
; %bb.36:
	bl	__ZNSt3__112__stop_state14__request_stopB8ne200100Ev
LBB59_37:
Ltmp394:
	bl	___cxa_end_catch
Ltmp395:
	b	LBB59_25
LBB59_38:
Ltmp396:
	mov	x19, x0
	add	x0, sp, #8
	bl	__ZNSt3__110unique_ptrINS_5tupleIJNS0_INS_15__thread_structENS_14default_deleteIS2_EEEEZN6vquery12_GLOBAL__N_112execute_implENS6_9QuerySpecERKNS6_6TablesERNS6_16ExecutionContextEE3$_0EEENS3_ISF_EEED1B8ne200100Ev
	mov	x0, x19
	bl	__Unwind_Resume
Lfunc_end28:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table59:
Lexception28:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase8-Lttbaseref8
Lttbaseref8:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end28-Lcst_begin28
Lcst_begin28:
	.uleb128 Ltmp384-Lfunc_begin28          ; >> Call Site 1 <<
	.uleb128 Ltmp387-Ltmp384                ;   Call between Ltmp384 and Ltmp387
	.uleb128 Ltmp396-Lfunc_begin28          ;     jumps to Ltmp396
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp388-Lfunc_begin28          ; >> Call Site 2 <<
	.uleb128 Ltmp389-Ltmp388                ;   Call between Ltmp388 and Ltmp389
	.uleb128 Ltmp390-Lfunc_begin28          ;     jumps to Ltmp390
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp391-Lfunc_begin28          ; >> Call Site 3 <<
	.uleb128 Ltmp392-Ltmp391                ;   Call between Ltmp391 and Ltmp392
	.uleb128 Ltmp393-Lfunc_begin28          ;     jumps to Ltmp393
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp392-Lfunc_begin28          ; >> Call Site 4 <<
	.uleb128 Ltmp394-Ltmp392                ;   Call between Ltmp392 and Ltmp394
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp394-Lfunc_begin28          ; >> Call Site 5 <<
	.uleb128 Ltmp395-Ltmp394                ;   Call between Ltmp394 and Ltmp395
	.uleb128 Ltmp396-Lfunc_begin28          ;     jumps to Ltmp396
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp395-Lfunc_begin28          ; >> Call Site 6 <<
	.uleb128 Lfunc_end28-Ltmp395            ;   Call between Ltmp395 and Lfunc_end28
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end28:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2, 0x0
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase8:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	2                               ; -- Begin function _ZNSt3__110unique_ptrINS_5tupleIJNS0_INS_15__thread_structENS_14default_deleteIS2_EEEEZN6vquery12_GLOBAL__N_112execute_implENS6_9QuerySpecERKNS6_6TablesERNS6_16ExecutionContextEE3$_0EEENS3_ISF_EEED1B8ne200100Ev
__ZNSt3__110unique_ptrINS_5tupleIJNS0_INS_15__thread_structENS_14default_deleteIS2_EEEEZN6vquery12_GLOBAL__N_112execute_implENS6_9QuerySpecERKNS6_6TablesERNS6_16ExecutionContextEE3$_0EEENS3_ISF_EEED1B8ne200100Ev: ; @"_ZNSt3__110unique_ptrINS_5tupleIJNS0_INS_15__thread_structENS_14default_deleteIS2_EEEEZN6vquery12_GLOBAL__N_112execute_implENS6_9QuerySpecERKNS6_6TablesERNS6_16ExecutionContextEE3$_0EEENS3_ISF_EEED1B8ne200100Ev"
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	ldr	x20, [x0]
	str	xzr, [x0]
	cbz	x20, LBB60_7
; %bb.1:
	ldr	x0, [x20, #32]
	cbz	x0, LBB60_4
; %bb.2:
	add	x8, x0, #4
	mov	w9, #-1                         ; =0xffffffff
	ldaddal	w9, w8, [x8]
	cmp	w8, #1
	b.ne	LBB60_4
; %bb.3:
	bl	__ZdlPv
LBB60_4:
	ldr	x0, [x20]
	str	xzr, [x20]
	cbz	x0, LBB60_6
; %bb.5:
	bl	__ZNSt3__115__thread_structD1Ev
	bl	__ZdlPv
LBB60_6:
	mov	x0, x20
	bl	__ZdlPv
LBB60_7:
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__110unique_ptrINS_15__thread_structENS_14default_deleteIS1_EEED1B8ne200100Ev ; -- Begin function _ZNSt3__110unique_ptrINS_15__thread_structENS_14default_deleteIS1_EEED1B8ne200100Ev
	.globl	__ZNSt3__110unique_ptrINS_15__thread_structENS_14default_deleteIS1_EEED1B8ne200100Ev
	.weak_def_can_be_hidden	__ZNSt3__110unique_ptrINS_15__thread_structENS_14default_deleteIS1_EEED1B8ne200100Ev
	.p2align	2
__ZNSt3__110unique_ptrINS_15__thread_structENS_14default_deleteIS1_EEED1B8ne200100Ev: ; @_ZNSt3__110unique_ptrINS_15__thread_structENS_14default_deleteIS1_EEED1B8ne200100Ev
	.cfi_startproc
; %bb.0:
	mov	x8, x0
	ldr	x0, [x0]
	str	xzr, [x8]
	cbz	x0, LBB61_2
; %bb.1:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x8
	bl	__ZNSt3__115__thread_structD1Ev
	bl	__ZdlPv
	mov	x8, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
LBB61_2:
	mov	x0, x8
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__112__stop_state14__request_stopB8ne200100Ev ; -- Begin function _ZNSt3__112__stop_state14__request_stopB8ne200100Ev
	.globl	__ZNSt3__112__stop_state14__request_stopB8ne200100Ev
	.weak_def_can_be_hidden	__ZNSt3__112__stop_state14__request_stopB8ne200100Ev
	.p2align	2
__ZNSt3__112__stop_state14__request_stopB8ne200100Ev: ; @_ZNSt3__112__stop_state14__request_stopB8ne200100Ev
Lfunc_begin29:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception29
; %bb.0:
	sub	sp, sp, #160
	stp	x26, x25, [sp, #80]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #96]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #112]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #128]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #144]            ; 16-byte Folded Spill
	add	x29, sp, #144
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	ldr	w8, [x0]
	tbnz	w8, #0, LBB62_7
; %bb.1:
	mov	x19, x0
	add	x20, sp, #20
	sub	x21, x29, #68
	add	x22, sp, #8
LBB62_2:                                ; =>This Inner Loop Header: Depth=1
	tbnz	w8, #1, LBB62_5
; %bb.3:                                ;   in Loop: Header=BB62_2 Depth=1
	orr	w10, w8, #0x3
	mov	x9, x8
	casal	w9, w10, [x19]
	cmp	w9, w8
	b.eq	LBB62_9
; %bb.4:                                ;   in Loop: Header=BB62_2 Depth=1
	mov	x8, x9
	tbz	w9, #0, LBB62_2
	b	LBB62_7
LBB62_5:                                ;   in Loop: Header=BB62_2 Depth=1
	str	w8, [sp, #20]
	str	x20, [sp, #8]
	stur	wzr, [x29, #-68]
	stp	x19, x20, [sp, #48]
	str	wzr, [sp, #64]
	stp	x19, x21, [sp, #24]
	str	x22, [sp, #40]
Ltmp397:
	add	x0, sp, #24
	add	x1, sp, #48
	mov	x2, #0                          ; =0x0
	bl	__ZNSt3__133__libcpp_thread_poll_with_backoffB8ne200100IZNS_20__atomic_wait_unlessB8ne200100INS_13__atomic_baseIjLb0EEEZNS_13__atomic_waitB8ne200100IKS3_jEEvRT_T0_NS_12memory_orderEEUlRKjE_EEvRKS6_S9_OS8_EUlvE_RNS_26__atomic_wait_backoff_implIS3_SC_EEEEbOS6_SF_NS_6chrono8durationIxNS_5ratioILl1ELl1000000000EEEEE
Ltmp398:
; %bb.6:                                ;   in Loop: Header=BB62_2 Depth=1
	ldr	w8, [x19]
	tbz	w8, #0, LBB62_2
LBB62_7:
	mov	w0, #0                          ; =0x0
LBB62_8:
	ldp	x29, x30, [sp, #144]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #128]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #112]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #96]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #80]             ; 16-byte Folded Reload
	add	sp, sp, #160
	ret
LBB62_9:
Ltmp400:
	bl	_pthread_self
Ltmp401:
; %bb.10:
	str	x0, [x19, #16]
	ldr	x20, [x19, #8]
	cbz	x20, LBB62_22
; %bb.11:
	mov	w21, #2                         ; =0x2
	add	x22, sp, #7
	add	x23, sp, #20
	sub	x24, x29, #68
	add	x25, sp, #8
	mov	w26, #1                         ; =0x1
	b	LBB62_13
LBB62_12:                               ;   in Loop: Header=BB62_13 Depth=1
	ldr	x20, [x19, #8]
	cbz	x20, LBB62_22
LBB62_13:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB62_20 Depth 2
                                        ;     Child Loop BB62_18 Depth 2
	ldr	x8, [x20]
	str	x8, [x19, #8]
	cbz	x8, LBB62_15
; %bb.14:                               ;   in Loop: Header=BB62_13 Depth=1
	str	xzr, [x8, #8]
LBB62_15:                               ;   in Loop: Header=BB62_13 Depth=1
	ldclrl	w21, w8, [x19]
	mov	x0, x19
	bl	__ZNSt3__123__cxx_atomic_notify_allEPVKv
	strb	wzr, [sp, #7]
	str	x22, [x20, #32]
	ldr	x8, [x20, #16]
	mov	x0, x20
	blr	x8
	ldrb	w8, [sp, #7]
	tbnz	w8, #0, LBB62_17
; %bb.16:                               ;   in Loop: Header=BB62_13 Depth=1
	str	xzr, [x20, #32]
	add	x0, x20, #24
	stlrb	w26, [x0]
	bl	__ZNSt3__123__cxx_atomic_notify_allEPVKv
LBB62_17:                               ;   in Loop: Header=BB62_13 Depth=1
	ldr	w8, [x19]
	tbz	w8, #1, LBB62_20
LBB62_18:                               ;   Parent Loop BB62_13 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	str	w8, [sp, #20]
	str	x23, [sp, #8]
	stur	wzr, [x29, #-68]
	stp	x19, x23, [sp, #48]
	str	wzr, [sp, #64]
	stp	x19, x24, [sp, #24]
	str	x25, [sp, #40]
Ltmp403:
	add	x0, sp, #24
	add	x1, sp, #48
	mov	x2, #0                          ; =0x0
	bl	__ZNSt3__133__libcpp_thread_poll_with_backoffB8ne200100IZNS_20__atomic_wait_unlessB8ne200100INS_13__atomic_baseIjLb0EEEZNS_13__atomic_waitB8ne200100IKS3_jEEvRT_T0_NS_12memory_orderEEUlRKjE_EEvRKS6_S9_OS8_EUlvE_RNS_26__atomic_wait_backoff_implIS3_SC_EEEEbOS6_SF_NS_6chrono8durationIxNS_5ratioILl1ELl1000000000EEEEE
Ltmp404:
; %bb.19:                               ;   in Loop: Header=BB62_18 Depth=2
	ldr	w8, [x19]
	tbnz	w8, #1, LBB62_18
LBB62_20:                               ;   Parent Loop BB62_13 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	orr	w10, w8, #0x2
	mov	x9, x8
	casa	w9, w10, [x19]
	cmp	w9, w8
	b.eq	LBB62_12
; %bb.21:                               ;   in Loop: Header=BB62_20 Depth=2
	mov	x8, x9
	tbnz	w8, #1, LBB62_18
	b	LBB62_20
LBB62_22:
	mov	w8, #2                          ; =0x2
	ldclrl	w8, w8, [x19]
	mov	x0, x19
	bl	__ZNSt3__123__cxx_atomic_notify_allEPVKv
	mov	w0, #1                          ; =0x1
	b	LBB62_8
LBB62_23:
Ltmp402:
	bl	___clang_call_terminate
LBB62_24:
Ltmp399:
	bl	___clang_call_terminate
LBB62_25:
Ltmp405:
	bl	___clang_call_terminate
Lfunc_end29:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table62:
Lexception29:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase9-Lttbaseref9
Lttbaseref9:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end29-Lcst_begin29
Lcst_begin29:
	.uleb128 Ltmp397-Lfunc_begin29          ; >> Call Site 1 <<
	.uleb128 Ltmp398-Ltmp397                ;   Call between Ltmp397 and Ltmp398
	.uleb128 Ltmp399-Lfunc_begin29          ;     jumps to Ltmp399
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp400-Lfunc_begin29          ; >> Call Site 2 <<
	.uleb128 Ltmp401-Ltmp400                ;   Call between Ltmp400 and Ltmp401
	.uleb128 Ltmp402-Lfunc_begin29          ;     jumps to Ltmp402
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp401-Lfunc_begin29          ; >> Call Site 3 <<
	.uleb128 Ltmp403-Ltmp401                ;   Call between Ltmp401 and Ltmp403
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp403-Lfunc_begin29          ; >> Call Site 4 <<
	.uleb128 Ltmp404-Ltmp403                ;   Call between Ltmp403 and Ltmp404
	.uleb128 Ltmp405-Lfunc_begin29          ;     jumps to Ltmp405
	.byte	1                               ;   On action: 1
Lcst_end29:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2, 0x0
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase9:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__133__libcpp_thread_poll_with_backoffB8ne200100IZNS_20__atomic_wait_unlessB8ne200100INS_13__atomic_baseIjLb0EEEZNS_13__atomic_waitB8ne200100IKS3_jEEvRT_T0_NS_12memory_orderEEUlRKjE_EEvRKS6_S9_OS8_EUlvE_RNS_26__atomic_wait_backoff_implIS3_SC_EEEEbOS6_SF_NS_6chrono8durationIxNS_5ratioILl1ELl1000000000EEEEE ; -- Begin function _ZNSt3__133__libcpp_thread_poll_with_backoffB8ne200100IZNS_20__atomic_wait_unlessB8ne200100INS_13__atomic_baseIjLb0EEEZNS_13__atomic_waitB8ne200100IKS3_jEEvRT_T0_NS_12memory_orderEEUlRKjE_EEvRKS6_S9_OS8_EUlvE_RNS_26__atomic_wait_backoff_implIS3_SC_EEEEbOS6_SF_NS_6chrono8durationIxNS_5ratioILl1ELl1000000000EEEEE
	.weak_def_can_be_hidden	__ZNSt3__133__libcpp_thread_poll_with_backoffB8ne200100IZNS_20__atomic_wait_unlessB8ne200100INS_13__atomic_baseIjLb0EEEZNS_13__atomic_waitB8ne200100IKS3_jEEvRT_T0_NS_12memory_orderEEUlRKjE_EEvRKS6_S9_OS8_EUlvE_RNS_26__atomic_wait_backoff_implIS3_SC_EEEEbOS6_SF_NS_6chrono8durationIxNS_5ratioILl1ELl1000000000EEEEE
	.p2align	2
__ZNSt3__133__libcpp_thread_poll_with_backoffB8ne200100IZNS_20__atomic_wait_unlessB8ne200100INS_13__atomic_baseIjLb0EEEZNS_13__atomic_waitB8ne200100IKS3_jEEvRT_T0_NS_12memory_orderEEUlRKjE_EEvRKS6_S9_OS8_EUlvE_RNS_26__atomic_wait_backoff_implIS3_SC_EEEEbOS6_SF_NS_6chrono8durationIxNS_5ratioILl1ELl1000000000EEEEE: ; @_ZNSt3__133__libcpp_thread_poll_with_backoffB8ne200100IZNS_20__atomic_wait_unlessB8ne200100INS_13__atomic_baseIjLb0EEEZNS_13__atomic_waitB8ne200100IKS3_jEEvRT_T0_NS_12memory_orderEEUlRKjE_EEvRKS6_S9_OS8_EUlvE_RNS_26__atomic_wait_backoff_implIS3_SC_EEEEbOS6_SF_NS_6chrono8durationIxNS_5ratioILl1ELl1000000000EEEEE
	.cfi_startproc
; %bb.0:
	stp	x24, x23, [sp, #-64]!           ; 16-byte Folded Spill
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	mov	x22, x2
	mov	x19, x1
	mov	x20, x0
	mov	w23, #64                        ; =0x40
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x21, x0
LBB63_1:                                ; =>This Inner Loop Header: Depth=1
	ldp	x8, x9, [x20]
	ldr	w9, [x9]
	sub	w10, w9, #1
	cmp	w10, #2
	b.hs	LBB63_3
; %bb.2:                                ;   in Loop: Header=BB63_1 Depth=1
	ldapr	w8, [x8]
	ldr	x9, [x20, #16]
	ldr	x9, [x9]
	ldr	w9, [x9]
	cmp	w8, w9
	b.eq	LBB63_6
	b	LBB63_35
LBB63_3:                                ;   in Loop: Header=BB63_1 Depth=1
	cmp	w9, #5
	b.ne	LBB63_5
; %bb.4:                                ;   in Loop: Header=BB63_1 Depth=1
	ldar	w8, [x8]
	ldr	x9, [x20, #16]
	ldr	x9, [x9]
	ldr	w9, [x9]
	cmp	w8, w9
	b.eq	LBB63_6
	b	LBB63_35
LBB63_5:                                ;   in Loop: Header=BB63_1 Depth=1
	ldr	w8, [x8]
	ldr	x9, [x20, #16]
	ldr	x9, [x9]
	ldr	w9, [x9]
	cmp	w8, w9
	b.ne	LBB63_35
LBB63_6:                                ;   in Loop: Header=BB63_1 Depth=1
	subs	w23, w23, #1
	b.ne	LBB63_1
; %bb.7:
	cbz	x22, LBB63_25
LBB63_8:                                ; =>This Inner Loop Header: Depth=1
	ldp	x8, x9, [x20]
	ldr	w9, [x9]
	sub	w10, w9, #1
	cmp	w10, #2
	b.hs	LBB63_10
; %bb.9:                                ;   in Loop: Header=BB63_8 Depth=1
	ldapr	w8, [x8]
	ldr	x9, [x20, #16]
	ldr	x9, [x9]
	ldr	w9, [x9]
	cmp	w8, w9
	cset	w0, ne
	b.eq	LBB63_13
	b	LBB63_36
LBB63_10:                               ;   in Loop: Header=BB63_8 Depth=1
	cmp	w9, #5
	b.ne	LBB63_12
; %bb.11:                               ;   in Loop: Header=BB63_8 Depth=1
	ldar	w8, [x8]
	ldr	x9, [x20, #16]
	ldr	x9, [x9]
	ldr	w9, [x9]
	cmp	w8, w9
	cset	w0, ne
	b.eq	LBB63_13
	b	LBB63_36
LBB63_12:                               ;   in Loop: Header=BB63_8 Depth=1
	ldr	w8, [x8]
	ldr	x9, [x20, #16]
	ldr	x9, [x9]
	ldr	w9, [x9]
	cmp	w8, w9
	cset	w0, ne
	b.ne	LBB63_36
LBB63_13:                               ;   in Loop: Header=BB63_8 Depth=1
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	sub	x8, x0, x21
	cmp	x8, x22
	b.gt	LBB63_37
; %bb.14:                               ;   in Loop: Header=BB63_8 Depth=1
	cmp	x8, #4001
	b.lt	LBB63_8
; %bb.15:                               ;   in Loop: Header=BB63_8 Depth=1
	ldr	x23, [x19]
	mov	x0, x23
	bl	__ZNSt3__123__libcpp_atomic_monitorEPVKv
	mov	x1, x0
	ldr	x8, [x19]
	ldr	w9, [x19, #16]
	sub	w10, w9, #1
	cmp	w10, #2
	b.hs	LBB63_17
; %bb.16:                               ;   in Loop: Header=BB63_8 Depth=1
	ldapr	w8, [x8]
	b	LBB63_20
LBB63_17:                               ;   in Loop: Header=BB63_8 Depth=1
	cmp	w9, #5
	b.ne	LBB63_19
; %bb.18:                               ;   in Loop: Header=BB63_8 Depth=1
	ldar	w8, [x8]
	b	LBB63_20
LBB63_19:                               ;   in Loop: Header=BB63_8 Depth=1
	ldr	w8, [x8]
LBB63_20:                               ;   in Loop: Header=BB63_8 Depth=1
	ldr	x9, [x19, #8]
	ldr	w9, [x9]
	cmp	w8, w9
	b.ne	LBB63_37
; %bb.21:                               ;   in Loop: Header=BB63_8 Depth=1
	mov	x0, x23
	bl	__ZNSt3__120__libcpp_atomic_waitEPVKvx
	b	LBB63_8
LBB63_22:                               ;   in Loop: Header=BB63_25 Depth=1
	ldapr	w8, [x8]
LBB63_23:                               ;   in Loop: Header=BB63_25 Depth=1
	ldr	x9, [x19, #8]
	ldr	w9, [x9]
	cmp	w8, w9
	b.ne	LBB63_37
; %bb.24:                               ;   in Loop: Header=BB63_25 Depth=1
	mov	x0, x22
	bl	__ZNSt3__120__libcpp_atomic_waitEPVKvx
LBB63_25:                               ; =>This Inner Loop Header: Depth=1
	ldp	x8, x9, [x20]
	ldr	w9, [x9]
	sub	w10, w9, #1
	cmp	w10, #2
	b.hs	LBB63_27
; %bb.26:                               ;   in Loop: Header=BB63_25 Depth=1
	ldapr	w8, [x8]
	ldr	x9, [x20, #16]
	ldr	x9, [x9]
	ldr	w9, [x9]
	cmp	w8, w9
	cset	w0, ne
	b.eq	LBB63_30
	b	LBB63_36
LBB63_27:                               ;   in Loop: Header=BB63_25 Depth=1
	cmp	w9, #5
	b.ne	LBB63_29
; %bb.28:                               ;   in Loop: Header=BB63_25 Depth=1
	ldar	w8, [x8]
	ldr	x9, [x20, #16]
	ldr	x9, [x9]
	ldr	w9, [x9]
	cmp	w8, w9
	cset	w0, ne
	b.eq	LBB63_30
	b	LBB63_36
LBB63_29:                               ;   in Loop: Header=BB63_25 Depth=1
	ldr	w8, [x8]
	ldr	x9, [x20, #16]
	ldr	x9, [x9]
	ldr	w9, [x9]
	cmp	w8, w9
	cset	w0, ne
	b.ne	LBB63_36
LBB63_30:                               ;   in Loop: Header=BB63_25 Depth=1
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	sub	x8, x0, x21
	cmp	x8, #4001
	b.lt	LBB63_25
; %bb.31:                               ;   in Loop: Header=BB63_25 Depth=1
	ldr	x22, [x19]
	mov	x0, x22
	bl	__ZNSt3__123__libcpp_atomic_monitorEPVKv
	mov	x1, x0
	ldr	x8, [x19]
	ldr	w9, [x19, #16]
	sub	w10, w9, #1
	cmp	w10, #2
	b.lo	LBB63_22
; %bb.32:                               ;   in Loop: Header=BB63_25 Depth=1
	cmp	w9, #5
	b.ne	LBB63_34
; %bb.33:                               ;   in Loop: Header=BB63_25 Depth=1
	ldar	w8, [x8]
	b	LBB63_23
LBB63_34:                               ;   in Loop: Header=BB63_25 Depth=1
	ldr	w8, [x8]
	b	LBB63_23
LBB63_35:
	mov	w0, #1                          ; =0x1
LBB63_36:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
LBB63_37:
	mov	w0, #0                          ; =0x0
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__110unique_ptrIN6vquery9HashTableINS1_9AggregateENS1_7KeyHashEEENS_14default_deleteIS5_EEED1B8ne200100Ev ; -- Begin function _ZNSt3__110unique_ptrIN6vquery9HashTableINS1_9AggregateENS1_7KeyHashEEENS_14default_deleteIS5_EEED1B8ne200100Ev
	.globl	__ZNSt3__110unique_ptrIN6vquery9HashTableINS1_9AggregateENS1_7KeyHashEEENS_14default_deleteIS5_EEED1B8ne200100Ev
	.weak_def_can_be_hidden	__ZNSt3__110unique_ptrIN6vquery9HashTableINS1_9AggregateENS1_7KeyHashEEENS_14default_deleteIS5_EEED1B8ne200100Ev
	.p2align	2
__ZNSt3__110unique_ptrIN6vquery9HashTableINS1_9AggregateENS1_7KeyHashEEENS_14default_deleteIS5_EEED1B8ne200100Ev: ; @_ZNSt3__110unique_ptrIN6vquery9HashTableINS1_9AggregateENS1_7KeyHashEEENS_14default_deleteIS5_EEED1B8ne200100Ev
	.cfi_startproc
; %bb.0:
	mov	x8, x0
	ldr	x0, [x0]
	str	xzr, [x8]
	cbz	x0, LBB64_2
; %bb.1:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x8
	bl	__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEED2Ev
	bl	__ZdlPv
	mov	x8, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
LBB64_2:
	mov	x0, x8
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEEm ; -- Begin function _ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEEm
	.weak_def_can_be_hidden	__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEEm
	.p2align	2
__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEEm: ; @_ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEEm
Lfunc_begin30:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception30
; %bb.0:
	sub	sp, sp, #96
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	mov	x21, x2
	mov	x19, x0
	ldr	q0, [x1]
	mov	x20, x0
	str	q0, [x20], #16
	stp	xzr, xzr, [x1]
Ltmp406:
	mov	x8, x20
	mov	w1, #1                          ; =0x1
	bl	__ZN6vquery11make_bufferIjEENSt3__16vectorIT_NS_15BudgetAllocatorIS3_EEEERKNS1_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
Ltmp407:
; %bb.1:
Ltmp409:
	add	x8, x19, #64
	mov	x0, x19
	mov	w1, #1                          ; =0x1
	bl	__ZN6vquery11make_bufferINS_9AggregateEEENSt3__16vectorIT_NS_15BudgetAllocatorIS4_EEEERKNS2_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
Ltmp410:
; %bb.2:
Ltmp412:
	add	x8, x19, #112
	mov	x0, x19
	mov	w1, #1                          ; =0x1
	bl	__ZN6vquery11make_bufferIhEENSt3__16vectorIT_NS_15BudgetAllocatorIS3_EEEERKNS1_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
Ltmp413:
; %bb.3:
	str	xzr, [x19, #160]
	sub	x8, x21, #1
	eor	x9, x21, x8
	cmp	x9, x8
	b.ls	LBB65_6
; %bb.4:
Ltmp423:
	mov	x0, x19
	mov	x1, x21
	bl	__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEE6rehashEm
Ltmp424:
; %bb.5:
	mov	x0, x19
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
LBB65_6:
	mov	w0, #24                         ; =0x18
	bl	___cxa_allocate_exception
	mov	x21, x0
Ltmp415:
Lloh152:
	adrp	x1, l_.str.3@PAGE
Lloh153:
	add	x1, x1, l_.str.3@PAGEOFF
	add	x0, sp, #8
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
Ltmp416:
; %bb.7:
	mov	w23, #1                         ; =0x1
Ltmp418:
	add	x1, sp, #8
	mov	x0, x21
	bl	__ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE
Ltmp419:
; %bb.8:
Lloh154:
	adrp	x8, __ZTVN6vquery5ErrorE@GOTPAGE
Lloh155:
	ldr	x8, [x8, __ZTVN6vquery5ErrorE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x21]
	str	wzr, [x21, #16]
Ltmp420:
	mov	w23, #0                         ; =0x0
Lloh156:
	adrp	x1, __ZTIN6vquery5ErrorE@PAGE
Lloh157:
	add	x1, x1, __ZTIN6vquery5ErrorE@PAGEOFF
Lloh158:
	adrp	x2, __ZN6vquery5ErrorD1Ev@GOTPAGE
Lloh159:
	ldr	x2, [x2, __ZN6vquery5ErrorD1Ev@GOTPAGEOFF]
	mov	x0, x21
	bl	___cxa_throw
Ltmp421:
; %bb.9:
	brk	#0x1
LBB65_10:
Ltmp422:
	mov	x22, x0
	ldrsb	w8, [sp, #31]
	tbz	w8, #31, LBB65_12
; %bb.11:
	ldr	x0, [sp, #8]
	bl	__ZdlPv
	tbnz	w23, #0, LBB65_14
	b	LBB65_16
LBB65_12:
	cbnz	w23, LBB65_14
	b	LBB65_16
LBB65_13:
Ltmp417:
	mov	x22, x0
LBB65_14:
	mov	x0, x21
	bl	___cxa_free_exception
	b	LBB65_16
LBB65_15:
Ltmp425:
	mov	x22, x0
LBB65_16:
	add	x0, x19, #112
	bl	__ZNSt3__16vectorIhN6vquery15BudgetAllocatorIhEEED1B8ne200100Ev
	b	LBB65_18
LBB65_17:
Ltmp414:
	mov	x22, x0
LBB65_18:
	add	x0, x19, #64
	bl	__ZNSt3__16vectorIN6vquery9AggregateENS1_15BudgetAllocatorIS2_EEED1B8ne200100Ev
	b	LBB65_20
LBB65_19:
Ltmp411:
	mov	x22, x0
LBB65_20:
	mov	x0, x20
	bl	__ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEED1B8ne200100Ev
	mov	x0, x19
	bl	__ZNSt3__110shared_ptrIN6vquery12MemoryBudgetEED1B8ne200100Ev
	mov	x0, x22
	bl	__Unwind_Resume
LBB65_21:
Ltmp408:
	mov	x22, x0
	mov	x0, x19
	bl	__ZNSt3__110shared_ptrIN6vquery12MemoryBudgetEED1B8ne200100Ev
	mov	x0, x22
	bl	__Unwind_Resume
	.loh AdrpAdd	Lloh152, Lloh153
	.loh AdrpLdrGot	Lloh158, Lloh159
	.loh AdrpAdd	Lloh156, Lloh157
	.loh AdrpLdrGot	Lloh154, Lloh155
Lfunc_end30:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table65:
Lexception30:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end30-Lcst_begin30
Lcst_begin30:
	.uleb128 Ltmp406-Lfunc_begin30          ; >> Call Site 1 <<
	.uleb128 Ltmp407-Ltmp406                ;   Call between Ltmp406 and Ltmp407
	.uleb128 Ltmp408-Lfunc_begin30          ;     jumps to Ltmp408
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp409-Lfunc_begin30          ; >> Call Site 2 <<
	.uleb128 Ltmp410-Ltmp409                ;   Call between Ltmp409 and Ltmp410
	.uleb128 Ltmp411-Lfunc_begin30          ;     jumps to Ltmp411
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp412-Lfunc_begin30          ; >> Call Site 3 <<
	.uleb128 Ltmp413-Ltmp412                ;   Call between Ltmp412 and Ltmp413
	.uleb128 Ltmp414-Lfunc_begin30          ;     jumps to Ltmp414
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp423-Lfunc_begin30          ; >> Call Site 4 <<
	.uleb128 Ltmp424-Ltmp423                ;   Call between Ltmp423 and Ltmp424
	.uleb128 Ltmp425-Lfunc_begin30          ;     jumps to Ltmp425
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp424-Lfunc_begin30          ; >> Call Site 5 <<
	.uleb128 Ltmp415-Ltmp424                ;   Call between Ltmp424 and Ltmp415
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp415-Lfunc_begin30          ; >> Call Site 6 <<
	.uleb128 Ltmp416-Ltmp415                ;   Call between Ltmp415 and Ltmp416
	.uleb128 Ltmp417-Lfunc_begin30          ;     jumps to Ltmp417
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp418-Lfunc_begin30          ; >> Call Site 7 <<
	.uleb128 Ltmp421-Ltmp418                ;   Call between Ltmp418 and Ltmp421
	.uleb128 Ltmp422-Lfunc_begin30          ;     jumps to Ltmp422
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp421-Lfunc_begin30          ; >> Call Site 8 <<
	.uleb128 Lfunc_end30-Ltmp421            ;   Call between Ltmp421 and Lfunc_end30
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end30:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEED2Ev ; -- Begin function _ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEED2Ev
	.weak_def_can_be_hidden	__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEED2Ev
	.p2align	2
__ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEED2Ev: ; @_ZN6vquery9HashTableINS_9AggregateENS_7KeyHashEED2Ev
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	ldr	x0, [x0, #112]
	cbz	x0, LBB66_2
; %bb.1:
	str	x0, [x19, #120]
	ldr	x8, [x19, #128]
	sub	x20, x8, x0
	bl	__ZdlPv
	ldr	x0, [x19, #136]
	ldr	x2, [x19, #152]
	mov	x1, x20
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
LBB66_2:
	ldr	x20, [x19, #144]
	cbz	x20, LBB66_5
; %bb.3:
	add	x8, x20, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbnz	x8, LBB66_5
; %bb.4:
	ldr	x8, [x20]
	ldr	x8, [x8, #16]
	mov	x0, x20
	blr	x8
	mov	x0, x20
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
LBB66_5:
	ldr	x0, [x19, #64]
	cbz	x0, LBB66_7
; %bb.6:
	str	x0, [x19, #72]
	ldr	x8, [x19, #80]
	sub	x20, x8, x0
	bl	__ZdlPv
	ldr	x0, [x19, #88]
	ldr	x2, [x19, #104]
	mov	x1, x20
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
LBB66_7:
	ldr	x20, [x19, #96]
	cbz	x20, LBB66_10
; %bb.8:
	add	x8, x20, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbnz	x8, LBB66_10
; %bb.9:
	ldr	x8, [x20]
	ldr	x8, [x8, #16]
	mov	x0, x20
	blr	x8
	mov	x0, x20
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
LBB66_10:
	ldr	x0, [x19, #16]
	cbz	x0, LBB66_12
; %bb.11:
	str	x0, [x19, #24]
	ldr	x8, [x19, #32]
	sub	x20, x8, x0
	bl	__ZdlPv
	ldr	x0, [x19, #40]
	ldr	x2, [x19, #56]
	mov	x1, x20
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
LBB66_12:
	ldr	x20, [x19, #48]
	cbz	x20, LBB66_15
; %bb.13:
	add	x8, x20, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbnz	x8, LBB66_15
; %bb.14:
	ldr	x8, [x20]
	ldr	x8, [x8, #16]
	mov	x0, x20
	blr	x8
	mov	x0, x20
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
LBB66_15:
	ldr	x20, [x19, #8]
	cbz	x20, LBB66_17
; %bb.16:
	add	x8, x20, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbz	x8, LBB66_18
LBB66_17:
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
LBB66_18:
	ldr	x8, [x20]
	ldr	x8, [x8, #16]
	mov	x0, x20
	blr	x8
	mov	x0, x20
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorINS_7jthreadENS_9allocatorIS1_EEE22__base_destruct_at_endB8ne200100EPS1_ ; -- Begin function _ZNSt3__16vectorINS_7jthreadENS_9allocatorIS1_EEE22__base_destruct_at_endB8ne200100EPS1_
	.globl	__ZNSt3__16vectorINS_7jthreadENS_9allocatorIS1_EEE22__base_destruct_at_endB8ne200100EPS1_
	.weak_def_can_be_hidden	__ZNSt3__16vectorINS_7jthreadENS_9allocatorIS1_EEE22__base_destruct_at_endB8ne200100EPS1_
	.p2align	2
__ZNSt3__16vectorINS_7jthreadENS_9allocatorIS1_EEE22__base_destruct_at_endB8ne200100EPS1_: ; @_ZNSt3__16vectorINS_7jthreadENS_9allocatorIS1_EEE22__base_destruct_at_endB8ne200100EPS1_
Lfunc_begin31:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception31
; %bb.0:
	stp	x24, x23, [sp, #-64]!           ; 16-byte Folded Spill
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	mov	x19, x1
	mov	x20, x0
	ldr	x8, [x0, #8]
	cmp	x8, x1
	b.eq	LBB67_11
; %bb.1:
	sub	x21, x8, #8
	mov	w22, #-4                        ; =0xfffffffc
	mov	w23, #-1                        ; =0xffffffff
	b	LBB67_3
LBB67_2:                                ;   in Loop: Header=BB67_3 Depth=1
	sub	x8, x21, #8
	sub	x21, x21, #16
	cmp	x8, x19
	b.eq	LBB67_11
LBB67_3:                                ; =>This Inner Loop Header: Depth=1
	ldr	x8, [x21]
	cbz	x8, LBB67_7
; %bb.4:                                ;   in Loop: Header=BB67_3 Depth=1
	ldur	x0, [x21, #-8]
	cbz	x0, LBB67_6
; %bb.5:                                ;   in Loop: Header=BB67_3 Depth=1
	bl	__ZNSt3__112__stop_state14__request_stopB8ne200100Ev
LBB67_6:                                ;   in Loop: Header=BB67_3 Depth=1
Ltmp426:
	mov	x0, x21
	bl	__ZNSt3__16thread4joinEv
Ltmp427:
LBB67_7:                                ;   in Loop: Header=BB67_3 Depth=1
	mov	x0, x21
	bl	__ZNSt3__16threadD1Ev
	ldur	x8, [x21, #-8]
	cbz	x8, LBB67_2
; %bb.8:                                ;   in Loop: Header=BB67_3 Depth=1
	ldadd	w22, w8, [x8]
	ldur	x0, [x21, #-8]
	cbz	x0, LBB67_2
; %bb.9:                                ;   in Loop: Header=BB67_3 Depth=1
	add	x8, x0, #4
	ldaddal	w23, w8, [x8]
	cmp	w8, #1
	b.ne	LBB67_2
; %bb.10:                               ;   in Loop: Header=BB67_3 Depth=1
	bl	__ZdlPv
	b	LBB67_2
LBB67_11:
	str	x19, [x20, #8]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
LBB67_12:
Ltmp428:
	bl	___clang_call_terminate
Lfunc_end31:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table67:
Lexception31:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase10-Lttbaseref10
Lttbaseref10:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end31-Lcst_begin31
Lcst_begin31:
	.uleb128 Ltmp426-Lfunc_begin31          ; >> Call Site 1 <<
	.uleb128 Ltmp427-Ltmp426                ;   Call between Ltmp426 and Ltmp427
	.uleb128 Ltmp428-Lfunc_begin31          ;     jumps to Ltmp428
	.byte	1                               ;   On action: 1
Lcst_end31:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2, 0x0
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase10:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorB8ne200100Ev ; -- Begin function _ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorB8ne200100Ev
	.globl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorB8ne200100Ev
	.weak_def_can_be_hidden	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorB8ne200100Ev
	.p2align	2
__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorB8ne200100Ev: ; @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorB8ne200100Ev
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh160:
	adrp	x0, l_.str.10@PAGE
Lloh161:
	add	x0, x0, l_.str.10@PAGEOFF
	bl	__ZNSt3__120__throw_length_errorB8ne200100EPKc
	.loh AdrpAdd	Lloh160, Lloh161
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN6vquery5ErrorD0Ev           ; -- Begin function _ZN6vquery5ErrorD0Ev
	.weak_def_can_be_hidden	__ZN6vquery5ErrorD0Ev
	.p2align	2
__ZN6vquery5ErrorD0Ev:                  ; @_ZN6vquery5ErrorD0Ev
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	bl	__ZNSt13runtime_errorD2Ev
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	__ZdlPv
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZTSN6vquery5ErrorE    ; @_ZTSN6vquery5ErrorE
	.section	__TEXT,__const
	.globl	__ZTSN6vquery5ErrorE
	.weak_definition	__ZTSN6vquery5ErrorE
__ZTSN6vquery5ErrorE:
	.asciz	"N6vquery5ErrorE"

	.private_extern	__ZTIN6vquery5ErrorE    ; @_ZTIN6vquery5ErrorE
	.section	__DATA,__const
	.globl	__ZTIN6vquery5ErrorE
	.weak_definition	__ZTIN6vquery5ErrorE
	.p2align	3, 0x0
__ZTIN6vquery5ErrorE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSN6vquery5ErrorE-9223372036854775808
	.quad	__ZTISt13runtime_error

	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"unknown execution failure"

l_.str.1:                               ; @.str.1
	.asciz	"allocation failed during execution"

l_.str.2:                               ; @.str.2
	.asciz	"query, storage, or budget mismatch"

l_.str.3:                               ; @.str.3
	.asciz	"hash capacity must be a power of two"

l_.str.4:                               ; @.str.4
	.asciz	"null memory budget"

l_.str.5:                               ; @.str.5
	.asciz	"vector"

l_.str.6:                               ; @.str.6
	.asciz	"allocation size overflow"

l_.str.7:                               ; @.str.7
	.asciz	"hash capacity overflow"

l_.str.8:                               ; @.str.8
	.asciz	"duplicate dimension key"

l_.str.9:                               ; @.str.9
	.asciz	"thread constructor failed"

l_.str.10:                              ; @.str.10
	.asciz	"basic_string"

	.section	__DATA,__const
	.globl	__ZTVN6vquery5ErrorE            ; @_ZTVN6vquery5ErrorE
	.weak_def_can_be_hidden	__ZTVN6vquery5ErrorE
	.p2align	3, 0x0
__ZTVN6vquery5ErrorE:
	.quad	0
	.quad	__ZTIN6vquery5ErrorE
	.quad	__ZN6vquery5ErrorD1Ev
	.quad	__ZN6vquery5ErrorD0Ev
	.quad	__ZNKSt13runtime_error4whatEv

.subsections_via_symbols
