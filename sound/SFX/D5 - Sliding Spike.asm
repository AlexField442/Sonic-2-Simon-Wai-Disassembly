sndD5_Header:
	smpsHeaderStartSong 2
	smpsHeaderVoice     sndD5_Voices
	smpsHeaderTempoSFX  $01
	smpsHeaderChanSFX   $01

	smpsHeaderSFXChannel cFM5, sndD5_FM5,	$00, $00

; FM5 Data
sndD5_FM5:
	smpsSetvoice        $00
	smpsModSet          $01, $01, $02, $02
	dc.b	nC4, $15
	smpsStop

sndD5_Voices:
;	Voice $00
;	$35
;	$29, $08, $09, $0F, 	$1A, $10, $1F, $1F, 	$0F, $1F, $1F, $1F
;	$0C, $0E, $0D, $0E, 	$0F, $0F, $0F, $0F, 	$80, $80, $80, $80
	smpsVcAlgorithm     $05
	smpsVcFeedback      $06
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $02
	smpsVcCoarseFreq    $0F, $09, $08, $09
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $10, $1A
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $1F, $1F, $1F, $0F
	smpsVcDecayRate2    $0E, $0D, $0E, $0C
	smpsVcDecayLevel    $00, $00, $00, $00
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $00, $00, $80

