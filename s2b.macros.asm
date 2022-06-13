; tells the Z80 to stop, and waits for it to finish stopping (acquire bus)
stopZ80 macro
	    move.w	#$100,($A11100).l	; stop the Z80
@loop:	    btst	#0,($A11100).l
	    bne.s	@loop			; loop until it says it stopped
	endm

; tells the Z80 to start again
startZ80 macro
	    move.w	#0,($A11100).l		; start the Z80
	endm

; macro to declare a little-endian 16-bit pointer for the Z80 sound driver
rom_ptr_z80 macro addr
	    dc.w	((((addr&$FFFF)|$8000)>>8)|(((addr&$FFFF)|$8000)<<8))&$FFFF
	endm