.386
.MODEL FLAT

	extrn ExitProcess:proc

.DATA
	szHelp DB 'This program start and end'
.CODE
Start:
	nop
	nop
	nop
	push	0
	call	ExitProcess
end	Start