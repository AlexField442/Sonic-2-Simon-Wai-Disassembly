Mus_CPZ_Header:
	smpsHeaderStartSong 2
	smpsHeaderVoice     Mus_CPZ_Voices
	smpsHeaderChan      $06, $03
	smpsHeaderTempo     $01, $0C

	smpsHeaderDAC       Mus_CPZ_DAC
	smpsHeaderFM        Mus_CPZ_FM1,	$00, $0A
	smpsHeaderFM        Mus_CPZ_FM2,	$00, $12
	smpsHeaderFM        Mus_CPZ_FM3,	$00, $12
	smpsHeaderFM        Mus_CPZ_FM4,	$00, $12
	smpsHeaderFM        Mus_CPZ_FM5,	$00, $0E
	smpsHeaderPSG       Mus_CPZ_PSG1,	$00, $08, $00, $00
	smpsHeaderPSG       Mus_CPZ_PSG2,	$00, $08, $00, $00
	smpsHeaderPSG       Mus_CPZ_PSG3,	$00, $01, $00, fTone_02

; PSG1 Data
Mus_CPZ_PSG1:
	smpsStop

; PSG2 Data
Mus_CPZ_PSG2:
	smpsStop

Mus_CPZ_Call0A:
	smpsSetvoice        $01
	dc.b	nFs4, $06, nCs4, nE4, nFs4
	smpsReturn

Mus_CPZ_Call06:
	smpsSetvoice        $01
	dc.b	nCs5, $06, nCs5, nA4, $04, nRst, $08, nB4, $06, nCs5
	smpsReturn

Mus_CPZ_Call05:
	smpsSetvoice        $05
	dc.b	nA5, $05, nRst, $13, nA5, $12, nA5, $05, nRst, $0D
	smpsCall            Mus_CPZ_Call0A
	smpsSetvoice        $05
	dc.b	nA5, nA5, nRst, $0C, nA5, $06, nA5, $05, nRst, $0D, nA5, $06
	dc.b	nB5, $30, smpsNoAttack, $06, nA5, $05, nRst, $13, nA5, $12, nA5, $05
	dc.b	nRst, $0D
	smpsCall            Mus_CPZ_Call0A
	dc.b	nRst, $0C
	smpsReturn

Mus_CPZ_Call07:
	dc.b	nCs5, $0C, nB4, $06, nA4, nB4, nA4, $04, smpsNoAttack, $08, nA4, $04
	dc.b	nRst, $0E
	smpsCall            Mus_CPZ_Call0A
	smpsSetvoice        $00
	dc.b	nFs4, nA4, nCs5, $0C, nB4, $06, nA4, nB4, nA4, $0C, nB4, $04
	dc.b	nRst, $08, nA4, $04, nRst, $08, nB4, $04, nRst, $08, nCs5, $12
	dc.b	nA4, $06, nFs4, nRst, nFs4, nRst, $24
	smpsCall            Mus_CPZ_Call0A
	dc.b	nRst, $0C, nRst, $30
	smpsCall            Mus_CPZ_Call06
	smpsReturn

Mus_CPZ_Call08:
	smpsAlterVol        $04
	smpsSetvoice        $01
	dc.b	nD4, $12, nRst, $06, nD4, $12, nRst, $06, nE4, $0C, nRst, $12
	smpsAlterVol        $FC
	smpsReturn

Mus_CPZ_Call09:
	smpsSetvoice        $00
	dc.b	nCs4, $06, nE4, nFs4, nAb4, $02, smpsNoAttack, nA4, $0A, nFs4, $06, nCs4
	dc.b	nE4, nFs4, $04, nRst, $08, nAb4, $02, smpsNoAttack, nA4, $10, nFs4, $06
	dc.b	nCs4, nE4, nFs4, $04, nRst, $0E
	smpsReturn

Mus_CPZ_Call02:
	dc.b	nFs5, $05, nRst, $13, nFs5, $12, nFs5, $05, nRst, $25, nFs5, $06
	dc.b	nFs5, nRst, $0C, nFs5, $06, nFs5, $05, nRst, $0D, nFs5, $06, nAb5
	dc.b	$30, smpsNoAttack, $06, nFs5, $05, nRst, $13, nFs5, $12, nFs5, $05, nRst
	dc.b	$30, nRst, $01, nRst, $30, nRst
	smpsReturn

Mus_CPZ_Call04:
	dc.b	nA5, $05, nRst, $13, nA5, $12, nA5, $05, nRst, $25, nA5, $06
	dc.b	nA5, nRst, $0C, nA5, $06, nA5, $05, nRst, $0D, nA5, $06, nB5
	dc.b	$30, smpsNoAttack, $06, nA5, $05, nRst, $13, nA5, $12, nA5, $05, nRst
	dc.b	$30, nRst, $01, nRst, $30, nRst
	smpsReturn

Mus_CPZ_Call03:
	dc.b	nFs2, $0C, nFs3, $06, nRst, nE3, nRst, nFs3, nFs2, nRst, nFs2, nFs3
	dc.b	nRst, nE3, nRst, nFs3, $0C
	smpsReturn

Mus_CPZ_Call00:
	dc.b	dKick, $18, dSnare, $0C, dKick, $18, $0C, dSnare, dKick, dKick, $18, dSnare
	dc.b	$0C, dKick, $12, dKick, dSnare, $18, dKick, dSnare, $0C, dKick, $18, $0C
	dc.b	dSnare, dKick, dKick, $18, dSnare, $0C, dKick, $18, dSnare, $0C, dSnare, dSnare
	dc.b	$06, dSnare
	smpsReturn

Mus_CPZ_Call01:
	dc.b	dKick, $18, dSnare, $0C, dKick, $18, $0C, dSnare, dKick, dKick, $18, dSnare
	dc.b	$0C, dKick, $12, dKick, dSnare, $18, dKick, dSnare, $0C, dKick, $18, $0C
	dc.b	dSnare, dKick, dKick, $18, dSnare, $0C, dKick, dSnare, $06, dSnare, dSnare, dSnare
	dc.b	dSnare, dSnare, dSnare, dSnare
	smpsReturn

; FM1 Data
Mus_CPZ_FM1:
	smpsModSet          $06, $01, $FA, $04
	smpsCall            Mus_CPZ_Call05
	dc.b	nRst, $30, nRst
	smpsCall            Mus_CPZ_Call05
	dc.b	nRst, $30
	smpsCall            Mus_CPZ_Call06
	smpsSetvoice        $00
	dc.b	nFs4, nA4

Mus_CPZ_Jump01:
	smpsCall            Mus_CPZ_Call07
	smpsSetvoice        $00
	dc.b	nFs4, $06, nA4
	smpsCall            Mus_CPZ_Call07
	dc.b	nRst, $0C

Mus_CPZ_Loop10:
	dc.b	nRst, $0C
	smpsSetvoice        $00
	dc.b	nB4, $04, nRst, $08, nB4, $0C, nA4, $06, nB4, nRst, nB4, nRst
	dc.b	nA4, nB4, $0C, nA4, nCs5, $06, nA4, nRst, nFs4
	smpsSetvoice        $01
	dc.b	nA4, $04, nRst, $08, nA4, $04, nRst, $08, nA4, $04
	smpsAlterVol        $FD
	dc.b	nRst, $08, nA4, $04, nRst, $08, nA4, $06, nA4, $12
	smpsAlterVol        $FD
	dc.b	nFs4, $04, nRst, $08
	smpsAlterVol        $06
	smpsSetvoice        $00
	dc.b	nB4, $04, nRst, $08, nB4, $0C, nA4, $06, nB4, nRst, nB4, nRst
	dc.b	nA4, nB4, $0C, nA4
	smpsAlterVol        $FD
	dc.b	nCs5, $06
	smpsAlterVol        $04
	smpsSetvoice        $01
	dc.b	nFs4, $03, smpsNoAttack, nG4, smpsNoAttack, nAb4, $24, nD4, $03, smpsNoAttack, nEb4, smpsNoAttack
	dc.b	nE4, smpsNoAttack, nF4, smpsNoAttack, nFs4, $24
	smpsAlterVol        $FF
	smpsLoop            $00, $02, Mus_CPZ_Loop10
	smpsCall            Mus_CPZ_Call08
	smpsCall            Mus_CPZ_Call09
	smpsCall            Mus_CPZ_Call08
	smpsSetvoice        $00
	dc.b	nCs4, $06, nE4, nFs4, nAb4, $02, smpsNoAttack, nA4, $0A, nFs4, $06, nCs4
	dc.b	nE4, nFs4, $04, nRst, $08, nB4, $0C, nA4, $06, nB4, nCs5, $04
	dc.b	nRst, $1A
	smpsCall            Mus_CPZ_Call08
	smpsCall            Mus_CPZ_Call09
	smpsCall            Mus_CPZ_Call08
	smpsSetvoice        $00
	dc.b	nCs4, $06, nE4, nFs4, nA4, $04, nRst, $08, nB4, $04, nRst, $08
	dc.b	nCs5, $18, nE5, nFs5
	smpsModSet          $18, $01, $05, $04
	dc.b	smpsNoAttack, nFs5, $30, smpsNoAttack, $2A
	smpsAlterNote       $F8
	dc.b	smpsNoAttack, $06
	smpsAlterNote       $F0
	dc.b	smpsNoAttack, $06
	smpsAlterNote       $E8
	dc.b	smpsNoAttack, $06
	smpsAlterNote       $E0
	dc.b	smpsNoAttack, $06
	smpsAlterNote       $D8
	dc.b	smpsNoAttack, $06
	smpsAlterNote       $D0
	dc.b	smpsNoAttack, $06
	smpsAlterNote       $C8
	dc.b	smpsNoAttack, $06
	smpsAlterNote       $C0
	dc.b	smpsNoAttack, $06, smpsNoAttack, nFs5
	smpsAlterNote       $00
	dc.b	nCs5, $06, nCs5, nA4, $04, nRst, $08, nFs4, $06, nA4, nRst, nFs4
	smpsAlterNote       $F8
	dc.b	smpsNoAttack, $03
	smpsAlterNote       $F0
	dc.b	smpsNoAttack, $03
	smpsAlterNote       $E8
	dc.b	smpsNoAttack, $03
	smpsAlterNote       $E0
	dc.b	smpsNoAttack, $03
	smpsAlterNote       $D8
	dc.b	smpsNoAttack, $03
	smpsAlterNote       $D0
	dc.b	smpsNoAttack, $03
	smpsAlterNote       $C8
	dc.b	smpsNoAttack, $03
	smpsAlterNote       $C0
	dc.b	smpsNoAttack, nFs4, $03
	smpsAlterNote       $C8
	dc.b	smpsNoAttack, $03
	smpsAlterNote       $D0
	dc.b	smpsNoAttack, $03
	smpsAlterNote       $D8
	dc.b	smpsNoAttack, $03
	smpsAlterNote       $E0
	dc.b	smpsNoAttack, $03
	smpsAlterNote       $E8
	dc.b	smpsNoAttack, $03
	smpsAlterNote       $F0
	dc.b	smpsNoAttack, $03
	smpsAlterNote       $F8
	dc.b	smpsNoAttack, $03
	smpsAlterNote       $00
	dc.b	smpsNoAttack, nFs4, $03, smpsNoAttack, $30, smpsNoAttack, $30, smpsNoAttack, $18, nRst, $0C, nFs4
	dc.b	$06, nA4
	smpsModSet          $06, $01, $FA, $04
	smpsJump            Mus_CPZ_Jump01

; FM2 Data
Mus_CPZ_FM2:
	smpsModSet          $0C, $01, $FB, $04
	smpsSetvoice        $02

Mus_CPZ_Loop0C:
	smpsCall            Mus_CPZ_Call02
	smpsLoop            $00, $02, Mus_CPZ_Loop0C

Mus_CPZ_Loop0D:
	smpsCall            Mus_CPZ_Call02
	smpsLoop            $00, $04, Mus_CPZ_Loop0D
	smpsModOff

Mus_CPZ_Loop0E:
	dc.b	nAb5, $12, nRst, $06, nAb5, $12, nRst, $06, nA5, $0C, nRst, $24
	dc.b	nRst, $30, nRst
	smpsLoop            $00, $04, Mus_CPZ_Loop0E
	smpsModSet          $0C, $01, $05, $04
	dc.b	nRst, $30, nRst
	smpsSetvoice        $05
	smpsAlterVol        $F8

Mus_CPZ_Loop0F:
	dc.b	nCs5, $04, nRst, $08, nB4, $04, nRst, $08, nCs5, $0C, nB4, $06
	dc.b	nCs5, $04, nRst, $08, nCs5, $06, nB4, $04, nRst, $08, nCs5, $0C
	dc.b	nB4, $04, nRst, $08
	smpsLoop            $00, $02, Mus_CPZ_Loop0F
	dc.b	nFs5, $04, nRst, $08, nE5, $04, nRst, $08, nFs5, $0C, nE5, $06
	dc.b	nFs5, $04, nRst, $08, nFs5, $06, nE5, $04, nRst, $08, nFs5, $0C
	dc.b	nE5, $04, nRst, $08
	smpsSetvoice        $02
	smpsAlterVol        $08
	smpsJump            Mus_CPZ_Loop0D

; FM3 Data
Mus_CPZ_FM3:
	smpsModSet          $0C, $01, $05, $04
	smpsPan             panLeft, $00
	smpsSetvoice        $02

Mus_CPZ_Loop08:
	smpsCall            Mus_CPZ_Call04
	smpsLoop            $00, $02, Mus_CPZ_Loop08

Mus_CPZ_Loop09:
	smpsCall            Mus_CPZ_Call04
	smpsLoop            $00, $04, Mus_CPZ_Loop09
	smpsModOff

Mus_CPZ_Loop0A:
	dc.b	nB5, $12, nRst, $06, nB5, $12, nRst, $06, nCs6, $0C, nRst, $24
	dc.b	nRst, $30, nRst
	smpsLoop            $00, $04, Mus_CPZ_Loop0A
	smpsModSet          $0C, $01, $05, $04

Mus_CPZ_Loop0B:
	dc.b	nRst, $30, nRst
	smpsLoop            $00, $02, Mus_CPZ_Loop0B
	smpsSetvoice        $05
	smpsAlterVol        $F8
	dc.b	nFs5, $04, nRst, $08, nE5, $04, nRst, $08, nFs5, $0C, nE5, $06
	dc.b	nFs5, $04, nRst, $08, nFs5, $06, nE5, $04, nRst, $08, nFs5, $0C
	dc.b	nE5, $04, nRst, $08, nCs6, $04, nRst, $08, nB5, $04, nRst, $08
	dc.b	nCs6, $0C, nB5, $06, nCs6, $04, nRst, $08, nCs6, $06, nB5, $04
	dc.b	nRst, $08, nCs6, $0C, nB5, $04, nRst, $08
	smpsSetvoice        $02
	smpsAlterVol        $08
	smpsJump            Mus_CPZ_Loop09

; FM4 Data
Mus_CPZ_FM4:
	smpsModSet          $06, $01, $05, $04
	smpsPan             panRight, $00
	smpsSetvoice        $05

Mus_CPZ_Loop04:
	smpsCall            Mus_CPZ_Call02
	smpsLoop            $00, $02, Mus_CPZ_Loop04

Mus_CPZ_Jump00:
	smpsSetvoice        $03

Mus_CPZ_Loop05:
	smpsCall            Mus_CPZ_Call03
	smpsLoop            $00, $03, Mus_CPZ_Loop05
	dc.b	nE2, $0C, nE3, $06, nRst, nEb3, nRst, nE3, nEb2, nRst, nEb2, nEb3
	dc.b	nRst, nCs3, nRst, nEb3, $0C
	smpsLoop            $01, $04, Mus_CPZ_Loop05
	dc.b	nRst, $30, nRst
	smpsPan             panCenter, $00

Mus_CPZ_Loop06:
	smpsCall            Mus_CPZ_Call03
	dc.b	nRst, $30, nRst
	smpsLoop            $00, $03, Mus_CPZ_Loop06
	smpsPan             panRight, $00
	dc.b	nRst, $30, nRst
	smpsSetvoice        $05
	smpsAlterVol        $F8

Mus_CPZ_Loop07:
	dc.b	nA4, $04, nRst, $08, nAb4, $04, nRst, $08, nA4, $0C, nAb4, $06
	dc.b	nA4, $04, nRst, $08, nA4, $06, nAb4, $04, nRst, $08, nA4, $0C
	dc.b	nAb4, $04, nRst, $08
	smpsLoop            $00, $04, Mus_CPZ_Loop07
	smpsAlterVol        $08
	smpsJump            Mus_CPZ_Jump00

; FM5 Data
Mus_CPZ_FM5:
	smpsSetvoice        $04

Mus_CPZ_Loop02:
	dc.b	nRst, $30, nRst
	smpsLoop            $00, $03, Mus_CPZ_Loop02
	dc.b	nFs2, $06, nEb2, $24, nRst, $06, nE2, $04, nRst, $08, nE2, $0C
	dc.b	nF2, $04, nRst, $08, nF2, $0C, nFs2, $04, nRst, $08, nFs2, $0C
	dc.b	nFs2, $04, nRst, $08, nFs2, $0C, nFs2, $04, nRst, $08, nFs2, $0C
	dc.b	$06, nFs3, nFs2, $0C, nFs2, $04, nRst, $08, nFs2, $0C, nFs2, $04
	dc.b	nRst, $08, nFs2, $0C, $06, nEb2, $12, nE2, $0C, nF2, nFs2, $04
	dc.b	nRst, $08, nFs2, $0C, nFs2, $04, nRst, $08, nFs2, $0C, nFs2, $04
	dc.b	nRst, $08, nFs2, $0C, $06, nFs3, nFs2, $0C, nE2, $04, nRst, $08
	dc.b	nE2, $0C, nE2, $04, nRst, $08, nE2, $0C, nEb2, $04, nRst, $08
	dc.b	nEb2, $0C, nEb2, $04, nRst, $08, nEb2, $0C

Mus_CPZ_Loop03:
	dc.b	nFs2, $04, nRst, $08, nFs2, $0C, nFs2, $04, nRst, $08, nFs2, $0C
	dc.b	nFs2, $04, nRst, $08, nFs2, $0C, $06, nFs3, nFs2, $0C, nFs2, $04
	dc.b	nRst, $08, nFs2, $0C, nFs2, $04, nRst, $08, nFs2, $0C, $06, nEb2
	dc.b	$12, nE2, $0C, nF2, nFs2, $04, nRst, $08, nFs2, $0C, nFs2, $04
	dc.b	nRst, $08, nFs2, $0C, nFs2, $04, nRst, $08, nFs2, $0C, $06, nFs3
	dc.b	nFs2, $0C, nE2, $04, nRst, $08, nE2, $0C, nE2, $04, nRst, $08
	dc.b	nE2, $0C, nEb2, $04, nRst, $08, nEb2, $0C, nEb2, $04, nRst, $08
	dc.b	nEb2, $0C
	smpsLoop            $00, $04, Mus_CPZ_Loop03
	dc.b	nE2, $18, nF2, nFs2, $0C, nRst, $24, nRst, $30, nRst, $24, nE3
	dc.b	$06, nFs3, nE2, $18, nF2, nFs2, $0C, nRst, $24, nRst, $30, nRst
	dc.b	$18, nE3, $06, nE4, nEb3, nEb4, nE2, $18, nF2, nFs2, $0C, nRst
	dc.b	$24, nRst, $30, nRst, $18, nE3, $06, nRst, nE3, nFs3, nE2, $18
	dc.b	nF2, nFs2, $0C, nRst, $24, nFs2, $0C, nEb2, $24, nE2, $18, nF2
	dc.b	nFs2, $30, smpsNoAttack, $30, nRst, $30, nRst, nRst, nRst, nRst, nA2, $06
	dc.b	nA3, nA2, nA3, nAb2, nAb3, nG2, nG3
	smpsJump            Mus_CPZ_Loop03

; DAC Data
Mus_CPZ_DAC:
	smpsCall            Mus_CPZ_Call00
	smpsLoop            $00, $02, Mus_CPZ_DAC

Mus_CPZ_Loop00:
	smpsCall            Mus_CPZ_Call00
	smpsLoop            $00, $03, Mus_CPZ_Loop00
	smpsCall            Mus_CPZ_Call01

Mus_CPZ_Loop01:
	smpsCall            Mus_CPZ_Call00
	smpsLoop            $00, $02, Mus_CPZ_Loop01
	smpsCall            Mus_CPZ_Call01
	smpsJump            Mus_CPZ_Loop00

; PSG3 Data
Mus_CPZ_PSG3:
	smpsPSGform         $E7

Mus_CPZ_Jump02:
	dc.b	nA5, $0C, $06, nA5, nA5, $0C, $06, nA5, nA5, $0C, $06, nA5
	dc.b	nA5, $0C, $06, nA5, nA5, $0C, $06, nA5, nA5, $0C, $06, nA5
	dc.b	nA5, $0C, $06, nA5, nA5, nA5, nA5, nA5
	smpsJump            Mus_CPZ_Jump02

Mus_CPZ_Voices:
;	Voice $00
;	$3A
;	$01, $07, $01, $01, 	$8E, $8E, $8D, $53, 	$0E, $0E, $0E, $03
;	$00, $00, $00, $00, 	$1F, $FF, $1F, $0F, 	$17, $28, $27, $80
	smpsVcAlgorithm     $02
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $01, $01, $07, $01
	smpsVcRateScale     $01, $02, $02, $02
	smpsVcAttackRate    $13, $0D, $0E, $0E
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $03, $0E, $0E, $0E
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $00, $01, $0F, $01
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $27, $28, $17

;	Voice $01
;	$3C
;	$31, $52, $50, $30, 	$52, $53, $52, $53, 	$08, $00, $08, $00
;	$04, $00, $04, $00, 	$1F, $0F, $1F, $0F, 	$1A, $88, $16, $88
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $03, $05, $05, $03
	smpsVcCoarseFreq    $00, $00, $02, $01
	smpsVcRateScale     $01, $01, $01, $01
	smpsVcAttackRate    $13, $12, $13, $12
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $08, $00, $08
	smpsVcDecayRate2    $00, $04, $00, $04
	smpsVcDecayLevel    $00, $01, $00, $01
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $08, $16, $08, $1A

;	Voice $02
;	$3C
;	$31, $52, $50, $30, 	$52, $53, $52, $53, 	$08, $00, $08, $00
;	$04, $00, $04, $00, 	$1F, $0F, $1F, $0F, 	$1C, $84, $14, $80
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $03, $05, $05, $03
	smpsVcCoarseFreq    $00, $00, $02, $01
	smpsVcRateScale     $01, $01, $01, $01
	smpsVcAttackRate    $13, $12, $13, $12
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $08, $00, $08
	smpsVcDecayRate2    $00, $04, $00, $04
	smpsVcDecayLevel    $00, $01, $00, $01
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $14, $04, $1C

;	Voice $03
;	$3B
;	$0F, $06, $01, $02, 	$DF, $1F, $1F, $DF, 	$0C, $00, $0A, $03
;	$0F, $00, $00, $01, 	$F3, $05, $55, $5C, 	$22, $20, $22, $80
	smpsVcAlgorithm     $03
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $02, $01, $06, $0F
	smpsVcRateScale     $03, $00, $00, $03
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $03, $0A, $00, $0C
	smpsVcDecayRate2    $01, $00, $00, $0F
	smpsVcDecayLevel    $05, $05, $00, $0F
	smpsVcReleaseRate   $0C, $05, $05, $03
	smpsVcTotalLevel    $00, $22, $20, $22

;	Voice $04
;	$20
;	$36, $35, $30, $31, 	$DF, $DF, $9F, $9F, 	$07, $06, $09, $06
;	$07, $06, $06, $08, 	$2F, $1F, $1F, $FF, 	$14, $37, $0F, $80
	smpsVcAlgorithm     $00
	smpsVcFeedback      $04
	smpsVcUnusedBits    $00
	smpsVcDetune        $03, $03, $03, $03
	smpsVcCoarseFreq    $01, $00, $05, $06
	smpsVcRateScale     $02, $02, $03, $03
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $06, $09, $06, $07
	smpsVcDecayRate2    $08, $06, $06, $07
	smpsVcDecayLevel    $0F, $01, $01, $02
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $0F, $37, $14

;	Voice $05
;	$3A
;	$00, $07, $00, $00, 	$8E, $8E, $8D, $53, 	$0E, $0E, $0E, $03
;	$00, $00, $00, $00, 	$1F, $FF, $1F, $0F, 	$18, $32, $27, $80
	smpsVcAlgorithm     $02
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $00, $00, $07, $00
	smpsVcRateScale     $01, $02, $02, $02
	smpsVcAttackRate    $13, $0D, $0E, $0E
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $03, $0E, $0E, $0E
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $00, $01, $0F, $01
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $27, $32, $18
