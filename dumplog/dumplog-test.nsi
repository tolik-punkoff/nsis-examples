Unicode true
!include dumplog.nsi

; Define your application name
!define APPNAME "DumplogTest"
!define APPNAMEANDVERSION "DumplogTest"

; Main Install settings
Name "${APPNAMEANDVERSION}"
InstallDir "$TEMP"
OutFile "dumplog.exe"
RequestExecutionLevel User
ShowInstDetails show

Section
	
	DetailPrint "Message #1"
	DetailPrint "Message #2"
	DetailPrint "Message #3"
	DetailPrint "Message #4"
	DetailPrint "Message #5"
	DetailPrint "Message #6"
	DetailPrint "Сообщение на русском языке."
	DetailPrint "Save log to $TEMP\test.log"
	
	StrCpy $0 "$TEMP\test.log"
	Push $0
	Call DumpLog
	
SectionEnd

; eof