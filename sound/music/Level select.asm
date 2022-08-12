Mus_LevelSel_Header:
	smpsHeaderStartSong 2
	smpsHeaderVoice     Mus_LevelSel_Voices
	smpsHeaderChan      $06, $03
	smpsHeaderTempo     $01, $00

	smpsHeaderDAC       Mus_LevelSel_DAC
	smpsHeaderFM        Mus_LevelSel_FM1,	$F4, $15
	smpsHeaderFM        Mus_LevelSel_FM2,	$0C, $15
	smpsHeaderFM        Mus_LevelSel_FM3,	$00, $13
	smpsHeaderFM        Mus_LevelSel_FM4,	$F4, $08
	smpsHeaderFM        Mus_LevelSel_FM5,	$00, $20
	smpsHeaderPSG       Mus_LevelSel_PSG1,	$D0, $02, $00, fTone_0C
	smpsHeaderPSG       Mus_LevelSel_PSG2,	$D0, $03, $00, fTone_0C
	smpsHeaderPSG       Mus_LevelSel_PSG3,	$D0, $06, $00, fTone_0C

; FM1 Data
Mus_LevelSel_FM1:
	smpsPan             panRight, $00
	smpsNoteFill        $05

Mus_LevelSel_Jump02:
	smpsSetvoice        $03
	dc.b	nC5, $0C, nB4, nA4, nG4, nC5, nB4, nA4, nG4, nC5, nB4, nA4
	dc.b	nG4, nC5, nB4, nA4, nG4, nC5, nBb4, nAb4, nG4, nC5, nBb4, nAb4
	dc.b	nG4, nD5, nC5, nBb4, nAb4, nD5, nC5, nBb4, nAb4
	smpsJump            Mus_LevelSel_Jump02

; FM2 Data
Mus_LevelSel_FM2:
	smpsPan             panLeft, $00
	smpsSetvoice        $00

Mus_LevelSel_Jump01:
	dc.b	nRst, $18, nC4, $0C, nE4, nG4, $18, nC4, $0C, nE4, nG4, $30
	dc.b	smpsNoAttack, $30, nRst, $18, nAb3, $0C, nC4, nEb4, $30, nRst, $18, nBb3
	dc.b	$0C, nD4, nF4, $30
	smpsJump            Mus_LevelSel_Jump01

; FM5 Data
Mus_LevelSel_FM5:
	smpsSetvoice        $01
	smpsModSet          $02, $01, $02, $04
	dc.b	nRst, $06
	smpsJump            Mus_LevelSel_Jump00

; PSG2 Data
Mus_LevelSel_PSG2:
	smpsAlterNote       $02
	dc.b	nRst, $0C
	smpsJump            Mus_LevelSel_Jump00

; PSG3 Data
Mus_LevelSel_PSG3:
	smpsAlterNote       $01
	dc.b	nRst, $12
	smpsJump            Mus_LevelSel_Jump00

; PSG1 Data
Mus_LevelSel_PSG1:
	smpsAlterNote       $FF
	smpsJump            Mus_LevelSel_Jump00

; FM3 Data
Mus_LevelSel_FM3:
	smpsSetvoice        $01
	smpsModSet          $12, $01, $02, $04

Mus_LevelSel_Jump00:
	dc.b	nRst, $18, nC5, $0C, nC5, nC5, $18, nD5, $0C, nF5, smpsNoAttack, nF5
	dc.b	nRst, nE5, nRst, nD5, nRst, nC5, nRst, nEb5, $18, nF5, $0C, nC5
	dc.b	$30, smpsNoAttack, $0C, smpsNoAttack, $30, smpsNoAttack, $30
	smpsJump            Mus_LevelSel_Jump00

; FM4 Data
Mus_LevelSel_FM4:
	smpsSetvoice        $02
	dc.b	nC3, $30, nC3, nC3, nC3, $18, nG2, nAb2, $30, $18, nF2, nBb2
	dc.b	$30, $18, nG2
	smpsJump            Mus_LevelSel_FM4

; DAC Data
Mus_LevelSel_DAC:
	dc.b	dKick, $18, $08, dKick, dKick, dKick, $18, $08, dKick, dKick, dKick, $18
	dc.b	$08, dKick, dKick, dMidTom, $0C, dFloorTom, dMidTom, dFloorTom
	smpsLoop            $00, $02, Mus_LevelSel_DAC
	smpsJump            Mus_LevelSel_DAC

Mus_LevelSel_Voices:
;	Voice $00
;	$02
;	$3C, $32, $55, $51, 	$1F, $98, $1F, $9F, 	$0F, $11, $0E, $11
;	$0E, $05, $08, $05, 	$5F, $0F, $6F, $0F, 	$2D, $2D, $2F, $80
	smpsVcAlgorithm     $02
	smpsVcFeedback      $00
	smpsVcUnusedBits    $00
	smpsVcDetune        $05, $05, $03, $03
	smpsVcCoarseFreq    $01, $05, $02, $0C
	smpsVcRateScale     $02, $00, $02, $00
	smpsVcAttackRate    $1F, $1F, $18, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $11, $0E, $11, $0F
	smpsVcDecayRate2    $05, $08, $05, $0E
	smpsVcDecayLevel    $00, $06, $00, $05
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $2F, $2D, $2D

;	Voice $01
;	$3D
;	$01, $21, $51, $01, 	$12, $14, $14, $0F, 	$0A, $05, $05, $05
;	$00, $00, $00, $00, 	$2B, $2B, $2B, $1B, 	$19, $80, $80, $80
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
	smpsVcReleaseRate   $0B, $0B, $0B, $0B
	smpsVcTotalLevel    $00, $00, $00, $19

;	Voice $02
;	$3A
;	$61, $3C, $14, $31, 	$9C, $DB, $9C, $DA, 	$04, $09, $04, $03
;	$03, $01, $03, $00, 	$1F, $0F, $0F, $AF, 	$21, $47, $31, $80
	smpsVcAlgorithm     $02
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $03, $01, $03, $06
	smpsVcCoarseFreq    $01, $04, $0C, $01
	smpsVcRateScale     $03, $02, $03, $02
	smpsVcAttackRate    $1A, $1C, $1B, $1C
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $03, $04, $09, $04
	smpsVcDecayRate2    $00, $03, $01, $03
	smpsVcDecayLevel    $0A, $00, $00, $01
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $31, $47, $21

;	Voice $03
;	$3C
;	$01, $02, $01, $02, 	$CF, $0D, $CF, $0C, 	$00, $02, $00, $02
;	$00, $00, $00, $00, 	$02, $37, $02, $38, 	$1E, $80, $1F, $80
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $02, $01, $02, $01
	smpsVcRateScale     $00, $03, $00, $03
	smpsVcAttackRate    $0C, $0F, $0D, $0F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $02, $00, $02, $00
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $03, $00, $03, $00
	smpsVcReleaseRate   $08, $02, $07, $02
	smpsVcTotalLevel    $00, $1F, $00, $1E