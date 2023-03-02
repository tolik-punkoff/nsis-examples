; Script generated with the Venis Install Wizard

Unicode true

; Define your application name
!define APPNAME "VPatch Utilities"
!define APPNAMEANDVERSION "VPatch Utilities"

; Main Install settings
Name "${APPNAMEANDVERSION}"
InstallDir "$PROGRAMFILES\VPatch Utilities"
InstallDirRegKey HKLM "Software\${APPNAME}" ""
OutFile "installer\VPatchUtils.exe"

DirText "Choose the folder in which to install ${APPNAMEANDVERSION}."

ShowInstDetails show

Section "VPatch Utilities"

	; Set Section properties
	SetOverwrite on

	; Set Section Files and Shortcuts
	CreateDirectory "$INSTDIR\"
	SetOutPath "$WINDIR\"
	File "bin\GenPat.exe"
	File "bin\ListPat.exe"
	File "bin\VAppend.exe"
	File "bin\VPatchGUI.exe"
	File "bin\vpatchprompt.exe"
	CreateDirectory "$SMPROGRAMS\NSIS\VPatch Utilities"
	CreateShortCut "$SMPROGRAMS\NSIS\VPatch Utilities\Uninstall.lnk" "$INSTDIR\uninstall.exe"

SectionEnd

Section -FinishSection

	WriteRegStr HKLM "Software\${APPNAME}" "" "$INSTDIR"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "DisplayName" "${APPNAME}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "UninstallString" "$INSTDIR\uninstall.exe"
	WriteUninstaller "$INSTDIR\uninstall.exe"

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
	Delete "$SMPROGRAMS\NSIS\VPatch Utilities\Uninstall.lnk"

	; Clean up VPatch Utilities
	Delete "$WINDIR\GenPat.exe"
	Delete "$WINDIR\ListPat.exe"
	Delete "$WINDIR\VAppend.exe"
	Delete "$WINDIR\VPatchGUI.exe"
	Delete "$WINDIR\vpatchprompt.exe"

	; Remove remaining directories
	RMDir "$SMPROGRAMS\NSIS\VPatch Utilities"
	RMDir "$INSTDIR\"

SectionEnd

Function un.onInit

	MessageBox MB_YESNO|MB_DEFBUTTON2|MB_ICONQUESTION "Remove ${APPNAMEANDVERSION} and all of its components?" IDYES DoUninstall
		Abort
	DoUninstall:

FunctionEnd

; eof