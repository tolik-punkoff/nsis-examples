Unicode true
!include LogicLib.nsh

Name "MD5test"
OutFile "MD5Sample.exe"
ShowInstDetails show
RequestExecutionLevel User

Section "Test"
  #generate MD5sum of string
  md5dll::GetMD5String "TestString"
  Pop $0
  DetailPrint "MD5 (string): [$0]"
	
  #generate random MD5sum
  md5dll::GetMD5Random
  Pop $0
  DetailPrint "MD5 (random): [$0]"
	
	#generate MD5sum of file
	DetailPrint "MD5 sum of file $EXEDIR\test\1.exe"
	md5dll::GetMD5File "$EXEDIR\test\1.exe"
  Pop $0
  DetailPrint "MD5 (file): [$0]"
	
	#Files Comparsion
	#Identifical files
	md5dll::GetMD5File "$EXEDIR\test\1.exe"
	Pop $0
	md5dll::GetMD5File "$EXEDIR\test\2.exe"
	Pop $1
	DetailPrint "Files $EXEDIR\test\1.exe"
	DetailPrint "and   $EXEDIR\test\2.exe"
	DetailPrint "MD5: $0" 
	DetailPrint "and   $1"
	${If} $0 == $1
		DetailPrint "IS IDENTICAL!"
	${Else}
		DetailPrint "IS DIFFERENT!"
	${EndIf}
	
	#Different files
	md5dll::GetMD5File "$EXEDIR\test\1.exe"
	Pop $0
	md5dll::GetMD5File "$EXEDIR\test\3.exe"
	Pop $1
	DetailPrint "Files $EXEDIR\test\1.exe"
	DetailPrint "and   $EXEDIR\test\3.exe"
	DetailPrint "MD5: $0" 
	DetailPrint "and   $1"
	${If} $0 == $1
		DetailPrint "IS IDENTICAL!"
	${Else}
		DetailPrint "IS DIFFERENT!"
	${EndIf}
SectionEnd