;	HyperSleep Sentinel
;	John Halfpenny 2021	

* = $1001

; BASIC program to boot the machine language code
	!byte	 $0b, $10, $0a, $00, $9e, $34, $31, $30, $39, $00, $00, $00

delayX = $15
delayY = $15
savedX = $00
savedY = $00
strptr = $fc	; For strings sent to termtype

			jmp	init
init		
			ldx	#28		; protect from basic may not be needed
			stx	$0034
			stx	$0038

			lda	$9005		; get value of charmem 
			and	#$F0		; keep high nibble value (F)
			ora	#$0E		; set low nibble to E ($1800)
								; low nibble of F would start charmem at ($1C00)
         sta   $9005    ; starts at '@', rom chars have to inverted first with code $12

			jsr	$e55f		; cls and home cursor

         ldx   #$08
         stx   $900f    ; borders to black
			jsr	delay

;test message 1
			lda	#<msg
			sta	strptr	
			lda	#>msg
			sta	strptr+1
			
			jsr	termType	

;test message man1
			lda	#<man1
			sta	strptr	
			lda	#>man1
			sta	strptr+1
		
			jsr	termType	

;test message woman1
;			lda	#<wom1
;			sta	strptr	
;			lda	#>wom1
;			sta	strptr+1
			
;			jsr	termType	

			rts

;msg		!scr	$12, "STATUS REPORT", $0D, $12, "-------------", $0D, $0D, 0 
msg		!text	"STATUS REPORT", $0D, "@@@@@@@@@@@@@@@@@@@@@@", $0D, "ABCDEFGHIJKLMNOPQRSTUVWXYZ", $0D, $0D, 0
;man1		!scr $40, "ABC", $0D, "DEFG", $0D, "HIJK", $0D, "LMNO", $0D, "PQRS", $0D, $0D, 0
;msg1		!byte	$5C, $5D, $5E, $5F, $0D, $0D, $60, $61, $62, $63, $64, $0D, 0
;wom1		!byte	$1B, $1C, $1D, $1E, $0D, $1F, $20, $21, $22, $23, $0D, $24, $25, $26, $27, $28, $0D, $29, $2A, $2B, $2C, $2D, $0D, 0
;wom1		!byte $57, $58, $59, $5a, $0d, $5B, $21, $22, $23, $0D, $24, $25, $26, $27, $0D, $28, $29, $2A, $2B, $0D, $2C, $2D, $2E, $2F, $0D, 0
man1		!byte $3a, $3b, $3c, $3d, $0d, $3e, $3f, $40, $41, $0d, $42, $43, $44, $45, $0d, $46, $47, $48, $49, $0d, $4a, $4b, $4c, $4d, $0d, 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; delay

delay
                        stx     savedX                  ; store original values
                        sty     savedY

                        ldx     delayX                  ; start of delay, just a nested loop
                        ldy     delayY

delayLoop
                        dey
                        bne     delayLoop
                        dex
                        bne     delayLoop

                        ldx     savedX                  ; restore original values
                        ldy     savedY

                        rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; termtype stuff

termType
                        lda     #30
                        jsr     $ffd2           ; set text to green

                        ldy     #0
                        jmp     ttStrt

ttLoop
                        jsr     $ffd2
                        lda     #230            ; cursor blob appear
                        jsr     $ffd2
                        jsr     delay
                        lda     #20             ; cursor blob disappear
                        jsr     $ffd2
                        jsr     delay
                        iny

ttStrt
                        lda     (strptr),y      ; has to be Y!!
                        bne     ttLoop  ; loops until byte ff encountered
                        rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; face char data

* = $1800

at_line	!byte %00000000
			!byte %00000000
			!byte %00000000
			!byte %11111111
			!byte %00000000
			!byte %00000000
			!byte %00000000
			!byte %00000000

a			!byte %00000000
			!byte %01111100
			!byte %01000100
			!byte %01111110
			!byte %01000010
			!byte %01000110
			!byte %01000110
			!byte %00000000

b			!byte %00000000
			!byte %01111100
			!byte %01000100
			!byte %01111110
			!byte %01000010
			!byte %01000110
			!byte %01111110
			!byte %00000000

c			!byte %00000000
			!byte %01111100
			!byte %01000000
			!byte %01000000
			!byte %01000000
			!byte %01100000
			!byte %01111110
			!byte %00000000

d			!byte %00000000
			!byte %01111100
			!byte %00100010
			!byte %00100010
			!byte %00100010
			!byte %00110010
			!byte %01111110
			!byte %00000000

e			!byte %00000000
			!byte %01111100
			!byte %01000000
			!byte %01111000
			!byte %01000000
			!byte %01100000
			!byte %01111110
			!byte %00000000

f			!byte %00000000
			!byte %01111100
			!byte %01000000
			!byte %01111000
			!byte %01000000
			!byte %01100000
			!byte %01100000
			!byte %00000000

g			!byte %00000000
			!byte %01111100
			!byte %01000000
			!byte %01001110
			!byte %01000010
			!byte %01000110
			!byte %01111110
			!byte %00000000

h			!byte %00000000
			!byte %01000000
			!byte %01000010
			!byte %01111110
			!byte %01000010
			!byte %01000110
			!byte %01000110
			!byte %00000000

i			!byte %00000000
			!byte %01111100
			!byte %00010000
			!byte %00010000
			!byte %00010000
			!byte %00011000
			!byte %01111110
			!byte %00000000

j			!byte %00000000
			!byte %01111100
			!byte %00000100
			!byte %00000100
			!byte %00000100
			!byte %00001100
			!byte %01111100
			!byte %00000000

k			!byte %00000000
			!byte %01000100
			!byte %01001000
			!byte %01110000
			!byte %01010000
			!byte %01101000
			!byte %01100100
			!byte %00000000

l			!byte %00000000
			!byte %01000000
			!byte %01000000
			!byte %01000000
			!byte %01000000
			!byte %01100000
			!byte %01111110
			!byte %00000000

m			!byte %00000000
			!byte %01111100
			!byte %01010010
			!byte %01010010
			!byte %01000010
			!byte %01000110
			!byte %01000110
			!byte %00000000

n			!byte %00000000
			!byte %01111100
			!byte %01000010
			!byte %01000010
			!byte %01000010
			!byte %01000110
			!byte %01000110
			!byte %00000000

o			!byte %00000000
			!byte %01111100
			!byte %01000010
			!byte %01000010
			!byte %01000010
			!byte %01000110
			!byte %01111110
			!byte %00000000

p			!byte %00000000
			!byte %01111100
			!byte %01000010
			!byte %01111110
			!byte %01000000
			!byte %01100000
			!byte %01100000
			!byte %00000000

q			!byte %00000000
			!byte %01111100
			!byte %01000010
			!byte %01000010
			!byte %01000010
			!byte %01000110
			!byte %01111110
			!byte %00000110

r			!byte %00000000
			!byte %01111100
			!byte %01000100
			!byte %01111110
			!byte %01000010
			!byte %01000110
			!byte %01000110
			!byte %00000000

s			!byte %00000000
			!byte %01111100
			!byte %01000000
			!byte %01111110
			!byte %00000010
			!byte %00000110
			!byte %01111110
			!byte %00000000

t			!byte %00000000
			!byte %01111100
			!byte %00010000
			!byte %00010000
			!byte %00010000
			!byte %00011000
			!byte %00011000
			!byte %00000000

u			!byte %00000000
			!byte %01000000
			!byte %01000010
			!byte %01000010
			!byte %01000010
			!byte %01000110
			!byte %01111110
			!byte %00000000

v			!byte %00000000
			!byte %01000000
			!byte %01000010
			!byte %01000010
			!byte %01000010
			!byte %00100110
			!byte %00011110
			!byte %00000000

w			!byte %00000000
			!byte %01000000
			!byte %01000010
			!byte %01000010
			!byte %01011010
			!byte %01011110
			!byte %01111110
			!byte %00000000

x			!byte %00000000
			!byte %01000000
			!byte %01000010
			!byte %00111100
			!byte %01000010
			!byte %01000110
			!byte %01000110
			!byte %00000000

y			!byte %00000000
			!byte %01000000
			!byte %01000010
			!byte %01111110
			!byte %00010000
			!byte %00011000
			!byte %00011000
			!byte %00000000

z			!byte %00000000
			!byte %01111100
			!byte %00000010
			!byte %01111110
			!byte %01000000
			!byte %01100000
			!byte %01111110
			!byte %00000000

m1                      !byte   $ff, $ff, $ff, $ff, $fe, $fc, $fc, $f8 
                        !byte   $f8, $e0, $80, $00, $00, $10, $00, $00 
                        !byte   $3f, $0f, $03, $21, $00, $00, $00, $f8
                        !byte   $ff, $ff, $ff, $ff, $ff, $7f, $3f, $1f
                        !byte $f0, $f0, $f0, $f0, $f1, $f1, $e0, $f0

space           !byte $00, $00, $00, $00, $00, $00, $00, $00    ; char 32

m1a                      !byte   $1f, $ff, $7f, $ff, $ff, $ff, $ff, $ff
                        !byte   $fe, $ff, $ff, $ff, $ff, $ff, $ff, $ff
                        !byte   $1f, $0f, $0f, $8f, $8f, $8f, $8f, $8f
                        !byte   $f0, $f0, $f0, $e0, $e0, $e1, $e1, $f1
                        !byte $7f, $03, $20, $01, $3d, $fd, $fd, $fd
                        !byte   $ff, $c3, $80, $a0, $fe, $ff, $ff, $ff
                        !byte   $cf, $cf, $5f, $df, $ff, $ff, $df, $df
                        !byte $f0, $f0, $f8, $fc, $fc, $fe, $fe, $fe
                        !byte   $fd, $f9, $f9, $f8, $7c, $7d, $67, $78
                        !byte $ff, $ff, $ff, $1f, $3f, $7f, $ff, $5f
                        !byte   $df, $bf, $bf, $bf, $ff, $ff, $ff, $7f
                        !byte   $fe, $fe, $fe, $fe, $f8, $e0, $80, $00
                        !byte   $7b, $39, $1f, $0f, $03, $00, $00, $40
                        !byte   $ff, $7e, $fc, $f9, $e1, $03, $0f, $1f
                        !byte   $7f, $7f, $7f, $3f, $47, $c1, $e0, $e0 ; char 19

w1                      !byte $ff, $fe, $fc, $f8, $f0, $f0, $e0, $e0
                        !byte   $00, $00, $00, $00, $00, $00, $00, $01
                        !byte $00, $00, $00, $00, $00, $0c, $3f, $7f
                        !byte   $7f, $1f, $1f, $0f, $07, $07, $03, $03
                        !byte   $e0, $c0, $c0, $c0, $c0, $80, $81, $80
                        !byte   $09, $1b, $25, $6f, $6b, $ff, $1f, $03
                        !byte   $ff, $ff, $ff, $ff, $ff, $fc, $e0, $ef
                        !byte   $83, $c1, $c1, $e1, $e1, $61, $31, $f1
                        !byte $81, $81, $81, $c0, $c1, $c3, $83, $83
                        !byte   $ff, $ff, $87, $4b, $ff, $ff, $ff, $ff
                        !byte   $ff, $f8, $f1, $fe, $ff, $ff, $ff, $ff
                        !byte   $f1, $f1, $39, $f9, $f9, $f9, $fb, $f9
				            !byte   $81, $81, $81, $80, $80, $80, $80, $80
                        !byte   $ff, $ff, $f9, $f8, $fe, $ff, $7c, $70
                        !byte $ff, $ff, $ff, $0f, $7f, $ff, $ff, $07
                        !byte   $f9, $f1, $f1, $f1, $f1, $f9, $f9, $f1
                        !byte   $80, $80, $80, $80, $80, $00, $00, $00
                        !byte $7f, $39, $1e, $0f, $07, $81, $00, $00
                        !byte   $ff, $ff, $3f, $ff, $fe, $f8, $00, $01
                        !byte   $f1, $e3, $c3, $c3, $03, $03, $03, $83 ; char 40

