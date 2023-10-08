sndDE_Header:
	smpsHeaderStartSong 2
	smpsHeaderVoice     sndDE_Voices
	smpsHeaderTempoSFX  $01
	smpsHeaderChanSFX   $01

	smpsHeaderSFXChannel cFM5, sndDE_FM5,	$00, $00

; FM5 Data
sndDE_FM5:
	smpsSetvoice        $00
	smpsModSet          $01, $01, $0F, $FE
	dc.b	nFs1, $43
	smpsModSet          $01, $01, $03, $03
	dc.b	nFs2, $0F

sndDE_Loop00:
	dc.b	smpsNoAttack, $03
	smpsAlterVol        $01
	smpsLoop            $00, $23, sndDE_Loop00
	smpsStop

sndDE_Voices:
;	Voice $00
;	$3C
;	$00, $40, $02, $02, 	$1F, $1F, $1F, $15, 	$00, $1F, $00, $00
;	$00, $00, $00, $00, 	$0F, $0F, $0F, $0F, 	$0D, $00, $28, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $04, $00
	smpsVcCoarseFreq    $02, $02, $00, $00
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $15, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $00, $1F, $00
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $00, $00, $00, $00
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $28, $00, $0D

