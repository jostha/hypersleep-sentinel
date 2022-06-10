; Faces
; John Halfpenny 2021

* = $1001

; BASIC program to boot the machine language code
   !byte  $0b, $10, $0a, $00, $9e, $34, $31, $30, $39, $00, $00, $00

customCharRam = $1c00
ptr = $fa  

			jmp	start

start
         lda   #<man1
         sta   ptr
         lda   #>man1
         sta   ptr+1

			ldy	#00

copy
			lda	(ptr),y
			sta	customCharRam, y			
			iny			
			bne	copy
			
			rts

* = $1c00
man1		!byte	$00, $00, $00, $00, $01, $03, $03, $07, $07, $1f, $7f, $ff, $ff, $ef, $ff, $ff, $c0, $f0, $fc, $de, $ff, $ff, $ff, $07,	$00, $00, $00, $00, $00, $80, $c0, $e0


