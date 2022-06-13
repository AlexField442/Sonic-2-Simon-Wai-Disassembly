; redefine align in terms of cnop, for the padding counter
align macro alignment
	cnop 0,alignment
	endm