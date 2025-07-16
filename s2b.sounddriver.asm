; ---------------------------------------------------------------------------
; NOTES:
;
; This code is compressed in the ROM, but you can edit it here as uncompressed
; and it will automatically be assembled and compressed into the correct place
; during the build process.
;
; This Z80 code can use labels and equates defined in the 68k code,
; and the 68k code can use the labels and equates defined in here.
; This is fortunate, as they contain references to each other's addresses.
;
; If you want to add significant amounts of extra code to this driver,
; try putting your code as far down as possible.
; That will make you less likely to run into space shortages from dislocated data alignment.
;
; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
; Setup defines and macros

zStack =	$1B80
zBankRegister =	$6000
zROMWindow =	$8000

	phase $1B80
byte_1B80:	ds.b 1			; DATA XREF: RAM:0001o	RAM:0041o ...
byte_1B81:	ds.b 1			; DATA XREF: RAM:077Cw
					; StopAllSound+11o ...
byte_1B82:	ds.b 1			; DATA XREF: RAM:loc_779w
					; DoTempoDelayr ...
byte_1B83:	ds.b 1			; DATA XREF: RAM:0045r
byte_1B84:	ds.b 1			; DATA XREF: RAM:0057r	RAM:0A00w
byte_1B85:	ds.b 1			; DATA XREF: RAM:09FBw	DoFadeOutr
byte_1B86:	ds.b 1			; DATA XREF: RAM:cfE2_SetCommw
byte_1B87:	ds.b 1			; DATA XREF: RAM:007Bw	RAM:008Aw ...
byte_1B88:	ds.b 1			; DATA XREF: RAM:0071r	DoSoundQueuer ...
byte_1B89:	ds.b 1			; DATA XREF: RAM:0065r	DoSoundQueue+6o
		ds.b 1
		ds.b 1
word_1B8C:	ds.b 2			; DATA XREF: RAM:0764w	RAM:SendFMInsr
byte_1B8E:	ds.b 1			; DATA XREF: RAM:005Er	DoFadeIn+19w ...
byte_1B8F:	ds.b 1			; DATA XREF: DoFadeInr
byte_1B90:	ds.b 1			; DATA XREF: RAM:0729w
					; DoFadeIn:loc_B41r ...
byte_1B91:	ds.b 1			; DATA XREF: RAM:06EAr	RAM:071Cw ...
byte_1B92:	ds.b 1			; DATA XREF: RAM:076Bw	RAM:0B1Ar
byte_1B93:	ds.b 1			; DATA XREF: RAM:073Cw	RAM:0776r ...
byte_1B94:	ds.b 1			; DATA XREF: RAM:076Fr	RAM:0A07w ...
byte_1B95:	ds.b 1			; DATA XREF: RAM:06DBr	RAM:loc_7F3w ...
byte_1B96:	ds.b 1			; DATA XREF: RAM:0747w	zBankSwitchToMusicr
byte_1B97:	ds.b 1			; DATA XREF: RAM:007Eo	RAM:06F0o ...
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
unk_1BA2:	ds.b 1			; DATA XREF: DoTempoDelay+6o
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
unk_1BC1:	ds.b 1			; DATA XREF: RAM:0874o	DoFadeOut+16o ...
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
unk_1CBD:	ds.b 1			; DATA XREF: RAM:0803o
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
unk_1D3B:	ds.b 1			; DATA XREF: RAM:0701o	RAM:loc_845o ...
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
unk_1E37:	ds.b 1			; DATA XREF: RAM:070Fo
					; RAM:cfE4_FadeIno
byte_1E38:	ds.b 1			; DATA XREF: RAM:0B2Fw
byte_1E39:	ds.b 1			; DATA XREF: RAM:loc_B2Cw
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
byte_1E4B:	ds.b 1			; DATA XREF: RAM:0B33w
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
	dephase

    ; In what I believe is an unfortunate design choice in AS,
    ; both the phased and unphased PCs must be within the target processor's range,
    ; which means phase is useless here despite being designed to fix this problem...
    ; oh well, I set it up to fix this later when processing the .p file
    !org 0 ; Z80 code starting at address 0 has special meaning to s2p2bin.exe

    CPU Z80UNDOC
    listing purecode

; Macro to perform a bank switch... after using this,
; the start of zROMWindow points to the start of the given 68k address,
; rounded down to the nearest $8000 byte boundary
bankswitch macro addr68k
	xor	a	; a = 0
	ld	e,1	; e = 1
	ld	hl,zBankRegister
cnt	:= 0
	rept 9
		; this is either ld (hl),a or ld (hl),e
		db (73h|((((addr68k)&(1<<(15+cnt)))==0)<<2))
cnt		:= (cnt+1)
	endm
    endm

; macro to make a certain error message clearer should you happen to get it...
rsttarget macro {INTLABEL}
	if ($&7)||($>38h)
		fatal "Function __LABEL__ is at 0\{$}h, but must be at a multiple of 8 bytes <= 38h to be used with the rst instruction."
	endif
	if "__LABEL__"<>""
__LABEL__ label $
	endif
    endm

; Function to turn a 68k address into a word the Z80 can use to access it,
; assuming the correct bank has been switched to first
zmake68kPtr function addr,zROMWindow+(addr&7FFFh)

; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
; Z80 'ROM' start:
; zEntryPoint:
		di	; disable interrupts
		ld	sp,zStack
		jp	zStartDAC
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B R O U T I N E |||||||||||||||||||||||||||||||||||||||
		align 8
; zsub_8:
zWaitForYM:	rsttarget
		; Performs the annoying task of waiting for the FM to not be busy
		ld	a,(4000h)
		add	a,a
		jr	c,zWaitForYM
		ret
; End of function WaitForYM

; ||||||||||||||| S U B R O U T I N E |||||||||||||||||||||||||||||||||||||||
		align 8
; zsub_10:
zWriteFMIorII:	rsttarget
		bit	2,(ix+1)
		jr	z,zWriteFMI
		jr	zWriteFMII
; End of function zWriteFMIorII

; ||||||||||||||| S U B R O U T I N E |||||||||||||||||||||||||||||||||||||||
		align 8
; zsub_18
zWriteFMI:	rsttarget
		; Write reg/data pair to part I; 'a' is register, 'c' is data
		push	af
		rst	zWaitForYM
		pop	af
		ld	(4000h),a
		push	af
		rst	zWaitForYM
		ld	a,c
		ld	(4001h),a
		pop	af
		ret
; End of function zWriteFMI

; ||||||||||||||| S U B R O U T I N E |||||||||||||||||||||||||||||||||||||||
		align 8
; zsub_28:
zWriteFMII:	rsttarget
		; Write reg/data pair to part II; 'a' is register, 'c' is data
		push	af
		rst	zWaitForYM
		pop	af
		ld	(4002h),a
		push	af
		rst	zWaitForYM
		ld	a,c
		ld	(4003h),a
		pop	af
		ret
; End of function zWriteFMII

; ||||||||||||||| S U B R O U T I N E |||||||||||||||||||||||||||||||||||||||
		org	38h
VInt:		rsttarget
		push	af
		exx
		call	zBankSwitchToMusic
		xor	a
		ld	(byte_11AA), a	; 00 - Music Mode
		ld	ix, byte_1B80	; 1B80 - Sound RAM
		ld	a, (byte_1B83)	; 1B83 = Pause Mode
		or	a
		jr	z, loc_51	; 00 = not paused
		call	DoPause
		jp	RestoreDACBank
; ---------------------------------------------------------------------------

loc_51:					; CODE XREF: RAM:0049j
		dec	(ix+1)		; decrement Tempo Timeout (1B81)
		call	z, DoTempoDelay	; reached 00 - delay all tracks
		ld	a, (byte_1B84)	; 1B84 - remaining Fade	Out Steps
		or	a
		call	nz, DoFadeOut
		ld	a, (byte_1B8E)	; 1B8E - Fade In Enable
		or	a
		call	nz, DoFadeIn
		ld	a, (byte_1B89)	; check	Sound Queue
		or	(ix+0Ah)
		or	(ix+0Bh)
		call	nz, DoSoundQueue ; at least one	of the 3 slots was filled
		ld	a, (byte_1B88)
		cp	80h
		call	nz, PlaySoundID
		ld	a, 0FFh
		ld	(byte_1B87), a	; 1B87 - processing DAC	channel	(FF = yes)
		ld	ix, byte_1B97	; 1B97 - Music Tracks
		bit	7, (ix+0)
		call	nz, DrumUpdateTrack
		xor	a
		ld	(byte_1B87), a	; 1B87 = 00 - not processing the DAC channel anymore
		ld	b, 6

loc_8F:					; CODE XREF: RAM:009Dj
		push	bc
		ld	de, 2Ah
		add	ix, de
		bit	7, (ix+0)
		call	nz, UpdateFMTrack
		pop	bc
		djnz	loc_8F
		ld	b, 3

loc_A1:					; CODE XREF: RAM:00AFj
		push	bc
		ld	de, 2Ah
		add	ix, de
		bit	7, (ix+0)
		call	nz, UpdatePSGTrack
		pop	bc
		djnz	loc_A1
		bankswitch SoundIndex
		ld	a, 80h
		ld	(byte_11AA), a	; 00 - SFX Mode
		ld	b, 3

loc_C7:					; CODE XREF: RAM:00D5j
		push	bc
		ld	de, 2Ah
		add	ix, de
		bit	7, (ix+0)
		call	nz, UpdateFMTrack
		pop	bc
		djnz	loc_C7
		ld	b, 3

loc_D9:					; CODE XREF: RAM:00E7j
		push	bc
		ld	de, 2Ah
		add	ix, de
		bit	7, (ix+0)
		call	nz, UpdatePSGTrack
		pop	bc
		djnz	loc_D9

RestoreDACBank:				; CODE XREF: RAM:004Ej	RAM:0D09j
		bankswitch DACSamples_Start
		ld	a, (byte_11A8)	; check, if a new DAC sound was	queued
		or	a
		jp	m, loc_105	; yes -	jump
		exx
		ld	b, 1
		pop	af
		ei
		ret
; ---------------------------------------------------------------------------

loc_105:				; CODE XREF: RAM:00FCj
		ld	a, 80h
		ex	af, af'
		ld	a, (byte_11A8)
		sub	81h
		ld	(byte_11A8), a
		add	a, a
		add	a, a
		add	a, 75h		; add lower byte from 0F75
		ld	(loc_121+1), a
		add	a, 2
		ld	(loc_124+2), a
		pop	af
		ld	hl, loc_13C
		ex	(sp), hl

loc_121:				; DATA XREF: RAM:0114w
		ld	hl, (word_F75)

loc_124:				; DATA XREF: RAM:0119w
		ld	de, (word_F75+2)

loc_128:				; DATA XREF: RAM:01FAw
		ld	bc, 100h
		ei
		ret
; ---------------------------------------------------------------------------
; InitDriver:
zStartDAC:
		call	StopAllSound
		ei
		ld	iy, DPCMData
		ld	de, 0

loc_138:				; CODE XREF: RAM:013Aj	RAM:0176j
		ld	a, d
		or	e
		jr	z, loc_138

loc_13C:				; CODE XREF: RAM:loc_13Cj
					; DATA XREF: RAM:011Do
		djnz	$
		di
		ld	a, 2Ah
		ld	(4000h), a
		ld	a, (hl)
		rlca
		rlca
		rlca
		rlca
		and	0Fh
		ld	(loc_14F+2), a
		ex	af, af'

loc_14F:				; DATA XREF: RAM:014Bw
		add	a, (iy+0)
		ld	(4001h), a
		ex	af, af'
		ld	b, c
		ei
		nop

loc_159:				; CODE XREF: RAM:loc_159j
		djnz	$
		di
		push	af
		pop	af
		ld	a, 2Ah
		ld	(4000h), a
		ld	b, c
		ld	a, (hl)
		inc	hl
		dec	de
		and	0Fh
		ld	(loc_16D+2), a
		ex	af, af'

loc_16D:				; DATA XREF: RAM:0169w
		add	a, (iy+0)
		ld	(4001h), a
		ex	af, af'
		ei
		nop
		jp	loc_138
; ---------------------------------------------------------------------------
DPCMData:	db    0,   1,	2,   4,	  8, 10h, 20h, 40h ; DATA XREF:	RAM:0131o
		db  80h,0FFh,0FEh,0FCh,0F8h,0F0h,0E0h,0C0h
BGMChnPtrs:	dw 1C15h, 0, 1C3Fh, 1C69h, 1CBDh, 1CE7h, 1D11h,	1D11h
					; DATA XREF: RAM:loc_86Br RAM:loc_91Fr ...
SFXChnPtrs:	dw 1D3Bh, 0, 1D65h, 1D8Fh, 1DB9h, 1DE3h, 1E0Dh,	1E0Dh
					; DATA XREF: RAM:loc_929r
; ---------------------------------------------------------------------------

DrumUpdateTrack:			; CODE XREF: RAM:0086p
		dec	(ix+0Bh)
		ret	nz
		ld	l, (ix+3)
		ld	h, (ix+4)

loc_1B3:				; CODE XREF: RAM:01BCj
		ld	a, (hl)
		inc	hl
		cp	0E0h
		jr	c, loc_1BF
		call	zCoordFlag
		jp	loc_1B3
; ---------------------------------------------------------------------------

loc_1BF:				; CODE XREF: RAM:01B7j
		or	a
		jp	p, loc_1D5
		ld	(ix+0Dh), a
		ld	a, (hl)
		or	a
		jp	p, loc_1D4
		ld	a, (ix+0Ch)
		ld	(ix+0Bh), a
		jp	loc_1D8
; ---------------------------------------------------------------------------

loc_1D4:				; CODE XREF: RAM:01C8j
		inc	hl

loc_1D5:				; CODE XREF: RAM:01C0j
		call	TickMultiplier

loc_1D8:				; CODE XREF: RAM:01D1j
		ld	(ix+3),	l
		ld	(ix+4),	h
		bit	2, (ix+0)
		ret	nz
		ld	a, (ix+0Dh)
		cp	80h
		ret	z		; Drum 80 (null-drum) -	return
		sub	81h
		add	a, a		; else look up the DAC playlist
		add	a, 8Dh
		ld	(loc_1F1+2), a

loc_1F1:				; DATA XREF: RAM:01EEw
		ld	bc, (byte_F8D)
		ld	a, c
		ld	(byte_11A8), a	; request new DAC sound	to be played
		ld	a, b
		ld	(loc_128+1), a	; set playback speed
		ret

; =============== S U B	R O U T	I N E =======================================


UpdateFMTrack:				; CODE XREF: RAM:0099p	RAM:00D1p

; FUNCTION CHUNK AT 0B9C SIZE 00000010 BYTES

		dec	(ix+0Bh)
		jr	nz, loc_210
		res	4, (ix+0)
		call	TrkUpdate_FM
		call	SendFMFreq
		jp	DoNoteOn
; ---------------------------------------------------------------------------

loc_210:				; CODE XREF: UpdateFMTrack+3j
		call	DoNoteStop
		call	DoModulation
		jp	RefreshFMFreq
; End of function UpdateFMTrack


; =============== S U B	R O U T	I N E =======================================


TrkUpdate_FM:				; CODE XREF: UpdateFMTrack+9p

; FUNCTION CHUNK AT 027C SIZE 00000029 BYTES
; FUNCTION CHUNK AT 0E18 SIZE 0000001E BYTES

		ld	l, (ix+3)
		ld	h, (ix+4)
		res	1, (ix+0)

loc_223:				; CODE XREF: TrkUpdate_FM+13j
		ld	a, (hl)
		inc	hl
		cp	0E0h
		jr	c, loc_22F
		call	zCoordFlag
		jp	loc_223
; ---------------------------------------------------------------------------

loc_22F:				; CODE XREF: TrkUpdate_FM+Ej
		push	af
		call	DoNoteOff
		pop	af
		or	a
		jp	p, loc_241
		call	GetFMFreq
		ld	a, (hl)
		or	a
		jp	m, FinishTrkUpdate
		inc	hl

loc_241:				; CODE XREF: TrkUpdate_FM+1Cj
		call	TickMultiplier
		jp	FinishTrkUpdate
; End of function TrkUpdate_FM

; ---------------------------------------------------------------------------

GetFMFreq:				; CODE XREF: TrkUpdate_FM+1Fp
		sub	80h
		jr	z, loc_25F
		add	a, (ix+5)
		add	a, a
		add	a, 1Bh
		ld	(loc_254+2), a

loc_254:				; DATA XREF: RAM:0251w
		ld	de, (FMFreqs)
		ld	(ix+0Dh), e
		ld	(ix+0Eh), d
		ret
; ---------------------------------------------------------------------------

loc_25F:				; CODE XREF: RAM:0249j
		set	1, (ix+0)
		xor	a
		ld	(ix+0Dh), a
		ld	(ix+0Eh), a
		ret

; =============== S U B	R O U T	I N E =======================================


TickMultiplier:				; CODE XREF: RAM:loc_1D5p
					; TrkUpdate_FM:loc_241p ...
		ld	c, a
		ld	b, (ix+2)

loc_26F:				; CODE XREF: TickMultiplier+Ej
		djnz	loc_278
		ld	(ix+0Ch), a
		ld	(ix+0Bh), a
		ret
; ---------------------------------------------------------------------------

loc_278:				; CODE XREF: TickMultiplier:loc_26Fj
		add	a, c
		jp	loc_26F
; End of function TickMultiplier

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR TrkUpdate_FM

FinishTrkUpdate:			; CODE XREF: TrkUpdate_FM+24j
					; TrkUpdate_FM+2Bj ...
		ld	(ix+3),	l
		ld	(ix+4),	h
		ld	a, (ix+0Ch)
		ld	(ix+0Bh), a
		bit	4, (ix+0)
		ret	nz
		ld	a, (ix+10h)
		ld	(ix+0Fh), a
		ld	(ix+9),	0
		bit	3, (ix+0)
		ret	z
		ld	l, (ix+11h)
		ld	h, (ix+12h)
		jp	loc_E18
; END OF FUNCTION CHUNK	FOR TrkUpdate_FM

; =============== S U B	R O U T	I N E =======================================


DoNoteStop:				; CODE XREF: UpdateFMTrack:loc_210p
					; UpdatePSGTrack:loc_4A8p
		ld	a, (ix+0Fh)
		or	a
		ret	z
		dec	(ix+0Fh)
		ret	nz
		set	1, (ix+0)
		pop	de
		bit	7, (ix+1)
		jp	nz, PSGNoteOff
		jp	DoNoteOff
; End of function DoNoteStop


; =============== S U B	R O U T	I N E =======================================


DoModulation:				; CODE XREF: UpdateFMTrack+15p
					; UpdatePSGTrack+18p
		pop	de
		bit	1, (ix+0)
		ret	nz
		bit	3, (ix+0)
		ret	z
		ld	a, (ix+13h)
		or	a
		jr	z, loc_2D2
		dec	(ix+13h)
		ret
; ---------------------------------------------------------------------------

loc_2D2:				; CODE XREF: DoModulation+Fj
		dec	(ix+14h)
		ret	nz
		ld	l, (ix+11h)
		ld	h, (ix+12h)
		inc	hl
		ld	a, (hl)
		ld	(ix+14h), a
		ld	a, (ix+16h)
		or	a
		jr	nz, loc_2F6
		inc	hl
		inc	hl
		ld	a, (hl)
		ld	(ix+16h), a
		ld	a, (ix+15h)
		neg
		ld	(ix+15h), a
		ret
; ---------------------------------------------------------------------------

loc_2F6:				; CODE XREF: DoModulation+28j
		dec	(ix+16h)
		ld	l, (ix+17h)
		ld	h, (ix+18h)
		ld	b, 0
		ld	c, (ix+15h)
		bit	7, c
		jp	z, loc_30B
		ld	b, 0FFh

loc_30B:				; CODE XREF: DoModulation+49j
		add	hl, bc
		ld	(ix+17h), l
		ld	(ix+18h), h
		ld	c, (ix+0Dh)
		ld	b, (ix+0Eh)
		add	hl, bc
		ex	de, hl
		jp	(hl)
; End of function DoModulation

; ---------------------------------------------------------------------------
FMFreqs:	dw  25Eh, 284h,	2ABh, 2D3h, 2FEh, 32Dh,	35Ch, 38Fh, 3C5h, 3FFh,	43Ch, 47Ch
					; DATA XREF: RAM:loc_254r
		dw 0A5Eh,0A84h,0AABh,0AD3h,0AFEh,0B2Dh,0B5Ch,0B8Fh,0BC5h,0BFFh,0C3Ch,0C7Ch
		dw 125Eh,1284h,12ABh,12D3h,12FEh,132Dh,135Ch,138Fh,13C5h,13FFh,143Ch,147Ch
		dw 1A5Eh,1A84h,1AABh,1AD3h,1AFEh,1B2Dh,1B5Ch,1B8Fh,1BC5h,1BFFh,1C3Ch,1C7Ch
		dw 225Eh,2284h,22ABh,22D3h,22FEh,232Dh,235Ch,238Fh,23C5h,23FFh,243Ch,247Ch
		dw 2A5Eh,2A84h,2AABh,2AD3h,2AFEh,2B2Dh,2B5Ch,2B8Fh,2BC5h,2BFFh,2C3Ch,2C7Ch
		dw 325Eh,3284h,32ABh,32D3h,32FEh,332Dh,335Ch,338Fh,33C5h,33FFh,343Ch,347Ch
		dw 3A5Eh,3A84h,3AABh,3AD3h,3AFEh,3B2Dh,3B5Ch,3B8Fh,3BC5h,3BFFh,3C3Ch,3C7Ch

; =============== S U B	R O U T	I N E =======================================


SendFMFreq:				; CODE XREF: UpdateFMTrack+Cp
		bit	1, (ix+0)
		ret	nz
		ld	e, (ix+0Dh)
		ld	d, (ix+0Eh)
		ld	a, d
		or	e
		jp	z, loc_542

RefreshFMFreq:				; CODE XREF: UpdateFMTrack+18j
		bit	2, (ix+0)
		ret	nz
		ld	h, 0
		ld	l, (ix+19h)
		bit	7, l
		jr	z, loc_3FB
		ld	h, 0FFh

loc_3FB:				; CODE XREF: SendFMFreq+1Cj
		add	hl, de
		ld	c, h
		ld	a, (ix+1)
		and	3
		add	a, 0A4h
		rst	zWriteFMIorII
		ld	c, l
		sub	4
		rst	zWriteFMIorII
		ret
; End of function SendFMFreq

; ---------------------------------------------------------------------------
PSGFreqs:	dw  356h, 326h,	2F9h, 2CEh, 2A5h, 280h,	25Ch, 23Ah, 21Ah, 1FBh,	1DFh, 1C4h
					; DATA XREF: RAM:loc_4EAr
		dw  1ABh, 193h,	17Dh, 167h, 153h, 140h,	12Eh, 11Dh, 10Dh, 0FEh,	0EFh, 0E2h
		dw  0D6h, 0C9h,	0BEh, 0B4h, 0A9h, 0A0h,	 97h,  8Fh,  87h,  7Fh,	 78h,  71h
		dw   6Bh,  65h,	 5Fh,  5Ah,  55h,  50h,	 4Bh,  47h,  43h,  40h,	 3Ch,  39h
		dw   36h,  33h,	 30h,  2Dh,  2Bh,  28h,	 26h,  24h,  22h,  20h,	 1Fh,  1Dh
		dw   1Bh,  1Ah,	 18h,  17h,  16h,  15h,	 13h,  12h,  11h,    0

; =============== S U B	R O U T	I N E =======================================


UpdatePSGTrack:				; CODE XREF: RAM:00ABp	RAM:00E3p
		dec	(ix+0Bh)
		jr	nz, loc_4A8
		res	4, (ix+0)
		call	TrkUpdate_PSG
		call	SendPSGFreq
		jp	DoPSGNoteOn
; ---------------------------------------------------------------------------

loc_4A8:				; CODE XREF: UpdatePSGTrack+3j
		call	DoNoteStop
		call	DoVolEnv
		call	DoModulation
		jp	RefreshPSGFreq
; End of function UpdatePSGTrack


; =============== S U B	R O U T	I N E =======================================


TrkUpdate_PSG:				; CODE XREF: UpdatePSGTrack+9p
		ld	l, (ix+3)
		ld	h, (ix+4)
		res	1, (ix+0)

loc_4BE:				; CODE XREF: TrkUpdate_PSG+13j
		ld	a, (hl)
		inc	hl
		cp	0E0h
		jr	c, loc_4CA
		call	zCoordFlag
		jp	loc_4BE
; ---------------------------------------------------------------------------

loc_4CA:				; CODE XREF: TrkUpdate_PSG+Ej
		or	a
		jp	p, loc_4D7
		call	GetPSGFreq
		ld	a, (hl)
		or	a
		jp	m, FinishTrkUpdate
		inc	hl

loc_4D7:				; CODE XREF: TrkUpdate_PSG+17j
		call	TickMultiplier
		jp	FinishTrkUpdate
; End of function TrkUpdate_PSG

; ---------------------------------------------------------------------------

GetPSGFreq:				; CODE XREF: TrkUpdate_PSG+1Ap
		sub	81h
		jr	c, loc_4F5
		add	a, (ix+5)
		add	a, a
		add	a, 0Ah
		ld	(loc_4EA+2), a

loc_4EA:				; DATA XREF: RAM:04E7w
		ld	de, (PSGFreqs)
		ld	(ix+0Dh), e
		ld	(ix+0Eh), d
		ret
; ---------------------------------------------------------------------------

loc_4F5:				; CODE XREF: RAM:04DFj
		set	1, (ix+0)
		ld	a, 0FFh
		ld	(ix+0Dh), a
		ld	(ix+0Eh), a
		jp	PSGNoteOff

; =============== S U B	R O U T	I N E =======================================


SendPSGFreq:				; CODE XREF: UpdatePSGTrack+Cp
		bit	7, (ix+0Eh)
		jr	nz, loc_542
		ld	e, (ix+0Dh)
		ld	d, (ix+0Eh)

RefreshPSGFreq:				; CODE XREF: UpdatePSGTrack+1Bj
		ld	a, (ix+0)
		and	6
		ret	nz
		ld	h, 0
		ld	l, (ix+19h)
		bit	7, l
		jr	z, loc_521
		ld	h, 0FFh

loc_521:				; CODE XREF: SendPSGFreq+19j
		add	hl, de
		ld	a, (ix+1)
		cp	0E0h
		jr	nz, loc_52B
		ld	a, 0C0h

loc_52B:				; CODE XREF: SendPSGFreq+23j
		ld	b, a
		ld	a, l
		and	0Fh
		or	b
		ld	(7F11h), a
		ld	a, l
		srl	h
		rra
		srl	h
		rra
		rra
		rra
		and	3Fh
		ld	(7F11h), a
		ret
; ---------------------------------------------------------------------------

loc_542:				; CODE XREF: SendFMFreq+Dj
					; SendPSGFreq+4j
		set	1, (ix+0)
		ret
; End of function SendPSGFreq


; =============== S U B	R O U T	I N E =======================================


DoVolEnv:				; CODE XREF: UpdatePSGTrack+15p

; FUNCTION CHUNK AT 059F SIZE 00000004 BYTES

		ld	a, (ix+8)
		or	a
		ret	z

DoPSGNoteOn:				; CODE XREF: UpdatePSGTrack+Fj
		ld	b, (ix+6)
		ld	a, (ix+8)
		or	a
		jr	z, SendPSGVolume
		ld	hl, VolEnvPtrs
		dec	a
		add	a, a
		ld	e, a
		ld	d, 0
		add	hl, de
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		add	a, (ix+9)
		ld	l, a
		adc	a, h
		sub	l
		ld	h, a
		ld	a, (hl)
		inc	(ix+9)
		or	a
		jp	p, loc_574
		cp	80h
		jr	z, loc_59F

loc_574:				; CODE XREF: DoVolEnv+26j
		add	a, b
		cp	10h
		jr	c, loc_57B
		ld	a, 0Fh

loc_57B:				; CODE XREF: DoVolEnv+30j
		ld	b, a
; End of function DoVolEnv


; =============== S U B	R O U T	I N E =======================================


SendPSGVolume:				; CODE XREF: DoVolEnv+Cj DoFadeOut+57p ...
		ld	a, (ix+0)
		and	6
		ret	nz
		bit	4, (ix+0)
		jr	nz, loc_592

loc_588:				; CODE XREF: SendPSGVolume+1Aj
					; SendPSGVolume+20j
		ld	a, (ix+1)
		or	b
		add	a, 10h
		ld	(7F11h), a
		ret
; ---------------------------------------------------------------------------

loc_592:				; CODE XREF: SendPSGVolume+Aj
		ld	a, (ix+10h)
		or	a
		jr	z, loc_588
		ld	a, (ix+0Fh)
		or	a
		jr	nz, loc_588
		ret
; End of function SendPSGVolume

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR DoVolEnv

loc_59F:				; CODE XREF: DoVolEnv+2Bj
		dec	(ix+9)
		ret
; END OF FUNCTION CHUNK	FOR DoVolEnv

; =============== S U B	R O U T	I N E =======================================


PSGNoteOff:				; CODE XREF: DoNoteStop+12j RAM:0501j	...
		bit	2, (ix+0)
		ret	nz
		ld	a, (ix+1)
		or	1Fh
		ld	(7F11h), a
		ret
; End of function PSGNoteOff

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR StopAllSound

SilencePSG:				; CODE XREF: DoPause+Dj
					; StopAllSound+23j ...
		ld	hl, 7F11h
		ld	(hl), 9Fh
		ld	(hl), 0BFh
		ld	(hl), 0DFh
		ld	(hl), 0FFh
		ret
; END OF FUNCTION CHUNK	FOR StopAllSound

; =============== S U B	R O U T	I N E =======================================


DoPause:				; CODE XREF: RAM:004Bp
		jp	m, UnpauseMusic	; 80-FF	- request Unpause
		cp	2		; 02 - already paused?
		ret	z		; yes -	return
		ld	(ix+3),	2	; 01 - request Pause, set to 02
		call	SilenceFM
		jp	SilencePSG
; ---------------------------------------------------------------------------

UnpauseMusic:				; CODE XREF: DoPausej
		push	ix
		ld	(ix+3),	0
		ld	ix, 1B97h
		ld	b, 7
		call	sub_5FA
		bankswitch SoundIndex
		ld	ix, 1D3Bh
		ld	b, 3
		call	sub_5FA
		call	zBankSwitchToMusic
		pop	ix
		ret
; End of function DoPause


; =============== S U B	R O U T	I N E =======================================


sub_5FA:				; CODE XREF: DoPause+1Cp DoPause+34p ...
		bit	7, (ix+0)
		jr	z, loc_619
		bit	2, (ix+0)
		jr	nz, loc_619
		ld	c, (ix+7)
		ld	a, (ix+1)
		and	3
		add	a, 0B4h	; '´'
		rst	10h
		push	bc
		ld	a, (ix+8)
		call	SendFMIns
		pop	bc

loc_619:				; CODE XREF: sub_5FA+4j sub_5FA+Aj
		ld	de, 2Ah	; '*'
		add	ix, de
		djnz	sub_5FA
		ret
; End of function sub_5FA


; =============== S U B	R O U T	I N E =======================================


DoSoundQueue:				; CODE XREF: RAM:006Ep
		ld	a, (byte_1B88)
		cp	80h
		ret	nz		; Play Sound slot is full - return
		ld	hl, byte_1B89
		ld	a, (byte_1B80)	; 1B80 - current SFX Priority
		ld	c, a
		ld	b, 3

loc_630:				; CODE XREF: DoSoundQueue:loc_65Bj
		ld	a, (hl)
		ld	e, a
		ld	(hl), 0
		inc	hl
		cp	MusID__First
		jr	c, loc_65B
		sub	0A0h
		jr	nc, loc_642
		ld	a, e
		ld	(byte_1B88), a
		ret
; ---------------------------------------------------------------------------

loc_642:				; CODE XREF: DoSoundQueue+1Aj
		push	hl
		add	a, 30h		; add lower byte of 0F30 (SndPriorities)
		ld	l, a
		adc	a, 0Fh		; higher byte of 0F30 (SndPriorities)
		sub	l
		ld	h, a
		ld	a, (hl)
		cp	c
		jr	c, loc_653
		ld	c, a
		ld	a, e
		ld	(byte_1B88), a

loc_653:				; CODE XREF: DoSoundQueue+2Bj
		pop	hl
		ld	a, c
		or	a
		ret	m
		ld	(byte_1B80), a
		ret
; ---------------------------------------------------------------------------

loc_65B:				; CODE XREF: DoSoundQueue+16j
		djnz	loc_630
		ret
; End of function DoSoundQueue

; ---------------------------------------------------------------------------

PlaySoundID:				; CODE XREF: RAM:0076p
		or	a
		jp	z, StopAllSound
		ret	p		; 00-7F	- Stop All
		ld	(ix+8),	80h
		cp	MusID__End
		jp	c, zPlayMusic	; 80-9F	- Music
		cp	0A0h
		ret	c
		cp	0E1h
		jp	c, PlaySFX	; A0-E0	- SFX
		cp	0F9h
		ret	c		; E2-F8	- unused
		cp	0FEh
		ret	nc		; FE-FF	- unused

PlaySnd_Command:			; F9-FD	- Special Commands
		sub	0F9h
		add	a, a
		add	a, a
		ld	(loc_681+1), a

loc_681:				; CODE XREF: RAM:loc_681j
					; DATA XREF: RAM:067Ew
		jr	$
; ---------------------------------------------------------------------------
		jp	FadeOutMusic	; F9
; ---------------------------------------------------------------------------
		nop
		jp	PlaySegaSound	; FA
; ---------------------------------------------------------------------------
		nop
		jp	SpeedUpMusic	; FB
; ---------------------------------------------------------------------------
		nop
		jp	SlowDownMusic	; FC
; ---------------------------------------------------------------------------
		nop
		jp	StopAllSound	; FD
; ---------------------------------------------------------------------------
		nop

PlaySegaSound:				; CODE XREF: RAM:0687j
		ld	a, 2Bh
		ld	c, 80h
		rst	zWriteFMI
		bankswitch Sega_Snd
		ld	hl,zmake68kPtr(Sega_Snd) ; was 9E8Ch
		ld	de,(Sega_Snd_End - Sega_Snd)/2	; was: 30BAh
		ld	a, 2Ah
		ld	(4000h), a
		ld	c, 80h

loc_6B8:				; CODE XREF: RAM:06D5j
		ld	a, (hl)
		ld	(4001h), a
		inc	hl
		nop
		ld	b, 0Ch

loc_6C0:				; CODE XREF: RAM:loc_6C0j
		djnz	$
		ld	a, (byte_1B88)
		cp	c
		jr	nz, loc_6D8
		ld	a, (hl)
		ld	(4001h), a
		inc	hl
		nop
		ld	b, 0Ch

loc_6D0:				; CODE XREF: RAM:loc_6D0j
		djnz	$
		dec	de
		ld	a, d
		or	e
		jp	nz, loc_6B8

loc_6D8:				; CODE XREF: RAM:06C6j
		call	zBankSwitchToMusic
		ld	a, (byte_1B95)	; load DAC State
		ld	c, a
		ld	a, 2Bh		; Reg 02B - DAC	Enable/Disable
		rst	zWriteFMI
		ret
; ---------------------------------------------------------------------------

zPlayMusic:				; CODE XREF: RAM:0669j
		ld	(byte_11A9), a	; make a backup	of the Music ID
		cp	MusID_ExtraLife
		jr	nz, loc_725
		ld	a, (byte_1B91)
		or	a
		jr	nz, loc_72C
		ld	ix, byte_1B97
		ld	de, 2Ah
		ld	b, 0Ah

loc_6F9:				; CODE XREF: RAM:06FFj
		res	2, (ix+0)
		add	ix, de
		djnz	loc_6F9
		ld	ix, unk_1D3B
		ld	b, 6

loc_707:				; CODE XREF: RAM:070Dj
		res	7, (ix+0)
		add	ix, de
		djnz	loc_707
		ld	de, unk_1E37
		ld	hl, byte_1B80
		ld	bc, 1BBh
		ldir
		ld	a, 80h
		ld	(byte_1B91), a
		xor	a
		ld	(byte_1B80), a
		jr	loc_72C
; ---------------------------------------------------------------------------

loc_725:				; CODE XREF: RAM:06E8j
		xor	a
		ld	(byte_1B91), a
		ld	(byte_1B90), a

loc_72C:				; CODE XREF: RAM:06EEj	RAM:0723j
		call	sub_AAE
		ld	a, (byte_11A9)	; read Music ID	back
		sub	MusID__First
		ld	e, a
		ld	d, 0
		ld	hl, SpeedUpTempoLst
		add	hl, de
		ld	a, (hl)
		ld	(byte_1B93), a
		ld	hl, zMasterPlaylist
		add	hl, de
		ld	a, (hl)
		ld	b, a
		and	80h
		ld	(byte_1B96), a	; write	Music Bank byte
		ld	a, b
		add	a, a
		ld	e, a
		ld	d, 0
		ld	hl,zmake68kPtr(MusicPoint2)
		add	hl, de
		push	hl
		call	zBankSwitchToMusic
		pop	hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		push	de
		pop	ix
		ld	e, (ix+0)
		ld	d, (ix+1)
		ld	(word_1B8C), de
		ld	a, (ix+5)
		ld	(byte_1B92), a
		ld	b, a
		ld	a, (byte_1B94)
		or	a
		ld	a, b
		jr	z, loc_779
		ld	a, (byte_1B93)

loc_779:				; CODE XREF: RAM:0774j
		ld	(byte_1B82), a
		ld	(byte_1B81), a
		push	ix
		pop	hl
		ld	de, 6
		add	hl, de
		ld	a, (ix+2)
		or	a
		jp	z, loc_7F9
		ld	b, a
		push	iy
		ld	iy, byte_1B97	; 1B97 - Music Tracks
		ld	c, (ix+4)
		ld	de, FMInitBytes

loc_79A:				; CODE XREF: RAM:07CCj
		set	7, (iy+0)
		ld	a, (de)
		inc	de
		ld	(iy+1),	a
		ld	(iy+2),	c
		ld	(iy+0Ah), 2Ah
		ld	(iy+7),	0C0h
		ld	(iy+0Bh), 1
		push	de
		push	bc
		ld	a,iyl
		add	a, 3
		ld	e, a
		adc	a,iyh
		sub	e
		ld	d, a
		ldi
		ldi
		ldi
		ldi
		ld	de, 2Ah
		add	iy, de
		pop	bc
		pop	de
		djnz	loc_79A
		pop	iy
		ld	a, (ix+2)
		cp	7
		jr	nz, loc_7DB
		xor	a
		ld	c, a
		jr	loc_7F3
; ---------------------------------------------------------------------------

loc_7DB:				; CODE XREF: RAM:07D5j
		ld	a, 28h
		ld	c, 6
		rst	zWriteFMI
		ld	a, 42h
		ld	c, 0FFh
		ld	b, 4

loc_7E6:				; CODE XREF: RAM:07E9j
		rst	zWriteFMII
		add	a, 4
		djnz	loc_7E6
		ld	a, 0B6h
		ld	c, 0C0h
		rst	zWriteFMII
		ld	a, 80h
		ld	c, a

loc_7F3:				; CODE XREF: RAM:07D9j
		ld	(byte_1B95), a
		ld	a, 2Bh
		rst	zWriteFMI

loc_7F9:				; CODE XREF: RAM:078Aj
		ld	a, (ix+3)
		or	a
		jp	z, loc_845
		ld	b, a
		push	iy
		ld	iy, unk_1CBD
		ld	c, (ix+4)
		ld	de, PSGInitBytes

loc_80D:				; CODE XREF: RAM:0841j
		set	7, (iy+0)
		ld	a, (de)
		inc	de
		ld	(iy+1),	a
		ld	(iy+2),	c
		ld	(iy+0Ah), 2Ah
		ld	(iy+0Bh), 1
		push	de
		push	bc
		ld	a,iyl
		add	a, 3
		ld	e, a
		adc	a,iyh
		sub	e
		ld	d, a
		ldi
		ldi
		ldi
		ldi
		inc	hl
		ld	a, (hl)
		inc	hl
		ld	(iy+8),	a
		ld	de, 2Ah
		add	iy, de
		pop	bc
		pop	de
		djnz	loc_80D
		pop	iy

loc_845:				; CODE XREF: RAM:07FDj
		ld	ix, unk_1D3B
		ld	b, 6
		ld	de, 2Ah

loc_84E:				; CODE XREF: RAM:0872j
		bit	7, (ix+0)
		jr	z, loc_870
		ld	a, (ix+1)
		or	a
		jp	m, loc_860
		sub	2
		add	a, a
		jr	loc_866
; ---------------------------------------------------------------------------

loc_860:				; CODE XREF: RAM:0858j
		rra
		rra
		rra
		rra
		and	0Fh

loc_866:				; CODE XREF: RAM:085Ej
		add	a, 89h
		ld	(loc_86B+1), a

loc_86B:				; DATA XREF: RAM:0868w
		ld	hl, (BGMChnPtrs)
		res	2, (hl)

loc_870:				; CODE XREF: RAM:0852j
		add	ix, de
		djnz	loc_84E
		ld	ix, unk_1BC1	; 1BC1 - Music Track FM	1
		ld	b, 6

loc_87A:				; CODE XREF: RAM:087Fj
		call	DoNoteOff
		add	ix, de
		djnz	loc_87A
		ld	b, 3

loc_883:				; CODE XREF: RAM:0888j
		call	PSGNoteOff
		add	ix, de
		djnz	loc_883
		ret
; ---------------------------------------------------------------------------
FMInitBytes:	db    6,   0,	1,   2,	  4,   5,   6 ;	DATA XREF: RAM:0797o
PSGInitBytes:	db  80h,0A0h,0C0h	; DATA XREF: RAM:080Ao
; ---------------------------------------------------------------------------

PlaySFX:				; CODE XREF: RAM:0671j
		ld	c, a
		ld	a, (ix+11h)
		or	(ix+4)
		or	(ix+0Eh)
		jp	nz, sub_978
		ld	a, c
		cp	0B5h
		jr	nz, loc_8B6
		ld	a, (byte_11AB)	; check	Ring Speaker
		or	a
		jr	nz, loc_8AF
		ld	c, 0CEh		; change SFX ID, play on left speaker

loc_8AF:				; CODE XREF: RAM:08ABj
		cpl
		ld	(byte_11AB), a	; write	inverted Ring Speaker value back
		jp	loc_8C5
; ---------------------------------------------------------------------------

loc_8B6:				; CODE XREF: RAM:08A5j
		ld	a, c
		cp	0A7h
		jr	nz, loc_8C5
		ld	a, (byte_11AC)
		or	a
		ret	nz		; Pushing sound	not yet	finished - prevent from	playing	again
		ld	a, 80h
		ld	(byte_11AC), a	; set Pushing Flag

loc_8C5:				; CODE XREF: RAM:08B3j	RAM:08B9j
		bankswitch SoundIndex
		ld	hl,zmake68kPtr(SoundIndex)
		ld	a, c
		sub	0A0h
		add	a, a
		ld	e, a
		ld	d, 0
		add	hl, de
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	(loc_967+1), de
		ld	c, (hl)
		inc	hl
		ld	b, (hl)
		inc	hl

loc_8EF:				; CODE XREF: RAM:0972j
		push	bc
		xor	a
		ld	(loc_95E+1), a
		push	hl
		inc	hl
		ld	a, (hl)
		or	a
		jp	m, loc_901
		sub	2
		add	a, a
		jp	loc_91A
; ---------------------------------------------------------------------------

loc_901:				; CODE XREF: RAM:08F8j
		ld	(loc_95E+1), a
		cp	0C0h ; 'À'
		jr	nz, loc_914
		push	af
		or	1Fh
		ld	(7F11h), a
		xor	20h ; ' '
		ld	(7F11h), a
		pop	af

loc_914:				; CODE XREF: RAM:0906j
		rra
		rra
		rra
		rra
		and	0Fh

loc_91A:				; CODE XREF: RAM:08FEj
		add	a, 89h ; '‰'
		ld	(loc_91F+1), a

loc_91F:				; DATA XREF: RAM:091Cw
		ld	hl, (BGMChnPtrs)
		set	2, (hl)
		add	a, 10h
		ld	(loc_929+2), a

loc_929:				; DATA XREF: RAM:0926w
		ld	ix, (SFXChnPtrs)
		ld	e,ixl
		ld	d,ixh
		push	de
		ld	l, e
		ld	h, d
		ld	(hl), 0
		inc	de
		ld	bc, 29h	; ')'
		ldir
		pop	de
		pop	hl
		ldi
		ldi
		pop	bc
		push	bc
		ld	(ix+2),	c
		ld	(ix+0Bh), 1
		ld	(ix+0Ah), 2Ah ;	'*'
		ld	a, e
		add	a, 1
		ld	e, a
		adc	a, d
		sub	e
		ld	d, a
		ldi
		ldi
		ldi
		ldi

loc_95E:				; DATA XREF: RAM:08F1w	RAM:loc_901w
		ld	a, 0
		or	a
		jr	nz, loc_970
		ld	(ix+7),	0C0h ; 'À'

loc_967:				; DATA XREF: RAM:08E7w
		ld	de, 0
		ld	(ix+1Ch), e
		ld	(ix+1Dh), d

loc_970:				; CODE XREF: RAM:0961j
		pop	bc
		dec	b
		jp	nz, loc_8EF
		jp	zBankSwitchToMusic

; =============== S U B	R O U T	I N E =======================================


sub_978:				; CODE XREF: RAM:089Fj	sub_97Dp
		xor	a
		ld	(byte_1B80), a
		ret
; End of function sub_978


; =============== S U B	R O U T	I N E =======================================


sub_97D:				; CODE XREF: RAM:FadeOutMusicp
		call	sub_978
		ld	ix, unk_1D3B
		ld	b, 6

loc_986:				; CODE XREF: sub_97D+76j
		push	bc
		bit	7, (ix+0)
		jp	z, loc_9EC
		res	7, (ix+0)
		ld	a, (ix+1)
		or	a
		jp	m, loc_9BF
		push	af
		call	DoNoteOff
		pop	af
		push	ix
		sub	2
		add	a, a
		add	a, 89h
		ld	(loc_9A8+2), a

loc_9A8:				; DATA XREF: sub_97D+28w
		ld	ix, (BGMChnPtrs)
		res	2, (ix+0)
		set	1, (ix+0)
		ld	a, (ix+8)
		call	SendFMIns
		pop	ix
		jp	loc_9EC
; ---------------------------------------------------------------------------

loc_9BF:				; CODE XREF: sub_97D+19j
		push	af
		call	PSGNoteOff
		pop	af
		push	ix
		rra
		rra
		rra
		rra
		and	0Fh
		add	a, 89h ; '‰'
		ld	(loc_9D1+2), a

loc_9D1:				; DATA XREF: sub_97D+51w
		ld	ix, (BGMChnPtrs)
		res	2, (ix+0)
		set	1, (ix+0)
		ld	a, (ix+1)
		cp	0E0h ; 'à'
		jr	nz, loc_9EA
		ld	a, (ix+1Bh)
		ld	(7F11h), a

loc_9EA:				; CODE XREF: sub_97D+65j
		pop	ix

loc_9EC:				; CODE XREF: sub_97D+Ej sub_97D+3Fj
		ld	de, 2Ah	; '*'
		add	ix, de
		pop	bc
		dec	b
		djnz	loc_986
		ret
; End of function sub_97D

; ---------------------------------------------------------------------------

FadeOutMusic:				; CODE XREF: RAM:0683j
		call	sub_97D
		ld	a, 3
		ld	(byte_1B85), a
		ld	a, 28h
		ld	(byte_1B84), a
		xor	a
		ld	(byte_1B97), a	; 1B97 - Music Track DAC
		ld	(byte_1B94), a
		ret

; =============== S U B	R O U T	I N E =======================================


DoFadeOut:				; CODE XREF: RAM:005Bp
		ld	a, (byte_1B85)	; 1B85 - Fade Out Timeout Counter
		or	a
		jr	z, ApplyFadeOut	; reached 0 - apply fading
		dec	(ix+5)		; decrease else
		ret
; ---------------------------------------------------------------------------

ApplyFadeOut:				; CODE XREF: DoFadeOut+4j
		dec	(ix+4)		; decrement remaining Fade Out Steps (1B84)
		jp	z, StopAllSound
		ld	(ix+5),	3	; reset	Fade Timeout
		push	ix
		ld	ix, unk_1BC1	; 1BC1 - Music Track FM	1
		ld	b, 6

loc_A27:				; CODE XREF: DoFadeOut+38j
		bit	7, (ix+0)
		jr	z, loc_A3E
		inc	(ix+6)
		jp	p, loc_A39
		res	7, (ix+0)
		jr	loc_A3E
; ---------------------------------------------------------------------------

loc_A39:				; CODE XREF: DoFadeOut+25j
		push	bc
		call	RefreshVolume
		pop	bc

loc_A3E:				; CODE XREF: DoFadeOut+20j
					; DoFadeOut+2Cj
		ld	de, 2Ah
		add	ix, de
		djnz	loc_A27
		ld	b, 3

loc_A47:				; CODE XREF: DoFadeOut+60j
		bit	7, (ix+0)
		jr	z, loc_A66
		inc	(ix+6)
		ld	a, 10h
		cp	(ix+6)
		jp	nc, loc_A5E
		res	7, (ix+0)
		jr	loc_A66
; ---------------------------------------------------------------------------

loc_A5E:				; CODE XREF: DoFadeOut+4Aj
		push	bc
		ld	b, (ix+6)
		call	SendPSGVolume
		pop	bc

loc_A66:				; CODE XREF: DoFadeOut+40j
					; DoFadeOut+51j
		ld	de, 2Ah
		add	ix, de
		djnz	loc_A47
		pop	ix
		ret
; End of function DoFadeOut


; =============== S U B	R O U T	I N E =======================================


SilenceFM:				; CODE XREF: DoPause+Ap
					; StopAllSound+20p ...
		ld	a, 28h		; Reg 028 - Key	Off
		ld	b, 3		; loop 3 times

loc_A74:				; CODE XREF: SilenceFM+Aj
		ld	c, b
		dec	c
		rst	zWriteFMI	; write	FM 1-3 off
		set	2, c
		rst	zWriteFMI	; write	FM 4-6 off
		djnz	loc_A74
		ld	a, 30h		; start	with Reg 30
		ld	c, 0FFh		; set all values to FF
		ld	b, 60h		; loop over 60h	registers (30..8F)

loc_A82:				; CODE XREF: SilenceFM+15j
		rst	zWriteFMI	; write	Reg 0xx, Data FF
		rst	zWriteFMII	; write	Reg 1xx, Data FF
		inc	a
		djnz	loc_A82
		ret
; End of function SilenceFM


; =============== S U B	R O U T	I N E =======================================


StopAllSound:				; CODE XREF: RAM:zStartDACp RAM:065Fj ...

; FUNCTION CHUNK AT 05B1 SIZE 0000000C BYTES

		ld	a, 2Bh
		ld	c, 80h
		rst	zWriteFMI
		ld	a, c
		ld	(byte_1B95), a
		ld	a, 27h
		ld	c, 0
		rst	zWriteFMI
		ld	hl, byte_1B80
		ld	de, byte_1B81
		ld	(hl), 0
		ld	bc, 2B6h
		ldir
		ld	a, 80h
		ld	(byte_1B88), a
		call	SilenceFM
		jp	SilencePSG
; End of function StopAllSound


; =============== S U B	R O U T	I N E =======================================


sub_AAE:				; CODE XREF: RAM:loc_72Cp
		ld	ix, byte_1B80
		ld	b, (ix+0)
		ld	c, (ix+11h)
		push	bc
		ld	b, (ix+14h)
		ld	c, (ix+10h)
		push	bc
		ld	b, (ix+9)
		ld	c, (ix+0Ah)
		push	bc
		ld	hl, byte_1B80
		ld	de, byte_1B81
		ld	(hl), 0
		ld	bc, 1BAh
		ldir
		pop	bc
		ld	(ix+9),	b
		ld	(ix+0Ah), c
		pop	bc
		ld	(ix+14h), b
		ld	(ix+10h), c
		pop	bc
		ld	(ix+0),	b
		ld	(ix+11h), c
		ld	a, 80h
		ld	(byte_1B88), a
		call	SilenceFM
		jp	SilencePSG
; End of function sub_AAE


; =============== S U B	R O U T	I N E =======================================


DoTempoDelay:				; CODE XREF: RAM:0054p
		ld	a, (byte_1B82)	; load initial Tempo (1B82)
		ld	(byte_1B81), a
		ld	hl, unk_1BA2	; 1B97 (DAC Track) + 0B	(Note Timeout)
		ld	de, 2Ah
		ld	b, 0Ah		; 10 Music Tracks

loc_B02:				; CODE XREF: DoTempoDelay+10j
		inc	(hl)		; delay	by 1 frame
		add	hl, de		; next track
		djnz	loc_B02
		ret
; End of function DoTempoDelay

; ---------------------------------------------------------------------------

SpeedUpMusic:				; CODE XREF: RAM:068Bj
		ld	b, 80h
		ld	a, (byte_1B91)
		or	a
		ld	a, (byte_1B93)
		jr	z, loc_B21
		jr	loc_B2C
; ---------------------------------------------------------------------------

SlowDownMusic:				; CODE XREF: RAM:068Fj
		ld	b, 0
		ld	a, (byte_1B91)
		or	a
		ld	a, (byte_1B92)
		jr	z, loc_B21
		jr	loc_B2C
; ---------------------------------------------------------------------------

loc_B21:				; CODE XREF: RAM:0B10j	RAM:0B1Dj
		ld	(byte_1B82), a
		ld	(byte_1B81), a
		ld	a, b
		ld	(byte_1B94), a
		ret
; ---------------------------------------------------------------------------

loc_B2C:				; CODE XREF: RAM:0B12j	RAM:0B1Fj
		ld	(byte_1E39), a
		ld	(byte_1E38), a
		ld	a, b
		ld	(byte_1E4B), a
		ret

; =============== S U B	R O U T	I N E =======================================


DoFadeIn:				; CODE XREF: RAM:0062p
		ld	a, (byte_1B8F)	; 1B8F - Fade Out Timeout Counter
		or	a
		jr	z, loc_B41	; reached 0 - apply fading
		dec	(ix+0Fh)	; decrease else
		ret
; ---------------------------------------------------------------------------

loc_B41:				; CODE XREF: DoFadeIn+4j
		ld	a, (byte_1B90)	; 1B90 - remaining Fade	In Steps
		or	a
		jr	nz, ApplyFadeIn
		ld	a, (byte_1B97)
		and	0FBh		; remove 'is overridden' bit from DAC track
		ld	(byte_1B97), a
		xor	a
		ld	(byte_1B8E), a	; disable Fade In
		ret
; ---------------------------------------------------------------------------

ApplyFadeIn:				; CODE XREF: DoFadeIn+Ej
		dec	(ix+10h)	; decrement remaining Fade In Steps (1B90)
		ld	(ix+0Fh), 2	; reset	Fade Timeout
		push	ix
		ld	ix, unk_1BC1	; 1BC1 - Music Track FM	1
		ld	b, 6

loc_B63:				; CODE XREF: DoFadeIn+3Fj
		bit	7, (ix+0)
		jr	z, loc_B71
		dec	(ix+6)
		push	bc
		call	RefreshVolume
		pop	bc

loc_B71:				; CODE XREF: DoFadeIn+30j
		ld	de, 2Ah
		add	ix, de
		djnz	loc_B63
		ld	b, 3

loc_B7A:				; CODE XREF: DoFadeIn+60j
		bit	7, (ix+0)
		jr	z, loc_B92
		dec	(ix+6)
		ld	a, (ix+6)
		cp	10h
		jr	c, loc_B8C
		ld	a, 0Fh

loc_B8C:				; CODE XREF: DoFadeIn+51j
		push	bc
		ld	b, a
		call	SendPSGVolume
		pop	bc

loc_B92:				; CODE XREF: DoFadeIn+47j
		ld	de, 2Ah
		add	ix, de
		djnz	loc_B7A
		pop	ix
		ret
; End of function DoFadeIn

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR UpdateFMTrack

DoNoteOn:				; CODE XREF: UpdateFMTrack+Fj
		ld	a, (ix+0)
		and	6
		ret	nz
		ld	a, (ix+1)
		or	0F0h
		ld	c, a
		ld	a, 28h
		rst	zWriteFMI
		ret
; END OF FUNCTION CHUNK	FOR UpdateFMTrack

; =============== S U B	R O U T	I N E =======================================


DoNoteOff:				; CODE XREF: TrkUpdate_FM+17p
					; DoNoteStop+15j ...
		ld	a, (ix+0)
		and	14h
		ret	nz
		ld	a, 28h
		ld	c, (ix+1)
		rst	zWriteFMI
		ret
; End of function DoNoteOff


; ||||||||||||||| S U B R O U T I N E |||||||||||||||||||||||||||||||||||||||

; Performs a bank switch to where the music for the current track is at
; (there are two possible bank locations for music)

; SwitchMusBank:
zBankSwitchToMusic:
		ld	a,(byte_1B96)	; get Music Bank
		or	a
		jr	nz,zSwitchToBank2

		bankswitch MusicPoint1
		ret
; loc_BCF:
zSwitchToBank2:
		bankswitch MusicPoint2
		ret
; End of function zBankSwitchToMusic

; ---------------------------------------------------------------------------
; cfHandler:
zCoordFlag:
		sub	0E0h
		add	a,a			; multiply by 4, skipping past padding
		add	a,a
		ld	(coordFlagLookup+1),a	; store into the instruction after coordflagLookup (self-modifying code)
		ld	a,(hl)
		inc	hl

; This is the lookup for Coordination flag routines
; loc_BE8:
coordFlagLookup:
		jr	$
; ---------------------------------------------------------------------------
		jp	cfE0_Pan
; ---------------------------------------------------------------------------
		nop
		jp	cfE1_Detune
; ---------------------------------------------------------------------------
		nop
		jp	cfE2_SetComm
; ---------------------------------------------------------------------------
		nop
		jp	cfE3_Return
; ---------------------------------------------------------------------------
		nop
		jp	cfE4_FadeIn
; ---------------------------------------------------------------------------
		nop
		jp	cfE5_TickMult
; ---------------------------------------------------------------------------
		nop
		jp	cfE6_ChgFMVol
; ---------------------------------------------------------------------------
		nop
		jp	cfE7_Hold
; ---------------------------------------------------------------------------
		nop
		jp	cfE8_NoteStop
; ---------------------------------------------------------------------------
		nop
		jp	cfE9_ChgTransp
; ---------------------------------------------------------------------------
		nop
		jp	cfEA_SetTempo
; ---------------------------------------------------------------------------
		nop
		jp	cfEB_TickMulAll
; ---------------------------------------------------------------------------
		nop
		jp	cfEC_ChgPSGVol
; ---------------------------------------------------------------------------
		nop
		jp	cfED_ClearPush
; ---------------------------------------------------------------------------
		nop
		jp	cfEE_null
; ---------------------------------------------------------------------------
		nop
		jp	cfEF_SetIns
; ---------------------------------------------------------------------------
		nop
		jp	cfF0_ModSetup
; ---------------------------------------------------------------------------
		nop
		jp	cfF1_ModOn
; ---------------------------------------------------------------------------
		nop
		jp	cfF2_StopTrk
; ---------------------------------------------------------------------------
		nop
		jp	cfF3_PSGNoise
; ---------------------------------------------------------------------------
		nop
		jp	cfF4_ModOff
; ---------------------------------------------------------------------------
		nop
		jp	cfF5_SetPSGIns
; ---------------------------------------------------------------------------
		nop
		jp	cfF6_GoTo
; ---------------------------------------------------------------------------
		nop
		jp	cfF7_Loop
; ---------------------------------------------------------------------------
		nop
		jp	cfF8_GoSub
; ---------------------------------------------------------------------------
		nop
		jp	cfF9_FM1Mute
; ---------------------------------------------------------------------------
		nop

cfE0_Pan:				; CODE XREF: RAM:0BEAj
		bit	7, (ix+1)
		ret	m
		bit	2, (ix+0)
		ret	nz
		ld	c, a
		ld	a, (ix+7)
		and	37h
		or	c
		ld	(ix+7),	a
		ld	c, a
		ld	a, (ix+1)
		and	3
		add	a, 0B4h
		rst	zWriteFMIorII
		ret
; ---------------------------------------------------------------------------

cfE1_Detune:				; CODE XREF: RAM:0BEEj
		ld	(ix+19h), a
		ret
; ---------------------------------------------------------------------------

cfE2_SetComm:				; CODE XREF: RAM:0BF2j
		ld	(byte_1B86), a
		ret
; ---------------------------------------------------------------------------

cfE3_Return:				; CODE XREF: RAM:0BF6j
		ld	c, (ix+0Ah)
		ld	b, 0
		push	ix
		pop	hl
		add	hl, bc
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		inc	c
		inc	c
		ld	(ix+0Ah), c
		ret
; ---------------------------------------------------------------------------

cfE4_FadeIn:				; CODE XREF: RAM:0BFAj
		ld	hl, unk_1E37
		ld	de, byte_1B80
		ld	bc, 1BBh
		ldir
		call	zBankSwitchToMusic
		ld	a, (byte_1B97)
		or	4		; set 'is overridden' bit on DAC track
		ld	(byte_1B97), a
		ld	a, (byte_1B90)
		ld	c, a
		ld	a, 28h
		sub	c
		ld	c, a
		ld	b, 6
		ld	ix, unk_1BC1	; 1B97 - Music Track FM	1

loc_CAF:				; CODE XREF: RAM:0CD3j
		bit	7, (ix+0)
		jr	z, loc_CCE
		set	1, (ix+0)
		ld	a, (ix+6)
		add	a, c
		ld	(ix+6),	a
		bit	2, (ix+0)
		jr	nz, loc_CCE
		push	bc
		ld	a, (ix+8)
		call	SendFMIns
		pop	bc

loc_CCE:				; CODE XREF: RAM:0CB3j	RAM:0CC4j
		ld	de, 2Ah
		add	ix, de
		djnz	loc_CAF
		ld	b, 3

loc_CD7:				; CODE XREF: RAM:0CF0j
		bit	7, (ix+0)
		jr	z, loc_CEB
		set	1, (ix+0)
		call	PSGNoteOff
		ld	a, (ix+6)
		add	a, c
		ld	(ix+6),	a

loc_CEB:				; CODE XREF: RAM:0CDBj
		ld	de, 2Ah
		add	ix, de
		djnz	loc_CD7
		ld	a, 80h
		ld	(byte_1B8E), a
		ld	a, 28h
		ld	(byte_1B90), a
		xor	a
		ld	(byte_1B91), a
		ld	a, (byte_1B95)
		ld	c, a
		ld	a, 2Bh
		rst	zWriteFMI
		pop	bc
		pop	bc
		jp	RestoreDACBank
; ---------------------------------------------------------------------------

cfE5_TickMult:				; CODE XREF: RAM:0BFEj
		ld	(ix+2),	a
		ret
; ---------------------------------------------------------------------------

cfE6_ChgFMVol:				; CODE XREF: RAM:0C02j
		add	a, (ix+6)
		ld	(ix+6),	a
		jp	RefreshVolume
; ---------------------------------------------------------------------------

cfE7_Hold:				; CODE XREF: RAM:0C06j
		set	4, (ix+0)
		dec	hl
		ret
; ---------------------------------------------------------------------------

cfE8_NoteStop:				; CODE XREF: RAM:0C0Aj
		ld	(ix+0Fh), a
		ld	(ix+10h), a
		ret
; ---------------------------------------------------------------------------

cfE9_ChgTransp:				; CODE XREF: RAM:0C0Ej
		add	a, (ix+5)
		ld	(ix+5),	a
		ret
; ---------------------------------------------------------------------------

cfEA_SetTempo:				; CODE XREF: RAM:0C12j
		ld	(byte_1B82), a
		ld	(byte_1B81), a
		ret
; ---------------------------------------------------------------------------

cfEB_TickMulAll:			; CODE XREF: RAM:0C16j
		push	ix
		ld	ix, byte_1B97	; 1B97 - Music Tracks
		ld	de, 2Ah
		ld	b, 0Ah

loc_D3F:				; CODE XREF: RAM:0D44j
		ld	(ix+2),	a
		add	ix, de
		djnz	loc_D3F
		pop	ix
		ret
; ---------------------------------------------------------------------------

cfEC_ChgPSGVol:				; CODE XREF: RAM:0C1Aj
		add	a, (ix+6)
		ld	(ix+6),	a
		ret
; ---------------------------------------------------------------------------

cfED_ClearPush:				; CODE XREF: RAM:0C1Ej
		xor	a
		ld	(byte_11AC), a	; clear	Pushing	Flag
		dec	hl
		ret
; ---------------------------------------------------------------------------

cfEE_null:				; CODE XREF: RAM:0C22j
		dec	hl
		ret
; ---------------------------------------------------------------------------

cfEF_SetIns:				; CODE XREF: RAM:0C26j
		ld	(ix+8),	a
		ld	c, a
		bit	2, (ix+0)
		ret	nz
		push	hl
		call	GetFMInsPtr	; also does SendFMIns
		pop	hl
		ret
; ---------------------------------------------------------------------------

GetFMInsPtr:				; CODE XREF: RAM:0D62p
		ld	a, (byte_11AA)	; check	Music/SFX Mode
		or	a
		ld	a, c
		jr	z, SendFMIns	; Mode 00 (Music Mode) - jump
		ld	l, (ix+1Ch)	; load SFX track Instrument Pointer (Trk+1C/1D)
		ld	h, (ix+1Dh)
		jr	loc_D79
; ---------------------------------------------------------------------------

SendFMIns:				; CODE XREF: sub_5FA+1Bp sub_97D+3Ap ...
		ld	hl, (word_1B8C)

loc_D79:				; CODE XREF: RAM:0D74j
		push	hl
		ld	c, a
		ld	b, 0
		add	a, a
		ld	l, a
		ld	h, b
		add	hl, hl
		add	hl, hl
		ld	e, l
		ld	d, h
		add	hl, hl
		add	hl, de
		add	hl, bc
		pop	de
		add	hl, de
		ld	a, (hl)
		inc	hl
		ld	(loc_DBA+1), a
		ld	c, a
		ld	a, (ix+1)
		and	3
		add	a, 0B0h
		rst	zWriteFMIorII
		sub	80h
		ld	b, 4

loc_D9B:				; CODE XREF: RAM:0DA0j
		ld	c, (hl)
		inc	hl
		rst	zWriteFMIorII
		add	a, 4
		djnz	loc_D9B
		push	af
		add	a, 10h
		ld	b, 10h

loc_DA7:				; CODE XREF: RAM:0DACj
		ld	c, (hl)
		inc	hl
		rst	zWriteFMIorII
		add	a, 4
		djnz	loc_DA7
		add	a, 24h
		ld	c, (ix+7)
		rst	zWriteFMIorII
		ld	(ix+1Eh), l
		ld	(ix+1Fh), h

loc_DBA:				; DATA XREF: RAM:0D8Bw
		ld	a, 0
		and	7
		add	a, 0DFh		; lower	byte of	0DDF
		ld	e, a
		ld	d, 0Dh		; higher byte of 0DDF
		ld	a, (de)
		ld	(ix+1Ah), a
		ld	e, a
		ld	d, (ix+6)
		pop	af

; =============== S U B	R O U T	I N E =======================================


SendFMVolume:				; CODE XREF: RefreshVolume+21p
		ld	b, 4

loc_DCE:				; CODE XREF: SendFMVolume+10j
		ld	c, (hl)
		inc	hl
		rr	e
		jr	nc, loc_DD9
		push	af
		ld	a, d
		add	a, c
		ld	c, a
		pop	af

loc_DD9:				; CODE XREF: SendFMVolume+6j
		rst	zWriteFMIorII
		add	a, 4
		djnz	loc_DCE
		ret
; End of function SendFMVolume

; ---------------------------------------------------------------------------
FMAlgo_OpMask:	db    8,   8,	8,   8,	0Ch, 0Eh, 0Eh, 0Fh

; =============== S U B	R O U T	I N E =======================================


RefreshVolume:				; CODE XREF: DoFadeOut+2Fp
					; DoFadeIn+36p	...
		bit	7, (ix+1)
		ret	nz
		bit	2, (ix+0)
		ret	nz
		ld	e, (ix+1Ah)
		ld	a, (ix+1)
		and	3
		add	a, 40h
		ld	d, (ix+6)
		bit	7, d
		ret	nz
		push	hl
		ld	l, (ix+1Eh)
		ld	h, (ix+1Fh)
		call	SendFMVolume
		pop	hl
		ret
; End of function RefreshVolume

; ---------------------------------------------------------------------------

cfF0_ModSetup:				; CODE XREF: RAM:0C2Aj
		set	3, (ix+0)
		dec	hl
		ld	(ix+11h), l
		ld	(ix+12h), h
; START	OF FUNCTION CHUNK FOR TrkUpdate_FM

loc_E18:				; CODE XREF: TrkUpdate_FM+89j
		ld	a,ixl
		add	a, 13h
		ld	e, a
		adc	a,ixh
		sub	e
		ld	d, a
		ldi
		ldi
		ldi
		ld	a, (hl)
		inc	hl
		srl	a
		ld	(ix+16h), a
		xor	a
		ld	(ix+17h), a
		ld	(ix+18h), a
		ret
; END OF FUNCTION CHUNK	FOR TrkUpdate_FM
; ---------------------------------------------------------------------------

cfF1_ModOn:				; CODE XREF: RAM:0C2Ej
		dec	hl
		set	3, (ix+0)
		ret
; ---------------------------------------------------------------------------

cfF2_StopTrk:				; CODE XREF: RAM:0C32j
		res	7, (ix+0)
		res	4, (ix+0)
		bit	7, (ix+1)
		jr	nz, loc_E56
		ld	a, (byte_1B87)
		or	a
		jp	m, loc_ECE
		call	DoNoteOff
		jr	loc_E59
; ---------------------------------------------------------------------------

loc_E56:				; CODE XREF: RAM:0E48j
		call	PSGNoteOff

loc_E59:				; CODE XREF: RAM:0E54j
		ld	a, (byte_11AA)	; check	Music/SFX Mode
		or	a
		jp	p, loc_ECD
		xor	a
		ld	(byte_1B80), a
		ld	a, (ix+1)
		or	a
		jp	m, loc_EA5
		push	ix
		sub	2
		add	a, a
		add	a, 89h ; '‰'
		ld	(loc_E75+2), a

loc_E75:				; DATA XREF: RAM:0E72w
		ld	ix, (BGMChnPtrs)
		bit	2, (ix+0)
		jp	z, loc_EA0
		call	zBankSwitchToMusic
		res	2, (ix+0)
		set	1, (ix+0)
		ld	a, (ix+8)
		call	SendFMIns
		bankswitch SoundIndex

loc_EA0:				; CODE XREF: RAM:0E7Dj
		pop	ix
		pop	bc
		pop	bc
		ret
; ---------------------------------------------------------------------------

loc_EA5:				; CODE XREF: RAM:0E68j
		push	ix
		rra
		rra
		rra
		rra
		and	0Fh
		add	a, 89h
		ld	(loc_EB2+2), a

loc_EB2:				; DATA XREF: RAM:0EAFw
		ld	ix, (BGMChnPtrs)
		res	2, (ix+0)
		set	1, (ix+0)
		ld	a, (ix+1)
		cp	0E0h ; 'à'
		jr	nz, loc_ECB
		ld	a, (ix+1Bh)
		ld	(7F11h), a

loc_ECB:				; CODE XREF: RAM:0EC3j
		pop	ix

loc_ECD:				; CODE XREF: RAM:0E5Dj
		pop	bc

loc_ECE:				; CODE XREF: RAM:0E4Ej
		pop	bc
		ret
; ---------------------------------------------------------------------------

cfF3_PSGNoise:				; CODE XREF: RAM:0C36j
		ld	(ix+1),	0E0h
		ld	(ix+1Bh), a
		bit	2, (ix+0)
		ret	nz
		ld	(7F11h), a
		ret
; ---------------------------------------------------------------------------

cfF4_ModOff:				; CODE XREF: RAM:0C3Aj
		dec	hl
		res	3, (ix+0)
		ret
; ---------------------------------------------------------------------------

cfF5_SetPSGIns:				; CODE XREF: RAM:0C3Ej
		ld	(ix+8),	a
		ret
; ---------------------------------------------------------------------------

cfF6_GoTo:				; CODE XREF: RAM:0C42j
		ld	h, (hl)
		ld	l, a
		ret
; ---------------------------------------------------------------------------

cfF7_Loop:				; CODE XREF: RAM:0C46j
		ld	c, (hl)
		inc	hl
		push	hl
		add	a, 20h
		ld	l, a
		ld	h, 0
		ld	e,ixl
		ld	d,ixh
		add	hl, de
		ld	a, (hl)
		or	a
		jr	nz, loc_EFF
		ld	(hl), c

loc_EFF:				; CODE XREF: RAM:0EFCj
		dec	(hl)
		pop	hl
		jr	z, loc_F08
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		ret
; ---------------------------------------------------------------------------

loc_F08:				; CODE XREF: RAM:0F01j
		inc	hl
		inc	hl
		ret
; ---------------------------------------------------------------------------

cfF8_GoSub:				; CODE XREF: RAM:0C4Aj
		ld	c, a
		ld	a, (ix+0Ah)
		sub	2
		ld	(ix+0Ah), a
		ld	b, (hl)
		inc	hl
		ex	de, hl
		add	a,ixl
		ld	l, a
		adc	a,ixh
		sub	l
		ld	h, a
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	h, b
		ld	l, c
		ret
; ---------------------------------------------------------------------------

cfF9_FM1Mute:				; CODE XREF: RAM:0C4Ej
		ld	a, 88h
		ld	c, 0Fh
		rst	zWriteFMI
		ld	a, 8Ch
		ld	c, 0Fh
		rst	zWriteFMI
		dec	hl
		ret
; ---------------------------------------------------------------------------
SndPriorities:	db 80h,	70h, 70h, 70h, 70h, 70h, 70h, 70h, 70h,	70h, 68h
		db 70h,	70h, 70h, 60h, 70h, 70h, 60h, 70h, 60h,	70h, 70h
		db 70h,	70h, 70h, 70h, 70h, 70h, 70h, 70h, 70h,	7Fh, 60h
		db 70h,	70h, 70h, 70h, 70h, 70h, 70h, 70h, 70h,	70h, 70h
		db 70h,	70h, 70h, 70h, 80h, 80h, 80h, 80h, 80h,	80h, 80h
		db 80h,	80h, 80h, 80h, 80h, 80h, 80h, 80h, 80h,	90h, 90h
		db 90h,	90h, 90h
word_F75:	dw	zmake68kPtr(DAC_Sample01)
		dw	DAC_Sample01_End-DAC_Sample01
		dw	zmake68kPtr(DAC_Sample02)
		dw	DAC_Sample02_End-DAC_Sample02
		dw	zmake68kPtr(DAC_Sample03)
		dw	DAC_Sample03_End-DAC_Sample03
		dw	zmake68kPtr(DAC_Sample04)
		dw	DAC_Sample04_End-DAC_Sample04
		dw	zmake68kPtr(DAC_Sample05)
		dw	DAC_Sample05_End-DAC_Sample05
		dw	zmake68kPtr(DAC_Sample06)
		dw	DAC_Sample06_End-DAC_Sample06
byte_F8D:	db  81h, 17h		; DATA XREF: RAM:loc_1F1r
		db  82h,   1
		db  83h, 17h
		db  84h,   4
		db  85h, 1Bh
		db  86h, 0Ah
		db    0,   0
		db  85h, 12h
		db  85h, 15h
		db  85h, 1Ch
		db  85h, 1Dh
		db  86h, 0Ah
		db  86h, 0Eh
		db  86h, 13h
VolEnvPtrs:	dw byte_FC3, byte_FDA, byte_FE1, byte_FF2, byte_100C, byte_FFD
					; DATA XREF: DoVolEnv+Eo
		dw byte_1036, byte_1052, byte_107A, byte_108B, byte_10C9
		dw byte_10E5, byte_1165
byte_FC3:	db 0, 0, 0, 1, 1, 1, 2,	2, 2, 3, 3, 3, 4, 4, 4,	5, 5, 5
					; DATA XREF: RAM:VolEnvPtrso
		db 6, 6, 6, 7, 80h
byte_FDA:	db 0, 2, 4, 6, 8, 10h, 80h ; DATA XREF:	RAM:VolEnvPtrso
byte_FE1:	db 0, 0, 1, 1, 2, 2, 3,	3, 4, 4, 5, 5, 6, 6, 7,	7, 80h
					; DATA XREF: RAM:VolEnvPtrso
byte_FF2:	db 0, 0, 2, 3, 4, 4, 5,	5, 5, 6, 80h ; DATA XREF: RAM:VolEnvPtrso
byte_FFD:	db 3, 3, 3, 2, 2, 2, 2,	1, 1, 1, 0, 0, 0, 0, 80h
					; DATA XREF: RAM:VolEnvPtrso
byte_100C:	db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 1, 1, 1, 1, 1,	1, 1, 1
					; DATA XREF: RAM:VolEnvPtrso
		db 1, 1, 1, 1, 1, 1, 2,	2, 2, 2, 2, 2, 2, 2, 3,	3, 3, 3
		db 3, 3, 3, 3, 4, 80h
byte_1036:	db 0, 0, 0, 0, 0, 0, 1,	1, 1, 1, 1, 2, 2, 2, 2,	2, 3, 3
					; DATA XREF: RAM:VolEnvPtrso
		db 3, 4, 4, 4, 5, 5, 5,	6, 7, 80h
byte_1052:	db 0, 0, 0, 0, 0, 1, 1,	1, 1, 1, 2, 2, 2, 2, 2,	2, 3, 3
					; DATA XREF: RAM:VolEnvPtrso
		db 3, 3, 3, 4, 4, 4, 4,	4, 5, 5, 5, 5, 5, 6, 6,	6, 6, 6
		db 7, 7, 7, 80h
byte_107A:	db 0, 1, 2, 3, 4, 5, 6,	7, 8, 9, 0Ah, 0Bh, 0Ch,	0Dh, 0Eh
					; DATA XREF: RAM:VolEnvPtrso
		db 0Fh,	80h
byte_108B:	db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 1, 1, 1, 1, 1,	1, 1, 1
					; DATA XREF: RAM:VolEnvPtrso
		db 1, 1, 1, 1, 1, 1, 1,	1, 1, 1, 1, 1, 1, 1, 1,	1, 1, 1
		db 1, 1, 1, 1, 2, 2, 2,	2, 2, 2, 2, 2, 2, 2, 3,	3, 3, 3
		db 3, 3, 3, 3, 3, 3, 4,	80h
byte_10C9:	db 4, 4, 4, 3, 3, 3, 2,	2, 2, 1, 1, 1, 1, 1, 1,	1, 2, 2
					; DATA XREF: RAM:VolEnvPtrso
		db 2, 2, 2, 3, 3, 3, 3,	3, 4, 80h
byte_10E5:	db 4, 4, 3, 3, 2, 2, 1,	1, 1, 1, 1, 1, 1, 1, 1,	1, 1, 1
					; DATA XREF: RAM:VolEnvPtrso
		db 1, 1, 1, 1, 1, 1, 1,	1, 2, 2, 2, 2, 2, 2, 2,	2, 2, 2
		db 2, 2, 2, 2, 2, 2, 2,	2, 2, 2, 3, 3, 3, 3, 3,	3, 3, 3
		db 3, 3, 3, 3, 3, 3, 3,	3, 3, 3, 3, 3, 4, 4, 4,	4, 4, 4
		db 4, 4, 4, 4, 4, 4, 4,	4, 4, 4, 4, 4, 4, 4, 5,	5, 5, 5
		db 5, 5, 5, 5, 5, 5, 5,	5, 5, 5, 5, 5, 5, 5, 5,	5, 6, 6
		db 6, 6, 6, 6, 6, 6, 6,	6, 6, 6, 6, 6, 6, 6, 6,	6, 6, 6
		db 7, 80h
byte_1165:	db 0, 1, 3, 80h		; DATA XREF: RAM:VolEnvPtrso

; zbyte_116A:
zMasterPlaylist:

; Music IDs
offset :=	MusicPoint2
ptrsize :=	2
idstart :=	80h

zMusIDPtr_OOZ:		db	id(MusPtr_OOZ)
zMusIDPtr_GHZ:		db	id(MusPtr_GHZ)
zMusIDPtr_MTZ:		db	id(MusPtr_MTZ)
zMusIDPtr_CNZ:		db	id(MusPtr_CNZ)
zMusIDPtr_DHZ:		db	id(MusPtr_DHZ)
zMusIDPtr_HPZ:		db	id(MusPtr_HPZ)
zMusIDPtr_NGHZ:		db	id(MusPtr_NGHZ)
zMusIDPtr_DEZ:		db	id(MusPtr_DEZ)
zMusIDPtr_SpecStg:	db	id(MusPtr_SpecStg)
zMusIDPtr_LevelSel:	db	id(MusPtr_LevelSel)
zMusIDPtr_LevelSelDup:	db	id(MusPtr_LevelSelDup)
zMusIDPtr_FinalBoss:	db	id(MusPtr_FinalBoss)
zMusIDPtr_CPZ:		db	id(MusPtr_CPZ)
zMusIDPtr_Boss:		db	id(MusPtr_Boss)
zMusIDPtr_RWZ:		db	id(MusPtr_RWZ)
zMusIDPtr_SSZ:		db	id(MusPtr_SSZ)
zMusIDPtr_SSZDup:	db	id(MusPtr_SSZ)
zMusIDPtr_Unused1:	db	id(MusPtr_Unused1)
zMusIDPtr_BOZ:		db	id(MusPtr_BOZ)
zMusIDPtr_Unused2:	db	id(MusPtr_Unused2)
zMusIDPtr_Invinc:	db	id(MusPtr_Invinc)
zMusIDPtr_HTZ:		db	id(MusPtr_HTZ)
zMusIDPtr_HTZDup:	db	id(MusPtr_HTZ)
zMusIDPtr_ExtraLife:	db	(MusPtr_ExtraLife-MusicPoint1)/ptrsize
zMusIDPtr_Title:	db	(MusPtr_Title-MusicPoint1)/ptrsize
zMusIDPtr_ActClear:	db	(MusPtr_ActClear-MusicPoint1)/ptrsize
zMusIDPtr_GameOver:	db	(MusPtr_GameOver-MusicPoint1)/ptrsize
zMusIDPtr_Continue:	db	(MusPtr_Continue-MusicPoint1)/ptrsize
zMusIDPtr_Emerald:	db	(MusPtr_Emerald-MusicPoint1)/ptrsize
zMusIDPtr_EmeraldDup:	db	(MusPtr_Emerald-MusicPoint1)/ptrsize
zMusIDPtr_EmeraldDup2:	db	(MusPtr_Emerald-MusicPoint1)/ptrsize
zMusIDPtr__End:

SpeedUpTempoLst:db  07h, 72h, 73h, 26h,	15h, 08h,0FFh, 05h, 20h, 20h, 20h
					; DATA XREF: RAM:0737o
		db  20h, 20h, 20h, 20h,	20h, 20h, 20h, 20h, 20h, 20h, 20h
		db  20h, 20h, 20h, 20h,	20h, 20h, 20h, 20h, 20h, 20h
byte_11A8:	db 0			; DATA XREF: RAM:00F8r	RAM:0108r ...
byte_11A9:	db 0			; DATA XREF: RAM:PlayMusicw RAM:072Fr
byte_11AA:	db 0			; DATA XREF: RAM:003Ew	RAM:00C2w ...
byte_11AB:	db 0			; DATA XREF: RAM:08A7r	RAM:08B0w
byte_11AC:	db 0			; DATA XREF: RAM:08BBr	RAM:08C2w ...
; end of 'RAM'