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

; palette IDs
offset :=	PalPointers
ptrsize :=	8
idstart :=	0

PalID_SEGA =		id(PalPtr_SEGA)
PalID_Title =		id(PalPtr_Title)
PalID_LevelSel =	id(PalPtr_LevelSel)
PalID_SonicTails =	id(PalPtr_SonicTails)
PalID_GHZ =		id(PalPtr_GHZ)
PalID_OWZ =		id(PalPtr_OWZ)
PalID_WZ =		id(PalPtr_WZ)
PalID_SSZ =		id(PalPtr_SSZ)
PalID_MTZ =		id(PalPtr_MTZ)
PalID_MTZ2 =		id(PalPtr_MTZ2)
PalID_BLZ =		id(PalPtr_BLZ)
PalID_HTZ =		id(PalPtr_HTZ)
PalID_HPZ =		id(PalPtr_HPZ)
PalID_RWZ =		id(PalPtr_RWZ)
PalID_OOZ =		id(PalPtr_OOZ)
PalID_DHZ =		id(PalPtr_DHZ)
PalID_CNZ =		id(PalPtr_CNZ)
PalID_CPZ =		id(PalPtr_CPZ)
PalID_GCZ =		id(PalPtr_GCZ)
PalID_NGHZ =		id(PalPtr_NGHZ)
PalID_DEZ =		id(PalPtr_DEZ)
PalID_HPZ_U =		id(PalPtr_HPZ_U)
PalID_CPZ_U =		id(PalPtr_CPZ_U)
PalID_NGHZ_U =		id(PalPtr_NGHZ_U)
PalID_SpecStg =		id(PalPtr_SpecStg)

S1PalID_SpecStg =	PalID_CPZ_U	; leftover from Sonic 1 Special Stage
PalID_CNZ2 =		PalID_BLZ	; loaded in CNZ2; identical to CNZ1 palette

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

Camera_RAM:

Camera_Positions:
Camera_X_pos:			ds.l	1
Camera_Y_pos:			ds.l	1
Camera_BG_X_pos:		ds.l	1	; only used sometimes as the layer deformation makes it sort of redundant
Camera_BG_Y_pos:		ds.l	1
Camera_BG2_X_pos:		ds.l	1	; used in CPZ
Camera_BG2_Y_pos:		ds.l	1	; used in CPZ
Camera_BG3_X_pos:		ds.l	1	; unused (only initialised at beginning of level)?
Camera_BG3_Y_pos:		ds.l	1	; unused (only initialised at beginning of level)?
Camera_Positions_End:

Camera_Positions_P2:
Camera_X_pos_P2:		ds.l	1
Camera_Y_pos_P2:		ds.l	1
Camera_BG_X_pos_P2:		ds.l	1	; only used sometimes as the layer deformation makes it sort of redundant
Camera_BG_Y_pos_P2:		ds.l	1
Camera_BG2_X_pos_P2:		ds.l	1	; unused (only initialised at beginning of level)?
Camera_BG2_Y_pos_P2:		ds.l	1
Camera_BG3_X_pos_P2:		ds.l	1	; unused (only initialised at beginning of level)?
Camera_BG3_Y_pos_P2:		ds.l	1
Camera_Positions_P2_End:

Block_Crossed_Flags:
Horiz_block_crossed_flag:	ds.b	1	; toggles between 0 and $10 when you cross a block boundary horizontally
Verti_block_crossed_flag:	ds.b	1	; toggles between 0 and $10 when you cross a block boundary vertically
Horiz_block_crossed_flag_BG:	ds.b	1	; toggles between 0 and $10 when background camera crosses a block boundary horizontally
Verti_block_crossed_flag_BG:	ds.b	1	; toggles between 0 and $10 when background camera crosses a block boundary vertically
Horiz_block_crossed_flag_BG2:	ds.b	1	; used in CPZ
				ds.b	1	; $FFFFEE45 ; seems unused
Horiz_block_crossed_flag_BG3:	ds.b	1
				ds.b	1	; $FFFFEE47 ; seems unused
Block_Crossed_Flags_End:

Block_Crossed_Flags_P2:
Horiz_block_crossed_flag_P2:	ds.b	1	; toggles between 0 and $10 when you cross a block boundary horizontally
Verti_block_crossed_flag_P2:	ds.b	1	; toggles between 0 and $10 when you cross a block boundary vertically
				ds.b	6	; $FFFFEE4A-$FFFFEE4F ; seems unused
Block_Crossed_Flags_P2_End:

Scroll_Flags_All:
Scroll_flags:			ds.w	1	; bitfield ; bit 0 = redraw top row, bit 1 = redraw bottom row, bit 2 = redraw left-most column, bit 3 = redraw right-most column
Scroll_flags_BG:		ds.w	1	; bitfield ; bits 0-3 as above, bit 4 = redraw top row (except leftmost block), bit 5 = redraw bottom row (except leftmost block), bits 6-7 = as bits 0-1
Scroll_flags_BG2:		ds.w	1	; bitfield ; essentially unused; bit 0 = redraw left-most column, bit 1 = redraw right-most column
Scroll_flags_BG3:		ds.w	1	; bitfield ; for CPZ; bits 0-3 as Scroll_flags_BG but using Y-dependent BG camera; bits 4-5 = bits 2-3; bits 6-7 = bits 2-3
Scroll_Flags_All_End:

Scroll_Flags_All_P2:
Scroll_flags_P2:		ds.w	1	; bitfield ; bit 0 = redraw top row, bit 1 = redraw bottom row, bit 2 = redraw left-most column, bit 3 = redraw right-most column
Scroll_flags_BG_P2:		ds.w	1	; bitfield ; bits 0-3 as above, bit 4 = redraw top row (except leftmost block), bit 5 = redraw bottom row (except leftmost block), bits 6-7 = as bits 0-1
Scroll_flags_BG2_P2:		ds.w	1	; bitfield ; essentially unused; bit 0 = redraw left-most column, bit 1 = redraw right-most column
Scroll_flags_BG3_P2:		ds.w	1	; bitfield ; for CPZ; bits 0-3 as Scroll_flags_BG but using Y-dependent BG camera; bits 4-5 = bits 2-3; bits 6-7 = bits 2-3
Scroll_Flags_All_P2_End:

Camera_Positions_Copy:
Camera_RAM_copy:		ds.l	2	; copied over every V-int
Camera_BG_copy:			ds.l	2	; copied over every V-int
Camera_BG2_copy:		ds.l	2	; copied over every V-int
Camera_BG3_copy:		ds.l	2	; copied over every V-int
Camera_Positions_Copy_End:

Camera_Positions_Copy_P2:
Camera_P2_copy:			ds.l	8	; copied over every V-int
Camera_Positions_Copy_P2_End:

Scroll_Flags_Copy_All:
Scroll_flags_copy:		ds.w	1	; copied over every V-int
Scroll_flags_BG_copy:		ds.w	1	; copied over every V-int
Scroll_flags_BG2_copy:		ds.w	1	; copied over every V-int
Scroll_flags_BG3_copy:		ds.w	1	; copied over every V-int
Scroll_Flags_Copy_All_End:

Scroll_Flags_Copy_All_P2:
Scroll_flags_copy_P2:		ds.w	1	; copied over every V-int
Scroll_flags_BG_copy_P2:	ds.w	1	; copied over every V-int
Scroll_flags_BG2_copy_P2:	ds.w	1	; copied over every V-int
Scroll_flags_BG3_copy_P2:	ds.w	1	; copied over every V-int
Scroll_Flags_Copy_All_P2_End:

Camera_Difference:
Camera_X_pos_diff:		ds.w	1	; (new X pos - old X pos) * 256
Camera_Y_pos_diff:		ds.w	1	; (new Y pos - old Y pos) * 256
Camera_Difference_End:

Camera_BG_X_pos_diff:		ds.w	1	; Effective camera change used in HTZ screen shake
Camera_BG_Y_pos_diff:		ds.w	1	; Effective camera change used in HTZ screen shake

Camera_Difference_P2:
Camera_X_pos_diff_P2:		ds.w	1	; (new X pos - old X pos) * 256
Camera_Y_pos_diff_P2:		ds.w	1	; (new Y pos - old Y pos) * 256
Camera_Difference_P2_End:

Screen_Shaking_Flag_HTZ:	ds.b	1	; activates screen shaking code in HTZ's layer deformation routine
Screen_Shaking_Flag:		ds.b	1	; activates screen shaking code (if existent) in layer deformation routine
				ds.b	2	; $FFFFEEBE-$FFFFEEBF ; unused
unk_EEC0:			ds.l	1	; unused, except on write in LevelSizeLoad...
unk_EEC4:			ds.w	1	; same as above. The write being a long also overwrites the address below
Camera_Max_Y_pos:		ds.w	1

Camera_Boundaries:
Camera_Min_X_pos:		ds.w	1
Camera_Max_X_pos:		ds.w	1
Camera_Min_Y_pos:		ds.w	1
Camera_Max_Y_pos_now:		ds.w	1
Camera_Boundaries_End:

Camera_Delay:
Horiz_scroll_delay_val:		ds.w	1	; if its value is a, where a != 0, X scrolling will be based on the player's X position a-1 frames ago
Sonic_Pos_Record_Index:		ds.w	1	; into Sonic_Pos_Record_Buf and Sonic_Stat_Record_Buf
Camera_Delay_End:

Camera_Delay_P2:
Horiz_scroll_delay_val_P2:	ds.w	1
Tails_Pos_Record_Index:		ds.w	1	; into Tails_Pos_Record_Buf
Camera_Delay_P2_End:

Camera_Y_pos_bias:		ds.w	1	; added to y position for lookup/lookdown, $60 is center
Camera_Y_pos_bias_End:

				ds.b	2	; $FFFFEEDA ; seems unused
Deform_lock:			ds.b	1	; set to 1 to stop all deformation
				ds.b	1	; $FFFFEEDD ; seems unused
Camera_Max_Y_Pos_Changing:	ds.b	1
Dynamic_Resize_Routine:		ds.b	1
unk_EEE0:			ds.w	1	; used in Unused_RecordPos and Tails' AI code
Camera_BG_X_offset:		ds.w	1	; Used to control background scrolling in X in WFZ ending and HTZ screen shake
Camera_BG_Y_offset:		ds.w	1	; Used to control background scrolling in Y in WFZ ending and HTZ screen shake
HTZ_Terrain_Delay:		ds.w	1	; During HTZ screen shake, this is a delay between rising and sinking terrain during which there is no shaking
HTZ_Terrain_Direction:		ds.b	1	; During HTZ screen shake, 0 if terrain/lava is rising, 1 if lowering
				ds.b	3	; $FFFFEEE9-$FFFFEEEB ; seems unused
Vscroll_Factor_P2_HInt:		ds.l	1
Camera_X_pos_copy:		ds.l	1
Camera_Y_pos_copy:		ds.l	1
				ds.b	8	; $FFFFEEF8-$FFFFEEFF ; seems unused

Camera_RAM_End:

Block_cache:			ds.w	512/16*2	; Width of plane in blocks, with each block getting two words.
Ring_consumption_table:		ds.b	$80	; contains RAM addresses of rings currently being consumed
Ring_consumption_table_End:

				ds.b	$600	; $FFFFF000-$FFFFF5FF ; unused, leftover from the Sonic 1 sound driver

Game_Mode:			ds.b	1	; see GameModesArray (master level trigger, Mstr_Lvl_Trigger)
				ds.b	1	; unused
Ctrl_1_Logical:					; 2 bytes
Ctrl_1_Held_Logical:		ds.b	1	; 1 byte
Ctrl_1_Press_Logical:		ds.b	1	; 1 byte
Ctrl_1:						; 2 bytes
Ctrl_1_Held:			ds.b	1	; 1 byte ; (pressed and held were switched around before)
Ctrl_1_Press:			ds.b	1	; 1 byte
Ctrl_2:						; 2 bytes
Ctrl_2_Held:			ds.b	1	; 1 byte
Ctrl_2_Press:			ds.b	1	; 1 byte
				ds.b	4	; $FFFFF608-$FFFFF60B ; seems unused
VDP_Reg1_val:			ds.w	1	; normal value of VDP register #1 when display is disabled
				ds.b	6	; $FFFFF60E-$FFFFF613 ; seems unused
Demo_Time_left:			ds.w	1	; 2 bytes

Vscroll_Factor:
Vscroll_Factor_FG:		ds.w	1
Vscroll_Factor_BG:		ds.w	1
unk_F61A:			ds.l	1	; Only ever cleared, never used
Vscroll_Factor_P2:
Vscroll_Factor_P2_FG:		ds.w	1
Vscroll_Factor_P2_BG:		ds.w	1
				ds.b	2	; $FFFFF622-$FFFFF623 ; seems unused
Hint_counter_reserve:		ds.w	1	; Must contain a VDP command word, preferably a write to register $0A. Executed every V-INT.
Palette_fade_range:				; Range affected by the palette fading routines
Palette_fade_start:		ds.b	1	; Offset from the start of the palette to tell what range of the palette will be affected in the palette fading routines
Palette_fade_length:		ds.b	1	; Number of entries to change in the palette fading routines

MiscLevelVariables:
VIntSubE_RunCount:		ds.b	1
				ds.b	1	; $FFFFF629 ; seems unused
Vint_routine:			ds.b	1	; routine counter for V-int
				ds.b	1	; $FFFFF62B ; seems unused
Sprite_count:			ds.b	1	; the number of sprites drawn in the current frame
				ds.b	5	; $FFFFF62D-$FFFFF631 ; seems unused
PalCycle_Frame:			ds.w	1	; ColorID loaded in PalCycle
PalCycle_Timer:			ds.w	1	; number of frames until next PalCycle call
RNG_seed:			ds.l	1	; used for random number generation
Game_paused:			ds.w	1	
				ds.b	4	; $FFFFF63C-$FFFFF63F ; seems unused
DMA_data_thunk:			ds.w	1	; Used as a RAM holder for the final DMA command word. Data will NOT be preserved across V-INTs, so consider this space reserved.
				ds.w	1	; $FFFFF642-$FFFFF643 ; seems unused
Hint_flag:			ds.w	1	; unless this is 1, H-int won't run

Water_Level_1:			ds.w	1
Water_Level_2:			ds.w	1
Water_Level_3:			ds.w	1
Water_on:			ds.b	1	; is set based on Water_flag
Water_routine:			ds.b	1
Water_fullscreen_flag:		ds.b	1	; was "Water_move"
Do_Updates_in_H_int:		ds.b	1

				ds.b	2	; $FFFFF650-$FFFFF651 ; seems unused
PalCycle_Frame2:		ds.w	1
PalCycle_Frame3:		ds.w	1
				ds.b	6	; $FFFFF656-$FFFFF65B ; seems unused
Palette_frame:			ds.w	1
Palette_timer:			ds.b	1
Super_Sonic_palette:		ds.b	1

unk_F660:			ds.w	1	; Cleared once, never used
unk_F662:			ds.w	1	; Cleared once, never used
				ds.b	2	; $FFFFF664-$FFFFF665 ; seems unused
PalCycle_Timer2:		ds.w	1
PalCycle_Timer3:		ds.w	1
				ds.b	$16	; $FFFFF66A-$FFFFF67F ; seems unused
MiscLevelVariables_End

; $FFFFF680 starting from here
		dephase
		!org 0

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
Demo_number:			equ $FFFFFFF2	; which demo will play next (2 bytes)
Ending_demo_number:		equ $FFFFFFF4 ; zone for the ending demos (2 bytes, unused)
Graphics_Flags:			equ $FFFFFFF8	; misc. bitfield
Debug_mode_flag:		equ $FFFFFFFA
Checksum_fourcc:		equ $FFFFFFFC

; ---------------------------------------------------------------------------
; VDP addressses
VDP_data_port:			equ $C00000 ; (8=r/w, 16=r/w)
VDP_control_port:		equ $C00004 ; (8=r/w, 16=r/w)