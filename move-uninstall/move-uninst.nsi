; Script generated with the Venis Install Wizard

; Define your application name
!define APPNAME "TestApp"
!define APPNAMEANDVERSION "TestApp 0.1"

; Main Install settings
Name "${APPNAMEANDVERSION}"
InstallDir "$TEMP\TestApp"
InstallDirRegKey HKLM "Software\${APPNAME}" ""
OutFile "MoveUninst.exe"

DirText "Choose the folder in which to install ${APPNAMEANDVERSION}."

ShowInstDetails show
Var UNINSTDIR

Section "TestApp"

	; Set Section properties
	SetOverwrite on
	
	StrCpy $UNINSTDIR "$PROGRAMFILES\TestApp"

	; Set Section Files and Shortcuts
	SetOutPath "$INSTDIR\"
	File "bin\testapp.exe"
	CreateDirectory "$SMPROGRAMS\TestApp"
	CreateShortCut "$SMPROGRAMS\TestApp\TestApp.lnk" "$INSTDIR\testapp.exe"
	CreateShortCut "$SMPROGRAMS\TestApp\Uninstall.lnk" "$UNINSTDIR\uninstall.exe"

SectionEnd

Section -FinishSection

	WriteRegStr HKLM "Software\${APPNAME}" "" "$INSTDIR"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "DisplayName" "${APPNAME}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "UninstallString" "$UNINSTDIR\uninstall.exe"
	WriteUninstaller "$UNINSTDIR\uninstall.exe"

SectionEnd

;Uninstall section
Section Uninstall
	
	SetDetailsView show
	DetailPrint "INSTDIR: $INSTDIR"
	
	;Remove from registry...
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}"
	DeleteRegKey HKLM "SOFTWARE\${APPNAME}"

	; Delete self
	Delete "$INSTDIR\uninstall.exe"

	; Delete Shortcuts
	Delete "$SMPROGRAMS\TestApp\TestApp.lnk"
	Delete "$SMPROGRAMS\TestApp\Uninstall.lnk"

	; Clean up TestApp
	Delete "$INSTDIR\testapp.exe"

	; Remove remaining directories
	RMDir "$SMPROGRAMS\TestApp"
	RMDir "$INSTDIR\"

SectionEnd

Function un.onInit

	MessageBox MB_YESNO|MB_DEFBUTTON2|MB_ICONQUESTION "Remove ${APPNAMEANDVERSION} and all of its components?" IDYES DoUninstall
		Abort
	DoUninstall:

FunctionEnd

; eof