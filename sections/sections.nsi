
!define APPNAME "SectionsExample"
!define APPNAMEANDVERSION "SectionsExample 0.1"

Name "${APPNAMEANDVERSION}"
OutFile "CheckboxexExample.exe"

ComponentText "Choose which features of ${APPNAMEANDVERSION} you want to install."

ShowInstDetails show
RequestExecutionLevel User

Section "Main Programm and components"

	; Checkbox select and disable user changes
	SectionIn RO
	SetOverwrite on
	
	DetailPrint "Main program installing..."
	
SectionEnd

Section "Component #2"

	; Checkbox enabled by default & user will change it state
	SetOverwrite on
	
	DetailPrint "Component #2 installing..."
	
SectionEnd

Section /o "Component #3"

	; Checkbox disabled by default & user will change it state
	SetOverwrite on
	
	DetailPrint "Component #3 installing..."
	
SectionEnd

Section -HiddenSection
	DetailPrint "This is a hidden section"
	DetailPrint "This code running anyway."
SectionEnd
