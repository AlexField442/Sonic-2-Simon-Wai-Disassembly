Mus_HPZ_Header:
	smpsHeaderStartSong 2
	smpsHeaderVoice     Mus_HPZ_Voices
	smpsHeaderChan      $06, $03
	smpsHeaderTempo     $01, $0C

	smpsHeaderDAC       Mus_HPZ_DAC
	smpsHeaderFM        Mus_HPZ_FM1,	$00, $10
	smpsHeaderFM        Mus_HPZ_FM2,	$18, $10
	smpsHeaderFM        Mus_HPZ_FM3,	$00, $10
	smpsHeaderFM        Mus_HPZ_FM4,	$00, $10
	smpsHeaderFM        Mus_HPZ_FM5,	$00, $08
	smpsHeaderPSG       Mus_HPZ_PSG1,	$DC, $03, $00, fTone_0C
	smpsHeaderPSG       Mus_HPZ_PSG2,	$E8, $00, $00, fTone_02
	smpsHeaderPSG       Mus_HPZ_PSG3,	$DC, $03, $00, fTone_0C

Mus_HPZ_Call01:
	dc.b	nG4, $08, nA4, nB4
	smpsReturn

Mus_HPZ_Call02:
	dc.b	nF4, $30, smpsNoAttack, $30, smpsNoAttack, nF4, nRst, $18, nG4, $08, nA4, nB4
	dc.b	nF4, $30, smpsNoAttack, $30, smpsNoAttack, $30, smpsNoAttack, $24
	smpsReturn

Mus_HPZ_Call00:
	dc.b	nRst, $30, nRst, nB4, $06, nC5, nB4, nG4, nA4, nF4, $0C, nG4
	dc.b	nD4, nD4, $06, nF4, $0C, nG4
	smpsReturn

Mus_HPZ_Call03:
	dc.b	nB4, $30, smpsNoAttack, $30, nC5, smpsNoAttack, $24, nB4, $06, nC5, nD5, $30
	dc.b	smpsNoAttack, $30, nB4, smpsNoAttack, $30, $30, smpsNoAttack, $30, nC5, smpsNoAttack, $24, nB4
	dc.b	$06, nC5, nD5, $30, smpsNoAttack, $30, nF5, smpsNoAttack, $30, nG5, $24, nF5
	dc.b	nE5, $18, nF5, $24, nE5, nC5, $18, $24, nB4, nD5, $18, smpsNoAttack
	dc.b	$30, smpsNoAttack, $30
	smpsReturn

; FM2 Data
Mus_HPZ_FM2:
	dc.b	nRst, $18
	smpsSetvoice        $00

Mus_HPZ_Jump05:
	dc.b	nG1, $0C, nD1, nF1, nD1, $06, nG1, $05, nG1, $07, $06, nD1
	dc.b	$0C, nF1, nD1
	smpsJump            Mus_HPZ_Jump05

; FM1 Data
Mus_HPZ_FM1:
	smpsSetvoice        $02
	smpsAlterVol        $14
	smpsCall            Mus_HPZ_Call01

Mus_HPZ_Jump04:
	smpsCall            Mus_HPZ_Call02
	smpsModSet          $30, $01, $FA, $04
	dc.b	nRst, $0C
	smpsAlterVol        $EC
	smpsSetvoice        $03
	smpsCall            Mus_HPZ_Call03
	dc.b	nG5, $24, nF5, nE5, $18, nF5, $24, nE5, nC5, $18, nC5, nD5
	dc.b	$0C, nB4, $30, smpsNoAttack, $0C, smpsNoAttack, $30, smpsNoAttack, $30, nRst, $30, nRst
	dc.b	nRst, nRst, nA4, $24, nC5, nE5, $18, nD5, $24, nB4, nG4, $18
	dc.b	nF4, nD4, $0C, nG4, $30, smpsNoAttack, $0C, smpsNoAttack, $30, smpsNoAttack, $30, nA4
	dc.b	$24, nC5, nE5, $18, nD5, $24, nB4, nG4, $18, nG5, $30, smpsNoAttack
	dc.b	$30, smpsNoAttack, $30, smpsNoAttack, $18
	smpsModOff
	smpsAlterVol        $14
	smpsSetvoice        $02
	dc.b	nE4, $08, nF4, nG4
	smpsJump            Mus_HPZ_Jump04

; PSG1 Data
Mus_HPZ_PSG1:
	dc.b	nRst, $18

Mus_HPZ_Jump07:
	dc.b	nRst, $30, nRst, nRst, nRst, nRst, nRst, nRst, nRst
	smpsCall            Mus_HPZ_Call03
	dc.b	nB5, $24, nA5, nG5, $18, nA5, $24, nG5, nE5, $18, nE5, nF5
	dc.b	$0C, nD5, $30, smpsNoAttack, $0C, smpsNoAttack, $30, smpsNoAttack, $30, nRst, $30, nRst
	dc.b	nRst, nRst, nC5, $24, nE5, nG5, $18, nF5, $24, nD5, nB4, $18
	dc.b	nB4, nC5, $0C, nB4, $30, smpsNoAttack, $0C, smpsNoAttack, $30, smpsNoAttack, $30, nC5
	dc.b	$24, nE5, nG5, $18, nF5, $24, nD5, nB4, $18, nB5, $30, smpsNoAttack
	dc.b	$30, smpsNoAttack, $30, smpsNoAttack, $30
	smpsJump            Mus_HPZ_Jump07

; FM3 Data
Mus_HPZ_FM3:
	smpsSetvoice        $02
	smpsModSet          $18, $01, $04, $06
	smpsPan             panLeft, $00
	smpsCall            Mus_HPZ_Call01

Mus_HPZ_Jump03:
	smpsCall            Mus_HPZ_Call02
	smpsSetvoice        $01
	dc.b	nA3, $0C, nB3, $06, nRst, $30, nRst, $2A, nRst, $30, nRst, $24
	dc.b	nC4, $0C, nB3, $06, nRst, $30, nRst, $2A, nRst, $30, nRst, $24
	dc.b	nA3, $0C, nB3, $06, nRst, $30, nRst, $2A, nRst, $30, nRst, $24
	dc.b	nC4, $0C, nB3, $06, nRst, $30, nRst, $2A, nRst, $30, nRst, nRst
	dc.b	nRst, nG4, $24, nF4, nE4, $18, nF4, $24, nE4, nC4, $18, $24
	dc.b	nB3, nD4, $18, smpsNoAttack, $30, smpsNoAttack, $30, nB4, $24, nA4, nG4, $18
	dc.b	nA4, $24, nG4, nE4, $18, nE4, nF4, $0C, nD4, $24
	smpsSetvoice        $02
	smpsCall            Mus_HPZ_Call01
	dc.b	nF4, $30, smpsNoAttack, $30, smpsNoAttack, $30, smpsNoAttack, $18, nRst, $18
	smpsSetvoice        $01
	dc.b	nRst, $30, nRst, nRst, nRst, $24, nG4, $06, nF4, nG4, $0C, nG4
	dc.b	nF4, $06, nG4, $0C, $06, nRst, $24, $06, nF4, nG4, $0C, nG4
	dc.b	nF4, $06, nG4, $0C, $06, nRst, $30, nRst, $30, nRst, nRst, nRst
	dc.b	$24, $06, nF4, nG4, $0C, nG4, nF4, $06, nG4, $0C, $06, nRst
	dc.b	$24, $06, nF4, nG4, $0C, nG4, nF4, $06, nG4, $0C, $06, nRst
	dc.b	$18
	smpsSetvoice        $02
	smpsCall            Mus_HPZ_Call01
	smpsJump            Mus_HPZ_Jump03

; FM4 Data
Mus_HPZ_FM4:
	dc.b	nRst, $01
	smpsSetvoice        $02
	smpsModSet          $18, $01, $04, $06
	smpsPan             panRight, $00
	smpsCall            Mus_HPZ_Call01

Mus_HPZ_Jump02:
	smpsCall            Mus_HPZ_Call02
	smpsAlterNote       $FA
	smpsSetvoice        $01
	dc.b	nF3, $0B, nG3, $06, nRst, $30, nRst, $2A, nRst, $30, nRst, $24
	dc.b	nA3, $0C, nG3, $06, nRst, $30, nRst, $2A, nRst, $30, nRst, $24
	dc.b	nF3, $0C, nG3, $06, nRst, $30, nRst, $2A, nRst, $30, nRst, $24
	dc.b	nA3, $0C, nG3, $06, nRst, $30, nRst, $2A, nRst, $30, nRst, nRst
	dc.b	nRst, nG4, $24, nF4, nE4, $18, nF4, $24, nE4, nC4, $18, $24
	dc.b	nB3, nD4, $18, smpsNoAttack, $30, smpsNoAttack, $30, nG4, $24, nF4, nE4, $18
	dc.b	nF4, $24, nE4, nC4, $18, nC4, nD4, $0C, nB3, $24
	smpsSetvoice        $02
	smpsCall            Mus_HPZ_Call01
	dc.b	nF4, $30, smpsNoAttack, $30, smpsNoAttack, $30, smpsNoAttack, $18, nRst, $18
	smpsSetvoice        $01
	dc.b	nRst, $30, nRst, $30, nRst, $30, nRst, $24, nD4, $06, nC4, nD4
	dc.b	$0C, nD4, nC4, $06, nD4, $0C, $06, nRst, $24, $06, nC4, nD4
	dc.b	$0C, nD4, nC4, $06, nD4, $0C, $06, nRst, $30, nRst, $30, nRst
	dc.b	nRst, nRst, $24, $06, nC4, nD4, $0C, nD4, nC4, $06, nD4, $0C
	dc.b	$06, nRst, $24, $06, nC4, nD4, $0C, nD4, nD4, $06, nC4, $0C
	dc.b	$06, nRst, $19
	smpsSetvoice        $02
	smpsCall            Mus_HPZ_Call01
	smpsJump            Mus_HPZ_Jump02

; FM5 Data
Mus_HPZ_FM5:
	dc.b	nRst, $18

Mus_HPZ_Jump01:
	smpsSetvoice        $04
	smpsNoteFill        $04
	smpsCall            Mus_HPZ_Call00
	smpsCall            Mus_HPZ_Call00

Mus_HPZ_Loop00:
	dc.b	nB4, $0C, nB4, nB4, $06, nRst, $12, nA4, $0C, nA4, nB4, $06
	dc.b	nRst, $12, $0C, $06, nB4, $0C, nB4, nB4, $06, nA4, $0C, nC5
	dc.b	nB4, $06, nRst, $12
	smpsLoop            $00, $09, Mus_HPZ_Loop00

Mus_HPZ_Loop01:
	dc.b	nA4, $0C, nA4, nA4, $06, nRst, $12, nG4, $0C, nG4, nA4, $06
	dc.b	nRst, $12, nG4, $0C, $06, nG4, $0C, nG4, nG4, $06, nG4, $0C
	dc.b	nE4, nG4, $06, nRst, $12, nB4, $0C, nB4, nB4, $06, nRst, $12
	dc.b	nA4, $0C, nA4, nB4, $06, nRst, $12, $0C, $06, nB4, $0C, nB4
	dc.b	nB4, $06, nA4, $0C, nC5, nB4, $06, nRst, $12
	smpsLoop            $00, $02, Mus_HPZ_Loop01
	smpsJump            Mus_HPZ_Jump01

; PSG2 Data
Mus_HPZ_PSG2:
	smpsAlterNote       $01
	dc.b	nRst, $18

Mus_HPZ_Jump06:
	smpsCall            Mus_HPZ_Call00
	smpsCall            Mus_HPZ_Call00

Mus_HPZ_Loop02:
	dc.b	nG4, $0C, nG4, nG4, $06, nRst, $12, nF4, $0C, nF4, nG4, $06
	dc.b	nRst, $12, $0C, $06, nG4, $0C, nG4, nG4, $06, nF4, $0C, nA4
	dc.b	nG4, $06, nRst, $12
	smpsLoop            $00, $09, Mus_HPZ_Loop02

Mus_HPZ_Loop03:
	dc.b	nF4, $0C, nF4, nF4, $06, nRst, $12, nE4, $0C, nE4, nF4, $06
	dc.b	nRst, $12, nE4, $0C, $06, nE4, $0C, nE4, nE4, $06, nE4, $0C
	dc.b	nC4, nE4, $06, nRst, $12, nG4, $0C, nG4, nG4, $06, nRst, $12
	dc.b	nF4, $0C, nF4, nG4, $06, nRst, $12, $0C, $06, nG4, $0C, nG4
	dc.b	nG4, $06, nF4, $0C, nA4, nG4, $06, nRst, $12
	smpsLoop            $00, $02, Mus_HPZ_Loop03
	smpsJump            Mus_HPZ_Jump06

; DAC Data
Mus_HPZ_DAC:
	dc.b	nRst, $18

Mus_HPZ_Jump00:
	dc.b	dMidTom, $0C, $06, dLowTom, dSnare, $0C, dLowTom, $06, dFloorTom, dFloorTom, $0C, $06
	dc.b	dFloorTom, dSnare, $0C, dMidTom, $06, dFloorTom
	smpsJump            Mus_HPZ_Jump00

; PSG3 Data
Mus_HPZ_PSG3:
	smpsAlterNote       $FE
	smpsJump            Mus_HPZ_PSG1

Mus_HPZ_Voices:
;	Voice $00
;	$3A
;	$69, $70, $50, $60, 	$1C, $18, $1A, $18, 	$10, $0C, $02, $09
;	$08, $06, $06, $03, 	$F9, $56, $06, $06, 	$28, $15, $14, $00
	smpsVcAlgorithm     $02
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $06, $05, $07, $06
	smpsVcCoarseFreq    $00, $00, $00, $09
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $18, $1A, $18, $1C
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $09, $02, $0C, $10
	smpsVcDecayRate2    $03, $06, $06, $08
	smpsVcDecayLevel    $00, $00, $05, $0F
	smpsVcReleaseRate   $06, $06, $06, $09
	smpsVcTotalLevel    $00, $14, $15, $28

;	Voice $01
;	$3D
;	$01, $21, $51, $01, 	$12, $14, $14, $0F, 	$0A, $05, $05, $05
;	$00, $00, $00, $00, 	$26, $28, $28, $18, 	$19, $00, $00, $00
	smpsVcAlgorithm     $05
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $05, $02, $00
	smpsVcCoarseFreq    $01, $01, $01, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $0F, $14, $14, $12
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $05, $05, $05, $0A
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $01, $02, $02, $02
	smpsVcReleaseRate   $08, $08, $08, $06
	smpsVcTotalLevel    $00, $00, $00, $19

;	Voice $02
;	$3D
;	$00, $01, $02, $01, 	$4C, $0F, $50, $12, 	$0C, $02, $00, $05
;	$01, $00, $00, $00, 	$28, $29, $2A, $19, 	$1D, $00, $06, $00
	smpsVcAlgorithm     $05
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $01, $02, $01, $00
	smpsVcRateScale     $00, $01, $00, $01
	smpsVcAttackRate    $12, $10, $0F, $0C
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $05, $00, $02, $0C
	smpsVcDecayRate2    $00, $00, $00, $01
	smpsVcDecayLevel    $01, $02, $02, $02
	smpsVcReleaseRate   $09, $0A, $09, $08
	smpsVcTotalLevel    $00, $06, $00, $1D

;	Voice $03
;	$2C
;	$71, $73, $31, $32, 	$1F, $12, $1F, $12, 	$00, $0A, $00, $0A
;	$00, $05, $00, $05, 	$00, $17, $00, $17, 	$14, $03, $14, $03
	smpsVcAlgorithm     $04
	smpsVcFeedback      $05
	smpsVcUnusedBits    $00
	smpsVcDetune        $03, $03, $07, $07
	smpsVcCoarseFreq    $02, $01, $03, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $12, $1F, $12, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $0A, $00, $0A, $00
	smpsVcDecayRate2    $05, $00, $05, $00
	smpsVcDecayLevel    $01, $00, $01, $00
	smpsVcReleaseRate   $07, $00, $07, $00
	smpsVcTotalLevel    $03, $14, $03, $14

;	Voice $04
;	$04
;	$73, $01, $71, $34, 	$4D, $91, $9F, $97, 	$0A, $07, $08, $08
;	$04, $00, $05, $00, 	$F4, $F6, $F3, $F6, 	$1D, $05, $23, $0B
	smpsVcAlgorithm     $04
	smpsVcFeedback      $00
	smpsVcUnusedBits    $00
	smpsVcDetune        $03, $07, $00, $07
	smpsVcCoarseFreq    $04, $01, $01, $03
	smpsVcRateScale     $02, $02, $02, $01
	smpsVcAttackRate    $17, $1F, $11, $0D
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $08, $08, $07, $0A
	smpsVcDecayRate2    $00, $05, $00, $04
	smpsVcDecayLevel    $0F, $0F, $0F, $0F
	smpsVcReleaseRate   $06, $03, $06, $04
	smpsVcTotalLevel    $0B, $23, $05, $1D