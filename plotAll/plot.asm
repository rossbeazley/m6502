; plots ONE pixel
; $200 (top left corner) to $5ff
; plot all pixels incrementing the colour

; reset colour and video memory address
ldx #$f
ldy #$ff

plotpixel:
 txa
 sta $0200,y

; next colour
 dex
 cpx #0         ; if colour > 0
 bne nextpixel  ; move to next pixel
 lda #$f        ; else reset colour then next pixel

nextpixel:
 dey
 cpy #$0
 beq end 
 jmp plotpixel

end:
 
