!define APPNAME "Exit Code Detect Example"
!define APPNAMEANDVERSION "Exit Code Detect Example"

; Main Install settings
Name "${APPNAMEANDVERSION}"
InstallDir "$TEMP"
OutFile "ReturnCodeExample.exe"
ShowInstDetails show

Section "Exit Code Detect Example"

	; Set Section properties
	SetOverwrite on

	; Set Section Files and Shortcuts
	SetOutPath "$TEMP\"
	File "bin\retcode.exe"
	ExecWait "$TEMP\retcode.exe 42" $0
	MessageBox MB_OK "Return Code is: $0"
	Delete "$TEMP\retcode.exe"
	
SectionEnd

; eof