; Faces
; John Halfpenny 2021

; Just loads the faces into a custom charmap at $1c00

* = $1001

; BASIC program to boot the machine language code
   !byte  $0b, $10, $0a, $00, $9e, $34, $31, $30, $39, $00, $00, $00


			jmp	start

start
			ldx	#$ff		; set custom character range for $1c00
			stx	$9005		; starts at '@', other chars +128 for usual letters
			rts

* = $1c00
man1		!byte	$00, $00, $00, $00, $01, $03, $03, $07 
			!byte	$07, $1f, $7f, $ff, $ff, $ef, $ff, $ff 
			!byte	$c0, $f0, $fc, $de, $ff, $ff, $ff, $07	
			!byte	$00, $00, $00, $00, $00, $80, $c0, $e0
			!byte $0f, $0f, $0f, $0f, $0e, $0e, $1f, $0f
			!byte	$e0, $00, $80, $00, $00, $00, $00, $00
			!byte	$01, $00, $00, $00, $00, $00, $00, $00
			!byte	$e0, $f0, $f0, $70, $70, $70, $70, $70
			!byte	$0f, $0f, $0f, $1f, $1f, $1e, $1e, $0e
			!byte $80, $fc, $df, $fe, $c2, $02, $02, $02
			!byte	$00, $3c, $7f, $5f, $01, $00, $00, $00
			!byte	$30, $30, $a0, $20, $00, $00, $20, $20
			!byte $0f, $0f, $07, $03, $03, $01, $01, $01
			!byte	$02, $06, $06, $07, $83, $82, $98, $87
			!byte $00, $00, $00, $e0, $c0, $80, $00, $a0
			!byte	$20, $40, $40, $40, $00, $00, $00, $80
			!byte	$01, $01, $01, $01, $07, $1f, $7f, $ff
			!byte	$84, $c6, $e0, $f0, $fc, $ff, $ff, $bf
			!byte	$00, $81, $03, $06, $1e, $fc, $f0, $e0
			!byte	$80, $80, $80, $c0, $b8, $3e, $1f, $1f
