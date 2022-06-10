;	Hello World Example

* = $1001

; BASIC program to boot the machine language code
	!byte	 $0b, $10, $0a, $00, $9e, $34, $31, $30, $39, $00, $00, $00

			jmp	init

init		lda	#$93
			jsr	$FFD2    ; cls    

         ldx   #$08
         stx   $900f    ; borders to black

			ldx	#0
			jmp	strt

loop		jsr	$ffd2
			jsr 	delay
			inx
strt		lda	msg,x
			bne	loop		; loops until byte 0 encountered
			rts

!src            "../routines/delay.asm"

msg		!scr	"HELLO WORLD", 0 

delayX   !byte $40
delayY   !byte $20

