; Resources Early
; John Halfpenny 2021

; Call this to set stuff up, for finished game dump appropriate addresses into a binary and import

screenInit
		ldx	#16		; copy 16 registers

screenInitLoop
		dex
		lda	vicScreenRegs,x	; get parameter
		sta	$9000, x					; store to video register
		txa
		bne	screenInitLoop
		rts

vicScreenRegs
		!byte		$0c		; $9000 - horiz centring
		!byte		$26		; $9001 - vertical centring
		!byte		$96		; $9002 - set # of columns
		!byte		$ae		; $9003 - set # of rows
		!byte		$7a		; $9004 - raster beam line
		!byte		$ff		; $9005 - 0-3 start of chr mem
							;			 4-7 rest of video address
		!byte	$57		; $9006 - horizontal pos of light pen
		!byte		$ea		; $9007 - vertical pos of light pen
		!byte		$ff		; $9008 - paddle x
		!byte	$ff		; $9009 - paddle y
		!byte	$00		; $900a - osc 1 freq low
		!byte		$00		; $900b - osc 2 freq med
		!byte		$00		; $900c - osc 3 freq high
		!byte		$00		; $900d - noise source freq
		!byte		$00		; $900e - 0-3 master volume
							;			 4-7 aux colour info
		!byte	$66+8		; $900f - border and colour reg

