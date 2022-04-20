; Script generated with the Venis Install Wizard

; Define your application name
Unicode true
!define APPNAME "Space Sound Demo"
!define APPNAMEANDVERSION "Space Sound Demo"

; Main Install settings
Name "${APPNAMEANDVERSION}"
InstallDir "$PROGRAMFILES\SpaceSoundDemo"
InstallDirRegKey HKLM "Software\${APPNAME}" ""
OutFile "ssSetup.exe"

LicenseData "license.txt"
LicenseText "If you accept the terms of the agreement, click I Agree to continue. You must accept the agreement to install ${APPNAMEANDVERSION}."

DirText "Choose the folder in which to install ${APPNAMEANDVERSION}."

ShowInstDetails show

Section "Space Sound Demo"

	; Set Section properties
	SetOverwrite on

	; Set Section Files and Shortcuts
	SetOutPath "$INSTDIR\home\sounds\"
	File "bin\home\sounds\bigBang.swf"
	File "bin\home\sounds\blackHole.swf"
	File "bin\home\sounds\cosmicDebris.swf"
	File "bin\home\sounds\ganymede.swf"
	File "bin\home\sounds\jupiter.swf"
	File "bin\home\sounds\lionsRoar.swf"
	File "bin\home\sounds\pulsar0329.swf"
	File "bin\home\sounds\pulsarVela.swf"
	File "bin\home\sounds\saturnRings.swf"
	File "bin\home\sounds\sputnik.swf"
	File "bin\home\sounds\sunHeartbeat.swf"
	File "bin\home\sounds\whistlers.swf"
	SetOutPath "$INSTDIR\navigator\"
	File "bin\navigator\popInfo.swf"
	File "bin\navigator\popSound.swf"
	File "bin\navigator\spacesounds navigator.exe"
	CreateDirectory "$SMPROGRAMS\Space Sound Demo"
	CreateShortCut "$SMPROGRAMS\Space Sound Demo\Space Sound Demo.lnk" "$INSTDIR\navigator\spacesounds navigator.exe"
	CreateShortCut "$SMPROGRAMS\Space Sound Demo\Uninstall.lnk" "$INSTDIR\uninstall.exe"

SectionEnd

Section -FinishSection

	WriteRegStr HKLM "Software\${APPNAME}" "" "$INSTDIR"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "DisplayName" "${APPNAME}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "UninstallString" "$INSTDIR\uninstall.exe"
	WriteUninstaller "$INSTDIR\uninstall.exe"

	MessageBox MB_YESNO "Would you like to run ${APPNAMEANDVERSION}?" IDNO NoRun
		Exec "$INSTDIR\navigator\spacesounds navigator.exe"
	NoRun:

SectionEnd

;Uninstall section
Section Uninstall
	
	SetDetailsView show

	;Remove from registry...
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}"
	DeleteRegKey HKLM "SOFTWARE\${APPNAME}"

	; Delete self
	Delete "$INSTDIR\uninstall.exe"

	; Delete Shortcuts
	Delete "$SMPROGRAMS\Space Sound Demo\Space Sound Demo.lnk"
	Delete "$SMPROGRAMS\Space Sound Demo\Uninstall.lnk"

	; Clean up Space Sound Demo
	Delete "$INSTDIR\home\sounds\bigBang.swf"
	Delete "$INSTDIR\home\sounds\blackHole.swf"
	Delete "$INSTDIR\home\sounds\cosmicDebris.swf"
	Delete "$INSTDIR\home\sounds\ganymede.swf"
	Delete "$INSTDIR\home\sounds\jupiter.swf"
	Delete "$INSTDIR\home\sounds\lionsRoar.swf"
	Delete "$INSTDIR\home\sounds\pulsar0329.swf"
	Delete "$INSTDIR\home\sounds\pulsarVela.swf"
	Delete "$INSTDIR\home\sounds\saturnRings.swf"
	Delete "$INSTDIR\home\sounds\sputnik.swf"
	Delete "$INSTDIR\home\sounds\sunHeartbeat.swf"
	Delete "$INSTDIR\home\sounds\whistlers.swf"
	Delete "$INSTDIR\navigator\popInfo.swf"
	Delete "$INSTDIR\navigator\popSound.swf"
	Delete "$INSTDIR\navigator\spacesounds navigator.exe"

	; Remove remaining directories
	RMDir "$SMPROGRAMS\Space Sound Demo"
	RMDir "$INSTDIR\navigator\"
	RMDir "$INSTDIR\home\sounds\"
	RMDir "$INSTDIR\home\"
	RMDir "$INSTDIR\"

SectionEnd

Function un.onInit

	MessageBox MB_YESNO|MB_DEFBUTTON2|MB_ICONQUESTION "Remove ${APPNAMEANDVERSION} and all of its components?" IDYES DoUninstall
		Abort
	DoUninstall:

FunctionEnd

; eof