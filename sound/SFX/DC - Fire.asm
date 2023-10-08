sndDC_Header:
	smpsHeaderStartSong 2
	smpsHeaderVoice     sndDC_Voices
	smpsHeaderTempoSFX  $01
	smpsHeaderChanSFX   $03

	smpsHeaderSFXChannel cFM4, sndDC_FM4,	$00, $00
	smpsHeaderSFXChannel cFM5, sndDC_FM5,	$00, $00
	smpsHeaderSFXChannel cPSG3, sndDC_PSG3,	$00, $00

; FM4 Data
sndDC_FM4:
	smpsSetvoice        $00
	dc.b	nC1, $06, nC1, $30
	smpsStop

; FM5 Data
sndDC_FM5:
	dc.b	nRst, $0C
	smpsSetvoice        $00
	dc.b	nC1, $06, nC1, $30
	smpsStop

; PSG3 Data
sndDC_PSG3:
	smpsPSGvoice        $00
	smpsPSGform         $E7
	smpsModSet          $01, $01, $01, $01
	dc.b	nC2, $0F
	smpsModSet          $01, $01, $05, $05
	dc.b	nAb1, $1F, smpsNoAttack, $12

sndDC_Loop00:
	smpsPSGAlterVol     $01
	dc.b	smpsNoAttack, $0F
	smpsLoop            $00, $1F, sndDC_Loop00
	smpsStop

sndDC_Voices:
;	Voice $00
;	$38
;	$71, $00, $00, $60, 	$0A, $0F, $0A, $0F, 	$00, $00, $00, $12
;	$00, $07, $09, $0B, 	$0F, $0F, $0F, $0F, 	$11, $0E, $04, $80
	smpsVcAlgorithm     $00
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $06, $00, $00, $07
	smpsVcCoarseFreq    $00, $00, $00, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $0F, $0A, $0F, $0A
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $12, $00, $00, $00
	smpsVcDecayRate2    $0B, $09, $07, $00
	smpsVcDecayLevel    $00, $00, $00, $00
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $04, $0E, $11

