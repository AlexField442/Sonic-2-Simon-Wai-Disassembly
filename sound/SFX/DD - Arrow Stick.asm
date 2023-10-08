sndDD_Header:
	smpsHeaderStartSong 2
	smpsHeaderVoice     sndDD_Voices
	smpsHeaderTempoSFX  $01
	smpsHeaderChanSFX   $01

	smpsHeaderSFXChannel cFM5, sndDD_FM5,	$00, $00

; FM5 Data
sndDD_FM5:
	smpsSetvoice        $00
	dc.b	nBb4, $05, nBb4, $05
	smpsStop

sndDD_Voices:
;	Voice $00
;	$3E
;	$20, $1F, $3F, $BF, 	$1F, $1F, $1F, $1F, 	$1F, $1F, $1F, $1F
;	$0F, $0F, $0F, $0F, 	$0F, $0F, $0F, $0F, 	$8C, $80, $80, $80
	smpsVcAlgorithm     $06
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $0B, $03, $01, $02
	smpsVcCoarseFreq    $0F, $0F, $0F, $00
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $1F, $1F, $1F, $1F
	smpsVcDecayRate2    $0F, $0F, $0F, $0F
	smpsVcDecayLevel    $00, $00, $00, $00
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $00, $00, $8C

