;	Hello World Example

* = $1001

; TODO - fill area from 38400 ($9600) - 38911 ($97FF) with value 5
; will set colour memory to green (lower bit is 101 for green)

; BASIC program to boot the machine language code
	!byte	 $0b, $10, $0a, $00, $9e, $34, $31, $30, $39, $00, $00, $00

SCREENCHAR 		= $1e00
SCREENCOLOURS	= $9600

			jmp	init

init		lda	#$93
			jsr	$ffd2		; cls		

			ldx	#$08
			stx	$900f		; borders to black

			ldx	#0			; string pos counter
			jmp	strt		; things have to begin before conditions apply

loop	
			sta	SCREENCHAR,x
			lda	#1			; text colour
			sta	SCREENCOLOURS,x
			stx	tmp		; push string pos to tmp, handled by assembler

			ldy	tmp		; print cursor after text pos
			iny
			lda	#230
			sta	SCREENCHAR,y

			jsr	delay

			lda	#5			; green text (letter changes from white after delay)
			sta	SCREENCOLOURS,x

			inx				; move onto next char and screen location

strt 		lda	msg,x
			bne	loop		; loops until byte 0 encountered
			rts

!src		"../routines/delay.asm"

msg		!scr	"lizard bad lizard bad lizard bad lizard bad lizard bad", 0 

delayX	!byte $40
delayY	!byte $20

tmp		!byte $00
