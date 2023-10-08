sndD2_Header:
	smpsHeaderStartSong 2
	smpsHeaderVoice     sndD2_Voices
	smpsHeaderTempoSFX  $01
	smpsHeaderChanSFX   $01

	smpsHeaderSFXChannel cFM5, sndD2_FM5,	$00, $00

; FM5 Data
sndD2_FM5:
	smpsSetvoice        $00
	smpsModSet          $01, $01, $2D, $21
	dc.b	nC0, $26, nC0, $26, nC0, $26
	smpsStop

sndD2_Voices:
;	Voice $00
;	$0E
;	$05, $04, $06, $0F, 	$1F, $1F, $1F, $1F, 	$1F, $1F, $1F, $1F
;	$05, $05, $08, $05, 	$0F, $0F, $0F, $0F, 	$51, $44, $82, $97
	smpsVcAlgorithm     $06
	smpsVcFeedback      $01
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $0F, $06, $04, $05
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $1F, $1F, $1F, $1F
	smpsVcDecayRate2    $05, $08, $05, $05
	smpsVcDecayLevel    $00, $00, $00, $00
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $17, $02, $44, $51

