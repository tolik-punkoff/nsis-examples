; Script generated with the Venis Install Wizard

; Define your application name
!define APPNAME "3D Pinball For Windows - Space Cadet"
!define APPNAMEANDVERSION "3D Pinball For Windows - Space Cadet"

; Main Install settings
Name "${APPNAMEANDVERSION}"
InstallDir "$PROGRAMFILES\Microsoft Games\Pinballl"
InstallDirRegKey HKLM "Software\${APPNAME}" ""
OutFile "PinballSetup.exe"

DirText "Choose the folder in which to install ${APPNAMEANDVERSION}."

Section "3D Pinball For Windows - Space Cadet"

	; Set Section properties
	SetOverwrite on

	; Set Section Files and Shortcuts
	SetOutPath "$INSTDIR\"
	File "bin\FONT.DAT"
	File "bin\PINBALL.DAT"
	File "bin\pinball.exe"
	File "bin\PINBALL.MID"
	File "bin\PINBALL2.MID"
	File "bin\SOUND1.WAV"
	File "bin\SOUND104.WAV"
	File "bin\SOUND105.WAV"
	File "bin\SOUND108.WAV"
	File "bin\SOUND111.WAV"
	File "bin\SOUND112.WAV"
	File "bin\SOUND12.WAV"
	File "bin\SOUND13.WAV"
	File "bin\SOUND131.WAV"
	File "bin\SOUND136.WAV"
	File "bin\SOUND14.WAV"
	File "bin\SOUND16.WAV"
	File "bin\SOUND17.WAV"
	File "bin\SOUND18.WAV"
	File "bin\SOUND181.WAV"
	File "bin\SOUND19.WAV"
	File "bin\SOUND20.WAV"
	File "bin\SOUND21.WAV"
	File "bin\SOUND22.WAV"
	File "bin\SOUND24.WAV"
	File "bin\SOUND240.WAV"
	File "bin\SOUND243.WAV"
	File "bin\SOUND25.WAV"
	File "bin\SOUND26.WAV"
	File "bin\SOUND27.WAV"
	File "bin\SOUND28.WAV"
	File "bin\SOUND29.WAV"
	File "bin\SOUND3.WAV"
	File "bin\SOUND30.WAV"
	File "bin\SOUND34.WAV"
	File "bin\SOUND35.WAV"
	File "bin\SOUND36.WAV"
	File "bin\SOUND38.WAV"
	File "bin\SOUND39.WAV"
	File "bin\SOUND4.WAV"
	File "bin\SOUND42.WAV"
	File "bin\SOUND43.WAV"
	File "bin\SOUND45.WAV"
	File "bin\SOUND49.WAV"
	File "bin\SOUND49D.WAV"
	File "bin\SOUND5.WAV"
	File "bin\SOUND50.WAV"
	File "bin\SOUND528.WAV"
	File "bin\SOUND53.WAV"
	File "bin\SOUND54.WAV"
	File "bin\SOUND55.WAV"
	File "bin\SOUND560.WAV"
	File "bin\SOUND563.WAV"
	File "bin\SOUND57.WAV"
	File "bin\SOUND58.WAV"
	File "bin\SOUND6.WAV"
	File "bin\SOUND65.WAV"
	File "bin\SOUND68.WAV"
	File "bin\SOUND7.WAV"
	File "bin\SOUND713.WAV"
	File "bin\SOUND735.WAV"
	File "bin\SOUND8.WAV"
	File "bin\SOUND827.WAV"
	File "bin\SOUND9.WAV"
	File "bin\SOUND999.WAV"
	File "bin\table.bmp"
	File "bin\wavemix.inf"
	CreateShortCut "$DESKTOP\3D Pinball For Windows - Space Cadet.lnk" "$INSTDIR\pinball.exe"
	CreateDirectory "$SMPROGRAMS\3D Pinball For Windows - Space Cadet"
	CreateShortCut "$SMPROGRAMS\3D Pinball For Windows - Space Cadet\3D Pinball For Windows - Space Cadet.lnk" "$INSTDIR\pinball.exe"
	CreateShortCut "$SMPROGRAMS\3D Pinball For Windows - Space Cadet\Uninstall.lnk" "$INSTDIR\uninstall.exe"

SectionEnd

Section -FinishSection

	WriteRegStr HKLM "Software\${APPNAME}" "" "$INSTDIR"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "DisplayName" "${APPNAME}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "UninstallString" "$INSTDIR\uninstall.exe"
	WriteUninstaller "$INSTDIR\uninstall.exe"

SectionEnd

;Uninstall section
Section Uninstall

	;Remove from registry...
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}"
	DeleteRegKey HKLM "SOFTWARE\${APPNAME}"

	; Delete self
	Delete "$INSTDIR\uninstall.exe"

	; Delete Shortcuts
	Delete "$DESKTOP\3D Pinball For Windows - Space Cadet.lnk"
	Delete "$SMPROGRAMS\3D Pinball For Windows - Space Cadet\3D Pinball For Windows - Space Cadet.lnk"
	Delete "$SMPROGRAMS\3D Pinball For Windows - Space Cadet\Uninstall.lnk"

	; Clean up 3D Pinball For Windows - Space Cadet
	Delete "$INSTDIR\FONT.DAT"
	Delete "$INSTDIR\PINBALL.DAT"
	Delete "$INSTDIR\pinball.exe"
	Delete "$INSTDIR\PINBALL.MID"
	Delete "$INSTDIR\PINBALL2.MID"
	Delete "$INSTDIR\SOUND1.WAV"
	Delete "$INSTDIR\SOUND104.WAV"
	Delete "$INSTDIR\SOUND105.WAV"
	Delete "$INSTDIR\SOUND108.WAV"
	Delete "$INSTDIR\SOUND111.WAV"
	Delete "$INSTDIR\SOUND112.WAV"
	Delete "$INSTDIR\SOUND12.WAV"
	Delete "$INSTDIR\SOUND13.WAV"
	Delete "$INSTDIR\SOUND131.WAV"
	Delete "$INSTDIR\SOUND136.WAV"
	Delete "$INSTDIR\SOUND14.WAV"
	Delete "$INSTDIR\SOUND16.WAV"
	Delete "$INSTDIR\SOUND17.WAV"
	Delete "$INSTDIR\SOUND18.WAV"
	Delete "$INSTDIR\SOUND181.WAV"
	Delete "$INSTDIR\SOUND19.WAV"
	Delete "$INSTDIR\SOUND20.WAV"
	Delete "$INSTDIR\SOUND21.WAV"
	Delete "$INSTDIR\SOUND22.WAV"
	Delete "$INSTDIR\SOUND24.WAV"
	Delete "$INSTDIR\SOUND240.WAV"
	Delete "$INSTDIR\SOUND243.WAV"
	Delete "$INSTDIR\SOUND25.WAV"
	Delete "$INSTDIR\SOUND26.WAV"
	Delete "$INSTDIR\SOUND27.WAV"
	Delete "$INSTDIR\SOUND28.WAV"
	Delete "$INSTDIR\SOUND29.WAV"
	Delete "$INSTDIR\SOUND3.WAV"
	Delete "$INSTDIR\SOUND30.WAV"
	Delete "$INSTDIR\SOUND34.WAV"
	Delete "$INSTDIR\SOUND35.WAV"
	Delete "$INSTDIR\SOUND36.WAV"
	Delete "$INSTDIR\SOUND38.WAV"
	Delete "$INSTDIR\SOUND39.WAV"
	Delete "$INSTDIR\SOUND4.WAV"
	Delete "$INSTDIR\SOUND42.WAV"
	Delete "$INSTDIR\SOUND43.WAV"
	Delete "$INSTDIR\SOUND45.WAV"
	Delete "$INSTDIR\SOUND49.WAV"
	Delete "$INSTDIR\SOUND49D.WAV"
	Delete "$INSTDIR\SOUND5.WAV"
	Delete "$INSTDIR\SOUND50.WAV"
	Delete "$INSTDIR\SOUND528.WAV"
	Delete "$INSTDIR\SOUND53.WAV"
	Delete "$INSTDIR\SOUND54.WAV"
	Delete "$INSTDIR\SOUND55.WAV"
	Delete "$INSTDIR\SOUND560.WAV"
	Delete "$INSTDIR\SOUND563.WAV"
	Delete "$INSTDIR\SOUND57.WAV"
	Delete "$INSTDIR\SOUND58.WAV"
	Delete "$INSTDIR\SOUND6.WAV"
	Delete "$INSTDIR\SOUND65.WAV"
	Delete "$INSTDIR\SOUND68.WAV"
	Delete "$INSTDIR\SOUND7.WAV"
	Delete "$INSTDIR\SOUND713.WAV"
	Delete "$INSTDIR\SOUND735.WAV"
	Delete "$INSTDIR\SOUND8.WAV"
	Delete "$INSTDIR\SOUND827.WAV"
	Delete "$INSTDIR\SOUND9.WAV"
	Delete "$INSTDIR\SOUND999.WAV"
	Delete "$INSTDIR\table.bmp"
	Delete "$INSTDIR\wavemix.inf"

	; Remove remaining directories
	RMDir "$SMPROGRAMS\3D Pinball For Windows - Space Cadet"
	RMDir "$INSTDIR\"

SectionEnd

Function un.onInit

	MessageBox MB_YESNO|MB_DEFBUTTON2|MB_ICONQUESTION "Remove ${APPNAMEANDVERSION} and all of its components?" IDYES DoUninstall
		Abort
	DoUninstall:

FunctionEnd

; eof