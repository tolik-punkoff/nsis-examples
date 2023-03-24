Unicode true
!include LogicLib.nsh
!include "FileFunc.nsh"
!insertmacro GetTime

; Main Install settings
Name "Simple Crackme Patch And Restore"
InstallDir "$PROGRAMFILES\Patch Test"
OutFile "SimpleCrackmePatch.exe"

DirText "Choose the folder in which to patch scrackme.exe:"
ShowInstDetails show

!macro BackupFile
	${GetTime} "" "L" $0 $1 $2 $3 $4 $5 $6
	StrCpy $0 "$TARGETFILE.$2$1$0$4$5$6.bak"
	DetailPrint "Backup $TARGETFILE --> $0..."
	CopyFiles "$INSTDIR\$TARGETFILE" "$INSTDIR\$0"
!macroend


Section "TestPatch"
	;set TARGETFILE variable
	Var /GLOBAL "TARGETFILE"
	StrCpy $TARGETFILE "scrackme.exe"
	DetailPrint "Find $TARGETFILE in dir $INSTDIR:"
	;check if file for patching exist
	IfFileExists "$INSTDIR\$TARGETFILE" 0 NoTargetFile
	DetailPrint "File $TARGETFILE found. OK"
	
	;create user variable for checksum
	;for target file
	Var /GLOBAL "FILEMD5"
	
	;Get checksum for patching file
	md5dll::GetMD5File "$INSTDIR\$TARGETFILE"
	Pop $FILEMD5
	DetailPrint "Target file MD5: $FILEMD5"
	
	;Add checksums
	Var /GLOBAL "MD5ORIG"
	StrCpy $MD5ORIG "34477c0a0bd7eccbff756ce50280e3db" ;Original file MD5
	Var /GLOBAL "MD5PATCH"
	StrCpy $MD5PATCH "172073a0e5a098ea8e4d521889a2c840" ;Patched file MD5
	
	;Patch/Restore...
	${If} $FILEMD5 == $MD5ORIG ;Original file. Patch.
		MessageBox MB_YESNO|MB_ICONQUESTION "Patch file?" IDYES 0 IDNO EndProg
		!insertmacro BackupFile
		GetTempFileName $R0
		vpatch::vpatchfile "change.pat" "$INSTDIR\$TARGETFILE" "$R0"
		Pop $R1
		DetailPrint "Patch:"
		DetailPrint "$R1"
		CopyFiles "$R0" "$INSTDIR\$TARGETFILE"
		IfErrors CopyError 0 ;check copy file error
		Delete "$R0" ;remove temporary file
	${Else}
		${If} $FILEMD5 == $MD5PATCH ; Patched file. Restore.
			MessageBox MB_YESNO|MB_ICONQUESTION "File patched! Restore original?"  IDYES 0 IDNO EndProg
			!insertmacro BackupFile
			GetTempFileName $R0
			vpatch::vpatchfile "restore.pat" "$INSTDIR\$TARGETFILE" "$R0"
			Pop $R1
			DetailPrint "Restore:"
			DetailPrint "$R1"
			CopyFiles "$R0" "$INSTDIR\$TARGETFILE"
			IfErrors CopyError 0 ;check copy file error
			Delete "$R0" ;remove temporary file
		${Else} ;Other checksum, wrong file
			MessageBox MB_ICONSTOP "Unknown or wrong file $INSTDIR\$TARGETFILE. Bad checksum."
			DetailPrint "ERROR: Unknown or wrong file $TARGETFILE. Bad checksum. "
			Goto EndProg
		${EndIf}
	${EndIf}
	
		
	Goto EndProg
	
CopyError:
	MessageBox MB_ICONSTOP "Copy error! Target file not changed!"
	Goto EndProg
NoTargetFile:
	DetailPrint "ERROR: File $TARGETFILE NOT FOUND in $INSTDIR!"
	MessageBox MB_ICONSTOP "No file $INSTDIR\$TARGETFILE. Not installed or wrong directory selected?"
EndProg:
SectionEnd

; eof