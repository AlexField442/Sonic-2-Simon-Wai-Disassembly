sndDB_Header:
	smpsHeaderStartSong 2
	smpsHeaderVoice     sndDB_Voices
	smpsHeaderTempoSFX  $01
	smpsHeaderChanSFX   $01

	smpsHeaderSFXChannel cPSG3, sndDB_PSG3,	$00, $00

; PSG3 Data
sndDB_PSG3:
	smpsPSGvoice        $00
	smpsPSGform         $E7
	dc.b	nAb5, $01, nF6, $02, smpsNoAttack

sndDB_Loop00:
	dc.b	$02
	smpsPSGAlterVol     $01
	dc.b	smpsNoAttack
	smpsLoop            $00, $14, sndDB_Loop00
	smpsStop

; Song seems to not use any FM voices
sndDB_Voices:
