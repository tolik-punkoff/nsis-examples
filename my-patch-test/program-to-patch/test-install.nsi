; Script generated with the Venis Install Wizard

; Define your application name
!define APPNAME "Patch Test"
!define APPNAMEANDVERSION "Patch Test"

; Main Install settings
Name "${APPNAMEANDVERSION}"
InstallDir "$PROGRAMFILES\Patch Test"
InstallDirRegKey HKLM "Software\${APPNAME}" ""
OutFile "installer\testprogram.exe"

DirText "Choose the folder in which to install ${APPNAMEANDVERSION}."

Section "Patch Test"

	; Set Section properties
	SetOverwrite on

	; Set Section Files and Shortcuts
	SetOutPath "$INSTDIR\"
	File "bin\scrackme.exe"
	CreateShortCut "$DESKTOP\Patch Test.lnk" "$INSTDIR\scrackme.exe"
	CreateDirectory "$SMPROGRAMS\Patch Test"
	CreateShortCut "$SMPROGRAMS\Patch Test\Patch Test.lnk" "$INSTDIR\scrackme.exe"
	CreateShortCut "$SMPROGRAMS\Patch Test\Uninstall.lnk" "$INSTDIR\uninstall.exe"

SectionEnd

Section -FinishSection

	WriteRegStr HKLM "Software\${APPNAME}" "" "$INSTDIR"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "DisplayName" "${APPNAME}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "UninstallString" "$INSTDIR\uninstall.exe"
	WriteUninstaller "$INSTDIR\uninstall.exe"

	MessageBox MB_YESNO "Would you like to run ${APPNAMEANDVERSION}?" IDNO NoRun
		Exec "$INSTDIR\scrackme.exe"
	NoRun:

SectionEnd

;Uninstall section
Section Uninstall

	;Remove from registry...
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}"
	DeleteRegKey HKLM "SOFTWARE\${APPNAME}"

	; Delete self
	Delete "$INSTDIR\uninstall.exe"

	; Delete Shortcuts
	Delete "$DESKTOP\Patch Test.lnk"
	Delete "$SMPROGRAMS\Patch Test\Patch Test.lnk"
	Delete "$SMPROGRAMS\Patch Test\Uninstall.lnk"

	; Clean up Patch Test
	Delete "$INSTDIR\scrackme.exe"

	; Remove remaining directories
	RMDir "$SMPROGRAMS\Patch Test"
	RMDir "$INSTDIR\"

SectionEnd

Function un.onInit

	MessageBox MB_YESNO|MB_DEFBUTTON2|MB_ICONQUESTION "Remove ${APPNAMEANDVERSION} and all of its components?" IDYES DoUninstall
		Abort
	DoUninstall:

FunctionEnd

; eof