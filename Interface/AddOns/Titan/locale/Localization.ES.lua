local L = LibStub("AceLocale-3.0"):NewLocale("Titan","esES")
if not L then return end

L["TITAN_DEBUG"] = "<Titan>";
local TITAN_PANEL = "Titan Panel";
L["TITAN_DEBUG"] = "<Titan>";
L["TITAN_PRINT"] = "Titan";

L["TITAN_NA"] = "N/D";
L["TITAN_SECONDS"] = "segundos";
L["TITAN_MINUTES"] = "minutos";
L["TITAN_HOURS"] = "horas";
L["TITAN_DAYS"] = "días";
L["TITAN_SECONDS_ABBR"] = "s";
L["TITAN_MINUTES_ABBR"] = "m";
L["TITAN_HOURS_ABBR"] = "h";
L["TITAN_DAYS_ABBR"] = "d";
L["TITAN_MILLISECOND"] = "ms";
L["TITAN_KILOBYTES_PER_SECOND"] = "KB/s";
L["TITAN_KILOBITS_PER_SECOND"] = "kbps"
L["TITAN_MEGABYTE"] = "MB";
L["TITAN_NONE"] = "Nada";

L["TITAN_MOVABLE_TOOLTIP"] = "Pincha para mover";

L["TITAN_PANEL_ERROR_DUP_PLUGIN"] = " aparece duplicado. Esto puede hacer que Titan Panel falle, por favor, corrija el problema."
L["TITAN_PANEL_ERROR_PROF_DELCURRENT"] = "No puedes borrar el perfil actual.";
local TITAN_PANEL_WARNING = GREEN_FONT_COLOR_CODE.."Aviso : "..FONT_COLOR_CODE_CLOSE
local TITAN_PANEL_RELOAD_TEXT = "Si deseas continuar con esta operación, pulsa 'Aceptar' (se recargará tu interface), de lo contrario pulsa 'Cancelar' o la tecla 'Escape'."
L["TITAN_PANEL_RESET_WARNING"] = TITAN_PANEL_WARNING
.."Esta opción reseteará la configuración de tus barras y panel a los valores por defecto, y recreará tu perfil actual."
..TITAN_PANEL_RELOAD_TEXT
L["TITAN_PANEL_RELOAD"] = TITAN_PANEL_WARNING
.."Esto recargará "..TITAN_PANEL.."."
..TITAN_PANEL_RELOAD_TEXT
L["TITAN_PANEL_ATTEMPTS"] = "Sobre los plugins activados en "..TITAN_PANEL
L["TITAN_PANEL_ATTEMPTS_SHORT"] = "Información"
L["TITAN_PANEL_ATTEMPTS_DESC"] = "Los siguientes plugins han solicitado ser activados en Titan.\n"
.."Por favor envía cualquier incidencia que ocurra al autor del plugin."
L["TITAN_PANEL_ATTEMPTS_TYPE"] = "Tipo"
L["TITAN_PANEL_ATTEMPTS_CATEGORY"] = "Categoría"
L["TITAN_PANEL_ATTEMPTS_BUTTON"] = "Nombre del botón"
L["TITAN_PANEL_ATTEMPTS_STATUS"] = "Estatus"
L["TITAN_PANEL_ATTEMPTS_ISSUE"] = "Incidencia"
L["TITAN_PANEL_ATTEMPTS_NOTES"] = "Notas"
L["TITAN_PANEL_ATTEMPTS_TABLE"] = "Indice"
L["TITAN_PANEL_EXTRAS"] = "Extras de "..TITAN_PANEL
L["TITAN_PANEL_EXTRAS_SHORT"] = "Extras"
L["TITAN_PANEL_EXTRAS_DESC"] = "Estos plugins tienen cambios en su configuración que aún no han sido cargados.\n"
.."Nota: Has de desconectar del juego para que la lista se actualice."
L["TITAN_PANEL_EXTRAS_DELETE_BUTTON"] = "Borar cambios de configuración"
L["TITAN_PANEL_EXTRAS_DELETE_MSG"] = "eliminados los cambios de configuración."
L["TITAN_PANEL_CHARS"] = "Personajes"
L["TITAN_PANEL_CHARS_DESC"] = "Estos personajes tienen cambios en su configuración."
L["TITAN_PANEL_CHARS_DELETE_BUTTON"] = "Borrar datos del persojane"
L["TITAN_PANEL_CHARS_DELETE_MSG"] = "eliminados los datos del personaje."
L["TITAN_PANEL_REGISTER_START"] = "Registrar plugins de "..TITAN_PANEL.."..."
L["TITAN_PANEL_REGISTER_END"] = "Proceso de registro completado."
  
-- slash command help
L["TITAN_PANEL_SLASH_RESET_0"] = LIGHTYELLOW_FONT_COLOR_CODE.."Usage: |cffffffff/titan {reset | reset tipfont/tipalpha/panelscale/spacing}";
L["TITAN_PANEL_SLASH_RESET_1"] = " - "..LIGHTYELLOW_FONT_COLOR_CODE.."reset: |cffffffffResetea "..TITAN_PANEL.." a sus valores y posiciones por defecto.";
L["TITAN_PANEL_SLASH_RESET_2"] = " - "..LIGHTYELLOW_FONT_COLOR_CODE.."reset tipfont: |cffffffffResetea la escala de la fuente en los tooltips a su valor por defecto.";
L["TITAN_PANEL_SLASH_RESET_3"] = " - "..LIGHTYELLOW_FONT_COLOR_CODE.."reset tipalpha: |cffffffffResetea la transparencia de los tooltips a su valor por defecto.";
L["TITAN_PANEL_SLASH_RESET_4"] = " - "..LIGHTYELLOW_FONT_COLOR_CODE.."reset panelscale: |cffffffffResetea la escala de "..TITAN_PANEL.." a su valor por defecto.";
L["TITAN_PANEL_SLASH_RESET_5"] = " - "..LIGHTYELLOW_FONT_COLOR_CODE.."reset spacing: |cffffffffResetea el espaciado de los botones de "..TITAN_PANEL.." a su valor por defecto.";
L["TITAN_PANEL_SLASH_GUI_0"] = LIGHTYELLOW_FONT_COLOR_CODE.."Uso: |cffffffff/titan {gui control/trans/skin}";
L["TITAN_PANEL_SLASH_GUI_1"] = " - "..LIGHTYELLOW_FONT_COLOR_CODE.."gui control: |cffffffffAbre el interface de control para "..TITAN_PANEL..".";
L["TITAN_PANEL_SLASH_GUI_2"] = " - "..LIGHTYELLOW_FONT_COLOR_CODE.."gui trans: |cffffffffAbre el interface de control de transarencia.";
L["TITAN_PANEL_SLASH_GUI_3"] = " - "..LIGHTYELLOW_FONT_COLOR_CODE.."gui skin: |cffffffffAbre el interface de control de Skin.";
L["TITAN_PANEL_SLASH_PROFILE_0"] = LIGHTYELLOW_FONT_COLOR_CODE.."Uso: |cffffffff/titan {profile use <profile>}";
L["TITAN_PANEL_SLASH_PROFILE_1"] = " - "..LIGHTYELLOW_FONT_COLOR_CODE.."profile use <nombre> <servidor>: |cffffffffActiva el perfil grabado.";
L["TITAN_PANEL_SLASH_PROFILE_2"] = " - "..LIGHTYELLOW_FONT_COLOR_CODE.."<nombre>: |cffffffffpuede ser tanto un nombre de personaje como el nombre de un perfil personalizado."
L["TITAN_PANEL_SLASH_PROFILE_3"] = " - "..LIGHTYELLOW_FONT_COLOR_CODE.."<servidor>: |cffffffffpuede ser el nombre del servidor o 'TitanCustomProfile'."
L["TITAN_PANEL_SLASH_HELP_0"] = LIGHTYELLOW_FONT_COLOR_CODE.."Uso: |cffffffff/titan {help | help <topic>}";
L["TITAN_PANEL_SLASH_HELP_1"] = " - "..LIGHTYELLOW_FONT_COLOR_CODE.."<topic>: reset/gui/profile/help ";
L["TITAN_PANEL_SLASH_ALL_0"] = LIGHTYELLOW_FONT_COLOR_CODE.."Uso: |cffffffff/titan <topic>";
L["TITAN_PANEL_SLASH_ALL_1"] = " - "..LIGHTYELLOW_FONT_COLOR_CODE.."<topic>: |cffffffffreset/gui/profile/help ";

-- slash command responses
L["TITAN_PANEL_SLASH_RESP1"] = LIGHTYELLOW_FONT_COLOR_CODE.."La escala de la fuente en los tooltips de Titan Panel ha sido reseteada.";
L["TITAN_PANEL_SLASH_RESP2"] = LIGHTYELLOW_FONT_COLOR_CODE.."La transparencia de los tooltips de Titan Panel ha sido reseteada.";
L["TITAN_PANEL_SLASH_RESP3"] = LIGHTYELLOW_FONT_COLOR_CODE.."La escala de Titan Panel ha sido reseteada.";
L["TITAN_PANEL_SLASH_RESP4"] = LIGHTYELLOW_FONT_COLOR_CODE.."El espaciado de los botones de Titan Panel ha sido reseteado.";

-- global profile locale
L["TITAN_PANEL_GLOBAL"] = "Global";
L["TITAN_PANEL_GLOBAL_PROFILE"] = "Perfil Global";
L["TITAN_PANEL_GLOBAL_USE"] = "Usar Perfil Global";
L["TITAN_PANEL_GLOBAL_USE_AS"] = "Usar como Perfil Global";
L["TITAN_PANEL_GLOBAL_USE_DESC"] = "Utiliza un perfil global para todos los personajes";
L["TITAN_PANEL_GLOBAL_RESET_PART"] = "restableciendo opciones";
L["TITAN_PANEL_GLOBAL_ERR_1"] = "No se puede cargar un perfil cuando el global está en uso";

-- general panel locale
L["TITAN_PANEL"] = "Titan Panel";
L["TITAN_PANEL_VERSION_INFO"] = "|cffffd700 por el equipo de desarrollo de  |cffff8c00"..TITAN_PANEL.."";     
L["TITAN_PANEL_MENU_TITLE"] = TITAN_PANEL;
L["TITAN_PANEL_MENU_HIDE"] = "Ocultar";
L["TITAN_PANEL_MENU_CUSTOMIZE"] = "Personalizar";
L["TITAN_PANEL_MENU_IN_COMBAT_LOCKDOWN"] = "(En combate)";
L["TITAN_PANEL_MENU_RELOADUI"] = "(Recargar UI)";
L["TITAN_PANEL_MENU_SHOW_COLORED_TEXT"] = "Mostrar texto en color";
L["TITAN_PANEL_MENU_SHOW_ICON"] = "Mostrar icono";
L["TITAN_PANEL_MENU_SHOW_LABEL_TEXT"] = "Mostrar etiqueta de texto";
L["TITAN_PANEL_MENU_AUTOHIDE"] = "Auto-ocultar";
L["TITAN_PANEL_MENU_BGMINIMAP"] = "Campo de batalla en mini-mapa";
L["TITAN_PANEL_MENU_CENTER_TEXT"] = "Centrar texto";
L["TITAN_PANEL_MENU_DISPLAY_BAR"] = "Mostrar barra superior";
L["TITAN_PANEL_MENU_DISPLAY_BOTH"] = "Mostrar ambas barras";
L["TITAN_PANEL_MENU_DISABLE_PUSH"] = "Desactivar ajuste de pantalla";
L["TITAN_PANEL_MENU_DISABLE_MINIMAP_PUSH"] = "Desactivar ajuste de minimapa";
L["TITAN_PANEL_MENU_DISABLE_LOGS"] = "Ajuste automático de log";
L["TITAN_PANEL_MENU_DISABLE_BAGS"] = "Ajuste automático de bolsas";
L["TITAN_PANEL_MENU_DISABLE_TICKET"] = "Ajuste automático de la ventana de tickets";
L["TITAN_PANEL_MENU_BUILTINS"] = "De serie en Titan";
L["TITAN_PANEL_MENU_LEFT_SIDE"] = "Lado izquierdo";
L["TITAN_PANEL_MENU_RIGHT_SIDE"] = "Lado derecho";
L["TITAN_PANEL_MENU_PROFILES"] = "Perfiles";
L["TITAN_PANEL_MENU_PROFILE"] = "Perfil ";
L["TITAN_PANEL_MENU_PROFILE_CUSTOM"] = "Personalizado";
L["TITAN_PANEL_MENU_PROFILE_DELETED"] = " ha sido borrado.";
L["TITAN_PANEL_MENU_PROFILE_SERVERS"] = "Servidor";
L["TITAN_PANEL_MENU_PROFILE_CHARS"] = "Personaje";
L["TITAN_PANEL_MENU_PROFILE_RELOADUI"] = "Se recargará tu interface en cuanto pulses 'Ok' para poder grabar tu perfil personalizado.";
L["TITAN_PANEL_MENU_PROFILE_SAVE_CUSTOM_TITLE"] = "Introduce un nombre para tu perfil personalizado::\n(20 carácteres máximo, sin espacios, diferencia entre mayúsculas y minúsculas)";
L["TITAN_PANEL_MENU_PROFILE_SAVE_PENDING"] = "La configuración actual del panel se va a grabar en el perfil llamado: ";
L["TITAN_PANEL_MENU_PROFILE_ALREADY_EXISTS"] = "El nombre de perfil introducido ya existe. Â¿Estás seguro de que quieres sobreescribirlo? Pulsa 'Aceptar' si lo deseas, de lo contrario pulsa 'Cancelar' o la tecla 'Escape'.";
L["TITAN_PANEL_MENU_MANAGE_SETTINGS"] = "Gestionar";
L["TITAN_PANEL_MENU_LOAD_SETTINGS"] = "Cargar ajustes";
L["TITAN_PANEL_MENU_DELETE_SETTINGS"] = "Borrar";
L["TITAN_PANEL_MENU_SAVE_SETTINGS"] = "Grabar";
--L["TITAN_PANEL_MENU_DOUBLE_BAR"] = "Barra superior doble";
L["TITAN_PANEL_MENU_CONFIGURATION"] = "Configuración";
L["TITAN_PANEL_OPTIONS"] = "Opciones";
L["TITAN_PANEL_MENU_TOP"] = "Superior"
L["TITAN_PANEL_MENU_TOP2"] = "Superior 2"
L["TITAN_PANEL_MENU_BOTTOM"] = "Inferior"
L["TITAN_PANEL_MENU_BOTTOM2"] = "Inferior 2"
L["TITAN_PANEL_MENU_OPTIONS"] = "Tooltips y Marcos de "..TITAN_PANEL;
L["TITAN_PANEL_MENU_OPTIONS_SHORT"] = "Tooltips y Marcos";
L["TITAN_PANEL_MENU_TOP_BARS"] = "Barras superiores";
L["TITAN_PANEL_MENU_BOTTOM_BARS"] = "Barras inferiores";
L["TITAN_PANEL_MENU_OPTIONS_BARS"] = "Barras";
L["TITAN_PANEL_MENU_OPTIONS_MAIN_BARS"] = "Barras superiores "..TITAN_PANEL;
L["TITAN_PANEL_MENU_OPTIONS_AUX_BARS"] = "Barras inferiores "..TITAN_PANEL;
L["TITAN_PANEL_MENU_OPTIONS_TOOLTIPS"] = "Tooltips";
L["TITAN_PANEL_MENU_OPTIONS_FRAMES"] = "Marcos";
L["TITAN_PANEL_MENU_PLUGINS"] = "Plugins";
L["TITAN_PANEL_MENU_LOCK_BUTTONS"] = "Bloquear botones";
L["TITAN_PANEL_MENU_VERSION_SHOWN"] = "Mostrar versiones del plugin";
L["TITAN_PANEL_MENU_LDB_SIDE"] = "Plugin del lado derecho";
L["TITAN_PANEL_MENU_LDB_FORCE_LAUNCHER"] = "Forzar lanzadores LDB en el lado derecho";
L["TITAN_PANEL_MENU_DISABLE_FONT"] = "Desactivar escalado de fuentes";
L["TITAN_PANEL_MENU_CATEGORIES"] = {"De serie en Titan","General","Combate","Información","Interfaz","Profesión"}
L["TITAN_PANEL_MENU_TOOLTIPS_SHOWN"] = "Mostrar tooltips";
L["TITAN_PANEL_MENU_TOOLTIPS_SHOWN_IN_COMBAT"] = "Ocultar tooltips en combate";
L["TITAN_PANEL_MENU_AUTOHIDE_IN_COMBAT"] = "Ocultar las barras en combate"
L["TITAN_PANEL_MENU_RESET"] = "Volver a los ajustes por defecto de "..TITAN_PANEL;
L["TITAN_PANEL_MENU_TEXTURE_SETTINGS"] = "Skins";
L["TITAN_PANEL_MENU_FONT"] = "Fuente";
L["TITAN_PANEL_MENU_LSM_FONTS"] = "Fuente del Panel"
L["TITAN_PANEL_MENU_ENABLED"] = "Activado";
L["TITAN_PANEL_MENU_DISABLED"] = "Desactivado";
L["TITAN_PANEL_SHIFT_LEFT"] = "Mayus-Izdo.";
L["TITAN_PANEL_SHIFT_RIGHT"] = "Mayus-Dcho.";
L["TITAN_PANEL_MENU_SHOW_PLUGIN_TEXT"] = "Mostrar texto del plugin";
L["TITAN_PANEL_MENU_LDB_TREAT"] = "Tratar como origen de datos";
L["TITAN_PANEL_MENU_LDB_SLAP"] = "Si necesitas usar esto solicítale al autor que cambie el tipo LDB";
L["TITAN_PANEL_MENU_BAR_ALWAYS"] = "Siempre activo";
L["TITAN_PANEL_MENU_POSITION"] = "Posición";
L["TITAN_PANEL_MENU_BAR"] = "Barra";
L["TITAN_PANEL_MENU_DISPLAY_ON_BAR"] = "Elige en qué barra se mostrará el plugin";
L["TITAN_PANEL_MENU_SHOW"] = "Mostrar plugin";
L["TITAN_PANEL_MENU_PLUGIN_RESET"] = "Actualizar plugins";
L["TITAN_PANEL_MENU_PLUGIN_RESET_DESC"] = "Actualizar texto y posición de plugin";

-- localization strings for AceConfigDialog-3.0     
L["TITAN_ABOUT_VERSION"] = "Versión";
L["TITAN_ABOUT_AUTHOR"] = "Autor";
L["TITAN_ABOUT_CREDITS"] = "Créditos";
L["TITAN_ABOUT_CATEGORY"] = "Categoría";
L["TITAN_ABOUT_EMAIL"] = "Email";
L["TITAN_ABOUT_WEB"] = "Sitio Web";
L["TITAN_ABOUT_LICENSE"] = "Licencia";
L["TITAN_PANEL_CONFIG_MAIN_LABEL"] = "Addon de la barra de información. Permite a los usuarios añadir orígenes de datos o plugins lanzadores en un panel de control situado en la parte superior o inferior de la pantalla."; 
L["TITAN_TRANS_MENU_TEXT"] = TITAN_PANEL.." Transparencia";
L["TITAN_TRANS_MENU_TEXT_SHORT"] = "Transparencia";
L["TITAN_TRANS_MENU_DESC"] = "Ajustar transparencia para las barras "..TITAN_PANEL.." y sus tooltips.";
L["TITAN_TRANS_MAIN_CONTROL_TITLE"] = "Barra Principal";
L["TITAN_TRANS_AUX_CONTROL_TITLE"] = "Barra Auxiliar";
L["TITAN_TRANS_CONTROL_TITLE_TOOLTIP"] = "Tooltips"; 
L["TITAN_TRANS_MAIN_BAR_DESC"] = "Establece la transparencia para la Barra Principal.";
L["TITAN_TRANS_AUX_BAR_DESC"] = "Establece la transparencia para la Barra Auxiliar (inferior).";
L["TITAN_TRANS_TOOLTIP_DESC"] = "Establece la transparencia para los tooltips de varios plugins.";
L["TITAN_UISCALE_MENU_TEXT"] = "Escala y Fuentes de "..TITAN_PANEL;
L["TITAN_UISCALE_MENU_TEXT_SHORT"] = "Escala y Fuentes";
L["TITAN_UISCALE_CONTROL_TITLE_UI"] = "Escala del interface";
L["TITAN_UISCALE_CONTROL_TITLE_PANEL"] = "Escala de "..TITAN_PANEL;
L["TITAN_UISCALE_CONTROL_TITLE_BUTTON"] = "Espaciado de los botones";
L["TITAN_UISCALE_CONTROL_TITLE_ICON"] = "Espaciado de iconos";
L["TITAN_UISCALE_CONTROL_TOOLTIP_TOOLTIPFONT"] = "Tamaño de la fuente de los tooltips";
L["TITAN_UISCALE_TOOLTIP_DISABLE_TEXT"] = "Desactivar tamaño de la fuente de los tooltips"; 
L["TITAN_UISCALE_MENU_DESC"] = "Controla varios aspectos del interface y "..TITAN_PANEL..".";
L["TITAN_UISCALE_SLIDER_DESC"] = "Establece la escala de todo el interface.";
L["TITAN_UISCALE_PANEL_SLIDER_DESC"] = "Establece la escala para los distintos botones e iconos de "..TITAN_PANEL..".";
L["TITAN_UISCALE_BUTTON_SLIDER_DESC"] = "Ajusta el espacio entre los plugins del lado izquierdo.";
L["TITAN_UISCALE_ICON_SLIDER_DESC"] = "Ajusta el espacio entre los iconos de los plugins del lado derecho.";
L["TITAN_UISCALE_TOOLTIP_SLIDER_DESC"] = "Ajusta la escala de los tooltips de varios plugins.";
L["TITAN_UISCALE_DISABLE_TOOLTIP_DESC"] = "Desactiva el control de la escala de los tooltips en "..TITAN_PANEL..".";
L["TITAN_SKINS_TITLE"] = "Skins de "..TITAN_PANEL;
L["TITAN_SKINS_OPTIONS_CUSTOM"] = "Skins - Personalizado";
L["TITAN_SKINS_TITLE_CUSTOM"] = "Skins Personalizados de "..TITAN_PANEL;
L["TITAN_SKINS_MAIN_DESC"] = "Se asume que todos los skins personalizados están en: \n"
			.."..\\AddOns\\Titan\\Artwork\\Custom\\<Skin Folder>\\ ".."\n"
			.."\n"..TITAN_PANEL.." y los skins personalizados son almacenados en el directorio Custom."
L["TITAN_SKINS_LIST_TITLE"] = "Lista de skins";
L["TITAN_SKINS_SET_DESC"] = "Elige que skin quieres para las barras "..TITAN_PANEL..".";
L["TITAN_SKINS_SET_HEADER"] = "Establece skin de "..TITAN_PANEL;
L["TITAN_SKINS_RESET_HEADER"] = "Resetea el skin de "..TITAN_PANEL;
L["TITAN_SKINS_NEW_HEADER"] = "Añadir nuevo skin";
L["TITAN_SKINS_NAME_TITLE"] = "Nombre de skin";
L["TITAN_SKINS_NAME_DESC"] = "Introduce un nombre para tu nuevo skin. Se usará en la lista desplegable de skins.";
L["TITAN_SKINS_NAME_EXAMPLE"] = "ejemplo: mi skin Titan";
L["TITAN_SKINS_PATH_TITLE"] = "<Ruta del skin>";
L["TITAN_SKINS_PATH_DESC"] = "<Ruta del skin> en el directorio de instalación de "..TITAN_PANEL..". Mirar el ejemplo superior." 
--L["TITAN_SKINS_PATH_EXAMPLE"] = "ejemplo: Interface\\AddOns\\Titan\\Artwork\\Custom\\<directorio de mi skin>\\";
L["TITAN_SKINS_ADD_HEADER"] = "Añadir skin";
L["TITAN_SKINS_ADD_DESC"] = "Añade un nuevo skin a la lista de skins disponibles para el Panel.";
L["TITAN_SKINS_REMOVE_HEADER"] = "Eliminar skin";
L["TITAN_SKINS_REMOVE_DESC"] = "Elige un skin para eliminar de la lista de skins disponibles para el Panel.";
L["TITAN_SKINS_REMOVE_BUTTON"] = "Eliminar";
L["TITAN_SKINS_REMOVE_BUTTON_DESC"] = "Elimina el skin selecionado de la lista de skins disponibles para el Panel.";
L["TITAN_SKINS_REMOVE_NOTES"] = "Serás el único responsable si eliminas cualquier skin personalizado no deseado "
	.." del directorio de instalación de "..TITAN_PANEL..". Los addons no pueden añadir o eliminar archivos."
--L["TITAN_SKINS_NOTES"] = "|cff19ff19Notas:|r Al añadir un nuevo skin, por favor asegurate de que el directorio que contiene tus imágenes personalizadas ha sido creado antes de cargar 'World of Warcraft' y que la ruta introducida corresponde a ese directorio exactamente (las rutas son sensibles a mayúsculas y minúsculas y siempre acaban con el carácter '\\')..";
L["TITAN_SKINS_RESET_DEFAULTS_TITLE"] = "Resetear lista";
L["TITAN_SKINS_RESET_DEFAULTS_DESC"] = "Resetea la lista de skins a sus valores por defecto, los skins incluidos de serie.";
L["TITAN_PANEL_MENU_LSM_FONTS_DESC"] = "Elige el tipo de letra utilizado por los diferentes plugins en las barras "..TITAN_PANEL..".";
L["TITAN_PANEL_MENU_FONT_SIZE"] = "Tamaño de la fuente";
L["TITAN_PANEL_MENU_FONT_SIZE_DESC"] = "Establece el tamaño para el tipo de letra de "..TITAN_PANEL..".";
L["TITAN_PANEL_MENU_FRAME_STRATA"] = "Frame Strata de "..TITAN_PANEL;
L["TITAN_PANEL_MENU_FRAME_STRATA_DESC"] = "Establece la prioridad de visionado de las Barras "..TITAN_PANEL..".";
-- /end localization strings for AceConfigDialog-3.0

L["TITAN_PANEL_MENU_ADV"] = "Avanzado";
L["TITAN_PANEL_MENU_ADV_DESC"] = "Cambia el retraso tras eventos sólo si tienes problemas de desajuste con los marcos.".."\n";
L["TITAN_PANEL_MENU_ADV_PEW"] = "Entrando en el reino";
L["TITAN_PANEL_MENU_ADV_PEW_DESC"] = "Cambia el valor (habitualmente incrementándolo) si los marcos no se ajustan al entrar o salir del reino o de una instancia.";
L["TITAN_PANEL_MENU_ADV_VEHICLE"] = "Vehículo";
L["TITAN_PANEL_MENU_ADV_VEHICLE_DESC"] = "Cambia el valor (habitualmente incrementándolo) si los marcos no se ajustan al entrar o salir de un vehículo.";

L["TITAN_AUTOHIDE_TOOLTIP"] = "Activar/Desactivar la característica de auto-ocultación de "..TITAN_PANEL;
--L["TITAN_AUTOHIDE_MENU_TEXT"] = "Auto-ocultar";

L["TITAN_BAG_FORMAT"] = "%d/%d";
L["TITAN_BAG_BUTTON_LABEL"] = "Bolsas: ";
L["TITAN_BAG_TOOLTIP"] = "Uso de bolsas";
L["TITAN_BAG_TOOLTIP_HINTS"] = "Consejo: Click-Izq. Abre todas las bolsas.";
L["TITAN_BAG_MENU_TEXT"] = "Bolsas";
L["TITAN_BAG_USED_SLOTS"] = "Huecos usados";
L["TITAN_BAG_FREE_SLOTS"] = "Huecos libres";
L["TITAN_BAG_BACKPACK"] = "Mochila";
L["TITAN_BAG_MENU_SHOW_USED_SLOTS"] = "Mostrar huecos usados";
L["TITAN_BAG_MENU_SHOW_AVAILABLE_SLOTS"] = "Mostrar huecos libres";
L["TITAN_BAG_MENU_SHOW_DETAILED"] = "Mostrar tooltip detallado";
L["TITAN_BAG_MENU_IGNORE_SLOTS"] = "Ignorar bolsas";
--L["TITAN_BAG_MENU_IGNORE_AMMO_POUCH_SLOTS"] = "Ignorar bolsas de munición";
--L["TITAN_BAG_MENU_IGNORE_SHARD_BAGS_SLOTS"] = "Ignorar bolsas de almas";
L["TITAN_BAG_MENU_IGNORE_PROF_BAGS_SLOTS"] = "Ignorar bolsas de profesión";
--L["TITAN_BAG_SHARD_BAG_NAMES"] = {"Faltriquera de almas", "Bolsa de tela vil", "Bolsa de tela vil del Núcleo", "Bolsa de las Sombras de ébano", "Faltriquera de almas pequeña", "Caja de almas"};
--L["TITAN_BAG_AMMO_POUCH_NAMES"] = {"munición", "Carcaj", "Bandolera", "pólvora", "lámina"};
L["TITAN_BAG_PROF_BAG_NAMES"] = {
-- Enchanting
"Faltriquera de tejido mágico encantada","Bolsa de paño rúnico encantada","Cartera de encantador","Bolsa de encantamiento grande","Bolsa de fuego de hechizo","Bolsa misteriosa","Bolsa de otro mundo","Bolso de noche encantador \"Trasportín exclusivo\"",
-- Engineering
"Caja de herramientas pesada","Caja de herramientas de hierro vil","Caja de herramientas de titanio","Caja de herramientas de elementium","Bolsa de alta tecnología \"Transportín Maddy\"",
-- Herbalism
"Faltriquera de hierbas","Bolsa de hierbas Cenarion","Cartera de Cenarius","Bolsa de expedición de Hyjal","Bolsa esmeralda","Bolsa Botánica de Mycah","Portahierbas \"Trasportín ecológico\"",
-- Inscription
"Cartera de escriba","Bolsa de bolsillos infinitos","Cartera de estudiante \"Transportín Xandera\"",
-- Jewelcrafting
"Faltriquera de gemas","Bolsa de joyas","Agarre con tachuelas de gemas \"Trasportín exclusivo\"",
-- Leatherworking
"Cartera de peletero","Mochila de viaje de trampero","Bolsa de muchos pellejos","Bolsa de cuero \"Transportín Meeya\"",
-- Mining
"Saco de minero","Bolsa de minero reforzada","Bolsa de minero descomunal","Bolsa de metal precioso \"Trasportín Christina\"",
-- Fishing
"Caja de aparejos Maestro del Cebo",
};

--L["TITAN_BGMINIMAP_MENU_TEXT"] = "Campo de Batalla en minimapa"
--L["TITAN_BGMINIMAP_TOOLTIP"] = "Botón Campode Batalla en minimapa"

L["TITAN_CLOCK_TOOLTIP"] = "Reloj";
L["TITAN_CLOCK_TOOLTIP_VALUE"] = "Ajuste horario: ";
L["TITAN_CLOCK_TOOLTIP_LOCAL_TIME"] = "Hora local: ";
L["TITAN_CLOCK_TOOLTIP_SERVER_TIME"] = "Hora del servidor: ";
L["TITAN_CLOCK_TOOLTIP_SERVER_ADJUSTED_TIME"] = "Hora del servidor ajustada: ";
L["TITAN_CLOCK_TOOLTIP_HINT1"] = "Consejo: Click-Izq. ajusta el horario"
L["TITAN_CLOCK_TOOLTIP_HINT2"] = "y el formato de tiempo 12/24H.";
L["TITAN_CLOCK_TOOLTIP_HINT3"] = "Sift + Click-Izq. para activar y desactivar el calendario.";
L["TITAN_CLOCK_CONTROL_TOOLTIP"] = "Ajuste horario: ";
L["TITAN_CLOCK_CONTROL_TITLE"] = "Ajuste horario";
L["TITAN_CLOCK_CONTROL_HIGH"] = "+12";
L["TITAN_CLOCK_CONTROL_LOW"] = "-12";
L["TITAN_CLOCK_CHECKBUTTON"] = "24H";
L["TITAN_CLOCK_CHECKBUTTON_TOOLTIP"] = "Alterna la hora mostrada entre los formatos de 12 horas y 24 horas";
L["TITAN_CLOCK_MENU_TEXT"] = "Reloj";
L["TITAN_CLOCK_MENU_LOCAL_TIME"] = "Muestra hora local (L)";
L["TITAN_CLOCK_MENU_SERVER_TIME"] = "Muestra hora del servidor (S)";
L["TITAN_CLOCK_MENU_SERVER_ADJUSTED_TIME"] = "Muestra hora del servidor ajustada (A)";
L["TITAN_CLOCK_MENU_DISPLAY_ON_RIGHT_SIDE"] = "Mostrar al final a la derecha";
L["TITAN_CLOCK_MENU_HIDE_GAMETIME"] = "Ocultar botón de hora/calendario";
L["TITAN_CLOCK_MENU_HIDE_MAPTIME"] = "Ocultar botón de hora";
L["TITAN_CLOCK_MENU_HIDE_CALENDAR"] = "Ocultar botón de calendario";


L["TITAN_COORDS_FORMAT"] = "(%.d, %.d)";
L["TITAN_COORDS_FORMAT2"] = "(%.1f, %.1f)";
L["TITAN_COORDS_FORMAT3"] = "(%.2f, %.2f)";
L["TITAN_COORDS_FORMAT_LABEL"] = "(xx , yy)";
L["TITAN_COORDS_FORMAT2_LABEL"] = "(xx.x , yy.y)";
L["TITAN_COORDS_FORMAT3_LABEL"] = "(xx.xx , yy.yy)";
L["TITAN_COORDS_FORMAT_COORD_LABEL"] = "Formato de coordenadas";
L["TITAN_COORDS_BUTTON_LABEL"] = "Loc: ";
L["TITAN_COORDS_TOOLTIP"] = "Ubicación";
L["TITAN_COORDS_TOOLTIP_HINTS_1"] = "Consejo: Shift + Click-Izq. para poner la ubicación";
L["TITAN_COORDS_TOOLTIP_HINTS_2"] = "en el chat de mensajes.";
L["TITAN_COORDS_TOOLTIP_ZONE"] = "Zona: ";
L["TITAN_COORDS_TOOLTIP_SUBZONE"] = "Subzona: ";
L["TITAN_COORDS_TOOLTIP_PVPINFO"] = "Info PVP: ";
L["TITAN_COORDS_TOOLTIP_HOMELOCATION"] = "Ubicación de mi casa";
L["TITAN_COORDS_TOOLTIP_INN"] = "Posada: ";
L["TITAN_COORDS_MENU_TEXT"] = "Ubicación";
L["TITAN_COORDS_MENU_SHOW_ZONE_ON_PANEL_TEXT"] = "Mostrar texto de zona";
L["TITAN_COORDS_MENU_SHOW_COORDS_ON_MAP_TEXT"] = "Mostrar coordenadas en el mapamundi";
L["TITAN_COORDS_MAP_CURSOR_COORDS_TEXT"] = "Cursor(X,Y): %s";
L["TITAN_COORDS_MAP_PLAYER_COORDS_TEXT"] = "Jugador(X,Y): %s";
L["TITAN_COORDS_NO_COORDS"] = "Sin Coordenadas";
L["TITAN_COORDS_MENU_SHOW_LOC_ON_MINIMAP_TEXT"] = "Mostrar el nombre de la ubicación sobre el minimapa";
L["TITAN_COORDS_MENU_UPDATE_WORLD_MAP"] = "Actualizar mapamundi cuando cambia la zona";

L["TITAN_FPS_FORMAT"] = "%.1f";
L["TITAN_FPS_BUTTON_LABEL"] = "FPS: ";
L["TITAN_FPS_MENU_TEXT"] = "FPS";
L["TITAN_FPS_TOOLTIP_CURRENT_FPS"] = "FPS actuales: ";
L["TITAN_FPS_TOOLTIP_AVG_FPS"] = "FPS de nedia: ";
L["TITAN_FPS_TOOLTIP_MIN_FPS"] = "FPS mínimos: ";
L["TITAN_FPS_TOOLTIP_MAX_FPS"] = "FPS máximos: ";
L["TITAN_FPS_TOOLTIP"] = "Imágenes por segundo";

L["TITAN_LATENCY_FORMAT"] = "%d".."ms";
L["TITAN_LATENCY_BANDWIDTH_FORMAT"] = "%.3f ".."KB/s";
L["TITAN_LATENCY_BUTTON_LABEL"] = "Latencia: ";
L["TITAN_LATENCY_TOOLTIP"] = "Estado de red";
L["TITAN_LATENCY_TOOLTIP_LATENCY_HOME"] = "Latencia del reino (hogar): ";
L["TITAN_LATENCY_TOOLTIP_LATENCY_WORLD"] = "Latencia del juego (mundo): ";
L["TITAN_LATENCY_TOOLTIP_BANDWIDTH_IN"] = "Ancho de banda entrante: ";
L["TITAN_LATENCY_TOOLTIP_BANDWIDTH_OUT"] = "Ancho de banda de salida: ";
L["TITAN_LATENCY_MENU_TEXT"] = "Latencia";

L["TITAN_LOOTTYPE_BUTTON_LABEL"] = "Saqueo: ";
L["TITAN_LOOTTYPE_FREE_FOR_ALL"] = "Libre para todos";
L["TITAN_LOOTTYPE_ROUND_ROBIN"] = "Por turnos";
L["TITAN_LOOTTYPE_MASTER_LOOTER"] = "Maestro despojador";
L["TITAN_LOOTTYPE_GROUP_LOOT"] = "Botín de grupo";
L["TITAN_LOOTTYPE_NEED_BEFORE_GREED"] = "Necesidad antes que codicia";
L["TITAN_LOOTTYPE_TOOLTIP"] = "Tipo de saqueo";
L["TITAN_LOOTTYPE_MENU_TEXT"] = "Tipo de saqueo";
L["TITAN_LOOTTYPE_RANDOM_ROLL_LABEL"] = "Tirar dados";
L["TITAN_LOOTTYPE_TOOLTIP_HINT1"] = "Consejo: Click-Izq. para tirar dados.";
L["TITAN_LOOTTYPE_TOOLTIP_HINT2"] = "Seleccione el valor de la tirada de dados con el menu de Click-Dcho.";
L["TITAN_LOOTTYPE_DUNGEONDIFF_LABEL"] = "Dificultad de Mazmorra";
L["TITAN_LOOTTYPE_DUNGEONDIFF_LABEL2"] = "Dificultad de Banda";
L["TITAN_LOOTTYPE_SHOWDUNGEONDIFF_LABEL"] = "Mostrar dificultad de Mazmorra/Banda";
L["TITAN_LOOTTYPE_SETDUNGEONDIFF_LABEL"] = "Establecer dificultad de Mazmorra";
L["TITAN_LOOTTYPE_SETRAIDDIFF_LABEL"] = "Establecer dificultad de Banda";
L["TITAN_LOOTTYPE_AUTODIFF_LABEL"] = "Auto (según grupo)";

L["TITAN_MEMORY_FORMAT"] = "%.3f".."MB";
L["TITAN_MEMORY_FORMAT_KB"] = "%d".."KB";
L["TITAN_MEMORY_RATE_FORMAT"] = "%.3f".."KB/s";
L["TITAN_MEMORY_BUTTON_LABEL"] = "Memoria: ";
L["TITAN_MEMORY_TOOLTIP"] = "Uso de Memoria";
L["TITAN_MEMORY_TOOLTIP_CURRENT_MEMORY"] = "Actual: ";
L["TITAN_MEMORY_TOOLTIP_INITIAL_MEMORY"] = "Inicial: ";
L["TITAN_MEMORY_TOOLTIP_INCREASING_RATE"] = "Ratio de Incremento: ";
L["TITAN_MEMORY_KBMB_LABEL"] = "KB/MB";

L["TITAN_MONEY_GOLD"] = "o";
L["TITAN_MONEY_SILVER"] = "p";
L["TITAN_MONEY_COPPER"] = "b";
L["TITAN_MONEY_FORMAT"] = "%d".."o"..", %02d".."p"..", %02d".."b";

L["TITAN_PERFORMANCE_TOOLTIP"] = "Monitorización";
L["TITAN_PERFORMANCE_MENU_TEXT"] = "Monitorización";
L["TITAN_PERFORMANCE_ADDONS"] = "Addon de uso";
L["TITAN_PERFORMANCE_ADDON_MEM_USAGE_LABEL"] = "Addon de uso de memoria";
L["TITAN_PERFORMANCE_ADDON_MEM_FORMAT_LABEL"] = "Formato de memoria";
L["TITAN_PERFORMANCE_ADDON_CPU_USAGE_LABEL"] = "Addon de uso de procesador";
L["TITAN_PERFORMANCE_ADDON_NAME_LABEL"] = "Nombre:";
L["TITAN_PERFORMANCE_ADDON_USAGE_LABEL"] = "Uso";
L["TITAN_PERFORMANCE_ADDON_RATE_LABEL"] = "Ratio";
L["TITAN_PERFORMANCE_ADDON_TOTAL_MEM_USAGE_LABEL"] = "Uso de memoria total:";
L["TITAN_PERFORMANCE_ADDON_TOTAL_CPU_USAGE_LABEL"] = "Uso de procesador total:";
L["TITAN_PERFORMANCE_MENU_SHOW_FPS"] = "Mostrar FPS";
L["TITAN_PERFORMANCE_MENU_SHOW_LATENCY"] = "Mostrar latencia del reino (hogar)";
L["TITAN_PERFORMANCE_MENU_SHOW_LATENCY_WORLD"] = "Mostrar latencia del juego (mundo)";
L["TITAN_PERFORMANCE_MENU_SHOW_MEMORY"] = "Mostrar nemoria";
L["TITAN_PERFORMANCE_MENU_SHOW_ADDONS"] = "Mostrar Addon de uso de memoria";
L["TITAN_PERFORMANCE_MENU_SHOW_ADDON_RATE"] = "Mostrar Addon de ratio de uso";
L["TITAN_PERFORMANCE_MENU_CPUPROF_LABEL"] = "Modo de monitorización del procesador";
L["TITAN_PERFORMANCE_MENU_CPUPROF_LABEL_ON"] = "Activar monitorización del procesador ";
L["TITAN_PERFORMANCE_MENU_CPUPROF_LABEL_OFF"] = "Desactivar monitorización del procesador ";
L["TITAN_PERFORMANCE_CONTROL_TOOLTIP"] = "Addons monitorizados: ";
L["TITAN_PERFORMANCE_CONTROL_TITLE"] = "Addons monitorizados";
L["TITAN_PERFORMANCE_CONTROL_HIGH"] = "40";
L["TITAN_PERFORMANCE_CONTROL_LOW"] = "1";
L["TITAN_PERFORMANCE_TOOLTIP_HINT"] = "Consejo: Click-Izq. para forzar una limpieza de memoria.";

L["TITAN_XP_FORMAT"] = "%d";
L["TITAN_XP_PERCENT_FORMAT"] = "%d".." (%.1f%%)";
L["TITAN_XP_BUTTON_LABEL_XPHR_LEVEL"] = "XP/hr este nivel: ";
L["TITAN_XP_BUTTON_LABEL_XPHR_SESSION"] = "XP/hr esta sesión: ";
L["TITAN_XP_BUTTON_LABEL_TOLEVEL_TIME_LEVEL"] = "Tiempo para subir: ";
L["TITAN_XP_LEVEL_COMPLETE"] = "Nivel completo: ";
L["TITAN_XP_TOTAL_RESTED"] = "XP bonifcada por descanso: ";
L["TITAN_XP_XPTOLEVELUP"] = "XP para subir: ";
L["TITAN_XP_TOOLTIP"] = "INFO XP";
L["TITAN_XP_TOOLTIP_TOTAL_TIME"] = "Tiempo total jugado: ";
L["TITAN_XP_TOOLTIP_LEVEL_TIME"] = "Tiempo jugado este nivel: ";
L["TITAN_XP_TOOLTIP_SESSION_TIME"] = "Tiempo jugado esta sesión: ";
L["TITAN_XP_TOOLTIP_TOTAL_XP"] = "XP requerida este nivel: ";
L["TITAN_XP_TOOLTIP_LEVEL_XP"] = "XP ganada este nivel: ";
L["TITAN_XP_TOOLTIP_TOLEVEL_XP"] = "XP necesaria este nivel: ";
L["TITAN_XP_TOOLTIP_SESSION_XP"] = "XP ganada esta sesión: ";
L["TITAN_XP_TOOLTIP_XPHR_LEVEL"] = "XP/hr este nivel: ";
L["TITAN_XP_TOOLTIP_XPHR_SESSION"] = "XP/hr esta sesión: ";
L["TITAN_XP_TOOLTIP_TOLEVEL_LEVEL"] = "Tiempo para subir (ratio de nivel): ";
L["TITAN_XP_TOOLTIP_TOLEVEL_SESSION"] = "Tiempo para subir (ratio de sesión): ";
L["TITAN_XP_MENU_TEXT"] = "XP";
L["TITAN_XP_MENU_SHOW_XPHR_THIS_LEVEL"] = "Mostrar XP/hr este nivel";
L["TITAN_XP_MENU_SHOW_XPHR_THIS_SESSION"] = "Mostrar XP/hr esta sesión";
L["TITAN_XP_MENU_SHOW_RESTED_TOLEVELUP"] = "Mostrar descanso/XP para subir";
L["TITAN_XP_MENU_SIMPLE_BUTTON_TITLE"] = "Botón";
L["TITAN_XP_MENU_SIMPLE_BUTTON_RESTED"] = "Mostrar bonus XP por descanso";
L["TITAN_XP_MENU_SIMPLE_BUTTON_TOLEVELUP"] = "Mostrar XP para subir";
L["TITAN_XP_MENU_SIMPLE_BUTTON_KILLS"] = "Mostrar muertes estimadas para subir";
L["TITAN_XP_MENU_RESET_SESSION"] = "Reiniciar sesión";
L["TITAN_XP_MENU_REFRESH_PLAYED"] = "Actualizar temporizadores";
L["TITAN_XP_UPDATE_PENDING"] = "Actualizando...";
L["TITAN_XP_KILLS_LABEL"] = "Muertes para subir (a %d XP ganados la última vez): ";
L["TITAN_XP_KILLS_LABEL_SHORT"] = "Muertes estimadas: ";
L["TITAN_XP_BUTTON_LABEL_SESSION_TIME"] = "Tiempo en esta sesión: ";
L["TITAN_XP_MENU_SHOW_SESSION_TIME"] = "Mostrar tiempo en esta sesión";
L["TITAN_XP_GAIN_PATTERN"] = "(.*) muere, ganas (%d+) de experiencia.";
L["TITAN_XP_XPGAINS_LABEL_SHORT"] = "Gananc. Est.: ";
L["TITAN_XP_XPGAINS_LABEL"] = "Ganancias de XP para subir (a %d XP ganados la útltima vez): ";
L["TITAN_XP_MENU_SIMPLE_BUTTON_XPGAIN"] = "Mostrar ganancias de XP estimadas para subir";

--Titan Repair
L["REPAIR_LOCALE"] = {
	pattern = "^Durabilidad (%d+) / (%d+)$",
	menu = "Reparación",
	tooltip = "Información de reparación",
	button = "Durabilidad: ",
	normal = "Coste de reparación (Neutral): ",
	friendly = "Coste de reparación (Amistoso): ",
	honored = "Coste de reparación (Honorable): ",
	revered = "Coste de reparación (Venerado): ",
	exalted = "Coste de reparación (Exaltado): ",
	buttonNormal = "Mostrar neutral",
	buttonFriendly = "Mostrar amistoso (5%)",
	buttonHonored = "Mostrar honorable (10%)",
	buttonRevered = "Mostrar venerado (15%)",
	buttonExalted = "Mostrar exaltado (20%)",
	percentage = "Mostrar como porcentaje",
	itemnames = "Mostrar nombres de objetos",
	mostdamaged = "Mostrar el más dañado",
	showdurabilityframe = "Mostrar tooltip informativo",
	undamaged = "Mostrar objetos sin dañar",
	discount = "Mostrar descuento y objetos",
	nothing = "Nada dañado",
	confirmation = "¿Quieres reparar todos los objetos equipados?",
	badmerchant = "Este comerciante no puede reparar. Mostrando entonces los costes de reparación normales.",
	popup = "Mostrar ventana emergente de reparación",
	showinventory = "Calcular daño de inventario",
	WholeScanInProgress = "Escaneando...",
	AutoReplabel = "Auto-reparar",
	AutoRepitemlabel = "Auto reparar todos los objetos",
	ShowRepairCost = "Mostrar coste de reparar",
	ignoreThrown = "Ignorar armas arrojadizas",
	ShowItems = "Mostrar objetos",
	ShowDiscounts = "Mostrar descuentos",
	ShowCosts = "Mostrar costes",
	Items = "Objetos",
	Discounts = "Descuentos",
	Costs = "Costes",
	TooltipOptions = "Tooltip",
	CostTotal = "Coste total",
	CostBag = "Coste de bolsas",
	CostEquip = "Coste del equipo",
};

L["TITAN_REPAIR"] = "Titan Repair"
L["TITAN_REPAIR_GBANK_TOTAL"] = "Efectivo en el banco de la Hermandad: "
L["TITAN_REPAIR_GBANK_WITHDRAW"] = "Retirada de efectivo de la Hermandad permitida: "
L["TITAN_REPAIR_GBANK_USEFUNDS"] = "Usar efectivo del banco de la Hermandad"
L["TITAN_REPAIR_GBANK_NOMONEY"] = "El banco de la Hermandad no puede permitirse el coste de la reparación, o no puedes retirar tanto dinero."
L["TITAN_REPAIR_GBANK_NORIGHTS"] = "O no perteneces a una Hermandad, o no tienes permiso para usar el banco de la Hermandad para reparar tus objetos."
L["TITAN_REPAIR_CANNOT_AFFORD"] = "No puedes permitirte reparar, en este momento."
L["TITAN_REPAIR_REPORT_COST_MENU"] = "Informar en el chat del coste de la reparación"
L["TITAN_REPAIR_REPORT_COST_CHAT"] = "El coste de la reparación ha sido "

--L["TITAN_PLUGINS_MENU_TITLE"] = "Plug-ins";

L["TITAN_GOLD_TOOLTIPTEXT"] = "Oro total en";
L["TITAN_GOLD_ITEMNAME"] = "Titan Gold";
L["TITAN_GOLD_CLEAR_DATA_TEXT"] = "Limpiar base de datos";
L["TITAN_GOLD_RESET_SESS_TEXT"] = "Resetear sesión actual";
L["TITAN_GOLD_DB_CLEARED"] = "Titan Gold - Base de datos limpiada.";
L["TITAN_GOLD_SESSION_RESET"] = "Titan Gold - Sesión reiniciada.";
L["TITAN_GOLD_MENU_TEXT"] = "Oro";
L["TITAN_GOLD_TOOLTIP"] = "Información de Oro";
L["TITAN_GOLD_TOGGLE_PLAYER_TEXT"] = "Mostrar oro del jugador";
L["TITAN_GOLD_TOGGLE_ALL_TEXT"] = "Mostrar oro en el servidor";
L["TITAN_GOLD_SESS_EARNED"] = "Ganado esta sesión";
L["TITAN_GOLD_PERHOUR_EARNED"] = "Ganado por hora";
L["TITAN_GOLD_SESS_LOST"] = "Perdido esta sesión";
L["TITAN_GOLD_PERHOUR_LOST"] = "Perdido por hora";
L["TITAN_GOLD_STATS_TITLE"] = "Estadisticas de esta sesión";
L["TITAN_GOLD_TTL_GOLD"] = "Oro total";
L["TITAN_GOLD_START_GOLD"] = "Oro al principio";
L["TITAN_GOLD_TOGGLE_SORT_GOLD"] = "Ordenar tabla por oro";
L["TITAN_GOLD_TOGGLE_SORT_NAME"] = "Ordenar tabla por nombre";
L["TITAN_GOLD_TOGGLE_GPH_SHOW"] = "Mostrar oro por hora";
L["TITAN_GOLD_TOGGLE_GPH_HIDE"] = "Ocultar oro por hora";
L["TITAN_GOLD_GOLD"] = "o";
L["TITAN_GOLD_SILVER"] = "p";
L["TITAN_GOLD_COPPER"] = "c";
L["TITAN_GOLD_STATUS_PLAYER_SHOW"] = "visible";
L["TITAN_GOLD_STATUS_PLAYER_HIDE"] = "oculto";
L["TITAN_GOLD_DELETE_PLAYER"] = "Eliminar personaje";
L["TITAN_GOLD_SHOW_PLAYER"] = "Mostrar personaje";
L["TITAN_GOLD_FACTION_PLAYER_ALLY"] = "Alianza";
L["TITAN_GOLD_FACTION_PLAYER_HORDE"] = "Horda";
L["TITAN_GOLD_CLEAR_DATA_WARNING"] = GREEN_FONT_COLOR_CODE.."Cuidado: "
..FONT_COLOR_CODE_CLOSE.."Esta opción purgará los datos de Titan Gold. "
.."Si deseas seguir con esta operación, pulsa 'Aceptar', de lo contrario pulsa 'Cancelar' o la tecla 'Escape'.";
L["TITAN_GOLD_COIN_NONE"] = "No mostrar etiquetas";
L["TITAN_GOLD_COIN_LABELS"] = "Mostrar etiquetas en texto";
L["TITAN_GOLD_COIN_ICONS"] = "Mostrar etiquetas en texto";
L["TITAN_GOLD_ONLY"] = "Mostrar sólo oro";
L["TITAN_GOLD_COLORS"] = "Mostrar colores en el oro";


L["TITAN_VOLUME_TOOLTIP"] = "Control de Volumen";
L["TITAN_VOLUME_MASTER_TOOLTIP_VALUE"] = "Volumen general: ";
L["TITAN_VOLUME_SOUND_TOOLTIP_VALUE"] = "Volumen de los efectos: ";
L["TITAN_VOLUME_AMBIENCE_TOOLTIP_VALUE"] = "Volumen de ambiente: ";
L["TITAN_VOLUME_MUSIC_TOOLTIP_VALUE"] = "Volumen de la música: ";
L["TITAN_VOLUME_MICROPHONE_TOOLTIP_VALUE"] = "Volumen del micrófono: ";
L["TITAN_VOLUME_SPEAKER_TOOLTIP_VALUE"] = "Volumen de los altavoces: ";
L["TITAN_VOLUME_TOOLTIP_HINT1"] = "Consejo: Click-Izq. para ajustar"
L["TITAN_VOLUME_TOOLTIP_HINT2"] = "el volumen.";
L["TITAN_VOLUME_CONTROL_TOOLTIP"] = "Volumen: ";
L["TITAN_VOLUME_CONTROL_TITLE"] = "Volumen";
L["TITAN_VOLUME_MASTER_CONTROL_TITLE"] = "General";
L["TITAN_VOLUME_SOUND_CONTROL_TITLE"] = "Efectos";
L["TITAN_VOLUME_AMBIENCE_CONTROL_TITLE"] = "Ambiente";
L["TITAN_VOLUME_MUSIC_CONTROL_TITLE"] = "Música";
L["TITAN_VOLUME_MICROPHONE_CONTROL_TITLE"] = "Micrófono";
L["TITAN_VOLUME_SPEAKER_CONTROL_TITLE"] = "Altavoz";
L["TITAN_VOLUME_CONTROL_HIGH"] = "Alto";
L["TITAN_VOLUME_CONTROL_LOW"] = "Bajo";
L["TITAN_VOLUME_MENU_TEXT"] = "Ajuste de Volumen";
L["TITAN_VOLUME_MENU_AUDIO_OPTIONS_LABEL"] = "Mostrar opciones de sonido/voz";
L["TITAN_VOLUME_MENU_OVERRIDE_BLIZZ_SETTINGS"] = "Invalida la configuración de volumen de Blizzard";
