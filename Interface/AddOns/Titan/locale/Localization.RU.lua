local L = LibStub("AceLocale-3.0"):NewLocale("Titan","ruRU")
if not L then return end

L["TITAN_PANEL"] = "Титан Панель";
L["TITAN_DEBUG"] = "<Titan>";
L["TITAN_PRINT"] = "Титан";

L["TITAN_NA"] = "N/A";
L["TITAN_SECONDS"] = "секунды";
L["TITAN_MINUTES"] = "минуты";
L["TITAN_HOURS"] = "часы";
L["TITAN_DAYS"] = "дни";
L["TITAN_SECONDS_ABBR"] = "с";
L["TITAN_MINUTES_ABBR"] = "м";
L["TITAN_HOURS_ABBR"] = "ч";
L["TITAN_DAYS_ABBR"] = "д";
L["TITAN_MILLISECOND"] = "мс";
L["TITAN_KILOBYTES_PER_SECOND"] = "КБ/с";
L["TITAN_KILOBITS_PER_SECOND"] = "кбит/с"
L["TITAN_MEGABYTE"] = "мб";
L["TITAN_NONE"] = "Нету";	
L["TITAN_USE_COMMA"] = "Use comma";
L["TITAN_USE_PERIOD"] = "Use period";

L["TITAN_PANEL_ERROR_PROF_DELCURRENT"] = "Вы не можете удалить свой текущий профиль.";
local TITAN_PANEL_WARNING = GREEN_FONT_COLOR_CODE.."Внимание : "..FONT_COLOR_CODE_CLOSE
local TITAN_PANEL_RELOAD_TEXT = "Если вы желаете продолжить данную операцию, нажмите 'Accept' (ваш UI будет перезагружен), емли нет, жмите 'Cancel' или клавишу 'Escape'."
L["TITAN_PANEL_RESET_WARNING"] = TITAN_PANEL_WARNING
	.."Данные настройки сбросять ваши панели на стандартные настройки и обновят ваш текущий профиль. "
	..TITAN_PANEL_RELOAD_TEXT
L["TITAN_PANEL_RELOAD"] = TITAN_PANEL_WARNING
	.."Это перезагрузит Titan Panel. "
	..TITAN_PANEL_RELOAD_TEXT
L["TITAN_PANEL_ATTEMPTS"] = "Подчинения"
L["TITAN_PANEL_ATTEMPTS_SHORT"] = "Подчинения"
L["TITAN_PANEL_ATTEMPTS_DESC"] = "Ниже, приведены плагины, которые зарегистрировались в Titanе.\n"
	.."Пожалуйста, любые вопросы отсылайте автору плагина."
L["TITAN_PANEL_ATTEMPTS_TYPE"] = "Тип"
L["TITAN_PANEL_ATTEMPTS_CATEGORY"] = "Категория"
L["TITAN_PANEL_ATTEMPTS_BUTTON"] = "Название кнопки"
L["TITAN_PANEL_ATTEMPTS_STATUS"] = "Статус"
L["TITAN_PANEL_ATTEMPTS_ISSUE"] = "Проблема"
L["TITAN_PANEL_ATTEMPTS_NOTES"] = "Заметки"
L["TITAN_PANEL_ATTEMPTS_TABLE"] = "Индекс"
L["TITAN_PANEL_EXTRAS"] = "Дополнения"
L["TITAN_PANEL_EXTRAS_SHORT"] = "Дополнения"
L["TITAN_PANEL_EXTRAS_DESC"] = "Есть плагины с данными конфигурации, которые в настоящее время не загружены.\n"
	.."Их можно безопасно удалить."
L["TITAN_PANEL_EXTRAS_DELETE_BUTTON"] = "Удалить данные конфигурации"
L["TITAN_PANEL_EXTRAS_DELETE_MSG"] = "запись конфигурации была удалена."
L["TITAN_PANEL_CHARS"] = "Персонажи"
L["TITAN_PANEL_CHARS_DESC"] = "Тут есть персонажы с данными настройки."
L["TITAN_PANEL_REGISTER_START"] = "Регистрация Titan плагинов..."
L["TITAN_PANEL_REGISTER_END"] = "Процесс регистрации завершен."
	
-- slash command help
L["TITAN_PANEL_SLASH_RESET_0"] = LIGHTYELLOW_FONT_COLOR_CODE.."Используйте: |cffffffff/titan {reset | reset tipfont/tipalpha/panelscale/spacing}";
L["TITAN_PANEL_SLASH_RESET_1"] = " - "..LIGHTYELLOW_FONT_COLOR_CODE.."reset: |cffffffffСбрасывает все на стандартные значения/позиции.";
L["TITAN_PANEL_SLASH_RESET_2"] = " - "..LIGHTYELLOW_FONT_COLOR_CODE.."reset tipfont: |cffffffffСбрасывает масштаб шрифта подсказки панели на стандартное значение.";
L["TITAN_PANEL_SLASH_RESET_3"] = " - "..LIGHTYELLOW_FONT_COLOR_CODE.."reset tipalpha: |cffffffffСбрасывает прозрачность подсказки панели на стандартное значение.";
L["TITAN_PANEL_SLASH_RESET_4"] = " - "..LIGHTYELLOW_FONT_COLOR_CODE.."reset panelscale: |cffffffffСбрасывает масштаб на стандартное значение.";
L["TITAN_PANEL_SLASH_RESET_5"] = " - "..LIGHTYELLOW_FONT_COLOR_CODE.."reset spacing: |cffffffffСбрасывает расстояние кнопок  на стандартное значение.";
L["TITAN_PANEL_SLASH_GUI_0"] = LIGHTYELLOW_FONT_COLOR_CODE.."Используйте: |cffffffff/titan {gui control/trans/skin}";
L["TITAN_PANEL_SLASH_GUI_1"] = " - "..LIGHTYELLOW_FONT_COLOR_CODE.."gui control: |cffffffffОткрывает интерфейс контроля панели.";
L["TITAN_PANEL_SLASH_GUI_2"] = " - "..LIGHTYELLOW_FONT_COLOR_CODE.."gui trans: |cffffffffОткрывает интерфейс контроля прозрачности.";
L["TITAN_PANEL_SLASH_GUI_3"] = " - "..LIGHTYELLOW_FONT_COLOR_CODE.."gui skin: |cffffffffОткрывает интерфейс контроля шкурок.";
L["TITAN_PANEL_SLASH_PROFILE_0"] = LIGHTYELLOW_FONT_COLOR_CODE.."Используйте: |cffffffff/titan {исп. профиль <profile>}";
L["TITAN_PANEL_SLASH_PROFILE_1"] = " - "..LIGHTYELLOW_FONT_COLOR_CODE.."исп. профиля <имя> <сервер>: |cffffffffУстанавливает используемые плагины в сохраненный профиль.";
L["TITAN_PANEL_SLASH_PROFILE_2"] = " - "..LIGHTYELLOW_FONT_COLOR_CODE.."<имя>: |cffffffffможет быть задано имя персонажа или название пользовательского профиля."
L["TITAN_PANEL_SLASH_PROFILE_3"] = " - "..LIGHTYELLOW_FONT_COLOR_CODE.."<сервер>: |cffffffffможет быть задано название сервера или 'TitanCustomProfile'."
L["TITAN_PANEL_SLASH_HELP_0"] = LIGHTYELLOW_FONT_COLOR_CODE.."Используйте: |cffffffff/titan {help | help <topic>}";
L["TITAN_PANEL_SLASH_HELP_1"] = " - "..LIGHTYELLOW_FONT_COLOR_CODE.."<topic>: reset/gui/profile/help ";
L["TITAN_PANEL_SLASH_ALL_0"] = LIGHTYELLOW_FONT_COLOR_CODE.."Используйте: |cffffffff/titan <topic>";
L["TITAN_PANEL_SLASH_ALL_1"] = " - "..LIGHTYELLOW_FONT_COLOR_CODE.."<topic>: |cffffffffreset/gui/profile/help ";
    
-- slash command responses
L["TITAN_PANEL_SLASH_RESP1"] = LIGHTYELLOW_FONT_COLOR_CODE.."Масштаб шрифта подсказки Titan Panel сброшен.";
L["TITAN_PANEL_SLASH_RESP2"] = LIGHTYELLOW_FONT_COLOR_CODE.."Прозрачность шрифта подсказки Titan Panel сброшена.";
L["TITAN_PANEL_SLASH_RESP3"] = LIGHTYELLOW_FONT_COLOR_CODE.."Масштаб Titan Panel сброшен.";
L["TITAN_PANEL_SLASH_RESP4"] = LIGHTYELLOW_FONT_COLOR_CODE.."Расстояние кнопок Titan Panel сброшено.";
     
-- global profile locale
L["TITAN_PANEL_GLOBAL"] = "Основной";     
L["TITAN_PANEL_GLOBAL_PROFILE"] = "Основной профиль";     
L["TITAN_PANEL_GLOBAL_USE"] = "Исп. основной профиль";     
L["TITAN_PANEL_GLOBAL_USE_AS"] = "Исп. как основной профиль";     
L["TITAN_PANEL_GLOBAL_USE_DESC"] = "Использовать основной профиль для всех персонажей";     
L["TITAN_PANEL_GLOBAL_RESET_PART"] = "перенастройка опций";     
L["TITAN_PANEL_GLOBAL_ERR_1"] = "Вы не можете загрузить профиль, когда используется основной профиль";
	
-- general panel locale
L["TITAN_PANEL_VERSION_INFO"] = "|cffffd700 от |cffff8c00Titan Development Team";
L["TITAN_PANEL_MENU_TITLE"] = "Титан панель";
L["TITAN_PANEL_MENU_HIDE"] = "Скрыть";
L["TITAN_PANEL_MENU_IN_COMBAT_LOCKDOWN"] = "(В Бою)";
L["TITAN_PANEL_MENU_RELOADUI"] = "(Перезагрузить ПИ)";
L["TITAN_PANEL_MENU_SHOW_COLORED_TEXT"] = "Показывать цветной текст";
L["TITAN_PANEL_MENU_SHOW_ICON"] = "Показывать иконку";
L["TITAN_PANEL_MENU_SHOW_LABEL_TEXT"] = "Текст ярлыка";
L["TITAN_PANEL_MENU_AUTOHIDE"] = "Авто-скрытие";
L["TITAN_PANEL_MENU_CENTER_TEXT"] = "Текст в центре";
L["TITAN_PANEL_MENU_DISPLAY_BAR"] = "Показать панель";
L["TITAN_PANEL_MENU_DISABLE_PUSH"] = "Выключить подстройку экрана";
L["TITAN_PANEL_MENU_DISABLE_MINIMAP_PUSH"] = "Отключить подстройку мини-карты";
L["TITAN_PANEL_MENU_DISABLE_LOGS"] = "Авто подстройка журнала";
L["TITAN_PANEL_MENU_DISABLE_BAGS"] = "Авто подстройка сумок";
L["TITAN_PANEL_MENU_DISABLE_TICKET"] = "Авто подстройка  запросов";
L["TITAN_PANEL_MENU_PROFILES"] = "Профиля";
L["TITAN_PANEL_MENU_PROFILE"] = "Профиль ";
L["TITAN_PANEL_MENU_PROFILE_CUSTOM"] = "Выборочный";
L["TITAN_PANEL_MENU_PROFILE_DELETED"] = " удален.";
L["TITAN_PANEL_MENU_PROFILE_SERVERS"] = "Сервер";
L["TITAN_PANEL_MENU_PROFILE_CHARS"] = "Персонаж";
L["TITAN_PANEL_MENU_PROFILE_RELOADUI"] = "Ваш UI будет перезагружен после нажатия 'Okay' для сохранения вашего профиля.";
L["TITAN_PANEL_MENU_PROFILE_SAVE_CUSTOM_TITLE"] = "Введите имя вашего профиля:\n(Макс 20 букв, пропуск недопустим)";
L["TITAN_PANEL_MENU_PROFILE_SAVE_PENDING"] = "Настройки текущей панели будут сохранены под названием профиля: ";
L["TITAN_PANEL_MENU_PROFILE_ALREADY_EXISTS"] = "Введенное имя профиля уже существует. Пожалуйста введите уникальное имя.";
L["TITAN_PANEL_MENU_MANAGE_SETTINGS"] = "Управление";
L["TITAN_PANEL_MENU_LOAD_SETTINGS"] = "Загрузить настройки";
L["TITAN_PANEL_MENU_DELETE_SETTINGS"] = "Удалить";
L["TITAN_PANEL_MENU_SAVE_SETTINGS"] = "Сохранить";
L["TITAN_PANEL_MENU_CONFIGURATION"] = "Конфигурация";
L["TITAN_PANEL_OPTIONS"] = "Опции";
L["TITAN_PANEL_MENU_TOP"] = "Верх"
L["TITAN_PANEL_MENU_TOP2"] = "Верх 2"
L["TITAN_PANEL_MENU_BOTTOM"] = "Низ"
L["TITAN_PANEL_MENU_BOTTOM2"] = "Низ 2"
L["TITAN_PANEL_MENU_OPTIONS"] = "Подсказки и фреймы Титан панели";
L["TITAN_PANEL_MENU_OPTIONS_SHORT"] = "Подсказки и фреймы";
L["TITAN_PANEL_MENU_TOP_BARS"] = "Верхняя панель"
L["TITAN_PANEL_MENU_BOTTOM_BARS"] = "Нижняя панель"
L["TITAN_PANEL_MENU_OPTIONS_BARS"] = "Панели";
L["TITAN_PANEL_MENU_OPTIONS_MAIN_BARS"] = "Панели Титана";
L["TITAN_PANEL_MENU_OPTIONS_AUX_BARS"] = "Дополнительные панели";
L["TITAN_PANEL_MENU_OPTIONS_TOOLTIPS"] = "Подсказки";
L["TITAN_PANEL_MENU_OPTIONS_FRAMES"] = "Фреймы";
L["TITAN_PANEL_MENU_PLUGINS"] = "Плагины";
L["TITAN_PANEL_MENU_LOCK_BUTTONS"] = "Блокировать кнопки";
L["TITAN_PANEL_MENU_VERSION_SHOWN"] = "Показывать версии плагинов";
L["TITAN_PANEL_MENU_LDB_SIDE"] = "Плагин справа";
L["TITAN_PANEL_MENU_LDB_FORCE_LAUNCHER"] = "Направить модули запусков в правую сторону";
L["TITAN_PANEL_MENU_CATEGORIES"] = {"Сборки титана","Общее","Бой","Информация","Интерфейс","Профессия"}
L["TITAN_PANEL_MENU_TOOLTIPS_SHOWN"] = "Показывать подсказки";
L["TITAN_PANEL_MENU_TOOLTIPS_SHOWN_IN_COMBAT"] = "Скрыть подсказки в бою";
L["TITAN_PANEL_MENU_AUTOHIDE_IN_COMBAT"] = "Закрепить авто-скрытие в бою";
L["TITAN_PANEL_MENU_RESET"] = "Сброс панели на стандарт";
L["TITAN_PANEL_MENU_TEXTURE_SETTINGS"] = "Настройки шкурки";	
L["TITAN_PANEL_MENU_LSM_FONTS"] = "Шрифт панели"
L["TITAN_PANEL_MENU_ENABLED"] = "Включен";
L["TITAN_PANEL_MENU_DISABLED"] = "Отключен";
L["TITAN_PANEL_SHIFT_LEFT"] = "Сдвиг в лева";
L["TITAN_PANEL_SHIFT_RIGHT"] = "Сдвиг в права";
L["TITAN_PANEL_MENU_SHOW_PLUGIN_TEXT"] = "Показать текст плагина";
L["TITAN_PANEL_MENU_BAR_ALWAYS"] = "Всегда вкл";
L["TITAN_PANEL_MENU_POSITION"] = "Позиция";
L["TITAN_PANEL_MENU_BAR"] = "Панель";
L["TITAN_PANEL_MENU_DISPLAY_ON_BAR"] = "Показать на панели";
L["TITAN_PANEL_MENU_SHOW"] = "Показать плагин";
L["TITAN_PANEL_MENU_PLUGIN_RESET"] = "Обновить плагины";
L["TITAN_PANEL_MENU_PLUGIN_RESET_DESC"] = "Обновить позицию и текст плагинов";
	
-- localization strings for AceConfigDialog-3.0
L["TITAN_ABOUT_VERSION"] = "Версия";
L["TITAN_ABOUT_AUTHOR"] = "Автор";
L["TITAN_ABOUT_CREDITS"] = "Исполнители";
L["TITAN_ABOUT_CATEGORY"] = "Категория";
L["TITAN_ABOUT_EMAIL"] = "Email";
L["TITAN_ABOUT_WEB"] = "Сайт";
L["TITAN_ABOUT_LICENSE"] = "Лицензия";     
L["TITAN_PANEL_CONFIG_MAIN_LABEL"] = "Аддон отображения полосы информации. Позволяет пользователям добавлять вывод данных или плагины модуля запуска на верхнюю панель или нижнюю.";			 
L["TITAN_TRANS_MENU_TEXT"] = "Прозрачность";
L["TITAN_TRANS_MENU_TEXT_SHORT"] = "Прозрачность";
L["TITAN_TRANS_MENU_DESC"] = "Регулировка прозрачности панели Титана и подсказок.";
L["TITAN_TRANS_MAIN_CONTROL_TITLE"] = "Главная панель";
L["TITAN_TRANS_AUX_CONTROL_TITLE"] = "Дополнительная панель";
L["TITAN_TRANS_CONTROL_TITLE_TOOLTIP"] = "Подсказка";
L["TITAN_TRANS_TOOLTIP_DESC"] = "Регулировка прозрачности подсказки различных плагинов.";
L["TITAN_UISCALE_MENU_TEXT"] = "Масштаб и шрифт";
L["TITAN_UISCALE_MENU_TEXT_SHORT"] = "Масштаб и шрифт";
L["TITAN_UISCALE_CONTROL_TITLE_UI"] = "Размер интерфейса";
L["TITAN_UISCALE_CONTROL_TITLE_PANEL"] = "Размер панели";
L["TITAN_UISCALE_CONTROL_TITLE_BUTTON"] = "Промежуток кнопок";
L["TITAN_UISCALE_CONTROL_TITLE_ICON"] = "Промежуток иконок";
L["TITAN_UISCALE_CONTROL_TOOLTIP_TOOLTIPFONT"] = "Размер шрифта подсказок";
L["TITAN_UISCALE_TOOLTIP_DISABLE_TEXT"] = "Отключить масштабирование шрифта подсказок";
L["TITAN_UISCALE_MENU_DESC"] = "Управление различными аспектами панели и интерфейса.";
L["TITAN_UISCALE_SLIDER_DESC"] = "Регулировка масштаба вашего интерфейса.";
L["TITAN_UISCALE_PANEL_SLIDER_DESC"] = "Регулировка масштаба различных кнопок и иконок панели.";
L["TITAN_UISCALE_BUTTON_SLIDER_DESC"] = "Регулировка пространства между плагинами с левой стороны.";
L["TITAN_UISCALE_ICON_SLIDER_DESC"] = "Регулировка пространства между плагинами с правой стороны  стороне плагинов.Adjusts the space between right-side plugins.";
L["TITAN_UISCALE_TOOLTIP_SLIDER_DESC"] = "Регулировка размера подсказки различных плагинов.";
L["TITAN_UISCALE_DISABLE_TOOLTIP_DESC"] = "Отключить контроль масштабирования шрифта подсказок Титана.";

L["TITAN_SKINS_TITLE"] = "Шкурки";
L["TITAN_SKINS_OPTIONS_CUSTOM"] = "Шкурки - Свои";
L["TITAN_SKINS_TITLE_CUSTOM"] = "Свои шкурки";
L["TITAN_SKINS_MAIN_DESC"] = "Все пользовательские шкурки находятся в: \n"
			.."..\\AddOns\\Titan\\Artwork\\Custom\\<Skin Folder>\\ ".."\n"
			.."\nшкурки Титана и пользовательские, хранятся в папке Custom."
L["TITAN_SKINS_LIST_TITLE"] = "Список шкурок";
L["TITAN_SKINS_SET_DESC"] = "Выберите шкурку для панелей Титана.";
L["TITAN_SKINS_SET_HEADER"] = "Установить шкурку панели";
L["TITAN_SKINS_RESET_HEADER"] = "Сброс шкурки Титан панели";
L["TITAN_SKINS_NEW_HEADER"] = "Добавить новую шкурку";
L["TITAN_SKINS_NAME_TITLE"] = "Название шкурки";
L["TITAN_SKINS_NAME_DESC"] = "Введите название вашей новой шкурки.";
L["TITAN_SKINS_PATH_TITLE"] = "Путь к шкурке";
L["TITAN_SKINS_PATH_DESC"] = "Введите точный путь к месту где расположены рисунки вашей шкурки, как показано в примере и в объяснении 'Совет'.";
L["TITAN_SKINS_ADD_HEADER"] = "Добавить шкурку";
L["TITAN_SKINS_ADD_DESC"] = "Добавить новую шкурку, в список доступных шкурок панели.";
L["TITAN_SKINS_REMOVE_HEADER"] = "Удалить шкурку";
L["TITAN_SKINS_REMOVE_DESC"] = "Выберите шкурку для удаления, из доступных шкурок панели.";
L["TITAN_SKINS_REMOVE_BUTTON"] = "Удалить";
L["TITAN_SKINS_REMOVE_BUTTON_DESC"] = "Удалить выбранную шкурку, из списка доступных шкурок панели.";
L["TITAN_SKINS_REMOVE_NOTES"] = "Вы несете ответственность за удаление любых нежелательных шкурок "
	.."из корневой папки Титан Панели. Аддон не может добавлять или удалять файлы."
L["TITAN_SKINS_RESET_DEFAULTS_TITLE"] = "Сброс на стандартные значения";
L["TITAN_SKINS_RESET_DEFAULTS_DESC"] = "Сбросить список шкурок на стандартное значение.";
L["TITAN_PANEL_MENU_LSM_FONTS_DESC"] = "Выберите тип шрифтов для различных плагинов на Титан панеле.";
L["TITAN_PANEL_MENU_FONT_SIZE"] = "Размер шрифта";
L["TITAN_PANEL_MENU_FONT_SIZE_DESC"] = "Установка размера шрифта панели.";
L["TITAN_PANEL_MENU_FRAME_STRATA"] = "Слои фрейма панели";
L["TITAN_PANEL_MENU_FRAME_STRATA_DESC"] = "Регулировка слоя фрейма панелей Титана.";
-- /end localization strings for AceConfigDialog-3.0

L["TITAN_PANEL_MENU_ADV"] = "Дополнительно";
L["TITAN_PANEL_MENU_ADV_DESC"] = "Изменить таймеры, только если у вас возникли проблемы с подстройкой фреймов.".."\n";
L["TITAN_PANEL_MENU_ADV_PEW"] = "Вход в мир";
L["TITAN_PANEL_MENU_ADV_PEW_DESC"] = "Изменить значение (обычно повысить) если фреймы не подстраиваются при входе / выходе в мир или подземелье.";
L["TITAN_PANEL_MENU_ADV_VEHICLE"] = "Транспорт";
L["TITAN_PANEL_MENU_ADV_VEHICLE_DESC"] = "Изменить значение (обычно повысить) если фреймы не подстраиваются при входе / выходе из транспорта.";	
	
L["TITAN_AUTOHIDE_TOOLTIP"] = "Авто-скрытие панели вкл/выкл";
	
L["TITAN_BAG_FORMAT"] = "%d/%d";
L["TITAN_BAG_BUTTON_LABEL"] = "Сумки: ";
L["TITAN_BAG_TOOLTIP"] = "Использование сумок";
L["TITAN_BAG_TOOLTIP_HINTS"] = "ЛКМ -открыть все сумки";
L["TITAN_BAG_MENU_TEXT"] = "Сумки";
L["TITAN_BAG_USED_SLOTS"] = "Используемые слоты";
L["TITAN_BAG_FREE_SLOTS"] = "Свободные слоты";
L["TITAN_BAG_BACKPACK"] = "Рюкзак";
L["TITAN_BAG_MENU_SHOW_USED_SLOTS"] = "Показывать исп. сумки";
L["TITAN_BAG_MENU_SHOW_AVAILABLE_SLOTS"] = "Показывать доступные слоты";
L["TITAN_BAG_MENU_SHOW_DETAILED"] = "Отображать подробную подсказку";
L["TITAN_BAG_MENU_IGNORE_SLOTS"] = "Игнорировать сумки";
L["TITAN_BAG_MENU_IGNORE_PROF_BAGS_SLOTS"] = "Игнорировать сумки для профф";
L["TITAN_BAG_PROF_BAG_NAMES"] = {
-- Enchanting
"Зачарованный мешочек из магической ткани", "Зачарованная сумка из рунической ткани", "Сумка зачаровывателя", "Большая зачарованная сумка", "Сумка из огненной чароткани", "Таинственная котомка",
"Трансцендентная сумка", "\"Дилижанс - Эксклюзив\" - очаровательный коктейльный ридикюль",
-- Engineering
"Тяжелый ящик с инструментами", "Ящик для инструментов из оскверненного железа", "Титановый ящик с инструментами", "Кориевый ящик с инструментами",  "\"Дилижанс - Мэдди\" - высокотехнологичная сумка",
-- Herbalism
"Мешочек для трав", "Кенарийская сумка для трав", "Сумка Кенария", "Ботаническая сумка Микаа", "Изумрудный вьюк", "Сумка хиджальской экспедиции",
"\"Дилижанс - Зеленые\" - сумка для перевозки трав",
-- Inscription
"Сумка начертателя", "Рюкзак с бесчисленными карманами", "\"Дилижанс - Ксандера\" - школьный рюкзак",
-- Jewelcrafting
"Мешочек для самоцветов", "Мешочек для драгоценностей", "\"Дилижанс - Эксклюзив\" - украшенный самоцветами клатч",
-- Leatherworking
"Сумка кожевника", "Сумка множества шкур", "Походная сума зверолова", "\"Дилижанс - Мия\" - кожаная сумка",
-- Mining
"Шахтерский мешок", "Укрепленная шахтерская сумка", "Шахтерская сумка из шкуры мамонта", "\"Дилижанс - Кристина\" - дорогостоящая металлическая сумка",
-- fishing
"Ящик для рыболовной снасти мастера приманки",
};
	
L["TITAN_CLOCK_TOOLTIP"] = "Часы";
L["TITAN_CLOCK_TOOLTIP_VALUE"] = "Часовое смещение: ";
L["TITAN_CLOCK_TOOLTIP_LOCAL_TIME"] = "Местное время: ";
L["TITAN_CLOCK_TOOLTIP_SERVER_TIME"] = "Серверное время: ";
L["TITAN_CLOCK_TOOLTIP_SERVER_ADJUSTED_TIME"] = "Заданное серверное время: ";
L["TITAN_CLOCK_TOOLTIP_HINT1"] = "ЛКМ для настройки разницы с ОФФ"
L["TITAN_CLOCK_TOOLTIP_HINT2"] = "12/24 ч формат";
L["TITAN_CLOCK_TOOLTIP_HINT3"] = "[Shift Левый-Клик] открывает календарь.";
L["TITAN_CLOCK_CONTROL_TOOLTIP"] = "Часовое смещение: ";
L["TITAN_CLOCK_CONTROL_TITLE"] = "Смещение";
L["TITAN_CLOCK_CONTROL_HIGH"] = "+12";
L["TITAN_CLOCK_CONTROL_LOW"] = "-12";
L["TITAN_CLOCK_CHECKBUTTON"] = "Фрмт 24ч";
L["TITAN_CLOCK_CHECKBUTTON_TOOLTIP"] = "Переключение между отображением времени в 12-часовым и 24-часовым форматом";
L["TITAN_CLOCK_MENU_TEXT"] = "Часы";
L["TITAN_CLOCK_MENU_LOCAL_TIME"] = "Отображать местное время(М)";
L["TITAN_CLOCK_MENU_SERVER_TIME"] = "Отображать серверное время (С)";
L["TITAN_CLOCK_MENU_SERVER_ADJUSTED_TIME"] = "Отображать заданное серверное время (З)";
L["TITAN_CLOCK_MENU_DISPLAY_ON_RIGHT_SIDE"] = "Отображать часы справа";
L["TITAN_CLOCK_MENU_HIDE_GAMETIME"] = "Скрыть кнопку времени/календаря";
L["TITAN_CLOCK_MENU_HIDE_MAPTIME"] = "Скрыть кнопку времени";
L["TITAN_CLOCK_MENU_HIDE_CALENDAR"] = "Скрыть кнопку календаря";

	
L["TITAN_COORDS_FORMAT"] = "(%.d, %.d)";
L["TITAN_COORDS_FORMAT2"] = "(%.1f, %.1f)";
L["TITAN_COORDS_FORMAT3"] = "(%.2f, %.2f)";
L["TITAN_COORDS_FORMAT_LABEL"] = "(xx , yy)";
L["TITAN_COORDS_FORMAT2_LABEL"] = "(xx.x , yy.y)";
L["TITAN_COORDS_FORMAT3_LABEL"] = "(xx.xx , yy.yy)";
L["TITAN_COORDS_FORMAT_COORD_LABEL"] = "Формат координат";
L["TITAN_COORDS_BUTTON_LABEL"] = "Место: ";
L["TITAN_COORDS_TOOLTIP"] = "Информация о локации";
L["TITAN_COORDS_TOOLTIP_HINTS_1"] = "Shift + ЛКМ для добавления локации";
L["TITAN_COORDS_TOOLTIP_HINTS_2"] = "Информации в чат";
L["TITAN_COORDS_TOOLTIP_ZONE"] = "Зона: ";
L["TITAN_COORDS_TOOLTIP_SUBZONE"] = "Подзона: ";
L["TITAN_COORDS_TOOLTIP_PVPINFO"] = "PVP инфо: ";
L["TITAN_COORDS_TOOLTIP_HOMELOCATION"] = "Место дома";
L["TITAN_COORDS_TOOLTIP_INN"] = "Дом: ";
L["TITAN_COORDS_MENU_TEXT"] = "Координаты";
L["TITAN_COORDS_MENU_SHOW_ZONE_ON_PANEL_TEXT"] = "Показывать зону";
L["TITAN_COORDS_MENU_SHOW_COORDS_ON_MAP_TEXT"] = "Показывать координаты на мировой карте";
L["TITAN_COORDS_MAP_CURSOR_COORDS_TEXT"] = "Курсор(X,Y): %s";
L["TITAN_COORDS_MAP_PLAYER_COORDS_TEXT"] = "Игрок(X,Y): %s";
L["TITAN_COORDS_NO_COORDS"] = "Нет координат";
L["TITAN_COORDS_MENU_SHOW_LOC_ON_MINIMAP_TEXT"] = "Показывать местонахождения на мини-карте";
L["TITAN_COORDS_MENU_UPDATE_WORLD_MAP"] = "Обновить карту мира при смене зоны";
	
L["TITAN_FPS_FORMAT"] = "%.1f";
L["TITAN_FPS_BUTTON_LABEL"] = "FPS: ";
L["TITAN_FPS_MENU_TEXT"] = "FPS";
L["TITAN_FPS_TOOLTIP_CURRENT_FPS"] = "Текущий FPS: ";
L["TITAN_FPS_TOOLTIP_AVG_FPS"] = "Средний FPS: ";
L["TITAN_FPS_TOOLTIP_MIN_FPS"] = "Мин. FPS: ";
L["TITAN_FPS_TOOLTIP_MAX_FPS"] = "Макс. FPS: ";
L["TITAN_FPS_TOOLTIP"] = "Кадров в секунду";
	
L["TITAN_LATENCY_FORMAT"] = "%d".."мс";
L["TITAN_LATENCY_BANDWIDTH_FORMAT"] = "%.3f ".."КБ/с";
L["TITAN_LATENCY_BUTTON_LABEL"] = "Задержка: ";
L["TITAN_LATENCY_TOOLTIP"] = "Статус сети";
L["TITAN_LATENCY_TOOLTIP_LATENCY_HOME"] = "Задержка мира (дом): ";
L["TITAN_LATENCY_TOOLTIP_LATENCY_WORLD"] = "Задержка игры (мир): ";
L["TITAN_LATENCY_TOOLTIP_BANDWIDTH_IN"] = "Вход пропуск.способность: ";
L["TITAN_LATENCY_TOOLTIP_BANDWIDTH_OUT"] = "Выход пропуск.способность: ";
L["TITAN_LATENCY_MENU_TEXT"] = "Задержка";
	
L["TITAN_LOOTTYPE_BUTTON_LABEL"] = "Обыск: ";
L["TITAN_LOOTTYPE_FREE_FOR_ALL"] = "Каждый за себя";
L["TITAN_LOOTTYPE_ROUND_ROBIN"] = "По очереди";
L["TITAN_LOOTTYPE_MASTER_LOOTER"] = "Ответственный за добычу";
L["TITAN_LOOTTYPE_GROUP_LOOT"] = "Групповая очередь";
L["TITAN_LOOTTYPE_NEED_BEFORE_GREED"] = "Приоритет по нужности";
L["TITAN_LOOTTYPE_TOOLTIP"] = "Информация о типе добычи";
L["TITAN_LOOTTYPE_MENU_TEXT"] = "Тип добычи";
L["TITAN_LOOTTYPE_RANDOM_ROLL_LABEL"] = "Случайный бросок костей";
L["TITAN_LOOTTYPE_TOOLTIP_HINT1"] = "Совет: ЛКМ для броска костей.";
L["TITAN_LOOTTYPE_TOOLTIP_HINT2"] = "Совет: ПКМ для выбора типа броска костей из меню.";
L["TITAN_LOOTTYPE_DUNGEONDIFF_LABEL"] = "Сложность подземелья";
L["TITAN_LOOTTYPE_DUNGEONDIFF_LABEL2"] = "Сложность рейда";
L["TITAN_LOOTTYPE_SHOWDUNGEONDIFF_LABEL"] = "Сложность рейда/подземелья";
L["TITAN_LOOTTYPE_SETDUNGEONDIFF_LABEL"] = "Установить сложность подземелья";
L["TITAN_LOOTTYPE_SETRAIDDIFF_LABEL"] = "Установить сложность рейда";
L["TITAN_LOOTTYPE_AUTODIFF_LABEL"] = "Авто (пологаясь на группу)";
	
L["TITAN_MEMORY_FORMAT"] = "%.3f".."мб";
L["TITAN_MEMORY_FORMAT_KB"] = "%d".."KB";
L["TITAN_MEMORY_RATE_FORMAT"] = "%.3f".."КБ/с";
L["TITAN_MEMORY_BUTTON_LABEL"] = "Память: ";
L["TITAN_MEMORY_TOOLTIP"] = "Использование памяти";
L["TITAN_MEMORY_TOOLTIP_CURRENT_MEMORY"] = "Текущая: ";
L["TITAN_MEMORY_TOOLTIP_INITIAL_MEMORY"] = "Исходная: ";
L["TITAN_MEMORY_TOOLTIP_INCREASING_RATE"] = "Темп прироста: ";
L["TITAN_MEMORY_KBMB_LABEL"] = "KB/MB"; 	
	
L["TITAN_MONEY_FORMAT"] = "%d".."з"..", %02d".."с"..", %02d".."м";
	
L["TITAN_PERFORMANCE_TOOLTIP"] = "Производительность";
L["TITAN_PERFORMANCE_MENU_TEXT"] = "Производительность";
L["TITAN_PERFORMANCE_ADDONS"] = "Аддоны используют";
L["TITAN_PERFORMANCE_ADDON_MEM_USAGE_LABEL"] = "Использование памети аддонами";
L["TITAN_PERFORMANCE_ADDON_MEM_FORMAT_LABEL"] = "Формат памяти аддонов";
L["TITAN_PERFORMANCE_ADDON_CPU_USAGE_LABEL"] = "Загрузка ЦПУ аддонами";
L["TITAN_PERFORMANCE_ADDON_NAME_LABEL"] = "Имя:";
L["TITAN_PERFORMANCE_ADDON_USAGE_LABEL"] = "Испл";
L["TITAN_PERFORMANCE_ADDON_RATE_LABEL"] = "Скорость";
L["TITAN_PERFORMANCE_ADDON_TOTAL_MEM_USAGE_LABEL"] = "Используется памяти аддонами:";
L["TITAN_PERFORMANCE_ADDON_TOTAL_CPU_USAGE_LABEL"] = "Использование CPU:";
L["TITAN_PERFORMANCE_MENU_SHOW_FPS"] = "Показывать FPS";
L["TITAN_PERFORMANCE_MENU_SHOW_LATENCY"] = "Показывать задержку мира";
L["TITAN_PERFORMANCE_MENU_SHOW_LATENCY_WORLD"] = "Показывать задержку игры";
L["TITAN_PERFORMANCE_MENU_SHOW_MEMORY"] = "Показывать память";
L["TITAN_PERFORMANCE_MENU_SHOW_ADDONS"] = "Используемая память аддонами";
L["TITAN_PERFORMANCE_MENU_SHOW_ADDON_RATE"] = "Показ размер исп. аддонами";
L["TITAN_PERFORMANCE_MENU_CPUPROF_LABEL"] = "Режим анализа ЦПУ";
L["TITAN_PERFORMANCE_MENU_CPUPROF_LABEL_ON"] = "Включить режим анализа ЦПУ ";
L["TITAN_PERFORMANCE_MENU_CPUPROF_LABEL_OFF"] = "Отключить режим анализа ЦПУ ";
L["TITAN_PERFORMANCE_CONTROL_TOOLTIP"] = "Мониторинг Аддонов: ";
L["TITAN_PERFORMANCE_CONTROL_TITLE"] = "Мониторинг Аддонов";
L["TITAN_PERFORMANCE_CONTROL_HIGH"] = "40";
L["TITAN_PERFORMANCE_CONTROL_LOW"] = "1";
L["TITAN_PERFORMANCE_TOOLTIP_HINT"] = "Совет: Для сжатия/очистки памяти нажмите ЛКМ.";
	
L["TITAN_XP_FORMAT"] = "%s";
L["TITAN_XP_PERCENT_FORMAT"] = "(%.1f%%)";
L["TITAN_XP_BUTTON_LABEL_XPHR_LEVEL"] = "ОПТ/ч на этом уровне: ";
L["TITAN_XP_BUTTON_LABEL_XPHR_SESSION"] = "ОПТ/ч за эту сессию: ";
L["TITAN_XP_BUTTON_LABEL_TOLEVEL_TIME_LEVEL"] = "Время до уровня: ";
L["TITAN_XP_LEVEL_COMPLETE"] = "Завершение уровня: ";
L["TITAN_XP_TOTAL_RESTED"] = "Отдых: ";
L["TITAN_XP_XPTOLEVELUP"] = "Опыта до поднятия урв: ";
L["TITAN_XP_TOOLTIP"] = "Информация о опыте";
L["TITAN_XP_TOOLTIP_TOTAL_TIME"] = "Всего времени сыграно: ";
L["TITAN_XP_TOOLTIP_LEVEL_TIME"] = "Время игры на этом уровне: ";
L["TITAN_XP_TOOLTIP_SESSION_TIME"] = "Время сыграно за эту сессию: ";
L["TITAN_XP_TOOLTIP_TOTAL_XP"] = "Всего Опыта на этот уровень: ";
L["TITAN_XP_TOOLTIP_LEVEL_XP"] = "Опыта получено на этом уровне: ";
L["TITAN_XP_TOOLTIP_TOLEVEL_XP"] = "Опыта нужно для уровня: ";
L["TITAN_XP_TOOLTIP_SESSION_XP"] = "Опыта получено за эту сессию: ";
L["TITAN_XP_TOOLTIP_XPHR_LEVEL"] = "Опыт/ч на этом уровне: ";
L["TITAN_XP_TOOLTIP_XPHR_SESSION"] = "Опыт/ч за эту сессию: ";
L["TITAN_XP_TOOLTIP_TOLEVEL_LEVEL"] = "Время до уровня (темп уровня): ";
L["TITAN_XP_TOOLTIP_TOLEVEL_SESSION"] = "Время до уровня (темп сессии): ";
L["TITAN_XP_MENU_TEXT"] = "Опыт";
L["TITAN_XP_MENU_SHOW_XPHR_THIS_LEVEL"] = "Показывать Опыт/ч на этом уровне";
L["TITAN_XP_MENU_SHOW_XPHR_THIS_SESSION"] = "Показывать Опыт/ч за эту сессию";
L["TITAN_XP_MENU_SHOW_RESTED_TOLEVELUP"] = "Вид мульти-инфо";
L["TITAN_XP_MENU_SIMPLE_BUTTON_TITLE"] = "Кнопка";
L["TITAN_XP_MENU_SIMPLE_BUTTON_RESTED"] = "Показ опыта за отдых";
L["TITAN_XP_MENU_SIMPLE_BUTTON_TOLEVELUP"] = "Показ опыта до уровня";
L["TITAN_XP_MENU_SIMPLE_BUTTON_KILLS"] = "Показ прим.убийств до уровня";
L["TITAN_XP_MENU_RESET_SESSION"] = "Сбросить сессию";
L["TITAN_XP_MENU_REFRESH_PLAYED"] = "Обновить таймеры";
L["TITAN_XP_UPDATE_PENDING"] = "Обновляется...";
L["TITAN_XP_KILLS_LABEL"] = "Убийств до уровня (%s опыта полученно): ";
L["TITAN_XP_KILLS_LABEL_SHORT"] = "Оц. убийств: ";
L["TITAN_XP_BUTTON_LABEL_SESSION_TIME"] = "Время сеанса: ";
L["TITAN_XP_MENU_SHOW_SESSION_TIME"] = "Показать время сеанса";
L["TITAN_XP_GAIN_PATTERN"] = "(.*) погибает, вы получаете (%d+) |4очко:очка:очков; опыта.";
L["TITAN_XP_XPGAINS_LABEL_SHORT"] = "Получение опыта: ";
L["TITAN_XP_XPGAINS_LABEL"] = "Опыта до уровня (%s опыта в последний раз): ";
L["TITAN_XP_MENU_SIMPLE_BUTTON_XPGAIN"] = "Показать необходимый опыт до уровня";
	
     --Titan Repair
     L["REPAIR_LOCALE"] = {
          pattern = "^Прочность: (%d+) / (%d+)$",
          menu = "Ремонт",
          tooltip = "Информация о прочности амуниции",
          button = "Прочность: ",
          normal = "Стоимость ремонта (Стандарт): ",
          friendly = "Стоимость ремонта (Дружелюбие): ",
          honored = "Стоимость ремонта (Уважение): ",
          revered = "Стоимость ремонта (Почтение): ",
          exalted = "Стоимость ремонта (Превознесение): ",
          buttonNormal = "Показать обычное",
          buttonFriendly = "Показать Дружелюбие (5%)",
          buttonHonored = "Показать Уважение (10%)",
          buttonRevered = "Показать Почтение (15%)",
          buttonExalted = "Показать Превознесение (20%)",
          percentage = "Показывать в процентах",
          itemnames = "Показывать название предмета",
          mostdamaged = "Показывать наибольше повреждённую",
          showdurabilityframe = "Показывать фрейм прочности",
          undamaged = "Показывать неповреждённые предметы",
          discount = "Скидка",
          nothing = "Нет поврежденных вещей.",
          confirmation = "Вы хотите отремонтировать все одетые предметы?",
          badmerchant = "Этот торговец не может ремонтировать.",
          popup = "Показать всплывающее меню ремонта",
          showinventory = "Подсчет повреждение инвентаря",
          WholeScanInProgress = "Обновление...",
          AutoReplabel = "Авто-Ремонт",
          AutoRepitemlabel = "Авто-Ремонт всех предметов",
          ShowRepairCost = "Отображать стоимость ремонта",
		        ignoreThrown = "Игнорировать метательное оружые",
		  		ShowItems = "Показать предметы",
		  		ShowDiscounts = "Показать скидки",
		  		ShowCosts = "Показать стоимость",
		  		Items = "Предметы",
		  		Discounts = "Скидки",
		  		Costs = "Стоимость",
				CostTotal = "Всего",
				CostBag = "Того что в сумках",
				CostEquip = "Того что на персонаже",
				TooltipOptions = "Подсказка",
    };
	 
     L["TITAN_REPAIR"] = "Titan - ремонт"
     L["TITAN_REPAIR_GBANK_TOTAL"] = "Средства гильд банка :"
     L["TITAN_REPAIR_GBANK_WITHDRAW"] = "Доступная сумма из гильд банка :"
     L["TITAN_REPAIR_GBANK_USEFUNDS"] = "Использовать средства гильд банка"
     L["TITAN_REPAIR_GBANK_NOMONEY"] = "Гильд Банк не в состоянии заплотить за ремонт, или вы не можете воспользоваться такой суммой."
     L["TITAN_REPAIR_GBANK_NORIGHTS"] = "Вы не состоите в гильдии либо у вас нет полномочий использовать средства с гильд банка для ремонта ваших предметов."
     L["TITAN_REPAIR_CANNOT_AFFORD"] = "В данный момент вы не в состоянии отремонтироваться."
     L["TITAN_REPAIR_REPORT_COST_MENU"] = "Сообщить цену ремонта в чат"
     L["TITAN_REPAIR_REPORT_COST_CHAT"] = "Ремонт обошелся в "
     
--L["TITAN_PLUGINS_MENU_TITLE"] = "Плагины";

L["TITAN_GOLD_TOOLTIPTEXT"] = "Всего золота";
L["TITAN_GOLD_ITEMNAME"] = "Слежение за Золотом";
L["TITAN_GOLD_CLEAR_DATA_TEXT"] = "Очистить базу данных";
L["TITAN_GOLD_RESET_SESS_TEXT"] = "Сбросить текущий сеанс";
L["TITAN_GOLD_DB_CLEARED"] = "Титан: Слежение за Золотом - База данных очищена.";
L["TITAN_GOLD_SESSION_RESET"] = "Титан: Слежение за Золотом - Сеан сброшен.";
L["TITAN_GOLD_MENU_TEXT"] = "Слежение за Золотом";
L["TITAN_GOLD_TOOLTIP"] = "Информация о золоте";
L["TITAN_GOLD_TOGGLE_PLAYER_TEXT"] = "Отображать золото у игрока";
L["TITAN_GOLD_TOGGLE_ALL_TEXT"] = "Отображать золото на сервера";
L["TITAN_GOLD_SESS_EARNED"] = "Заработано за данный сеанс";
L["TITAN_GOLD_PERHOUR_EARNED"] = "Заработано за час";
L["TITAN_GOLD_SESS_LOST"] = "Потрачено за данный сеанс";
L["TITAN_GOLD_PERHOUR_LOST"] = "Потрачено за час";
L["TITAN_GOLD_STATS_TITLE"] = "Статистика сеанса";
L["TITAN_GOLD_TTL_GOLD"] = "Всего золота";
L["TITAN_GOLD_START_GOLD"] = "Начальное количество золота";
L["TITAN_GOLD_TOGGLE_SORT_GOLD"] = "Сортировать по золоту";
L["TITAN_GOLD_TOGGLE_SORT_NAME"] = "Сортировать по имени";
L["TITAN_GOLD_TOGGLE_GPH_SHOW"] = "Отображать золото за час";
L["TITAN_GOLD_TOGGLE_GPH_HIDE"] = "Скрыть золота за час";
L["TITAN_GOLD_GOLD"] = "з";
L["TITAN_GOLD_SILVER"] = "с";
L["TITAN_GOLD_COPPER"] = "м";
L["TITAN_GOLD_STATUS_PLAYER_SHOW"] = "видимый";
L["TITAN_GOLD_STATUS_PLAYER_HIDE"] = "скрыт";
L["TITAN_GOLD_DELETE_PLAYER"] = "Удалить персонажа";
L["TITAN_GOLD_SHOW_PLAYER"] = "Show toon";
L["TITAN_GOLD_FACTION_PLAYER_ALLY"] = "Альянс";
L["TITAN_GOLD_FACTION_PLAYER_HORDE"] = "Орда";
L["TITAN_GOLD_CLEAR_DATA_WARNING"] = GREEN_FONT_COLOR_CODE.."Внимание: "
..FONT_COLOR_CODE_CLOSE.."Данное действие уничтожит вашу базу данных Titan Gold. "
.."Если вы хотите продолжить, жмите 'Принять', если нет, жмите 'Отмена' или клавишу 'Escape'.";
L["TITAN_GOLD_COIN_NONE"] = "Без меток";
L["TITAN_GOLD_COIN_LABELS"] = "Показать метки денег";
L["TITAN_GOLD_COIN_ICONS"] = "Показать иконки";
L["TITAN_GOLD_ONLY"] = "Показать только золото";
L["TITAN_GOLD_COLORS"] = "Показать окраску золота";

L["TITAN_VOLUME_TOOLTIP"] = "Контроль звука";
L["TITAN_VOLUME_MASTER_TOOLTIP_VALUE"] = "Громкость общего звука: ";
L["TITAN_VOLUME_SOUND_TOOLTIP_VALUE"] = "Громкость звуковых эффектов: ";
L["TITAN_VOLUME_AMBIENCE_TOOLTIP_VALUE"] = "Громкость звуков окружающего мира: ";
L["TITAN_VOLUME_MUSIC_TOOLTIP_VALUE"] = "Громкость мызыки: ";
L["TITAN_VOLUME_MICROPHONE_TOOLTIP_VALUE"] = "Громкость микрофона: ";
L["TITAN_VOLUME_SPEAKER_TOOLTIP_VALUE"] = "Громкость динамиков: ";
L["TITAN_VOLUME_TOOLTIP_HINT1"] = "ЛКМ чтобы настроить"
L["TITAN_VOLUME_TOOLTIP_HINT2"] = "Громкость звука";
L["TITAN_VOLUME_CONTROL_TOOLTIP"] = "Громкость звука: ";
L["TITAN_VOLUME_CONTROL_TITLE"] = "Громкость";
L["TITAN_VOLUME_MASTER_CONTROL_TITLE"] = "Общий";
L["TITAN_VOLUME_SOUND_CONTROL_TITLE"] = "Звуки";
L["TITAN_VOLUME_AMBIENCE_CONTROL_TITLE"] = "Мир";
L["TITAN_VOLUME_MUSIC_CONTROL_TITLE"] = "Музыка";
L["TITAN_VOLUME_MICROPHONE_CONTROL_TITLE"] = "Микрафон";
L["TITAN_VOLUME_SPEAKER_CONTROL_TITLE"] = "Динамик";
L["TITAN_VOLUME_CONTROL_HIGH"] = "Макс";
L["TITAN_VOLUME_CONTROL_LOW"] = "Мин";
L["TITAN_VOLUME_MENU_TEXT"] = "Настройки Звука";
L["TITAN_VOLUME_MENU_AUDIO_OPTIONS_LABEL"] = "Настройки звука/голоса" ;
L["TITAN_VOLUME_MENU_OVERRIDE_BLIZZ_SETTINGS"] = "Перезаписать звуковые настройки близзарда";
