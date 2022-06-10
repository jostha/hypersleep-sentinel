;	Hello World Example

* = $1001

; BASIC program to boot the machine language code
	!byte	 $0b, $10, $0a, $00, $9e, $34, $31, $30, $39, $00, $00, $00

			jmp	init

init		lda	#$93
			jsr	$FFD2    ; cls    

         ldx   #$08
         stx   $900f    ; borders to black

			lda	#30
			jsr	$ffd2		; set text to green

			ldx	#0
			jmp	strt

loop		jsr	$ffd2
			lda	#230		; cursor blob appear
			jsr	$ffd2
			jsr 	delay
			lda	#20		; cursor blob disappear
			jsr	$ffd2
			jsr 	delay
			inx

strt		lda	msg,x
			cmp	#38
			bne	loop		; loops until byte 0 encountered
			rts

!src		"../routines/delay.asm"

msg		!scr	"STATUS REPORT", $0D, "-------------", $0D, $0D, "NOTHING TO REPORT.&" 

delayX   !byte $20
delayY   !byte $20

