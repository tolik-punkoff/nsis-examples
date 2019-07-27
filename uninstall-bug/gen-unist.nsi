
!define APPNAME "Generate test uninstaller"

; Main Install settings
Name "${APPNAME}"
InstallDir "$PROGRAMFILES\TestUninst"

OutFile "GenTestUninst.exe"

DirText "Choose the folder in which to install ${APPNAME}."

ShowInstDetails show

Var TESTVAR

Section "Inst"

	; Set Section properties
	SetOverwrite on
	
	StrCpy $TESTVAR "Test variable value"

	DetailPrint "INSTDIR (install): $INSTDIR"
	DetailPrint "TESTVAR (install): $TESTVAR"
	WriteUninstaller "$TEMP\TestUninst.exe"

SectionEnd

;Uninstall section
Section Uninstall
	
	SetDetailsView show
	DetailPrint "INSTDIR (uninstall): $INSTDIR"
	DetailPrint "TESTVAR (uninstall): $TESTVAR"
	
SectionEnd

; eof