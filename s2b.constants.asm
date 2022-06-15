; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
; Equates section - Names for variables.

; ---------------------------------------------------------------------------
; size variables - you'll get an informational error if you need to change these...
; they are all in units of bytes
Size_of_DAC_samples =		$2723
Size_of_SEGA_sound =		$6174
Size_of_Snd_driver_guess =	$DF3 ; approximate post-compressed size of the Z80 sound driver


; ---------------------------------------------------------------------------
; RAM variables - General
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