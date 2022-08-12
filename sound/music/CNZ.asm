Mus_CNZ_Header:
	smpsHeaderStartSong 2
	smpsHeaderVoice     Mus_CNZ_Voices
	smpsHeaderChan      $06, $03
	smpsHeaderTempo     $01, $00

	smpsHeaderDAC       Mus_CNZ_DAC
	smpsHeaderFM        Mus_CNZ_FM1,	$0C, $10
	smpsHeaderFM        Mus_CNZ_FM2,	$F4, $12
	smpsHeaderFM        Mus_CNZ_FM3,	$F4, $12
	smpsHeaderFM        Mus_CNZ_FM4,	$00, $12
	smpsHeaderFM        Mus_CNZ_FM5,	$00, $12
	smpsHeaderPSG       Mus_CNZ_PSG1,	$DC, $02, $00, fTone_09
	smpsHeaderPSG       Mus_CNZ_PSG2,	$DC, $02, $00, fTone_09
	smpsHeaderPSG       Mus_CNZ_PSG3,	$00, $04, $00, fTone_01

; FM1 Data
Mus_CNZ_FM1:
	smpsSetvoice        $00
	dc.b	nRst, $30, nE2, $08, nF2, nFs2, nG2, nF3, nEb3

Mus_CNZ_Jump05:
	dc.b	nC3, $18, nC2, nC3, nC2, nC3, nC2, nC3, nC2, nRst, nG1, nBb1
	dc.b	$10, nAb1, $18, nG2, $08, nRst, $10, nD2, $08, nG1, $18, nA1
	dc.b	nB1, nC2, nB1, nA1, nG1, nC2, nC2, nG1, nC2, nE2, nD2, nC2
	dc.b	nB1, nE2, nFs2, nAb2, nE2, nA2, nA2, nE2, nE2, nA2, nE2, nC2
	dc.b	nA1, nAb1, nBb1, nC2, nCs2, nEb2, $10, $08, nAb1, $18, nC2, nAb1
	dc.b	nC2, nB1, nC2, nD2, nE2, nB1, nE2, nAb1, nA1, nB1, nC2, nE2
	dc.b	nF2, nE2, nF2, nB1, nRst, nC2, nRst, nC2, nRst, nF2, nRst, nF2
	dc.b	nAb2, $30, $18, nRst, $10, nG2, $08, nRst, $10, $08, nF2, $18
	dc.b	nE2, nD2, nC2, nE1, nF1, nFs1, nG1, $10, nG2, $08, nC2, $18
	dc.b	nB1, nF2, nE2, nD2, nC2, nB1, nAb1, nA1, nAb1, nE2, nA2, nA2
	dc.b	$08, nE2, nA1, nC2, $18, nD2, nE2, nA2, nD3, nA1, nAb1, nG1
	dc.b	nF1, nEb2, nC2, $10, nEb2, $08, nAb1, $18, nF1, nBb1, nC2, nD2
	dc.b	nE2, nC2, nE2, nF2, nE2, nAb2, nA2, $10, $08, nA1, $18, nC2
	dc.b	nE2, nF2, nF2, $08, nG3, nF3, nE2, nF3, nE3, nC2, nD3, nC3
	dc.b	nRst, $18, nC2, nRst, nC2, nRst, nF2, nRst, nF2
	smpsAlterVol        $04
	dc.b	nRst, nC2, nRst, nC2, nRst, nF2, nRst, nF2
	smpsAlterVol        $F8
	dc.b	nRst, nC2, nRst, nC2, nRst, nF2, nRst, nF2, $10, nC2, $08, nRst
	dc.b	$30, nRst, nC2, $10, $08, nB1, $18, nA1, nG1
	smpsAlterVol        $04
	smpsJump            Mus_CNZ_Jump05

; FM2 Data
Mus_CNZ_FM2:
	smpsSetvoice        $01
	smpsModSet          $02, $04, $04, $02
	smpsPan             panLeft, $00
	dc.b	nRst, $30, nRst

Mus_CNZ_Jump04:
	dc.b	nRst, $18, nG5, nRst, nG5, nRst, nG5, nRst, nG5, nRst, nF5, $0C
	dc.b	nRst, nF5, $10, $08, nRst, $10, $08, nRst, $30, nRst, nRst, $18
	dc.b	nG4, $08, nRst, $20, nG4, $08, nRst, $18, nG4, nRst, $10, $08
	dc.b	nRst, $18, nG4, $10, $08, nRst, $18, nAb4, $08, nRst, $20, nAb4
	dc.b	$08, nRst, $18, nAb4, nRst, $10, $08, nRst, $18, nAb4, $10, $08
	dc.b	nRst, $18, nA4, $08, nRst, $20, nA4, $08, nRst, $18, nA4, nRst
	dc.b	$10, $08, nRst, $18, nA4, $10, $08, nRst, $18, nAb4, $08, nRst
	dc.b	$20, nAb4, $08, nRst, $18, nAb4, nRst, $10, $18, nRst, $08, nAb4
	dc.b	$10, $08, nRst, $18, nG4, $08, nRst, $20, nG4, $08, nRst, $18
	dc.b	nAb4, nRst, $10, $20, $18, nRst, $18, nA4, $08, nRst, $20, nA4
	dc.b	$08, nRst, $18, nC5, nRst, $10, $08, nRst, $18, $10, $08, nRst
	dc.b	$18, nG4, nRst, nG4, nRst, nA4, nRst, nA4, nAb4, $30, $18, nRst
	dc.b	$10, nB4, $08, nRst, $30, nRst, nRst, $18, nG4, $08, nRst
	smpsSetvoice        $02
	dc.b	nE5, $09, nRst, $0F
	smpsSetvoice        $01
	dc.b	nG4, $08
	smpsSetvoice        $02
	dc.b	nRst, $10, nE5, $08
	smpsSetvoice        $01
	dc.b	nG4, $10
	smpsSetvoice        $02
	dc.b	nE5, $08, nF5, $10, nE5, $08
	smpsSetvoice        $01
	dc.b	nG4, $18, $10, $08, nRst, $18, nAb4, $08, nRst
	smpsSetvoice        $02
	dc.b	nD5, nRst, $10
	smpsSetvoice        $01
	dc.b	nAb4, $08, nRst, $10
	smpsSetvoice        $02
	dc.b	nD5, $08
	smpsSetvoice        $01
	dc.b	nAb4, $10
	smpsSetvoice        $02
	dc.b	nD5, $08, nE5, $10, nD5, $08
	smpsSetvoice        $01
	dc.b	nAb4, nRst, $10, nAb4, nAb4, $08
	smpsSetvoice        $02
	dc.b	nC5, $10, $08
	smpsSetvoice        $01
	dc.b	nA4, nRst
	smpsSetvoice        $02
	dc.b	nC5, nC5, $10
	smpsSetvoice        $01
	dc.b	nA4, $08, nRst, $18, $10
	smpsSetvoice        $02
	dc.b	nC5, $08, nD5, $10, nC5, $08
	smpsSetvoice        $01
	dc.b	nA4, nRst, $10, nA4, nA4, $08
	smpsSetvoice        $02
	dc.b	nC5, $10, $08
	smpsSetvoice        $01
	dc.b	nAb4, nRst, $20
	smpsSetvoice        $02
	dc.b	nC5, $08
	smpsSetvoice        $01
	dc.b	nAb4, nRst
	smpsSetvoice        $02
	dc.b	nC5
	smpsSetvoice        $01
	dc.b	nAb4, nRst
	smpsSetvoice        $02
	dc.b	nC5
	smpsSetvoice        $01
	dc.b	nAb4, nRst
	smpsSetvoice        $02
	dc.b	nA4
	smpsSetvoice        $01
	dc.b	nAb4, nRst
	smpsSetvoice        $02
	dc.b	nBb4
	smpsSetvoice        $01
	dc.b	nAb4, nRst
	smpsSetvoice        $02
	dc.b	nC5, nE5, $18
	smpsSetvoice        $01
	dc.b	nG4, $08, nRst
	smpsSetvoice        $02
	dc.b	nE5
	smpsSetvoice        $01
	dc.b	nG4, $10
	smpsSetvoice        $02
	dc.b	nE5, $20
	smpsSetvoice        $01
	dc.b	nAb4, $18
	smpsSetvoice        $02
	dc.b	nD5, $10
	smpsSetvoice        $01
	dc.b	nAb4, $18
	smpsSetvoice        $02
	dc.b	nE5, $08
	smpsSetvoice        $01
	dc.b	nAb4, $10
	smpsSetvoice        $02
	dc.b	nD5, $08, nRst, $10, nC5, $08
	smpsSetvoice        $01
	dc.b	nA4, nRst
	smpsSetvoice        $02
	dc.b	nC5
	smpsSetvoice        $01
	dc.b	nA4, nRst
	smpsSetvoice        $02
	dc.b	nC5, nRst, $10, $08
	smpsSetvoice        $01
	dc.b	nG4, nRst
	smpsSetvoice        $02
	dc.b	nF4
	smpsSetvoice        $01
	dc.b	nE4, nRst
	smpsSetvoice        $02
	dc.b	nC5
	smpsSetvoice        $01
	dc.b	nC5, nRst
	smpsSetvoice        $02
	dc.b	nA4
	smpsSetvoice        $01
	dc.b	nA4, nRst
	smpsSetvoice        $02
	dc.b	nF5
	smpsSetvoice        $01
	dc.b	nRst, $18, nG4, nRst, nG4, nRst, nA4, nRst, nA4, nRst, nG4, nRst
	dc.b	nG4, nRst, nA4, nRst, nA4, nRst, nG5, nRst, nG5, nRst, nA5, $30
	dc.b	$10, nG5, $08, nRst, $30, nRst, nRst, nRst
	smpsJump            Mus_CNZ_Jump04

; FM3 Data
Mus_CNZ_FM3:
	smpsSetvoice        $01
	smpsModSet          $02, $04, $04, $02
	smpsPan             panRight, $00
	dc.b	nRst, $30, nRst

Mus_CNZ_Jump03:
	dc.b	nRst, $18, nEb5, nRst, nEb5, nRst, nEb5, nRst, nEb5, nRst, nD5, $0C
	dc.b	nRst, nD5, $10, $08, nRst, $10, $08, nRst, $30, nRst, nRst, $18
	dc.b	nE4, $08, nRst, $20, nE4, $08, nRst, $18, nE4, nRst, $10, $08
	dc.b	nRst, $18, nE4, $10, $08, nRst, $18, $08, nRst, $20, nE4, $08
	dc.b	nRst, $18, nE4, nRst, $10, $08, nRst, $18, nE4, $10, $08, nRst
	dc.b	$18, $08, nRst, $20, nE4, $08, nRst, $18, nE4, nRst, $10, $08
	dc.b	nRst, $18, nE4, $10, $08, nRst, $18, nEb4, $08, nRst, $20, nEb4
	dc.b	$08, nRst, $18, nEb4, nRst, $10, $18, nRst, $08, nEb4, $10, $08
	dc.b	nRst, $18, nE4, $08, nRst, $20, nE4, $08, nRst, $18, nE4, nRst
	dc.b	$10, $20, $18, nRst, $18, $08, nRst, $20, nE4, $08, nRst, $18
	dc.b	nA4, nRst, $10, $08, nRst, $18, nA4, $10, $08, nRst, $18, nE4
	dc.b	nRst, nE4, nRst, nF4, nRst, nF4, nEb4, $30, $18, nRst, $10, nG4
	dc.b	$08, nRst, $30, nRst, nRst, $18, nE4, $08, nRst
	smpsSetvoice        $02
	dc.b	nC5, nRst, $10
	smpsSetvoice        $01
	dc.b	nE4, $08
	smpsSetvoice        $02
	dc.b	nRst, $10, nC5, $08
	smpsSetvoice        $01
	dc.b	nE4, nRst
	smpsSetvoice        $02
	dc.b	nC5, nD5, $10, nC5, $08
	smpsSetvoice        $01
	dc.b	nE4, nRst, $10, nE4, nE4, $08, nRst, $18, $08, nRst, $08
	smpsSetvoice        $02
	dc.b	nB4, $18
	smpsSetvoice        $01
	dc.b	nE4, $08, nRst, $10
	smpsSetvoice        $02
	dc.b	nB4, $08
	smpsSetvoice        $01
	dc.b	nE4, $10
	smpsSetvoice        $02
	dc.b	nB4, $08, nC5, $10, nB4, $08
	smpsSetvoice        $01
	dc.b	nE4, nRst, $10, nE4, nE4, $08
	smpsSetvoice        $02
	dc.b	nA4, $10, $08
	smpsSetvoice        $01
	dc.b	nE4, nRst
	smpsSetvoice        $02
	dc.b	nA4, nA4, $10
	smpsSetvoice        $01
	dc.b	nE4, $08, nRst, $18, $10
	smpsSetvoice        $02
	dc.b	nA4, $08, nB4, $10, nA4, $08
	smpsSetvoice        $01
	dc.b	nE4, nRst, $10, nE4, nE4, $08
	smpsSetvoice        $02
	dc.b	nAb4, $10, $08
	smpsSetvoice        $01
	dc.b	nEb4, nRst, $20
	smpsSetvoice        $02
	dc.b	nAb4, $08
	smpsSetvoice        $01
	dc.b	nEb4, nRst
	smpsSetvoice        $02
	dc.b	nAb4
	smpsSetvoice        $01
	dc.b	nEb4, nRst
	smpsSetvoice        $02
	dc.b	nAb4
	smpsSetvoice        $01
	dc.b	nEb4, nRst
	smpsSetvoice        $02
	dc.b	nCs5
	smpsSetvoice        $01
	dc.b	nEb4, nRst
	smpsSetvoice        $02
	dc.b	nD5
	smpsSetvoice        $01
	dc.b	nEb4, nRst
	smpsSetvoice        $02
	dc.b	nEb5, nC5, $18
	smpsSetvoice        $01
	dc.b	nE4, $08, nRst
	smpsSetvoice        $02
	dc.b	nC5
	smpsSetvoice        $01
	dc.b	nE4, nRst
	smpsSetvoice        $02
	dc.b	nC5, $20, nE4, $18
	smpsSetvoice        $02
	dc.b	nB4, $10
	smpsSetvoice        $01
	dc.b	nE4, $18
	smpsSetvoice        $02
	dc.b	nC5, $08
	smpsSetvoice        $01
	dc.b	nE4, $10
	smpsSetvoice        $02
	dc.b	nB4, $08, nRst, $10, nA4, $08
	smpsSetvoice        $01
	dc.b	nE4, nRst
	smpsSetvoice        $02
	dc.b	nA4
	smpsSetvoice        $01
	dc.b	nE4, nRst
	smpsSetvoice        $02
	dc.b	nA4, nRst, $10, $08
	smpsSetvoice        $01
	dc.b	nA4, nRst
	smpsSetvoice        $02
	dc.b	nA4
	smpsSetvoice        $01
	dc.b	nA4, nRst
	smpsSetvoice        $02
	dc.b	nE5
	smpsSetvoice        $01
	dc.b	nA4, nRst
	smpsSetvoice        $02
	dc.b	nC5
	smpsSetvoice        $01
	dc.b	nA4, nRst
	smpsSetvoice        $02
	dc.b	nC5
	smpsSetvoice        $01
	dc.b	nRst, $18, nE4, nRst, nE4, nRst, nF4, nRst, nF4, nRst, nE4, nRst
	dc.b	nE4, nRst, nF4, nRst, nF4, nRst, nE5, nRst, nE5, nRst, nF5, $30
	dc.b	$10, nE5, $08, nRst, $30, nRst, nRst, nRst
	smpsJump            Mus_CNZ_Jump03

; FM4 Data
Mus_CNZ_FM4:
	dc.b	nRst, $30, nRst
	smpsModSet          $02, $01, $02, $03

Mus_CNZ_Jump02:
	smpsSetvoice        $04
	smpsPan             panRight, $00
	dc.b	nRst, $18, nEb5, $30, nC5, $08, nRst, $10, nFs5, nF5, $08, nRst
	dc.b	$10, nEb5, $08, nRst, $10, nC5, $20, nRst, $18, nG4, $08, nRst
	dc.b	$10, nBb4, nAb4, $08, nRst, $10, nG4, $08, nRst, $30
	smpsPan             panCenter, $00
	smpsModSet          $06, $03, $03, $04
	dc.b	nE4, $10, nRst, $08, nE4, $10, nRst, $08, nE4, $30, smpsNoAttack, $30
	dc.b	nRst, $18, nE4, $10, nRst, $08, nF4, $10, nE4, $20, nAb4, $10
	dc.b	$08, nRst, $10, nE4, $30, smpsNoAttack, $08, smpsNoAttack, $30, nRst, $18, nE4
	dc.b	nA4, $10, $08, nRst, $10, nE4, $08, nC4, $30, smpsNoAttack, nC4, $18
	dc.b	nRst, nC4, $10, nRst, $08, nD4, $10, nC4, $08, nEb4, $18, nD4
	dc.b	$10, nC4, $30, smpsNoAttack, $08, smpsNoAttack, $30, smpsNoAttack, $18, nRst, $18, nRst
	dc.b	$18, nE4, $0C, nRst, nF4, nRst, nE4, nRst, nAb4, $10, $08, nRst
	dc.b	$10, nE4, $30, smpsNoAttack, $08, nRst, $18, nA4, $30, nB4, $10, nA4
	dc.b	$08, nC5, $30, nRst, $18, nA4, nG4, $30, nE4, nC4, nD4, nEb4
	dc.b	nF4, $10, nEb4, $08, nF4, $10, nG4, $08
	smpsSetvoice        $03
	smpsAlterPitch      $0C
	smpsModSet          $02, $04, $02, $02
	dc.b	nRst, $30, nRst, $10, nG3, $08, nA3, $10, nC4, $08, nE4, $30
	dc.b	smpsNoAttack, $30, nRst, $18, nE4, $10, nRst, $08, nF4, $10, nE4, $20
	dc.b	nAb4, $10, $08, nRst, $10, nE4, $30, smpsNoAttack, $08, smpsNoAttack, $30, nRst
	dc.b	$18, nE4, nA4, $10, $08, nRst, $10, nE4, $08, nC4, $30, smpsNoAttack
	dc.b	nC4, $18, nRst, nC4, $10, nRst, $08, nD4, $10, nC4, $08, nEb4
	dc.b	$18, nD4, $10, nC4, $30, smpsNoAttack, $08, smpsNoAttack, $30, smpsNoAttack, $18, nRst
	dc.b	$18, nRst, $18, nE4, $0C, nRst, nF4, nRst, nE4, nRst, nAb4, $10
	dc.b	$08, nRst, $10, nE4, $30, smpsNoAttack, $08, nRst, $18, nA4, $30, nB4
	dc.b	$10, nA4, $08, nC5, $30, nRst, $18, nA4, $08, nRst, $10, nG4
	dc.b	$30, nE4, nC4, nD4, $18, nA4, $08, nRst, $10, nG4, $30, nE4
	dc.b	nC4, nD4, $18, nA4, $08, nRst, $10, nG4, $30, nE4, nC4, nD4
	dc.b	$28, nC4, $08, nRst, $30, nRst, nRst, nRst
	smpsAlterPitch      $F4
	smpsJump            Mus_CNZ_Jump02

; FM5 Data
Mus_CNZ_FM5:
	dc.b	nRst, $30, nRst
	smpsSetvoice        $02
	smpsModSet          $02, $04, $04, $04
	smpsPan             panLeft, $00

Mus_CNZ_Jump01:
	dc.b	nRst, $18, nC5, $30, nG4, $08, nRst, $10, nD5, nD5, $08, nRst
	dc.b	$10, nC5, $08, nRst, $10, nG4, $20, nRst, $18, nD4, $08, nRst
	dc.b	$10, nF4, nEb4, $08, nRst, $10, nD4, $08, nRst, $30
	smpsSetvoice        $04
	smpsModSet          $06, $04, $03, $04
	dc.b	nA3, $10, nRst, $08, nB3, $10, nRst, $08, nC4, $30, smpsNoAttack, $30
	dc.b	nRst, $18, nC4, $10, nRst, $08, nD4, $10, nC4, $20, nE4, $10
	dc.b	nF4, $08, nRst, $10, nB3, $30, smpsNoAttack, $08, smpsNoAttack, $30, nRst, $18
	dc.b	nC4, nE4, $10, $08, nRst, $10, nC4, $08, nG3, $30, smpsNoAttack, nG3
	dc.b	$18, nRst, nA3, $10, nRst, $08, nA3, $10, $08, nC4, $18, nBb3
	dc.b	$10, nAb3, $30, smpsNoAttack, $08, smpsNoAttack, $30, smpsNoAttack, $18, nRst, $18, nRst
	dc.b	$18, nC4, $0C, nRst, nD4, nRst, nC4, nRst, nF4, $10, nE4, $08
	dc.b	nRst, $10, nB3, $30, smpsNoAttack, $08, nRst, $18, nE4, $30, nG4, $10
	dc.b	nE4, $08, nF4, $30, nRst, $18, nF4, nE4, $30, nC4, nG3, nB3
	dc.b	nBb3, nC4, $10, nBb3, $08, nC4, $10, nD4, $08
	smpsSetvoice        $03
	smpsAlterPitch      $0C
	smpsModSet          $02, $04, $02, $04
	dc.b	nRst, $30, nRst, $10, nD3, $08, nE3, $10, nG3, $08, nC4, $30
	dc.b	smpsNoAttack, $30, nRst, $18, nC4, $10, nRst, $08, nD4, $10, nC4, $20
	dc.b	nE4, $10, nF4, $08, nRst, $10, nB3, $30, smpsNoAttack, $08, smpsNoAttack, $30
	dc.b	nRst, $18, nC4, nE4, $10, $08, nRst, $10, nC4, $08, nG3, $30
	dc.b	smpsNoAttack, nG3, $18, nRst, nA3, $10, nRst, $08, $10, $08, nC4, $18
	dc.b	nBb3, $10, nAb3, $30, smpsNoAttack, $08, smpsNoAttack, $30, smpsNoAttack, $18, nRst, $18
	dc.b	nRst, $18, nC4, $0C, nRst, nD4, nRst, nC4, nRst, nF4, $10, nE4
	dc.b	$08, nRst, $10, nB3, $30, smpsNoAttack, $08, nRst, $18, nE4, $30, nG4
	dc.b	$10, nE4, $08, nF4, $30, nRst, $18, nF4, $08, nRst, $10, nE4
	dc.b	$30, nC4, nG3, nB3, $18, nF4, $08, nRst, $10, nE4, $30, nC4
	dc.b	nG3, nA3, $18, nF5, $08, nRst, $10, nE5, $30, nC5, nG4, nB4
	dc.b	$28, nC5, $08, nRst, $30, nRst, nRst, nRst
	smpsAlterPitch      $F4
	smpsJump            Mus_CNZ_Jump01

; PSG3 Data
Mus_CNZ_PSG3:
	smpsPSGform         $E7
	dc.b	nRst, $30, nRst

Mus_CNZ_Loop03:
	smpsPSGvoice        fTone_02
	dc.b	nA5, $10, $08
	smpsPSGvoice        fTone_01
	dc.b	nA5, $18
	smpsLoop            $00, $06, Mus_CNZ_Loop03
	smpsPSGvoice        fTone_01
	dc.b	nA5, $30, $18, $18

Mus_CNZ_Loop04:
	smpsPSGvoice        fTone_01
	dc.b	nA5, $18
	smpsPSGvoice        fTone_02
	dc.b	nA5, $10, $08
	smpsLoop            $00, $44, Mus_CNZ_Loop04
	dc.b	nRst, $30, nRst, nRst, $30, nRst
	smpsJump            Mus_CNZ_Loop03

; DAC Data
Mus_CNZ_DAC:
	dc.b	dSnare, $10, dKick, $18, $08, dSnare, $10, dKick, $08, dSnare, dSnare, dSnare

Mus_CNZ_Jump00:
	dc.b	dKick, $18, dSnare, dKick, dSnare, dKick, dSnare, dKick, dSnare, dKick, dMidTom, $08
	dc.b	dMidTom, dMidTom, dLowTom, dLowTom, dFloorTom, dSnare, $10, dKick, $08, $10, dSnare, $08
	dc.b	$10, dKick, $18, dKick, dKick, $08

Mus_CNZ_Loop00:
	dc.b	dKick, $18, dSnare, $10, dKick, $08, $10, dSnare, $18, dKick, $08, $18
	dc.b	dSnare, $10, dKick, $08, $10, dMidTom, $08, dLowTom, $18
	smpsLoop            $00, $05, Mus_CNZ_Loop00
	dc.b	dKick, $18, dSnare, $10, dKick, $08, $10, dSnare, $18, dKick, $08, $10
	dc.b	dSnare, $18, $08, $10, $08, dSnare, dSnare, dSnare, dKick, $18, dSnare, dKick
	dc.b	dSnare, $08, dSnare, dSnare, dKick, $10, dSnare, $08, $18, dKick, dSnare, $08
	dc.b	dLowTom, dFloorTom, dKick, dKick, dSnare, dKick, $10, dSnare, $08, dKick, $10, dSnare
	dc.b	$08, dMidTom, dLowTom, dFloorTom, dKick, $10, $08, dSnare, $18, dMidTom, $08, dLowTom
	dc.b	dFloorTom, dMidTom, dLowTom, dFloorTom

Mus_CNZ_Loop01:
	dc.b	dKick, $18, dSnare, $10, dKick, $08, $10, dSnare, $18, dKick, $08, $18
	dc.b	dSnare, $10, dKick, $08, $10, dMidTom, $08, dLowTom, $18
	smpsLoop            $00, $03, Mus_CNZ_Loop01
	dc.b	dKick, $18, dSnare, $10, dKick, $08, $10, dSnare, $18, dKick, $08, $10
	dc.b	dSnare, $08, dSnare, dSnare, dSnare, dKick, dSnare, dSnare, dSnare, $10, $08, dKick
	dc.b	$18, dSnare, $10, dKick, $08, $10, dSnare, $18, dKick, $08, $18, dSnare
	dc.b	$10, dKick, $08, $10, dMidTom, $08, dLowTom, $18, dKick, dSnare, $10, dKick
	dc.b	$08, $10, dSnare, $18, dKick, $08, $10, dSnare, $08, $10, $08, dKick
	dc.b	dSnare, dSnare, dSnare, dSnare, dSnare

Mus_CNZ_Loop02:
	dc.b	dKick, $18, dSnare, dKick, dSnare, $10, $08, dKick, $18, dSnare, dKick, $10
	dc.b	dSnare, $18, $08
	smpsLoop            $00, $02, Mus_CNZ_Loop02
	dc.b	dKick, $18, dSnare, dKick, dSnare, $10, $08, dKick, $10, $08, dMidTom, dLowTom
	dc.b	dFloorTom, dSnare, dSnare, dSnare, dSnare, dSnare, dSnare, dKick, dSnare, dSnare, dSnare, dKick
	dc.b	dSnare, dSnare, dSnare, dKick, dSnare, dSnare, dSnare, nRst, $30, nRst
	smpsJump            Mus_CNZ_Jump00

; PSG1 Data
Mus_CNZ_PSG1:
	dc.b	nRst, $30, nRst
	smpsModSet          $02, $04, $01, $02

Mus_CNZ_Jump07:
	smpsPSGvoice        fTone_01
	dc.b	nRst, $18, nEb5, $30, nC5, $08, nRst, $10, nFs5, nF5, $08, nRst
	dc.b	$10, nEb5, $08, nRst, $10, nC5, $20, nRst, $18, nG4, $08, nRst
	dc.b	$10, nBb4, nAb4, $08, nRst, $10, nG4, $08
	smpsAlterVol        $02
	smpsPSGvoice        fTone_0A
	dc.b	nRst, $03, nRst, $30
	smpsModSet          $02, $02, $01, $02
	dc.b	nE4, $10, nRst, $08, nE4, $10, nRst, $08, nE4, $30, smpsNoAttack, $30
	dc.b	nRst, $18, nE4, $10, nRst, $08, nF4, $10, nE4, $20, nAb4, $10
	dc.b	$08, nRst, $10, nE4, $30, smpsNoAttack, $08, smpsNoAttack, $30, nRst, $18, nE4
	dc.b	nA4, $10, $08, nRst, $10, nE4, $08, nC4, $30, smpsNoAttack, nC4, $18
	dc.b	nRst, nC4, $10, nRst, $08, nD4, $10, nC4, $08, nEb4, $18, nD4
	dc.b	$10, nC4, $30, smpsNoAttack, $08, smpsNoAttack, $30, smpsNoAttack, $18, nRst, $18, nRst
	dc.b	$18, nE4, $0C, nRst, nF4, nRst, nE4, nRst, nAb4, $10, $08, nRst
	dc.b	$10, nE4, $30, smpsNoAttack, $08, nRst, $18, nA4, $30, nB4, $10, nA4
	dc.b	$08, nC5, $30, nRst, $18, nA4, nG4, $30, nE4, nC4, nD4, nEb4
	dc.b	nF4, $10, nEb4, $08, nF4, $10, nG4, $08
	smpsAlterPitch      $0C
	dc.b	nRst, $30, nRst, $10, nG3, $08, nA3, $10, nC4, $08, nE4, $30
	dc.b	smpsNoAttack, $30, nRst, $18, nE4, $10, nRst, $08, nF4, $10, nE4, $20
	dc.b	nAb4, $10, $08, nRst, $10, nE4, $30, smpsNoAttack, $08, smpsNoAttack, $30, nRst
	dc.b	$18, nE4, nA4, $10, $08, nRst, $10, nE4, $08, nC4, $30, smpsNoAttack
	dc.b	nC4, $18, nRst, nC4, $10, nRst, $08, nD4, $10, nC4, $08, nEb4
	dc.b	$18, nD4, $10, nC4, $30, smpsNoAttack, $08, smpsNoAttack, $30, smpsNoAttack, $18, nRst
	dc.b	$18, nRst, $18, nE4, $0C, nRst, nF4, nRst, nE4, nRst, nAb4, $10
	dc.b	$08, nRst, $10, nE4, $30, smpsNoAttack, $08, nRst, $18, nA4, $30, nB4
	dc.b	$10, nA4, $08, nC5, $30, nRst, $18, nA4, $08, nRst, $10, nG4
	dc.b	$30, nE4, nC4, nD4, $18
	smpsAlterVol        $04
	dc.b	nA4, $08, nRst, $10, nG4, $30, nE4, nC4, nD4, $18
	smpsAlterVol        $FC
	dc.b	nA4, $08, nRst, $10, nG4, $30, nE4, nC4, nD4, $28, nC4, $08
	dc.b	nRst, $30, nRst, nRst, nRst, $2D
	smpsAlterPitch      $F4
	smpsAlterVol        $FE
	smpsJump            Mus_CNZ_Jump07

; PSG2 Data
Mus_CNZ_PSG2:
	dc.b	nRst, $30, nRst
	smpsModSet          $02, $05, $01, $02
	smpsPSGvoice        fTone_01

Mus_CNZ_Jump06:
	smpsPSGvoice        fTone_01
	dc.b	nRst, $18, nC5, $30, nG4, $08, nRst, $10, nD5, nD5, $08, nRst
	dc.b	$10, nC5, $08, nRst, $10, nG4, $20, nRst, $18, nD4, $08, nRst
	dc.b	$10, nF4, nEb4, $08, nRst, $10, nD4, $08
	smpsPSGvoice        fTone_0A
	smpsAlterVol        $02
	dc.b	nRst, $03, nRst, $30
	smpsModSet          $02, $02, $01, $02
	dc.b	nA3, $10, nRst, $08, nB3, $10, nRst, $08, nC4, $30, smpsNoAttack, $30
	dc.b	nRst, $18, nC4, $10, nRst, $08, nD4, $10, nC4, $20, nE4, $10
	dc.b	nF4, $08, nRst, $10, nB3, $30, smpsNoAttack, $08, smpsNoAttack, $30, nRst, $18
	dc.b	nC4, nE4, $10, $08, nRst, $10, nC4, $08, nG3, $30, smpsNoAttack, nG3
	dc.b	$18, nRst, nA3, $10, nRst, $08, nA3, $10, $08, nC4, $18, nBb3
	dc.b	$10, nAb3, $30, smpsNoAttack, $08, smpsNoAttack, $30, smpsNoAttack, $18, nRst, $18, nRst
	dc.b	$18, nC4, $0C, nRst, nD4, nRst, nC4, nRst, nF4, $10, nE4, $08
	dc.b	nRst, $10, nB3, $30, smpsNoAttack, $08, nRst, $18, nE4, $30, nG4, $10
	dc.b	nE4, $08, nF4, $30, nRst, $18, nF4, nE4, $30, nC4, nG3, nB3
	dc.b	nBb3, nC4, $10, nBb3, $08, nC4, $10, nD4, $08
	smpsAlterPitch      $0C
	dc.b	nRst, $30, nRst, $10, nD3, $08, nE3, $10, nG3, $08, nC4, $30
	dc.b	smpsNoAttack, $30, nRst, $18, nC4, $10, nRst, $08, nD4, $10, nC4, $20
	dc.b	nE4, $10, nF4, $08, nRst, $10, nB3, $30, smpsNoAttack, $08, smpsNoAttack, $30
	dc.b	nRst, $18, nC4, nE4, $10, $08, nRst, $10, nC4, $08, nG3, $30
	dc.b	smpsNoAttack, nG3, $18, nRst, nA3, $10, nRst, $08, $10, $08, nC4, $18
	dc.b	nBb3, $10, nAb3, $30, smpsNoAttack, $08, smpsNoAttack, $30, smpsNoAttack, $18, nRst, $18
	dc.b	nRst, $18, nC4, $0C, nRst, nD4, nRst, nC4, nRst, nF4, $10, nE4
	dc.b	$08, nRst, $10, nB3, $30, smpsNoAttack, $08, nRst, $18, nE4, $30, nG4
	dc.b	$10, nE4, $08, nF4, $30, nRst, $18, nF4, $08, nRst, $10, nE4
	dc.b	$30, nC4, nG3, nB3, $18
	smpsAlterVol        $04
	dc.b	nF4, $08, nRst, $10, nE4, $30, nC4, nG3, nA3, $18
	smpsAlterVol        $FC
	dc.b	nF5, $08, nRst, $10, nE5, $30, nC5, nG4, nB4, $28, nC5, $08
	dc.b	nRst, $30, nRst, nRst, nRst, $2D
	smpsAlterPitch      $F4
	smpsAlterVol        $FE
	smpsJump            Mus_CNZ_Jump06

Mus_CNZ_Voices:
;	Voice $00
;	$35
;	$10, $51, $00, $11, 	$5F, $5F, $5F, $5F, 	$0E, $1F, $1F, $1F
;	$00, $00, $00, $00, 	$46, $07, $07, $07, 	$1A, $80, $8A, $80
	smpsVcAlgorithm     $05
	smpsVcFeedback      $06
	smpsVcUnusedBits    $00
	smpsVcDetune        $01, $00, $05, $01
	smpsVcCoarseFreq    $01, $00, $01, $00
	smpsVcRateScale     $01, $01, $01, $01
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $1F, $1F, $1F, $0E
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $00, $00, $00, $04
	smpsVcReleaseRate   $07, $07, $07, $06
	smpsVcTotalLevel    $00, $0A, $00, $1A

;	Voice $01
;	$34
;	$33, $41, $7E, $74, 	$9B, $5F, $1F, $1F, 	$04, $0A, $07, $08
;	$00, $00, $00, $00, 	$F9, $F7, $EC, $FD, 	$21, $80, $33, $8F
	smpsVcAlgorithm     $04
	smpsVcFeedback      $06
	smpsVcUnusedBits    $00
	smpsVcDetune        $07, $07, $04, $03
	smpsVcCoarseFreq    $04, $0E, $01, $03
	smpsVcRateScale     $00, $00, $01, $02
	smpsVcAttackRate    $1F, $1F, $1F, $1B
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $08, $07, $0A, $04
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $0F, $0E, $0F, $0F
	smpsVcReleaseRate   $0D, $0C, $07, $09
	smpsVcTotalLevel    $0F, $33, $00, $21

;	Voice $02
;	$3C
;	$01, $02, $0F, $04, 	$8D, $52, $9F, $1F, 	$09, $00, $00, $0D
;	$00, $00, $00, $00, 	$23, $08, $02, $F7, 	$15, $80, $1D, $87
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $04, $0F, $02, $01
	smpsVcRateScale     $00, $02, $01, $02
	smpsVcAttackRate    $1F, $1F, $12, $0D
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $0D, $00, $00, $09
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $0F, $00, $00, $02
	smpsVcReleaseRate   $07, $02, $08, $03
	smpsVcTotalLevel    $07, $1D, $00, $15

;	Voice $03
;	$04
;	$30, $01, $30, $01, 	$07, $1E, $1A, $1F, 	$00, $0F, $00, $0F
;	$00, $00, $00, $00, 	$1F, $1B, $1F, $18, 	$2C, $80, $1A, $80
	smpsVcAlgorithm     $04
	smpsVcFeedback      $00
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $03, $00, $03
	smpsVcCoarseFreq    $01, $00, $01, $00
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1A, $1E, $07
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $0F, $00, $0F, $00
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $01, $01, $01, $01
	smpsVcReleaseRate   $08, $0F, $0B, $0F
	smpsVcTotalLevel    $00, $1A, $00, $2C

;	Voice $04
;	$3D
;	$01, $02, $02, $02, 	$10, $50, $50, $50, 	$07, $08, $08, $08
;	$01, $00, $00, $00, 	$24, $18, $18, $18, 	$1C, $89, $89, $89
	smpsVcAlgorithm     $05
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $02, $02, $02, $01
	smpsVcRateScale     $01, $01, $01, $00
	smpsVcAttackRate    $10, $10, $10, $10
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $08, $08, $08, $07
	smpsVcDecayRate2    $00, $00, $00, $01
	smpsVcDecayLevel    $01, $01, $01, $02
	smpsVcReleaseRate   $08, $08, $08, $04
	smpsVcTotalLevel    $09, $09, $09, $1C
