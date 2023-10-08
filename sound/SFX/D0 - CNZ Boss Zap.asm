sndD0_Header:
	smpsHeaderStartSong 2
	smpsHeaderVoice     sndD0_Voices
	smpsHeaderTempoSFX  $01
	smpsHeaderChanSFX   $01

	smpsHeaderSFXChannel cFM5, sndD0_FM5,	$00, $00

; FM5 Data
sndD0_FM5:
	smpsSetvoice        $00
	dc.b	nE2, $05, nE2, $02, nAb3, $05, nE2, $02, nAb3, $05, nE2, $02
	dc.b	nAb3, $05
	smpsStop

sndD0_Voices:
;	Voice $00
;	$3B
;	$70, $70, $53, $51, 	$0F, $0F, $0F, $0F, 	$0F, $00, $0F, $0F
;	$00, $00, $00, $00, 	$0F, $0F, $0F, $0F, 	$0E, $0C, $2F, $80
	smpsVcAlgorithm     $03
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $05, $05, $07, $07
	smpsVcCoarseFreq    $01, $03, $00, $00
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $0F, $0F, $0F, $0F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $0F, $0F, $00, $0F
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $00, $00, $00, $00
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $2F, $0C, $0E