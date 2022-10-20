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
	mov.w #1234h, R4  ;assign test values
	mov.w #5678h, R5
	mov.w #1ABCh, R9
Main:
	mov.w R4, R6	  ;copy R4 => R6
	mov.w R5, R7	  ;copy R5 => R7
	sub.w #1, R6	  ;decrement values
	sub.w #1, R7
	xor.w R4, R6	  ;if R4 is odd, R4 xor R6 = #1 = R6
	xor.w R5, R7
	cmp #1, R6
	jne oneEven		  ;jump if R4 is even
	cmp #1, R7
	jne oneOdd		  ;jump if R5 is even
	mov.w #0FF0h, R9  ;set R9 to 0x0FF0
	jmp end
oneEven:
	cmp #1, R7
	jne end	  		  ;jump if both are even
oneOdd:
	mov.w R9, R8	  ;save copy of R9 in R8
	xor.w #0FFFFh, R8 ;one's complement of R9
	mov.w R8, R10	  ;store the one's complement of R9 in R10
end:
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
            
