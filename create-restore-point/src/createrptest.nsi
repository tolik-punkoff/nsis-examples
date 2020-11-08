Unicode true
!include Logiclib.nsh

; Define your application name
!define APPNAME "Create Restore Point Example"
!define APPNAMEANDVERSION "Create Restore Point Example"

; Main Install settings
Name "${APPNAMEANDVERSION}"
InstallDir "$TEMP"
InstallDirRegKey HKLM "Software\${APPNAME}" ""
OutFile "CreateRestorePoint.exe"
ShowInstDetails show

Section "Create Restore Point Example"

	SetOverwrite on
	; Create Restore Point
	DetailPrint "Create restore point..."
	SysRestore::StartRestorePoint "Test Restore Point"
	Pop $0
	${If} $0 = 0
		DetailPrint "OK"
	${ElseIf} $0 = 1
		DetailPrint "Start point already set (start function only)."
	${ElseIf} $0 = 10
		DetailPrint "The system is running in safe mode. "
	${ElseIf} $0 = 13
		DetailPrint "The sequence number is invalid."
	${ElseIf} $0 = 80
		DetailPrint "Windows Me: Pending file-rename operations exist in the file %windir%\Wininit.ini."
	${ElseIf} $0 = 112
		DetailPrint "System Restore is in standby mode because disk space is low."
	${ElseIf} $0 = 1058
		DetailPrint "System Restore is disabled."
	${ElseIf} $0 = 1359
		DetailPrint "An internal error with system restore occurred."
	${ElseIf} $0 = 1460
		DetailPrint "The call timed out due to a wait on a mutex for setting restore points."
	${Else}
		DetailPrint "Unknow error."
	${EndIf}
	
	DetailPrint "Installing test program..."
	SetOutPath "$TEMP\"
	File "bin\HelloWorld.exe"
	DetailPrint "Add test programm to Registry Startup"
	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Run\" "TestRP" "$TEMP\HelloWorld.exe"

SectionEnd

Section -FinishSection

	WriteRegStr HKLM "Software\${APPNAME}" "" "$INSTDIR"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "DisplayName" "${APPNAME}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "UninstallString" "$INSTDIR\uninstall.exe"
	WriteUninstaller "$INSTDIR\uninstall.exe"
	
	SysRestore::FinishRestorePoint
	DetailPrint "Finish restore point..."
	${If} $0 = 0
		DetailPrint "OK"
	${ElseIf} $0 = 2
		DetailPrint "No Start point set (finish function only)."
	${Else}
		DetailPrint "Unknow error."
	${EndIf}

SectionEnd

;Uninstall section
Section Uninstall

	SetDetailsView show
	
	;Remove from registry...
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}"
	DeleteRegValue HKCU "Software\Microsoft\Windows\CurrentVersion\Run\" "TestRP"
	DeleteRegKey HKLM "SOFTWARE\${APPNAME}"

	; Delete self
	Delete "$INSTDIR\uninstall.exe"	

	; Clean up Create Restore Point Example
	Delete "$TEMP\HelloWorld.exe"

SectionEnd

Function un.onInit

	MessageBox MB_YESNO|MB_DEFBUTTON2|MB_ICONQUESTION "Remove ${APPNAMEANDVERSION} and all of its components?" IDYES DoUninstall
		Abort
	DoUninstall:

FunctionEnd

; eof