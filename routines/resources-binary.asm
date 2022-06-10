; Resources
; John Halfpenny 2021

; Just loads the faces into a custom charmap at $1c00

addr_charset = $1c00 

* = addr_charset                     
;!bin "../routines/charset.cst",793,23   ; skip first 24 bytes from CharPad output (384 is number of bytes in charset)
;!bin "../routines/charset.bin"
!bin "../routines/charrom"

	
