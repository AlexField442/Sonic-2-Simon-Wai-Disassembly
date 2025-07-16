Mus_GHZ_Header:
	smpsHeaderStartSong 2
	smpsHeaderVoice     Mus_GHZ_Voices
	smpsHeaderChan      $06, $03
	smpsHeaderTempo     $01, $0E

	smpsHeaderDAC       Mus_GHZ_DAC
	smpsHeaderFM        Mus_GHZ_FM1,	$00, $0E
	smpsHeaderFM        Mus_GHZ_FM2,	$00, $16
	smpsHeaderFM        Mus_GHZ_FM3,	$00, $16
	smpsHeaderFM        Mus_GHZ_FM4,	$00, $20
	smpsHeaderFM        Mus_GHZ_FM5,	$00, $25
	smpsHeaderPSG       Mus_GHZ_PSG1,	$DC, $04, $00, fTone_03
	smpsHeaderPSG       Mus_GHZ_PSG2,	$DC, $04, $00, fTone_01
	smpsHeaderPSG       Mus_GHZ_PSG3,	$00, $02, $00, fTone_02

; FM5 Data
Mus_GHZ_FM5:
	dc.b	nRst, $30
	smpsSetvoice        $00
	smpsAlterVol        $F8
	dc.b	nB6, $06, nG6, nE6, nC6, nG6, nE6, nC6, nA5, nG6, nE6, nC6
	dc.b	nA5, nG6, nE6, nC6, nA5, nA6, nF6, nD6, nBb5, nA6, nF6, nD6
	dc.b	nBb5
	smpsAlterVol        $08

Mus_GHZ_Jump03:
	smpsAlterVol        $F8
	smpsPan             panCenter, $00
	smpsModSet          $30, $01, $04, $04
	smpsSetvoice        $01

Mus_GHZ_Loop06:
	dc.b	nG5, $30, smpsNoAttack, $30, nA5, smpsNoAttack, $30, nF5, smpsNoAttack, $30, nE5, smpsNoAttack
	dc.b	$30
	smpsLoop            $00, $04, Mus_GHZ_Loop06
	smpsSetvoice        $02
	smpsAlterVol        $FC
	smpsPan             panLeft, $00
	dc.b	nE5, $18, nE5, nE5, nE5, nD5, nD5, nD5, nD5, nD5, nD5, nD5
	dc.b	nD5, nE5, nE5, nE5, nE5, nE5, nE5, nE5, nE5, nD5, nD5, nD5
	dc.b	nD5
	smpsAlterVol        $06
	smpsSetvoice        $03
	dc.b	nG4, $06, nRst, $0C, nA4, $30, smpsNoAttack, $1E, smpsNoAttack, $30, smpsNoAttack, $12
	dc.b	nRst, $1E
	smpsAlterVol        $06
	smpsJump            Mus_GHZ_Jump03

; FM2 Data
Mus_GHZ_FM2:
	smpsSetvoice        $03
	dc.b	nD5, $0C, nRst, $06, nE5, $30, smpsNoAttack, $1E, nC5, $30, nD5

Mus_GHZ_Jump02:
	smpsSetvoice        $03
	dc.b	nRst, $0C, nG5, $06, nRst, nA5, nRst, nG5, nRst, nC6, nRst, nC6
	dc.b	nRst, nD6, nE6, nRst, $0C, nRst, nD6, $18, nA5, $06, nRst, nC6
	dc.b	nC6, nRst, nD6, $0C, nRst, $12, nRst, $1E, nBb5, $06, nC6, nBb5
	dc.b	nD6, nRst, nC6, nRst, nBb5, nC6, nRst, nA5, smpsNoAttack, nA5, $30, smpsNoAttack
	dc.b	$18, nRst, $18, nRst, $0C, nG5, $06, nRst, nA5, nRst, nG5, nRst
	dc.b	nC6, nRst, nC6, nRst, nD6, nE6, nRst, $0C, nRst, nD6, $18, nA5
	dc.b	$0C, nC6, nRst, $06, nD6, $0C, nRst, $12, nRst, $1E, nBb5, $06
	dc.b	nC6, nBb5, nD6, nRst, nC6, nRst, nBb5, nC6, nRst, nA5, smpsNoAttack, nA5
	dc.b	$30, smpsNoAttack, $18, nRst, $18
	smpsSetvoice        $04
	smpsAlterVol        $FD
	smpsModSet          $12, $01, $0C, $04
	dc.b	nRst, $0C, nG4, $06, nRst, nG4, $0C, nA4, $06, nRst, nC5, nRst
	dc.b	nC5, $0C, nD5, nC5, nE5, nD5, $18, nA4, $30, smpsNoAttack, $0C, nRst
	dc.b	$0C, nBb4, $06, nRst, nBb4, $0C, nC5, nD5, nC5, nBb4, $06, nC5
	dc.b	$12, nA4, $30, smpsNoAttack, $30, nRst, $0C, nG4, $18, nA4, $0C, nC5
	dc.b	$06, nRst, nC5, $0C, nD5, nC5, nE5, nD5, $18, nA4, $30, smpsNoAttack
	dc.b	$0C, nRst, $0C, nBb4, $06, nRst, nBb4, $0C, nC5, nD5, nC5, nBb4
	dc.b	$06, nC5, $0C, nA4, $06, smpsNoAttack, $30, smpsNoAttack, $30
	smpsAlterVol        $03
	smpsModOff
	smpsSetvoice        $05
	smpsAlterPitch      $F4
	dc.b	nRst, $18, nF5, nG5, nA5, nB5, nC6, nD6, nB5, nRst, nB5, nC6
	dc.b	nD6, nC6, nD6, nE6, nC6, nRst, nF5, nG5, nA5, nB5, nC6, nD6
	dc.b	nB5
	smpsAlterPitch      $0C
	smpsAlterVol        $FD
	smpsSetvoice        $06
	dc.b	nD6, $06, nD6, nRst, nE6, $30, smpsNoAttack, $1E
	smpsSetvoice        $00
	smpsAlterPitch      $0C
	smpsAlterVol        $09
	dc.b	nA6, $06, nE6, nC6, nA5, nE6, nC6, nA5, nE5, nC6, nA5, nE5
	dc.b	nC5, nA5, nE5, nC5, nA4
	smpsAlterPitch      $F4
	smpsAlterVol        $FA
	smpsJump            Mus_GHZ_Jump02

; FM3 Data
Mus_GHZ_FM3:
	smpsSetvoice        $03
	smpsAlterNote       $01
	dc.b	nF5, $0C, nRst, $06, nG5, $30, smpsNoAttack, $1E, nE5, $30, nF5

Mus_GHZ_Jump01:
	smpsAlterNote       $03
	smpsSetvoice        $03
	smpsPan             panLeft, $00
	dc.b	nRst, $0C, nG4, $06, nRst, nA4, nRst, nG4, nRst, nC5, nRst, nC5
	dc.b	nRst, nD5, nE5, nRst, $0C, nRst, nD5, $18, nA4, $06, nRst, nC5
	dc.b	nC5, nRst, nD5, $0C, nRst, $12, nRst, $1E, nBb4, $06, nC5, nBb4
	dc.b	nD5, nRst, nC5, nRst, nBb4, nC5, nRst, nA4, smpsNoAttack, nA4, $30, smpsNoAttack
	dc.b	$18, nRst, $18, nRst, $0C, nG4, $06, nRst, nA4, nRst, nG4, nRst
	dc.b	nC5, nRst, nC5, nRst, nD5, nE5, nRst, $0C, nRst, nD5, $18, nA4
	dc.b	$0C, nC5, nRst, $06, nD5, $0C, nRst, $12, nRst, $1E, nBb4, $06
	dc.b	nC5, nBb4, nD5, nRst, nC5, nRst, nBb4, nC5, nRst, nA4, smpsNoAttack, nA4
	dc.b	$30, smpsNoAttack, $18, nRst, $18
	smpsSetvoice        $04
	smpsAlterVol        $07
	smpsPan             panLeft, $00
	dc.b	nRst, $1E, nG4, $06, nRst, nG4, $0C, nA4, $06, nRst, nC5, nRst
	dc.b	nC5, $0C, nD5, nC5, nE5, nD5, $18, nA4, $30, smpsNoAttack, $0C, nRst
	dc.b	$0C, nBb4, $06, nRst, nBb4, $0C, nC5, nD5, nC5, nBb4, $06, nC5
	dc.b	$12, nA4, $1E
	smpsSetvoice        $06
	smpsAlterNote       $00
	smpsAlterVol        $F9
	dc.b	nA5, $06, nE6, $03, nRst, $03, nRst, $06, nE6, $03, nRst, $03
	dc.b	nD6, $0C, nC6
	smpsSetvoice        $04
	smpsAlterNote       $01
	smpsAlterVol        $07
	dc.b	nRst, $18, nG4, nA4, $0C, nC5, $06, nRst, nC5, $0C, nD5, nC5
	dc.b	nE5, nD5, $18, nA4, $30, smpsNoAttack, $0C, nRst, $0C, nBb4, $06, nRst
	dc.b	nBb4, $0C, nC5, nD5, nC5, nBb4, $06, nC5, $0C, nA4, $06
	smpsSetvoice        $06
	smpsAlterVol        $F9
	smpsAlterNote       $00
	dc.b	nA5, $0C, nC6, $06, nRst, nA5, nRst, nD6, $12, nC6, $06, nRst
	dc.b	$18
	smpsSetvoice        $03
	smpsPan             panCenter, $00
	smpsAlterNote       $01
	dc.b	nC6, $24, nA5, $0C, nRst, $1E, nA5, $06, nC6, $0C, nB5, $06
	dc.b	nRst, nC6, nB5, $06, nRst, $18
	smpsSetvoice        $00
	smpsAlterNote       $00
	smpsAlterVol        $FE
	smpsAlterPitch      $0C
	smpsPan             panRight, $00
	dc.b	nB5, $03, nRst, $09, nC6, $06, nB5, $1E
	smpsAlterPitch      $F4
	smpsAlterVol        $02
	smpsSetvoice        $03
	smpsPan             panCenter, $00
	smpsAlterNote       $01
	dc.b	nRst, $18, nB5, $0C, nC6, nD6, nC6, nB5, nD5, nC6, $06, nRst
	dc.b	nC6, $18, nA6, $0C, nRst, $30, nC6, $24, nA5, $0C, nRst, $1E
	dc.b	nA5, $06, nC6, $0C, nB5, $06, nRst, nC6, nB5, $06, nRst, $18
	smpsSetvoice        $00
	smpsAlterNote       $00
	smpsAlterVol        $FE
	smpsAlterPitch      $0C
	smpsPan             panRight, $00
	dc.b	nB5, $03, nRst, $09, nC6, $06, nB5, $1E
	smpsAlterVol        $02
	smpsAlterPitch      $F4
	smpsSetvoice        $03
	smpsPan             panCenter, $00
	smpsAlterNote       $01
	dc.b	nD6, $06, nC6, nRst, nA5, $30, smpsNoAttack, $1E, smpsNoAttack, $30, smpsNoAttack, $12
	dc.b	nRst, $1E
	smpsJump            Mus_GHZ_Jump01

; FM4 Data
Mus_GHZ_FM4:
	smpsSetvoice        $03
	smpsAlterVol        $F8
	dc.b	nF4, $0C, nRst, $06, nG4, $30, smpsNoAttack, $1E, nE4, $30, nF4
	smpsAlterVol        $04

Mus_GHZ_Jump00:
	smpsPan             panCenter, $00
	smpsSetvoice        $02
	smpsModSet          $04, $01, $FC, $04
	smpsAlterPitch      $0C

Mus_GHZ_Loop05:
	dc.b	nE5, $30, smpsNoAttack, $30, nFs5, smpsNoAttack, $30, nD5, smpsNoAttack, $30, nC5, smpsNoAttack
	dc.b	$30
	smpsLoop            $00, $04, Mus_GHZ_Loop05
	smpsAlterPitch      $F4
	smpsSetvoice        $02
	smpsPan             panCenter, $00
	dc.b	nC5, $18, nC5, nC5, nC5, nB4, nB4, nB4, nB4, nB4, nB4, nB4
	dc.b	nB4, nC5, nC5, nC5, nC5, nC5, nC5, nC5, nC5, nB4, nB4, nB4
	dc.b	nB4
	smpsSetvoice        $03
	smpsAlterVol        $04
	dc.b	nD4, $06, nRst, $0C, nE4, $30, smpsNoAttack, $1E, smpsNoAttack, $30, smpsNoAttack, $12
	dc.b	nRst, $1E
	smpsAlterVol        $FC
	smpsJump            Mus_GHZ_Jump00

; FM1 Data
Mus_GHZ_FM1:
	smpsSetvoice        $07
	dc.b	nBb2, $12, nC3, $30, smpsNoAttack, $0C, nG3, $06, nE3, nC3, nA2, $0C
	dc.b	nA3, $06, nA3, nA2, $0C, nA3, $06, nA3, nBb2, $0C, nBb3, $06
	dc.b	nBb3, nBb2, $0C, nBb3, $06, nBb3

Mus_GHZ_Loop04:
	dc.b	nC3, $0C, nC4, $06, nRst, nC4, $0C, nG3, nD4, $12, nC4, $0C
	dc.b	nG3, $06, nA3, nC4, nD3, $0C, nD4, $06, nRst, nD4, $0C, nA3
	dc.b	nE4, $12, nD4, $06, nRst, nA3, nB3, nD4, nBb2, $0C, nBb3, $06
	dc.b	nRst, nBb3, $0C, nF3, nC4, $12, nBb3, $0C, nF3, $06, nG3, nBb3
	dc.b	nA2, $0C, nA3, $06, nA2, nB2, $0C, nB3, $06, nB2, nC3, $0C
	dc.b	nC4, $06, nC3, nA2, $0C, nA3, $06, nA2
	smpsLoop            $00, $04, Mus_GHZ_Loop04
	dc.b	nF3, $0C, nF4, nC3, nC4, nF3, nF4, nC3, nC4, nE3, nE4, nB2
	dc.b	nB3, nE3, nE4, nB2, nB3, nE3, nE4, nB2, nB3, nAb2, nAb3, nE2
	dc.b	nE3, nA2, nA3, nB2, nB3, nC3, nC4, nA2, nA3, nF3, nF4, nC3
	dc.b	nC4, nF3, nF4, nC3, nC4, nE3, nE4, nB2, nB3, nE3, nE4, nB2
	dc.b	nB3, nG2, $06, nG2, nRst, nA2, $30, smpsNoAttack, $1E, $06, $0C, $06
	dc.b	nB2, $0C, nC3, nD3, nC3, nB2, $06, nA2, $12
	smpsJump            Mus_GHZ_Loop04

; PSG1 Data
Mus_GHZ_PSG1:
	dc.b	nRst, $30, nRst, nRst, nRst

Mus_GHZ_Jump05:
	smpsAlterPitch      $0C
	smpsPSGvoice        fTone_0B
	smpsPSGAlterVol     $02

Mus_GHZ_Loop0B:
	dc.b	nG5, $30, smpsNoAttack, $30, nA5, smpsNoAttack, $30, nF5, smpsNoAttack, $30, nE5, smpsNoAttack
	dc.b	$30
	smpsLoop            $00, $04, Mus_GHZ_Loop0B
	dc.b	nRst, $30, nRst
	smpsPSGvoice        fTone_08
	smpsPSGAlterVol     $FF
	dc.b	nRst, nB5, $03, nRst, $09, nC6, $06, nB5, $0C
	smpsPSGAlterVol     $FF
	smpsPSGvoice        fTone_02
	smpsPSGAlterVol     $03
	dc.b	nB5, $06, nRst, $06
	smpsPSGAlterVol     $03
	dc.b	nB5, $03, nRst, $03
	smpsPSGAlterVol     $FA
	smpsPSGvoice        fTone_08
	smpsAlterPitch      $F4
	dc.b	nRst, $30, nRst, nC6, $06, nRst, nC6, $18, nA5, $0C, nRst, $30
	dc.b	nRst, nRst
	smpsAlterPitch      $0C
	smpsPSGAlterVol     $01
	dc.b	nRst, nB5, $03, nRst, $09, nC6, $06, nB5, $0C
	smpsPSGAlterVol     $FF
	smpsPSGvoice        fTone_02
	smpsPSGAlterVol     $03
	dc.b	nB5, $06, nRst, $06
	smpsPSGAlterVol     $03
	dc.b	nB5, $03, nRst, $03
	smpsPSGAlterVol     $FA
	smpsAlterPitch      $F4
	dc.b	nRst, $30, nRst, nRst, nRst
	smpsJump            Mus_GHZ_Jump05

; PSG2 Data
Mus_GHZ_PSG2:
	dc.b	nRst, $30, nRst, nRst, nRst

Mus_GHZ_Jump04:
	smpsPSGAlterVol     $03
	smpsPSGvoice        fTone_0B
	smpsAlterNote       $00

Mus_GHZ_Loop0A:
	dc.b	nE5, $30, smpsNoAttack, $30, nFs5, smpsNoAttack, $30, nD5, smpsNoAttack, $30, nC5, smpsNoAttack
	dc.b	$30
	smpsLoop            $00, $04, Mus_GHZ_Loop0A
	smpsModOff
	smpsPSGAlterVol     $FD
	dc.b	nRst, $30, nRst
	smpsPSGvoice        $00
	smpsAlterNote       $01
	smpsPSGAlterVol     $01
	dc.b	nRst, nB5, $03, nRst, $09, nC6, $06, nB5, $0C
	smpsPSGAlterVol     $FF
	smpsPSGvoice        fTone_02
	smpsPSGAlterVol     $03
	dc.b	nB5, $06, nRst, $06
	smpsPSGAlterVol     $03
	dc.b	nB5, $03, nRst, $03
	smpsPSGAlterVol     $FA
	smpsPSGvoice        $00
	dc.b	nRst, $30, nRst, nRst, nRst, nRst, nRst
	smpsPSGAlterVol     $01
	dc.b	nRst, nB5, $03, nRst, $09, nC6, $06, nB5, $0C
	smpsPSGAlterVol     $FF
	smpsPSGvoice        fTone_02
	smpsPSGAlterVol     $03
	dc.b	nB5, $06, nRst, $06
	smpsPSGAlterVol     $03
	dc.b	nB5, $03, nRst, $03
	smpsPSGAlterVol     $FA
	dc.b	nRst, $30, nRst, nRst, nRst
	smpsJump            Mus_GHZ_Jump04

; PSG3 Data
Mus_GHZ_PSG3:
	smpsPSGform         $E7
	smpsPSGvoice        fTone_02
	dc.b	nRst, $0C, nA5, $18, nA5, nA5, nA5, $0C, nRst, $30, nRst

Mus_GHZ_Loop07:
	dc.b	nA5, $0C, $06, nA5, nA5, $0C, $06, nA5, nA5, $0C, $06, nA5
	dc.b	nA5, $0C, $06, nA5
	smpsLoop            $00, $07, Mus_GHZ_Loop07
	dc.b	nA5, $0C, $06, nA5, nA5, $0C, $06, nA5, nA5, $0C, $06, nA5
	dc.b	nA5, $0C
	smpsPSGvoice        fTone_03
	dc.b	nA5
	smpsPSGvoice        fTone_02

Mus_GHZ_Loop08:
	dc.b	nA5, $0C, $06, nA5, nA5, $0C, $06, nA5, nA5, $0C, $06, nA5
	dc.b	nA5, $0C, $06, nA5
	smpsLoop            $00, $07, Mus_GHZ_Loop08
	dc.b	nA5, $0C, $06, nA5, nA5, $0C, $06, nA5, nA5, $0C, $06, nA5
	smpsPSGvoice        fTone_03
	dc.b	nA5, $0C
	smpsPSGvoice        fTone_02
	dc.b	nA5, $06, nA5

Mus_GHZ_Loop09:
	dc.b	nA5, $0C, $06, nA5, nA5, $0C, $06, nA5, nA5, $0C, $06, nA5
	dc.b	nA5, $0C, nA5, $06, nA5
	smpsLoop            $00, $03, Mus_GHZ_Loop09
	dc.b	nA5, $0C, $06, nA5, nA5, $0C, $06, nA5, nA5, $0C, $06, nA5
	smpsPSGvoice        fTone_03
	dc.b	nA5, $0C
	smpsPSGvoice        fTone_02
	dc.b	nA5, $06, nA5, nA5, $0C, $06, nA5, nA5, $0C, $06, nA5, nA5
	dc.b	$0C, $06, nA5, nA5, $0C, $06, nA5, nA5, $0C, $06, nA5, nA5
	dc.b	$0C, $06, nA5, nA5, $0C, $06, nA5
	smpsPSGvoice        fTone_03
	dc.b	nA5, $0C
	smpsPSGvoice        fTone_02
	dc.b	nA5, $06, nA5, nA5, $0C, $06, nA5, nA5, $0C, $06, nA5, nA5
	dc.b	$0C, $06, nA5
	smpsPSGvoice        fTone_03
	dc.b	nA5, $0C
	smpsPSGvoice        fTone_02
	dc.b	nA5, $06, nA5
	smpsPSGvoice        fTone_01
	dc.b	nA5, $18, nA5, nA5, nA5
	smpsPSGvoice        fTone_02
	smpsJump            Mus_GHZ_Loop07

; DAC Data
Mus_GHZ_DAC:
	dc.b	dKick, $12, $30, smpsNoAttack, $1E, $06, dMidTom, $0C, dFloorTom, $06, dMidTom, $0C
	dc.b	dMidTom, dMidTom, dKick, dFloorTom, $06, dMidTom, dFloorTom, $0C

Mus_GHZ_Loop00:
	dc.b	dKick, $18, dSnare, dKick, dSnare
	smpsLoop            $00, $07, Mus_GHZ_Loop00
	dc.b	dKick, $18, dSnare, dKick, $0C, dSnare, $18, $06, dSnare

Mus_GHZ_Loop01:
	dc.b	dKick, $18, dSnare, dKick, dSnare
	smpsLoop            $00, $03, Mus_GHZ_Loop01
	dc.b	dKick, $18, dSnare, dKick, $0C, dSnare, $18, $0C

Mus_GHZ_Loop02:
	dc.b	dKick, $18, dSnare, dKick, dSnare
	smpsLoop            $00, $03, Mus_GHZ_Loop02
	dc.b	dKick, $18, dSnare, dKick, dSnare, $0C, $06, dSnare, dKick, $18, dSnare, dKick
	dc.b	dSnare, dKick, dSnare, dKick, $0C, dSnare, dSnare, $18

Mus_GHZ_Loop03:
	dc.b	dKick, $18, dSnare, dKick, dSnare
	smpsLoop            $00, $03, Mus_GHZ_Loop03
	dc.b	dKick, $18, dSnare, dKick, $0C, dSnare, dSnare, $18, dKick, $12, dSnare, $30
	dc.b	nRst, $06, dSnare, $18, dKick, $06, dMidTom, $0C, $06, dSnare, $0C, dMidTom
	dc.b	dKick, dFloorTom, dFloorTom, dFloorTom, $06, dFloorTom
	smpsJump            Mus_GHZ_Loop00

Mus_GHZ_Voices:
;	Voice $00
;	$07
;	$05, $00, $01, $02, 	$1F, $1F, $1F, $1F, 	$0E, $0E, $0E, $0E
;	$02, $02, $02, $02, 	$55, $55, $55, $54, 	$80, $80, $80, $80
	smpsVcAlgorithm     $07
	smpsVcFeedback      $00
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $02, $01, $00, $05
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $0E, $0E, $0E, $0E
	smpsVcDecayRate2    $02, $02, $02, $02
	smpsVcDecayLevel    $05, $05, $05, $05
	smpsVcReleaseRate   $04, $05, $05, $05
	smpsVcTotalLevel    $00, $00, $00, $00

;	Voice $01
;	$35
;	$01, $01, $13, $00, 	$1F, $1D, $18, $19, 	$00, $09, $06, $0D
;	$00, $00, $02, $03, 	$00, $06, $15, $16, 	$1E, $80, $83, $80
	smpsVcAlgorithm     $05
	smpsVcFeedback      $06
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $01, $00, $00
	smpsVcCoarseFreq    $00, $03, $01, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $19, $18, $1D, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $0D, $06, $09, $00
	smpsVcDecayRate2    $03, $02, $00, $00
	smpsVcDecayLevel    $01, $01, $00, $00
	smpsVcReleaseRate   $06, $05, $06, $00
	smpsVcTotalLevel    $00, $03, $00, $1E

;	Voice $02
;	$3D
;	$02, $02, $01, $02, 	$14, $0E, $8C, $0E, 	$08, $0A, $07, $0A
;	$00, $0E, $0E, $0E, 	$1F, $1F, $1F, $1F, 	$1A, $84, $84, $84
	smpsVcAlgorithm     $05
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $02, $01, $02, $02
	smpsVcRateScale     $00, $02, $00, $00
	smpsVcAttackRate    $0E, $0C, $0E, $14
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $0A, $07, $0A, $08
	smpsVcDecayRate2    $0E, $0E, $0E, $00
	smpsVcDecayLevel    $01, $01, $01, $01
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $04, $04, $04, $1A

;	Voice $03
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

;	Voice $04
;	$3B
;	$07, $34, $32, $01, 	$1F, $14, $5F, $5F, 	$02, $02, $03, $04
;	$01, $01, $02, $03, 	$13, $13, $13, $17, 	$1E, $28, $28, $80
	smpsVcAlgorithm     $03
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $03, $03, $00
	smpsVcCoarseFreq    $01, $02, $04, $07
	smpsVcRateScale     $01, $01, $00, $00
	smpsVcAttackRate    $1F, $1F, $14, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $04, $03, $02, $02
	smpsVcDecayRate2    $03, $02, $01, $01
	smpsVcDecayLevel    $01, $01, $01, $01
	smpsVcReleaseRate   $07, $03, $03, $03
	smpsVcTotalLevel    $00, $28, $28, $1E

;	Voice $05
;	$3B
;	$52, $31, $31, $51, 	$12, $14, $12, $14, 	$0E, $00, $0E, $02
;	$00, $00, $00, $01, 	$47, $07, $57, $37, 	$1C, $18, $1D, $80
	smpsVcAlgorithm     $03
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $05, $03, $03, $05
	smpsVcCoarseFreq    $01, $01, $01, $02
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $14, $12, $14, $12
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $02, $0E, $00, $0E
	smpsVcDecayRate2    $01, $00, $00, $00
	smpsVcDecayLevel    $03, $05, $00, $04
	smpsVcReleaseRate   $07, $07, $07, $07
	smpsVcTotalLevel    $00, $1D, $18, $1C

;	Voice $06
;	$3D
;	$01, $21, $50, $01, 	$12, $14, $14, $0F, 	$0A, $05, $05, $05
;	$00, $00, $00, $00, 	$26, $28, $28, $18, 	$19, $80, $80, $80
	smpsVcAlgorithm     $05
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $05, $02, $00
	smpsVcCoarseFreq    $01, $00, $01, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $0F, $14, $14, $12
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $05, $05, $05, $0A
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $01, $02, $02, $02
	smpsVcReleaseRate   $08, $08, $08, $06
	smpsVcTotalLevel    $00, $00, $00, $19

;	Voice $07
;	$08
;	$0A, $70, $30, $00, 	$1F, $1F, $5F, $5F, 	$12, $0E, $0A, $0A
;	$00, $04, $04, $03, 	$2F, $2F, $2F, $2F, 	$24, $2D, $13, $80
	smpsVcAlgorithm     $00
	smpsVcFeedback      $01
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $03, $07, $00
	smpsVcCoarseFreq    $00, $00, $00, $0A
	smpsVcRateScale     $01, $01, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $0A, $0A, $0E, $12
	smpsVcDecayRate2    $03, $04, $04, $00
	smpsVcDecayLevel    $02, $02, $02, $02
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $13, $2D, $24

;	unused Voice $08
;	$3D
;	$01, $00, $02, $01, 	$1F, $0E, $0E, $0E, 	$07, $1F, $1F, $1F
;	$00, $00, $00, $00, 	$1F, $0F, $0F, $0F, 	$17, $8C, $8D, $8C
	smpsVcAlgorithm     $05
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $01, $00, $02, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $0E, $0E, $0E, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $1F, $1F, $1F, $07
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $00, $00, $00, $00
	smpsVcReleaseRate   $0F, $0F, $0F, $1F
	smpsVcTotalLevel    $8C, $8C, $8D, $17