.386
.MODEL FLAT

	extrn	ExitProcess:proc
	extrn	MessageBoxA:proc
	
.DATA

	MSG_TITLE	DB	'TestApp',0
	MSG_MESSAGE	DB	'I am running!',0
	MB_INFORMATION	DD 40h

.CODE
Start:
	push	MB_INFORMATION		;Message box style (Icon - Information)
	push	offset MSG_TITLE	;Message box title
	push	offset MSG_MESSAGE	;Message box text
	push	0					;hwndOwner
	call	MessageBoxA
	
	push	0
	call	ExitProcess
end	Start