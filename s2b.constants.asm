; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
; Equates section - Names for variables.

; ---------------------------------------------------------------------------
; size variables - you'll get an informational error if you need to change these...
; they are all in units of bytes
Size_of_DAC_samples =		$2723
Size_of_SEGA_sound =		$6174
Size_of_Snd_driver_guess =	$DF3 ; approximate post-compressed size of the Z80 sound driver

; ---------------------------------------------------------------------------
; some variables and functions to help define those constants (redefined before a new set of IDs)
offset :=	0		; this is the start of the pointer table
ptrsize :=	1		; this is the size of a pointer (should be 1 if the ID is a multiple of the actual size)
idstart :=	0		; value to add to all IDs

; function using these variables
id function ptr,((ptr-offset)/ptrsize+idstart)

; V-Int routines
offset :=	Vint_SwitchTbl
ptrsize :=	1
idstart :=	0

VintID_Lag =		id(Vint_Lag_ptr)
VintID_SEGA =		id(Vint_SEGA_ptr)
VintID_Title =		id(Vint_Title_ptr)
VintID_Unused6 =	id(Vint_Unused6_ptr)
VintID_Level =		id(Vint_Level_ptr)
VintID_S1SS =		id(Vint_S1SS_ptr)
VintID_TitleCard =	id(Vint_TitleCard_ptr)
VintID_UnusedE =	id(Vint_UnusedE_ptr)
VintID_Pause =		id(Vint_Pause_ptr)
VintID_Fade =		id(Vint_Fade_ptr)
VintID_PCM =		id(Vint_PCM_ptr)
VintID_SSResults =	id(Vint_SSResults_ptr)
VintID_TitleCardDup =	id(Vint_TitleCardDup_ptr)

; Music IDs
offset :=	zMasterPlaylist
ptrsize :=	1
idstart :=	$81
; $80 is reserved for silence, so if you make idstart $80 or less,
; you may need to insert a dummy zMusIDPtr in the $80 slot

MusID__First = idstart
MusID_OOZ =		id(zMusIDPtr_OOZ)
MusID_GHZ =		id(zMusIDPtr_GHZ)
MusID_MTZ =		id(zMusIDPtr_MTZ)
MusID_CNZ =		id(zMusIDPtr_CNZ)
MusID_DHZ =		id(zMusIDPtr_DHZ)
MusID_HPZ =		id(zMusIDPtr_HPZ)
MusID_NGHZ =		id(zMusIDPtr_NGHZ)
MusID_DEZ =		id(zMusIDPtr_DEZ)
MusID_SpecStg =		id(zMusIDPtr_SpecStg)
MusID_LevelSel =	id(zMusIDPtr_LevelSel)		; according to the code that handles drowning, this was where
							; the developers were planning to put the drowning theme
MusID_LevelSelDup =	id(zMusIDPtr_LevelSelDup)
MusID_FinalBoss =	id(zMusIDPtr_FinalBoss)
MusID_CPZ =		id(zMusIDPtr_CPZ)
MusID_Boss =		id(zMusIDPtr_Boss)
MusID_RWZ =		id(zMusIDPtr_RWZ)
MusID_SSZ =		id(zMusIDPtr_SSZ)
MusID_SSZDup =		id(zMusIDPtr_SSZDup)
MusID_Unused1 =		id(zMusIDPtr_Unused1)
MusID_BOZ =		id(zMusIDPtr_BOZ)
MusID_Unused2 =		id(zMusIDPtr_Unused2)
MusID_Invinc =		id(zMusIDPtr_Invinc)
MusID_HTZ =		id(zMusIDPtr_HTZ)
MusID_HTZDup =		id(zMusIDPtr_HTZDup)
MusID_ExtraLife =	id(zMusIDPtr_ExtraLife)
MusID_Title =		id(zMusIDPtr_Title)
MusID_ActClear =	id(zMusIDPtr_ActClear)
MusID_GameOver =	id(zMusIDPtr_GameOver)
MusID_Continue =	id(zMusIDPtr_Continue)
MusID_Emerald =		id(zMusIDPtr_Emerald)
MusID_EmeraldDup =	id(zMusIDPtr_EmeraldDup)
MusID_EmeraldDup2 =	id(zMusIDPtr_EmeraldDup2)
MusID__End =		id(zMusIDPtr__End)

; Whenever the music references a slot that was its placement in Sonic 1
S1MusID_LZ =		MusID_GHZ
S1MusID_Invinc =	MusID_NGHZ
S1MusID_ExtraLife =	MusID_DEZ
S1MusID_Boss =		MusID_FinalBoss
S1MusID_ActClear =	MusID_Boss
S1MusID_Emerald =	MusID_BOZ

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

Sprite_Table_2:			ds.b	$280	; Sprite attribute table buffer for the bottom split screen in 2-player mode
				ds.b	$80	; unused, but SAT buffer can spill over into this area when there are too many sprites on-screen

Horiz_Scroll_Buf:		ds.l	224
				ds.l	16 	; A bug/optimisation in 'SwScrl_CPZ' causes 'Horiz_Scroll_Buf' to overflow into this.
				ds.b	$40	; unused
Horiz_Scroll_Buf_End:

Sonic_Stat_Record_Buf:		ds.b	$100

Sonic_Pos_Record_Buf:		ds.b	$100
Sonic_Pos_Record_Buf_End:

unk_E600:			ds.b	$100

Tails_Pos_Record_Buf:		ds.b	$100
Tails_Pos_Record_Buf_End:

Ring_Positions:			ds.b	$600
Ring_Positions_End:

; $FFFFEE00/Camera_RAM starting from here
		dephase
		!org 0

Hint_counter_reserve:		equ $FFFFF624	; must contain a VDP command word, preferably a write to register $0A. Executed every V-INT.

MiscLevelVariables:		equ	$FFFFF628
VIntSubE_RunCount:		equ MiscLevelVariables
Vint_routine:			equ $FFFFF62A	; routine counter for V-int
Sprite_count:			equ $FFFFF62C	; the number of sprites drawn in the current frame
DMA_data_thunk:			equ $FFFFF640	; used as a RAM holder for the final DMA command word. Data will NOT be preserved across V-INTs, so consider this space reserved.
Hint_flag:			equ $FFFFF644	; unless this is 1, H-int won't run

Water_Level_1:			equ $FFFFF646
Water_Level_2:			equ $FFFFF648
Water_Level_3:			equ $FFFFF64A
Water_on:			equ $FFFFF64C
Water_routine:			equ $FFFFF64D
Water_fullscreen_flag:		equ $FFFFF64E

Do_Updates_in_H_int:		equ $FFFFF64F

Water_flag:			equ $FFFFF730

Sonic_top_speed:		equ $FFFFF760
Sonic_acceleration:		equ $FFFFF762
Sonic_deceleration:		equ $FFFFF764

Primary_Angle:			equ $FFFFF768
Secondary_Angle:		equ $FFFFF76A

Collision_addr:			equ $FFFFF796

WindTunnel_flag:		equ $FFFFF7C7

Debug_placement_mode:		equ $FFFFFE08

Current_ZoneAndAct:		equ $FFFFFE10	; 2 bytes
Current_Zone:			equ $FFFFFE10	; 1 byte
Current_Act:			equ $FFFFFE11	; 1 byte

Demo_mode_flag:			equ $FFFFFFF0	; 1 if a demo is playing (2 bytes)
Debug_mode_flag:		equ $FFFFFFFA

; ---------------------------------------------------------------------------
; VDP addressses
VDP_data_port:			equ $C00000 ; (8=r/w, 16=r/w)
VDP_control_port:		equ $C00004 ; (8=r/w, 16=r/w)