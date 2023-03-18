Unicode true

!include "FileFunc.nsh"
!insertmacro GetTime

Name "GetLocalTime"
OutFile "GetLocalTime.exe"
ShowInstDetails show
RequestExecutionLevel User

Section "Test"
	
	${GetTime} "" "L" $0 $1 $2 $3 $4 $5 $6
	DetailPrint "Local date and time:"
	DetailPrint "$2/$1/$0 ($3) $4:$5:$6"
	DetailPrint "String to add time in filename:"
	StrCpy $0 "$2-$1-$0-$4-$5-$6"
	DetailPrint "$0"
	
SectionEnd
