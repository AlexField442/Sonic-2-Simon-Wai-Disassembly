sndD7_Header:
	smpsHeaderStartSong 2
	smpsHeaderVoice     sndD7_Voices
	smpsHeaderTempoSFX  $01
	smpsHeaderChanSFX   $01

	smpsHeaderSFXChannel cFM5, sndD7_FM5,	$00, $06

; FM5 Data
sndD7_FM5:
	smpsSetvoice        $00
	smpsModSet          $01, $01, $07, $01
	dc.b	nC2, $1B
	smpsStop

sndD7_Voices:
;	Voice $00
;	$3E
;	$20, $1F, $0F, $0F, 	$1F, $1F, $1F, $1F, 	$1F, $1F, $1F, $1F
;	$0F, $0F, $0E, $0E, 	$0F, $0F, $0F, $0F, 	$8C, $80, $80, $80
	smpsVcAlgorithm     $06
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $01, $02
	smpsVcCoarseFreq    $0F, $0F, $0F, $00
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $1F, $1F, $1F, $1F
	smpsVcDecayRate2    $0E, $0E, $0F, $0F
	smpsVcDecayLevel    $00, $00, $00, $00
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $00, $00, $8C

