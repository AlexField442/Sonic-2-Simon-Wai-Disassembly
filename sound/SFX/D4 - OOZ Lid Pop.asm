sndD4_Header:
	smpsHeaderStartSong 2
	smpsHeaderVoice     sndD4_Voices
	smpsHeaderTempoSFX  $01
	smpsHeaderChanSFX   $02

	smpsHeaderSFXChannel cFM4, sndD4_FM4,	$00, $00
	smpsHeaderSFXChannel cFM5, sndD4_FM5,	$00, $00

; FM4 Data
sndD4_FM4:
	smpsSetvoice        $00
	smpsModSet          $01, $01, $E7, $01
	dc.b	nFs1, $17
	smpsStop

; FM5 Data
sndD4_FM5:
	smpsSetvoice        $00
	smpsAlterNote       $02
	smpsModSet          $01, $01, $E7, $01
	dc.b	nFs1, $17
	smpsStop

sndD4_Voices:
;	Voice $00
;	$3E
;	$20, $0F, $0E, $0F, 	$1F, $1F, $1F, $1F, 	$1F, $1F, $1F, $1F
;	$0F, $0F, $0E, $0E, 	$0F, $0F, $0F, $0F, 	$8E, $80, $80, $80
	smpsVcAlgorithm     $06
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $02
	smpsVcCoarseFreq    $0F, $0E, $0F, $00
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $1F, $1F, $1F, $1F
	smpsVcDecayRate2    $0E, $0E, $0F, $0F
	smpsVcDecayLevel    $00, $00, $00, $00
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $00, $00, $8E

