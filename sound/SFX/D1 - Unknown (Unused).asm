sndD1_Header:
	smpsHeaderStartSong 2
	smpsHeaderVoice     sndD1_Voices
	smpsHeaderTempoSFX  $01
	smpsHeaderChanSFX   $01

	smpsHeaderSFXChannel cFM5, sndD1_FM5,	$00, $01

; FM5 Data
sndD1_FM5:
	smpsSetvoice        $00
	dc.b	nC0, $05
	smpsStop

sndD1_Voices:
;	Voice $00
;	$35
;	$02, $00, $01, $04, 	$1F, $1F, $1F, $1F, 	$00, $12, $19, $14
;	$00, $0C, $00, $0F, 	$0F, $EF, $FF, $FF, 	$00, $00, $00, $80
	smpsVcAlgorithm     $05
	smpsVcFeedback      $06
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $04, $01, $00, $02
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $14, $19, $12, $00
	smpsVcDecayRate2    $0F, $00, $0C, $00
	smpsVcDecayLevel    $0F, $0F, $0E, $00
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $00, $00, $00

