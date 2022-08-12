Mus_FinalBoss_Header:
	smpsHeaderStartSong 2
	smpsHeaderVoice     Mus_FinalBoss_Voices
	smpsHeaderChan      $06, $03
	smpsHeaderTempo     $01, $03

	smpsHeaderDAC       Mus_FinalBoss_DAC
	smpsHeaderFM        Mus_FinalBoss_FM1,	$F4, $09
	smpsHeaderFM        Mus_FinalBoss_FM2,	$F4, $09
	smpsHeaderFM        Mus_FinalBoss_FM3,	$E8, $0C
	smpsHeaderFM        Mus_FinalBoss_FM4,	$F4, $12
	smpsHeaderFM        Mus_FinalBoss_FM5,	$F4, $12
	smpsHeaderPSG       Mus_FinalBoss_PSG1,	$D0, $05, $00, $00
	smpsHeaderPSG       Mus_FinalBoss_PSG2,	$F4, $04, $00, $00
	smpsHeaderPSG       Mus_FinalBoss_PSG3,	$FE, $02, $00, fTone_04

; FM1 Data
Mus_FinalBoss_FM1:
	smpsSetvoice        $00

Mus_FinalBoss_Loop07:
	dc.b	nBb5, $0C, nF5
	smpsAlterVol        $05
	smpsLoop            $00, $04, Mus_FinalBoss_Loop07
	smpsAlterVol        $EC
	smpsLoop            $01, $02, Mus_FinalBoss_Loop07
	smpsModSet          $12, $01, $05, $05
	smpsPan             panLeft, $00
	smpsAlterVol        $FE

Mus_FinalBoss_Loop08:
	smpsCall            Mus_FinalBoss_Call07
	smpsLoop            $00, $02, Mus_FinalBoss_Loop08
	smpsAlterVol        $02
	smpsModOff
	smpsPan             panCenter, $00
	smpsCall            Mus_FinalBoss_Call08
	smpsPan             panLeft, $00
	smpsModSet          $12, $01, $05, $05

Mus_FinalBoss_Loop09:
	smpsCall            Mus_FinalBoss_Call09
	smpsLoop            $00, $02, Mus_FinalBoss_Loop09
	smpsModOff
	smpsPan             panCenter, $00
	smpsJump            Mus_FinalBoss_Loop07

Mus_FinalBoss_Call07:
	dc.b	nRst, $60, nRst, $60, nRst, $0C, nG6, $06, nA6, nE6, $48, nRst
	dc.b	$0C, nG6, $06, nAb6, nE6, $48
	smpsReturn

Mus_FinalBoss_Call08:
	dc.b	nC6, $06, nB5, nC6, nRst, nC6, nB5, nC6, nRst, nD6, $12, $06
	dc.b	nRst, $18, nD6, $06, nC6, nD6, nRst, nD6, nC6, nD6, nRst, nE6
	dc.b	$12, $06, nRst, $18, nE6, $06, nD6, nE6, nRst, nE6, nD6, nE6
	dc.b	nRst, nE6, $12, $06, nRst, $18, nA6, $24, $03, nRst, nAb6, $36
	dc.b	$06, nRst, nAb6, nRst, nAb6, nRst, nAb6, nRst, nAb6, nRst, $2A
	smpsReturn

Mus_FinalBoss_Call09:
	dc.b	nE6, $06, nC6, nRst, nE6, nC6, nRst, nE6, nC6, nE6, nC6, nRst
	dc.b	nE6, nC6, nRst, $12, nE6, $06, nC6, nRst, nE6, nC6, nRst, nE6
	dc.b	nC6, nE6, nC6, nRst, nE6, nC6, nRst, $12, nRst, $0C, nA5, $06
	dc.b	nB5, nC6, $48, nRst, $0C, nB5, $06, nC6, nD6, $48
	smpsReturn

; FM2 Data
Mus_FinalBoss_FM2:
	smpsSetvoice        $00

Mus_FinalBoss_Loop04:
	dc.b	nA5, $0C, nE5
	smpsAlterVol        $05
	smpsLoop            $00, $04, Mus_FinalBoss_Loop04
	smpsAlterVol        $EC
	smpsLoop            $01, $02, Mus_FinalBoss_Loop04
	smpsSetvoice        $02
	smpsPan             panLeft, $00
	smpsAlterNote       $03
	smpsAlterVol        $08

Mus_FinalBoss_Loop05:
	smpsCall            Mus_FinalBoss_Call03
	smpsLoop            $00, $02, Mus_FinalBoss_Loop05
	smpsSetvoice        $00
	smpsAlterNote       $00
	smpsAlterVol        $F8
	smpsPan             panCenter, $00
	smpsCall            Mus_FinalBoss_Call05

Mus_FinalBoss_Loop06:
	smpsCall            Mus_FinalBoss_Call06
	smpsLoop            $00, $02, Mus_FinalBoss_Loop06
	smpsJump            Mus_FinalBoss_Loop04

Mus_FinalBoss_Call06:
	dc.b	nC6, $06, nA5, nRst, nC6, nA5, nRst, nC6, nA5, nC6, nA5, nRst
	dc.b	nC6, nA5, nRst, $12, nC6, $06, nA5, nRst, nC6, nA5, nRst, nC6
	dc.b	nA5, nC6, nA5, nRst, nC6, nA5, nRst, $12
	smpsAlterPitch      $F4
	smpsAlterVol        $03
	dc.b	nRst, $0C, nA5, $06, nB5, nC6, $48, nRst, $0C, nB5, $06, nC6
	dc.b	nD6, $48
	smpsAlterPitch      $0C
	smpsAlterVol        $FD
	smpsReturn

Mus_FinalBoss_Call05:
	dc.b	nA5, $06, nG5, nA5, nRst, nA5, nG5, nA5, nRst, nB5, $12, $06
	dc.b	nRst, $18, nB5, $06, nA5, nB5, nRst, nB5, nA5, nB5, nRst, nC6
	dc.b	$12, $06, nRst, $18, nC6, $06, nB5, nC6, nRst, nC6, nB5, nC6
	dc.b	nRst, nC6, $12, $06, nRst, $18, nE6, $24, $03, nRst, nE6, $36
	dc.b	$06, nRst, nE6, nRst, nE6, nRst, nE6, nRst, nE6, nRst, $2A
	smpsReturn

; FM3 Data
Mus_FinalBoss_FM3:
	smpsSetvoice        $01
	smpsModSet          $13, $01, $03, $05

Mus_FinalBoss_Jump01:
	dc.b	nRst, $60, nRst

Mus_FinalBoss_Loop03:
	smpsCall            Mus_FinalBoss_Call00
	smpsLoop            $00, $02, Mus_FinalBoss_Loop03
	smpsCall            Mus_FinalBoss_Call01
	smpsCall            Mus_FinalBoss_Call04
	dc.b	nF4, $54, nG4, $06, nA4, nE4, $60
	smpsCall            Mus_FinalBoss_Call04
	dc.b	nF4, $60, nG4
	smpsJump            Mus_FinalBoss_Jump01

Mus_FinalBoss_Call04:
	dc.b	nA4, $18, nE4, $0C, nA4, nAb4, $18, nE4, nG4, nA4, $0C, nG4
	dc.b	nFs4, $18, nD4
	smpsReturn

Mus_FinalBoss_Call00:
	dc.b	nA4, $0C, nC5, nE5, nA4, nAb4, nC5, nE5, nAb4, nG4, nB4, nD5
	dc.b	nG4, nFs4, nA4, nC5, nFs4, nF4, nA4, nC5, nA4, nE5, nA4, nC5
	dc.b	nF4, nE4, nAb4, nB4, nAb4, nD5, nAb4, nB4, nE4
	smpsReturn

Mus_FinalBoss_Call01:
	dc.b	nF4, $24, nC5, $0C, nB4, $24, nA4, $0C, nG4, $24, nD5, $0C
	dc.b	nC5, $24, $06, nD5, nE5, $24, $06, $2A, nC5, $06, nD5, nE5
	dc.b	$24, nF5, $06, nE5, $36, smpsNoAttack, $30, nRst
	smpsReturn

; FM4 Data
Mus_FinalBoss_FM4:
	smpsSetvoice        $02
	smpsModSet          $12, $01, $05, $05

Mus_FinalBoss_Jump00:
	dc.b	nRst, $60, nRst

Mus_FinalBoss_Loop01:
	smpsCall            Mus_FinalBoss_Call03
	smpsLoop            $00, $02, Mus_FinalBoss_Loop01

Mus_FinalBoss_Loop02:
	dc.b	nRst, $60
	smpsLoop            $00, $05, Mus_FinalBoss_Loop02
	smpsCall            Mus_FinalBoss_Call02
	dc.b	nC6, $54, nD6, $06, nC6, nB5, $60
	smpsCall            Mus_FinalBoss_Call02
	dc.b	nC6, $60, nD6
	smpsJump            Mus_FinalBoss_Jump00

Mus_FinalBoss_Call02:
	dc.b	nA5, $24, nAb5, $06, nA5, nB5, $24, nA5, $06, nB5, nC6, $24
	dc.b	nB5, $06, nC6, nD6, $24, nC6, $06, nD6
	smpsReturn

Mus_FinalBoss_Call03:
	dc.b	nA5, $18, nC6, nD6, $24, nB5, $0C, nC6, $24, nA5, $0C, nB5
	dc.b	$18, nG5, nA5, $60, nRst
	smpsReturn

; FM5 Data
Mus_FinalBoss_FM5:
	smpsSetvoice        $01
	smpsAlterNote       $01
	smpsPan             panRight, $00
	smpsModSet          $13, $01, $03, $05
	dc.b	nRst, $60, nRst

Mus_FinalBoss_Loop00:
	smpsCall            Mus_FinalBoss_Call00
	smpsLoop            $00, $02, Mus_FinalBoss_Loop00
	smpsCall            Mus_FinalBoss_Call01
	smpsPan             panLeft, $00
	smpsSetvoice        $02
	smpsAlterNote       $03
	smpsCall            Mus_FinalBoss_Call02
	dc.b	nC6, $54, nD6, $06, nC6, nB5, $60
	smpsCall            Mus_FinalBoss_Call02
	dc.b	nC6, $60, nD6
	smpsJump            Mus_FinalBoss_FM5

; PSG1 Data
Mus_FinalBoss_PSG1:
	smpsModSet          $12, $01, $01, $04
	smpsAlterNote       $02

Mus_FinalBoss_Jump04:
	dc.b	nRst, $60, nRst, $60

Mus_FinalBoss_Loop0A:
	smpsCall            Mus_FinalBoss_Call07
	smpsLoop            $00, $02, Mus_FinalBoss_Loop0A

Mus_FinalBoss_Loop0B:
	dc.b	nRst, $60
	smpsLoop            $00, $05, Mus_FinalBoss_Loop0B

Mus_FinalBoss_Loop0C:
	dc.b	nRst, $60, nRst, nRst, $0C, nA5, $06, nB5, nC6, $48, nRst, $0C
	dc.b	nB5, $06, nC6, nD6, $48
	smpsLoop            $00, $02, Mus_FinalBoss_Loop0C
	smpsJump            Mus_FinalBoss_Jump04

; PSG2 Data
Mus_FinalBoss_PSG2:
	smpsPSGvoice        fTone_08
	smpsModSet          $0C, $01, $01, $03

Mus_FinalBoss_Jump03:
	dc.b	nRst, $60
	smpsLoop            $00, $0F, Mus_FinalBoss_PSG2
	smpsCall            Mus_FinalBoss_Call04
	dc.b	nF4, $54, nG4, $06, nA4, nE4, $60
	smpsCall            Mus_FinalBoss_Call04
	dc.b	nF4, $60, nG4
	smpsJump            Mus_FinalBoss_Jump03

; PSG3 Data
Mus_FinalBoss_PSG3:
	smpsPSGform         $E7
	smpsNoteFill        $06

Mus_FinalBoss_Jump02:
	dc.b	nBb5, $18, $18, $18, $0C, $0C
	smpsJump            Mus_FinalBoss_Jump02

; DAC Data
Mus_FinalBoss_DAC:
	dc.b	dKick, $0C, dSnare, $04, dSnare, dSnare
	smpsLoop            $00, $03, Mus_FinalBoss_DAC
	dc.b	dMidTimpani, $0C, dLowTimpani
	smpsJump            Mus_FinalBoss_DAC

Mus_FinalBoss_Voices:
;	Voice $00
;	$3A
;	$01, $07, $01, $01, 	$8E, $8E, $8D, $53, 	$0E, $0E, $0E, $03
;	$00, $00, $00, $01, 	$1F, $FF, $1F, $0F, 	$17, $28, $27, $80
	smpsVcAlgorithm     $02
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $01, $01, $07, $01
	smpsVcRateScale     $01, $02, $02, $02
	smpsVcAttackRate    $13, $0D, $0E, $0E
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $03, $0E, $0E, $0E
	smpsVcDecayRate2    $01, $00, $00, $00
	smpsVcDecayLevel    $00, $01, $0F, $01
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $27, $28, $17

;	Voice $01
;	$3D
;	$01, $01, $01, $01, 	$8E, $52, $14, $4C, 	$08, $08, $0E, $03
;	$00, $03, $03, $03, 	$1F, $1F, $1F, $1F, 	$18, $80, $80, $60
	smpsVcAlgorithm     $05
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $01, $01, $01, $01
	smpsVcRateScale     $01, $00, $01, $02
	smpsVcAttackRate    $0C, $14, $12, $0E
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $03, $0E, $08, $08
	smpsVcDecayRate2    $03, $03, $03, $00
	smpsVcDecayLevel    $01, $01, $01, $01
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $60, $00, $00, $18

;	Voice $02
;	$3D
;	$01, $21, $51, $01, 	$12, $14, $14, $0F, 	$05, $05, $05, $05
;	$00, $00, $00, $00, 	$2F, $2F, $2F, $1F, 	$1E, $80, $80, $80
	smpsVcAlgorithm     $05
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $05, $02, $00
	smpsVcCoarseFreq    $01, $01, $01, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $0F, $14, $14, $12
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $05, $05, $05, $05
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $01, $02, $02, $02
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $00, $00, $1E