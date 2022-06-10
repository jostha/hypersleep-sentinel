; Faces
; John Halfpenny 2021

; Just loads the faces into a custom charmap at $1c00

* = $1c00
m1			!byte	$ff, $ff, $ff, $ff, $fe, $fc, $fc, $f8 
			!byte	$f8, $e0, $80, $00, $00, $10, $00, $00 
			!byte	$3f, $0f, $03, $21, $00, $00, $00, $f8	
			!byte	$ff, $ff, $ff, $ff, $ff, $7f, $3f, $1f
			!byte $f0, $f0, $f0, $f0, $f1, $f1, $e0, $f0
			!byte	$1f, $ff, $7f, $ff, $ff, $ff, $ff, $ff
			!byte	$fe, $ff, $ff, $ff, $ff, $ff, $ff, $ff
			!byte	$1f, $0f, $0f, $8f, $8f, $8f, $8f, $8f
			!byte	$f0, $f0, $f0, $e0, $e0, $e1, $e1, $f1
			!byte $7f, $03, $20, $01, $3d, $fd, $fd, $fd
			!byte	$ff, $c3, $80, $a0, $fe, $ff, $ff, $ff
			!byte	$cf, $cf, $5f, $df, $ff, $ff, $df, $df
			!byte $f0, $f0, $f8, $fc, $fc, $fe, $fe, $fe
			!byte	$fd, $f9, $f9, $f8, $7c, $7d, $67, $78
			!byte $ff, $ff, $ff, $1f, $3f, $7f, $ff, $5f
			!byte	$df, $bf, $bf, $bf, $ff, $ff, $ff, $7f
			!byte	$fe, $fe, $fe, $fe, $f8, $e0, $80, $00
			!byte	$7b, $39, $1f, $0f, $03, $00, $00, $40
			!byte	$ff, $7e, $fc, $f9, $e1, $03, $0f, $1f
			!byte	$7f, $7f, $7f, $3f, $47, $c1, $e0, $e0 ; char 19

w1			!byte $ff, $fe, $fc, $f8, $f0, $f0, $e0, $e0
			!byte	$00, $00, $00, $00, $00, $00, $00, $01
			!byte $00, $00, $00, $00, $00, $0c, $3f, $7f
			!byte	$7f, $1f, $1f, $0f, $07, $07, $03, $03
			!byte	$e0, $c0, $c0, $c0, $c0, $80, $81, $80
			!byte	$09, $1b, $25, $6f, $6b, $ff, $1f, $03
			!byte	$ff, $ff, $ff, $ff, $ff, $fc, $e0, $ef
			!byte	$83, $c1, $c1, $e1, $e1, $61, $31, $f1
			!byte $81, $81, $81, $c0, $c1, $c3, $83, $83
			!byte	$ff, $ff, $87, $4b, $ff, $ff, $ff, $ff
			!byte	$ff, $f8, $f1, $fe, $ff, $ff, $ff, $ff
			!byte	$f1, $f1, $39, $f9, $f9, $f9, $fb, $f9

space		!byte $00, $00, $00, $00, $00, $00, $00, $00	; char 32

w1a		!byte	$81, $81, $81, $80, $80, $80, $80, $80
			!byte	$ff, $ff, $f9, $f8, $fe, $ff, $7c, $70
			!byte $ff, $ff, $ff, $0f, $7f, $ff, $ff, $07
			!byte	$f9, $f1, $f1, $f1, $f1, $f9, $f9, $f1
			!byte	$80, $80, $80, $80, $80, $00, $00, $00
			!byte $7f, $39, $1e, $0f, $07, $81, $00, $00
			!byte	$ff, $ff, $3f, $ff, $fe, $f8, $00, $01
			!byte	$f1, $e3, $c3, $c3, $03, $03, $03, $83 ; char 40
	
