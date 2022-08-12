Mus_MTZ_Header:
	smpsHeaderStartSong 2
	smpsHeaderVoice     Mus_MTZ_Voices
	smpsHeaderChan      $06, $03
	smpsHeaderTempo     $01, $0A

	smpsHeaderDAC       Mus_MTZ_DAC
	smpsHeaderFM        Mus_MTZ_FM1,	$00, $10
	smpsHeaderFM        Mus_MTZ_FM2,	$F4, $10
	smpsHeaderFM        Mus_MTZ_FM3,	$00, $0C
	smpsHeaderFM        Mus_MTZ_FM4,	$00, $0C
	smpsHeaderFM        Mus_MTZ_FM5,	$18, $0A
	smpsHeaderPSG       Mus_MTZ_PSG1,	$DC, $02, $00, fTone_05
	smpsHeaderPSG       Mus_MTZ_PSG2,	$DC, $02, $00, fTone_05
	smpsHeaderPSG       Mus_MTZ_PSG3,	$FD, $03, $00, fTone_0A

; FM1 Data
Mus_MTZ_FM1:
	smpsPan             panLeft, $00
	smpsModSet          $01, $04, $02, $04
	smpsSetvoice        $01
	dc.b	nRst, $30, nRst, nRst, nRst, $24
	smpsModSet          $01, $01, $0C, $0C
	smpsAlterVol        $28
	dc.b	nFs4, $0C
	smpsAlterVol        $D8
	dc.b	smpsNoAttack, $30, smpsNoAttack, $30, smpsNoAttack, $30, smpsNoAttack, $30
	smpsModSet          $01, $04, $02, $04
	smpsSetvoice        $02

Mus_MTZ_Jump02:
	dc.b	nRst, $30, nRst, nRst, nRst, nRst, nRst, nRst, nRst
	smpsModSet          $01, $01, $02, $30
	dc.b	nB1, $30
	smpsModSet          $01, $04, $02, $04
	dc.b	smpsNoAttack, nC2, smpsNoAttack, $30, smpsNoAttack, $30
	smpsModSet          $01, $04, $FC, $78
	dc.b	smpsNoAttack, $30, smpsNoAttack, $30
	smpsModSet          $01, $04, $02, $04

Mus_MTZ_Loop04:
	dc.b	nRst, $30, nRst, $0C, nE3, $18, nD3, $0C, nC3, $18, nE3, $0C
	dc.b	nRst, $30, nRst, $0C, nRst, $30, nRst, $0C, nE3, nF3, nE3, nG3
	dc.b	$18, nE3, nC3, nRst
	smpsLoop            $00, $02, Mus_MTZ_Loop04
	dc.b	nRst, $30, nRst, nF3, smpsNoAttack, $30, nA3, nF3, nG3, $0C, nG3, nG2
	dc.b	$06, nBb2, nC3, nEb3, $12, nC3, $05, nRst, $07, nBb2, $06, nC3
	dc.b	$08, nRst, $0A, nG4, $05, nRst, $07, $05, nRst, $07, nG2, $06
	dc.b	nBb2, nC3, nEb3, $12, nC3, $06, nRst, nBb2, $06, nC3, $05, nRst
	dc.b	$0D, nF3, $30, smpsNoAttack, $30, nA3, nF3, nG4, $05, nRst, $07, $05
	dc.b	nRst, $07, nG2, $06, nBb2, nC3, nEb3, $12, nC3, $06, nRst, nBb2
	dc.b	$06, nC3, $05, nRst, $0D
	smpsModSet          $01, $04, $FC, $78
	dc.b	nG4, $30, smpsNoAttack, $30
	smpsModOff
	smpsJump            Mus_MTZ_Jump02

; FM2 Data
Mus_MTZ_FM2:
	smpsPan             panRight, $00
	smpsSetvoice        $01
	smpsModSet          $01, $04, $FE, $04
	dc.b	nRst, $30, nRst, nRst, nRst, $24
	smpsModSet          $01, $01, $0C, $0C
	smpsAlterVol        $28
	dc.b	nC5, $0C
	smpsAlterVol        $D8
	dc.b	smpsNoAttack, $30, smpsNoAttack, $30, smpsNoAttack, $30, smpsNoAttack, $30
	smpsModSet          $01, $04, $02, $04
	smpsSetvoice        $02

Mus_MTZ_Jump01:
	smpsAlterPitch      $0C
	dc.b	nRst, $30, nRst, nRst, nRst, nRst, nRst, nRst, nRst
	smpsModSet          $01, $01, $02, $30
	dc.b	nB2, $30
	smpsModSet          $01, $03, $FE, $04
	dc.b	smpsNoAttack, nC3, smpsNoAttack, $30, smpsNoAttack, $30
	smpsModSet          $01, $04, $FC, $78
	dc.b	smpsNoAttack, $30, smpsNoAttack, $30
	smpsModSet          $01, $04, $FE, $04

Mus_MTZ_Loop03:
	dc.b	nRst, $30, nRst, $0C, nE4, $18, nD4, $0C, nC4, $18, nE4, $0C
	dc.b	nRst, $30, nRst, $0C, nRst, $30, nRst, $0C, nE4, nF4, nE4, nG4
	dc.b	$18, nE4, nC4, nRst
	smpsLoop            $00, $02, Mus_MTZ_Loop03
	dc.b	nRst, $30, nRst
	smpsAlterPitch      $F4
	dc.b	nBb3, smpsNoAttack, $30, nD4, nBb3
	smpsAlterPitch      $0C
	dc.b	nC3, $0C, nC3, nG3, $06, nBb3, nC4, nEb4, $12, nC4, $05, nRst
	dc.b	$07, nBb3, $06, nC4, $08, nRst, $0A, nC3, $05, nRst, $07, $05
	dc.b	nRst, $07, nG3, $06, nBb3, nC4, nEb4, $12, nC4, $06, nRst, nBb3
	dc.b	$06, nC4, $05, nRst, $0D
	smpsAlterPitch      $F4
	dc.b	nBb3, $30, smpsNoAttack, $30, nD4, nBb3
	smpsAlterPitch      $0C
	dc.b	nC4, $05, nRst, $07, $05, nRst, $07, nG3, $06, nBb3, nC4, nEb4
	dc.b	$12, nC4, $06, nRst, nBb3, $06, nC4, $05, nRst, $0D
	smpsAlterPitch      $F4
	smpsModSet          $01, $04, $FC, $78
	dc.b	nF5, $30, smpsNoAttack, $30
	smpsModOff
	smpsJump            Mus_MTZ_Jump01

; FM3 Data
Mus_MTZ_FM3:
	smpsSetvoice        $00
	smpsModSet          $0C, $01, $01, $05

; PSG1 Data
Mus_MTZ_PSG1:
	dc.b	nRst, $30, nRst, nRst, nRst, nRst, nRst, nRst, nRst

Mus_MTZ_Loop02:
	dc.b	nRst, $18, nG4, $0B, nRst, $0D, nA4, $0C, $0B, nRst, $19, nC5
	dc.b	$0C, $0B, nRst, $0D, nG4, $30, smpsNoAttack, $0C, nRst, $18, nG4, $0B
	dc.b	nRst, $0D, nA4, $0C, $0B, nRst, $19, nC5, $0C, $0B, nRst, $0D
	dc.b	nC5, $30, smpsNoAttack, $0C
	smpsLoop            $00, $04, Mus_MTZ_Loop02
	smpsPan             panCenter, $00
	dc.b	nD6, $06, nC6, nBb5, nA5
	smpsPan             panLeft, $00
	dc.b	nD6, nC6, nBb5, nA5
	smpsPan             panRight, $00
	dc.b	nD6, nC6, nBb5, nA5
	smpsPan             panCenter, $00
	dc.b	nD6, nC6, nBb5, nA5
	smpsPan             panLeft, $00
	dc.b	nD6, nC6, nBb5, nA5
	smpsPan             panCenter, $00
	dc.b	nD6, nC6, nBb5, nA5
	smpsPan             panRight, $00
	dc.b	nD6, nC6, nBb5, nA5
	smpsPan             panCenter, $00
	dc.b	nD6, nC6, nBb5, nA5, nC5, $0C, $06, nRst, $30, nRst, $12, nBb4
	dc.b	$0C, nC6, nC6, $06, nRst, $30, nRst, $1E
	smpsPan             panCenter, $00
	dc.b	nD6, $06, nC6, nBb5, nA5
	smpsPan             panLeft, $00
	dc.b	nD6, nC6, nBb5, nA5
	smpsPan             panRight, $00
	dc.b	nD6, nC6, nBb5, nA5
	smpsPan             panCenter, $00
	dc.b	nD6, nC6, nBb5, nA5
	smpsPan             panLeft, $00
	dc.b	nD6, nC6, nBb5, nA5
	smpsPan             panCenter, $00
	dc.b	nD6, nC6, nBb5, nA5
	smpsPan             panRight, $00
	dc.b	nD6, nC6, nBb5, nA5
	smpsPan             panCenter, $00
	dc.b	nD6, nC6, nBb5, nA5, nC6, $0C, $06, nRst, $30, nRst, $1E, nD5
	dc.b	$06, nFs5, nCs5, nF5, nC5, nE5, nB4, nEb5, nB4, nD5, nBb4, nD5
	dc.b	nA4, nCs5, nAb4, nC5
	smpsJump            Mus_MTZ_Loop02

; FM4 Data
Mus_MTZ_FM4:
	smpsSetvoice        $00
	smpsModSet          $0C, $01, $FF, $05
	dc.b	nRst, $30, nRst, nRst, nRst, nRst, nRst, nRst, nRst

Mus_MTZ_Loop01:
	dc.b	nRst, $18, nE4, $0B, nRst, $0D, nFs4, $0C, $0B, nRst, $19, nA4
	dc.b	$0C, $0B, nRst, $0D, nE4, $30, smpsNoAttack, $0C, nRst, $18, nE4, $0B
	dc.b	nRst, $0D, nFs4, $0C, $0B, nRst, $19, nA4, $0C, $0B, nRst, $0D
	dc.b	nG4, $30, smpsNoAttack, $0C
	smpsLoop            $00, $04, Mus_MTZ_Loop01
	dc.b	nRst, $30, nRst, nRst, nRst, nC4, $0C, $06, nRst, $30, nRst, $12
	dc.b	nBb3, $0C, nC5, nC5, $06, nRst, $30, nRst, $1E, nRst, $30, nRst
	dc.b	nRst, nRst, nC5, $0C, $06, nRst, $30, nRst, $1E, nRst, $30, nRst
	smpsJump            Mus_MTZ_Loop01

; PSG2 Data
Mus_MTZ_PSG2:
	dc.b	nRst, $30, nRst, nRst, nRst, nRst, nRst, nRst, nRst

Mus_MTZ_Loop07:
	dc.b	nRst, $18, nC4, $0B, nRst, $0D, nD4, $0C, $0B, nRst, $19, nF4
	dc.b	$0C, $0B, nRst, $0D, nC4, $30, smpsNoAttack, $0C, nRst, $18, nC4, $0B
	dc.b	nRst, $0D, nD4, $0C, $0B, nRst, $19, nF4, $0C, $0B, nRst, $0D
	dc.b	nE4, $30, smpsNoAttack, $0C
	smpsLoop            $00, $04, Mus_MTZ_Loop07
	dc.b	nRst, $30, nRst, nRst, nRst, nRst, nRst, nC4, $0C, $06, nRst, $30
	dc.b	nRst, $1E, nRst, $30, nRst, nRst, nRst, nC4, $0C, $06, nRst, $30
	dc.b	nRst, $1E, nRst, $30, nRst
	smpsJump            Mus_MTZ_Loop07

; FM5 Data
Mus_MTZ_FM5:
	smpsSetvoice        $04
	dc.b	nRst, $30, nRst, nRst, nRst, nRst, nRst, nRst, nRst, $0C, nA0, nBb0
	dc.b	nB0

Mus_MTZ_Jump00:
	smpsNoteFill        $08
	dc.b	nC1, $0C, nC1, nC1, nC1, nC1, nC1, nC1, nC1, nC1, nC1, nC1
	dc.b	nC1
	smpsNoteFill        $0C
	dc.b	nC1, nA0, nBb0, nB0
	smpsNoteFill        $08
	dc.b	nC1, nC1, nC1, nC1, nC1, nC1, nC1, nC1, nC1, nC1, nC1, nC1
	dc.b	nC1, $06, nC1
	smpsNoteFill        $0C
	dc.b	nA0, $0C, nBb0, nB0
	smpsNoteFill        $08
	dc.b	nC1, nC1, nC1, nC1, nC1, nC1, nC1, nC1, nC1, nC1, nC1, nC1
	smpsNoteFill        $0C
	dc.b	nC1, nA0, nBb0, nB0
	smpsNoteFill        $08
	dc.b	nC1, nC1, nC1, nC1, nC1, nC1, nC1, nC1, nC1, nC1, nC1, nC1
	smpsNoteFill        $0C
	dc.b	nC1, nEb1, nD1, nCs1
	smpsNoteFill        $08
	dc.b	nC1, nC1, nC1, nC1, nC1, nC1, nC1, $0C, nC1, $06, nC1, $06
	dc.b	$0C, nC1, nC1, nC1
	smpsNoteFill        $0C
	dc.b	nC1, nA0, nBb0, nB0
	smpsNoteFill        $08
	dc.b	nC1, nC1, nC1, nC1, nC1, nC1, nC1, nC1, nC1, nC1, nC1, nC1
	dc.b	nC1, $06, nC1
	smpsNoteFill        $0C
	dc.b	nA0, $0C, nBb0, nB0
	smpsNoteFill        $08
	dc.b	nC1, nC1, nC1, nC1, nC1, nC1, nC1, nC1, nC1, nC1, nC1, nC1
	smpsNoteFill        $0C
	dc.b	nC1, nA0, nBb0, nB0
	smpsNoteFill        $08
	dc.b	nC1, nC1, nC1, nC1, nC1, nC1, nC1, nC1, nC1, nC1, nC1, nC1
	smpsNoteFill        $0C
	dc.b	nC1, nEb1, nD1, nCs1, nBb0, nBb0, nBb0, nBb0, nBb0, nBb0, nBb0, nBb0
	dc.b	nD1, nD1, nD1, nD1, nBb0, nBb0, nBb0, nBb0, nC1, nC1, $06, nRst
	dc.b	$30, nRst, $12, nBb0, $06, nB0, nC1, $0C, $06, nRst, $30, nRst
	dc.b	$06, $0C, nB0, nBb0, nBb0, nBb0, nBb0, nBb0, nBb0, nBb0, nBb0, nD1
	dc.b	nD1, nD1, nD1, nBb0, nBb0, nBb0, nBb0, nC1, nC1, $06, nRst, $30
	dc.b	nRst, $12, nBb0, $06, nB0, nC1, nRst, $30, nRst, $2A
	smpsJump            Mus_MTZ_Jump00

; DAC Data
Mus_MTZ_DAC:
	dc.b	dKick, $0C, dLowTom, dSnare, dFloorTom, dKick, dLowTom, dSnare, dClap, dKick, $0C, dLowTom
	dc.b	dSnare, dFloorTom, dKick, dLowTom, dSnare, dScratch, $04, $06, $02
	smpsLoop            $00, $02, Mus_MTZ_DAC

Mus_MTZ_Loop00:
	dc.b	dKick, $06, nRst, dLowTom, nRst, dSnare, nRst, dFloorTom, nRst, dKick, nRst, dLowTom
	dc.b	nRst, dSnare, nRst, dClap, nRst, dKick, nRst, dLowTom, nRst, dSnare, nRst, dFloorTom
	dc.b	nRst, dKick, nRst, dKick, $01, dLowTom, $05, nRst, $06, dSnare, nRst, dScratch
	dc.b	$05, $06, $01
	smpsLoop            $00, $0B, Mus_MTZ_Loop00
	dc.b	dKick, $06, nRst, dLowTom, nRst, dSnare, nRst, dFloorTom, nRst, dKick, nRst, dLowTom
	dc.b	nRst, dSnare, nRst, dClap, nRst, dKick, nRst, $30, nRst, $1E, dScratch, $05
	dc.b	$06, $01
	smpsJump            Mus_MTZ_Loop00

; PSG3 Data
Mus_MTZ_PSG3:
	smpsPSGform         $E7

Mus_MTZ_Loop05:
	dc.b	nRst, $0C, nAb5, nRst, nFs5, nRst, nAb5, nRst, $18
	smpsLoop            $00, $04, Mus_MTZ_Loop05

Mus_MTZ_Loop06:
	dc.b	nRst, $0C, nAb5, nRst, nFs5, nRst, nAb5, nRst, $18
	smpsLoop            $00, $17, Mus_MTZ_Loop06
	dc.b	nRst, $30, nRst
	smpsJump            Mus_MTZ_Loop06

Mus_MTZ_Voices:
;	Voice $00
;	$3C
;	$01, $01, $0E, $04, 	$8D, $52, $9F, $1F, 	$09, $00, $00, $0D
;	$00, $00, $00, $00, 	$23, $08, $02, $6F, 	$15, $80, $10, $87
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $04, $0E, $01, $01
	smpsVcRateScale     $00, $02, $01, $02
	smpsVcAttackRate    $1F, $1F, $12, $0D
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $0D, $00, $00, $09
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $06, $00, $00, $02
	smpsVcReleaseRate   $0F, $02, $08, $03
	smpsVcTotalLevel    $07, $10, $00, $15

;	Voice $01
;	$3A
;	$01, $07, $01, $01, 	$8E, $8E, $8D, $53, 	$0E, $0E, $0E, $03
;	$00, $00, $00, $00, 	$1F, $FF, $1F, $0F, 	$18, $28, $27, $80
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
	smpsVcTotalLevel    $00, $27, $28, $18

;	Voice $02
;	$3A
;	$01, $40, $01, $31, 	$1F, $1F, $1F, $1F, 	$0B, $04, $04, $04
;	$02, $04, $03, $02, 	$5F, $1F, $5F, $2F, 	$18, $05, $11, $80
	smpsVcAlgorithm     $02
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $03, $00, $04, $00
	smpsVcCoarseFreq    $01, $01, $00, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $04, $04, $04, $0B
	smpsVcDecayRate2    $02, $03, $04, $02
	smpsVcDecayLevel    $02, $05, $01, $05
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $11, $05, $18

;	Voice $03
;	$39
;	$02, $01, $02, $01, 	$1F, $1F, $1F, $1F, 	$00, $00, $00, $00
;	$00, $00, $00, $00, 	$0F, $0F, $0F, $0F, 	$1B, $32, $28, $80
	smpsVcAlgorithm     $01
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $01, $02, $01, $02
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $00, $00, $00
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $00, $00, $00, $00
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $28, $32, $1B

;	Voice $04
;	$20
;	$36, $35, $30, $31, 	$DF, $DF, $9F, $9F, 	$07, $06, $09, $06
;	$07, $06, $06, $08, 	$20, $10, $10, $F8, 	$19, $37, $13, $80
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
	smpsVcReleaseRate   $08, $00, $00, $00
	smpsVcTotalLevel    $00, $13, $37, $19
