;Victor Garcia Vera 2DAM

;Incluir interfaz nueva
    !include "MUI2.nsh"

;--------------------------------
;General
    ;Nombre y fichero
    Name "Test UI moderna"
    OutFile "Instalador4.exe"
    Unicode True

    ;Ruta de instalador por defecto
    InstallDir "$$LOCALAPPDATA\Test UI moderna"

    ;Get installation folder from registry if available
    InstallDirRegKey HKCU "Software\Test UI moderna" ""

    ;Request application privileges for Windows Vista
    RequestExecutionLevel user

;--------------------------------
;Variables
    Var StartMenuFolder

;------------------------
;Ajustes de interfaz
    !define MUI_ABORTWARNING

;--------------------------------
;Paginas
    ;Paginas de instalacion
    !insertmacro MUI_PAGE_LICENSE "${NSISDIR}\Docs\Modern UI\License.txt"
    !insertmacro MUI_PAGE_COMPONENTS
    !insertmacro MUI_PAGE_DIRECTORY
    
    ;Start Menu Folder Page Configuration
    !define MUI_STARTMENUPAGE_REGISTRY_ROOT "HKCU" 
    !define MUI_STARTMENUPAGE_REGISTRY_KEY "Software\Modern UI Test" 
    !define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "Start Menu Folder"
    
    !insertmacro MUI_PAGE_STARTMENU Application $StartMenuFolder
    !insertmacro MUI_PAGE_INSTFILES
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
    WriteUninstaller "$INSTDIR\Desinstalador4.exe"
    
    !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
    
    ;Create shortcuts
    CreateDirectory "$SMPROGRAMS\$StartMenuFolder"
    CreateShortcut "$SMPROGRAMS\$StartMenuFolder\Desinstalador4.lnk" "$INSTDIR\Desinstalador4.exe"
  
    !insertmacro MUI_STARTMENU_WRITE_END

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

    Delete "$INSTDIR\Desinstalador4.exe"

    RMDir "$INSTDIR"
    
    !insertmacro MUI_STARTMENU_GETFOLDER Application $StartMenuFolder
        
    Delete "$SMPROGRAMS\$StartMenuFolder\Uninstall.lnk"
    RMDir "$SMPROGRAMS\$StartMenuFolder"
    
    DeleteRegKey /ifempty HKCU "Software\Modern UI Test"

SectionEnd