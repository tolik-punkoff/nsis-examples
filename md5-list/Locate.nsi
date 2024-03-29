Function Locate
	!define Locate `!insertmacro LocateCall`
 
	!macro LocateCall _PATH _OPTIONS _FUNC
		Push $0
		Push `${_PATH}`
		Push `${_OPTIONS}`
		GetFunctionAddress $0 `${_FUNC}`
		Push `$0`
		Call Locate
		Pop $0
	!macroend
 
	Exch $2
	Exch
	Exch $1
	Exch
	Exch 2
	Exch $0
	Exch 2
	Push $3
	Push $4
	Push $5
	Push $6
	Push $7
	Push $8
	Push $9
	Push $R6
	Push $R7
	Push $R8
	Push $R9
	ClearErrors
 
	StrCpy $3 ''
	StrCpy $4 ''
	StrCpy $5 ''
	StrCpy $6 ''
	StrCpy $7 ''
	StrCpy $8 0
	StrCpy $R7 ''
 
	StrCpy $R9 $0 1 -1
	StrCmp $R9 '\' 0 +3
	StrCpy $0 $0 -1
	goto -3
	IfFileExists '$0\*.*' 0 error
 
	option:
	StrCpy $R9 $1 1
	StrCpy $1 $1 '' 1
	StrCmp $R9 ' ' -2
	StrCmp $R9 '' sizeset
	StrCmp $R9 '/' 0 -4
	StrCpy $9 -1
	IntOp $9 $9 + 1
	StrCpy $R9 $1 1 $9
	StrCmp $R9 '' +2
	StrCmp $R9 '/' 0 -3
	StrCpy $R8 $1 $9
	StrCpy $R8 $R8 '' 2
	StrCpy $R9 $R8 '' -1
	StrCmp $R9 ' ' 0 +3
	StrCpy $R8 $R8 -1
	goto -3
	StrCpy $R9 $1 2
	StrCpy $1 $1 '' $9
 
	StrCmp $R9 'L=' 0 mask
	StrCpy $3 $R8
	StrCmp $3 '' +6
	StrCmp $3 'FD' +5
	StrCmp $3 'F' +4
	StrCmp $3 'D' +3
	StrCmp $3 'DE' +2
	StrCmp $3 'FDE' 0 error
	goto option
 
	mask:
	StrCmp $R9 'M=' 0 size
	StrCpy $4 $R8
	goto option
 
	size:
	StrCmp $R9 'S=' 0 gotosubdir
	StrCpy $6 $R8
	goto option
 
 
	gotosubdir:
	StrCmp $R9 'G=' 0 banner
	StrCpy $7 $R8
	StrCmp $7 '' +3
	StrCmp $7 '1' +2
	StrCmp $7 '0' 0 error
	goto option
 
	banner:
	StrCmp $R9 'B=' 0 error
	StrCpy $R7 $R8
	StrCmp $R7 '' +3
	StrCmp $R7 '1' +2
	StrCmp $R7 '0' 0 error
	goto option
 
	sizeset:
	StrCmp $6 '' default
	StrCpy $9 0
	StrCpy $R9 $6 1 $9
	StrCmp $R9 '' +4
	StrCmp $R9 ':' +3
	IntOp $9 $9 + 1
	goto -4
	StrCpy $5 $6 $9
	IntOp $9 $9 + 1
	StrCpy $1 $6 1 -1
	StrCpy $6 $6 -1 $9
	StrCmp $5 '' +2
	IntOp $5 $5 + 0
	StrCmp $6 '' +2
	IntOp $6 $6 + 0
 
	StrCmp $1 'B' 0 +3
	StrCpy $1 1
	goto default
	StrCmp $1 'K' 0 +3
	StrCpy $1 1024
	goto default
	StrCmp $1 'M' 0 +3
	StrCpy $1 1048576
	goto default
	StrCmp $1 'G' 0 error
	StrCpy $1 1073741824
 
	default:
	StrCmp $3 '' 0 +2
	StrCpy $3 'FD'
	StrCmp $4 '' 0 +2
	StrCpy $4 '*.*'
	StrCmp $7 '' 0 +2
	StrCpy $7 '1'
	StrCmp $R7 '' 0 +2
	StrCpy $R7 '0'
	StrCpy $7 'G$7B$R7'
 
	StrCpy $8 1
	Push $0
	SetDetailsPrint textonly
 
	nextdir:
	IntOp $8 $8 - 1
	Pop $R8
 
	StrCpy $9 $7 2 2
	StrCmp $9 'B0' +3
	GetLabelAddress $9 findfirst
	goto call
	DetailPrint 'Search in: $R8'
 
	findfirst:
	FindFirst $0 $R7 '$R8\$4'
	IfErrors subdir
	StrCmp $R7 '.' 0 +5
	FindNext $0 $R7
	StrCmp $R7 '..' 0 +3
	FindNext $0 $R7
	IfErrors subdir
 
	dir:
	IfFileExists '$R8\$R7\*.*' 0 file
	StrCpy $R6 ''
	StrCmp $3 'DE' +4
	StrCmp $3 'FDE' +3
	StrCmp $3 'FD' precall
	StrCmp $3 'F' findnext precall
	FindFirst $9 $R9 '$R8\$R7\*.*'
	StrCmp $R9 '.' 0 +4
	FindNext $9 $R9
	StrCmp $R9 '..' 0 +2
	FindNext $9 $R9
	FindClose $9
	IfErrors precall findnext
 
	file:
	StrCmp $3 'FDE' +3
	StrCmp $3 'FD' +2
	StrCmp $3 'F' 0 findnext
	StrCpy $R6 0
	StrCmp $5$6 '' precall
	FileOpen $9 '$R8\$R7' r
	IfErrors +3
	FileSeek $9 0 END $R6
	FileClose $9
	System::Int64Op $R6 / $1
	Pop $R6
	StrCmp $5 '' +2
	IntCmp $R6 $5 0 findnext
	StrCmp $6 '' +2
	IntCmp $R6 $6 0 0 findnext
 
	precall:
	StrCpy $9 0
	StrCpy $R9 '$R8\$R7'
 
	call:
	Push $0
	Push $1
	Push $2
	Push $3
	Push $4
	Push $5
	Push $6
	Push $7
	Push $8
	Push $9
	Push $R7
	Push $R8
	StrCmp $9 0 +4
	StrCpy $R6 ''
	StrCpy $R7 ''
	StrCpy $R9 ''
	Call $2
	Pop $R9
	Pop $R8
	Pop $R7
	Pop $9
	Pop $8
	Pop $7
	Pop $6
	Pop $5
	Pop $4
	Pop $3
	Pop $2
	Pop $1
	Pop $0
	IfErrors error
 
	StrCmp $R9 'StopLocate' clearstack
	goto $9
 
	findnext:
	FindNext $0 $R7
	IfErrors 0 dir
	FindClose $0
 
	subdir:
	StrCpy $9 $7 2
	StrCmp $9 'G0' end
	FindFirst $0 $R7 '$R8\*.*'
	StrCmp $R7 '.' 0 +5
	FindNext $0 $R7
	StrCmp $R7 '..' 0 +3
	FindNext $0 $R7
	IfErrors +7
 
	IfFileExists '$R8\$R7\*.*' 0 +3
	Push '$R8\$R7'
	IntOp $8 $8 + 1
	FindNext $0 $R7
	IfErrors 0 -4
	FindClose $0
	StrCmp $8 0 end nextdir
 
	error:
	SetErrors
 
	clearstack:
	StrCmp $8 0 end
	IntOp $8 $8 - 1
	Pop $R8
	goto clearstack
 
	end:
	SetDetailsPrint both
	Pop $R9
	Pop $R8
	Pop $R7
	Pop $R6
	Pop $9
	Pop $8
	Pop $7
	Pop $6
	Pop $5
	Pop $4
	Pop $3
	Pop $2
	Pop $1
	Pop $0
FunctionEnd