Unicode true
!include LogicLib.nsh

Name "KillProcessExample"
OutFile "KillProcessExample.exe"
ShowInstDetails show
RequestExecutionLevel User

!macro PrintProcError ErrCode
	${Switch} ${ErrCode}
		${Case} '0'
			DetailPrint "Success"
		${Break}
		${Case} '601'
			DetailPrint "No permission to terminate process"
		${Break}
		${Case} '602'
			DetailPrint "Not all processes terminated successfully"
		${Break}
		${Case} '603'
			DetailPrint "Process was not currently running"
		${Break}
		${Case} '604'
			DetailPrint "Unable to identify system type"
		${Break}
		${Case} '605'
			DetailPrint "Unsupported OS"
		${Break}
		${Case} '606'
			DetailPrint "Unable to load NTDLL.DLL"
		${Break}
		${Case} '607'
			DetailPrint "Unable to get procedure address from NTDLL.DLL"
		${Break}
		${Case} '608'
			DetailPrint "NtQuerySystemInformation failed"
		${Break}
		${Case} '609'
			DetailPrint "Unable to load KERNEL32.DLL"
		${Break}
		${Case} '610'
			DetailPrint "Unable to get procedure address from KERNEL32.DLL"
		${Break}
		${Case} '611'
			DetailPrint "CreateToolhelp32Snapshot failed"
		${Break}
	${EndSwitch}
!macroend

Section "Test"
	DetailPrint "Start calc.exe..."
	Exec "$SYSDIR\calc.exe"
	Sleep 500
	MessageBox MB_YESNO|MB_ICONQUESTION "Kill process calc.exe?" IDYES 0 IDNO "EndProg"
	
	DetailPrint "Find process calc.exe..."
	nsProcess::_FindProcess "calc.exe"
	Pop $R0
	!insertmacro PrintProcError $R0
	${If} $R0 = 0
		DetailPrint "Process calc.exe found. Kill it..."
		nsProcess::_KillProcess "calc.exe"
		!insertmacro PrintProcError $R0
		Sleep 500
	${EndIf}
EndProg:
SectionEnd