;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.

;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------

Init:
	mov.w #1234h, R4	;initialize R4
	mov.w #0678h, R5	;intialize R5
Main:
	cmp R4, R5	;compare R4 and R5
	jeq Main	;R4 = R5
	cmp R4, R5
	jge Greater ;R4 < R5
	cmp R4, R5
	jl  Lesser	;R4 > R5
Greater:
	mov.w #2000h, R6 ;pointer
	mov.w #1h, 0(R6)
	mov.w #2h, 2(R6)
	mov.w #3h, 4(R6)
	mov.w #4h, 6(R6)
	mov.w #5h, 8(R6)
	dec.w R4
	jmp Main
Lesser:
	mov.w #2010h, R6 ;pointer
	mov.w #0Ah, 0(R6)
	mov.w #9h, 2(R6)
	mov.w #7h, 4(R6)
	mov.w #6h, 6(R6)
	mov.w #5h, 8(R6)
	dec.w R4
	jmp Main
	nop


;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
            
