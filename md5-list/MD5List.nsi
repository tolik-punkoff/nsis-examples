Unicode true
!include "Locate.nsi"

Name "MD5List"
OutFile "MD5List.exe"
ShowInstDetails show
RequestExecutionLevel User
InstallDir "$EXEDIR\"
DirText "Choose the folder to get list files and MD5 checksums."

Section "List"
	
	GetTempFileName $R0
	FileOpen $R1 $R0 w
	
	DetailPrint "Starting search files and get MD5..."
	
	${Locate} "$INSTDIR" "/L=F /M=*.*" "GetMD5"
	
	FileClose $R1
	
	IfErrors 0 +2
	MessageBox MB_OK "Error" IDOK +2
	Exec '"notepad.exe" "$R0"'
	
SectionEnd

Function GetMD5
	md5dll::GetMD5File "$R9"
	Pop $1
	FileWrite $R1 "$R9:$\t $1 $\r$\n"
	
	Push $0
FunctionEnd