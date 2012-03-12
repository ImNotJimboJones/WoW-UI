local L = LibStub("AceLocale-3.0"):NewLocale("EveryQuest", "esES")
if not L then return end

-- Core.lua
L[" (%d Times)"] = "(%d Veces)"
-- L[" [L]"] = ""
-- L["%Y/%m/%d %I%p"] = ""
-- L["%d Shown"] = ""
L["%d days %d hr ago"] = "hace %d días %d horas"
L["%d days ago"] = "hace %d días"
-- L["%d hr %d min ago"] = ""
-- L["%d hr ago"] = ""
-- L["%d minutes ago"] = ""
-- L["%d seconds ago"] = ""
-- L["1 day %d hr ago"] = ""
L["1 day ago"] = "hace 1 día"
-- L["1 minute ago"] = ""
-- L["1 second ago"] = ""
-- L["Abandoned"] = ""
-- L["Abandoned: %s"] = ""
-- L["Cancel"] = ""
-- L["Completed"] = ""
-- L["Completed%s: %s"] = ""
-- L["Could not load %s Quest Data because of %s"] = ""
-- L["D"] = ""
-- L["Decreases: %s by |cffff7979%d|r"] = ""
-- L["E"] = ""
-- L["EQ_CLEARIMPORTDESC"] = ""
-- L["EQ_PURGETXT"] = ""
-- L["EQ_UPGRADETXT"] = ""
-- L["Failed"] = ""
-- L["Failed or Abandoned"] = ""
-- L["Failed: %s"] = ""
-- L["Forget"] = ""
-- L["G"] = ""
-- L["H"] = ""
-- L["Ignore"] = ""
-- L["Imported From: %s"] = ""
-- L["In Progress"] = ""
-- L["Increases: %s by |cff00ff00%d|r"] = ""
-- L["Loading %s Quest Data"] = ""
-- L["P"] = ""
-- L["PURGE_ERROR"] = ""
-- L["Purge"] = ""
-- L["QuestGuru"] = ""
-- L["QuestHistory"] = ""
-- L["R"] = ""
-- L["Requires LOD Module: %s"] = ""
-- L["Server Query"] = ""
-- L["Status: %s"] = ""
-- L["Turned In"] = ""
-- L["Unknown"] = ""
-- L["Upgrade"] = ""
-- L["W"] = ""
-- L["WE"] = ""
-- L["Y"] = ""
-- L["You are running a source checkout of EveryQuest %s directly from the repository."] = ""
-- L["You are running an ALPHA RELEASE of EveryQuest %s (revision %d). Please report any bugs @ http://www.wowace.com/addons/everyquest/tickets/"] = ""
-- L["r%d"] = ""


-- events.lua
L["Abandon Quest: %s"] = "Misión Abandonada: %s"
L["Complete Quest: %s"] = "Misión Completada: %s"
L["Failed Quest: %s"] = "Misión Fallada: %s"
L["Obtained Quest: %s"] = "Misión Obtenida: %s"
-- L["Turn In Quest: %s"] = ""
L["Unable to get Quest Information from DB"] = "No se puede obtener información de misión de la Base de Datos"


-- frames.lua
L["%d Completed"] = "%d Completada"
L["%d Failed/Abandoned"] = "%d Fallada/Abandonada"
-- L["%d Hidden"] = ""
L["%d Ignored"] = "%d Ignorada"
L["%d In Progress"] = "%d En Progreso"
-- L["%d Turned In"] = ""
L["%d Unknown"] = "%d Desconocida"
L["- Select -"] = "- Selección -"
L["Click to toggle the main window"] = "Click para activar la ventana principal"
L["EveryQuest"] = "EveryQuest"
L["EveryQuest Log"] = "Registro de EveryQuest"
L["Filters"] = "Filtros"
L["Options"] = "Opciones"
L["Right-click to open the options menu"] = "Click-Derecho para abrir el menú de opciones"
-- L["Toggle Frame"] = ""


-- import.lua
-- L["Clear Import Confirm"] = ""
-- L["Clear Imported Data"] = ""
-- L["Delete any quest tagged as being imported."] = ""
-- L["Deleted %d quests from your database"] = ""
-- L["EQ_CLEARIMPORTDESC"] = ""
-- L["EQ_IMPORT"] = ""
-- L["EQ_IMPORT_TRAILER"] = ""
-- L["Import"] = ""
-- L["Import QuestGuru Data"] = ""
-- L["Import QuestHistory Data"] = ""
-- L["Import failed, you have no data relating to this character on this server."] = ""
-- L["Imported %d quests from %s"] = ""
-- L["QuestHistory importing is strictly alpha quality. This is due to having to guess at which quest you are trying to import."] = ""


-- options.lua
-- L["Alliance"] = ""
-- L["Ascending"] = ""
-- L["Both Factions"] = ""
-- L["Choose which classes you wish to show along with non-class specific quests."] = ""
-- L["Choose which races you wish to show along with non-race specific quests."] = ""
-- L["Class Filter"] = ""
-- L["Completed Quests"] = ""
-- L["Configure filtering options for the quest list. These settings are character specific."] = ""
-- L["Control the display of specific quest statuses"] = ""
-- L["Customize how your quest list is sorted.  Higher Weight moves the items to the top of the list, lower weight goes to the bottom.  Sort order Ascending: A-Z 0-9, Descending: Z-A, 9-0."] = ""
-- L["Daily Quests"] = ""
-- L["Descending"] = ""
-- L["Direction"] = ""
-- L["Dungeon Quests"] = ""
-- L["EQ_DESC"] = ""
-- L["EQ_LOCALLIST"] = ""
-- L["Enable Filtering"] = ""
-- L["Example for Ignored quest: Some quests are still in Wowhead's database but are not attainable ingame anymore. Ignore them to hide them from the list."] = ""
-- L["Faction Filter"] = ""
-- L["Failed or Abandoned Quests"] = ""
-- L["Filter Quests by Level"] = ""
L["Filter Quests by Type"] = "Filtrar Misiones por Tipo"
L["General Settings"] = "Ajustes Generales"
-- L["Group Quests"] = ""
L["Heroic Quests"] = "Misiones Heroicas"
L["Horde"] = "Horda"
L["Ignored Quests"] = "Misiones Ignoradas"
-- L["Level Filter"] = ""
-- L["List Order"] = ""
-- L["Localized Quest List"] = ""
-- L["Maximum Level"] = ""
-- L["Minimum Level"] = ""
-- L["More Numbers"] = ""
-- L["No Side/No Data"] = ""
-- L["Normal Quests"] = ""
-- L["Note: Stores localized quest titles in the global database"] = ""
-- L["Order by Daily"] = ""
-- L["Order by Level"] = ""
-- L["Order by Name"] = ""
-- L["Order by Type"] = ""
-- L["Order by Weekly"] = ""
-- L["Purge Old data"] = ""
-- L["Purge Old database data, generally used after running upgrade"] = ""
-- L["PvP Quests"] = ""
-- L["Quest Colors"] = ""
-- L["Quests In Progress"] = ""
-- L["Race Filter"] = ""
-- L["Raid Quests"] = ""
-- L["Removes 'shown' from the displayed numbers, adds a counts of each status shown."] = ""
-- L["Repeatable"] = ""
-- L["Save Zone"] = ""
-- L["Saves which zone you where last looking at to load upon login"] = ""
-- L["Show Debugging Messages"] = ""
-- L["Show Debugging Messages - *WARNING* Spams your default chat frame"] = ""
-- L["Show quests for specific class"] = ""
-- L["Show quests for specific faction"] = ""
-- L["Show quests for specific race"] = ""
-- L["Shows %s Only Quests"] = ""
-- L["Shows 'group suggested' quests"] = ""
-- L["Shows 'raid suggested' quests"] = ""
-- L["Shows Alliance Quests"] = ""
-- L["Shows Horde Quests"] = ""
-- L["Shows PVP quests"] = ""
-- L["Shows completed quests still in your questlog"] = ""
-- L["Shows daily quests"] = ""
-- L["Shows dungeon quests"] = ""
-- L["Shows heroic quests"] = ""
-- L["Shows normal Blizzard soloable quests"] = ""
-- L["Shows quests that are available to both factions"] = ""
-- L["Shows quests that don't have a side or don't have data for a specific side"] = ""
-- L["Shows quests that you are on but not completed"] = ""
-- L["Shows quests that you have failed or abandoned"] = ""
-- L["Shows quests turned back into NPCs"] = ""
-- L["Shows quests you haven't seen before"] = ""
-- L["Shows quests you've ignored"] = ""
-- L["Shows weekly quests"] = ""
-- L["Status Filter"] = ""
-- L["Track Zone"] = ""
-- L["Track zone changes and update the EveryQuest list for that zone"] = ""
-- L["Turned In Quests"] = ""
-- L["Type Filter"] = ""
-- L["Unknown Status"] = ""
-- L["Upgrade DB"] = ""
-- L["Upgrade the Database from the old format"] = ""
-- L["Weekly Quests"] = ""
-- L["Weight"] = ""


-- query.lua
-- L["Added %d quests to your database"] = ""
-- L["Auto Populate"] = ""
-- L["Consider uploading your WTF\\Account\\{account name}\\SavedVariables\\EveryQuest.lua to http://wow.kandarz.com/everyquest/upload.html"] = ""
-- L["EQ_QUERY"] = ""
-- L["EQ_QUERY2"] = ""
-- L["EQ_QUERY_TRAILER"] = ""
-- L["Once the server responds, automatically start the import of quest data"] = ""
-- L["Once you recieve the server responce, populate the database with your completed quests."] = ""
-- L["Populate History"] = ""
-- L["Populate History: %d quests not found in the database."] = ""
-- L["Populating your quest history from the server, this may take a while and might freeze your game."] = ""
-- L["Query Server"] = ""
-- L["Querying Server for your quest history"] = ""
-- L["Ready to populate your quest history from server"] = ""


-- zonemenu.lua
-- L["Ahn'Qiraj War"] = ""
L["Alchemy"] = "Alquimia"
L["All"] = "Todo"
-- L["Archaeology"] = ""
L["Battlegrounds"] = "Campos de Batalla"
-- L["Blackmaw Hold"] = ""
L["Blacksmithing"] = "Herrería"
L["Brewfest"] = "Fiesta de la Cerveza"
-- L["Burning Crusade"] = ""
-- L["Cataclysm"] = ""
L["Children's Week"] = "Semana de los Niños"
L["Classes"] = "Clases"
L["Classic"] = "Clásico"
-- L["Continents"] = ""
L["Cooking"] = "Cocina"
-- L["Dalaran Crater"] = ""
L["Darkmoon Faire"] = "Feria de la Luna Negra"
L["Day of the Dead"] = "Día de los Muertos"
-- L["Dungeon Finder"] = ""
L["Dungeons"] = "Mazmorras"
-- L["Echo Isles"] = ""
L["Engineering"] = "Ingeniería"
L["Epic"] = "Épico"
L["First Aid"] = "Primeros Auxilios"
L["Fishing"] = "Pesca"
L["Hallow's End"] = "Halloween"
L["Harvest Festival"] = "Festival de la Cosecha"
L["Herbalism"] = "Herbología"
L["Inscription"] = "Inscripción"
-- L["Instances"] = ""
-- L["Invasion"] = ""
L["Jewelcrafting"] = "Joyería"
L["Leatherworking"] = "Peletería"
L["Legendary"] = "Legendario"
L["Love is in the Air"] = "Amor en el Aire"
L["Lunar Festival"] = "Festival Lunar"
-- L["Midsummer"] = ""
L["Miscellaneous"] = "Miscelánea"
L["New Year's Eve"] = "Nochevieja"
L["Noblegarden"] = "Jardín Noble"
L["Pilgrim's Bounty"] = "Generosidad del Peregrino"
L["Professions"] = "Profesiones"
L["Raids"] = "Bandas"
-- L["Redridge Canyons"] = ""
L["Reputation"] = "Reputación"
-- L["Ruins of Uldum"] = ""
L["Skettis"] = "Skettis"
-- L["Steamwheedle Cartel"] = ""
-- L["Stormwind Harbor"] = ""
L["Tailoring"] = "Sastrería"
L["The Black Temple"] = "El Templo Oscuro"
-- L["The Burning Crusade"] = ""
L["Timbermaw Hold"] = "Bastión Fauces de Madera"
L["Tournament"] = "Torneo"
L["Winter Veil"] = "Festival del Invierno"
-- L["World Events"] = ""
L["Wrath of the Lich King"] = "Wrath of the Lich King"


L["Classic"] = EXPANSION_NAME0
L["The Burning Crusade"] = EXPANSION_NAME1
L["Wrath of the Lich King"] = EXPANSION_NAME2
L["Cataclysm"] = EXPANSION_NAME3
L["Other"] = OTHER