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
			stx	tmpX		; push string pos to tmp, handled by assembler

			ldy	tmpX		; print cursor after text pos
			iny
			lda	#230
			sta	SCREENCHAR,y

			jsr	delay

			lda	#32
			sta	SCREENCHAR,y	; remove cursor

			jsr 	delay

			lda	#5			; green text (letter changes from white after delay)
			sta	SCREENCOLOURS,x
	
			inx				; move onto next char and screen location
			stx	tmpX
			ldx	charPos
			inx
			ldx	tmpX

strt
	 		lda	msg,x
			cmp	#38
			beq	cr
	 		lda	msg,x
			bne	loop		; loops until byte 0 encountered
			rts

cr
	;TODO calculate 22-x and add value to x to push cursor onto next line
			stx	tmpX
			sty	tmpY

			pha
		;	txa
			lda	#22
			clc
			sbc	charPos
			tay
			sty	tmpYY
			pla

newline
			ldx	#32
			sta	SCREENCHAR,x
			dec	tmpYY
			bne	newline

	;		txa
	;		clc
	;		adc	tmpYY
	;		tax
	;		pla

			ldx	tmpX
			ldy	tmpY

			jmp	loop

!src		"../routines/delay.asm"

;	'&' (#38)  is control character for carriage returns
msg		!scr	"deep into that&darkness peering,&longing, stood there,&wondering, fearing,&doubting, dreaming&dreams no mortal ever&dared to dream before", 0 

delayX	!byte $15
delayY	!byte $20

tmpX		!byte $00
tmpY		!byte $00
tmpYY		!byte $00

charPos	!byte	$00	; Used to track x-pos on line, for calc of newline 
;TAX, TXA, TAY, and TYA are your friends here, because the A register is the most efficient place to do arithmetic on the 6502. If you don't want to trash what's in A, you can start with a PHA and end with a PLA, like so:
