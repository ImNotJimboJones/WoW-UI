﻿local MOVANY = {}
MOVANY.RESET_FRAME_CONFIRM = "Сбросить %s? Нажми еще раз в течение 5 секунд для подтверждения"
MOVANY.RESETTING_FRAME = "Сбрасываю %s"
MOVANY.FRAME_PROTECTED_DURING_COMBAT = "Нельзя взаимодействовать с %s во время боя"
MOVANY.DISABLED_DURING_COMBAT = "Отключено во время боя"
MOVANY.UNSUPPORTED_TYPE = "Неподдерживаемый тип: %s"
MOVANY.UNSUPPORTED_FRAME = "Неподдерживаемая структура: %s"
MOVANY.FRAME_VISIBILITY_ONLY = "%s может быть только скрыто"
MOVANY.ONLY_ONCE_CREATED = "%s может быть изменено только после создания"
MOVANY.FRAME_NO_FRAME_EDITOR = "Редактор структру для %s выключен"
MOVANY.ELEMENT_NOT_FOUND = "UI элемент не найден"
MOVANY.ELEMENT_NOT_FOUND_NAMED = "UI элемент не найден: %s"
MOVANY.PROFILES_CANT_SWITCH_DURING_COMBAT = "Профиль не может быть изменен во время боя"
MOVANY.CMD_SYNTAX_UNMOVE = "Команда: /unmove frameName"
MOVANY.CMD_SYNTAX_IMPORT = "Команда: /moveimport ProfileName"
MOVANY.CMD_SYNTAX_EXPORT = "Команда: /moveexport ProfileName"
MOVANY.CMD_SYNTAX_DELETE = "Команда: /movedelete ProfileName"
MOVANY.CMD_SYNTAX_MAFE = "Команда: /mafe frameName"
MOVANY.CMD_SYNTAX_HIDE = "Команда: /hide ProfileName"
MOVANY.RESET_ALL_CONFIRM = "MoveAnything: Сбросить MoveAnything в исходным установкам?\n\nВнимание: это сбросит все настройки структур и очистит пользовательский список структур."
MOVANY.PROFILE_UNKNOWN = "Неизвестный профиль: %s"
MOVANY.PROFILE_IMPORTED = "\"%s\" был имортирован в \"%s\""
MOVANY.PROFILE_EXPORTED = "\"%s\" экспортирован в \"%s\""
MOVANY.PROFILE_DELETED = "Профиль удален: %s"
MOVANY.PROFILE_RESET_CONFIRM = "MoveAnything: Сбросить все структуры в текущем профиле?"
MOVANY.PROFILE_CANT_DELETE_CURRENT_IN_COMBAT = "Нельзя удалять текущий профиль во время боя"
MOVANY.PROFILES = "Профили"
MOVANY.PROFILE_CURRENT = "Текущий"
MOVANY.FRAME_UNPOSITIONED = "%s в настоящее время не имеет позиции и не может быть перемещено, пока"
MOVANY.NO_NAMED_FRAMES_FOUND = "Названные элементы не найдены"
MOVANY.SEARCH_TEXT = "Искать    "
MOVANY.LIST_HEADING_CATEGORY_AND_FRAMES = "Категории и структуры"
MOVANY.LIST_HEADING_SEARCH_RESULTS = "Результаты поиска: %i"
MOVANY.LIST_HEADING_HIDE = "Скрыть"
MOVANY.LIST_HEADING_MOVER = "Перемещатель"
MOVANY.FE_UNREGISTER_ALL_EVENTS_CONFIRM = "Отменить все события? Нажми еще раз в течение 5 секунд чтобы подтвердить"
MOVANY.FE_UNREGISTER_ALL_EVENTS_TOOLTIP = "Unregisters any events that the frame is listening to,\nrendering the frame inert\n\nRe-enabling unregistered events will require a reload\nor relog after unchecking this checkbox"
MOVANY.FRAME_ONLY_WHEN_BANK_IS_OPEN = "Можно взаимодействовать с %s только когда банк открыт "
MOVANY.FRAME_ONLY_WHEN_VOIDSTORAGE_IS_OPEN = "Can only interact %s is open"
MOVANY.FRAME_ONLY_ONCE_OPENED = "Можно взаимодействовать с %s после первого показа"
MOVANY.PROFILE_ADD_TEXT = "Введите новое имя профиля"
MOVANY.PROFILE_SAVE_AS_TEXT = "Введите новое имя профиля"
MOVANY.PROFILE_RENAME_TEXT = "Введите новое имя для \"%s\""
MOVANY.PROFILE_DELETE_TEXT = "Удалить профиль \"%s\"?"
MOVANY.PROFILE_ALREADY_EXISTS = "Профиль \"%s\" уже существует"
MOVANY.PROFILE_CANT_DELETE_DEFAULT = "Стандартный профиль не может быть удален"
MOVANY.ADD = "Добавить"
MOVANY.SAVE = "Сохранить"
MOVANY.RENAME ="Переименовать"
MOVANY.DELETE = "Удалить"
MOVANY.UNSERIALIZE_PROFILE_NO_NAME = "Не могу найти профиль"
MOVANY.UNSERIALIZE_PROFILE_COMPLETED = "Имортировано %i элемент(ов) в профиль \"%s\""
MOVANY.UNSERIALIZE_FRAME_INVALID_FORMAT = "Неверный формат"
MOVANY.UNSERIALIZE_FRAME_NAME_DIFFERS = "Импортированное имя структуры отличается от цели импорта"
MOVANY.FE_FORCED_LOCK_POSITION_CONFIRM = "Намеренно заблокировать положение? Нажми еще раз в течение 5 секунд чтобы подтвердить"
MOVANY.FE_FORCED_LOCK_POSITION_TOOLTIP = "Overwrites the element's SetPoint method,\nreplacing it with an empty stub\n\nMay cause taint if the element is protected\nand the stub gets called during combat\n\nRequires a reload or relog after unchecking to\nrestore the original SetPoint method"
MOVANY.FE_GROUP_RESET_CONFIRM = "Reset Group %i? Click again within 5 seconds to confirm"
MOVANY.FE_GROUPS_TOOLTIP = "Группа %i"
MOVANY.ERROR_FRAME_FAILED = "An error occured while syncing %s. Resetting the frame and /reload'ing before modifying it again might solve the issue. You can disable this message in the options. If the problem persists please report the following to the author: %s %s %s"
MOVANY.ERROR_MODULE_FAILED = "An error occured while adjusting %s for %s. You can disable this message in the options. If the problem persists please report the following to the author: %s %s %s %s"
MOVANY.ERROR_NOT_A_TABLE = "\"%s\" is an unsupported type"

_G.MOVANY = MOVANY