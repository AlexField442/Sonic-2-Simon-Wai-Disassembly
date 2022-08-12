Mus_RWZ_Header:
	smpsHeaderStartSong 2
	smpsHeaderVoice     Mus_RWZ_Voices
	smpsHeaderChan      $06, $03
	smpsHeaderTempo     $02, $03

	smpsHeaderDAC       Mus_RWZ_DAC
	smpsHeaderFM        Mus_RWZ_FM1,	$F4, $10
	smpsHeaderFM        Mus_RWZ_FM2,	$DC, $24
	smpsHeaderFM        Mus_RWZ_FM3,	$F4, $12
	smpsHeaderFM        Mus_RWZ_FM4,	$F4, $09
	smpsHeaderFM        Mus_RWZ_FM5,	$E8, $0E
	smpsHeaderPSG       Mus_RWZ_PSG1,	$F4, $0C, $00, $00
	smpsHeaderPSG       Mus_RWZ_PSG2,	$F9, $09, $00, $00
	smpsHeaderPSG       Mus_RWZ_PSG3,	$02, $04, $00, $00

; FM1 Data
Mus_RWZ_FM1:
	smpsSetvoice        $03

Mus_RWZ_Loop03:
	smpsCall            Mus_RWZ_Call07
	smpsLoop            $00, $02, Mus_RWZ_Loop03

Mus_RWZ_Jump03:
	smpsPan             panRight, $00
	smpsAlterNote       $FE
	smpsAlterVol        $14
	smpsAlterPitch      $E8
	smpsSetvoice        $04
	smpsCall            Mus_RWZ_Call05
	smpsAlterPitch      $18
	smpsAlterVol        $EC
	smpsSetvoice        $03
	smpsAlterNote       $00
	smpsPan             panCenter, $00

Mus_RWZ_Loop04:
	smpsCall            Mus_RWZ_Call07
	smpsLoop            $00, $08, Mus_RWZ_Loop04
	smpsJump            Mus_RWZ_Jump03

Mus_RWZ_Call07:
	dc.b	nB6, $06, nG6, nA6, nD6, nB6, nG6, nA6, nD6
	smpsReturn

; FM2 Data
Mus_RWZ_FM2:
	smpsSetvoice        $04
	dc.b	nRst, $60

Mus_RWZ_Jump02:
	smpsPan             panLeft, $00
	smpsAlterNote       $02
	smpsCall            Mus_RWZ_Call05
	smpsAlterNote       $00
	smpsPan             panCenter, $00
	smpsAlterVol        $FB
	smpsCall            Mus_RWZ_Call06
	dc.b	nD6, $03, $03, $06, smpsNoAttack
	smpsAlterVol        $02
	dc.b	$02, smpsNoAttack
	smpsAlterVol        $02
	dc.b	$02, smpsNoAttack
	smpsAlterVol        $02
	dc.b	$02, nRst, $12, nC6, $06, nD6
	smpsAlterVol        $FA
	smpsCall            Mus_RWZ_Call06
	dc.b	nD6, $30
	smpsAlterVol        $05
	smpsJump            Mus_RWZ_Jump02

Mus_RWZ_Call05:
	dc.b	nG6, $30, nD6
	smpsLoop            $00, $04, Mus_RWZ_Call05
	smpsReturn

Mus_RWZ_Call06:
	dc.b	nG6, $03, $03, $06, smpsNoAttack
	smpsAlterVol        $02
	dc.b	$02, smpsNoAttack
	smpsAlterVol        $02
	dc.b	$02, smpsNoAttack
	smpsAlterVol        $02
	dc.b	$02, nRst, $1E
	smpsAlterVol        $FA
	dc.b	nD6, $03, $03, $06, smpsNoAttack
	smpsAlterVol        $02
	dc.b	$02, smpsNoAttack
	smpsAlterVol        $02
	dc.b	$02, smpsNoAttack
	smpsAlterVol        $02
	dc.b	$02, nRst, $1E
	smpsAlterVol        $FA
	dc.b	nC6, $03, $03, $06, smpsNoAttack
	smpsAlterVol        $02
	dc.b	$02, smpsNoAttack
	smpsAlterVol        $02
	dc.b	$02, smpsNoAttack
	smpsAlterVol        $02
	dc.b	$02, nRst, $1E
	smpsAlterVol        $FA
	smpsReturn

; FM3 Data
Mus_RWZ_FM3:
	smpsSetvoice        $06
	dc.b	nRst, $06, nG4, $03, nA4, nG4, $0C, nB4, $03, nC5, nB4, $0C
	dc.b	nD5, $03, nE5, nD5, $30

Mus_RWZ_Jump01:
	dc.b	nRst, $12, nE6, $03, nFs6, nG6, $06, nFs6, nE6, nD6, nB5, $30
	dc.b	nRst, $12, nE6, $03, nG6, nA6, $06, nG6, nFs6, nE6, nD6, $03
	dc.b	nE6, nD6, nB5, $27, nRst, $12, nE6, $03, nG6, nFs6, $06, nD6
	dc.b	nB5, nE6, nD6, $30, nRst, $12, nE6, $03, nG6, nA6, $06, nG6
	dc.b	nFs6, nE6, nD6, $03, nE6, nD6, nB5, $27
	smpsSetvoice        $00
	smpsCall            Mus_RWZ_Call04
	dc.b	nB4, $0C, nG4, nA4, nG4, $06, nA4
	smpsCall            Mus_RWZ_Call04
	dc.b	nB4, $30
	smpsJump            Mus_RWZ_Jump01

Mus_RWZ_Call04:
	dc.b	nB4, $0C, nG4, nA4, nD4
	smpsLoop            $00, $03, Mus_RWZ_Call04
	smpsReturn

; FM4 Data
Mus_RWZ_FM4:
	smpsAlterNote       $02
	smpsSetvoice        $01
	dc.b	nRst, $06, nB4, $03, nC5, nB4, $0C, nD5, $03, nE5, nD5, $0C
	dc.b	nG5, $03, nA5, nG5, $30

Mus_RWZ_Jump00:
	smpsSetvoice        $05
	smpsAlterVol        $12
	dc.b	nRst, $12, nE6, $03, nFs6, nG6, $06, nFs6, nE6, nD6, nB5, $18
	smpsSetvoice        $01
	smpsAlterVol        $EE
	smpsNoteFill        $0B
	dc.b	nG5, $06, nD5, nE5, $03, nG5, $06
	smpsNoteFill        $00
	dc.b	$15
	smpsSetvoice        $05
	smpsAlterVol        $12
	dc.b	nE6, $03, nG6, nA6, $06, nG6, nFs6, nE6, nD6, $03, nE6, nD6
	dc.b	nB5, $0F
	smpsSetvoice        $01
	smpsAlterVol        $EE
	dc.b	nA5, $0C, nB5, nG5, $12
	smpsSetvoice        $05
	smpsAlterVol        $12
	dc.b	nE6, $03, nG6, nFs6, $06, nD6, nB5, nE6, nD6, $18
	smpsSetvoice        $01
	smpsAlterVol        $EE
	smpsNoteFill        $0B
	dc.b	nG5, $06, nD5, nE5, $03, nG5, $06
	smpsNoteFill        $00
	dc.b	$15
	smpsSetvoice        $05
	smpsAlterVol        $12
	dc.b	nE6, $03, nG6, nA6, $06, nG6, nFs6, nE6, nD6, $03, nE6
	smpsSetvoice        $01
	smpsAlterVol        $EE
	dc.b	nB4, $03, nC5, nB4, $0C, nD5, $03, nE5, nD5, $0C, nG5, $03
	dc.b	nA5
	smpsAlterVol        $FC
	smpsCall            Mus_RWZ_Call03
	dc.b	nG5, $2A, nA5, $03, nB5, $33
	smpsCall            Mus_RWZ_Call03
	dc.b	nG5, $24, nA5, $0C, nG5, $30
	smpsAlterVol        $04
	smpsJump            Mus_RWZ_Jump00

Mus_RWZ_Call03:
	dc.b	nRst, $12, nG5, $03, nA5, nB5, $0C, nC6, $03, nB5, nC6, nD6
	dc.b	$27, nE6, $0C
	smpsReturn

; FM5 Data
Mus_RWZ_FM5:
	smpsSetvoice        $02
	dc.b	nRst, $51, nG3, $03, nA3, $06, nB3

Mus_RWZ_Loop02:
	dc.b	nC4, $03, $0F, $03, $0C, nG4, $03, nA4, $06, nG4, nG3, $03
	dc.b	$0F, $0F, nD4, $03, nE4, $06, nD4
	smpsLoop            $00, $04, Mus_RWZ_Loop02
	smpsCall            Mus_RWZ_Call02
	dc.b	nA3, $03, $0F, $0C, $09, $09, nG3, $03, $0F, $0C, $06, nA3
	dc.b	nB3
	smpsCall            Mus_RWZ_Call02
	dc.b	nA3, $03, $0F, $0C, $06, nB3, nA3, nG3, $30
	smpsJump            Mus_RWZ_Loop02

Mus_RWZ_Call02:
	dc.b	nC4, $03, $0F, $0C, $09, $09, nB3, $03, nB3, $0F, $0C, $06
	dc.b	nC4, nB3
	smpsReturn

; DAC Data
Mus_RWZ_DAC:
	smpsCall            Mus_RWZ_Call00
	smpsLoop            $00, $02, Mus_RWZ_DAC

Mus_RWZ_Loop00:
	smpsCall            Mus_RWZ_Call00
	smpsLoop            $00, $03, Mus_RWZ_Loop00
	smpsCall            Mus_RWZ_Call01
	smpsLoop            $01, $03, Mus_RWZ_Loop00

Mus_RWZ_Loop01:
	smpsCall            Mus_RWZ_Call00
	smpsLoop            $00, $03, Mus_RWZ_Loop01
	dc.b	dKick, $0C, nRst, nRst, dSnare, $06, dSnare, $03, dSnare
	smpsJump            Mus_RWZ_Loop00

Mus_RWZ_Call00:
	dc.b	dKick, $03, dKick, nRst, $06, dSnare, dKick, nRst, dKick, dSnare, $03, dKick
	dc.b	$09
	smpsReturn

Mus_RWZ_Call01:
	dc.b	dKick, $03, dKick, nRst, $06, dSnare, dKick, nRst, dKick, dSnare, dSnare, $03
	dc.b	dSnare
	smpsReturn

; PSG1 Data
Mus_RWZ_PSG1:
	dc.b	nRst, $60

Mus_RWZ_Loop05:
	dc.b	nG4, $30, nFs4
	smpsLoop            $00, $04, Mus_RWZ_Loop05
	smpsAlterVol        $FE
	dc.b	nG4, $03, $03, $06, nRst, $24, nFs4, $03, $03, $06, nRst, $24
	dc.b	nE4, $03, $03, $06, nRst, $24, nD4, $03, $03, $06, nRst, $18
	dc.b	nE4, $06, nFs4, nG4, $03, $03, $06, nRst, $24, nFs4, $03, $03
	dc.b	$06, nRst, $24, nE4, $03, $03, $06, nRst, $24, nFs4, $30
	smpsAlterVol        $02
	smpsJump            Mus_RWZ_Loop05

; PSG2 Data
Mus_RWZ_PSG2:
	dc.b	nRst, $60
	smpsPSGvoice        fTone_08

Mus_RWZ_Jump04:
	dc.b	nRst, $12, nD6, $03, nD6, nD6, $06, nD6, nD6, nD6, nD6, $30
	dc.b	nRst, $12, nD6, $03, nD6, nD6, $06, nD6, nD6, nD6, nD6, $03
	dc.b	nD6, nD6, nD6, $27, nRst, $12, nD6, $03, nD6, nD6, $06, nD6
	dc.b	nD6, nD6, nD6, $30, nRst, $12, nD6, $03, nD6, nD6, $06, nD6
	dc.b	nD6, nD6, nD6, $03, nD6, nD6, nD6, $27
	smpsAlterVol        $01
	dc.b	nB4, $03, $03, $06, nRst, $24, nA4, $03, $03, $06, nRst, $24
	dc.b	nG4, $03, $03, $06, nRst, $24, nFs4, $03, $03, $06, nRst, $18
	dc.b	nG4, $06, nA4, nB4, $03, $03, $06, nRst, $24, nA4, $03, $03
	dc.b	$06, nRst, $24, nG4, $03, $03, $06, nRst, $24, nD4, $30
	smpsAlterVol        $FF
	smpsJump            Mus_RWZ_Jump04

; PSG3 Data
Mus_RWZ_PSG3:
	smpsPSGvoice        fTone_04
	smpsPSGform         $E7
	dc.b	nF6, $0C
	smpsJump            Mus_RWZ_PSG3

Mus_RWZ_Voices:
;	Voice $00
;	$02
;	$62, $01, $34, $01, 	$59, $59, $59, $51, 	$04, $04, $04, $07
;	$01, $01, $01, $01, 	$12, $12, $12, $17, 	$1E, $19, $25, $80
	smpsVcAlgorithm     $02
	smpsVcFeedback      $00
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $03, $00, $06
	smpsVcCoarseFreq    $01, $04, $01, $02
	smpsVcRateScale     $01, $01, $01, $01
	smpsVcAttackRate    $11, $19, $19, $19
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $07, $04, $04, $04
	smpsVcDecayRate2    $01, $01, $01, $01
	smpsVcDecayLevel    $01, $01, $01, $01
	smpsVcReleaseRate   $07, $02, $02, $02
	smpsVcTotalLevel    $00, $25, $19, $1E

;	Voice $01
;	$3A
;	$11, $1A, $00, $11, 	$89, $59, $4F, $4F, 	$0A, $0D, $06, $09
;	$00, $00, $00, $01, 	$1F, $FF, $0F, $5F, 	$20, $2E, $3B, $80
	smpsVcAlgorithm     $02
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $01, $00, $01, $01
	smpsVcCoarseFreq    $01, $00, $0A, $01
	smpsVcRateScale     $01, $01, $01, $02
	smpsVcAttackRate    $0F, $0F, $19, $09
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $09, $06, $0D, $0A
	smpsVcDecayRate2    $01, $00, $00, $00
	smpsVcDecayLevel    $05, $00, $0F, $01
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $3B, $2E, $20

;	Voice $02
;	$3D
;	$01, $42, $02, $22, 	$1F, $1F, $1F, $1F, 	$07, $00, $00, $00
;	$00, $0E, $0E, $0E, 	$24, $0F, $0F, $0F, 	$1C, $89, $89, $89
	smpsVcAlgorithm     $05
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $02, $00, $04, $00
	smpsVcCoarseFreq    $02, $02, $02, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $00, $00, $07
	smpsVcDecayRate2    $0E, $0E, $0E, $00
	smpsVcDecayLevel    $00, $00, $00, $02
	smpsVcReleaseRate   $0F, $0F, $0F, $04
	smpsVcTotalLevel    $09, $09, $09, $1C

;	Voice $03
;	$04
;	$57, $07, $74, $54, 	$1F, $1F, $1F, $1F, 	$00, $00, $00, $00
;	$06, $0A, $00, $0A, 	$00, $0F, $00, $0F, 	$1A, $8F, $10, $89
	smpsVcAlgorithm     $04
	smpsVcFeedback      $00
	smpsVcUnusedBits    $00
	smpsVcDetune        $05, $07, $00, $05
	smpsVcCoarseFreq    $04, $04, $07, $07
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $00, $00, $00
	smpsVcDecayRate2    $0A, $00, $0A, $06
	smpsVcDecayLevel    $00, $00, $00, $00
	smpsVcReleaseRate   $0F, $00, $0F, $00
	smpsVcTotalLevel    $09, $10, $0F, $1A

;	Voice $04
;	$07
;	$06, $7C, $75, $0A, 	$1F, $1F, $1F, $1F, 	$00, $00, $00, $00
;	$00, $00, $00, $00, 	$0F, $0F, $0F, $0F, 	$80, $80, $80, $80
	smpsVcAlgorithm     $07
	smpsVcFeedback      $00
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $07, $07, $00
	smpsVcCoarseFreq    $0A, $05, $0C, $06
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $00, $00, $00
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $00, $00, $00, $00
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $00, $00, $00

;	Voice $05
;	$01
;	$05, $03, $05, $01, 	$0F, $0E, $CE, $10, 	$05, $02, $0B, $09
;	$08, $03, $00, $0A, 	$FF, $3F, $0F, $FF, 	$23, $1A, $21, $83
	smpsVcAlgorithm     $01
	smpsVcFeedback      $00
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $01, $05, $03, $05
	smpsVcRateScale     $00, $03, $00, $00
	smpsVcAttackRate    $10, $0E, $0E, $0F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $09, $0B, $02, $05
	smpsVcDecayRate2    $0A, $00, $03, $08
	smpsVcDecayLevel    $0F, $00, $03, $0F
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $03, $21, $1A, $23

;	Voice $06
;	$3C
;	$01, $02, $01, $02, 	$CF, $0D, $CF, $0C, 	$00, $08, $00, $08
;	$00, $02, $00, $02, 	$02, $27, $02, $28, 	$1E, $80, $1F, $80
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $02, $01, $02, $01
	smpsVcRateScale     $00, $03, $00, $03
	smpsVcAttackRate    $0C, $0F, $0D, $0F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $08, $00, $08, $00
	smpsVcDecayRate2    $02, $00, $02, $00
	smpsVcDecayLevel    $02, $00, $02, $00
	smpsVcReleaseRate   $08, $02, $07, $02
	smpsVcTotalLevel    $00, $1F, $00, $1E