; plots ONE pixel
; $200 (top left corner) to $5ff
; plot all pixels incrementing the colour

; reset colour and video memory address

; store 16bit $0500 at address $8
ldx #$5
stx $9
ldx #$0
stx $8


;store colour $f into X
ldx #$f

;store pixel offset Y
ldy #$ff

plotpixel:
 txa
 sta ($8),y ; blit X into address Y offset from pointer in $8

; next colour
 dex
                ; if colour > 0
 bne nextpixel  ; move to next pixel
 ldx #$f         ; else reset colour then next pixel

nextpixel:
 dey
 bne movenextpixel
; y is $0
 dec $9 
 beq end

movenextpixel:
 
 jmp plotpixel

end:
 
