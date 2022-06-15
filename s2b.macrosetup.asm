	padding off	; we don't want AS padding out dc.b instructions
	;listing off		; We don't need to generate anything for a listing file
	;listing on			; Want full listing file
	;listing noskipped	; Want listing file, but only the non-skipped part of conditional assembly
	listing purecode	; Want listing file, but only the final code in expanded macros
	page	0	; Don't want form feeds
	supmode on	; we don't need warnings about privileged instructions


paddingSoFar set 0

; 128 = 80h = z80, 32988 = 80DCh = z80unDoC 
notZ80 function cpu,(cpu<>128)&&(cpu<>32988)

; make org safer (impossible to overwrite previously assembled bytes) and count padding
; and also make it work in Z80 code without creating a new segment
org macro address
	if notZ80(MOMCPU)
		if address < *
			error "too much stuff before org $\{address} ($\{(*-address)} bytes)"
		elseif address > *
paddingSoFar	set paddingSoFar + address - *
			!org address
		endif
	else
		if address < $
			error "too much stuff before org 0\{address}h (0\{($-address)}h bytes)"
		else
			while address > $
				db 0
			endm
		endif
	endif
    endm

; define the cnop pseudo-instruction
cnop macro offset,alignment
	if notZ80(MOMCPU)
		org (*-1+(alignment)-((*-1+(-(offset)))#(alignment)))
	else
		org ($-1+(alignment)-(($-1+(-(offset)))#(alignment)))
	endif
    endm

; redefine align in terms of cnop, for the padding counter
align macro alignment
	cnop 0,alignment
    endm

; define the even pseudo-instruction
even macro
	if notZ80(MOMCPU)
		if (*)&1
paddingSoFar		set paddingSoFar+1
			dc.b 0 ;ds.b 1 
		endif
	else
		if ($)&1
			db 0
		endif
	endif
    endm

; make ds work in Z80 code without creating a new segment
ds macro
	if notZ80(MOMCPU)
		!ds.ATTRIBUTE ALLARGS
	else
		rept ALLARGS
			db 0
		endm
	endif
   endm

  if TRUE
; define a trace macro
; lets you easily check what address a location in this disassembly assembles to
; if used in Z80 code, the displayed PC will be relative to the start of Z80 RAM
trace macro optionalMessageWithoutQuotes
    if MOMPASS=1
	if notZ80(MOMCPU)
		if ("ALLARGS"<>"")
			message "#\{tracenum/1.0}: line=\{MOMLINE/1.0} PC=$\{*} msg=ALLARGS"
		else
			message "#\{tracenum/1.0}: line=\{MOMLINE/1.0} PC=$\{*}"
		endif
	else
		if ("ALLARGS"<>"")
			message "#\{tracenum/1.0}: line=\{MOMLINE/1.0} PC=\{$}h msg=ALLARGS"
		else
			message "#\{tracenum/1.0}: line=\{MOMLINE/1.0} PC=\{$}h"
		endif
	endif
tracenum := (tracenum+1)
    endif
   endm
  else
trace macro
	endm
  endif
tracenum := 0

bit function nBits,1<<(nBits-1)
signmask function val,nBits,-((-(val&bit(nBits)))&bit(nBits))
signextend function val,nBits,(val+signmask(val,nBits))!signmask(val,nBits)
signextendB function val,signextend(val,8)