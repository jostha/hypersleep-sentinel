;	6502 Delay
;	John Halfpenny 2021

;	Reads delay times from delayX and delayY
;		delayX = inner loop
;		delayY = outer loop

delay
			stx	savedX			; store original values
			sty	savedY

			ldx	delayX			; start of delay, just a nested loop
			ldy	delayY

delayLoop
			dey
			bne	delayLoop
			dex
			bne	delayLoop

			ldx	savedX			; restore original values
			ldy	savedY

			rts

savedX	!byte $00
savedY	!byte $00

