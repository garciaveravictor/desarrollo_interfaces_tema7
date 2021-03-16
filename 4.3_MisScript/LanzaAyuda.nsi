;Victor Garcia Vera 2DAM

;Incluir interfaz nueva
    !include "MUI2.nsh"

;-------------------------
;General
    ;Nombre y fichero
    Name "Instalador Lanza Ayuda"
    OutFile "InstallAyuda.exe"
    Unicode True

    ;Ruta de instalador po defecto
    InstallDir "$PROGRAMFILES\Lanza Ayuda"

    ;Get installation folder from registry if available
    InstallDirRegKey HKCU "Software\Lanza Ayuda" ""

    ;Request application privileges for Windows Vista
    RequestExecutionLevel user

;------------------------
;Variables
    Var StartMenuFolder

;------------------------
;Ajustes de interfaz
    !define MUI_ABORTWARNING

    ;Mostrar todos los idiomas
    !define MUI_LANGDLL_ALLLANGUAGES

;----------------------
;Selector de idioma
    !define MUI_LANGDLL_REGISTRY_ROOT "HKCU" 
    !define MUI_LANGDLL_REGISTRY_KEY "Software\Lanza Ayuda" 
    !define MUI_LANGDLL_REGISTRY_VALUENAME "Installer Language"

;------------------------
;Paginas
    ;Paginas de instalacion
    !insertmacro MUI_PAGE_WELCOME
    !insertmacro MUI_PAGE_COMPONENTS
    !insertmacro MUI_PAGE_DIRECTORY

    ;menu inicio
    !define MUI_STARTMENUPAGE_REGISTRY_ROOT "HKCU" 
    !define MUI_STARTMENUPAGE_REGISTRY_KEY "Software\AppHotel" 
    !define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "AppHotel"

    !insertmacro MUI_PAGE_STARTMENU Application $StartMenuFolder

    !insertmacro MUI_PAGE_INSTFILES
    !insertmacro MUI_PAGE_FINISH

    ;Paginas de desinstalacion
    !insertmacro MUI_UNPAGE_WELCOME
    !insertmacro MUI_UNPAGE_CONFIRM
    !insertmacro MUI_UNPAGE_COMPONENTS
    !insertmacro MUI_UNPAGE_DIRECTORY
    !insertmacro MUI_UNPAGE_INSTFILES
    !insertmacro MUI_UNPAGE_FINISH

;--------------------------------
;Idiomas
    !insertmacro MUI_LANGUAGE "English" ; The first language is the default language
    !insertmacro MUI_LANGUAGE "French"
    !insertmacro MUI_LANGUAGE "German"
    !insertmacro MUI_LANGUAGE "Spanish"
    !insertmacro MUI_LANGUAGE "SpanishInternational"
    !insertmacro MUI_LANGUAGE "SimpChinese"
    !insertmacro MUI_LANGUAGE "TradChinese"
    !insertmacro MUI_LANGUAGE "Japanese"
    !insertmacro MUI_LANGUAGE "Korean"
    !insertmacro MUI_LANGUAGE "Italian"
    !insertmacro MUI_LANGUAGE "Dutch"
    !insertmacro MUI_LANGUAGE "Danish"
    !insertmacro MUI_LANGUAGE "Swedish"
    !insertmacro MUI_LANGUAGE "Norwegian"
    !insertmacro MUI_LANGUAGE "NorwegianNynorsk"
    !insertmacro MUI_LANGUAGE "Finnish"
    !insertmacro MUI_LANGUAGE "Greek"
    !insertmacro MUI_LANGUAGE "Russian"
    !insertmacro MUI_LANGUAGE "Portuguese"
    !insertmacro MUI_LANGUAGE "PortugueseBR"
    !insertmacro MUI_LANGUAGE "Polish"
    !insertmacro MUI_LANGUAGE "Ukrainian"
    !insertmacro MUI_LANGUAGE "Czech"
    !insertmacro MUI_LANGUAGE "Slovak"
    !insertmacro MUI_LANGUAGE "Croatian"
    !insertmacro MUI_LANGUAGE "Bulgarian"
    !insertmacro MUI_LANGUAGE "Hungarian"
    !insertmacro MUI_LANGUAGE "Thai"
    !insertmacro MUI_LANGUAGE "Romanian"
    !insertmacro MUI_LANGUAGE "Latvian"
    !insertmacro MUI_LANGUAGE "Macedonian"
    !insertmacro MUI_LANGUAGE "Estonian"
    !insertmacro MUI_LANGUAGE "Turkish"
    !insertmacro MUI_LANGUAGE "Lithuanian"
    !insertmacro MUI_LANGUAGE "Slovenian"
    !insertmacro MUI_LANGUAGE "Serbian"
    !insertmacro MUI_LANGUAGE "SerbianLatin"
    !insertmacro MUI_LANGUAGE "Arabic"
    !insertmacro MUI_LANGUAGE "Farsi"
    !insertmacro MUI_LANGUAGE "Hebrew"
    !insertmacro MUI_LANGUAGE "Indonesian"
    !insertmacro MUI_LANGUAGE "Mongolian"
    !insertmacro MUI_LANGUAGE "Luxembourgish"
    !insertmacro MUI_LANGUAGE "Albanian"
    !insertmacro MUI_LANGUAGE "Breton"
    !insertmacro MUI_LANGUAGE "Belarusian"
    !insertmacro MUI_LANGUAGE "Icelandic"
    !insertmacro MUI_LANGUAGE "Malay"
    !insertmacro MUI_LANGUAGE "Bosnian"
    !insertmacro MUI_LANGUAGE "Kurdish"
    !insertmacro MUI_LANGUAGE "Irish"
    !insertmacro MUI_LANGUAGE "Uzbek"
    !insertmacro MUI_LANGUAGE "Galician"
    !insertmacro MUI_LANGUAGE "Afrikaans"
    !insertmacro MUI_LANGUAGE "Catalan"
    !insertmacro MUI_LANGUAGE "Esperanto"
    !insertmacro MUI_LANGUAGE "Asturian"
    !insertmacro MUI_LANGUAGE "Basque"
    !insertmacro MUI_LANGUAGE "Pashto"
    !insertmacro MUI_LANGUAGE "ScotsGaelic"
    !insertmacro MUI_LANGUAGE "Georgian"
    !insertmacro MUI_LANGUAGE "Vietnamese"
    !insertmacro MUI_LANGUAGE "Welsh"
    !insertmacro MUI_LANGUAGE "Armenian"
    !insertmacro MUI_LANGUAGE "Corsican"
    !insertmacro MUI_LANGUAGE "Tatar"
    !insertmacro MUI_LANGUAGE "Hindi"

;--------------------------------
;Secciones de instalacion
Section "Principal" MainSec
    ;Seccion Obligatoria
    SectionIn RO

    ;Establecemos carpeta de destino
    SetOutPath "$INSTDIR"
    ;File "AppHotel.ico"
    File "LanzaAyuda.7z"

    Nsis7z::Extract "LanzaAyuda.7z"
    Delete "$OUTDIR\LanzaAyuda.7z"

    ;Crea el desinstalador
    WriteUninstaller "$INSTDIR\UnistallLanzaAyuda.exe"
SectionEnd

;Seccion para crear accesos directos
Section "Crear Accesos Direcctos"

;--------------------------------
;Funcion de selecion de idioma
Function .onInit
    !insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd

;--------------------------------
;Secciones de desinstalacion
Section "Desisntalador"
    Delete "$INSTDIR\UnistalLanzaAyuda.exe"

    RMDir "$INSTDIR"

    DeleteRegKey /ifempty HKCU "Software\Lanza Ayuda" 
SectionEnd

Function un.onInit
    !insertmacro MUI_UNGETLANGUAGE  
FunctionEnd