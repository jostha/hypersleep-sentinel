;	HyperSleep Sentinel
;	John Halfpenny 2021	

* = $1001

; BASIC program to boot the machine language code
	!byte	 $0b, $10, $0a, $00, $9e, $34, $31, $30, $39, $00, $00, $00

			jmp	init
init		

			strptr 	= $fa		; For strings sent to termtype
			charMem 	= $1c00	; Custom char storage area

;			jsr	screenInit
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
			
			jsr	termType	

;test message man1
			lda	#<msg1
			sta	strptr	
			lda	#>msg1
			sta	strptr+1
			
			jsr	termType	

;test message woman1
			lda	#<msg2
			sta	strptr	
			lda	#>msg2
			sta	strptr+1
			
			jsr	termType	

			rts

moveChars
			ldx 	#(lastChar+1)*8+1
mcLoop      
			lda 	defChars-1,x
			sta 	charMem-1,x
			dex
			bne 	mcLoop
			rts

;!src		"../routines/resources-early.asm"
!src		"../routines/delay.asm"
!src		"../routines/termtype-cset.asm"

msg		!scr	$12, "STATUS REPORT", $0D, $12, "-------------", $0D, $0D, 0 
msg1		!scr $40, "ABC", $0D, "DEFG", $0D, "HIJK", $0D, "LMNO", $0D, "PQRS", $0D, 0
;msg1		!byte	$5C, $5D, $5E, $5F, $0D, $0D, $60, $61, $62, $63, $64, $0D, 0
msg2		!scr	"TUVW", $0D, "XYZ", $5B, $0D, $5C, $5D, $5E, $5F, $0D, $60, $61, $62, $63, $64, $0D, 0
; $64, $65, $66, $67, $0D, 0
;msg2		!scr  $65, $66, $67, $68, $69, $6a, $6b, $6c, $6d, $6e, $0d, 0
;msg		!scr  $12, "ABCD", $0D, "EFGH", $0D, "IJKL", $0D, "MNOP", $0D, "QRST", $0D, 0
;msg		!scr  "ABCD", $0D, "EFGH", $0D, "IJKL", $0D, "MNOP", $0D, "QRST", $0D, "@"
;msg		byte	$41, $AC, $AD, $AE, $AF, $B0, $B1, $B2, $B3, $B4, $B5, $B6, $B7, $B8, $B9, $BA, $BB, $BC, $BD, $BE, $BF
;msg		!byte $00, $01, $02


delayX   !byte $15
delayY   !byte $20

!src		"../routines/faces.asm"
