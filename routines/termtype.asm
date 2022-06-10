;  Termtype
;  John Halfpenny 2021

;  Reads input from msg
;     
;  	Special codes - 
;				$0d	Carriage return   
;				
;
;		Requires -
;				routines/delay.asm

termType
			lda	#30
			jsr	$ffd2		; set text to green

			ldy	#0
			jmp	ttStrt

ttLoop	
			jsr	$ffd2
			lda	#230		; cursor blob appear
			jsr	$ffd2
			jsr 	delay
			lda	#20		; cursor blob disappear
			jsr	$ffd2
			jsr 	delay
			iny

ttStrt
			lda	(strptr),y	; has to be Y!!
			cmp	#38
			bne	ttLoop	; loops until byte 0 encountered
			rts


