;	HyperSleep Sentinel
;	John Halfpenny 2021	

* = $1001

; BASIC program to boot the machine language code
	!byte	 $0b, $10, $0a, $00, $9e, $34, $31, $30, $39, $00, $00, $00

strptr = $fa	; For strings sent to termtype

			jmp	init

init		
			lda	#$93
			jsr	$FFD2    ; cls    

         ldx   #$08
         stx   $900f    ; borders to black

; test message 1
			lda	#<msg
			sta	strptr	
			lda	#>msg
			sta	strptr+1
			
			jsr	termType	

;test message 2
			lda	#<msg1
			sta	strptr	
			lda	#>msg1
			sta	strptr+1
			
			jsr	termType	

			rts

!src		"../routines/delay.asm"
!src		"../routines/termtype.asm"

msg		!scr	"STATUS REPORT", $0D, "-------------", $0D, $0D, "NOTHING TO REPORT.&" 
msg1		!scr  "AND NOW FOR A CHANGE", $0D, "IN THE ADVERTISED", $0D, "SCHEDULE.&"

delayX   !byte $10
delayY   !byte $20

