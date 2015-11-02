; $200 (top left corner) to $5ff

; reset colour and video memory address

; store 16bit $0500 at address $8
ldx #$5
stx $9
ldx #$0
stx $8


;store colour $f into X
ldx palletlength

;store pixel offset Y
ldy #$ff

plotpixel:
 lda pallet,x
 sta ($8),y ; blit X into address Y offset from pointer in $8

; next colour
 dex
                ; if colour > 0
 bne nextpixel  ; move to next pixel
 ldx palletlength         ; else reset colour then next pixel

nextpixel:
 dey
 bne movenextpixel
 ldy #$ff
 dec $9
 lda $9
 cmp #$1 
 bne movenextpixel
 lda #$5
 sta $9


movenextpixel: jmp plotpixel

pallet:
 dcb 1,$f,$c,$b,0,2,$a,8,7,3,$d,5,$e,6,4,9

palletlength:
 dcb $e 
