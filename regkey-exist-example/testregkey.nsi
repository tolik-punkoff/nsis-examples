Unicode true

!include Logiclib.nsh

; Define your application name
!define APPNAME "TestRegKey"
!define APPNAMEANDVERSION "TestRegKey"

; Main Install settings
Name "${APPNAMEANDVERSION}"
InstallDir "$TEMP"
OutFile "testreg.exe"
ShowInstDetails show
RequestExecutionLevel User

Section
	DetailPrint "Checking key: HKEY_CURRENT_USER\Software\Microsoft"
	ClearErrors
	EnumRegKey $0 HKCU "Software\Microsoft\" 0
	${If} ${Errors}
		DetailPrint "HKEY_CURRENT_USER\Software\Microsoft not EXIST!"
	${Else}
		DetailPrint "HKEY_CURRENT_USER\Software\Microsoft EXIST!"
	${EndIf}
		
	DetailPrint "Checking key: HKEY_CURRENT_USER\NotExistKey"
	ClearErrors
	EnumRegKey $0 HKCU "NotExistKey\" 0
	${If} ${Errors}
		DetailPrint "HKEY_CURRENT_USER\NotExistKey not EXIST!"
	${Else}
		DetailPrint "HKEY_CURRENT_USER\NotExistKey EXIST!"
	${EndIf}
	
SectionEnd
; eof