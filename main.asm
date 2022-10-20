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
 	mov.w #2d97h, R4
 	mov.w #6239h, R5
 	mov.w #18f0h, R6 ;B

Main:
 	mov.w R4, R7   ;R7  = R4
 	mov.w R5, R8   ;R8  = R5
 	mov.w R6, R9   ;R9  = B
 	mov.w R9, R10  ;R10 = B
 	and.w R7, R8   ;R8  = R4  and R5  = A
 	xor.w R8, R9   ;R9  = A   xor B   = AxB
 	and.w R8, R10  ;R10 = A   and B   = AnB
 	and.w R9, R10  ;R10 = AxB and AnB = A or B
 	mov.w R10, &203ch



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
            
