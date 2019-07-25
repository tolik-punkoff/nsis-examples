!include gvv.nsi
!include WinVer.nsh
!include x64.nsh

Name "OSVersion Test"
OutFile "OSVersion.exe"

ShowInstDetails show

Section "OSVersion"
	${GetWindowsVersion} $R0
	DetailPrint "Windows Version: $R0"
	${If} ${IsWinXP}
		DetailPrint "Is Windows XP"
	${EndIf}
	${If} ${AtLeastWin7}
		DetailPrint "Is Windows 7 or higher"
	${EndIf}
	
	${If} ${IsNativeAMD64}
     DetailPrint "System Architecture: x64"
   ${ElseIf} ${IsNativeIA32}
     DetailPrint "System Architecture: x86"
   ${Else}
     DetailPrint "Unsupported CPU architecture!"
   ${EndIf}
SectionEnd