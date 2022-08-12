Mus_HTZ_Header:
	smpsHeaderStartSong 2
	smpsHeaderVoice     Mus_HTZ_Voices
	smpsHeaderChan      $06, $03
	smpsHeaderTempo     $01, $09

	smpsHeaderDAC       Mus_HTZ_DAC
	smpsHeaderFM        Mus_HTZ_FM1,	$0C, $07
	smpsHeaderFM        Mus_HTZ_FM2,	$0C, $07
	smpsHeaderFM        Mus_HTZ_FM3,	$00, $07
	smpsHeaderFM        Mus_HTZ_FM4,	$0C, $07
	smpsHeaderFM        Mus_HTZ_FM5,	$00, $07
	smpsHeaderPSG       Mus_HTZ_PSG1,	$F4, $06, $00, $00
	smpsHeaderPSG       Mus_HTZ_PSG2,	$E8, $05, $00, $00
	smpsHeaderPSG       Mus_HTZ_PSG3,	$00, $00, $00, $00

; PSG1 Data
Mus_HTZ_PSG1:
; PSG2 Data
Mus_HTZ_PSG2:
	dc.b	nRst, $40, nRst, nRst, nRst, nRst, nRst, nRst, nRst, nRst, nRst
	smpsCall            Mus_HTZ_Call08
	dc.b	nRst, $40, nRst
	smpsCall            Mus_HTZ_Call09
	dc.b	nRst, $40, nRst
	smpsCall            Mus_HTZ_Call08
	dc.b	nRst, $40, nRst
	smpsCall            Mus_HTZ_Call0A
	dc.b	nRst, $10, nBb2, $08, nA2, nBb2, nC3, nRst, $10, nBb2, $08, nA2
	dc.b	nBb2, nC3, nRst, $30, nA2, $08, nG2, nA2, nC3, nRst, $10, nF2
	dc.b	$08, nE2, nF2, nG2, nRst, $20
	smpsCall            Mus_HTZ_Call0F
	dc.b	nE3, $04, nRst, nE3, $18, nF3, $04, nRst, $0C, nF3, $10, nFs3
	dc.b	$04, nRst, $0C, nFs3, $10, nG3, nRst, $20, nBb2, $08, nA2, nBb2
	dc.b	nC3, nRst, $10, nBb2, $08, nA2, nBb2, nC3, nRst, $30, nA2, $08
	dc.b	nG2, nA2, nC3, nRst, $10, nF2, $08, nE2, nF2, nG2, nRst, $20
	smpsCall            Mus_HTZ_Call0F
	dc.b	nE3, $04, nRst, nE3, $08, nRst, $70
	smpsJump            Mus_HTZ_PSG1

; PSG3 Data
Mus_HTZ_PSG3:
	smpsStop

; FM1 Data
Mus_HTZ_FM1:
	smpsSetvoice        $01
	smpsAlterNote       $06
	dc.b	nRst, $40, nRst
	smpsModSet          $08, $01, $02, $40
	dc.b	nD4, $40
	smpsModSet          $08, $01, $03, $20
	dc.b	smpsNoAttack, nD4, $20
	smpsModSet          $08, $01, $03, $20
	dc.b	smpsNoAttack, nD4, $20
	smpsModOff
	dc.b	nC4, $10, nRst, $20, $20, $20, $10
	smpsCall            Mus_HTZ_Call0C
	smpsSetvoice        $01
	smpsCall            Mus_HTZ_Call0D
	smpsSetvoice        $03
	smpsCall            Mus_HTZ_Call08
	smpsSetvoice        $01
	smpsCall            Mus_HTZ_Call0E
	smpsSetvoice        $03
	smpsCall            Mus_HTZ_Call09
	smpsSetvoice        $01
	smpsCall            Mus_HTZ_Call0D
	smpsSetvoice        $03
	smpsCall            Mus_HTZ_Call08
	smpsSetvoice        $01
	smpsCall            Mus_HTZ_Call0E
	smpsSetvoice        $03
	smpsCall            Mus_HTZ_Call0A
	smpsAlterNote       $FE
	dc.b	nRst, $10, nBb2, $08, nA2, nBb2, nC3, nRst, $10, nBb2, $08, nA2
	dc.b	nBb2, nC3, nRst, $30, nA2, $08, nG2, nA2, nC3, nRst, $10, nF2
	dc.b	$08, nE2, nF2, nG2, nRst, $20
	smpsCall            Mus_HTZ_Call0F
	dc.b	nE3, $04, nRst, nE3, $18, nF3, $04, nRst, $0C, nF3, $10, nFs3
	dc.b	$04, nRst, $0C, nFs3, $10, nG3, nRst, $20, nBb2, $08, nA2, nBb2
	dc.b	nC3, nRst, $10, nBb2, $08, nA2, nBb2, nC3, nRst, $30, nA2, $08
	dc.b	nG2, nA2, nC3, nRst, $10, nF2, $08, nE2, nF2, nG2, nRst, $20
	smpsCall            Mus_HTZ_Call0F
	dc.b	nE3, $04, nRst, nE3, $08, nRst, $70
	smpsJump            Mus_HTZ_FM1

Mus_HTZ_Call0F:
	dc.b	nE3, $04, nRst, $0C, nE3, $10, nF3, $04, nRst, $0C, nF3, $10
	dc.b	nFs3, $04, nRst, $0C, nFs3, $10, nG3, $20
	smpsReturn

Mus_HTZ_Call0D:
	dc.b	nRst, $08, nG3, $08, nA3, nRst, nC4, nRst, nD4, nRst, nEb4, nRst
	dc.b	nD4, nRst, nC4, nD4, nRst, nC4, $08
	smpsReturn

Mus_HTZ_Call0E:
	dc.b	nRst, $08, nG4, $18, nEb4, $08, nRst, nD4, nRst, nEb4, nRst, nD4
	dc.b	nRst, nC4, nA3, nRst, nC4, $08
	smpsReturn

; FM2 Data
Mus_HTZ_FM2:
	smpsSetvoice        $01
	dc.b	nRst, $40, nRst, nRst, nRst, nRst, nRst, nRst, nRst
	smpsAlterPitch      $F4
	dc.b	nRst, $40, nRst
	smpsSetvoice        $03
	smpsCall            Mus_HTZ_Call08
	dc.b	nRst, $40, nRst
	smpsSetvoice        $03
	smpsCall            Mus_HTZ_Call09
	dc.b	nRst, $40, nRst
	smpsSetvoice        $03
	smpsCall            Mus_HTZ_Call08
	dc.b	nRst, $40, nRst
	smpsSetvoice        $03
	smpsCall            Mus_HTZ_Call0A
	smpsAlterPitch      $0C
	smpsSetvoice        $01
	smpsCall            Mus_HTZ_Call0B
	dc.b	nC4, $40, smpsNoAttack, nC4, $40, smpsNoAttack, nC4, $10, nRst, $40, nRst
	smpsCall            Mus_HTZ_Call0B
	dc.b	nC4, $40, smpsNoAttack, nC4, $40, smpsNoAttack, nC4, $10, nG4, $04, nRst, nG4
	dc.b	$08, nRst, $70
	smpsJump            Mus_HTZ_FM2

Mus_HTZ_Call0B:
	dc.b	nRst, $10, nBb3, $18, nRst, $08, nC4, nRst, nD4, $18, nRst, $08
	dc.b	nE4, $18, nRst, $08, nF4, $18, nRst, $08, nE4, $18, nRst, $08
	dc.b	nD4, nRst, nBb3, $18, nRst, $08
	smpsReturn

Mus_HTZ_Call0C:
	dc.b	nRst, $08
	smpsAlterVol        $18
	dc.b	nEb4, $06
	smpsAlterVol        $FF
	dc.b	nD4, $06
	smpsAlterVol        $FF
	dc.b	nEb4, $06
	smpsAlterVol        $FF
	dc.b	nD4, $06
	smpsAlterVol        $FF
	dc.b	nEb4, $05
	smpsAlterVol        $FF
	dc.b	nD4, $05
	smpsAlterVol        $FF
	dc.b	nEb4, $05
	smpsAlterVol        $FF
	dc.b	nD4, $05
	smpsAlterVol        $FF
	dc.b	nEb4, $05
	smpsAlterVol        $FF
	dc.b	nD4, $05
	smpsAlterVol        $FF
	dc.b	nEb4, $05
	smpsAlterVol        $FF
	dc.b	nD4, $05
	smpsAlterVol        $FF
	dc.b	nEb4, $05
	smpsAlterVol        $FF
	dc.b	nD4, $05
	smpsAlterVol        $FF
	dc.b	nEb4, $05
	smpsAlterVol        $FF
	dc.b	nD4, $05
	smpsAlterVol        $FF
	dc.b	nEb4, $04
	smpsAlterVol        $FF
	dc.b	nD4, $04
	smpsAlterVol        $FF
	dc.b	nEb4, $04
	smpsAlterVol        $FF
	dc.b	nD4, $04
	smpsAlterVol        $FF
	dc.b	nEb4, $04
	smpsAlterVol        $FF
	dc.b	nD4, $04
	smpsAlterVol        $FF
	dc.b	nEb4, $04
	smpsAlterVol        $FF
	dc.b	nD4, $04
	smpsAlterVol        $FF
	dc.b	nEb4, $04
	smpsReturn

Mus_HTZ_Call08:
	dc.b	nRst, $10, nG3, $08, nA3, nC4, nRst, $18, nG3, $08, nA3, nC4
	dc.b	nRst, nEb4, nC4, nRst, nC4
	smpsReturn

Mus_HTZ_Call09:
	dc.b	nRst, $08, nBb3, $18, nA3, $08, nRst, $18, nBb3, $08, nRst, nA3
	dc.b	nRst, nBb3, nC4, nRst, nC4
	smpsReturn

Mus_HTZ_Call0A:
	dc.b	nRst, $08, nBb3, $18, nA3, $08, nRst, $18, nBb3, $08, nRst, nA3
	dc.b	nRst, nBb3, $04, nRst, nC4, $18
	smpsReturn

; FM3 Data
Mus_HTZ_FM3:
	smpsSetvoice        $02
	smpsAlterNote       $04

Mus_HTZ_Jump02:
	dc.b	nRst, $40, nRst, nRst, nRst, nRst, nRst, nRst, nRst

Mus_HTZ_Loop02:
	dc.b	nG4, $04, smpsNoAttack, nA4, $7C, nF4, $04, smpsNoAttack, nG4, $7C, nEb4, $04
	dc.b	smpsNoAttack, nF4, $7C, nF4, $04, smpsNoAttack, nG4, $7C
	smpsLoop            $00, $02, Mus_HTZ_Loop02
	smpsCall            Mus_HTZ_Call07
	smpsCall            Mus_HTZ_Call07
	dc.b	nRst, $40, nRst, nRst, nRst
	smpsCall            Mus_HTZ_Call07
	smpsCall            Mus_HTZ_Call07
	dc.b	nRst, $40, nRst

Mus_HTZ_Loop03:
	dc.b	nC5, $08
	smpsLoop            $00, $0F, Mus_HTZ_Loop03
	dc.b	nRst, $08
	smpsJump            Mus_HTZ_Jump02

Mus_HTZ_Call07:
	dc.b	nA4, $08, nRst, nA4, nRst, nG4, nRst, $18, nA4, $08, nRst, nA4
	dc.b	nRst, nG4, nRst, $18
	smpsReturn

; FM5 Data
Mus_HTZ_FM5:
	smpsSetvoice        $02

Mus_HTZ_Jump01:
	dc.b	nRst, $40, nRst, nRst, nRst, nRst, nRst, nRst, nRst

Mus_HTZ_Loop00:
	dc.b	nEb4, $04, smpsNoAttack, nF4, $7C, nD4, $04, smpsNoAttack, nE4, $7C, nC4, $04
	dc.b	smpsNoAttack, nD4, $7C, nD4, $04, smpsNoAttack, nE4, $7C
	smpsLoop            $00, $02, Mus_HTZ_Loop00
	smpsCall            Mus_HTZ_Call06
	smpsCall            Mus_HTZ_Call06
	dc.b	nRst, $40, nRst, nRst, nRst
	smpsCall            Mus_HTZ_Call06
	smpsCall            Mus_HTZ_Call06
	dc.b	nRst, $40, nRst

Mus_HTZ_Loop01:
	dc.b	nBb4, $08
	smpsLoop            $00, $0F, Mus_HTZ_Loop01
	dc.b	nRst, $08
	smpsJump            Mus_HTZ_Jump01

Mus_HTZ_Call06:
	dc.b	nF4, $08, nRst, nF4, nRst, nE4, nRst, $18, nF4, $08, nRst, nF4
	dc.b	nRst, nE4, nRst, $18
	smpsReturn

; FM4 Data
Mus_HTZ_FM4:
	smpsSetvoice        $00

Mus_HTZ_Jump00:
	smpsCall            Mus_HTZ_Call02
	dc.b	nEb3, $08, nE3, nB2, nC3, nRst, $28, nA1, $08, nA1, $10, nBb1
	dc.b	nB1
	smpsCall            Mus_HTZ_Call02
	dc.b	nEb3, $08, nE3, nRst, $70
	smpsCall            Mus_HTZ_Call03
	smpsCall            Mus_HTZ_Call04
	dc.b	nB1, $10, nB2, $08, nRst
	smpsCall            Mus_HTZ_Call03
	smpsCall            Mus_HTZ_Call04
	dc.b	nB1, $10, nB2, $08, nRst
	smpsCall            Mus_HTZ_Call03
	smpsCall            Mus_HTZ_Call04
	dc.b	nB1, $10, nB2, $08, nRst
	smpsCall            Mus_HTZ_Call03
	smpsCall            Mus_HTZ_Call04
	dc.b	nC2, $10, nC3, $08, nRst
	smpsCall            Mus_HTZ_Call05
	dc.b	nC2, $08, nC2, $18, nD2, $08, nRst, nD2, $10, nEb2, $08, nRst
	dc.b	nEb2, $10, nE2, $08, nRst, nE2, $10
	smpsCall            Mus_HTZ_Call05
	dc.b	nC2, $08, nC2, nRst, $70
	smpsJump            Mus_HTZ_Jump00

Mus_HTZ_Call02:
	dc.b	nC2, $08, nG2, nA2, nRst, nC3, nRst, nC3, nRst, nC3, nRst, nC3
	dc.b	nRst, nD3, nC3, $18
	smpsReturn

Mus_HTZ_Call03:
	dc.b	nC2, $10, nC3, $08, nRst, nA1, $10, nA2, $08, nRst, nBb1, $10
	dc.b	nBb2, $08, nRst, nB1, $10, nEb3, $08, nD3
	smpsReturn

Mus_HTZ_Call04:
	dc.b	nC2, $08, nC2, $18, nA1, $10, nA2, $08, nRst, nBb1, $10, nBb2
	dc.b	$08, nRst
	smpsReturn

Mus_HTZ_Call05:
	dc.b	nBb1, $10, nBb2, $08, nBb2, nBb1, $10, nBb2, $08, nBb2, nBb1, $10
	dc.b	nBb2, $08, nBb2, nBb1, $10, nBb2, $08, nBb2, nA1, nA1, $18, nA1
	dc.b	$10, nA2, $08, nA2, nG1, $10, nG2, $08, nG2, nG1, $10, nG2
	dc.b	$08, nG2, nC2, nRst, nC2, $10, nD2, $08, nRst, nD2, $10, nEb2
	dc.b	$08, nRst, nEb2, $10, nE2, nG1, $08, nA1
	smpsReturn

; DAC Data
Mus_HTZ_DAC:
	dc.b	dKick, $30, dKick, $10, dKick, $40, dKick, $08, dKick, $28, dKick, $10
	dc.b	dKick, $20, dSnare, dKick, $30, dKick, $10, dKick, $40, dKick, $08, dKick
	dc.b	$28, dKick, $10, dKick, $20, dSnare, $10, dSnare, $08, dSnare
	smpsCall            Mus_HTZ_Call00
	smpsCall            Mus_HTZ_Call01
	dc.b	dSnare
	smpsCall            Mus_HTZ_Call00
	smpsCall            Mus_HTZ_Call01
	dc.b	dSnare, $10, dSnare, $08, dSnare
	smpsCall            Mus_HTZ_Call00
	smpsCall            Mus_HTZ_Call01
	dc.b	dSnare, $10, dSnare, $08, dSnare
	smpsCall            Mus_HTZ_Call00
	dc.b	dKick, $08, dKick, $18, dSnare, $10, dKick, dKick, dSnare, dSnare, dSnare, $08
	dc.b	dSnare
	smpsCall            Mus_HTZ_Call00
	smpsCall            Mus_HTZ_Call01
	dc.b	dSnare, $10, dSnare, $08, dSnare
	smpsCall            Mus_HTZ_Call00
	smpsCall            Mus_HTZ_Call01
	dc.b	dSnare
	smpsCall            Mus_HTZ_Call00
	smpsCall            Mus_HTZ_Call01
	dc.b	dSnare, $10, dSnare, $08, dSnare
	smpsCall            Mus_HTZ_Call00
	dc.b	dSnare, $08, dKick, $10, dKick, $08, dKick, $10, dSnare, $08, dSnare, $10
	dc.b	dKick, dKick, $08, dKick, $10, dSnare, $08, dSnare
	smpsJump            Mus_HTZ_DAC

Mus_HTZ_Call00:
	dc.b	dKick, $20, dSnare, $10, dKick, dKick, $20, dSnare
	smpsReturn

Mus_HTZ_Call01:
	dc.b	dKick, $08, dKick, $18, dSnare, $10, dKick, dKick, $20
	smpsReturn

Mus_HTZ_Voices:
;	Voice $00
;	$08
;	$09, $70, $30, $00, 	$1F, $1F, $5F, $5F, 	$12, $0E, $0A, $0A
;	$00, $04, $04, $03, 	$2F, $2F, $2F, $2F, 	$25, $30, $13, $84
	smpsVcAlgorithm     $00
	smpsVcFeedback      $01
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $03, $07, $00
	smpsVcCoarseFreq    $00, $00, $00, $09
	smpsVcRateScale     $01, $01, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $0A, $0A, $0E, $12
	smpsVcDecayRate2    $03, $04, $04, $00
	smpsVcDecayLevel    $02, $02, $02, $02
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $04, $13, $30, $25

;	Voice $01
;	$38
;	$23, $08, $02, $02, 	$14, $14, $14, $10, 	$05, $05, $05, $05
;	$00, $00, $00, $00, 	$00, $00, $00, $0F, 	$20, $2C, $20, $86
	smpsVcAlgorithm     $00
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $02
	smpsVcCoarseFreq    $02, $02, $08, $03
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $10, $14, $14, $14
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $05, $05, $05, $05
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $00, $00, $00, $00
	smpsVcReleaseRate   $0F, $00, $00, $00
	smpsVcTotalLevel    $06, $20, $2C, $20

;	Voice $02
;	$0D
;	$32, $04, $02, $01, 	$1F, $19, $19, $19, 	$0A, $05, $05, $05
;	$00, $02, $02, $02, 	$3F, $2F, $2F, $2F, 	$28, $86, $8B, $93
	smpsVcAlgorithm     $05
	smpsVcFeedback      $01
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $03
	smpsVcCoarseFreq    $01, $02, $04, $02
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $19, $19, $19, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $05, $05, $05, $0A
	smpsVcDecayRate2    $02, $02, $02, $00
	smpsVcDecayLevel    $02, $02, $02, $03
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $13, $0B, $06, $28

;	Voice $03
;	$3A
;	$01, $07, $01, $01, 	$8E, $8E, $8D, $53, 	$0E, $0E, $0E, $03
;	$00, $00, $00, $00, 	$1F, $FF, $1F, $0F, 	$17, $28, $27, $86
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
	smpsVcTotalLevel    $06, $27, $28, $17