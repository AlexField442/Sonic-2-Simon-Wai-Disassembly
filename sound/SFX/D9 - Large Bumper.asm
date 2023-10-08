sndD9_Header:
	smpsHeaderStartSong 2
	smpsHeaderVoice     sndD9_Voices
	smpsHeaderTempoSFX  $01
	smpsHeaderChanSFX   $03

	smpsHeaderSFXChannel cPSG1, sndD9_PSG1,	$EC, $00
	smpsHeaderSFXChannel cPSG2, sndD9_PSG2,	$EA, $00
	smpsHeaderSFXChannel cFM5, sndD9_FM5,	$00, $00

; PSG1 Data
sndD9_PSG1:
; PSG2 Data
sndD9_PSG2:
	smpsModSet          $01, $01, $81, $45

sndD9_Loop01:
	dc.b	nEb2, $05
	smpsPSGAlterVol     $02
	smpsLoop            $00, $02, sndD9_Loop01
	smpsStop

; FM5 Data
sndD9_FM5:
	smpsSetvoice        $00
	smpsModSet          $01, $01, $0C, $01

sndD9_Loop00:
	dc.b	nF1, $07
	smpsAlterVol        $0A
	smpsLoop            $00, $03, sndD9_Loop00
	smpsStop

sndD9_Voices:
;	Voice $00
;	$43
;	$01, $01, $01, $01, 	$5F, $5F, $5F, $5F, 	$0E, $11, $11, $11
;	$09, $0A, $06, $0A, 	$4F, $3F, $3F, $3F, 	$17, $80, $20, $80
	smpsVcAlgorithm     $03
	smpsVcFeedback      $00
	smpsVcUnusedBits    $01
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $01, $01, $01, $01
	smpsVcRateScale     $01, $01, $01, $01
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $11, $11, $11, $0E
	smpsVcDecayRate2    $0A, $06, $0A, $09
	smpsVcDecayLevel    $03, $03, $03, $04
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $20, $80, $17

