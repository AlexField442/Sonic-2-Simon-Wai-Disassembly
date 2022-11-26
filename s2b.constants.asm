; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
; Equates section - Names for variables.

; ---------------------------------------------------------------------------
; size variables - you'll get an informational error if you need to change these...
; they are all in units of bytes
Size_of_DAC_samples =		$2723
Size_of_SEGA_sound =		$6174
Size_of_Snd_driver_guess =	$DF3 ; approximate post-compressed size of the Z80 sound driver

; ---------------------------------------------------------------------------
; Constants that can be used instead of hard-coded IDs for various things.
; The "id" function allows to remove elements from an array/table without having
; to change the IDs everywhere in the code.

cur_zone_id := 0 ; the zone ID currently being declared
cur_zone_str := "0" ; string representation of the above

; macro to declare a zone ID
; this macro also declares constants of the form zone_id_X, where X is the ID of the zone in stock Sonic 2
; in order to allow level offset tables to be made dynamic
zoneID macro zoneID,{INTLABEL}
__LABEL__ = zoneID
zone_id_{cur_zone_str} = zoneID
cur_zone_id := cur_zone_id+1
cur_zone_str := "\{cur_zone_id}"
    endm

; Zone IDs. These MUST be declared in the order in which their IDs are in-game, otherwise zone offset tables will screw up
green_hill_zone zoneID		$00
ocean_wind_zone zoneID		$01	; UNUSED
wood_zone zoneID		$02
sand_shower_zone zoneID		$03	; UNUSED
metropolis_zone zoneID		$04
metropolis_zone_2 zoneID	$05
blue_lake_zone zoneID		$06	; UNUSED
hill_top_zone zoneID		$07
hidden_palace_zone zoneID	$08
rock_world_zone zoneID		$09	; UNUSED
oil_ocean_zone zoneID		$0A
dust_hill_zone zoneID		$0B
casino_night_zone zoneID	$0C
chemical_plant_zone zoneID	$0D
genocide_city_zone zoneID	$0E	; EMPTY
neo_green_hill_zone zoneID	$0F
death_egg_zone zoneID		$10	; EMPTY, NOT DEFINED IN CERTAIN TABLES

; NOTE: If you want to shift IDs around, set useFullWaterTables to 1 in the assembly options

; set the number of zones
no_of_zones = cur_zone_id

; Zone and act IDs
green_hill_zone_act_1 =		(green_hill_zone<<8)|$00
green_hill_zone_act_2 =		(green_hill_zone<<8)|$01
ocean_wind_zone_act_1 =		(ocean_wind_zone<<8)|$00
ocean_wind_zone_act_2 =		(ocean_wind_zone<<8)|$01
wood_zone_act_1 =		(wood_zone<<8)|$00
wood_zone_act_2 =		(wood_zone<<8)|$01
sand_shower_zone_act_1 =	(sand_shower_zone<<8)|$00
sand_shower_zone_act_2 =	(sand_shower_zone<<8)|$01
metropolis_zone_act_1 =		(metropolis_zone<<8)|$00
metropolis_zone_act_2 =		(metropolis_zone<<8)|$01
metropolis_zone_act_3 =		(metropolis_zone_2<<8)|$00
metropolis_zone_act_4 =		(metropolis_zone_2<<8)|$01
blue_lake_zone_act_1 =		(blue_lake_zone<<8)|$00
blue_lake_zone_act_2 =		(blue_lake_zone<<8)|$01
hill_top_zone_act_1 =		(hill_top_zone<<8)|$00
hill_top_zone_act_2 =		(hill_top_zone<<8)|$01
hidden_palace_zone_act_1 =	(hidden_palace_zone<<8)|$00
hidden_palace_zone_act_2 =	(hidden_palace_zone<<8)|$01
rock_world_zone_act_1 =		(rock_world_zone<<8)|$00
rock_world_zone_act_2 =		(rock_world_zone<<8)|$01
oil_ocean_zone_act_1 =		(oil_ocean_zone<<8)|$00
oil_ocean_zone_act_2 =		(oil_ocean_zone<<8)|$01
dust_hill_zone_act_1 =		(dust_hill_zone<<8)|$00
dust_hill_zone_act_2 =		(dust_hill_zone<<8)|$01
casino_night_zone_act_1 =	(casino_night_zone<<8)|$00
casino_night_zone_act_2 =	(casino_night_zone<<8)|$01
chemical_plant_zone_act_1 =	(chemical_plant_zone<<8)|$00
chemical_plant_zone_act_2 =	(chemical_plant_zone<<8)|$01
genocide_city_zone_act_1 =	(genocide_city_zone<<8)|$00
genocide_city_zone_act_2 =	(genocide_city_zone<<8)|$01
neo_green_hill_zone_act_1 =	(neo_green_hill_zone<<8)|$00
neo_green_hill_zone_act_2 =	(neo_green_hill_zone<<8)|$01
death_egg_zone_act_1 =		(death_egg_zone<<8)|$00
death_egg_zone_act_2 =		(death_egg_zone<<8)|$01

; Non-existant/Sonic 1 IDs called
labyrinth_zone_act_4 =		(ocean_wind_zone<<8)|$03	; leftover from Sonic 1
scrap_brain_zone_act_2 =	(metropolis_zone_2<<8)|$01	; leftover from Sonic 1
metropolis_zone_act_6 =		(metropolis_zone_2<<8)|$03	; ??? ; S1 Special Stage code calls this...

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

; PLC IDs
offset :=	ArtLoadCues
ptrsize :=	2
idstart :=	0

PLCID_Std1 =		id(PLCptr_Std1)
PLCID_Std2 =		id(PLCptr_Std2)

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

; Other sizes
palette_line_size =	$10*2	; 16 word entries

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
Decomp_Buffer_End:
Sprite_Table_Input:		ds.b	$400	; in custom format before being converted and stored in Sprite_Table/Sprite_Table_2
Sprite_Table_Input_End:

; haven't gotten to documenting this yet, but this is here for clearRAM
Object_RAM:
				ds.b	$2000 ; RESERVED FOR OBJECT RAM, DO NOT REMOVE!!!
Object_RAM_End:

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

Plc_Buffer:			ds.b	$60	; Pattern load queue (each entry is 6 bytes)
Plc_Buffer_Only_End:
				; these seem to store nemesis decompression state so PLC processing can be spread out across frames
Plc_Buffer_Reg0:		ds.l	1	
Plc_Buffer_Reg4:		ds.l	1	
Plc_Buffer_Reg8:		ds.l	1	
Plc_Buffer_RegC:		ds.l	1	
Plc_Buffer_Reg10:		ds.l	1	
Plc_Buffer_Reg14:		ds.l	1	
Plc_Buffer_Reg18:		ds.w	1	; amount of current entry remaining to decompress
Plc_Buffer_Reg1A:		ds.w	1	
				ds.b	4	; seems unused
Plc_Buffer_End:

Misc_Variables:
unk_F700:			ds.w	1	; cleared once in Tails CPU routine, never used

; extra variables for the second player (CPU) in 1-player mode
Tails_control_counter:		ds.w	1	; how long until the CPU takes control
				ds.b	2	; $FFFFF704-$FFFFF705 ; seems unused
unk_F706:			ds.w	1	; used in unused Tails CPU routines
Tails_CPU_routine:		ds.w	1
				ds.b	6	; $FFFFF70A-$FFFFF70F ; seems unused

Rings_manager_routine:		ds.b	1
Level_started_flag:		ds.b	1

Ring_Manager_Addresses:
Ring_start_addr:		ds.w	1
Ring_end_addr:			ds.w	1
Ring_Manager_Addresses_End:

Ring_Manager_Addresses_P2:
Ring_start_addr_P2:		ds.w	1
Ring_end_addr_P2:		ds.w	1
Ring_Manager_Addresses_P2_End:
				ds.b	6	; $FFFFF71A-$FFFFF71F ; seems unused

Screen_redraw_flag:		ds.b	1	; if whole screen needs to redraw
CPZ_UnkScroll_Timer:		ds.b	1	; used only in unused CPZ scrolling function
				ds.b	$E	; $FFFFF722-$FFFFF72F ; seems unused
Water_flag:			ds.b	1	; if the level has water or oil
				ds.b	$F	; $FFFFF731-$FFFFF73F ; seems unused
Demo_button_index_2P:		ds.w	1	; index into button press demo data, for player 2
Demo_press_counter_2P:		ds.w	1	; frames remaining until next button press, for player 2
				ds.b	$C	; $FFFFF744-$FFFFF74F ; seems unused

SpecialStage_angle:		ds.w	1	; current angle of Special Stage
SpecialStage_speed:		ds.b	1	; switches between slow or fast depending on whether the UP/DOWN blocks are hit (also written to next byte)
SpecialStage_direction:		ds.b	1	; current turning direction
				ds.b	$C	; $FFFFF754-$FFFFF75F ; seems unused

Sonic_Speeds:
Sonic_top_speed:		ds.w	1
Sonic_acceleration:		ds.w	1
Sonic_deceleration:		ds.w	1
Sonic_Speeds_End:

Sonic_LastLoadedDPLC:		ds.b	1	; mapping frame number when Sonic last had his tiles requested to be transferred from ROM to VRAM. can be set to a dummy value like -1 to force a refresh DMA
				ds.b	1	; $FFFFF767 ; seems unused
Primary_Angle:			ds.b	1
				ds.b	1	; $FFFFF769 ; seems unused
Secondary_Angle:		ds.b	1
				ds.b	1	; $FFFFF76B ; seems unused
Obj_placement_routine:		ds.b	1
				ds.b	1	; $FFFFF76D ; seems unused
Camera_X_pos_last:		ds.w	1	; Camera_X_pos_coarse from the previous frame
Camera_X_pos_last_End:

Object_Manager_Addresses:
Obj_load_addr_right:		ds.l	1	; contains the address of the next object to load when moving right
Obj_load_addr_left:		ds.l	1	; contains the address of the last object loaded when moving left
Object_Manager_Addresses_End:

Object_Manager_Addresses_P2:
Obj_load_addr_right_P2:		ds.l	1
Obj_load_addr_left_P2:		ds.l	1
Object_Manager_Addresses_P2_End:

Object_manager_2P_RAM:	; The next 16 bytes belong to this.
Object_RAM_block_indices:	ds.b	6	; seems to be an array of horizontal chunk positions, used for object position range checks
Player_1_loaded_object_blocks:	ds.b	3
Player_2_loaded_object_blocks:	ds.b	3

Camera_X_pos_last_P2:		ds.w	1
Camera_X_pos_last_P2_End:

Obj_respawn_index_P2:		ds.b	2	; respawn table indices of the next objects when moving left or right for the second player
Obj_respawn_index_P2_End:
Object_manager_2P_RAM_End:

Demo_button_index:		ds.w	1	; index into button press demo data, for player 1
Demo_press_counter:		ds.b	1	; frames remaining until next button press, for player 1
				ds.b	1	; $FFFFF793 ; seems unused
PalChangeSpeed:			ds.w	1
Collision_addr:			ds.l	1

SSPalCycle_Frame:		ds.w	1
SSPalCycle_Timer:		ds.w	1
unk_F79E:			ds.w	1
unk_F7A0:			ds.w	1
				ds.b	5	; $FFFFF7A2-$FFFFF7A6 ; seems unused
Boss_defeated_flag:		ds.b	1
				ds.b	2	; $FFFFF7A8-$FFFFF7A9 ; seems unused
Current_Boss_ID:		ds.b	1
				ds.b	5	; $FFFFF7AB-$FFFFF7AF ; seems unused
MTZ_Platform_Cog_X:		ds.w	1	; X position of moving MTZ platform for cog animation.
MTZCylinder_Angle_Sonic:	ds.b	1
MTZCylinder_Angle_Tails:	ds.b	1
				ds.b	$A	; $FFFFF7B4-$FFFFF7BD ; seems unused
BigRingGraphics:		ds.w	1	; S1 holdover
				ds.b	7	; $FFFFF7C0-$FFFFF7C6 ; seems unused
WindTunnel_flag:		ds.b	1
				ds.b	1	; $FFFFF7C8 ; seems unused
WindTunnel_holding_flag:	ds.b	1
Sliding_flag:			ds.b	1	; merged into the character's status flag in the final, likely to fix bugs with Tails
				ds.b	1	; $FFFFF7CB ; seems unused
Control_Locked:			ds.b	1
Enter_SpecialStage_flag:	ds.b	1
				ds.b	2	; $FFFFF7CE-$FFFFF7CF ; seems unused
Chain_Bonus_counter:		ds.w	1	; counts up when you destroy things that give points, resets when you touch the ground
Bonus_Countdown_1:		ds.w	1	; level results time bonus
Bonus_Countdown_2:		ds.w	1	; level results ring bonus
Update_Bonus_score:		ds.b	1
				ds.b	3	; $FFFFF7D7-$FFFFF7D9 ; seems unused

Camera_X_pos_coarse:		ds.w	1	; (Camera_X_pos - 128) / 256
Camera_X_pos_coarse_End:

Camera_X_pos_coarse_P2:		ds.w	1
Camera_X_pos_coarse_P2_End:

Tails_LastLoadedDPLC:		ds.b	1	; mapping frame number when Tails last had his tiles requested to be transferred from ROM to VRAM. can be set to a dummy value like -1 to force a refresh DMA.
TailsTails_LastLoadedDPLC:	ds.b	1	; mapping frame number when Tails' tails last had their tiles requested to be transferred from ROM to VRAM. can be set to a dummy value like -1 to force a refresh DMA.
ButtonVine_Trigger:		ds.b	$10	; 16 bytes flag array, #subtype byte set when button/vine of respective subtype activated
Anim_Counters:			ds.b	$10	; $FFFFF7F0-$FFFFF7FF
Misc_Variables_End:

Sprite_Table:			ds.b	$200	; Sprite attribute table buffer
Sprite_Table_End:
				; no buffer in this version, in fact there's actually not ENOUGH RAM
				; allocated to the sprite table, although in this case the "Ashura"
				; glitch only occurs with the underwater palette

; $FFFFFA00
Underwater_target_palette:		ds.b palette_line_size	; This is used by the screen-fading subroutines.
Underwater_target_palette_line2:	ds.b palette_line_size	; While Underwater_palette contains the blacked-out palette caused by the fading,
Underwater_target_palette_line3:	ds.b palette_line_size	; Underwater_target_palette will contain the palette the screen will ultimately fade in to.
Underwater_target_palette_line4:	ds.b palette_line_size

Underwater_palette:		ds.b palette_line_size	; main palette for underwater parts of the screen
Underwater_palette_line2:	ds.b palette_line_size
Underwater_palette_line3:	ds.b palette_line_size
Underwater_palette_line4:	ds.b palette_line_size

Normal_palette:			ds.b	palette_line_size	; main palette for non-underwater parts of the screen
Normal_palette_line2:		ds.b	palette_line_size
Normal_palette_line3:		ds.b	palette_line_size
Normal_palette_line4:		ds.b	palette_line_size
Normal_palette_End:

Target_palette:			ds.b	palette_line_size	; This is used by the screen-fading subroutines.
Target_palette_line2:		ds.b	palette_line_size	; While Normal_palette contains the blacked-out palette caused by the fading,
Target_palette_line3:		ds.b	palette_line_size	; Target_palette will contain the palette the screen will ultimately fade in to.
Target_palette_line4:		ds.b	palette_line_size
Target_palette_End:

Object_Respawn_Table:		; $FFFFFC00
Obj_respawn_index:		ds.b	2	; respawn table indices of the next objects when moving left or right for the first player
Obj_respawn_index_End:
Obj_respawn_data:		ds.b	$BE	; for stock S2, $80 is enough
Obj_respawn_data_End:
				ds.b	$140	; stack; the first $BE bytes are cleared by ObjectsManager_Init, with possibly disastrous consequences. At least $A0 bytes are needed.
System_Stack:

CrossResetRAM:	; RAM in this region will not be cleared after a soft reset.

				ds.b	2	; $FFFFFE00-$FFFFFE01 ; seems unused
Level_Inactive_flag:		ds.w	1	; (2 bytes)
Timer_frames:			ds.w	1	; (2 bytes)
Debug_object:			ds.b	1
				ds.b	1	; $FFFFFE07 ; seems unused
Debug_placement_mode:		ds.b	1
				ds.b	1	; the whole word is tested, but the debug mode code uses only the low byte
Debug_Accel_Timer:		ds.b	1
Debug_Speed:			ds.b	1
Vint_runcount:			ds.l	1

Current_ZoneAndAct:				; 2 bytes
Current_Zone:			ds.b	1	; 1 byte
Current_Act:			ds.b	1	; 1 byte
Life_count:			ds.b	1
				ds.b	1	; $FFFFFE13 ; seems unused
Current_Air:			ds.b	1
				ds.b	1	; $FFFFFE15 ; seems unused

Current_Special_Stage:		ds.b	1
				ds.b	1	; $FFFFFE17 ; seems unused
Continue_count:			ds.b	1	; only cleared, never used
				ds.b	1	; $FFFFFE19 ; seems unused
Time_Over_flag:			ds.b	1
Extra_life_flags:		ds.b	1

; If set, the respective HUD element will be updated.
Update_HUD_lives:		ds.b	1
Update_HUD_rings:		ds.b	1
Update_HUD_timer:		ds.b	1
Update_HUD_score:		ds.b	1

Ring_count:			ds.w	1	; 2 bytes
Timer:						; 4 bytes
				ds.b	1	; filler
Timer_minute:			ds.b	1	; 1 byte
Timer_second:			ds.b	1	; 1 byte
Timer_frame:			ds.b	1	; 1 byte

Score:				ds.l	1	; 4 bytes
				ds.b	2	; $FFFFFE2A-$FFFFFE2B ; seems unused
Shield:				ds.b	1
Invincibility:			ds.b	1
Speed_shoes:			ds.b	1
unk_FE2F:			ds.b	1	; cleared once, never used

Last_star_pole_hit:		ds.b	1	; 1 byte -- max activated starpole ID in this act
Saved_Last_star_pole_hit:	ds.b	1
Saved_x_pos:			ds.w	1
Saved_y_pos:			ds.w	1
Saved_Ring_count:		ds.w	1
Saved_Timer:			ds.l	1
Saved_Dynamic_Resize_Routine:	ds.b	1
				ds.b	1	; $FFFFFE3D ; seems unused
Saved_Camera_Max_Y_pos:		ds.w	1
Saved_Camera_X_pos:		ds.w	1
Saved_Camera_Y_pos:		ds.w	1
Saved_Camera_BG_X_pos:		ds.w	1
Saved_Camera_BG_Y_pos:		ds.w	1
Saved_Camera_BG2_X_pos:		ds.w	1
Saved_Camera_BG2_Y_pos:		ds.w	1
Saved_Camera_BG3_X_pos:		ds.w	1
Saved_Camera_BG3_Y_pos:		ds.w	1
Saved_Water_Level:		ds.w	1
Saved_Water_routine:		ds.b	1
Saved_Water_move:		ds.b	1
Saved_Extra_life_flags:		ds.b	1
				ds.b	2	; $FFFFFE55-$FFFFFE56 ; seems unused
Emerald_count:			ds.b	1
Got_Emeralds_array:		ds.b	6	; 8 bytes are cleared

Oscillating_Numbers:
Oscillation_Control:		ds.w	1
Oscillating_variables:
Oscillating_Data:		ds.w	$20
Oscillating_Numbers_End

				; Fun Fact: when documenting the last of the ROM, I forgot to add this,
				; causing the rest to be incorrect
				ds.b	$20	; $FFFFFEA0-$FFFFFEBF ; seems unused

SpecialStage_anim_counter:
Logspike_anim_counter:		ds.b	1
SpecialStage_anim_frame:
Logspike_anim_frame:		ds.b	1
SpecialStage2_anim_counter:
Rings_anim_counter:		ds.b	1
SpecialStage2_anim_frame:
Rings_anim_frame:		ds.b	1
SpecialStage3_anim_counter:
Unknown_anim_counter:		ds.b	1
SpecialStage3_anim_frame:
Unknown_anim_frame:		ds.b	1
SpecialStage4_anim_counter:
Ring_spill_anim_counter:	ds.b	1	; scattered rings
SpecialStage4_anim_frame:
Ring_spill_anim_frame:		ds.b	1
Ring_spill_anim_accum:		ds.w	1
				ds.b	6	; $FFFFFEC9-$FFFFFECF ; seems unused
Oscillating_variables_End
				ds.b	$20	; $FFFFFED0-$FFFFFEEF ; seems unused

Camera_Min_Y_pos_Debug_Copy:	ds.w	1
Camera_Max_Y_pos_Debug_Copy:	ds.w	1
				ds.b	$4C	; $FFFFFEF4-$FFFFFF3F ; seems unused

Perfect_rings_left:		ds.w	1
				ds.b	$3E	; $FFFFFF42-$FFFFFF7F ; seems unused

LevSel_HoldTimer:		ds.w	1
Level_select_zone:		ds.w	1
Sound_test_sound:		ds.w	1
				ds.b	$3A	; $FFFFFF86-$FFFFFFBF ; seems unused
Next_Extra_life_score:		ds.l	1
				ds.b	$C	; $FFFFFFC4-$FFFFFFCF ; seems unused

Level_select_flag:		ds.b	1
Slow_motion_flag:		ds.b	1
Debug_options_flag:		ds.b	1	; if set, allows you to enable debug mode and "night mode"
Hidden_credits_flag:		ds.b	1	; leftover from Sonic 1
Correct_cheat_entries:		ds.w	1
Correct_cheat_entries_2:	ds.w	1

Two_player_mode:		ds.w	1	; flag (0 for main game)
unk_FFDA:			ds.w	1	; cleared once at title screen, never read from
				ds.b	4	; $FFFFFFDC-$FFFFFFDF ; seems to be unused

; Values in these variables are passed to the sound driver during V-INT.
; They use a playlist index, not a sound test index.
SoundQueue STRUCT DOTS
	Music0:	ds.b	1
	SFX0:	ds.b	1
	SFX1:	ds.b	1
	SFX2:	ds.b	1 ; This one is never used, since nothing ever gets written to it.
SoundQueue ENDSTRUCT

Sound_Queue:			SoundQueue

				ds.b	$C	; $FFFFFFE4-$FFFFFFEF ; seems unused

Demo_mode_flag:			ds.w	1 ; 1 if a demo is playing (2 bytes)
Demo_number:			ds.w	1 ; which demo will play next (2 bytes)
Ending_demo_number:		ds.w	1 ; zone for the ending demos (2 bytes, unused)
				ds.w	1
Graphics_Flags:			ds.w	1 ; misc. bitfield
Debug_mode_flag:		ds.w	1 ; (2 bytes)
Checksum_fourcc:		ds.l	1 ; (4 bytes)

CrossResetRAM_End:

RAM_End

    if * > 0	; Don't declare more space than the RAM can contain!
	fatal "The RAM variable declarations are too large by $\{*} bytes."
    endif

	dephase
	!org 0

; ---------------------------------------------------------------------------
; VDP addressses
VDP_data_port =			$C00000 ; (8=r/w, 16=r/w)
VDP_control_port =		$C00004 ; (8=r/w, 16=r/w)
PSG_input =			$C00011

; ---------------------------------------------------------------------------
; Z80 addresses
Z80_RAM =			$A00000 ; start of Z80 RAM
Z80_RAM_End =			$A02000 ; end of non-reserved Z80 RAM
Z80_Bus_Request =		$A11100
Z80_Reset =			$A11200

Security_Addr =			$A14000

; ---------------------------------------------------------------------------
; I/O Area 
HW_Version =			$A10001
HW_Port_1_Data =		$A10003
HW_Port_2_Data =		$A10005
HW_Expansion_Data =		$A10007
HW_Port_1_Control =		$A10009
HW_Port_2_Control =		$A1000B
HW_Expansion_Control =		$A1000D
HW_Port_1_TxData =		$A1000F
HW_Port_1_RxData =		$A10011
HW_Port_1_SCtrl =		$A10013
HW_Port_2_TxData =		$A10015
HW_Port_2_RxData =		$A10017
HW_Port_2_SCtrl =		$A10019
HW_Expansion_TxData =		$A1001B
HW_Expansion_RxData =		$A1001D
HW_Expansion_SCtrl =		$A1001F

; ---------------------------------------------------------------------------
; VRAM and tile art base addresses.
; VRAM Reserved regions.
VRAM_Plane_A_Name_Table                  = $C000	; Extends until $CFFF
VRAM_Plane_B_Name_Table                  = $E000	; Extends until $EFFF
VRAM_Plane_A_Name_Table_2P               = $A000	; Extends until $AFFF
VRAM_Plane_B_Name_Table_2P               = $8000	; Extends until $8FFF
VRAM_Plane_Table_Size                    = $1000	; 64 cells x 32 cells x 2 bytes per cell
VRAM_Sprite_Attribute_Table              = $F800	; Extends until $FA7F
VRAM_Sprite_Attribute_Table_Size         = $0280	; 640 bytes
VRAM_Horiz_Scroll_Table                  = $FC00	; Extends until $FF7F
VRAM_Horiz_Scroll_Table_Size             = $0380	; 224 lines * 2 bytes per entry * 2 PNTs