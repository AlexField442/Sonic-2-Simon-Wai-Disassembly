sndE0_Header:
	smpsHeaderStartSong 2
	smpsHeaderVoice     sndE0_Voices
	smpsHeaderTempoSFX  $01
	smpsHeaderChanSFX   $03

	smpsHeaderSFXChannel cFM5, sndE0_FM5,	$00, $00
	smpsHeaderSFXChannel cFM3, sndE0_FM3,	$F7, $00
	smpsHeaderSFXChannel cPSG3, sndE0_PSG3,	$00, $00

; FM5 Data
sndE0_FM5:
	smpsSetvoice        $00
	smpsModSet          $01, $01, $19, $F6
	dc.b	nG5, $25
	smpsModSet          $01, $01, $00, $00
	dc.b	smpsNoAttack
	smpsAlterVol        $0F
	dc.b	nG6, $0F

sndE0_Loop01:
	dc.b	smpsNoAttack, $03
	smpsAlterVol        $02
	smpsLoop            $00, $13, sndE0_Loop01
	smpsStop

; FM3 Data
sndE0_FM3:
	smpsSetvoice        $00
	smpsModSet          $01, $01, $19, $F6
	dc.b	nC7, $25
	smpsModSet          $01, $01, $00, $00
	dc.b	smpsNoAttack
	smpsAlterVol        $0F
	dc.b	nFs7, $0F

sndE0_Loop00:
	dc.b	smpsNoAttack, $03
	smpsAlterVol        $02
	smpsLoop            $00, $13, sndE0_Loop00
	smpsStop

; PSG3 Data
sndE0_PSG3:
	smpsPSGvoice        fTone_01
	smpsPSGform         $E7
	smpsModSet          $01, $01, $01, $01
	dc.b	nG3, $24
	smpsStop

sndE0_Voices:
;	Voice $00
;	$34
;	$00, $0C, $03, $09, 	$9F, $AF, $AC, $D5, 	$06, $02, $00, $00
;	$02, $04, $0A, $08, 	$BF, $BF, $BF, $BF, 	$00, $00, $1C, $80
	smpsVcAlgorithm     $04
	smpsVcFeedback      $06
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $09, $03, $0C, $00
	smpsVcRateScale     $03, $02, $02, $02
	smpsVcAttackRate    $15, $2C, $2F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $00, $02, $06
	smpsVcDecayRate2    $08, $0A, $04, $02
	smpsVcDecayLevel    $0B, $0B, $0B, $0B
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $1C, $00, $00

