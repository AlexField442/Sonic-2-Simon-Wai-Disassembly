; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
; Equates section - Names for variables.

; ---------------------------------------------------------------------------
; size variables - you'll get an informational error if you need to change these...
; they are all in units of bytes
Size_of_DAC_samples =		$2723
Size_of_SEGA_sound =		$6174
Size_of_Snd_driver_guess =	$DF3 ; approximate post-compressed size of the Z80 sound driver

; ---------------------------------------------------------------------------
; I run the main 68k RAM addresses through this function
; to let them work in both 16-bit and 32-bit addressing modes.
ramaddr function x,-(-x)&$FFFFFFFF

; ---------------------------------------------------------------------------
; RAM variables - General
	phase	ramaddr($FFFF0000)	; Pretend we're in the RAM
RAM_Start:
Chunk_Table:			ds.b	$8000

Level_Layout:			ds.b	$1000
Level_Layout_End:

Block_Table:			ds.b	$1800
Block_Table_End:

TempArray_LayerDef:		ds.b	$200	; used by some layer deformation routines
Decomp_Buffer:			ds.b	$200
Sprite_Table_Input:		ds.b	$400	; in custom format before being converted and stored in Sprite_Table/Sprite_Table_2
Sprite_Table_Input_End:

				ds.b	$2000 ; RESERVED FOR OBJECT RAM, DO NOT REMOVE!!!

Primary_Collision:		ds.b	$600
Secondary_Collision:		ds.b	$600

VDP_Command_Buffer:		ds.w	7*$12	; stores 18 ($12) VDP commands to issue the next time ProcessDMAQueue is called
VDP_Command_Buffer_Slot:	ds.l	1	; stores the address of the next open slot for a queued VDP command

		dephase
		!org 0

Water_Level_1:			equ $FFFFF646
Water_Level_2:			equ $FFFFF648
Water_Level_3:			equ $FFFFF64A
Water_on:			equ $FFFFF64C
Water_routine:			equ $FFFFF64D
Water_fullscreen_flag:		equ $FFFFF64E

Water_flag:			equ $FFFFF730

Sonic_top_speed:		equ $FFFFF760
Sonic_acceleration:		equ $FFFFF762
Sonic_deceleration:		equ $FFFFF764

Primary_Angle:			equ $FFFFF768
Secondary_Angle:		equ $FFFFF76A

Collision_addr:			equ $FFFFF796

WindTunnel_flag:		equ $FFFFF7C7

Debug_placement_mode:		equ $FFFFFE08

Debug_mode_flag:		equ $FFFFFFFA

; ---------------------------------------------------------------------------
; VDP addressses
VDP_data_port:			equ $C00000 ; (8=r/w, 16=r/w)
VDP_control_port:		equ $C00004 ; (8=r/w, 16=r/w)