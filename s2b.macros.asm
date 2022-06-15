; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
; simplifying macros and functions

; tells the Z80 to stop, and waits for it to finish stopping (acquire bus)
stopZ80 macro
	move.w	#$100,($A11100).l ; stop the Z80
.loop:	btst	#0,($A11100).l
	bne.s	.loop ; loop until it says it's stopped
    endm

; tells the Z80 to start again
startZ80 macro
	move.w	#0,($A11100).l    ; start the Z80
    endm

; function to make a little-endian 16-bit pointer for the Z80 sound driver
z80_ptr function x,(x)<<8&$FF00|(x)>>8&$7F|$80

; macro to declare a little-endian 16-bit pointer for the Z80 sound driver
rom_ptr_z80 macro addr
	dc.w z80_ptr(addr)
    endm

; macro to declare an offset table
offsetTable macro {INTLABEL}
current_offset_table := __LABEL__
__LABEL__ label *
    endm

; macro to declare an entry in an offset table
offsetTableEntry macro ptr
	dc.ATTRIBUTE ptr-current_offset_table
    endm