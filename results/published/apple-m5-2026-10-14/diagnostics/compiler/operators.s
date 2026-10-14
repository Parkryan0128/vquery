	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 26, 0	sdk_version 26, 0
	.globl	__ZN6vquery12row_pipelineERKNS_6TablesENS_9QuerySpecEmmPKNS_9HashTableIjNS_7KeyHashEEE ; -- Begin function _ZN6vquery12row_pipelineERKNS_6TablesENS_9QuerySpecEmmPKNS_9HashTableIjNS_7KeyHashEEE
	.p2align	2
__ZN6vquery12row_pipelineERKNS_6TablesENS_9QuerySpecEmmPKNS_9HashTableIjNS_7KeyHashEEE: ; @_ZN6vquery12row_pipelineERKNS_6TablesENS_9QuerySpecEmmPKNS_9HashTableIjNS_7KeyHashEEE
Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception0
; %bb.0:
	sub	sp, sp, #112
	stp	x26, x25, [sp, #32]             ; 16-byte Folded Spill
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
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	mov	x20, x4
	mov	x23, x3
	mov	x24, x2
	mov	x21, x1
	mov	x25, x0
	mov	x19, x8
	bl	__ZN6vquery12_GLOBAL__N_113validate_scanERKNS_6TablesENS_5QueryEmm
	mov	x0, x21
	mov	x1, x20
	bl	__ZN6vquery12_GLOBAL__N_113validate_joinENS_9QuerySpecEPKNS_9HashTableIjNS_7KeyHashEEE
	ldrb	w8, [x25, #16]
	cmp	w8, #1
	b.ne	LBB0_3
; %bb.1:
	cmp	w21, #3
	b.hs	LBB0_10
; %bb.2:
Lloh0:
	adrp	x8, l_switch.table._ZN6vquery12row_pipelineERKNS_6TablesENS_9QuerySpecEmmPKNS_9HashTableIjNS_7KeyHashEEE@PAGE
Lloh1:
	add	x8, x8, l_switch.table._ZN6vquery12row_pipelineERKNS_6TablesENS_9QuerySpecEmmPKNS_9HashTableIjNS_7KeyHashEEE@PAGEOFF
	b	LBB0_5
LBB0_3:
	cmp	w21, #3
	b.hs	LBB0_13
; %bb.4:
Lloh2:
	adrp	x8, l_switch.table._ZN6vquery12row_pipelineERKNS_6TablesENS_9QuerySpecEmmPKNS_9HashTableIjNS_7KeyHashEEE.63@PAGE
Lloh3:
	add	x8, x8, l_switch.table._ZN6vquery12row_pipelineERKNS_6TablesENS_9QuerySpecEmmPKNS_9HashTableIjNS_7KeyHashEEE.63@PAGEOFF
LBB0_5:
	ldr	x26, [x8, w21, sxtw #3]
	mov	w0, #40                         ; =0x28
	bl	__Znwm
	mov	x22, x0
	stp	x26, x25, [x0]
	stp	x24, x23, [x0, #16]
	str	xzr, [x0, #32]
Ltmp16:
	mov	w0, #24                         ; =0x18
	bl	__Znwm
Ltmp17:
; %bb.6:
	mov	x23, x0
	lsr	x8, x21, #32
Lloh4:
	adrp	x9, __ZTVN6vquery12_GLOBAL__N_19FilterRowE@PAGE+16
Lloh5:
	add	x9, x9, __ZTVN6vquery12_GLOBAL__N_19FilterRowE@PAGEOFF+16
	stp	x9, x22, [x0]
	str	w8, [x0, #16]
	str	x0, [x19]
	cbz	x20, LBB0_9
; %bb.7:
Ltmp19:
	mov	w0, #24                         ; =0x18
	bl	__Znwm
Ltmp20:
; %bb.8:
Lloh6:
	adrp	x8, __ZTVN6vquery12_GLOBAL__N_17JoinRowE@PAGE+16
Lloh7:
	add	x8, x8, __ZTVN6vquery12_GLOBAL__N_17JoinRowE@PAGEOFF+16
	stp	x8, x23, [x0]
	str	x20, [x0, #16]
	str	x0, [x19]
LBB0_9:
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
LBB0_10:
	mov	w0, #24                         ; =0x18
	bl	___cxa_allocate_exception
	mov	x19, x0
Ltmp8:
Lloh8:
	adrp	x1, l_.str.5@PAGE
Lloh9:
	add	x1, x1, l_.str.5@PAGEOFF
	add	x0, sp, #8
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
Ltmp9:
; %bb.11:
	mov	w21, #1                         ; =0x1
Ltmp11:
	add	x1, sp, #8
	mov	x0, x19
	bl	__ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE
Ltmp12:
; %bb.12:
Lloh10:
	adrp	x8, __ZTVN6vquery5ErrorE@GOTPAGE
Lloh11:
	ldr	x8, [x8, __ZTVN6vquery5ErrorE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x19]
	str	wzr, [x19, #16]
Ltmp13:
	mov	w21, #0                         ; =0x0
Lloh12:
	adrp	x1, __ZTIN6vquery5ErrorE@PAGE
Lloh13:
	add	x1, x1, __ZTIN6vquery5ErrorE@PAGEOFF
Lloh14:
	adrp	x2, __ZN6vquery5ErrorD1Ev@GOTPAGE
Lloh15:
	ldr	x2, [x2, __ZN6vquery5ErrorD1Ev@GOTPAGEOFF]
	mov	x0, x19
	bl	___cxa_throw
Ltmp14:
	b	LBB0_16
LBB0_13:
	mov	w0, #24                         ; =0x18
	bl	___cxa_allocate_exception
	mov	x19, x0
Ltmp0:
Lloh16:
	adrp	x1, l_.str.5@PAGE
Lloh17:
	add	x1, x1, l_.str.5@PAGEOFF
	add	x0, sp, #8
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
Ltmp1:
; %bb.14:
	mov	w21, #1                         ; =0x1
Ltmp3:
	add	x1, sp, #8
	mov	x0, x19
	bl	__ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE
Ltmp4:
; %bb.15:
Lloh18:
	adrp	x8, __ZTVN6vquery5ErrorE@GOTPAGE
Lloh19:
	ldr	x8, [x8, __ZTVN6vquery5ErrorE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x19]
	str	wzr, [x19, #16]
Ltmp5:
	mov	w21, #0                         ; =0x0
Lloh20:
	adrp	x1, __ZTIN6vquery5ErrorE@PAGE
Lloh21:
	add	x1, x1, __ZTIN6vquery5ErrorE@PAGEOFF
Lloh22:
	adrp	x2, __ZN6vquery5ErrorD1Ev@GOTPAGE
Lloh23:
	ldr	x2, [x2, __ZN6vquery5ErrorD1Ev@GOTPAGEOFF]
	mov	x0, x19
	bl	___cxa_throw
Ltmp6:
LBB0_16:
	brk	#0x1
LBB0_17:
Ltmp7:
	mov	x20, x0
	ldrsb	w8, [sp, #31]
	tbnz	w8, #31, LBB0_20
LBB0_18:
	cbnz	w21, LBB0_24
	b	LBB0_25
LBB0_19:
Ltmp15:
	mov	x20, x0
	ldrsb	w8, [sp, #31]
	tbz	w8, #31, LBB0_18
LBB0_20:
	ldr	x0, [sp, #8]
	bl	__ZdlPv
	tbnz	w21, #0, LBB0_24
	b	LBB0_25
LBB0_21:
Ltmp2:
	b	LBB0_23
LBB0_22:
Ltmp10:
LBB0_23:
	mov	x20, x0
LBB0_24:
	mov	x0, x19
	bl	___cxa_free_exception
LBB0_25:
	mov	x0, x20
	bl	__Unwind_Resume
LBB0_26:
Ltmp21:
	mov	x20, x0
	str	xzr, [x19]
	str	xzr, [x23, #8]
	ldr	x8, [x26, #8]
	mov	x0, x22
	blr	x8
	mov	x0, x23
	bl	__ZdlPv
	mov	x0, x20
	bl	__Unwind_Resume
LBB0_27:
Ltmp18:
	mov	x20, x0
	ldr	x8, [x26, #8]
	mov	x0, x22
	blr	x8
	mov	x0, x20
	bl	__Unwind_Resume
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpLdrGot	Lloh14, Lloh15
	.loh AdrpAdd	Lloh12, Lloh13
	.loh AdrpLdrGot	Lloh10, Lloh11
	.loh AdrpAdd	Lloh16, Lloh17
	.loh AdrpLdrGot	Lloh22, Lloh23
	.loh AdrpAdd	Lloh20, Lloh21
	.loh AdrpLdrGot	Lloh18, Lloh19
Lfunc_end0:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table0:
Lexception0:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end0-Lcst_begin0
Lcst_begin0:
	.uleb128 Lfunc_begin0-Lfunc_begin0      ; >> Call Site 1 <<
	.uleb128 Ltmp16-Lfunc_begin0            ;   Call between Lfunc_begin0 and Ltmp16
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp16-Lfunc_begin0            ; >> Call Site 2 <<
	.uleb128 Ltmp17-Ltmp16                  ;   Call between Ltmp16 and Ltmp17
	.uleb128 Ltmp18-Lfunc_begin0            ;     jumps to Ltmp18
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp19-Lfunc_begin0            ; >> Call Site 3 <<
	.uleb128 Ltmp20-Ltmp19                  ;   Call between Ltmp19 and Ltmp20
	.uleb128 Ltmp21-Lfunc_begin0            ;     jumps to Ltmp21
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp20-Lfunc_begin0            ; >> Call Site 4 <<
	.uleb128 Ltmp8-Ltmp20                   ;   Call between Ltmp20 and Ltmp8
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp8-Lfunc_begin0             ; >> Call Site 5 <<
	.uleb128 Ltmp9-Ltmp8                    ;   Call between Ltmp8 and Ltmp9
	.uleb128 Ltmp10-Lfunc_begin0            ;     jumps to Ltmp10
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp11-Lfunc_begin0            ; >> Call Site 6 <<
	.uleb128 Ltmp14-Ltmp11                  ;   Call between Ltmp11 and Ltmp14
	.uleb128 Ltmp15-Lfunc_begin0            ;     jumps to Ltmp15
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp14-Lfunc_begin0            ; >> Call Site 7 <<
	.uleb128 Ltmp0-Ltmp14                   ;   Call between Ltmp14 and Ltmp0
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp0-Lfunc_begin0             ; >> Call Site 8 <<
	.uleb128 Ltmp1-Ltmp0                    ;   Call between Ltmp0 and Ltmp1
	.uleb128 Ltmp2-Lfunc_begin0             ;     jumps to Ltmp2
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp3-Lfunc_begin0             ; >> Call Site 9 <<
	.uleb128 Ltmp6-Ltmp3                    ;   Call between Ltmp3 and Ltmp6
	.uleb128 Ltmp7-Lfunc_begin0             ;     jumps to Ltmp7
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp6-Lfunc_begin0             ; >> Call Site 10 <<
	.uleb128 Lfunc_end0-Ltmp6               ;   Call between Ltmp6 and Lfunc_end0
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end0:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_113validate_scanERKNS_6TablesENS_5QueryEmm
__ZN6vquery12_GLOBAL__N_113validate_scanERKNS_6TablesENS_5QueryEmm: ; @_ZN6vquery12_GLOBAL__N_113validate_scanERKNS_6TablesENS_5QueryEmm
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
	cmp	x2, x3
	b.hi	LBB1_3
; %bb.1:
	ldr	x8, [x0, #24]
	ldr	w9, [x0, #20]
	cmp	x8, x3
	ccmp	w9, w1, #0, hs
	b.ne	LBB1_3
; %bb.2:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #80
	b	__ZNK6vquery6Tables14validate_shapeEv
LBB1_3:
	mov	w0, #24                         ; =0x18
	bl	___cxa_allocate_exception
	mov	x19, x0
Ltmp22:
Lloh24:
	adrp	x1, l_.str.2@PAGE
Lloh25:
	add	x1, x1, l_.str.2@PAGEOFF
	add	x0, sp, #8
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
Ltmp23:
; %bb.4:
	mov	w21, #1                         ; =0x1
Ltmp25:
	add	x1, sp, #8
	mov	x0, x19
	bl	__ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE
Ltmp26:
; %bb.5:
Lloh26:
	adrp	x8, __ZTVN6vquery5ErrorE@GOTPAGE
Lloh27:
	ldr	x8, [x8, __ZTVN6vquery5ErrorE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x19]
	str	wzr, [x19, #16]
Ltmp27:
	mov	w21, #0                         ; =0x0
Lloh28:
	adrp	x1, __ZTIN6vquery5ErrorE@PAGE
Lloh29:
	add	x1, x1, __ZTIN6vquery5ErrorE@PAGEOFF
Lloh30:
	adrp	x2, __ZN6vquery5ErrorD1Ev@GOTPAGE
Lloh31:
	ldr	x2, [x2, __ZN6vquery5ErrorD1Ev@GOTPAGEOFF]
	mov	x0, x19
	bl	___cxa_throw
Ltmp28:
; %bb.6:
	brk	#0x1
LBB1_7:
Ltmp29:
	mov	x20, x0
	ldrsb	w8, [sp, #31]
	tbz	w8, #31, LBB1_9
; %bb.8:
	ldr	x0, [sp, #8]
	bl	__ZdlPv
	tbnz	w21, #0, LBB1_11
	b	LBB1_12
LBB1_9:
	cbnz	w21, LBB1_11
	b	LBB1_12
LBB1_10:
Ltmp24:
	mov	x20, x0
LBB1_11:
	mov	x0, x19
	bl	___cxa_free_exception
LBB1_12:
	mov	x0, x20
	bl	__Unwind_Resume
	.loh AdrpAdd	Lloh24, Lloh25
	.loh AdrpLdrGot	Lloh30, Lloh31
	.loh AdrpAdd	Lloh28, Lloh29
	.loh AdrpLdrGot	Lloh26, Lloh27
Lfunc_end1:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table1:
Lexception1:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end1-Lcst_begin1
Lcst_begin1:
	.uleb128 Lfunc_begin1-Lfunc_begin1      ; >> Call Site 1 <<
	.uleb128 Ltmp22-Lfunc_begin1            ;   Call between Lfunc_begin1 and Ltmp22
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp22-Lfunc_begin1            ; >> Call Site 2 <<
	.uleb128 Ltmp23-Ltmp22                  ;   Call between Ltmp22 and Ltmp23
	.uleb128 Ltmp24-Lfunc_begin1            ;     jumps to Ltmp24
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp25-Lfunc_begin1            ; >> Call Site 3 <<
	.uleb128 Ltmp28-Ltmp25                  ;   Call between Ltmp25 and Ltmp28
	.uleb128 Ltmp29-Lfunc_begin1            ;     jumps to Ltmp29
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp28-Lfunc_begin1            ; >> Call Site 4 <<
	.uleb128 Lfunc_end1-Ltmp28              ;   Call between Ltmp28 and Lfunc_end1
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end1:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_113validate_joinENS_9QuerySpecEPKNS_9HashTableIjNS_7KeyHashEEE
__ZN6vquery12_GLOBAL__N_113validate_joinENS_9QuerySpecEPKNS_9HashTableIjNS_7KeyHashEEE: ; @_ZN6vquery12_GLOBAL__N_113validate_joinENS_9QuerySpecEPKNS_9HashTableIjNS_7KeyHashEEE
Lfunc_begin2:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception2
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
	mov	x8, #-238521008783361           ; =0xffff2710ffffffff
	movk	x8, #0, lsl #48
	cmp	x0, x8
	b.hi	LBB2_3
; %bb.1:
	cmp	w0, #2
	cset	w8, eq
	cmp	x1, #0
	cset	w9, eq
	eor	w8, w8, w9
	tbz	w8, #0, LBB2_3
; %bb.2:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB2_3:
	mov	w0, #24                         ; =0x18
	bl	___cxa_allocate_exception
	mov	x19, x0
Ltmp30:
Lloh32:
	adrp	x1, l_.str.3@PAGE
Lloh33:
	add	x1, x1, l_.str.3@PAGEOFF
	add	x0, sp, #8
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
Ltmp31:
; %bb.4:
	mov	w21, #1                         ; =0x1
Ltmp33:
	add	x1, sp, #8
	mov	x0, x19
	bl	__ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE
Ltmp34:
; %bb.5:
Lloh34:
	adrp	x8, __ZTVN6vquery5ErrorE@GOTPAGE
Lloh35:
	ldr	x8, [x8, __ZTVN6vquery5ErrorE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x19]
	str	wzr, [x19, #16]
Ltmp35:
	mov	w21, #0                         ; =0x0
Lloh36:
	adrp	x1, __ZTIN6vquery5ErrorE@PAGE
Lloh37:
	add	x1, x1, __ZTIN6vquery5ErrorE@PAGEOFF
Lloh38:
	adrp	x2, __ZN6vquery5ErrorD1Ev@GOTPAGE
Lloh39:
	ldr	x2, [x2, __ZN6vquery5ErrorD1Ev@GOTPAGEOFF]
	mov	x0, x19
	bl	___cxa_throw
Ltmp36:
; %bb.6:
	brk	#0x1
LBB2_7:
Ltmp37:
	mov	x20, x0
	ldrsb	w8, [sp, #31]
	tbz	w8, #31, LBB2_9
; %bb.8:
	ldr	x0, [sp, #8]
	bl	__ZdlPv
	tbnz	w21, #0, LBB2_11
	b	LBB2_12
LBB2_9:
	cbnz	w21, LBB2_11
	b	LBB2_12
LBB2_10:
Ltmp32:
	mov	x20, x0
LBB2_11:
	mov	x0, x19
	bl	___cxa_free_exception
LBB2_12:
	mov	x0, x20
	bl	__Unwind_Resume
	.loh AdrpAdd	Lloh32, Lloh33
	.loh AdrpLdrGot	Lloh38, Lloh39
	.loh AdrpAdd	Lloh36, Lloh37
	.loh AdrpLdrGot	Lloh34, Lloh35
Lfunc_end2:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table2:
Lexception2:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end2-Lcst_begin2
Lcst_begin2:
	.uleb128 Lfunc_begin2-Lfunc_begin2      ; >> Call Site 1 <<
	.uleb128 Ltmp30-Lfunc_begin2            ;   Call between Lfunc_begin2 and Ltmp30
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp30-Lfunc_begin2            ; >> Call Site 2 <<
	.uleb128 Ltmp31-Ltmp30                  ;   Call between Ltmp30 and Ltmp31
	.uleb128 Ltmp32-Lfunc_begin2            ;     jumps to Ltmp32
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp33-Lfunc_begin2            ; >> Call Site 3 <<
	.uleb128 Ltmp36-Ltmp33                  ;   Call between Ltmp33 and Ltmp36
	.uleb128 Ltmp37-Lfunc_begin2            ;     jumps to Ltmp37
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp36-Lfunc_begin2            ; >> Call Site 4 <<
	.uleb128 Lfunc_end2-Ltmp36              ;   Call between Ltmp36 and Lfunc_end2
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end2:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN6vquery10batch_scanERKNS_6TablesENS_5QueryEmm ; -- Begin function _ZN6vquery10batch_scanERKNS_6TablesENS_5QueryEmm
	.p2align	2
__ZN6vquery10batch_scanERKNS_6TablesENS_5QueryEmm: ; @_ZN6vquery10batch_scanERKNS_6TablesENS_5QueryEmm
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
	mov	x20, x3
	mov	x21, x2
	mov	x22, x1
	mov	x23, x0
	mov	x19, x8
	bl	__ZN6vquery12_GLOBAL__N_113validate_scanERKNS_6TablesENS_5QueryEmm
	ldrb	w8, [x23, #16]
	cmp	w8, #1
	b.eq	LBB3_2
; %bb.1:
	mov	w0, #64                         ; =0x40
	bl	__Znwm
Lloh40:
	adrp	x8, __ZTVN6vquery12_GLOBAL__N_19ScanBatchE@PAGE+16
Lloh41:
	add	x8, x8, __ZTVN6vquery12_GLOBAL__N_19ScanBatchE@PAGEOFF+16
	stp	x8, x23, [x0]
	str	w22, [x0, #16]
	stp	x21, x20, [x0, #24]
	stp	xzr, xzr, [x0, #48]
	str	xzr, [x0, #40]
	str	x0, [x19]
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
LBB3_2:
	mov	w0, #24                         ; =0x18
	bl	___cxa_allocate_exception
	mov	x19, x0
Ltmp38:
Lloh42:
	adrp	x1, l_.str@PAGE
Lloh43:
	add	x1, x1, l_.str@PAGEOFF
	add	x0, sp, #8
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
Ltmp39:
; %bb.3:
	mov	w21, #1                         ; =0x1
Ltmp41:
	add	x1, sp, #8
	mov	x0, x19
	bl	__ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE
Ltmp42:
; %bb.4:
Lloh44:
	adrp	x8, __ZTVN6vquery5ErrorE@GOTPAGE
Lloh45:
	ldr	x8, [x8, __ZTVN6vquery5ErrorE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x19]
	str	wzr, [x19, #16]
Ltmp43:
	mov	w21, #0                         ; =0x0
Lloh46:
	adrp	x1, __ZTIN6vquery5ErrorE@PAGE
Lloh47:
	add	x1, x1, __ZTIN6vquery5ErrorE@PAGEOFF
Lloh48:
	adrp	x2, __ZN6vquery5ErrorD1Ev@GOTPAGE
Lloh49:
	ldr	x2, [x2, __ZN6vquery5ErrorD1Ev@GOTPAGEOFF]
	mov	x0, x19
	bl	___cxa_throw
Ltmp44:
; %bb.5:
	brk	#0x1
LBB3_6:
Ltmp45:
	mov	x20, x0
	ldrsb	w8, [sp, #31]
	tbz	w8, #31, LBB3_8
; %bb.7:
	ldr	x0, [sp, #8]
	bl	__ZdlPv
	tbnz	w21, #0, LBB3_10
	b	LBB3_11
LBB3_8:
	cbnz	w21, LBB3_10
	b	LBB3_11
LBB3_9:
Ltmp40:
	mov	x20, x0
LBB3_10:
	mov	x0, x19
	bl	___cxa_free_exception
LBB3_11:
	mov	x0, x20
	bl	__Unwind_Resume
	.loh AdrpAdd	Lloh40, Lloh41
	.loh AdrpAdd	Lloh42, Lloh43
	.loh AdrpLdrGot	Lloh48, Lloh49
	.loh AdrpAdd	Lloh46, Lloh47
	.loh AdrpLdrGot	Lloh44, Lloh45
Lfunc_end3:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table3:
Lexception3:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end3-Lcst_begin3
Lcst_begin3:
	.uleb128 Lfunc_begin3-Lfunc_begin3      ; >> Call Site 1 <<
	.uleb128 Ltmp38-Lfunc_begin3            ;   Call between Lfunc_begin3 and Ltmp38
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp38-Lfunc_begin3            ; >> Call Site 2 <<
	.uleb128 Ltmp39-Ltmp38                  ;   Call between Ltmp38 and Ltmp39
	.uleb128 Ltmp40-Lfunc_begin3            ;     jumps to Ltmp40
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp41-Lfunc_begin3            ; >> Call Site 3 <<
	.uleb128 Ltmp44-Ltmp41                  ;   Call between Ltmp41 and Ltmp44
	.uleb128 Ltmp45-Lfunc_begin3            ;     jumps to Ltmp45
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp44-Lfunc_begin3            ; >> Call Site 4 <<
	.uleb128 Lfunc_end3-Ltmp44              ;   Call between Ltmp44 and Lfunc_end3
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end3:
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
	b.hs	LBB4_6
; %bb.1:
	mov	x20, x0
	cmp	x0, #23
	b.hs	LBB4_3
; %bb.2:
	strb	w20, [x19, #23]
	mov	x22, x19
	cbnz	x20, LBB4_4
	b	LBB4_5
LBB4_3:
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
LBB4_4:
	mov	x0, x22
	mov	x1, x21
	mov	x2, x20
	bl	_memmove
LBB4_5:
	strb	wzr, [x22, x20]
	mov	x0, x19
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
LBB4_6:
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
	.globl	__ZN6vquery12batch_filterENSt3__110unique_ptrINS_11BatchSourceENS0_14default_deleteIS2_EEEEj ; -- Begin function _ZN6vquery12batch_filterENSt3__110unique_ptrINS_11BatchSourceENS0_14default_deleteIS2_EEEEj
	.p2align	2
__ZN6vquery12batch_filterENSt3__110unique_ptrINS_11BatchSourceENS0_14default_deleteIS2_EEEEj: ; @_ZN6vquery12batch_filterENSt3__110unique_ptrINS_11BatchSourceENS0_14default_deleteIS2_EEEEj
Lfunc_begin4:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception4
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
	mov	x19, x8
	ldr	x23, [x0]
	mov	w8, #10000                      ; =0x2710
	cmp	w1, w8
	ccmp	x23, #0, #4, ls
	b.eq	LBB6_3
; %bb.1:
	mov	x21, x1
	mov	x22, x0
	mov	w0, #80                         ; =0x50
	bl	__Znwm
	mov	x20, x0
	str	xzr, [x22]
Lloh50:
	adrp	x8, __ZTVN6vquery12_GLOBAL__N_111FilterBatchE@PAGE+16
Lloh51:
	add	x8, x8, __ZTVN6vquery12_GLOBAL__N_111FilterBatchE@PAGEOFF+16
	stp	x8, x23, [x0]
	str	w21, [x0, #16]
	stp	xzr, xzr, [x0, #32]
	str	xzr, [x0, #24]
Ltmp54:
	mov	w0, #136                        ; =0x88
	bl	__Znwm
Ltmp55:
; %bb.2:
	str	xzr, [x0, #16]
Lloh52:
	adrp	x8, __ZTVNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEEE@GOTPAGE
Lloh53:
	ldr	x8, [x8, __ZTVNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEEE@GOTPAGEOFF]
	add	x8, x8, #16
	stp	x8, xzr, [x0]
	mov	w8, #43943                      ; =0xaba7
	movk	w8, #12970, lsl #16
	mov	x9, x0
	str	x8, [x9, #24]!
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x0, #32]
	stp	q0, q0, [x0, #64]
	stp	q0, q0, [x0, #96]
	mov	x8, #-1                         ; =0xffffffffffffffff
	str	x8, [x0, #128]
	stp	x9, x0, [x20, #48]
	mov	w8, #1                          ; =0x1
	stp	x8, xzr, [x20, #64]
	str	x20, [x19]
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
LBB6_3:
	mov	w0, #24                         ; =0x18
	bl	___cxa_allocate_exception
	mov	x19, x0
Ltmp46:
Lloh54:
	adrp	x1, l_.str.1@PAGE
Lloh55:
	add	x1, x1, l_.str.1@PAGEOFF
	add	x0, sp, #8
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
Ltmp47:
; %bb.4:
	mov	w20, #1                         ; =0x1
Ltmp49:
	add	x1, sp, #8
	mov	x0, x19
	bl	__ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE
Ltmp50:
; %bb.5:
Lloh56:
	adrp	x8, __ZTVN6vquery5ErrorE@GOTPAGE
Lloh57:
	ldr	x8, [x8, __ZTVN6vquery5ErrorE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x19]
	str	wzr, [x19, #16]
Ltmp51:
	mov	w20, #0                         ; =0x0
Lloh58:
	adrp	x1, __ZTIN6vquery5ErrorE@PAGE
Lloh59:
	add	x1, x1, __ZTIN6vquery5ErrorE@PAGEOFF
Lloh60:
	adrp	x2, __ZN6vquery5ErrorD1Ev@GOTPAGE
Lloh61:
	ldr	x2, [x2, __ZN6vquery5ErrorD1Ev@GOTPAGEOFF]
	mov	x0, x19
	bl	___cxa_throw
Ltmp52:
; %bb.6:
	brk	#0x1
LBB6_7:
Ltmp53:
	mov	x21, x0
	ldrsb	w8, [sp, #31]
	tbz	w8, #31, LBB6_9
; %bb.8:
	ldr	x0, [sp, #8]
	bl	__ZdlPv
	tbnz	w20, #0, LBB6_11
	b	LBB6_12
LBB6_9:
	cbnz	w20, LBB6_11
	b	LBB6_12
LBB6_10:
Ltmp48:
	mov	x21, x0
LBB6_11:
	mov	x0, x19
	bl	___cxa_free_exception
LBB6_12:
	mov	x0, x21
	bl	__Unwind_Resume
LBB6_13:
Ltmp56:
	mov	x21, x0
	str	xzr, [x20, #8]
	ldr	x9, [x23]
	ldr	x9, [x9, #8]
	mov	x0, x23
	blr	x9
	mov	x0, x20
	bl	__ZdlPv
	mov	x0, x21
	bl	__Unwind_Resume
	.loh AdrpAdd	Lloh50, Lloh51
	.loh AdrpLdrGot	Lloh52, Lloh53
	.loh AdrpAdd	Lloh54, Lloh55
	.loh AdrpLdrGot	Lloh60, Lloh61
	.loh AdrpAdd	Lloh58, Lloh59
	.loh AdrpLdrGot	Lloh56, Lloh57
Lfunc_end4:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table6:
Lexception4:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end4-Lcst_begin4
Lcst_begin4:
	.uleb128 Lfunc_begin4-Lfunc_begin4      ; >> Call Site 1 <<
	.uleb128 Ltmp54-Lfunc_begin4            ;   Call between Lfunc_begin4 and Ltmp54
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp54-Lfunc_begin4            ; >> Call Site 2 <<
	.uleb128 Ltmp55-Ltmp54                  ;   Call between Ltmp54 and Ltmp55
	.uleb128 Ltmp56-Lfunc_begin4            ;     jumps to Ltmp56
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp55-Lfunc_begin4            ; >> Call Site 3 <<
	.uleb128 Ltmp46-Ltmp55                  ;   Call between Ltmp55 and Ltmp46
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp46-Lfunc_begin4            ; >> Call Site 4 <<
	.uleb128 Ltmp47-Ltmp46                  ;   Call between Ltmp46 and Ltmp47
	.uleb128 Ltmp48-Lfunc_begin4            ;     jumps to Ltmp48
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp49-Lfunc_begin4            ; >> Call Site 5 <<
	.uleb128 Ltmp52-Ltmp49                  ;   Call between Ltmp49 and Ltmp52
	.uleb128 Ltmp53-Lfunc_begin4            ;     jumps to Ltmp53
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp52-Lfunc_begin4            ; >> Call Site 6 <<
	.uleb128 Lfunc_end4-Ltmp52              ;   Call between Ltmp52 and Lfunc_end4
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end4:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN6vquery14batch_pipelineERKNS_6TablesENS_9QuerySpecEmmPKNS_9HashTableIjNS_7KeyHashEEE ; -- Begin function _ZN6vquery14batch_pipelineERKNS_6TablesENS_9QuerySpecEmmPKNS_9HashTableIjNS_7KeyHashEEE
	.p2align	2
__ZN6vquery14batch_pipelineERKNS_6TablesENS_9QuerySpecEmmPKNS_9HashTableIjNS_7KeyHashEEE: ; @_ZN6vquery14batch_pipelineERKNS_6TablesENS_9QuerySpecEmmPKNS_9HashTableIjNS_7KeyHashEEE
Lfunc_begin5:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception5
; %bb.0:
	sub	sp, sp, #96
	stp	x26, x25, [sp, #16]             ; 16-byte Folded Spill
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
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	mov	x21, x4
	mov	x20, x3
	mov	x22, x2
	mov	x23, x1
	mov	x24, x0
	mov	x19, x8
	lsr	x25, x1, #32
	mov	x0, x1
	mov	x1, x4
	bl	__ZN6vquery12_GLOBAL__N_113validate_joinENS_9QuerySpecEPKNS_9HashTableIjNS_7KeyHashEEE
	add	x8, sp, #8
	mov	x0, x24
	mov	x1, x23
	mov	x2, x22
	mov	x3, x20
	bl	__ZN6vquery10batch_scanERKNS_6TablesENS_5QueryEmm
Ltmp57:
	add	x0, sp, #8
	mov	x8, x19
	mov	x1, x25
	bl	__ZN6vquery12batch_filterENSt3__110unique_ptrINS_11BatchSourceENS0_14default_deleteIS2_EEEEj
Ltmp58:
; %bb.1:
	ldr	x0, [sp, #8]
	cbz	x0, LBB7_3
; %bb.2:
	ldr	x8, [x0]
	ldr	x8, [x8, #8]
	blr	x8
LBB7_3:
	cbz	x21, LBB7_8
; %bb.4:
Ltmp60:
	mov	w0, #128                        ; =0x80
	bl	__Znwm
Ltmp61:
; %bb.5:
	mov	x20, x0
	ldr	x22, [x19]
Lloh62:
	adrp	x8, __ZTVN6vquery12_GLOBAL__N_19JoinBatchE@PAGE+16
Lloh63:
	add	x8, x8, __ZTVN6vquery12_GLOBAL__N_19JoinBatchE@PAGEOFF+16
	stp	x8, x22, [x0]
	str	x21, [x0, #16]
	mov	x21, x0
	str	xzr, [x21, #24]!
	stp	xzr, xzr, [x0, #32]
Ltmp63:
	mov	w0, #136                        ; =0x88
	bl	__Znwm
Ltmp64:
; %bb.6:
	mov	w22, #43943                     ; =0xaba7
	movk	w22, #12970, lsl #16
	str	xzr, [x0, #16]
Lloh64:
	adrp	x8, __ZTVNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEEE@GOTPAGE
Lloh65:
	ldr	x8, [x8, __ZTVNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEEE@GOTPAGEOFF]
	add	x23, x8, #16
	stp	x23, xzr, [x0]
	mov	x8, x0
	str	x22, [x8, #24]!
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x0, #32]
	stp	q0, q0, [x0, #64]
	stp	q0, q0, [x0, #96]
	mov	x24, #-1                        ; =0xffffffffffffffff
	str	x24, [x0, #128]
	stp	x8, x0, [x20, #48]
	mov	w8, #1                          ; =0x1
	stp	x8, xzr, [x20, #64]
	stp	xzr, xzr, [x20, #80]
Ltmp66:
	mov	w0, #136                        ; =0x88
	bl	__Znwm
Ltmp67:
; %bb.7:
	stp	xzr, xzr, [x0, #8]
	str	x23, [x0]
	mov	x8, x0
	str	x22, [x8, #24]!
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x0, #32]
	stp	q0, q0, [x0, #64]
	stp	q0, q0, [x0, #96]
	str	x24, [x0, #128]
	stp	x8, x0, [x20, #96]
	mov	w8, #1                          ; =0x1
	stp	x8, xzr, [x20, #112]
	str	x20, [x19]
LBB7_8:
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
LBB7_9:
Ltmp68:
	mov	x8, x21
	mov	x21, x0
	mov	x0, x8
	bl	__ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEED1B8ne200100Ev
	ldr	x22, [x20, #8]
	b	LBB7_11
LBB7_10:
Ltmp65:
	mov	x21, x0
LBB7_11:
	str	xzr, [x20, #8]
	cbz	x22, LBB7_13
; %bb.12:
	ldr	x8, [x22]
	ldr	x8, [x8, #8]
	mov	x0, x22
	blr	x8
LBB7_13:
	mov	x0, x20
	bl	__ZdlPv
	str	xzr, [x19]
	mov	x0, x21
	bl	__Unwind_Resume
LBB7_14:
Ltmp62:
	mov	x21, x0
	ldr	x0, [x19]
	str	xzr, [x19]
	cbz	x0, LBB7_17
LBB7_15:
	ldr	x8, [x0]
	ldr	x8, [x8, #8]
	blr	x8
	mov	x0, x21
	bl	__Unwind_Resume
LBB7_16:
Ltmp59:
	mov	x21, x0
	ldr	x0, [sp, #8]
	cbnz	x0, LBB7_15
LBB7_17:
	mov	x0, x21
	bl	__Unwind_Resume
	.loh AdrpAdd	Lloh62, Lloh63
	.loh AdrpLdrGot	Lloh64, Lloh65
Lfunc_end5:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table7:
Lexception5:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end5-Lcst_begin5
Lcst_begin5:
	.uleb128 Lfunc_begin5-Lfunc_begin5      ; >> Call Site 1 <<
	.uleb128 Ltmp57-Lfunc_begin5            ;   Call between Lfunc_begin5 and Ltmp57
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp57-Lfunc_begin5            ; >> Call Site 2 <<
	.uleb128 Ltmp58-Ltmp57                  ;   Call between Ltmp57 and Ltmp58
	.uleb128 Ltmp59-Lfunc_begin5            ;     jumps to Ltmp59
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp58-Lfunc_begin5            ; >> Call Site 3 <<
	.uleb128 Ltmp60-Ltmp58                  ;   Call between Ltmp58 and Ltmp60
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp60-Lfunc_begin5            ; >> Call Site 4 <<
	.uleb128 Ltmp61-Ltmp60                  ;   Call between Ltmp60 and Ltmp61
	.uleb128 Ltmp62-Lfunc_begin5            ;     jumps to Ltmp62
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp63-Lfunc_begin5            ; >> Call Site 5 <<
	.uleb128 Ltmp64-Ltmp63                  ;   Call between Ltmp63 and Ltmp64
	.uleb128 Ltmp65-Lfunc_begin5            ;     jumps to Ltmp65
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp66-Lfunc_begin5            ; >> Call Site 6 <<
	.uleb128 Ltmp67-Ltmp66                  ;   Call between Ltmp66 and Ltmp67
	.uleb128 Ltmp68-Lfunc_begin5            ;     jumps to Ltmp68
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp67-Lfunc_begin5            ; >> Call Site 7 <<
	.uleb128 Lfunc_end5-Ltmp67              ;   Call between Ltmp67 and Lfunc_end5
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end5:
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
Lloh66:
	adrp	x0, l_.str.4@PAGE
Lloh67:
	add	x0, x0, l_.str.4@PAGEOFF
	bl	__ZNSt3__120__throw_length_errorB8ne200100EPKc
	.loh AdrpAdd	Lloh66, Lloh67
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__120__throw_length_errorB8ne200100EPKc ; -- Begin function _ZNSt3__120__throw_length_errorB8ne200100EPKc
	.globl	__ZNSt3__120__throw_length_errorB8ne200100EPKc
	.weak_def_can_be_hidden	__ZNSt3__120__throw_length_errorB8ne200100EPKc
	.p2align	2
__ZNSt3__120__throw_length_errorB8ne200100EPKc: ; @_ZNSt3__120__throw_length_errorB8ne200100EPKc
Lfunc_begin6:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception6
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
Ltmp69:
	mov	x1, x20
	bl	__ZNSt12length_errorC1B8ne200100EPKc
Ltmp70:
; %bb.1:
Lloh68:
	adrp	x1, __ZTISt12length_error@GOTPAGE
Lloh69:
	ldr	x1, [x1, __ZTISt12length_error@GOTPAGEOFF]
Lloh70:
	adrp	x2, __ZNSt12length_errorD1Ev@GOTPAGE
Lloh71:
	ldr	x2, [x2, __ZNSt12length_errorD1Ev@GOTPAGEOFF]
	mov	x0, x19
	bl	___cxa_throw
LBB9_2:
Ltmp71:
	mov	x20, x0
	mov	x0, x19
	bl	___cxa_free_exception
	mov	x0, x20
	bl	__Unwind_Resume
	.loh AdrpLdrGot	Lloh70, Lloh71
	.loh AdrpLdrGot	Lloh68, Lloh69
Lfunc_end6:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table9:
Lexception6:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end6-Lcst_begin6
Lcst_begin6:
	.uleb128 Lfunc_begin6-Lfunc_begin6      ; >> Call Site 1 <<
	.uleb128 Ltmp69-Lfunc_begin6            ;   Call between Lfunc_begin6 and Ltmp69
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp69-Lfunc_begin6            ; >> Call Site 2 <<
	.uleb128 Ltmp70-Ltmp69                  ;   Call between Ltmp69 and Ltmp70
	.uleb128 Ltmp71-Lfunc_begin6            ;     jumps to Ltmp71
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp70-Lfunc_begin6            ; >> Call Site 3 <<
	.uleb128 Lfunc_end6-Ltmp70              ;   Call between Ltmp70 and Lfunc_end6
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end6:
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
Lloh72:
	adrp	x8, __ZTVSt12length_error@GOTPAGE
Lloh73:
	ldr	x8, [x8, __ZTVSt12length_error@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x0]
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.loh AdrpLdrGot	Lloh72, Lloh73
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
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE0EED1Ev
__ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE0EED1Ev: ; @_ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE0EED1Ev
	.cfi_startproc
; %bb.0:
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE0EED0Ev
__ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE0EED0Ev: ; @_ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE0EED0Ev
	.cfi_startproc
; %bb.0:
	b	__ZdlPv
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE0EE4openERNS_16ExecutionContextE
__ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE0EE4openERNS_16ExecutionContextE: ; @_ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE0EE4openERNS_16ExecutionContextE
	.cfi_startproc
; %bb.0:
	ldr	x8, [x0, #16]
	str	x8, [x0, #32]
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE0EE4nextERNS_3RowE
__ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE0EE4nextERNS_3RowE: ; @_ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE0EE4nextERNS_3RowE
	.cfi_startproc
; %bb.0:
	ldp	x9, x8, [x0, #24]
	cmp	x8, x9
	b.eq	LBB16_2
; %bb.1:
	ldr	x10, [x0, #8]
	ldr	x10, [x10, #40]
	mov	w11, #24                        ; =0x18
	madd	x10, x8, x11, x10
	ldr	w11, [x10, #16]
	str	w11, [x1]
	ldr	x10, [x10, #8]
	str	x10, [x1, #16]
	add	x10, x8, #1
	str	x10, [x0, #32]
LBB16_2:
	cmp	x8, x9
	cset	w0, ne
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE0EE5closeEv
__ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE0EE5closeEv: ; @_ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE0EE5closeEv
	.cfi_startproc
; %bb.0:
	ldr	x8, [x0, #24]
	str	x8, [x0, #32]
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE1EED1Ev
__ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE1EED1Ev: ; @_ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE1EED1Ev
	.cfi_startproc
; %bb.0:
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE1EED0Ev
__ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE1EED0Ev: ; @_ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE1EED0Ev
	.cfi_startproc
; %bb.0:
	b	__ZdlPv
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE1EE4openERNS_16ExecutionContextE
__ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE1EE4openERNS_16ExecutionContextE: ; @_ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE1EE4openERNS_16ExecutionContextE
	.cfi_startproc
; %bb.0:
	ldr	x8, [x0, #16]
	str	x8, [x0, #32]
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE1EE4nextERNS_3RowE
__ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE1EE4nextERNS_3RowE: ; @_ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE1EE4nextERNS_3RowE
	.cfi_startproc
; %bb.0:
	ldp	x9, x8, [x0, #24]
	cmp	x8, x9
	b.eq	LBB21_2
; %bb.1:
	ldr	x10, [x0, #8]
	ldr	x10, [x10, #40]
	mov	w11, #24                        ; =0x18
	madd	x10, x8, x11, x10
	ldr	w11, [x10, #16]
	ldr	x12, [x10, #8]
	str	x12, [x1, #16]
	ldr	w10, [x10, #4]
	stp	w11, w10, [x1]
	add	x10, x8, #1
	str	x10, [x0, #32]
LBB21_2:
	cmp	x8, x9
	cset	w0, ne
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE1EE5closeEv
__ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE1EE5closeEv: ; @_ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE1EE5closeEv
	.cfi_startproc
; %bb.0:
	ldr	x8, [x0, #24]
	str	x8, [x0, #32]
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE2EED1Ev
__ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE2EED1Ev: ; @_ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE2EED1Ev
	.cfi_startproc
; %bb.0:
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE2EED0Ev
__ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE2EED0Ev: ; @_ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE2EED0Ev
	.cfi_startproc
; %bb.0:
	b	__ZdlPv
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE2EE4openERNS_16ExecutionContextE
__ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE2EE4openERNS_16ExecutionContextE: ; @_ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE2EE4openERNS_16ExecutionContextE
	.cfi_startproc
; %bb.0:
	ldr	x8, [x0, #16]
	str	x8, [x0, #32]
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE2EE4nextERNS_3RowE
__ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE2EE4nextERNS_3RowE: ; @_ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE2EE4nextERNS_3RowE
	.cfi_startproc
; %bb.0:
	ldp	x9, x8, [x0, #24]
	cmp	x8, x9
	b.eq	LBB26_2
; %bb.1:
	ldr	x10, [x0, #8]
	ldr	x10, [x10, #40]
	mov	w11, #24                        ; =0x18
	madd	x10, x8, x11, x10
	ldr	w11, [x10, #16]
	str	w11, [x1]
	ldr	x11, [x10, #8]
	str	x11, [x1, #16]
	ldr	w10, [x10]
	str	w10, [x1, #8]
	add	x10, x8, #1
	str	x10, [x0, #32]
LBB26_2:
	cmp	x8, x9
	cset	w0, ne
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE2EE5closeEv
__ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE2EE5closeEv: ; @_ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE2EE5closeEv
	.cfi_startproc
; %bb.0:
	ldr	x8, [x0, #24]
	str	x8, [x0, #32]
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE0EED1Ev
__ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE0EED1Ev: ; @_ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE0EED1Ev
	.cfi_startproc
; %bb.0:
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE0EED0Ev
__ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE0EED0Ev: ; @_ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE0EED0Ev
	.cfi_startproc
; %bb.0:
	b	__ZdlPv
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE0EE4openERNS_16ExecutionContextE
__ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE0EE4openERNS_16ExecutionContextE: ; @_ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE0EE4openERNS_16ExecutionContextE
	.cfi_startproc
; %bb.0:
	ldr	x8, [x0, #16]
	str	x8, [x0, #32]
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE0EE4nextERNS_3RowE
__ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE0EE4nextERNS_3RowE: ; @_ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE0EE4nextERNS_3RowE
	.cfi_startproc
; %bb.0:
	ldp	x9, x8, [x0, #24]
	cmp	x8, x9
	b.eq	LBB31_2
; %bb.1:
	ldr	x10, [x0, #8]
	ldr	x11, [x10, #184]
	ldr	w11, [x11, x8, lsl #2]
	str	w11, [x1]
	ldr	x10, [x10, #232]
	ldr	x10, [x10, x8, lsl #3]
	str	x10, [x1, #16]
	add	x10, x8, #1
	str	x10, [x0, #32]
LBB31_2:
	cmp	x8, x9
	cset	w0, ne
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE0EE5closeEv
__ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE0EE5closeEv: ; @_ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE0EE5closeEv
	.cfi_startproc
; %bb.0:
	ldr	x8, [x0, #24]
	str	x8, [x0, #32]
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE1EED1Ev
__ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE1EED1Ev: ; @_ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE1EED1Ev
	.cfi_startproc
; %bb.0:
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE1EED0Ev
__ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE1EED0Ev: ; @_ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE1EED0Ev
	.cfi_startproc
; %bb.0:
	b	__ZdlPv
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE1EE4openERNS_16ExecutionContextE
__ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE1EE4openERNS_16ExecutionContextE: ; @_ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE1EE4openERNS_16ExecutionContextE
	.cfi_startproc
; %bb.0:
	ldr	x8, [x0, #16]
	str	x8, [x0, #32]
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE1EE4nextERNS_3RowE
__ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE1EE4nextERNS_3RowE: ; @_ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE1EE4nextERNS_3RowE
	.cfi_startproc
; %bb.0:
	ldp	x9, x8, [x0, #24]
	cmp	x8, x9
	b.eq	LBB36_2
; %bb.1:
	ldr	x10, [x0, #8]
	ldr	x11, [x10, #184]
	ldr	w11, [x11, x8, lsl #2]
	str	w11, [x1]
	ldr	x11, [x10, #232]
	ldr	x11, [x11, x8, lsl #3]
	str	x11, [x1, #16]
	ldr	x10, [x10, #136]
	ldr	w10, [x10, x8, lsl #2]
	str	w10, [x1, #4]
	add	x10, x8, #1
	str	x10, [x0, #32]
LBB36_2:
	cmp	x8, x9
	cset	w0, ne
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE1EE5closeEv
__ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE1EE5closeEv: ; @_ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE1EE5closeEv
	.cfi_startproc
; %bb.0:
	ldr	x8, [x0, #24]
	str	x8, [x0, #32]
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE2EED1Ev
__ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE2EED1Ev: ; @_ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE2EED1Ev
	.cfi_startproc
; %bb.0:
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE2EED0Ev
__ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE2EED0Ev: ; @_ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE2EED0Ev
	.cfi_startproc
; %bb.0:
	b	__ZdlPv
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE2EE4openERNS_16ExecutionContextE
__ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE2EE4openERNS_16ExecutionContextE: ; @_ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE2EE4openERNS_16ExecutionContextE
	.cfi_startproc
; %bb.0:
	ldr	x8, [x0, #16]
	str	x8, [x0, #32]
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE2EE4nextERNS_3RowE
__ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE2EE4nextERNS_3RowE: ; @_ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE2EE4nextERNS_3RowE
	.cfi_startproc
; %bb.0:
	ldp	x9, x8, [x0, #24]
	cmp	x8, x9
	b.eq	LBB41_2
; %bb.1:
	ldr	x10, [x0, #8]
	ldr	x11, [x10, #184]
	ldr	w11, [x11, x8, lsl #2]
	str	w11, [x1]
	ldr	x11, [x10, #232]
	ldr	x11, [x11, x8, lsl #3]
	str	x11, [x1, #16]
	ldr	x10, [x10, #88]
	ldr	w10, [x10, x8, lsl #2]
	str	w10, [x1, #8]
	add	x10, x8, #1
	str	x10, [x0, #32]
LBB41_2:
	cmp	x8, x9
	cset	w0, ne
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE2EE5closeEv
__ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE2EE5closeEv: ; @_ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE2EE5closeEv
	.cfi_startproc
; %bb.0:
	ldr	x8, [x0, #24]
	str	x8, [x0, #32]
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_19FilterRowD1Ev
__ZN6vquery12_GLOBAL__N_19FilterRowD1Ev: ; @_ZN6vquery12_GLOBAL__N_19FilterRowD1Ev
	.cfi_startproc
; %bb.0:
	ldr	x8, [x0, #8]
	str	xzr, [x0, #8]
	cbz	x8, LBB43_2
; %bb.1:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	ldr	x9, [x8]
	ldr	x9, [x9, #8]
	mov	x19, x0
	mov	x0, x8
	blr	x9
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
LBB43_2:
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_19FilterRowD0Ev
__ZN6vquery12_GLOBAL__N_19FilterRowD0Ev: ; @_ZN6vquery12_GLOBAL__N_19FilterRowD0Ev
	.cfi_startproc
; %bb.0:
	ldr	x8, [x0, #8]
	str	xzr, [x0, #8]
	cbz	x8, LBB44_2
; %bb.1:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	ldr	x9, [x8]
	ldr	x9, [x9, #8]
	mov	x19, x0
	mov	x0, x8
	blr	x9
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
LBB44_2:
	b	__ZdlPv
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_19FilterRow4openERNS_16ExecutionContextE
__ZN6vquery12_GLOBAL__N_19FilterRow4openERNS_16ExecutionContextE: ; @_ZN6vquery12_GLOBAL__N_19FilterRow4openERNS_16ExecutionContextE
	.cfi_startproc
; %bb.0:
	ldr	x0, [x0, #8]
	ldr	x8, [x0]
	ldr	x2, [x8, #16]
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_19FilterRow4nextERNS_3RowE
__ZN6vquery12_GLOBAL__N_19FilterRow4nextERNS_3RowE: ; @_ZN6vquery12_GLOBAL__N_19FilterRow4nextERNS_3RowE
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
	mov	x19, x1
	mov	x20, x0
LBB46_1:                                ; =>This Inner Loop Header: Depth=1
	ldr	x0, [x20, #8]
	ldr	x8, [x0]
	ldr	x8, [x8, #24]
	mov	x1, x19
	blr	x8
	cbz	w0, LBB46_3
; %bb.2:                                ;   in Loop: Header=BB46_1 Depth=1
	ldr	w8, [x19]
	ldr	w9, [x20, #16]
	cmp	w8, w9
	b.hs	LBB46_1
LBB46_3:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_19FilterRow5closeEv
__ZN6vquery12_GLOBAL__N_19FilterRow5closeEv: ; @_ZN6vquery12_GLOBAL__N_19FilterRow5closeEv
	.cfi_startproc
; %bb.0:
	ldr	x0, [x0, #8]
	ldr	x8, [x0]
	ldr	x1, [x8, #32]
	br	x1
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17JoinRowD1Ev
__ZN6vquery12_GLOBAL__N_17JoinRowD1Ev:  ; @_ZN6vquery12_GLOBAL__N_17JoinRowD1Ev
	.cfi_startproc
; %bb.0:
	ldr	x8, [x0, #8]
	str	xzr, [x0, #8]
	cbz	x8, LBB48_2
; %bb.1:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	ldr	x9, [x8]
	ldr	x9, [x9, #8]
	mov	x19, x0
	mov	x0, x8
	blr	x9
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
LBB48_2:
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17JoinRowD0Ev
__ZN6vquery12_GLOBAL__N_17JoinRowD0Ev:  ; @_ZN6vquery12_GLOBAL__N_17JoinRowD0Ev
	.cfi_startproc
; %bb.0:
	ldr	x8, [x0, #8]
	str	xzr, [x0, #8]
	cbz	x8, LBB49_2
; %bb.1:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	ldr	x9, [x8]
	ldr	x9, [x9, #8]
	mov	x19, x0
	mov	x0, x8
	blr	x9
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
LBB49_2:
	b	__ZdlPv
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17JoinRow4openERNS_16ExecutionContextE
__ZN6vquery12_GLOBAL__N_17JoinRow4openERNS_16ExecutionContextE: ; @_ZN6vquery12_GLOBAL__N_17JoinRow4openERNS_16ExecutionContextE
	.cfi_startproc
; %bb.0:
	ldr	x0, [x0, #8]
	ldr	x8, [x0]
	ldr	x2, [x8, #16]
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17JoinRow4nextERNS_3RowE
__ZN6vquery12_GLOBAL__N_17JoinRow4nextERNS_3RowE: ; @_ZN6vquery12_GLOBAL__N_17JoinRow4nextERNS_3RowE
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
	mov	x19, x1
	mov	x20, x0
	ldr	x0, [x0, #8]
	ldr	x8, [x0]
	ldr	x8, [x8, #24]
	blr	x8
	cbz	w0, LBB51_8
; %bb.1:
	mov	x21, #64915                     ; =0xfd93
	movk	x21, #26201, lsl #16
	movk	x21, #65208, lsl #32
	movk	x21, #55016, lsl #48
	mov	x22, #58809                     ; =0xe5b9
	movk	x22, #7396, lsl #16
	movk	x22, #18285, lsl #32
	movk	x22, #48984, lsl #48
	mov	x23, #4587                      ; =0x11eb
	movk	x23, #4913, lsl #16
	movk	x23, #18875, lsl #32
	movk	x23, #38096, lsl #48
	b	LBB51_4
LBB51_2:                                ;   in Loop: Header=BB51_4 Depth=1
	ldr	x8, [x8, #64]
	cbnz	x8, LBB51_9
LBB51_3:                                ;   in Loop: Header=BB51_4 Depth=1
	ldr	x0, [x20, #8]
	ldr	x8, [x0]
	ldr	x8, [x8, #24]
	mov	x1, x19
	blr	x8
	tbz	w0, #0, LBB51_7
LBB51_4:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB51_5 Depth 2
	ldr	x8, [x20, #16]
	ldr	w9, [x19, #8]
	eor	x10, x9, x21
	eor	x10, x10, x10, lsr #30
	mul	x10, x10, x22
	eor	x10, x10, x10, lsr #27
	mul	x10, x10, x23
	eor	x10, x10, x10, lsr #31
	ldp	x11, x12, [x8, #16]
	sub	x12, x12, x11
	asr	x12, x12, #2
	sub	x12, x12, #1
	ldr	x13, [x8, #112]
	and	x10, x10, x12
	ldrb	w14, [x13, x10]
	cbz	w14, LBB51_3
LBB51_5:                                ;   Parent Loop BB51_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w14, [x11, x10, lsl #2]
	cmp	w14, w9
	b.eq	LBB51_2
; %bb.6:                                ;   in Loop: Header=BB51_5 Depth=2
	add	x10, x10, #1
	and	x10, x10, x12
	ldrb	w14, [x13, x10]
	cbnz	w14, LBB51_5
	b	LBB51_3
LBB51_7:
	mov	w0, #0                          ; =0x0
LBB51_8:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
LBB51_9:
	ldr	w8, [x8, x10, lsl #2]
	str	w8, [x19, #4]
	mov	w0, #1                          ; =0x1
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_17JoinRow5closeEv
__ZN6vquery12_GLOBAL__N_17JoinRow5closeEv: ; @_ZN6vquery12_GLOBAL__N_17JoinRow5closeEv
	.cfi_startproc
; %bb.0:
	ldr	x0, [x0, #8]
	ldr	x8, [x0]
	ldr	x1, [x8, #32]
	br	x1
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_19ScanBatchD1Ev
__ZN6vquery12_GLOBAL__N_19ScanBatchD1Ev: ; @_ZN6vquery12_GLOBAL__N_19ScanBatchD1Ev
	.cfi_startproc
; %bb.0:
	ldr	x8, [x0, #56]
	cbz	x8, LBB53_3
; %bb.1:
	add	x9, x8, #4
	mov	w10, #-1                        ; =0xffffffff
	ldaddal	w10, w9, [x9]
	cmp	w9, #1
	b.ne	LBB53_3
; %bb.2:
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
LBB53_3:
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_19ScanBatchD0Ev
__ZN6vquery12_GLOBAL__N_19ScanBatchD0Ev: ; @_ZN6vquery12_GLOBAL__N_19ScanBatchD0Ev
	.cfi_startproc
; %bb.0:
	ldr	x8, [x0, #56]
	cbz	x8, LBB54_3
; %bb.1:
	add	x9, x8, #4
	mov	w10, #-1                        ; =0xffffffff
	ldaddal	w10, w9, [x9]
	cmp	w9, #1
	b.ne	LBB54_3
; %bb.2:
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
LBB54_3:
	b	__ZdlPv
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_19ScanBatch4openERNS_16ExecutionContextE
__ZN6vquery12_GLOBAL__N_19ScanBatch4openERNS_16ExecutionContextE: ; @_ZN6vquery12_GLOBAL__N_19ScanBatch4openERNS_16ExecutionContextE
Lfunc_begin7:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception7
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
	ldr	x8, [x1, #8]
	mov	x9, #-8193                      ; =0xffffffffffffdfff
	mov	x10, #-7937                     ; =0xffffffffffffe0ff
	add	x9, x8, x9
	cmp	x9, x10
	mov	w9, #16383                      ; =0x3fff
	add	x9, x8, x9
	and	x9, x9, x8
	ccmp	x9, #0, #0, hs
	b.ne	LBB55_9
; %bb.1:
	ldr	x9, [x0, #24]
	stp	x9, x8, [x0, #40]
	ldr	x9, [x1, #48]
	ldr	x8, [x0, #56]
	cmp	x9, x8
	b.eq	LBB55_8
; %bb.2:
	cbz	x9, LBB55_4
; %bb.3:
	add	x8, x9, #4
	mov	w9, #1                          ; =0x1
	ldadd	w9, w8, [x8]
	ldr	x8, [x0, #56]
LBB55_4:
	cbz	x8, LBB55_7
; %bb.5:
	add	x9, x8, #4
	mov	w10, #-1                        ; =0xffffffff
	ldaddal	w10, w9, [x9]
	cmp	w9, #1
	b.ne	LBB55_7
; %bb.6:
	mov	x19, x0
	mov	x0, x8
	mov	x20, x1
	bl	__ZdlPv
	mov	x1, x20
	mov	x0, x19
LBB55_7:
	ldr	x8, [x1, #48]
	str	x8, [x0, #56]
LBB55_8:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB55_9:
	mov	w0, #24                         ; =0x18
	bl	___cxa_allocate_exception
	mov	x19, x0
Ltmp72:
Lloh74:
	adrp	x1, l_.str.6@PAGE
Lloh75:
	add	x1, x1, l_.str.6@PAGEOFF
	add	x0, sp, #8
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
Ltmp73:
; %bb.10:
	mov	w21, #1                         ; =0x1
Ltmp75:
	add	x1, sp, #8
	mov	x0, x19
	bl	__ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE
Ltmp76:
; %bb.11:
Lloh76:
	adrp	x8, __ZTVN6vquery5ErrorE@GOTPAGE
Lloh77:
	ldr	x8, [x8, __ZTVN6vquery5ErrorE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x19]
	str	wzr, [x19, #16]
Ltmp77:
	mov	w21, #0                         ; =0x0
Lloh78:
	adrp	x1, __ZTIN6vquery5ErrorE@PAGE
Lloh79:
	add	x1, x1, __ZTIN6vquery5ErrorE@PAGEOFF
Lloh80:
	adrp	x2, __ZN6vquery5ErrorD1Ev@GOTPAGE
Lloh81:
	ldr	x2, [x2, __ZN6vquery5ErrorD1Ev@GOTPAGEOFF]
	mov	x0, x19
	bl	___cxa_throw
Ltmp78:
; %bb.12:
	brk	#0x1
LBB55_13:
Ltmp79:
	mov	x20, x0
	ldrsb	w8, [sp, #31]
	tbz	w8, #31, LBB55_15
; %bb.14:
	ldr	x0, [sp, #8]
	bl	__ZdlPv
	tbnz	w21, #0, LBB55_17
	b	LBB55_18
LBB55_15:
	cbnz	w21, LBB55_17
	b	LBB55_18
LBB55_16:
Ltmp74:
	mov	x20, x0
LBB55_17:
	mov	x0, x19
	bl	___cxa_free_exception
LBB55_18:
	mov	x0, x20
	bl	__Unwind_Resume
	.loh AdrpAdd	Lloh74, Lloh75
	.loh AdrpLdrGot	Lloh80, Lloh81
	.loh AdrpAdd	Lloh78, Lloh79
	.loh AdrpLdrGot	Lloh76, Lloh77
Lfunc_end7:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table55:
Lexception7:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end7-Lcst_begin7
Lcst_begin7:
	.uleb128 Lfunc_begin7-Lfunc_begin7      ; >> Call Site 1 <<
	.uleb128 Ltmp72-Lfunc_begin7            ;   Call between Lfunc_begin7 and Ltmp72
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp72-Lfunc_begin7            ; >> Call Site 2 <<
	.uleb128 Ltmp73-Ltmp72                  ;   Call between Ltmp72 and Ltmp73
	.uleb128 Ltmp74-Lfunc_begin7            ;     jumps to Ltmp74
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp75-Lfunc_begin7            ; >> Call Site 3 <<
	.uleb128 Ltmp78-Ltmp75                  ;   Call between Ltmp75 and Ltmp78
	.uleb128 Ltmp79-Lfunc_begin7            ;     jumps to Ltmp79
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp78-Lfunc_begin7            ; >> Call Site 4 <<
	.uleb128 Lfunc_end7-Ltmp78              ;   Call between Ltmp78 and Lfunc_end7
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end7:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_19ScanBatch4nextERNS_5BatchE
__ZN6vquery12_GLOBAL__N_19ScanBatch4nextERNS_5BatchE: ; @_ZN6vquery12_GLOBAL__N_19ScanBatch4nextERNS_5BatchE
	.cfi_startproc
; %bb.0:
	ldr	x8, [x0, #56]
	cbz	x8, LBB56_2
; %bb.1:
	ldapr	w8, [x8]
	tbnz	w8, #0, LBB56_3
LBB56_2:
	ldp	x9, x8, [x0, #32]
	subs	x8, x9, x8
	b.ne	LBB56_4
LBB56_3:
	mov	w0, #0                          ; =0x0
	ret
LBB56_4:
	ldr	x9, [x0, #48]
	cmp	x8, x9
	csel	x8, x8, x9, lo
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x1, #64]
	stp	q0, q0, [x1, #32]
	stp	q0, q0, [x1]
	ldr	x9, [x0, #8]
	ldp	x10, x11, [x9, #184]
	sub	x11, x11, x10
	asr	x11, x11, #2
	ldr	x12, [x0, #40]
	sub	x11, x11, x12
	cmn	x8, #1
	csel	x11, x11, x8, eq
	ldp	x13, x14, [x9, #232]
	sub	x14, x14, x13
	asr	x14, x14, #3
	add	x10, x10, x12, lsl #2
	str	x11, [x1, #8]
	ldr	x11, [x0, #40]
	sub	x12, x14, x11
	cmn	x8, #1
	str	x10, [x1]
	csel	x10, x12, x8, eq
	add	x11, x13, x11, lsl #3
	stp	x11, x10, [x1, #48]
	ldr	w10, [x0, #16]
	cmp	w10, #1
	b.eq	LBB56_7
; %bb.5:
	cmp	w10, #2
	b.ne	LBB56_9
; %bb.6:
	mov	w10, #40                        ; =0x28
	mov	w11, #32                        ; =0x20
	mov	w12, #96                        ; =0x60
	mov	w13, #88                        ; =0x58
	b	LBB56_8
LBB56_7:
	mov	w10, #24                        ; =0x18
	mov	w11, #16                        ; =0x10
	mov	w12, #144                       ; =0x90
	mov	w13, #136                       ; =0x88
LBB56_8:
	ldr	x13, [x9, x13]
	ldr	x9, [x9, x12]
	sub	x9, x9, x13
	asr	x9, x9, #2
	ldr	x12, [x0, #40]
	sub	x9, x9, x12
	cmn	x8, #1
	csel	x9, x9, x8, eq
	add	x12, x13, x12, lsl #2
	str	x12, [x1, x11]
	str	x9, [x1, x10]
LBB56_9:
	stp	x8, x8, [x1, #80]
	ldr	x9, [x0, #40]
	add	x8, x9, x8
	str	x8, [x0, #40]
	mov	w0, #1                          ; =0x1
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_19ScanBatch5closeEv
__ZN6vquery12_GLOBAL__N_19ScanBatch5closeEv: ; @_ZN6vquery12_GLOBAL__N_19ScanBatch5closeEv
	.cfi_startproc
; %bb.0:
	ldr	x8, [x0, #32]
	str	x8, [x0, #40]
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_111FilterBatchD1Ev
__ZN6vquery12_GLOBAL__N_111FilterBatchD1Ev: ; @_ZN6vquery12_GLOBAL__N_111FilterBatchD1Ev
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
	ldr	x0, [x0, #72]
	cbz	x0, LBB58_3
; %bb.1:
	add	x8, x0, #4
	mov	w9, #-1                         ; =0xffffffff
	ldaddal	w9, w8, [x8]
	cmp	w8, #1
	b.ne	LBB58_3
; %bb.2:
	bl	__ZdlPv
LBB58_3:
	ldr	x0, [x19, #24]
	cbz	x0, LBB58_5
; %bb.4:
	str	x0, [x19, #32]
	ldr	x8, [x19, #40]
	sub	x20, x8, x0
	bl	__ZdlPv
	ldr	x0, [x19, #48]
	ldr	x2, [x19, #64]
	mov	x1, x20
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
LBB58_5:
	ldr	x20, [x19, #56]
	cbz	x20, LBB58_8
; %bb.6:
	add	x8, x20, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbnz	x8, LBB58_8
; %bb.7:
	ldr	x8, [x20]
	ldr	x8, [x8, #16]
	mov	x0, x20
	blr	x8
	mov	x0, x20
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
LBB58_8:
	ldr	x0, [x19, #8]
	str	xzr, [x19, #8]
	cbz	x0, LBB58_10
; %bb.9:
	ldr	x8, [x0]
	ldr	x8, [x8, #8]
	blr	x8
LBB58_10:
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_111FilterBatchD0Ev
__ZN6vquery12_GLOBAL__N_111FilterBatchD0Ev: ; @_ZN6vquery12_GLOBAL__N_111FilterBatchD0Ev
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
	ldr	x0, [x0, #72]
	cbz	x0, LBB59_3
; %bb.1:
	add	x8, x0, #4
	mov	w9, #-1                         ; =0xffffffff
	ldaddal	w9, w8, [x8]
	cmp	w8, #1
	b.ne	LBB59_3
; %bb.2:
	bl	__ZdlPv
LBB59_3:
	ldr	x0, [x19, #24]
	cbz	x0, LBB59_5
; %bb.4:
	str	x0, [x19, #32]
	ldr	x8, [x19, #40]
	sub	x20, x8, x0
	bl	__ZdlPv
	ldr	x0, [x19, #48]
	ldr	x2, [x19, #64]
	mov	x1, x20
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
LBB59_5:
	ldr	x20, [x19, #56]
	cbz	x20, LBB59_8
; %bb.6:
	add	x8, x20, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbnz	x8, LBB59_8
; %bb.7:
	ldr	x8, [x20]
	ldr	x8, [x8, #16]
	mov	x0, x20
	blr	x8
	mov	x0, x20
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
LBB59_8:
	ldr	x0, [x19, #8]
	str	xzr, [x19, #8]
	cbz	x0, LBB59_10
; %bb.9:
	ldr	x8, [x0]
	ldr	x8, [x8, #8]
	blr	x8
LBB59_10:
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	b	__ZdlPv
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_111FilterBatch4openERNS_16ExecutionContextE
__ZN6vquery12_GLOBAL__N_111FilterBatch4openERNS_16ExecutionContextE: ; @_ZN6vquery12_GLOBAL__N_111FilterBatch4openERNS_16ExecutionContextE
Lfunc_begin8:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception8
; %bb.0:
	sub	sp, sp, #96
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
	ldr	x8, [x1, #8]
	mov	x9, #-8193                      ; =0xffffffffffffdfff
	mov	x10, #-7937                     ; =0xffffffffffffe0ff
	add	x9, x8, x9
	cmp	x9, x10
	mov	w9, #16383                      ; =0x3fff
	add	x9, x8, x9
	and	x8, x9, x8
	ccmp	x8, #0, #0, hs
	b.ne	LBB60_23
; %bb.1:
	mov	x19, x1
	mov	x20, x0
	ldr	x8, [x1, #48]
	ldr	x0, [x0, #72]
	cmp	x8, x0
	b.eq	LBB60_8
; %bb.2:
	cbz	x8, LBB60_4
; %bb.3:
	add	x8, x8, #4
	mov	w9, #1                          ; =0x1
	ldadd	w9, w8, [x8]
	ldr	x0, [x20, #72]
LBB60_4:
	cbz	x0, LBB60_7
; %bb.5:
	add	x8, x0, #4
	mov	w9, #-1                         ; =0xffffffff
	ldaddal	w9, w8, [x8]
	cmp	w8, #1
	b.ne	LBB60_7
; %bb.6:
	bl	__ZdlPv
LBB60_7:
	ldr	x8, [x19, #48]
	str	x8, [x20, #72]
LBB60_8:
	mov	x8, sp
	add	x0, x19, #24
	mov	w1, #1                          ; =0x1
	bl	__ZN6vquery11make_bufferIjEENSt3__16vectorIT_NS_15BudgetAllocatorIS3_EEEERKNS1_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
	mov	x21, x20
	ldr	x0, [x21, #24]!
	cbz	x0, LBB60_10
; %bb.9:
	str	x0, [x20, #32]
	ldr	x8, [x20, #40]
	sub	x22, x8, x0
	bl	__ZdlPv
	ldr	x0, [x20, #48]
	ldr	x2, [x20, #64]
	mov	x1, x22
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
	stp	xzr, xzr, [x21]
	str	xzr, [x21, #16]
LBB60_10:
	ldp	x9, x8, [sp, #24]
	cbz	x8, LBB60_12
; %bb.11:
	add	x10, x8, #8
	mov	w11, #1                         ; =0x1
	ldadd	x11, x10, [x10]
LBB60_12:
	ldr	x22, [x20, #56]
	stp	x9, x8, [x20, #48]
	cbz	x22, LBB60_15
; %bb.13:
	add	x8, x22, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbnz	x8, LBB60_15
; %bb.14:
	ldr	x8, [x22]
	ldr	x8, [x8, #16]
	mov	x0, x22
	blr	x8
	mov	x0, x22
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
LBB60_15:
	ldp	x22, x8, [sp, #32]
	str	x8, [x20, #64]
	ldr	q0, [sp]
	stur	q0, [x20, #24]
	ldr	x8, [sp, #16]
	str	x8, [x20, #40]
	stp	xzr, xzr, [sp]
	str	xzr, [sp, #16]
	cbz	x22, LBB60_17
; %bb.16:
	add	x8, x22, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbz	x8, LBB60_19
LBB60_17:
	ldr	x8, [x19, #8]
	ldp	x9, x10, [x20, #24]
	sub	x10, x10, x9
	asr	x10, x10, #2
	subs	x1, x8, x10
	b.ls	LBB60_20
LBB60_18:
	mov	x0, x21
	bl	__ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEE8__appendEm
	b	LBB60_22
LBB60_19:
	ldr	x8, [x22]
	ldr	x8, [x8, #16]
	mov	x0, x22
	blr	x8
	mov	x0, x22
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
	ldr	x8, [x19, #8]
	ldp	x9, x10, [x20, #24]
	sub	x10, x10, x9
	asr	x10, x10, #2
	subs	x1, x8, x10
	b.hi	LBB60_18
LBB60_20:
	b.hs	LBB60_22
; %bb.21:
	add	x8, x9, x8, lsl #2
	str	x8, [x20, #32]
LBB60_22:
	ldr	x0, [x20, #8]
	ldr	x8, [x0]
	ldr	x8, [x8, #16]
	mov	x1, x19
	blr	x8
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
LBB60_23:
	mov	w0, #24                         ; =0x18
	bl	___cxa_allocate_exception
	mov	x19, x0
Ltmp80:
Lloh82:
	adrp	x1, l_.str.6@PAGE
Lloh83:
	add	x1, x1, l_.str.6@PAGEOFF
	mov	x0, sp
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
Ltmp81:
; %bb.24:
	mov	w21, #1                         ; =0x1
Ltmp83:
	mov	x1, sp
	mov	x0, x19
	bl	__ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE
Ltmp84:
; %bb.25:
Lloh84:
	adrp	x8, __ZTVN6vquery5ErrorE@GOTPAGE
Lloh85:
	ldr	x8, [x8, __ZTVN6vquery5ErrorE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x19]
	str	wzr, [x19, #16]
Ltmp85:
	mov	w21, #0                         ; =0x0
Lloh86:
	adrp	x1, __ZTIN6vquery5ErrorE@PAGE
Lloh87:
	add	x1, x1, __ZTIN6vquery5ErrorE@PAGEOFF
Lloh88:
	adrp	x2, __ZN6vquery5ErrorD1Ev@GOTPAGE
Lloh89:
	ldr	x2, [x2, __ZN6vquery5ErrorD1Ev@GOTPAGEOFF]
	mov	x0, x19
	bl	___cxa_throw
Ltmp86:
; %bb.26:
	brk	#0x1
LBB60_27:
Ltmp87:
	mov	x20, x0
	ldrsb	w8, [sp, #23]
	tbz	w8, #31, LBB60_29
; %bb.28:
	ldr	x0, [sp]
	bl	__ZdlPv
	tbnz	w21, #0, LBB60_31
	b	LBB60_32
LBB60_29:
	cbnz	w21, LBB60_31
	b	LBB60_32
LBB60_30:
Ltmp82:
	mov	x20, x0
LBB60_31:
	mov	x0, x19
	bl	___cxa_free_exception
LBB60_32:
	mov	x0, x20
	bl	__Unwind_Resume
	.loh AdrpAdd	Lloh82, Lloh83
	.loh AdrpLdrGot	Lloh88, Lloh89
	.loh AdrpAdd	Lloh86, Lloh87
	.loh AdrpLdrGot	Lloh84, Lloh85
Lfunc_end8:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table60:
Lexception8:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end8-Lcst_begin8
Lcst_begin8:
	.uleb128 Lfunc_begin8-Lfunc_begin8      ; >> Call Site 1 <<
	.uleb128 Ltmp80-Lfunc_begin8            ;   Call between Lfunc_begin8 and Ltmp80
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp80-Lfunc_begin8            ; >> Call Site 2 <<
	.uleb128 Ltmp81-Ltmp80                  ;   Call between Ltmp80 and Ltmp81
	.uleb128 Ltmp82-Lfunc_begin8            ;     jumps to Ltmp82
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp83-Lfunc_begin8            ; >> Call Site 3 <<
	.uleb128 Ltmp86-Ltmp83                  ;   Call between Ltmp83 and Ltmp86
	.uleb128 Ltmp87-Lfunc_begin8            ;     jumps to Ltmp87
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp86-Lfunc_begin8            ; >> Call Site 4 <<
	.uleb128 Lfunc_end8-Ltmp86              ;   Call between Ltmp86 and Lfunc_end8
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end8:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_111FilterBatch4nextERNS_5BatchE
__ZN6vquery12_GLOBAL__N_111FilterBatch4nextERNS_5BatchE: ; @_ZN6vquery12_GLOBAL__N_111FilterBatch4nextERNS_5BatchE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #128
	stp	x20, x19, [sp, #96]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #112]            ; 16-byte Folded Spill
	add	x29, sp, #112
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x1
	mov	x20, x0
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [sp, #64]
	stp	q0, q0, [sp, #32]
	stp	q0, q0, [sp]
	b	LBB61_3
LBB61_1:                                ;   in Loop: Header=BB61_3 Depth=1
	mov	x10, #0                         ; =0x0
LBB61_2:                                ;   in Loop: Header=BB61_3 Depth=1
	cbnz	x10, LBB61_57
LBB61_3:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB61_18 Depth 2
                                        ;     Child Loop BB61_37 Depth 2
                                        ;     Child Loop BB61_41 Depth 2
                                        ;     Child Loop BB61_14 Depth 2
	ldr	x8, [x20, #72]
	cbz	x8, LBB61_5
; %bb.4:                                ;   in Loop: Header=BB61_3 Depth=1
	ldapr	w8, [x8]
	tbnz	w8, #0, LBB61_59
LBB61_5:                                ;   in Loop: Header=BB61_3 Depth=1
	ldr	x0, [x20, #8]
	ldr	x8, [x0]
	ldr	x8, [x8, #24]
	mov	x1, sp
	blr	x8
	cbz	w0, LBB61_58
; %bb.6:                                ;   in Loop: Header=BB61_3 Depth=1
	ldr	x13, [sp, #88]
	cbz	x13, LBB61_1
; %bb.7:                                ;   in Loop: Header=BB61_3 Depth=1
	ldr	x10, [sp, #72]
	ldr	x8, [sp]
	and	x9, x13, #0x7
	cbz	x10, LBB61_10
; %bb.8:                                ;   in Loop: Header=BB61_3 Depth=1
	ldr	x11, [sp, #64]
	cmp	x13, #8
	b.hs	LBB61_16
; %bb.9:                                ;   in Loop: Header=BB61_3 Depth=1
	mov	x12, #0                         ; =0x0
	mov	x10, #0                         ; =0x0
	cbnz	x9, LBB61_35
	b	LBB61_2
LBB61_10:                               ;   in Loop: Header=BB61_3 Depth=1
	cmp	x13, #8
	b.hs	LBB61_39
; %bb.11:                               ;   in Loop: Header=BB61_3 Depth=1
	mov	x11, #0                         ; =0x0
	mov	x10, #0                         ; =0x0
LBB61_12:                               ;   in Loop: Header=BB61_3 Depth=1
	cbnz	x9, LBB61_14
	b	LBB61_2
LBB61_13:                               ;   in Loop: Header=BB61_14 Depth=2
	add	x11, x11, #1
	subs	x9, x9, #1
	b.eq	LBB61_2
LBB61_14:                               ;   Parent Loop BB61_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w12, [x8, x11, lsl #2]
	ldr	w13, [x20, #16]
	cmp	w12, w13
	b.hs	LBB61_13
; %bb.15:                               ;   in Loop: Header=BB61_14 Depth=2
	ldr	x12, [x20, #24]
	str	w11, [x12, x10, lsl #2]
	add	x10, x10, #1
	b	LBB61_13
LBB61_16:                               ;   in Loop: Header=BB61_3 Depth=1
	mov	x12, #0                         ; =0x0
	mov	x10, #0                         ; =0x0
	and	x13, x13, #0xfffffffffffffff8
	neg	x13, x13
	add	x14, x11, #16
	b	LBB61_18
LBB61_17:                               ;   in Loop: Header=BB61_18 Depth=2
	sub	x12, x12, #8
	add	x14, x14, #32
	cmp	x13, x12
	b.eq	LBB61_34
LBB61_18:                               ;   Parent Loop BB61_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldur	w15, [x14, #-16]
	ldr	w16, [x8, x15, lsl #2]
	ldr	w17, [x20, #16]
	cmp	w16, w17
	b.lo	LBB61_26
; %bb.19:                               ;   in Loop: Header=BB61_18 Depth=2
	ldur	w15, [x14, #-12]
	ldr	w16, [x8, x15, lsl #2]
	ldr	w17, [x20, #16]
	cmp	w16, w17
	b.lo	LBB61_27
LBB61_20:                               ;   in Loop: Header=BB61_18 Depth=2
	ldur	w15, [x14, #-8]
	ldr	w16, [x8, x15, lsl #2]
	ldr	w17, [x20, #16]
	cmp	w16, w17
	b.lo	LBB61_28
LBB61_21:                               ;   in Loop: Header=BB61_18 Depth=2
	ldur	w15, [x14, #-4]
	ldr	w16, [x8, x15, lsl #2]
	ldr	w17, [x20, #16]
	cmp	w16, w17
	b.lo	LBB61_29
LBB61_22:                               ;   in Loop: Header=BB61_18 Depth=2
	ldr	w15, [x14]
	ldr	w16, [x8, x15, lsl #2]
	ldr	w17, [x20, #16]
	cmp	w16, w17
	b.lo	LBB61_30
LBB61_23:                               ;   in Loop: Header=BB61_18 Depth=2
	ldr	w15, [x14, #4]
	ldr	w16, [x8, x15, lsl #2]
	ldr	w17, [x20, #16]
	cmp	w16, w17
	b.lo	LBB61_31
LBB61_24:                               ;   in Loop: Header=BB61_18 Depth=2
	ldr	w15, [x14, #8]
	ldr	w16, [x8, x15, lsl #2]
	ldr	w17, [x20, #16]
	cmp	w16, w17
	b.lo	LBB61_32
LBB61_25:                               ;   in Loop: Header=BB61_18 Depth=2
	ldr	w15, [x14, #12]
	ldr	w16, [x8, x15, lsl #2]
	ldr	w17, [x20, #16]
	cmp	w16, w17
	b.hs	LBB61_17
	b	LBB61_33
LBB61_26:                               ;   in Loop: Header=BB61_18 Depth=2
	ldr	x16, [x20, #24]
	str	w15, [x16, x10, lsl #2]
	add	x10, x10, #1
	ldur	w15, [x14, #-12]
	ldr	w16, [x8, x15, lsl #2]
	ldr	w17, [x20, #16]
	cmp	w16, w17
	b.hs	LBB61_20
LBB61_27:                               ;   in Loop: Header=BB61_18 Depth=2
	ldr	x16, [x20, #24]
	str	w15, [x16, x10, lsl #2]
	add	x10, x10, #1
	ldur	w15, [x14, #-8]
	ldr	w16, [x8, x15, lsl #2]
	ldr	w17, [x20, #16]
	cmp	w16, w17
	b.hs	LBB61_21
LBB61_28:                               ;   in Loop: Header=BB61_18 Depth=2
	ldr	x16, [x20, #24]
	str	w15, [x16, x10, lsl #2]
	add	x10, x10, #1
	ldur	w15, [x14, #-4]
	ldr	w16, [x8, x15, lsl #2]
	ldr	w17, [x20, #16]
	cmp	w16, w17
	b.hs	LBB61_22
LBB61_29:                               ;   in Loop: Header=BB61_18 Depth=2
	ldr	x16, [x20, #24]
	str	w15, [x16, x10, lsl #2]
	add	x10, x10, #1
	ldr	w15, [x14]
	ldr	w16, [x8, x15, lsl #2]
	ldr	w17, [x20, #16]
	cmp	w16, w17
	b.hs	LBB61_23
LBB61_30:                               ;   in Loop: Header=BB61_18 Depth=2
	ldr	x16, [x20, #24]
	str	w15, [x16, x10, lsl #2]
	add	x10, x10, #1
	ldr	w15, [x14, #4]
	ldr	w16, [x8, x15, lsl #2]
	ldr	w17, [x20, #16]
	cmp	w16, w17
	b.hs	LBB61_24
LBB61_31:                               ;   in Loop: Header=BB61_18 Depth=2
	ldr	x16, [x20, #24]
	str	w15, [x16, x10, lsl #2]
	add	x10, x10, #1
	ldr	w15, [x14, #8]
	ldr	w16, [x8, x15, lsl #2]
	ldr	w17, [x20, #16]
	cmp	w16, w17
	b.hs	LBB61_25
LBB61_32:                               ;   in Loop: Header=BB61_18 Depth=2
	ldr	x16, [x20, #24]
	str	w15, [x16, x10, lsl #2]
	add	x10, x10, #1
	ldr	w15, [x14, #12]
	ldr	w16, [x8, x15, lsl #2]
	ldr	w17, [x20, #16]
	cmp	w16, w17
	b.hs	LBB61_17
LBB61_33:                               ;   in Loop: Header=BB61_18 Depth=2
	ldr	x16, [x20, #24]
	str	w15, [x16, x10, lsl #2]
	add	x10, x10, #1
	b	LBB61_17
LBB61_34:                               ;   in Loop: Header=BB61_3 Depth=1
	neg	x12, x12
	cbz	x9, LBB61_2
LBB61_35:                               ;   in Loop: Header=BB61_3 Depth=1
	add	x11, x11, x12, lsl #2
	b	LBB61_37
LBB61_36:                               ;   in Loop: Header=BB61_37 Depth=2
	subs	x9, x9, #1
	b.eq	LBB61_2
LBB61_37:                               ;   Parent Loop BB61_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w12, [x11], #4
	ldr	w13, [x8, x12, lsl #2]
	ldr	w14, [x20, #16]
	cmp	w13, w14
	b.hs	LBB61_36
; %bb.38:                               ;   in Loop: Header=BB61_37 Depth=2
	ldr	x13, [x20, #24]
	str	w12, [x13, x10, lsl #2]
	add	x10, x10, #1
	b	LBB61_36
LBB61_39:                               ;   in Loop: Header=BB61_3 Depth=1
	mov	x11, #0                         ; =0x0
	mov	x10, #0                         ; =0x0
	and	x12, x13, #0xfffffffffffffff8
	add	x13, x8, #16
	b	LBB61_41
LBB61_40:                               ;   in Loop: Header=BB61_41 Depth=2
	add	x11, x11, #8
	add	x13, x13, #32
	cmp	x12, x11
	b.eq	LBB61_12
LBB61_41:                               ;   Parent Loop BB61_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldur	w14, [x13, #-16]
	ldr	w15, [x20, #16]
	cmp	w14, w15
	b.lo	LBB61_49
; %bb.42:                               ;   in Loop: Header=BB61_41 Depth=2
	ldur	w14, [x13, #-12]
	ldr	w15, [x20, #16]
	cmp	w14, w15
	b.lo	LBB61_50
LBB61_43:                               ;   in Loop: Header=BB61_41 Depth=2
	ldur	w14, [x13, #-8]
	ldr	w15, [x20, #16]
	cmp	w14, w15
	b.lo	LBB61_51
LBB61_44:                               ;   in Loop: Header=BB61_41 Depth=2
	ldur	w14, [x13, #-4]
	ldr	w15, [x20, #16]
	cmp	w14, w15
	b.lo	LBB61_52
LBB61_45:                               ;   in Loop: Header=BB61_41 Depth=2
	ldr	w14, [x13]
	ldr	w15, [x20, #16]
	cmp	w14, w15
	b.lo	LBB61_53
LBB61_46:                               ;   in Loop: Header=BB61_41 Depth=2
	ldr	w14, [x13, #4]
	ldr	w15, [x20, #16]
	cmp	w14, w15
	b.lo	LBB61_54
LBB61_47:                               ;   in Loop: Header=BB61_41 Depth=2
	ldr	w14, [x13, #8]
	ldr	w15, [x20, #16]
	cmp	w14, w15
	b.lo	LBB61_55
LBB61_48:                               ;   in Loop: Header=BB61_41 Depth=2
	ldr	w14, [x13, #12]
	ldr	w15, [x20, #16]
	cmp	w14, w15
	b.hs	LBB61_40
	b	LBB61_56
LBB61_49:                               ;   in Loop: Header=BB61_41 Depth=2
	ldr	x14, [x20, #24]
	str	w11, [x14, x10, lsl #2]
	add	x10, x10, #1
	ldur	w14, [x13, #-12]
	ldr	w15, [x20, #16]
	cmp	w14, w15
	b.hs	LBB61_43
LBB61_50:                               ;   in Loop: Header=BB61_41 Depth=2
	add	w14, w11, #1
	ldr	x15, [x20, #24]
	str	w14, [x15, x10, lsl #2]
	add	x10, x10, #1
	ldur	w14, [x13, #-8]
	ldr	w15, [x20, #16]
	cmp	w14, w15
	b.hs	LBB61_44
LBB61_51:                               ;   in Loop: Header=BB61_41 Depth=2
	add	w14, w11, #2
	ldr	x15, [x20, #24]
	str	w14, [x15, x10, lsl #2]
	add	x10, x10, #1
	ldur	w14, [x13, #-4]
	ldr	w15, [x20, #16]
	cmp	w14, w15
	b.hs	LBB61_45
LBB61_52:                               ;   in Loop: Header=BB61_41 Depth=2
	add	w14, w11, #3
	ldr	x15, [x20, #24]
	str	w14, [x15, x10, lsl #2]
	add	x10, x10, #1
	ldr	w14, [x13]
	ldr	w15, [x20, #16]
	cmp	w14, w15
	b.hs	LBB61_46
LBB61_53:                               ;   in Loop: Header=BB61_41 Depth=2
	add	w14, w11, #4
	ldr	x15, [x20, #24]
	str	w14, [x15, x10, lsl #2]
	add	x10, x10, #1
	ldr	w14, [x13, #4]
	ldr	w15, [x20, #16]
	cmp	w14, w15
	b.hs	LBB61_47
LBB61_54:                               ;   in Loop: Header=BB61_41 Depth=2
	add	w14, w11, #5
	ldr	x15, [x20, #24]
	str	w14, [x15, x10, lsl #2]
	add	x10, x10, #1
	ldr	w14, [x13, #8]
	ldr	w15, [x20, #16]
	cmp	w14, w15
	b.hs	LBB61_48
LBB61_55:                               ;   in Loop: Header=BB61_41 Depth=2
	add	w14, w11, #6
	ldr	x15, [x20, #24]
	str	w14, [x15, x10, lsl #2]
	add	x10, x10, #1
	ldr	w14, [x13, #12]
	ldr	w15, [x20, #16]
	cmp	w14, w15
	b.hs	LBB61_40
LBB61_56:                               ;   in Loop: Header=BB61_41 Depth=2
	add	w14, w11, #7
	ldr	x15, [x20, #24]
	str	w14, [x15, x10, lsl #2]
	add	x10, x10, #1
	b	LBB61_40
LBB61_57:
	ldp	q0, q1, [sp, #32]
	stp	q0, q1, [x19, #32]
	ldr	x8, [sp, #80]
	ldp	q0, q1, [sp]
	stp	q0, q1, [x19]
	ldr	q0, [sp, #64]
	str	q0, [x19, #64]
	stp	x8, x10, [x19, #80]
	ldr	x8, [x20, #24]
	stp	x8, x10, [x19, #64]
	mov	w0, #1                          ; =0x1
LBB61_58:
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #96]             ; 16-byte Folded Reload
	add	sp, sp, #128
	ret
LBB61_59:
	mov	w0, #0                          ; =0x0
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #96]             ; 16-byte Folded Reload
	add	sp, sp, #128
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_111FilterBatch5closeEv
__ZN6vquery12_GLOBAL__N_111FilterBatch5closeEv: ; @_ZN6vquery12_GLOBAL__N_111FilterBatch5closeEv
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
	ldr	x0, [x0, #8]
	ldr	x8, [x0]
	ldr	x8, [x8, #32]
	blr	x8
	ldp	x21, x20, [x19, #48]
	cbz	x20, LBB62_3
; %bb.1:
	add	x8, x20, #8
	mov	w9, #1                          ; =0x1
	ldadd	x9, x10, [x8]
	ldr	x24, [x19, #64]
	ldadd	x9, x9, [x8]
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbnz	x8, LBB62_4
; %bb.2:
	ldr	x8, [x20]
	ldr	x8, [x8, #16]
	mov	x0, x20
	blr	x8
	mov	x0, x20
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
	b	LBB62_4
LBB62_3:
	ldr	x24, [x19, #64]
LBB62_4:
	ldr	x0, [x19, #24]
	stp	xzr, xzr, [x19, #24]
	ldp	x8, x22, [x19, #40]
	stp	xzr, x21, [x19, #40]
	ldp	x21, x23, [x19, #56]
	stp	x20, x24, [x19, #56]
	cbz	x0, LBB62_6
; %bb.5:
	sub	x19, x8, x0
	bl	__ZdlPv
	mov	x0, x22
	mov	x1, x19
	mov	x2, x23
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
LBB62_6:
	cbz	x21, LBB62_8
; %bb.7:
	add	x8, x21, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbz	x8, LBB62_9
LBB62_8:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
LBB62_9:
	ldr	x8, [x21]
	ldr	x8, [x8, #16]
	mov	x0, x21
	blr	x8
	mov	x0, x21
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	b	__ZNSt3__119__shared_weak_count14__release_weakEv
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEED1Ev ; -- Begin function _ZNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEED1Ev
	.weak_def_can_be_hidden	__ZNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEED1Ev
	.p2align	2
__ZNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEED1Ev: ; @_ZNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEED1Ev
	.cfi_startproc
; %bb.0:
Lloh90:
	adrp	x8, __ZTVNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEEE@GOTPAGE
Lloh91:
	ldr	x8, [x8, __ZTVNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEEE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x0]
	b	__ZNSt3__119__shared_weak_countD2Ev
	.loh AdrpLdrGot	Lloh90, Lloh91
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEED0Ev ; -- Begin function _ZNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEED0Ev
	.weak_def_can_be_hidden	__ZNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEED0Ev
	.p2align	2
__ZNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEED0Ev: ; @_ZNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEED0Ev
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh92:
	adrp	x8, __ZTVNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEEE@GOTPAGE
Lloh93:
	ldr	x8, [x8, __ZTVNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEEE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x0]
	bl	__ZNSt3__119__shared_weak_countD2Ev
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	__ZdlPv
	.loh AdrpLdrGot	Lloh92, Lloh93
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEE16__on_zero_sharedEv ; -- Begin function _ZNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEE16__on_zero_sharedEv
	.globl	__ZNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEE16__on_zero_sharedEv
	.weak_def_can_be_hidden	__ZNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEE16__on_zero_sharedEv
	.p2align	2
__ZNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEE16__on_zero_sharedEv: ; @_ZNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEE16__on_zero_sharedEv
	.cfi_startproc
; %bb.0:
	add	x0, x0, #24
	b	__ZNSt3__15mutexD1Ev
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEE21__on_zero_shared_weakEv ; -- Begin function _ZNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEE21__on_zero_shared_weakEv
	.globl	__ZNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEE21__on_zero_shared_weakEv
	.weak_def_can_be_hidden	__ZNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEE21__on_zero_shared_weakEv
	.p2align	2
__ZNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEE21__on_zero_shared_weakEv: ; @_ZNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEE21__on_zero_shared_weakEv
	.cfi_startproc
; %bb.0:
	b	__ZdlPv
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
	cbz	x19, LBB67_2
; %bb.1:
	add	x8, x19, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbz	x8, LBB67_3
LBB67_2:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
LBB67_3:
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
	cbz	x0, LBB68_2
; %bb.1:
	str	x0, [x19, #8]
	ldr	x8, [x19, #16]
	sub	x20, x8, x0
	bl	__ZdlPv
	ldr	x0, [x19, #24]
	ldr	x2, [x19, #40]
	mov	x1, x20
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
LBB68_2:
	ldr	x20, [x19, #32]
	cbz	x20, LBB68_4
; %bb.3:
	add	x8, x20, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbz	x8, LBB68_5
LBB68_4:
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
LBB68_5:
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
	.globl	__ZN6vquery11make_bufferIjEENSt3__16vectorIT_NS_15BudgetAllocatorIS3_EEEERKNS1_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE ; -- Begin function _ZN6vquery11make_bufferIjEENSt3__16vectorIT_NS_15BudgetAllocatorIS3_EEEERKNS1_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
	.weak_def_can_be_hidden	__ZN6vquery11make_bufferIjEENSt3__16vectorIT_NS_15BudgetAllocatorIS3_EEEERKNS1_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
	.p2align	2
__ZN6vquery11make_bufferIjEENSt3__16vectorIT_NS_15BudgetAllocatorIS3_EEEERKNS1_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE: ; @_ZN6vquery11make_bufferIjEENSt3__16vectorIT_NS_15BudgetAllocatorIS3_EEEERKNS1_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
Lfunc_begin9:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception9
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
	cbz	x8, LBB69_2
; %bb.1:
	add	x8, x8, #8
	mov	w9, #1                          ; =0x1
	ldadd	x9, x8, [x8]
LBB69_2:
Ltmp88:
	add	x0, sp, #24
	add	x1, sp, #8
	bl	__ZN6vquery15BudgetAllocatorIjEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
Ltmp89:
; %bb.3:
	stp	xzr, xzr, [x19]
	ldp	x9, x8, [sp, #24]
	stp	xzr, x9, [x19, #16]
	str	x8, [x19, #32]
	cbz	x8, LBB69_7
; %bb.4:
	add	x8, x8, #8
	mov	w9, #1                          ; =0x1
	ldadd	x9, x8, [x8]
	ldp	x20, x8, [sp, #32]
	str	x8, [x19, #40]
	cbz	x20, LBB69_8
; %bb.5:
	add	x8, x20, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbnz	x8, LBB69_8
; %bb.6:
	ldr	x8, [x20]
	ldr	x8, [x8, #16]
	mov	x0, x20
	blr	x8
	mov	x0, x20
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
	b	LBB69_8
LBB69_7:
	ldr	x8, [sp, #40]
	str	x8, [x19, #40]
LBB69_8:
	ldr	x19, [sp, #16]
	cbz	x19, LBB69_10
; %bb.9:
	add	x8, x19, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbz	x8, LBB69_11
LBB69_10:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB69_11:
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
LBB69_12:
Ltmp90:
	mov	x19, x0
	add	x0, sp, #8
	bl	__ZNSt3__110shared_ptrIN6vquery12MemoryBudgetEED1B8ne200100Ev
	mov	x0, x19
	bl	__Unwind_Resume
Lfunc_end9:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table69:
Lexception9:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end9-Lcst_begin9
Lcst_begin9:
	.uleb128 Ltmp88-Lfunc_begin9            ; >> Call Site 1 <<
	.uleb128 Ltmp89-Ltmp88                  ;   Call between Ltmp88 and Ltmp89
	.uleb128 Ltmp90-Lfunc_begin9            ;     jumps to Ltmp90
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp89-Lfunc_begin9            ; >> Call Site 2 <<
	.uleb128 Lfunc_end9-Ltmp89              ;   Call between Ltmp89 and Lfunc_end9
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end9:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
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
	cbz	x8, LBB70_2
; %bb.1:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB70_2:
	str	x0, [sp]                        ; 8-byte Folded Spill
	mov	w0, #24                         ; =0x18
	bl	___cxa_allocate_exception
	mov	x19, x0
Ltmp91:
Lloh94:
	adrp	x1, l_.str.7@PAGE
Lloh95:
	add	x1, x1, l_.str.7@PAGEOFF
	add	x0, sp, #8
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
Ltmp92:
; %bb.3:
	mov	w21, #1                         ; =0x1
Ltmp94:
	add	x1, sp, #8
	mov	x0, x19
	bl	__ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE
Ltmp95:
; %bb.4:
Lloh96:
	adrp	x8, __ZTVN6vquery5ErrorE@GOTPAGE
Lloh97:
	ldr	x8, [x8, __ZTVN6vquery5ErrorE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x19]
	str	wzr, [x19, #16]
Ltmp96:
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
Ltmp97:
; %bb.5:
	brk	#0x1
LBB70_6:
Ltmp98:
	mov	x20, x0
	ldrsb	w8, [sp, #31]
	tbz	w8, #31, LBB70_8
; %bb.7:
	ldr	x0, [sp, #8]
	bl	__ZdlPv
	tbnz	w21, #0, LBB70_10
	b	LBB70_11
LBB70_8:
	cbnz	w21, LBB70_10
	b	LBB70_11
LBB70_9:
Ltmp93:
	mov	x20, x0
LBB70_10:
	mov	x0, x19
	bl	___cxa_free_exception
LBB70_11:
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	bl	__ZNSt3__110shared_ptrIN6vquery12MemoryBudgetEED1B8ne200100Ev
	mov	x0, x20
	bl	__Unwind_Resume
	.loh AdrpAdd	Lloh94, Lloh95
	.loh AdrpLdrGot	Lloh100, Lloh101
	.loh AdrpAdd	Lloh98, Lloh99
	.loh AdrpLdrGot	Lloh96, Lloh97
Lfunc_end10:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table70:
Lexception10:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end10-Lcst_begin10
Lcst_begin10:
	.uleb128 Lfunc_begin10-Lfunc_begin10    ; >> Call Site 1 <<
	.uleb128 Ltmp91-Lfunc_begin10           ;   Call between Lfunc_begin10 and Ltmp91
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp91-Lfunc_begin10           ; >> Call Site 2 <<
	.uleb128 Ltmp92-Ltmp91                  ;   Call between Ltmp91 and Ltmp92
	.uleb128 Ltmp93-Lfunc_begin10           ;     jumps to Ltmp93
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp94-Lfunc_begin10           ; >> Call Site 3 <<
	.uleb128 Ltmp97-Ltmp94                  ;   Call between Ltmp94 and Ltmp97
	.uleb128 Ltmp98-Lfunc_begin10           ;     jumps to Ltmp98
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp97-Lfunc_begin10           ; >> Call Site 4 <<
	.uleb128 Lfunc_end10-Ltmp97             ;   Call between Ltmp97 and Lfunc_end10
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end10:
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
	b.ls	LBB71_4
; %bb.1:
	ldr	x20, [x19]
	sub	x21, x21, x20
	asr	x23, x21, #2
	add	x9, x23, x1
	lsr	x10, x9, #62
	cbnz	x10, LBB71_11
; %bb.2:
	mov	x10, #9223372036854775804       ; =0x7ffffffffffffffc
	sub	x8, x8, x20
	asr	x11, x8, #1
	cmp	x11, x9
	csel	x9, x11, x9, hi
	cmp	x8, x10
	mov	x8, #4611686018427387903        ; =0x3fffffffffffffff
	csel	x22, x9, x8, lo
	cbz	x22, LBB71_7
; %bb.3:
	add	x0, x19, #24
	mov	x20, x1
	mov	x1, x22
	bl	__ZN6vquery15BudgetAllocatorIjE8allocateEm
	mov	x1, x20
	ldp	x20, x8, [x19]
	sub	x21, x8, x20
	asr	x25, x21, #2
	b	LBB71_8
LBB71_4:
	cbz	x1, LBB71_6
; %bb.5:
	lsl	x20, x1, #2
	mov	x0, x21
	mov	x1, x20
	bl	_bzero
	add	x21, x21, x20
LBB71_6:
	str	x21, [x19, #8]
	b	LBB71_10
LBB71_7:
	mov	x0, #0                          ; =0x0
	mov	x25, x23
LBB71_8:
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
	cbz	x0, LBB71_10
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
LBB71_10:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp], #80             ; 16-byte Folded Reload
	ret
LBB71_11:
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
Lloh102:
	adrp	x0, l_.str.8@PAGE
Lloh103:
	add	x0, x0, l_.str.8@PAGEOFF
	bl	__ZNSt3__120__throw_length_errorB8ne200100EPKc
	.loh AdrpAdd	Lloh102, Lloh103
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN6vquery15BudgetAllocatorIjE8allocateEm ; -- Begin function _ZN6vquery15BudgetAllocatorIjE8allocateEm
	.weak_def_can_be_hidden	__ZN6vquery15BudgetAllocatorIjE8allocateEm
	.p2align	2
__ZN6vquery15BudgetAllocatorIjE8allocateEm: ; @_ZN6vquery15BudgetAllocatorIjE8allocateEm
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
	lsr	x8, x1, #62
	cbnz	x8, LBB73_3
; %bb.1:
	mov	x19, x0
	lsl	x20, x1, #2
	ldr	x0, [x0]
	ldr	x2, [x19, #16]
	mov	x1, x20
	bl	__ZN6vquery12MemoryBudget7reserveEmNS_14MemoryCategoryE
Ltmp99:
	mov	x0, x20
	bl	__Znwm
Ltmp100:
; %bb.2:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB73_3:
	mov	w0, #24                         ; =0x18
	bl	___cxa_allocate_exception
	mov	x19, x0
Ltmp108:
Lloh104:
	adrp	x1, l_.str.9@PAGE
Lloh105:
	add	x1, x1, l_.str.9@PAGEOFF
	add	x0, sp, #8
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
Ltmp109:
; %bb.4:
	mov	w21, #1                         ; =0x1
Ltmp111:
	add	x1, sp, #8
	mov	x0, x19
	bl	__ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE
Ltmp112:
; %bb.5:
Lloh106:
	adrp	x8, __ZTVN6vquery5ErrorE@GOTPAGE
Lloh107:
	ldr	x8, [x8, __ZTVN6vquery5ErrorE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x19]
	mov	w8, #3                          ; =0x3
	str	w8, [x19, #16]
Ltmp113:
	mov	w21, #0                         ; =0x0
Lloh108:
	adrp	x1, __ZTIN6vquery5ErrorE@PAGE
Lloh109:
	add	x1, x1, __ZTIN6vquery5ErrorE@PAGEOFF
Lloh110:
	adrp	x2, __ZN6vquery5ErrorD1Ev@GOTPAGE
Lloh111:
	ldr	x2, [x2, __ZN6vquery5ErrorD1Ev@GOTPAGEOFF]
	mov	x0, x19
	bl	___cxa_throw
Ltmp114:
	b	LBB73_12
LBB73_6:
Ltmp115:
	mov	x20, x0
	ldrsb	w8, [sp, #31]
	tbz	w8, #31, LBB73_8
; %bb.7:
	ldr	x0, [sp, #8]
	bl	__ZdlPv
	tbnz	w21, #0, LBB73_10
	b	LBB73_14
LBB73_8:
	cbnz	w21, LBB73_10
	b	LBB73_14
LBB73_9:
Ltmp110:
	mov	x20, x0
LBB73_10:
	mov	x0, x19
	bl	___cxa_free_exception
	mov	x0, x20
	bl	__Unwind_Resume
LBB73_11:
Ltmp101:
	bl	___cxa_begin_catch
	ldr	x0, [x19]
	ldr	x2, [x19, #16]
	mov	x1, x20
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
Ltmp102:
	bl	___cxa_rethrow
Ltmp103:
LBB73_12:
	brk	#0x1
LBB73_13:
Ltmp104:
	mov	x20, x0
Ltmp105:
	bl	___cxa_end_catch
Ltmp106:
LBB73_14:
	mov	x0, x20
	bl	__Unwind_Resume
LBB73_15:
Ltmp107:
	bl	___clang_call_terminate
	.loh AdrpAdd	Lloh104, Lloh105
	.loh AdrpLdrGot	Lloh110, Lloh111
	.loh AdrpAdd	Lloh108, Lloh109
	.loh AdrpLdrGot	Lloh106, Lloh107
Lfunc_end11:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table73:
Lexception11:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase0-Lttbaseref0
Lttbaseref0:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end11-Lcst_begin11
Lcst_begin11:
	.uleb128 Lfunc_begin11-Lfunc_begin11    ; >> Call Site 1 <<
	.uleb128 Ltmp99-Lfunc_begin11           ;   Call between Lfunc_begin11 and Ltmp99
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp99-Lfunc_begin11           ; >> Call Site 2 <<
	.uleb128 Ltmp100-Ltmp99                 ;   Call between Ltmp99 and Ltmp100
	.uleb128 Ltmp101-Lfunc_begin11          ;     jumps to Ltmp101
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp100-Lfunc_begin11          ; >> Call Site 3 <<
	.uleb128 Ltmp108-Ltmp100                ;   Call between Ltmp100 and Ltmp108
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp108-Lfunc_begin11          ; >> Call Site 4 <<
	.uleb128 Ltmp109-Ltmp108                ;   Call between Ltmp108 and Ltmp109
	.uleb128 Ltmp110-Lfunc_begin11          ;     jumps to Ltmp110
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp111-Lfunc_begin11          ; >> Call Site 5 <<
	.uleb128 Ltmp114-Ltmp111                ;   Call between Ltmp111 and Ltmp114
	.uleb128 Ltmp115-Lfunc_begin11          ;     jumps to Ltmp115
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp114-Lfunc_begin11          ; >> Call Site 6 <<
	.uleb128 Ltmp102-Ltmp114                ;   Call between Ltmp114 and Ltmp102
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp102-Lfunc_begin11          ; >> Call Site 7 <<
	.uleb128 Ltmp103-Ltmp102                ;   Call between Ltmp102 and Ltmp103
	.uleb128 Ltmp104-Lfunc_begin11          ;     jumps to Ltmp104
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp105-Lfunc_begin11          ; >> Call Site 8 <<
	.uleb128 Ltmp106-Ltmp105                ;   Call between Ltmp105 and Ltmp106
	.uleb128 Ltmp107-Lfunc_begin11          ;     jumps to Ltmp107
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp106-Lfunc_begin11          ; >> Call Site 9 <<
	.uleb128 Lfunc_end11-Ltmp106            ;   Call between Ltmp106 and Lfunc_end11
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end11:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2, 0x0
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase0:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_19JoinBatchD1Ev
__ZN6vquery12_GLOBAL__N_19JoinBatchD1Ev: ; @_ZN6vquery12_GLOBAL__N_19JoinBatchD1Ev
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
	ldr	x0, [x0, #120]
	cbz	x0, LBB74_3
; %bb.1:
	add	x8, x0, #4
	mov	w9, #-1                         ; =0xffffffff
	ldaddal	w9, w8, [x8]
	cmp	w8, #1
	b.ne	LBB74_3
; %bb.2:
	bl	__ZdlPv
LBB74_3:
	ldr	x0, [x19, #72]
	cbz	x0, LBB74_5
; %bb.4:
	str	x0, [x19, #80]
	ldr	x8, [x19, #88]
	sub	x20, x8, x0
	bl	__ZdlPv
	ldr	x0, [x19, #96]
	ldr	x2, [x19, #112]
	mov	x1, x20
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
LBB74_5:
	ldr	x20, [x19, #104]
	cbz	x20, LBB74_8
; %bb.6:
	add	x8, x20, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbnz	x8, LBB74_8
; %bb.7:
	ldr	x8, [x20]
	ldr	x8, [x8, #16]
	mov	x0, x20
	blr	x8
	mov	x0, x20
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
LBB74_8:
	ldr	x0, [x19, #24]
	cbz	x0, LBB74_10
; %bb.9:
	str	x0, [x19, #32]
	ldr	x8, [x19, #40]
	sub	x20, x8, x0
	bl	__ZdlPv
	ldr	x0, [x19, #48]
	ldr	x2, [x19, #64]
	mov	x1, x20
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
LBB74_10:
	ldr	x20, [x19, #56]
	cbz	x20, LBB74_13
; %bb.11:
	add	x8, x20, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbnz	x8, LBB74_13
; %bb.12:
	ldr	x8, [x20]
	ldr	x8, [x8, #16]
	mov	x0, x20
	blr	x8
	mov	x0, x20
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
LBB74_13:
	ldr	x0, [x19, #8]
	str	xzr, [x19, #8]
	cbz	x0, LBB74_15
; %bb.14:
	ldr	x8, [x0]
	ldr	x8, [x8, #8]
	blr	x8
LBB74_15:
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_19JoinBatchD0Ev
__ZN6vquery12_GLOBAL__N_19JoinBatchD0Ev: ; @_ZN6vquery12_GLOBAL__N_19JoinBatchD0Ev
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	bl	__ZN6vquery12_GLOBAL__N_19JoinBatchD1Ev
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	__ZdlPv
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_19JoinBatch4openERNS_16ExecutionContextE
__ZN6vquery12_GLOBAL__N_19JoinBatch4openERNS_16ExecutionContextE: ; @_ZN6vquery12_GLOBAL__N_19JoinBatch4openERNS_16ExecutionContextE
Lfunc_begin12:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception12
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
	ldr	x8, [x1, #8]
	mov	x9, #-8193                      ; =0xffffffffffffdfff
	mov	x10, #-7937                     ; =0xffffffffffffe0ff
	add	x9, x8, x9
	cmp	x9, x10
	mov	w9, #16383                      ; =0x3fff
	add	x9, x8, x9
	and	x8, x9, x8
	ccmp	x8, #0, #0, hs
	b.ne	LBB76_37
; %bb.1:
	mov	x19, x1
	mov	x20, x0
	ldr	x8, [x1, #48]
	ldr	x0, [x0, #120]
	cmp	x8, x0
	b.eq	LBB76_8
; %bb.2:
	cbz	x8, LBB76_4
; %bb.3:
	add	x8, x8, #4
	mov	w9, #1                          ; =0x1
	ldadd	w9, w8, [x8]
	ldr	x0, [x20, #120]
LBB76_4:
	cbz	x0, LBB76_7
; %bb.5:
	add	x8, x0, #4
	mov	w9, #-1                         ; =0xffffffff
	ldaddal	w9, w8, [x8]
	cmp	w8, #1
	b.ne	LBB76_7
; %bb.6:
	bl	__ZdlPv
LBB76_7:
	ldr	x8, [x19, #48]
	str	x8, [x20, #120]
LBB76_8:
	mov	x8, sp
	add	x0, x19, #24
	mov	w1, #1                          ; =0x1
	bl	__ZN6vquery11make_bufferIjEENSt3__16vectorIT_NS_15BudgetAllocatorIS3_EEEERKNS1_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
	mov	x21, x20
	ldr	x0, [x21, #24]!
	cbz	x0, LBB76_10
; %bb.9:
	str	x0, [x20, #32]
	ldr	x8, [x20, #40]
	sub	x22, x8, x0
	bl	__ZdlPv
	ldr	x0, [x20, #48]
	ldr	x2, [x20, #64]
	mov	x1, x22
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
	stp	xzr, xzr, [x21]
	str	xzr, [x21, #16]
LBB76_10:
	ldp	x9, x8, [sp, #24]
	cbz	x8, LBB76_12
; %bb.11:
	add	x10, x8, #8
	mov	w11, #1                         ; =0x1
	ldadd	x11, x10, [x10]
LBB76_12:
	ldr	x22, [x20, #56]
	stp	x9, x8, [x20, #48]
	cbz	x22, LBB76_15
; %bb.13:
	add	x8, x22, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbnz	x8, LBB76_15
; %bb.14:
	ldr	x8, [x22]
	ldr	x8, [x8, #16]
	mov	x0, x22
	blr	x8
	mov	x0, x22
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
LBB76_15:
	ldp	x22, x8, [sp, #32]
	str	x8, [x20, #64]
	ldr	q0, [sp]
	stur	q0, [x20, #24]
	ldr	x8, [sp, #16]
	str	x8, [x20, #40]
	stp	xzr, xzr, [sp]
	str	xzr, [sp, #16]
	cbz	x22, LBB76_18
; %bb.16:
	add	x8, x22, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbnz	x8, LBB76_18
; %bb.17:
	ldr	x8, [x22]
	ldr	x8, [x8, #16]
	mov	x0, x22
	blr	x8
	mov	x0, x22
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
LBB76_18:
	mov	x8, sp
	add	x0, x19, #24
	mov	w1, #1                          ; =0x1
	bl	__ZN6vquery11make_bufferIxEENSt3__16vectorIT_NS_15BudgetAllocatorIS3_EEEERKNS1_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
	mov	x22, x20
	ldr	x0, [x22, #72]!
	cbz	x0, LBB76_20
; %bb.19:
	str	x0, [x20, #80]
	ldr	x8, [x20, #88]
	sub	x23, x8, x0
	bl	__ZdlPv
	ldr	x0, [x20, #96]
	ldr	x2, [x20, #112]
	mov	x1, x23
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
	stp	xzr, xzr, [x22]
	str	xzr, [x22, #16]
LBB76_20:
	ldp	x9, x8, [sp, #24]
	cbz	x8, LBB76_22
; %bb.21:
	add	x10, x8, #8
	mov	w11, #1                         ; =0x1
	ldadd	x11, x10, [x10]
LBB76_22:
	ldr	x23, [x20, #104]
	stp	x9, x8, [x20, #96]
	cbz	x23, LBB76_25
; %bb.23:
	add	x8, x23, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbnz	x8, LBB76_25
; %bb.24:
	ldr	x8, [x23]
	ldr	x8, [x8, #16]
	mov	x0, x23
	blr	x8
	mov	x0, x23
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
LBB76_25:
	ldp	x23, x8, [sp, #32]
	str	x8, [x20, #112]
	ldr	q0, [sp]
	stur	q0, [x20, #72]
	ldr	x8, [sp, #16]
	str	x8, [x20, #88]
	stp	xzr, xzr, [sp]
	str	xzr, [sp, #16]
	cbz	x23, LBB76_27
; %bb.26:
	add	x8, x23, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbz	x8, LBB76_29
LBB76_27:
	ldr	x8, [x19, #8]
	ldp	x9, x10, [x20, #24]
	sub	x10, x10, x9
	asr	x10, x10, #2
	subs	x1, x8, x10
	b.ls	LBB76_30
LBB76_28:
	mov	x0, x21
	bl	__ZNSt3__16vectorIjN6vquery15BudgetAllocatorIjEEE8__appendEm
	ldr	x8, [x19, #8]
	b	LBB76_32
LBB76_29:
	ldr	x8, [x23]
	ldr	x8, [x8, #16]
	mov	x0, x23
	blr	x8
	mov	x0, x23
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
	ldr	x8, [x19, #8]
	ldp	x9, x10, [x20, #24]
	sub	x10, x10, x9
	asr	x10, x10, #2
	subs	x1, x8, x10
	b.hi	LBB76_28
LBB76_30:
	b.hs	LBB76_32
; %bb.31:
	add	x9, x9, x8, lsl #2
	str	x9, [x20, #32]
LBB76_32:
	ldp	x9, x10, [x20, #72]
	sub	x10, x10, x9
	asr	x10, x10, #3
	subs	x1, x8, x10
	b.ls	LBB76_34
; %bb.33:
	mov	x0, x22
	bl	__ZNSt3__16vectorIxN6vquery15BudgetAllocatorIxEEE8__appendEm
	b	LBB76_36
LBB76_34:
	b.hs	LBB76_36
; %bb.35:
	add	x8, x9, x8, lsl #3
	str	x8, [x20, #80]
LBB76_36:
	ldr	x0, [x20, #8]
	ldr	x8, [x0]
	ldr	x8, [x8, #16]
	mov	x1, x19
	blr	x8
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
LBB76_37:
	mov	w0, #24                         ; =0x18
	bl	___cxa_allocate_exception
	mov	x19, x0
Ltmp116:
Lloh112:
	adrp	x1, l_.str.6@PAGE
Lloh113:
	add	x1, x1, l_.str.6@PAGEOFF
	mov	x0, sp
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
Ltmp117:
; %bb.38:
	mov	w21, #1                         ; =0x1
Ltmp119:
	mov	x1, sp
	mov	x0, x19
	bl	__ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE
Ltmp120:
; %bb.39:
Lloh114:
	adrp	x8, __ZTVN6vquery5ErrorE@GOTPAGE
Lloh115:
	ldr	x8, [x8, __ZTVN6vquery5ErrorE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x19]
	str	wzr, [x19, #16]
Ltmp121:
	mov	w21, #0                         ; =0x0
Lloh116:
	adrp	x1, __ZTIN6vquery5ErrorE@PAGE
Lloh117:
	add	x1, x1, __ZTIN6vquery5ErrorE@PAGEOFF
Lloh118:
	adrp	x2, __ZN6vquery5ErrorD1Ev@GOTPAGE
Lloh119:
	ldr	x2, [x2, __ZN6vquery5ErrorD1Ev@GOTPAGEOFF]
	mov	x0, x19
	bl	___cxa_throw
Ltmp122:
; %bb.40:
	brk	#0x1
LBB76_41:
Ltmp123:
	mov	x20, x0
	ldrsb	w8, [sp, #23]
	tbz	w8, #31, LBB76_43
; %bb.42:
	ldr	x0, [sp]
	bl	__ZdlPv
	tbnz	w21, #0, LBB76_45
	b	LBB76_46
LBB76_43:
	cbnz	w21, LBB76_45
	b	LBB76_46
LBB76_44:
Ltmp118:
	mov	x20, x0
LBB76_45:
	mov	x0, x19
	bl	___cxa_free_exception
LBB76_46:
	mov	x0, x20
	bl	__Unwind_Resume
	.loh AdrpAdd	Lloh112, Lloh113
	.loh AdrpLdrGot	Lloh118, Lloh119
	.loh AdrpAdd	Lloh116, Lloh117
	.loh AdrpLdrGot	Lloh114, Lloh115
Lfunc_end12:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table76:
Lexception12:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end12-Lcst_begin12
Lcst_begin12:
	.uleb128 Lfunc_begin12-Lfunc_begin12    ; >> Call Site 1 <<
	.uleb128 Ltmp116-Lfunc_begin12          ;   Call between Lfunc_begin12 and Ltmp116
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp116-Lfunc_begin12          ; >> Call Site 2 <<
	.uleb128 Ltmp117-Ltmp116                ;   Call between Ltmp116 and Ltmp117
	.uleb128 Ltmp118-Lfunc_begin12          ;     jumps to Ltmp118
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp119-Lfunc_begin12          ; >> Call Site 3 <<
	.uleb128 Ltmp122-Ltmp119                ;   Call between Ltmp119 and Ltmp122
	.uleb128 Ltmp123-Lfunc_begin12          ;     jumps to Ltmp123
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp122-Lfunc_begin12          ; >> Call Site 4 <<
	.uleb128 Lfunc_end12-Ltmp122            ;   Call between Ltmp122 and Lfunc_end12
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end12:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_19JoinBatch4nextERNS_5BatchE
__ZN6vquery12_GLOBAL__N_19JoinBatch4nextERNS_5BatchE: ; @_ZN6vquery12_GLOBAL__N_19JoinBatch4nextERNS_5BatchE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #160
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
	mov	x19, x1
	mov	x20, x0
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [sp, #64]
	mov	x21, #64915                     ; =0xfd93
	movk	x21, #26201, lsl #16
	movk	x21, #65208, lsl #32
	movk	x21, #55016, lsl #48
	mov	x22, #58809                     ; =0xe5b9
	movk	x22, #7396, lsl #16
	movk	x22, #18285, lsl #32
	movk	x22, #48984, lsl #48
	mov	x23, #4587                      ; =0x11eb
	movk	x23, #4913, lsl #16
	movk	x23, #18875, lsl #32
	movk	x23, #38096, lsl #48
	stp	q0, q0, [sp, #32]
	stp	q0, q0, [sp]
	b	LBB77_3
LBB77_1:                                ;   in Loop: Header=BB77_3 Depth=1
	mov	x10, #0                         ; =0x0
LBB77_2:                                ;   in Loop: Header=BB77_3 Depth=1
	cbnz	x10, LBB77_22
LBB77_3:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB77_10 Depth 2
                                        ;       Child Loop BB77_11 Depth 3
                                        ;     Child Loop BB77_17 Depth 2
                                        ;       Child Loop BB77_18 Depth 3
	ldr	x8, [x20, #120]
	cbz	x8, LBB77_5
; %bb.4:                                ;   in Loop: Header=BB77_3 Depth=1
	ldapr	w8, [x8]
	tbnz	w8, #0, LBB77_24
LBB77_5:                                ;   in Loop: Header=BB77_3 Depth=1
	ldr	x0, [x20, #8]
	ldr	x8, [x0]
	ldr	x8, [x8, #24]
	mov	x1, sp
	blr	x8
	cbz	w0, LBB77_23
; %bb.6:                                ;   in Loop: Header=BB77_3 Depth=1
	ldr	x8, [sp, #88]
	cbz	x8, LBB77_1
; %bb.7:                                ;   in Loop: Header=BB77_3 Depth=1
	ldr	x10, [sp, #72]
	ldr	x9, [x20, #16]
	ldp	x11, x12, [x9, #16]
	sub	x12, x12, x11
	asr	x12, x12, #2
	sub	x12, x12, #1
	ldr	x13, [x9, #112]
	ldr	x14, [sp, #32]
	ldr	x15, [sp, #48]
	cbz	x10, LBB77_15
; %bb.8:                                ;   in Loop: Header=BB77_3 Depth=1
	mov	x10, #0                         ; =0x0
	mov	x16, #0                         ; =0x0
	ldr	x17, [sp, #64]
	b	LBB77_10
LBB77_9:                                ;   in Loop: Header=BB77_10 Depth=2
	add	x16, x16, #1
	cmp	x16, x8
	b.eq	LBB77_2
LBB77_10:                               ;   Parent Loop BB77_3 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB77_11 Depth 3
	ldr	w0, [x17, x16, lsl #2]
	ldr	w1, [x14, x0, lsl #2]
	eor	x2, x1, x21
	eor	x2, x2, x2, lsr #30
	mul	x2, x2, x22
	eor	x2, x2, x2, lsr #27
	mul	x2, x2, x23
	eor	x2, x2, x2, lsr #31
	and	x2, x2, x12
	ldrb	w3, [x13, x2]
	cbz	w3, LBB77_9
LBB77_11:                               ;   Parent Loop BB77_3 Depth=1
                                        ;     Parent Loop BB77_10 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	w3, [x11, x2, lsl #2]
	cmp	w3, w1
	b.eq	LBB77_13
; %bb.12:                               ;   in Loop: Header=BB77_11 Depth=3
	add	x2, x2, #1
	and	x2, x2, x12
	ldrb	w3, [x13, x2]
	cbnz	w3, LBB77_11
	b	LBB77_9
LBB77_13:                               ;   in Loop: Header=BB77_10 Depth=2
	ldr	x1, [x9, #64]
	cbz	x1, LBB77_9
; %bb.14:                               ;   in Loop: Header=BB77_10 Depth=2
	ldr	w1, [x1, x2, lsl #2]
	ldr	x2, [x20, #24]
	str	w1, [x2, x10, lsl #2]
	ldr	x0, [x15, x0, lsl #3]
	ldr	x1, [x20, #72]
	str	x0, [x1, x10, lsl #3]
	add	x10, x10, #1
	b	LBB77_9
LBB77_15:                               ;   in Loop: Header=BB77_3 Depth=1
	mov	x16, #0                         ; =0x0
	b	LBB77_17
LBB77_16:                               ;   in Loop: Header=BB77_17 Depth=2
	add	x16, x16, #1
	cmp	x16, x8
	b.eq	LBB77_2
LBB77_17:                               ;   Parent Loop BB77_3 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB77_18 Depth 3
	ldr	w17, [x14, x16, lsl #2]
	eor	x0, x17, x21
	eor	x0, x0, x0, lsr #30
	mul	x0, x0, x22
	eor	x0, x0, x0, lsr #27
	mul	x0, x0, x23
	eor	x0, x0, x0, lsr #31
	and	x0, x0, x12
	ldrb	w1, [x13, x0]
	cbz	w1, LBB77_16
LBB77_18:                               ;   Parent Loop BB77_3 Depth=1
                                        ;     Parent Loop BB77_17 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	w1, [x11, x0, lsl #2]
	cmp	w1, w17
	b.eq	LBB77_20
; %bb.19:                               ;   in Loop: Header=BB77_18 Depth=3
	add	x0, x0, #1
	and	x0, x0, x12
	ldrb	w1, [x13, x0]
	cbnz	w1, LBB77_18
	b	LBB77_16
LBB77_20:                               ;   in Loop: Header=BB77_17 Depth=2
	ldr	x17, [x9, #64]
	cbz	x17, LBB77_16
; %bb.21:                               ;   in Loop: Header=BB77_17 Depth=2
	ldr	w17, [x17, x0, lsl #2]
	ldr	x0, [x20, #24]
	str	w17, [x0, x10, lsl #2]
	ldr	x17, [x15, x16, lsl #3]
	ldr	x0, [x20, #72]
	str	x17, [x0, x10, lsl #3]
	add	x10, x10, #1
	b	LBB77_16
LBB77_22:
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x19, #64]
	stp	q0, q0, [x19, #32]
	stp	q0, q0, [x19]
	ldr	x8, [x20, #24]
	stp	x8, x10, [x19, #16]
	ldr	x8, [x20, #72]
	stp	x8, x10, [x19, #48]
	stp	x10, x10, [x19, #80]
	mov	w0, #1                          ; =0x1
LBB77_23:
	ldp	x29, x30, [sp, #144]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #128]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #112]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #96]             ; 16-byte Folded Reload
	add	sp, sp, #160
	ret
LBB77_24:
	mov	w0, #0                          ; =0x0
	ldp	x29, x30, [sp, #144]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #128]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #112]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #96]             ; 16-byte Folded Reload
	add	sp, sp, #160
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZN6vquery12_GLOBAL__N_19JoinBatch5closeEv
__ZN6vquery12_GLOBAL__N_19JoinBatch5closeEv: ; @_ZN6vquery12_GLOBAL__N_19JoinBatch5closeEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #112
	stp	x28, x27, [sp, #16]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #32]             ; 16-byte Folded Spill
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
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	mov	x22, x0
	ldr	x0, [x0, #8]
	ldr	x8, [x0]
	ldr	x8, [x8, #32]
	blr	x8
	ldp	x19, x24, [x22, #48]
	cbz	x24, LBB78_3
; %bb.1:
	add	x8, x24, #8
	mov	w9, #1                          ; =0x1
	ldadd	x9, x10, [x8]
	ldr	x21, [x22, #64]
	ldadd	x9, x9, [x8]
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbnz	x8, LBB78_4
; %bb.2:
	ldr	x8, [x24]
	ldr	x8, [x8, #16]
	mov	x0, x24
	blr	x8
	mov	x0, x24
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
	b	LBB78_4
LBB78_3:
	ldr	x21, [x22, #64]
LBB78_4:
	ldr	x20, [x22, #24]
	stp	xzr, xzr, [x22, #24]
	ldp	x28, x8, [x22, #40]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	stp	xzr, x19, [x22, #40]
	ldp	x19, x23, [x22, #56]
	stp	x24, x21, [x22, #56]
	ldp	x25, x24, [x22, #96]
	cbz	x24, LBB78_7
; %bb.5:
	add	x8, x24, #8
	mov	w9, #1                          ; =0x1
	ldadd	x9, x10, [x8]
	ldr	x21, [x22, #112]
	ldadd	x9, x9, [x8]
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbnz	x8, LBB78_8
; %bb.6:
	ldr	x8, [x24]
	ldr	x8, [x8, #16]
	mov	x0, x24
	blr	x8
	mov	x0, x24
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
	b	LBB78_8
LBB78_7:
	ldr	x21, [x22, #112]
LBB78_8:
	ldr	x0, [x22, #72]
	stp	xzr, xzr, [x22, #72]
	ldp	x8, x26, [x22, #88]
	stp	xzr, x25, [x22, #88]
	ldp	x25, x27, [x22, #104]
	stp	x24, x21, [x22, #104]
	cbz	x0, LBB78_10
; %bb.9:
	sub	x22, x8, x0
	bl	__ZdlPv
	mov	x0, x26
	mov	x1, x22
	mov	x2, x27
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
LBB78_10:
	cbz	x25, LBB78_13
; %bb.11:
	add	x8, x25, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbnz	x8, LBB78_13
; %bb.12:
	ldr	x8, [x25]
	ldr	x8, [x8, #16]
	mov	x0, x25
	blr	x8
	mov	x0, x25
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
LBB78_13:
	cbz	x20, LBB78_15
; %bb.14:
	sub	x22, x28, x20
	mov	x0, x20
	bl	__ZdlPv
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	mov	x1, x22
	mov	x2, x23
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
LBB78_15:
	cbz	x19, LBB78_17
; %bb.16:
	add	x8, x19, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbz	x8, LBB78_18
LBB78_17:
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
LBB78_18:
	ldr	x8, [x19]
	ldr	x8, [x8, #16]
	mov	x0, x19
	blr	x8
	mov	x0, x19
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #112
	b	__ZNSt3__119__shared_weak_count14__release_weakEv
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN6vquery11make_bufferIxEENSt3__16vectorIT_NS_15BudgetAllocatorIS3_EEEERKNS1_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE ; -- Begin function _ZN6vquery11make_bufferIxEENSt3__16vectorIT_NS_15BudgetAllocatorIS3_EEEERKNS1_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
	.weak_def_can_be_hidden	__ZN6vquery11make_bufferIxEENSt3__16vectorIT_NS_15BudgetAllocatorIS3_EEEERKNS1_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
	.p2align	2
__ZN6vquery11make_bufferIxEENSt3__16vectorIT_NS_15BudgetAllocatorIS3_EEEERKNS1_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE: ; @_ZN6vquery11make_bufferIxEENSt3__16vectorIT_NS_15BudgetAllocatorIS3_EEEERKNS1_10shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
Lfunc_begin13:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception13
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
	cbz	x8, LBB79_2
; %bb.1:
	add	x8, x8, #8
	mov	w9, #1                          ; =0x1
	ldadd	x9, x8, [x8]
LBB79_2:
Ltmp124:
	add	x0, sp, #24
	add	x1, sp, #8
	bl	__ZN6vquery15BudgetAllocatorIxEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
Ltmp125:
; %bb.3:
	stp	xzr, xzr, [x19]
	ldp	x9, x8, [sp, #24]
	stp	xzr, x9, [x19, #16]
	str	x8, [x19, #32]
	cbz	x8, LBB79_7
; %bb.4:
	add	x8, x8, #8
	mov	w9, #1                          ; =0x1
	ldadd	x9, x8, [x8]
	ldp	x20, x8, [sp, #32]
	str	x8, [x19, #40]
	cbz	x20, LBB79_8
; %bb.5:
	add	x8, x20, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbnz	x8, LBB79_8
; %bb.6:
	ldr	x8, [x20]
	ldr	x8, [x8, #16]
	mov	x0, x20
	blr	x8
	mov	x0, x20
	bl	__ZNSt3__119__shared_weak_count14__release_weakEv
	b	LBB79_8
LBB79_7:
	ldr	x8, [sp, #40]
	str	x8, [x19, #40]
LBB79_8:
	ldr	x19, [sp, #16]
	cbz	x19, LBB79_10
; %bb.9:
	add	x8, x19, #8
	mov	x9, #-1                         ; =0xffffffffffffffff
	ldaddal	x9, x8, [x8]
	cbz	x8, LBB79_11
LBB79_10:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB79_11:
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
LBB79_12:
Ltmp126:
	mov	x19, x0
	add	x0, sp, #8
	bl	__ZNSt3__110shared_ptrIN6vquery12MemoryBudgetEED1B8ne200100Ev
	mov	x0, x19
	bl	__Unwind_Resume
Lfunc_end13:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table79:
Lexception13:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end13-Lcst_begin13
Lcst_begin13:
	.uleb128 Ltmp124-Lfunc_begin13          ; >> Call Site 1 <<
	.uleb128 Ltmp125-Ltmp124                ;   Call between Ltmp124 and Ltmp125
	.uleb128 Ltmp126-Lfunc_begin13          ;     jumps to Ltmp126
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp125-Lfunc_begin13          ; >> Call Site 2 <<
	.uleb128 Lfunc_end13-Ltmp125            ;   Call between Ltmp125 and Lfunc_end13
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end13:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN6vquery15BudgetAllocatorIxEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE ; -- Begin function _ZN6vquery15BudgetAllocatorIxEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
	.weak_def_can_be_hidden	__ZN6vquery15BudgetAllocatorIxEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
	.p2align	2
__ZN6vquery15BudgetAllocatorIxEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE: ; @_ZN6vquery15BudgetAllocatorIxEC2ENSt3__110shared_ptrINS_12MemoryBudgetEEENS_14MemoryCategoryE
Lfunc_begin14:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception14
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
	cbz	x8, LBB80_2
; %bb.1:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB80_2:
	str	x0, [sp]                        ; 8-byte Folded Spill
	mov	w0, #24                         ; =0x18
	bl	___cxa_allocate_exception
	mov	x19, x0
Ltmp127:
Lloh120:
	adrp	x1, l_.str.7@PAGE
Lloh121:
	add	x1, x1, l_.str.7@PAGEOFF
	add	x0, sp, #8
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
Ltmp128:
; %bb.3:
	mov	w21, #1                         ; =0x1
Ltmp130:
	add	x1, sp, #8
	mov	x0, x19
	bl	__ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE
Ltmp131:
; %bb.4:
Lloh122:
	adrp	x8, __ZTVN6vquery5ErrorE@GOTPAGE
Lloh123:
	ldr	x8, [x8, __ZTVN6vquery5ErrorE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x19]
	str	wzr, [x19, #16]
Ltmp132:
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
Ltmp133:
; %bb.5:
	brk	#0x1
LBB80_6:
Ltmp134:
	mov	x20, x0
	ldrsb	w8, [sp, #31]
	tbz	w8, #31, LBB80_8
; %bb.7:
	ldr	x0, [sp, #8]
	bl	__ZdlPv
	tbnz	w21, #0, LBB80_10
	b	LBB80_11
LBB80_8:
	cbnz	w21, LBB80_10
	b	LBB80_11
LBB80_9:
Ltmp129:
	mov	x20, x0
LBB80_10:
	mov	x0, x19
	bl	___cxa_free_exception
LBB80_11:
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	bl	__ZNSt3__110shared_ptrIN6vquery12MemoryBudgetEED1B8ne200100Ev
	mov	x0, x20
	bl	__Unwind_Resume
	.loh AdrpAdd	Lloh120, Lloh121
	.loh AdrpLdrGot	Lloh126, Lloh127
	.loh AdrpAdd	Lloh124, Lloh125
	.loh AdrpLdrGot	Lloh122, Lloh123
Lfunc_end14:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table80:
Lexception14:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end14-Lcst_begin14
Lcst_begin14:
	.uleb128 Lfunc_begin14-Lfunc_begin14    ; >> Call Site 1 <<
	.uleb128 Ltmp127-Lfunc_begin14          ;   Call between Lfunc_begin14 and Ltmp127
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp127-Lfunc_begin14          ; >> Call Site 2 <<
	.uleb128 Ltmp128-Ltmp127                ;   Call between Ltmp127 and Ltmp128
	.uleb128 Ltmp129-Lfunc_begin14          ;     jumps to Ltmp129
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp130-Lfunc_begin14          ; >> Call Site 3 <<
	.uleb128 Ltmp133-Ltmp130                ;   Call between Ltmp130 and Ltmp133
	.uleb128 Ltmp134-Lfunc_begin14          ;     jumps to Ltmp134
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp133-Lfunc_begin14          ; >> Call Site 4 <<
	.uleb128 Lfunc_end14-Ltmp133            ;   Call between Ltmp133 and Lfunc_end14
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end14:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__16vectorIxN6vquery15BudgetAllocatorIxEEE8__appendEm ; -- Begin function _ZNSt3__16vectorIxN6vquery15BudgetAllocatorIxEEE8__appendEm
	.globl	__ZNSt3__16vectorIxN6vquery15BudgetAllocatorIxEEE8__appendEm
	.weak_def_can_be_hidden	__ZNSt3__16vectorIxN6vquery15BudgetAllocatorIxEEE8__appendEm
	.p2align	2
__ZNSt3__16vectorIxN6vquery15BudgetAllocatorIxEEE8__appendEm: ; @_ZNSt3__16vectorIxN6vquery15BudgetAllocatorIxEEE8__appendEm
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
	cmp	x1, x9, asr #3
	b.ls	LBB81_4
; %bb.1:
	ldr	x20, [x19]
	sub	x21, x21, x20
	asr	x23, x21, #3
	add	x9, x23, x1
	lsr	x10, x9, #61
	cbnz	x10, LBB81_11
; %bb.2:
	mov	x10, #9223372036854775800       ; =0x7ffffffffffffff8
	sub	x8, x8, x20
	asr	x11, x8, #2
	cmp	x11, x9
	csel	x9, x11, x9, hi
	cmp	x8, x10
	mov	x8, #2305843009213693951        ; =0x1fffffffffffffff
	csel	x22, x9, x8, lo
	cbz	x22, LBB81_7
; %bb.3:
	add	x0, x19, #24
	mov	x20, x1
	mov	x1, x22
	bl	__ZN6vquery15BudgetAllocatorIxE8allocateEm
	mov	x1, x20
	ldp	x20, x8, [x19]
	sub	x21, x8, x20
	asr	x25, x21, #3
	b	LBB81_8
LBB81_4:
	cbz	x1, LBB81_6
; %bb.5:
	lsl	x20, x1, #3
	mov	x0, x21
	mov	x1, x20
	bl	_bzero
	add	x21, x21, x20
LBB81_6:
	str	x21, [x19, #8]
	b	LBB81_10
LBB81_7:
	mov	x0, #0                          ; =0x0
	mov	x25, x23
LBB81_8:
	add	x23, x0, x23, lsl #3
	lsl	x24, x1, #3
	add	x26, x0, x22, lsl #3
	mov	x0, x23
	mov	x1, x24
	bl	_bzero
	add	x24, x23, x24
	sub	x22, x23, x25, lsl #3
	mov	x0, x22
	mov	x1, x20
	mov	x2, x21
	bl	_memcpy
	ldr	x0, [x19]
	stp	x22, x24, [x19]
	ldr	x8, [x19, #16]
	str	x26, [x19, #16]
	cbz	x0, LBB81_10
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
LBB81_10:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp], #80             ; 16-byte Folded Reload
	ret
LBB81_11:
	bl	__ZNSt3__16vectorIxN6vquery15BudgetAllocatorIxEEE20__throw_length_errorB8ne200100Ev
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIxN6vquery15BudgetAllocatorIxEEE20__throw_length_errorB8ne200100Ev ; -- Begin function _ZNSt3__16vectorIxN6vquery15BudgetAllocatorIxEEE20__throw_length_errorB8ne200100Ev
	.globl	__ZNSt3__16vectorIxN6vquery15BudgetAllocatorIxEEE20__throw_length_errorB8ne200100Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorIxN6vquery15BudgetAllocatorIxEEE20__throw_length_errorB8ne200100Ev
	.p2align	2
__ZNSt3__16vectorIxN6vquery15BudgetAllocatorIxEEE20__throw_length_errorB8ne200100Ev: ; @_ZNSt3__16vectorIxN6vquery15BudgetAllocatorIxEEE20__throw_length_errorB8ne200100Ev
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh128:
	adrp	x0, l_.str.8@PAGE
Lloh129:
	add	x0, x0, l_.str.8@PAGEOFF
	bl	__ZNSt3__120__throw_length_errorB8ne200100EPKc
	.loh AdrpAdd	Lloh128, Lloh129
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN6vquery15BudgetAllocatorIxE8allocateEm ; -- Begin function _ZN6vquery15BudgetAllocatorIxE8allocateEm
	.weak_def_can_be_hidden	__ZN6vquery15BudgetAllocatorIxE8allocateEm
	.p2align	2
__ZN6vquery15BudgetAllocatorIxE8allocateEm: ; @_ZN6vquery15BudgetAllocatorIxE8allocateEm
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
	lsr	x8, x1, #61
	cbnz	x8, LBB83_3
; %bb.1:
	mov	x19, x0
	lsl	x20, x1, #3
	ldr	x0, [x0]
	ldr	x2, [x19, #16]
	mov	x1, x20
	bl	__ZN6vquery12MemoryBudget7reserveEmNS_14MemoryCategoryE
Ltmp135:
	mov	x0, x20
	bl	__Znwm
Ltmp136:
; %bb.2:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB83_3:
	mov	w0, #24                         ; =0x18
	bl	___cxa_allocate_exception
	mov	x19, x0
Ltmp144:
Lloh130:
	adrp	x1, l_.str.9@PAGE
Lloh131:
	add	x1, x1, l_.str.9@PAGEOFF
	add	x0, sp, #8
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
Ltmp145:
; %bb.4:
	mov	w21, #1                         ; =0x1
Ltmp147:
	add	x1, sp, #8
	mov	x0, x19
	bl	__ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE
Ltmp148:
; %bb.5:
Lloh132:
	adrp	x8, __ZTVN6vquery5ErrorE@GOTPAGE
Lloh133:
	ldr	x8, [x8, __ZTVN6vquery5ErrorE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x19]
	mov	w8, #3                          ; =0x3
	str	w8, [x19, #16]
Ltmp149:
	mov	w21, #0                         ; =0x0
Lloh134:
	adrp	x1, __ZTIN6vquery5ErrorE@PAGE
Lloh135:
	add	x1, x1, __ZTIN6vquery5ErrorE@PAGEOFF
Lloh136:
	adrp	x2, __ZN6vquery5ErrorD1Ev@GOTPAGE
Lloh137:
	ldr	x2, [x2, __ZN6vquery5ErrorD1Ev@GOTPAGEOFF]
	mov	x0, x19
	bl	___cxa_throw
Ltmp150:
	b	LBB83_12
LBB83_6:
Ltmp151:
	mov	x20, x0
	ldrsb	w8, [sp, #31]
	tbz	w8, #31, LBB83_8
; %bb.7:
	ldr	x0, [sp, #8]
	bl	__ZdlPv
	tbnz	w21, #0, LBB83_10
	b	LBB83_14
LBB83_8:
	cbnz	w21, LBB83_10
	b	LBB83_14
LBB83_9:
Ltmp146:
	mov	x20, x0
LBB83_10:
	mov	x0, x19
	bl	___cxa_free_exception
	mov	x0, x20
	bl	__Unwind_Resume
LBB83_11:
Ltmp137:
	bl	___cxa_begin_catch
	ldr	x0, [x19]
	ldr	x2, [x19, #16]
	mov	x1, x20
	bl	__ZN6vquery12MemoryBudget7releaseEmNS_14MemoryCategoryE
Ltmp138:
	bl	___cxa_rethrow
Ltmp139:
LBB83_12:
	brk	#0x1
LBB83_13:
Ltmp140:
	mov	x20, x0
Ltmp141:
	bl	___cxa_end_catch
Ltmp142:
LBB83_14:
	mov	x0, x20
	bl	__Unwind_Resume
LBB83_15:
Ltmp143:
	bl	___clang_call_terminate
	.loh AdrpAdd	Lloh130, Lloh131
	.loh AdrpLdrGot	Lloh136, Lloh137
	.loh AdrpAdd	Lloh134, Lloh135
	.loh AdrpLdrGot	Lloh132, Lloh133
Lfunc_end15:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table83:
Lexception15:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase1-Lttbaseref1
Lttbaseref1:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end15-Lcst_begin15
Lcst_begin15:
	.uleb128 Lfunc_begin15-Lfunc_begin15    ; >> Call Site 1 <<
	.uleb128 Ltmp135-Lfunc_begin15          ;   Call between Lfunc_begin15 and Ltmp135
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp135-Lfunc_begin15          ; >> Call Site 2 <<
	.uleb128 Ltmp136-Ltmp135                ;   Call between Ltmp135 and Ltmp136
	.uleb128 Ltmp137-Lfunc_begin15          ;     jumps to Ltmp137
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp136-Lfunc_begin15          ; >> Call Site 3 <<
	.uleb128 Ltmp144-Ltmp136                ;   Call between Ltmp136 and Ltmp144
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp144-Lfunc_begin15          ; >> Call Site 4 <<
	.uleb128 Ltmp145-Ltmp144                ;   Call between Ltmp144 and Ltmp145
	.uleb128 Ltmp146-Lfunc_begin15          ;     jumps to Ltmp146
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp147-Lfunc_begin15          ; >> Call Site 5 <<
	.uleb128 Ltmp150-Ltmp147                ;   Call between Ltmp147 and Ltmp150
	.uleb128 Ltmp151-Lfunc_begin15          ;     jumps to Ltmp151
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp150-Lfunc_begin15          ; >> Call Site 6 <<
	.uleb128 Ltmp138-Ltmp150                ;   Call between Ltmp150 and Ltmp138
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp138-Lfunc_begin15          ; >> Call Site 7 <<
	.uleb128 Ltmp139-Ltmp138                ;   Call between Ltmp138 and Ltmp139
	.uleb128 Ltmp140-Lfunc_begin15          ;     jumps to Ltmp140
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp141-Lfunc_begin15          ; >> Call Site 8 <<
	.uleb128 Ltmp142-Ltmp141                ;   Call between Ltmp141 and Ltmp142
	.uleb128 Ltmp143-Lfunc_begin15          ;     jumps to Ltmp143
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp142-Lfunc_begin15          ; >> Call Site 9 <<
	.uleb128 Lfunc_end15-Ltmp142            ;   Call between Ltmp142 and Lfunc_end15
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end15:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2, 0x0
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase1:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"invalid batch scan range/layout"

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
l_.str.1:                               ; @.str.1
	.asciz	"invalid filter child or cutoff"

l_.str.2:                               ; @.str.2
	.asciz	"invalid scan range or query"

l_.str.3:                               ; @.str.3
	.asciz	"invalid filter cutoff or join input"

l_.str.4:                               ; @.str.4
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

	.section	__TEXT,__cstring,cstring_literals
l_.str.5:                               ; @.str.5
	.asciz	"unknown query"

	.section	__DATA,__const
	.p2align	3, 0x0                          ; @_ZTVN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE0EEE
__ZTVN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE0EEE:
	.quad	0
	.quad	__ZTIN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE0EEE
	.quad	__ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE0EED1Ev
	.quad	__ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE0EED0Ev
	.quad	__ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE0EE4openERNS_16ExecutionContextE
	.quad	__ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE0EE4nextERNS_3RowE
	.quad	__ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE0EE5closeEv

	.section	__TEXT,__const
__ZTSN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE0EEE: ; @_ZTSN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE0EEE
	.asciz	"N6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE0EEE"

	.private_extern	__ZTSN6vquery9RowSourceE ; @_ZTSN6vquery9RowSourceE
	.globl	__ZTSN6vquery9RowSourceE
	.weak_definition	__ZTSN6vquery9RowSourceE
__ZTSN6vquery9RowSourceE:
	.asciz	"N6vquery9RowSourceE"

	.private_extern	__ZTIN6vquery9RowSourceE ; @_ZTIN6vquery9RowSourceE
	.section	__DATA,__const
	.globl	__ZTIN6vquery9RowSourceE
	.weak_definition	__ZTIN6vquery9RowSourceE
	.p2align	3, 0x0
__ZTIN6vquery9RowSourceE:
	.quad	__ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	__ZTSN6vquery9RowSourceE-9223372036854775808

	.p2align	3, 0x0                          ; @_ZTIN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE0EEE
__ZTIN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE0EEE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE0EEE
	.quad	__ZTIN6vquery9RowSourceE

	.p2align	3, 0x0                          ; @_ZTVN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE1EEE
__ZTVN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE1EEE:
	.quad	0
	.quad	__ZTIN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE1EEE
	.quad	__ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE1EED1Ev
	.quad	__ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE1EED0Ev
	.quad	__ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE1EE4openERNS_16ExecutionContextE
	.quad	__ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE1EE4nextERNS_3RowE
	.quad	__ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE1EE5closeEv

	.section	__TEXT,__const
__ZTSN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE1EEE: ; @_ZTSN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE1EEE
	.asciz	"N6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE1EEE"

	.section	__DATA,__const
	.p2align	3, 0x0                          ; @_ZTIN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE1EEE
__ZTIN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE1EEE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE1EEE
	.quad	__ZTIN6vquery9RowSourceE

	.p2align	3, 0x0                          ; @_ZTVN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE2EEE
__ZTVN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE2EEE:
	.quad	0
	.quad	__ZTIN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE2EEE
	.quad	__ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE2EED1Ev
	.quad	__ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE2EED0Ev
	.quad	__ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE2EE4openERNS_16ExecutionContextE
	.quad	__ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE2EE4nextERNS_3RowE
	.quad	__ZN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE2EE5closeEv

	.section	__TEXT,__const
__ZTSN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE2EEE: ; @_ZTSN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE2EEE
	.asciz	"N6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE2EEE"

	.section	__DATA,__const
	.p2align	3, 0x0                          ; @_ZTIN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE2EEE
__ZTIN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE2EEE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE2EEE
	.quad	__ZTIN6vquery9RowSourceE

	.p2align	3, 0x0                          ; @_ZTVN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE0EEE
__ZTVN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE0EEE:
	.quad	0
	.quad	__ZTIN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE0EEE
	.quad	__ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE0EED1Ev
	.quad	__ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE0EED0Ev
	.quad	__ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE0EE4openERNS_16ExecutionContextE
	.quad	__ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE0EE4nextERNS_3RowE
	.quad	__ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE0EE5closeEv

	.section	__TEXT,__const
__ZTSN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE0EEE: ; @_ZTSN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE0EEE
	.asciz	"N6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE0EEE"

	.section	__DATA,__const
	.p2align	3, 0x0                          ; @_ZTIN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE0EEE
__ZTIN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE0EEE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE0EEE
	.quad	__ZTIN6vquery9RowSourceE

	.p2align	3, 0x0                          ; @_ZTVN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE1EEE
__ZTVN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE1EEE:
	.quad	0
	.quad	__ZTIN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE1EEE
	.quad	__ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE1EED1Ev
	.quad	__ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE1EED0Ev
	.quad	__ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE1EE4openERNS_16ExecutionContextE
	.quad	__ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE1EE4nextERNS_3RowE
	.quad	__ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE1EE5closeEv

	.section	__TEXT,__const
__ZTSN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE1EEE: ; @_ZTSN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE1EEE
	.asciz	"N6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE1EEE"

	.section	__DATA,__const
	.p2align	3, 0x0                          ; @_ZTIN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE1EEE
__ZTIN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE1EEE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE1EEE
	.quad	__ZTIN6vquery9RowSourceE

	.p2align	3, 0x0                          ; @_ZTVN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE2EEE
__ZTVN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE2EEE:
	.quad	0
	.quad	__ZTIN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE2EEE
	.quad	__ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE2EED1Ev
	.quad	__ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE2EED0Ev
	.quad	__ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE2EE4openERNS_16ExecutionContextE
	.quad	__ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE2EE4nextERNS_3RowE
	.quad	__ZN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE2EE5closeEv

	.section	__TEXT,__const
__ZTSN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE2EEE: ; @_ZTSN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE2EEE
	.asciz	"N6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE2EEE"

	.section	__DATA,__const
	.p2align	3, 0x0                          ; @_ZTIN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE2EEE
__ZTIN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE2EEE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE2EEE
	.quad	__ZTIN6vquery9RowSourceE

	.p2align	3, 0x0                          ; @_ZTVN6vquery12_GLOBAL__N_19FilterRowE
__ZTVN6vquery12_GLOBAL__N_19FilterRowE:
	.quad	0
	.quad	__ZTIN6vquery12_GLOBAL__N_19FilterRowE
	.quad	__ZN6vquery12_GLOBAL__N_19FilterRowD1Ev
	.quad	__ZN6vquery12_GLOBAL__N_19FilterRowD0Ev
	.quad	__ZN6vquery12_GLOBAL__N_19FilterRow4openERNS_16ExecutionContextE
	.quad	__ZN6vquery12_GLOBAL__N_19FilterRow4nextERNS_3RowE
	.quad	__ZN6vquery12_GLOBAL__N_19FilterRow5closeEv

	.section	__TEXT,__const
__ZTSN6vquery12_GLOBAL__N_19FilterRowE: ; @_ZTSN6vquery12_GLOBAL__N_19FilterRowE
	.asciz	"N6vquery12_GLOBAL__N_19FilterRowE"

	.section	__DATA,__const
	.p2align	3, 0x0                          ; @_ZTIN6vquery12_GLOBAL__N_19FilterRowE
__ZTIN6vquery12_GLOBAL__N_19FilterRowE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSN6vquery12_GLOBAL__N_19FilterRowE
	.quad	__ZTIN6vquery9RowSourceE

	.p2align	3, 0x0                          ; @_ZTVN6vquery12_GLOBAL__N_17JoinRowE
__ZTVN6vquery12_GLOBAL__N_17JoinRowE:
	.quad	0
	.quad	__ZTIN6vquery12_GLOBAL__N_17JoinRowE
	.quad	__ZN6vquery12_GLOBAL__N_17JoinRowD1Ev
	.quad	__ZN6vquery12_GLOBAL__N_17JoinRowD0Ev
	.quad	__ZN6vquery12_GLOBAL__N_17JoinRow4openERNS_16ExecutionContextE
	.quad	__ZN6vquery12_GLOBAL__N_17JoinRow4nextERNS_3RowE
	.quad	__ZN6vquery12_GLOBAL__N_17JoinRow5closeEv

	.section	__TEXT,__const
__ZTSN6vquery12_GLOBAL__N_17JoinRowE:   ; @_ZTSN6vquery12_GLOBAL__N_17JoinRowE
	.asciz	"N6vquery12_GLOBAL__N_17JoinRowE"

	.section	__DATA,__const
	.p2align	3, 0x0                          ; @_ZTIN6vquery12_GLOBAL__N_17JoinRowE
__ZTIN6vquery12_GLOBAL__N_17JoinRowE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSN6vquery12_GLOBAL__N_17JoinRowE
	.quad	__ZTIN6vquery9RowSourceE

	.p2align	3, 0x0                          ; @_ZTVN6vquery12_GLOBAL__N_19ScanBatchE
__ZTVN6vquery12_GLOBAL__N_19ScanBatchE:
	.quad	0
	.quad	__ZTIN6vquery12_GLOBAL__N_19ScanBatchE
	.quad	__ZN6vquery12_GLOBAL__N_19ScanBatchD1Ev
	.quad	__ZN6vquery12_GLOBAL__N_19ScanBatchD0Ev
	.quad	__ZN6vquery12_GLOBAL__N_19ScanBatch4openERNS_16ExecutionContextE
	.quad	__ZN6vquery12_GLOBAL__N_19ScanBatch4nextERNS_5BatchE
	.quad	__ZN6vquery12_GLOBAL__N_19ScanBatch5closeEv

	.section	__TEXT,__const
__ZTSN6vquery12_GLOBAL__N_19ScanBatchE: ; @_ZTSN6vquery12_GLOBAL__N_19ScanBatchE
	.asciz	"N6vquery12_GLOBAL__N_19ScanBatchE"

	.private_extern	__ZTSN6vquery11BatchSourceE ; @_ZTSN6vquery11BatchSourceE
	.globl	__ZTSN6vquery11BatchSourceE
	.weak_definition	__ZTSN6vquery11BatchSourceE
__ZTSN6vquery11BatchSourceE:
	.asciz	"N6vquery11BatchSourceE"

	.private_extern	__ZTIN6vquery11BatchSourceE ; @_ZTIN6vquery11BatchSourceE
	.section	__DATA,__const
	.globl	__ZTIN6vquery11BatchSourceE
	.weak_definition	__ZTIN6vquery11BatchSourceE
	.p2align	3, 0x0
__ZTIN6vquery11BatchSourceE:
	.quad	__ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	__ZTSN6vquery11BatchSourceE-9223372036854775808

	.p2align	3, 0x0                          ; @_ZTIN6vquery12_GLOBAL__N_19ScanBatchE
__ZTIN6vquery12_GLOBAL__N_19ScanBatchE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSN6vquery12_GLOBAL__N_19ScanBatchE
	.quad	__ZTIN6vquery11BatchSourceE

	.section	__TEXT,__cstring,cstring_literals
l_.str.6:                               ; @.str.6
	.asciz	"unsupported batch size"

	.section	__DATA,__const
	.p2align	3, 0x0                          ; @_ZTVN6vquery12_GLOBAL__N_111FilterBatchE
__ZTVN6vquery12_GLOBAL__N_111FilterBatchE:
	.quad	0
	.quad	__ZTIN6vquery12_GLOBAL__N_111FilterBatchE
	.quad	__ZN6vquery12_GLOBAL__N_111FilterBatchD1Ev
	.quad	__ZN6vquery12_GLOBAL__N_111FilterBatchD0Ev
	.quad	__ZN6vquery12_GLOBAL__N_111FilterBatch4openERNS_16ExecutionContextE
	.quad	__ZN6vquery12_GLOBAL__N_111FilterBatch4nextERNS_5BatchE
	.quad	__ZN6vquery12_GLOBAL__N_111FilterBatch5closeEv

	.section	__TEXT,__const
__ZTSN6vquery12_GLOBAL__N_111FilterBatchE: ; @_ZTSN6vquery12_GLOBAL__N_111FilterBatchE
	.asciz	"N6vquery12_GLOBAL__N_111FilterBatchE"

	.section	__DATA,__const
	.p2align	3, 0x0                          ; @_ZTIN6vquery12_GLOBAL__N_111FilterBatchE
__ZTIN6vquery12_GLOBAL__N_111FilterBatchE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSN6vquery12_GLOBAL__N_111FilterBatchE
	.quad	__ZTIN6vquery11BatchSourceE

	.globl	__ZTVNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEEE ; @_ZTVNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEEE
	.weak_def_can_be_hidden	__ZTVNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEEE
	.p2align	3, 0x0
__ZTVNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEEE:
	.quad	0
	.quad	__ZTINSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEEE
	.quad	__ZNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEED1Ev
	.quad	__ZNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEED0Ev
	.quad	__ZNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEE16__on_zero_sharedEv
	.quad	__ZNKSt3__119__shared_weak_count13__get_deleterERKSt9type_info
	.quad	__ZNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEE21__on_zero_shared_weakEv

	.private_extern	__ZTSNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEEE ; @_ZTSNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEEE
	.section	__TEXT,__const
	.globl	__ZTSNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEEE
	.weak_definition	__ZTSNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEEE
__ZTSNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEEE:
	.asciz	"NSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEEE"

	.private_extern	__ZTINSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEEE ; @_ZTINSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEEE
	.section	__DATA,__const
	.globl	__ZTINSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEEE
	.weak_definition	__ZTINSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEEE
	.p2align	3, 0x0
__ZTINSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEEE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSNSt3__120__shared_ptr_emplaceIN6vquery12MemoryBudgetENS_9allocatorIS2_EEEE-9223372036854775808
	.quad	__ZTINSt3__119__shared_weak_countE

	.section	__TEXT,__cstring,cstring_literals
l_.str.7:                               ; @.str.7
	.asciz	"null memory budget"

l_.str.8:                               ; @.str.8
	.asciz	"vector"

l_.str.9:                               ; @.str.9
	.asciz	"allocation size overflow"

	.section	__DATA,__const
	.p2align	3, 0x0                          ; @_ZTVN6vquery12_GLOBAL__N_19JoinBatchE
__ZTVN6vquery12_GLOBAL__N_19JoinBatchE:
	.quad	0
	.quad	__ZTIN6vquery12_GLOBAL__N_19JoinBatchE
	.quad	__ZN6vquery12_GLOBAL__N_19JoinBatchD1Ev
	.quad	__ZN6vquery12_GLOBAL__N_19JoinBatchD0Ev
	.quad	__ZN6vquery12_GLOBAL__N_19JoinBatch4openERNS_16ExecutionContextE
	.quad	__ZN6vquery12_GLOBAL__N_19JoinBatch4nextERNS_5BatchE
	.quad	__ZN6vquery12_GLOBAL__N_19JoinBatch5closeEv

	.section	__TEXT,__const
__ZTSN6vquery12_GLOBAL__N_19JoinBatchE: ; @_ZTSN6vquery12_GLOBAL__N_19JoinBatchE
	.asciz	"N6vquery12_GLOBAL__N_19JoinBatchE"

	.section	__DATA,__const
	.p2align	3, 0x0                          ; @_ZTIN6vquery12_GLOBAL__N_19JoinBatchE
__ZTIN6vquery12_GLOBAL__N_19JoinBatchE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSN6vquery12_GLOBAL__N_19JoinBatchE
	.quad	__ZTIN6vquery11BatchSourceE

	.p2align	3, 0x0                          ; @switch.table._ZN6vquery12row_pipelineERKNS_6TablesENS_9QuerySpecEmmPKNS_9HashTableIjNS_7KeyHashEEE
l_switch.table._ZN6vquery12row_pipelineERKNS_6TablesENS_9QuerySpecEmmPKNS_9HashTableIjNS_7KeyHashEEE:
	.quad	__ZTVN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE0EEE+16
	.quad	__ZTVN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE1EEE+16
	.quad	__ZTVN6vquery12_GLOBAL__N_17ScanRowILb1ELNS_5QueryE2EEE+16

	.p2align	3, 0x0                          ; @switch.table._ZN6vquery12row_pipelineERKNS_6TablesENS_9QuerySpecEmmPKNS_9HashTableIjNS_7KeyHashEEE.63
l_switch.table._ZN6vquery12row_pipelineERKNS_6TablesENS_9QuerySpecEmmPKNS_9HashTableIjNS_7KeyHashEEE.63:
	.quad	__ZTVN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE0EEE+16
	.quad	__ZTVN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE1EEE+16
	.quad	__ZTVN6vquery12_GLOBAL__N_17ScanRowILb0ELNS_5QueryE2EEE+16

.subsections_via_symbols
