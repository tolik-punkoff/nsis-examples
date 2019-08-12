; Define your application name
!define APPNAME "ContinueAfterRestart"
!define APPNAMEANDVERSION "ContinueAfterRestart 0.1"

; Main Install settings
Name "${APPNAMEANDVERSION}"
OutFile "afterreboot.exe"

ShowInstDetails show

Section
	
	DetailPrint "Read After Reboot flag..."
	ReadRegStr $R0 HKCU "Software\Microsoft\Windows\CurrentVersion\" "${APPNAME}_afterreboot"
	StrCmp "$R0" "1" AfterReboot
	
	DetailPrint "Run main installation:"
	DetailPrint "Copyng files, installing drivers, registring DLLs, etc."
	
	DetailPrint "Installer path: $EXEPATH"
	
	DetailPrint "Write in RunOnce Registry key..."
	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\RunOnce" "${APPNAME}" "$EXEPATH"
	DetailPrint "Write After Reboot flag..."
	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\" "${APPNAME}_afterreboot" "1"
	
	DetailPrint "Reboot request."
	MessageBox MB_YESNO|MB_ICONINFORMATION "Installation will be cobntinue after reboot. Press OK to reboot now." IDYES RebootID
	DetailPrint "Installation continue if user restart system."
	Goto SecEnd
		
		RebootID:
			DetailPrint "Rebooting..."
			Reboot
		AfterReboot:
			DetailPrint "Delete After Reboot flag..."
			DeleteRegValue HKCU "Software\Microsoft\Windows\CurrentVersion\" "${APPNAME}_afterreboot"
			DetailPrint "Continue install after reboot..."			
		SecEnd:
			;end of section

SectionEnd

; eof