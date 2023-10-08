sndD3_Header:
	smpsHeaderStartSong 2
	smpsHeaderVoice     sndD3_Voices
	smpsHeaderTempoSFX  $01
	smpsHeaderChanSFX   $01

	smpsHeaderSFXChannel cFM5, sndD3_FM5,	$00, $00

; FM5 Data
sndD3_FM5:
	smpsSetvoice        $00
	smpsModSet          $01, $02, $3F, $04
	dc.b	nA1, $3A
	smpsStop

sndD3_Voices:
;	Voice $00
;	$05
;	$07, $0F, $30, $0A, 	$30, $1F, $1F, $1F, 	$03, $03, $03, $03
;	$1F, $0F, $0F, $0F, 	$AF, $AF, $AF, $AF, 	$4D, $80, $80, $80
	smpsVcAlgorithm     $05
	smpsVcFeedback      $00
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $03, $00, $00
	smpsVcCoarseFreq    $0A, $00, $0F, $07
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $30
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $03, $03, $03, $03
	smpsVcDecayRate2    $0F, $0F, $0F, $1F
	smpsVcDecayLevel    $0A, $0A, $0A, $0A
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $00, $00, $4D

