;Victor Garcia Vera 2DAM

;Incluir interfaz nueva
    !include "MUI2.nsh"

;-------------------------
;General
    ;Nombre y fichero
    Name "Test UI moderna"
    OutFile "Instalador2.exe"
    Unicode True

    ;Ruta de instalador por defecto
    InstallDir "$$LOCALAPPDATA\Test UI moderna"

    ;Get installation folder from registry if available
    InstallDirRegKey HKCU "Software\Test UI moderna" ""

    ;Request application privileges for Windows Vista
    RequestExecutionLevel user

;------------------------
;Ajustes de interfaz
    !define MUI_HEADERIMAGE
    !define MUI_HEADERIMAGE_BITMAP "${NSISDIR}\Contrib\Graphics\Header\apphotel.bmp"
    !define MUI_ABORTWARNING
    
;------------------------
;Paginas
    ;Paginas de instalacion
    !insertmacro MUI_PAGE_LICENSE "${NSISDIR}\Docs\Modern UI\License.txt"
    !insertmacro MUI_PAGE_COMPONENTS
    !insertmacro MUI_PAGE_DIRECTORY
    !insertmacro MUI_PAGE_INSTFILES
    
    ;Paginas de desinstalacion
    !insertmacro MUI_UNPAGE_CONFIRM
    !insertmacro MUI_UNPAGE_INSTFILES
    
;-----------------------
;Lenguas
    !insertmacro MUI_LANGUAGE "Spanish"

;--------------------------------
;Secciones de instalacion
Section "Dummy Section" SecDummy

    SetOutPath "$INSTDIR"
    
    ;ADD YOUR OWN FILES HERE...
    
    ;Store installation folder
    WriteRegStr HKCU "Software\Modern UI Test" "" $INSTDIR
    
    ;Create uninstaller
    WriteUninstaller "$INSTDIR\Desinstalador2.exe"
SectionEnd

;--------------------------------
;Descriciones
    ;Carga fichero de lenguas
    LangString DESC_SecDummy ${LANG_SPANISH} "A test section."

    ;Asigna fichero de strings a las secciones
    !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${SecDummy} $(DESC_SecDummy)
    !insertmacro MUI_FUNCTION_DESCRIPTION_END

;-------------------------------
;Seccion de desinstalacion
Section "Uninstall"

    ;ADD YOUR OWN FILES HERE...

    Delete "$INSTDIR\Desinstalador2.exe"

    RMDir "$INSTDIR"

    DeleteRegKey /ifempty HKCU "Software\Modern UI Test"

SectionEnd