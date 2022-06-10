;	HyperSleep Sentinel
;	John Halfpenny 2021	

* = $1001

; BASIC program to boot the machine language code
	!byte	 $0b, $10, $0a, $00, $9e, $34, $31, $30, $39, $00, $00, $00

			strptr = $fa	; For strings sent to termtype
			scrptr = $fc

			jmp	init
init		

			lda	#$00		; set screen pointer in zp
			sta	scrptr
			lda	#$1e
			sta	scrptr+1

         ldx   #$ff     ; set custom character range for $1c00
         stx   $9005    ; starts at '@', rom chars have to inverted first with code $12

			jsr	$e55f		; cls and home cursor

         ldx   #$08
         stx   $900f    ; borders to black

			
;test message 1
			lda	#<msg
			sta	strptr	
			lda	#>msg
			sta	strptr+1
			ldy	#0
			
ttLoop
			lda	(strptr),y
			sta	(scrptr),y
			iny
			cpy	#10
			bne	ttLoop

;!src		"../routines/delay.asm"
;!src		"termtype1.asm"

;msg		!scr $12, "STATUS REPORT", $0D, $12, "-------------", $0D, $0D, 0 
;msg		!scr $40, "ABC", $0D, "DEFG", $0D, "HIJK", $0D, "LMNO", $0D, "PQRS", $0D, 0
msg		!byte $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0A, $0B
;msg1		!byte	$5C, $5D, $5E, $5F, $0D, $0D, $60, $61, $62, $63, $64, $0D, 0
msg2		!scr	"TUVW", $0D, "XYZ", $5B, $0D, $5C, $5D, $5E, $5F, $0D, $60, $61, $62, $63, $64, $0D, 0
; $64, $65, $66, $67, $0D, 0
;msg2		!scr  $65, $66, $67, $68, $69, $6a, $6b, $6c, $6d, $6e, $0d, 0

delayX   !byte $15
delayY   !byte $20

!src		"../routines/faces.asm"
