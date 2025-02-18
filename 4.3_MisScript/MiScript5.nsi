;NSIS Modern User Interface
;Welcome/Finish Page Example Script
;Written by Joost Verburg

;--------------------------------
;Include Modern UI

    !include "MUI2.nsh"

;--------------------------------
;General

    ;Name and file
    Name "Modern UI Test"
    OutFile "Instalador5.exe"
    Unicode True

    ;Default installation folder
    InstallDir "$LOCALAPPDATA\Modern UI Test"

    ;Get installation folder from registry if available
    InstallDirRegKey HKCU "Software\Modern UI Test" ""

    ;Request application privileges for Windows Vista
    RequestExecutionLevel user

;--------------------------------
;Interface Settings

    !define MUI_ABORTWARNING

;--------------------------------
;Pages
    !insertmacro MUI_PAGE_WELCOME
    !insertmacro MUI_PAGE_LICENSE "${NSISDIR}\Docs\Modern UI\License.txt"
    !insertmacro MUI_PAGE_COMPONENTS
    !insertmacro MUI_PAGE_DIRECTORY
    !insertmacro MUI_PAGE_INSTFILES
    !insertmacro MUI_PAGE_FINISH

    !insertmacro MUI_UNPAGE_WELCOME
    !insertmacro MUI_UNPAGE_CONFIRM
    !insertmacro MUI_UNPAGE_INSTFILES
    !insertmacro MUI_UNPAGE_FINISH

;-----------------------
;Lenguas
    !insertmacro MUI_LANGUAGE "Spanish"


;--------------------------------
;Installer Sections

Section "Dummy Section" SecDummy
    SetOutPath "$INSTDIR"

    ;ADD YOUR OWN FILES HERE...

    ;Store installation folder
    WriteRegStr HKCU "Software\Modern UI Test" "" $INSTDIR

    ;Create uninstaller
    WriteUninstaller "$INSTDIR\Desinstalador5.exe"

SectionEnd

;--------------------------------
;Descriptions
    ;Carga fichero de lenguas
    LangString DESC_SecDummy ${LANG_SPANISH} "A test section."

    ;Assign language strings to sections
    !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
        !insertmacro MUI_DESCRIPTION_TEXT ${SecDummy} $(DESC_SecDummy)
    !insertmacro MUI_FUNCTION_DESCRIPTION_END

;--------------------------------
;Uninstaller Section

Section "Uninstall"

    ;ADD YOUR OWN FILES HERE...

    Delete "$INSTDIR\Desinstalador5.exe"

    RMDir "$INSTDIR"

    DeleteRegKey /ifempty HKCU "Software\Modern UI Test"

SectionEnd
