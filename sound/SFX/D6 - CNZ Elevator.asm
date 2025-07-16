sndD6_Header:
	smpsHeaderStartSong 2, 1
	smpsHeaderVoice     sndD6_Voices
	smpsHeaderTempoSFX  $01
	smpsHeaderChanSFX   $02

	smpsHeaderSFXChannel cFM4, sndD6_FM4,	$00, $08
	smpsHeaderSFXChannel cFM5, sndD6_FM5,	$0C, $08

; FM4 Data
sndD6_FM4:
; FM5 Data
sndD6_FM5:
	smpsSetvoice        $00
	smpsModSet          $01, $01, $12, $FF
	dc.b	nD1, $45
	smpsModSet          $00, $00, $00, $00
	dc.b	smpsNoAttack
	smpsAlterVol        $03
	dc.b	nG2, $01

sndD6_Loop00:
	smpsAlterVol        $02
	dc.b	smpsNoAttack, $0A
	smpsLoop            $00, $07, sndD6_Loop00
	smpsStop

sndD6_Voices:
;	Voice $00
;	$34
;	$01, $0E, $0B, $09, 	$9F, $AF, $AF, $CF, 	$02, $02, $00, $00
;	$07, $04, $0A, $05, 	$BF, $BF, $BF, $BF, 	$50, $00, $1C, $80
	smpsVcAlgorithm     $04
	smpsVcFeedback      $06
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $09, $0B, $0E, $01
	smpsVcRateScale     $03, $02, $02, $02
	smpsVcAttackRate    $0F, $2F, $2F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $00, $02, $02
	smpsVcDecayRate2    $05, $0A, $04, $07
	smpsVcDecayLevel    $0B, $0B, $0B, $0B
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $80, $1C, $00, $50

