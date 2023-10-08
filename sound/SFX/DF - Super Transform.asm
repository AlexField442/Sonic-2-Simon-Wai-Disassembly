sndDF_Header:
	smpsHeaderStartSong 2
	smpsHeaderVoice     sndDF_Voices
	smpsHeaderTempoSFX  $01
	smpsHeaderChanSFX   $02

	smpsHeaderSFXChannel cFM5, sndDF_FM5,	$15, $00
	smpsHeaderSFXChannel cFM3, sndDF_FM3,	$F4, $05

; FM5 Data
sndDF_FM5:
	smpsSetvoice        $00
	smpsModSet          $01, $01, $19, $31

sndDF_Loop01:
	dc.b	nE2, $3A
	smpsAlterVol        $05
	smpsLoop            $00, $02, sndDF_Loop01
	smpsStop

; FM3 Data
sndDF_FM3:
	smpsSetvoice        $00
	smpsModSet          $01, $01, $19, $31

sndDF_Loop00:
	dc.b	nE2, $3A
	smpsAlterVol        $05
	smpsLoop            $00, $02, sndDF_Loop00
	smpsStop

sndDF_Voices:
;	Voice $00
;	$30
;	$30, $30, $30, $3C, 	$9E, $A8, $AC, $DF, 	$0E, $0A, $04, $00
;	$08, $08, $08, $08, 	$BF, $BF, $BF, $BF, 	$04, $2C, $14, $80
	smpsVcAlgorithm     $00
	smpsVcFeedback      $06
	smpsVcUnusedBits    $00
	smpsVcDetune        $03, $03, $03, $03
	smpsVcCoarseFreq    $0C, $00, $00, $00
	smpsVcRateScale     $03, $02, $02, $02
	smpsVcAttackRate    $1F, $2C, $28, $1E
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $04, $0A, $0E
	smpsVcDecayRate2    $08, $08, $08, $08
	smpsVcDecayLevel    $0B, $0B, $0B, $0B
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $14, $2C, $04

