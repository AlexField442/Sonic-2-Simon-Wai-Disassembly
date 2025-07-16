Mus_DEZ_Header:
	smpsHeaderStartSong 2
	smpsHeaderVoice     Mus_DEZ_Voices
	smpsHeaderChan      $06, $03
	smpsHeaderTempo     $01, $03

	smpsHeaderDAC       Mus_DEZ_DAC
	smpsHeaderFM        Mus_DEZ_FM1,	$00, $14
	smpsHeaderFM        Mus_DEZ_FM2,	$0C, $18
	smpsHeaderFM        Mus_DEZ_FM3,	$00, $18
	smpsHeaderFM        Mus_DEZ_FM4,	$00, $0C
	smpsHeaderFM        Mus_DEZ_FM5,	$00, $00
	smpsHeaderPSG       Mus_DEZ_PSG1,	$DC, $06, $00, fTone_0B
	smpsHeaderPSG       Mus_DEZ_PSG2,	$DC, $06, $00, fTone_0B
	smpsHeaderPSG       Mus_DEZ_PSG3,	$00, $03, $00, fTone_01

; FM1 Data
Mus_DEZ_FM1:
	smpsSetvoice        $00

Mus_DEZ_Jump04:
	dc.b	nA5, $06, nG5, nBb5, nFs5, nA5, nF5, nAb5, nFs5, nB5, nF5, nA5
	dc.b	nG5, nBb5, nFs5, nAb5, nF5, nA5, nG5, nB5, nF5, nBb5, nFs5, nC6
	dc.b	nF5, nBb5, nG5, nB5, nFs5, nA5, nF5, nAb5, nFs5, nBb5, nE5, nG5
	dc.b	nEb5, nA5, nF5, nBb5, nFs5, nB5, nG5, nA5, nF5, nAb5, nFs5, nBb5
	dc.b	nG5, nB5, nAb5, nC6, nA5, nCs6, nG5, nC6, nF5, nB5, nFs5, nBb5
	dc.b	nG5, nA5, nF5, nAb5, nE5, nG5, nEb5, nA5, nF5, nBb5, nFs5, nB5
	dc.b	nG5, nC6, nAb5, nEb6, nG5, nD6, nF5, nC6, nG5, nB5, nFs5, nBb5
	dc.b	nG5, nA5, nF5, nAb5, nFs5, nB5, nF5, nA5, nG5, nBb5, nFs5, nC6
	dc.b	nF5, nBb5, nFs5, nB5, nF5, nA5, nE5, nAb5, nEb5, nA5, nE5, nBb5
	dc.b	nF5, nB5, nFs5, nC6, nG5, nD6, nF5, nBb5, nFs5, nA5, nG5, nB5
	dc.b	nFs5, nBb5, nF5, nB5, nE5, nA5, nF5, nBb5, nG5, nB5, nFs5, nA5
	dc.b	nF5, nBb5, nFs5, nC6, nE5, nD6, nEb5, nCs6, nF5, nC6, nFs5, nB5
	dc.b	nF5, nBb5, nG5, nA5, nFs5, nAb5, nF5, nA5, nFs5, nBb5, nG5, nB5
	dc.b	nAb5, nC6, nF5, nA5, nFs5, nBb5, nF5, nB5, nE5, nC6, nF5, nB5
	dc.b	nFs5, nA5, nG5, nBb5, nFs5, nAb5, nF5, nA5, nG5, nBb5, nFs5, nB5
	dc.b	nF5, nC6, nE5, nBb5, nF5, nA5, nFs5, nB5, nG5, nAb5, nF5, nA5
	dc.b	nFs5, nBb5, nF5, nB5, nE5, nC6, nEb5, nCs6, nE5, nBb5, nF5, nA5
	dc.b	nFs5, nAb5, nG5, nB5, nF5, nA5, nFs5, nBb5, nG5, nAb5, nF5, nB5
	dc.b	nE5, nC6, nEb5, nBb5, nF5, nA5, nFs5, nB5, nG5, nBb5, nF5, nA5
	dc.b	nFs5, nAb5, nG5, nB5, nF5, nBb5, nFs5, nC6, nD5, nB5, nF5, nA5
	dc.b	nFs5, nBb5, nG5, nAb5, nFs5, nA5, nF5, nBb5, nE5, nB5, nEb5, nC6
	dc.b	nF5, nCs6, nFs5, nB5, nG5, nBb5, nFs5, nA5, nF5, nAb5, nEb5, nG5
	dc.b	nF5, nA5, nFs5, nBb5, nG5, nB5, nAb5, nC6, nG5, nBb5, nFs5, nA5
	dc.b	nG5, nB5, nF5, nBb5, nFs5, nA5, nG5, nB5, nF5, nBb5, nFs5, nA5
	dc.b	nF5
	smpsJump            Mus_DEZ_Jump04

; FM2 Data
Mus_DEZ_FM2:
	smpsSetvoice        $01
	smpsModSet          $0C, $01, $03, $04

Mus_DEZ_Jump03:
	smpsAlterPitch      $F4
	dc.b	nRst, $18, nRst, $0C, nRst, $18, nRst, $0C, nRst, nEb6, $03, nCs6
	dc.b	nA5, nRst, nEb6, nCs6, nA5, nRst, nRst, $0C, nEb6, $03, nCs6, nA5
	dc.b	nRst, nEb6, nCs6, nA5, nRst, nRst, $18, nRst, $0C, nRst, $18, nRst
	dc.b	$0C, nRst, nEb6, $03, nCs6, nA5, nRst, nEb6, nCs6, nA5, nRst, nRst
	dc.b	$0C, nEb6, $03, nCs6, nA5, nRst, nEb6, nCs6, nA5, nRst
	smpsAlterPitch      $0C
	dc.b	nA4, $18, nB4, $0C, nCs5, $18, nA4, $0C, nE5, $12, nFs5, $06
	dc.b	nE5, $0C, nCs5, $18, nA4, $0C, nA5, $18, smpsNoAttack, $0C, nFs5, $18
	dc.b	smpsNoAttack, $0C, nE5, $18, smpsNoAttack, $0C, nCs5, $18, smpsNoAttack, $0C, nA4, $18
	dc.b	nB4, $0C, nCs5, $18, nA4, $0C, nE5, $12, nFs5, $06, nE5, $0C
	dc.b	nCs5, $18, nA4, $0C, nA5, $18, smpsNoAttack, $0C, smpsNoAttack, nA5, nFs5, nAb5
	dc.b	nA5, $18, smpsNoAttack, $0C, smpsNoAttack, $18, smpsNoAttack, $0C, nA4, $18, nB4, $0C
	dc.b	nCs5, $18, nA4, $0C, nE5, $12, nFs5, $06, nE5, $0C, nCs5, $18
	dc.b	nA4, $0C, nA5, $18, nFs5, $06, nA5, nFs5, $18, nE5, $06, nFs5
	dc.b	nE5, $18, smpsNoAttack, $0C, nFs5, $18, nCs5, $0C, nA4, $18, nB4, $0C
	dc.b	nCs5, $18, nA4, $0C, nE5, $12, nFs5, $06, nE5, $0C, nCs5, $18
	dc.b	nA4, $0C, smpsNoAttack, nA5, $18, smpsNoAttack, $0C, smpsNoAttack, $18, smpsNoAttack, $0C, smpsNoAttack
	dc.b	$18, smpsNoAttack, $0C, smpsNoAttack, $18, smpsNoAttack, $0C

Mus_DEZ_Loop02:
	dc.b	nE6, $06, nD6, nCs6, $18
	smpsLoop            $00, $03, Mus_DEZ_Loop02
	dc.b	nE6, $06, nD6, nCs6, $0C, nA5, nCs6, $18, smpsNoAttack, $0C, smpsNoAttack, $18
	dc.b	nRst, $0C, nRst, $18, nRst, $0C, nRst, $18, nRst, $0C
	smpsJump            Mus_DEZ_Jump03

; FM3 Data
Mus_DEZ_FM3:
	smpsSetvoice        $01
	smpsModSet          $0C, $01, $02, $04
	smpsPan             panLeft, $00

Mus_DEZ_Jump02:
	smpsAlterPitch      $F4
	dc.b	nRst, $18, nRst, $0C, nRst, $18, nRst, $0C, nRst, nEb6, $03, nCs6
	dc.b	nA5, $06, nEb6, $03, nCs6, nA5, $06, nRst, $0C, nEb6, $03, nCs6
	dc.b	nA5, $06, nEb6, $03, nCs6, nA5, $06, nRst, $18, nRst, $0C, nRst
	dc.b	$18, nRst, $0C, nRst, nEb6, $03, nCs6, nA5, $06, nEb6, $03, nCs6
	dc.b	nA5, $06, nRst, $0C, nEb6, $03, nCs6, nA5, $06, nEb6, $03, nCs6
	dc.b	nA5, $06
	smpsAlterPitch      $0C
	dc.b	nA4, $18, nB4, $0C, nCs5, $18, nA4, $0C, nE5, $12, nFs5, $06
	dc.b	nE5, $0C, nCs5, $18, nA4, $0C, nA5, $18, smpsNoAttack, $0C, nFs5, $18
	dc.b	smpsNoAttack, $0C, nE5, $18, smpsNoAttack, $0C, nCs5, $18, smpsNoAttack, $0C, nA4, $18
	dc.b	nB4, $0C, nCs5, $18, nA4, $0C, nE5, $12, nFs5, $06, nE5, $0C
	dc.b	nCs5, $18, nA4, $0C, nA5, $18, smpsNoAttack, $0C, smpsNoAttack, nA5, nFs5, nAb5
	dc.b	nA5, $18, smpsNoAttack, $0C, smpsNoAttack, $18, smpsNoAttack, $0C, nCs5, $18, nD5, $0C
	dc.b	nE5, $18, nCs5, $0C, nAb5, $12, nA5, $06, nAb5, $0C, nE5, $18
	dc.b	nCs5, $0C, nCs6, $18, nA5, $06, nCs6, nA5, $18, nAb5, $06, nA5
	dc.b	nAb5, $18, smpsNoAttack, $0C, nA5, $18, nE5, $0C, nCs5, $18, nD5, $0C
	dc.b	nE5, $18, nCs5, $0C, nAb5, $12, nA5, $06, nAb5, $0C, nE5, $18
	dc.b	nCs5, $0C, smpsNoAttack, nCs6, $18, smpsNoAttack, $0C, smpsNoAttack, $18, smpsNoAttack, $0C, smpsNoAttack
	dc.b	$18, smpsNoAttack, $0C, smpsNoAttack, $18, smpsNoAttack, $0C

Mus_DEZ_Loop01:
	dc.b	nCs6, $06, nB5, nA5, $18
	smpsLoop            $00, $03, Mus_DEZ_Loop01
	dc.b	nCs6, $06, nB5, nA5, $0C, nFs5, nA5, $18, smpsNoAttack, $0C, smpsNoAttack, $18
	dc.b	nRst, $0C, nRst, $18, nRst, $0C, nRst, $18, nRst, $0C
	smpsJump            Mus_DEZ_Jump02

; FM4 Data
Mus_DEZ_FM4:
	smpsSetvoice        $03

Mus_DEZ_Jump01:
	smpsAlterPitch      $0C
	dc.b	nRst, $18, nRst, $0C, nRst, $18, nRst, $0C, nRst, nEb6, $03, nCs6
	dc.b	nA5, nRst, nEb6, nCs6, nA5, nRst, nRst, $0C, nEb6, $03, nCs6, nA5
	dc.b	nRst, nEb6, nCs6, nA5, nRst, nRst, $18, nRst, $0C, nRst, $18, nRst
	dc.b	$0C, nRst, nEb6, $03, nCs6, nA5, nRst, nEb6, nCs6, nA5, nRst, nRst
	dc.b	$0C, nEb6, $03, nCs6, nA5, nRst, nEb6, nCs6, nA5, nRst
	smpsAlterPitch      $F4
	dc.b	nA2, $06, nRst, $18, nRst, $06, nRst, $0C, nRst, $12, nAb2, $06
	dc.b	nA2, nA2, $03, nRst, $0F, nRst, $0C, nRst, $18, nRst, $0C, $06
	dc.b	nRst, $18, nRst, $06, nRst, $0C, nRst, $12, nAb2, $06, nA2, nA2
	dc.b	nRst, $0C, nRst, nRst, nA4, $06, nB4, nC5, nCs5, nA2, $06, nRst
	dc.b	$18, nRst, $06, nRst, $0C, nRst, $12, nAb2, $06, nA2, nA2, $03
	dc.b	nRst, $0F, nRst, $0C, nRst, $18, nRst, $0C, $06, nRst, $18, nRst
	dc.b	$06, nRst, $0C, nRst, $12, nAb2, $06, nA2, nA2, nA4, nB4, nC5
	dc.b	nCs5, nRst, $0C, nA4, $06, nB4, nC5, nCs5, nA2, $06, nRst, $18
	dc.b	nRst, $06, nRst, $0C, nRst, $12, nAb2, $06, nA2, nA2, nRst, $18
	dc.b	nRst, nRst, $0C, $06, nRst, $18, nRst, $06, nRst, $0C, nRst, $12
	dc.b	nAb2, $06, nA2, nA2, nRst, $18, nRst, $0C, nA4, $06, nB4, nC5
	dc.b	nCs5, nA2, $06, nRst, $18, nRst, $06, nRst, $0C, nRst, $12, nAb2
	dc.b	$06, nA2, nA2, $03, nRst, $0F, nRst, $0C, nRst, $18, nRst, $0C
	dc.b	$06, nRst, $18, nRst, $06, nRst, $0C, nRst, $12, nAb2, $06, nA2
	dc.b	nA2, nA4, nB4, nC5, nCs5, nRst, $0C, nA4, $06, nB4, nC5, nCs5
	dc.b	nA2, $06, nRst, $06, nA4, $06, nA4, nFs4, nA4, nA2, $06, nRst
	dc.b	$06, nA4, $06, nA4, nFs4, nA4, nA2, $06, nRst, $06, nA4, $06
	dc.b	nA4, nFs4, nA4, nA2, $06, nRst, $06, nA4, $06, nA4, nFs4, nA4
	dc.b	nA2, $06, nRst, $18, nRst, $06, nRst, $0C, nRst, $12, nAb2, $06
	dc.b	nA2, nA2, nA4, nB4, nC5, nCs5, nRst, $0C, nA4, $06, nB4, nC5
	dc.b	nCs5
	smpsJump            Mus_DEZ_Jump01

; FM5 Data
Mus_DEZ_FM5:
	smpsSetvoice        $02

Mus_DEZ_Jump00:
	dc.b	nA1, $06, nA2, nA2, nA1, nG2, nA1, nFs2, nA1, nF2, nF2, nA1
	dc.b	nE2, nA1, $03, nRst, $18, nRst, $09, nRst, $18, nRst, $0C, $06
	dc.b	nA2, nA2, nA1, nG2, nA1, nFs2, nA1, nC3, nC3, nA1, nC3, nA1
	dc.b	$03, nRst, $18, nRst, $09, nRst, $18, nRst, $0C
	smpsJump            Mus_DEZ_Jump00

; PSG2 Data
Mus_DEZ_PSG2:
	smpsAlterNote       $02
	smpsJump            Mus_DEZ_PSG1

; PSG1 Data
Mus_DEZ_PSG1:
	dc.b	nA2, $18, smpsNoAttack, $0C, smpsNoAttack, $18, smpsNoAttack, $0C, smpsNoAttack, $18, smpsNoAttack, $0C
	dc.b	smpsNoAttack, $18, smpsNoAttack, $0C, nC3, $18, smpsNoAttack, $0C, smpsNoAttack, $18, smpsNoAttack, $0C
	dc.b	smpsNoAttack, $18, smpsNoAttack, $0C, smpsNoAttack, $18, smpsNoAttack, $0C, smpsNoAttack, $18, smpsNoAttack, $0C
	dc.b	nRst, $18, nRst, $0C, nRst, $18, nRst, $0C, nRst, $18, nRst, $0C
	dc.b	nRst, $18, nRst, $0C, nRst, $18, nRst, $0C, nRst, $18, nRst, $0C
	dc.b	nRst, $18, nRst, $0C, nRst, $18, nRst, $0C, nRst, $18, nRst, $0C
	dc.b	nRst, $18, nRst, $0C, nRst, $18, nRst, $0C, nRst, $18, nRst, $0C
	dc.b	nRst, $18, nRst, $0C, nRst, $18, nRst, $0C, nRst, $18, nRst, $0C
	dc.b	nA3, $18, smpsNoAttack, $0C, smpsNoAttack, $18, smpsNoAttack, $0C, smpsNoAttack, $18, smpsNoAttack, $0C
	dc.b	smpsNoAttack, $18, smpsNoAttack, $0C, nC4, $18, smpsNoAttack, $0C, smpsNoAttack, $18, smpsNoAttack, $0C
	dc.b	smpsNoAttack, $18, smpsNoAttack, $0C, smpsNoAttack, $18, smpsNoAttack, $0C, nA3, $18, smpsNoAttack, $0C
	dc.b	smpsNoAttack, $18, smpsNoAttack, $0C, smpsNoAttack, $18, smpsNoAttack, $0C, smpsNoAttack, $18, smpsNoAttack, $0C
	dc.b	nC4, $18, smpsNoAttack, $0C, smpsNoAttack, $18, smpsNoAttack, $0C, smpsNoAttack, $18, smpsNoAttack, $0C
	dc.b	smpsNoAttack, $18, smpsNoAttack, $0C, nA3, $18, smpsNoAttack, $0C, nC4, $18, nA3, $0C
	dc.b	smpsNoAttack, nA3, nC4, $18, nA3, smpsNoAttack, $0C, $18, smpsNoAttack, $0C, smpsNoAttack, $18
	dc.b	smpsNoAttack, $0C, smpsNoAttack, $18, smpsNoAttack, $0C, smpsNoAttack, $18, smpsNoAttack, $0C
	smpsJump            Mus_DEZ_PSG1

; DAC Data
Mus_DEZ_DAC:
	dc.b	nRst, $0C, dSnare, dSnare, nRst, dSnare, dSnare, dKick, $06, dSnare, dSnare, $18
	dc.b	dKick, $06, dSnare, dSnare, $18, nRst, $0C, dSnare, dSnare, nRst, dSnare, dSnare
	dc.b	nRst, $06, dSnare, dSnare, nRst, $0C, dKick, $06, dKick, dKick, dSnare, $0C
	dc.b	dSnare

Mus_DEZ_Loop00:
	dc.b	dKick, $0C, dSnare, $06, dSnare, dSnare, $0C, dKick, dSnare, dSnare, dKick, dSnare
	dc.b	nRst, $06, dSnare, dKick, $0C, dSnare, dSnare, dKick, dSnare, $06, $0C, dKick
	dc.b	$06, $0C, dSnare, dSnare, dKick, dKick, $06, dKick, nRst, dKick, dSnare, $0C
	dc.b	$06, dSnare, dSnare, $0C
	smpsLoop            $00, $05, Mus_DEZ_Loop00
	smpsJump            Mus_DEZ_DAC
	
; Unreachable
	smpsStop

; PSG3 Data
Mus_DEZ_PSG3:
	smpsPSGform         $E7

Mus_DEZ_Jump05:
	dc.b	nRst, $0C, nA5, $03, smpsNoAttack, $09, $03, smpsNoAttack, $09, nRst, $0C, nA5
	dc.b	$03, smpsNoAttack, $09, $03, smpsNoAttack, $09, nRst, $18, nRst, $0C, nRst, $18
	dc.b	nRst, $0C, nRst, nA5, $03, smpsNoAttack, $09, $03, smpsNoAttack, $09, nRst, $0C
	dc.b	nA5, $03, smpsNoAttack, $09, $03, smpsNoAttack, $09, nRst, $18, nRst, $0C, nRst
	dc.b	$18, nRst, $0C

Mus_DEZ_Loop03:
	dc.b	nRst, $0C, nA5, $03, smpsNoAttack, $09, $03, smpsNoAttack, $09
	smpsLoop            $00, $28, Mus_DEZ_Loop03
	smpsJump            Mus_DEZ_Jump05

Mus_DEZ_Voices:
;	Voice $00
;	$04
;	$37, $72, $77, $49, 	$1F, $1F, $1F, $1F, 	$07, $0A, $07, $0D
;	$00, $00, $00, $00, 	$10, $07, $10, $07, 	$23, $80, $23, $80
	smpsVcAlgorithm     $04
	smpsVcFeedback      $00
	smpsVcUnusedBits    $00
	smpsVcDetune        $04, $07, $07, $03
	smpsVcCoarseFreq    $09, $07, $02, $07
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $0D, $07, $0A, $07
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $00, $01, $00, $01
	smpsVcReleaseRate   $07, $00, $07, $00
	smpsVcTotalLevel    $00, $23, $00, $23

;	Voice $01
;	$3E
;	$01, $01, $01, $02, 	$8D, $07, $07, $52, 	$09, $00, $00, $03
;	$01, $02, $02, $00, 	$5F, $0F, $0F, $2F, 	$18, $A2, $98, $80
	smpsVcAlgorithm     $06
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $02, $01, $01, $01
	smpsVcRateScale     $01, $00, $00, $02
	smpsVcAttackRate    $12, $07, $07, $0D
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $03, $00, $00, $09
	smpsVcDecayRate2    $00, $02, $02, $01
	smpsVcDecayLevel    $02, $00, $00, $05
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $18, $22, $18

;	Voice $02
;	$39
;	$01, $51, $00, $00, 	$1F, $5F, $5F, $5F, 	$10, $11, $09, $09
;	$07, $00, $00, $00, 	$2F, $2F, $2F, $1F, 	$20, $22, $20, $80
	smpsVcAlgorithm     $01
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $05, $00
	smpsVcCoarseFreq    $00, $00, $01, $01
	smpsVcRateScale     $01, $01, $01, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $09, $09, $11, $10
	smpsVcDecayRate2    $00, $00, $00, $07
	smpsVcDecayLevel    $01, $02, $02, $02
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $20, $22, $20

;	Voice $03
;	$20
;	$30, $30, $30, $30, 	$DF, $DF, $9F, $9F, 	$07, $06, $09, $06
;	$07, $06, $06, $08, 	$20, $99, $99, $F8, 	$28, $18, $03, $80
	smpsVcAlgorithm     $00
	smpsVcFeedback      $04
	smpsVcUnusedBits    $00
	smpsVcDetune        $03, $03, $03, $03
	smpsVcCoarseFreq    $00, $00, $00, $00
	smpsVcRateScale     $02, $02, $03, $03
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $06, $09, $06, $07
	smpsVcDecayRate2    $08, $06, $06, $07
	smpsVcDecayLevel    $0F, $09, $09, $02
	smpsVcReleaseRate   $08, $09, $09, $00
	smpsVcTotalLevel    $00, $03, $18, $28