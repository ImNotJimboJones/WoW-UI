--partial class definition
local Hooked = PetJournalEnhanced:GetModule("Hooked")
local _
local ASCENDING =  1
local DESCENDING = 2
local breedInfo = LibStub("LibPetBreedInfo-1.0")
local ZoneFiltering = PetJournalEnhanced:GetModule("ZoneFiltering")
local L =  LibStub("AceLocale-3.0"):GetLocale("PetJournalEnhanced")

local FILTER_CURRENT_ZONE = L["Filter pets by current zone"]
local FILTER_BREED = L["Breed"]
local FILTER_SORTING = L["Sorting"]
local FILTER_RESET = L["Reset Filters"]
local FILTER_CAN_BATTLE = L["Can Battle"]
local FILTER_CANT_BATTLE = L["Can't Battle"]
local FILTER_CAN_TRADE = L["Can Trade"]
local FILTER_CANT_TRADE = L["Can't Trade"]
local FILTER_UNKNOWN_ZONE = L["Unknown Zone"]
local FILTER_SORT_FAVORITES = L["Sort favorites to the top"]
local FILTER_SORT_DIRECTION  = L["Sort Direction:"]
local FILTER_SORT_ASCENDING = L["Sort Ascending"]
local FILTER_SORT_DESCENDING = L["Sort Descending"]

local FILTER_SORT_ORDER = L["Sort Order:"]
local levelBrackets = {"1-10","11-20","21-24","25"};
local specializations = {
	L["Balanced"],
	FAST,
	L["Resilient"],
	L["Powerful"],
}
local sortTypes = {
	LEVEL,
	NAME,
	TYPE,
	RARITY,
	L["Highest Stat"],
	}--,["Added to Pet Journal"]=SORT_PETID}
local FILTER_MENU_NAMES = {
	MISCELLANEOUS,
	LEVEL,
	L["Ability Type"],
	L["Zones"],
	QUALITY,
	SPECIALIZATION,
	L["Quantity"],
}

local FILTER_MENU_VALUES = { 10,11,12,3,6,4,8}
	

function Hooked:CreateDropdownMenu(level)
	if level == 1 then
		--create check boxes
		local info = UIDropDownMenu_CreateInfo();
		info.keepShownOnClick = true;	
		info.text = COLLECTED
		info.func = 	function(_, _, _, value)
							C_PetJournal.SetFlagFilter(LE_PET_JOURNAL_FLAG_COLLECTED, value);
							
							if (value) then
								UIDropDownMenu_EnableButton(1,2);
							else
								UIDropDownMenu_DisableButton(1,2);
							end;
							PetJournalEnhanced:UpdatePets()
							
						end 
		info.checked = not C_PetJournal.IsFlagFiltered(LE_PET_JOURNAL_FLAG_COLLECTED);
		info.isNotRadio = true;
		UIDropDownMenu_AddButton(info, level)
		
		info.text = FAVORITES_FILTER
		info.func = 	function(_, _, _, value)
							C_PetJournal.SetFlagFilter(LE_PET_JOURNAL_FLAG_FAVORITES, value);
							PetJournalEnhanced:UpdatePets()
						end 
		info.disabled = not info.checked or info.checked ~= true;
		info.checked = not C_PetJournal.IsFlagFiltered(LE_PET_JOURNAL_FLAG_FAVORITES);
		info.isNotRadio = true;
		info.leftPadding = 16;
		UIDropDownMenu_AddButton(info, level)
		
		info.leftPadding = 0;
		info.disabled = nil;

		info.text = NOT_COLLECTED
		info.func = 	function(_, _, _, value)
							C_PetJournal.SetFlagFilter(LE_PET_JOURNAL_FLAG_NOT_COLLECTED, value);
							PetJournalEnhanced:UpdatePets()
						end 
		info.checked = not C_PetJournal.IsFlagFiltered(LE_PET_JOURNAL_FLAG_NOT_COLLECTED);
		info.isNotRadio = true;
		UIDropDownMenu_AddButton(info, level)
		
		info.leftPadding = 0;
		info.disabled = nil;

		
		
		info.text = FILTER_CURRENT_ZONE
		info.func = 	function(_, _, _, value)
					
					self.db.filtering.currentZone = not self.db.filtering.currentZone
					PetJournalEnhanced:UpdatePets()
				end 
		info.checked = function() return self.db.filtering.currentZone end
		UIDropDownMenu_AddButton(info, level)
		
		--create sub menu headers
		info.checked = 	nil;
		info.isNotRadio = nil;
		info.func =  nil;
		info.hasArrow = true;
		info.notCheckable = true;
	
		info.text = PET_FAMILIES
		info.value = 1;
		UIDropDownMenu_AddButton(info, level)
		
		info.text = SOURCES
		info.value = 2;
		UIDropDownMenu_AddButton(info, level)
		
		for i=1,#FILTER_MENU_NAMES do
			info.text = FILTER_MENU_NAMES[i]
			info.value = FILTER_MENU_VALUES[i];
			UIDropDownMenu_AddButton(info, level)		
		end
		
		if Hooked.db.display.breedInfo then
			info.text = FILTER_BREED
			info.value = 9;
			UIDropDownMenu_AddButton(info, level)
		end
		info.text = FILTER_SORTING
		info.value = 5
		UIDropDownMenu_AddButton(info, level)
		
		
		
		local info = UIDropDownMenu_CreateInfo();
		info.notCheckable = true
		info.text = FILTER_RESET
		info.value = 7
		info.func = function() PetJournalEnhanced:Reset() end
		UIDropDownMenu_AddButton(info, level)
	end

	if level == 2 then	
		local info = UIDropDownMenu_CreateInfo();
		info.keepShownOnClick = true;	
		
		if Hooked.db.display.breedInfo and UIDROPDOWNMENU_MENU_VALUE == 9 then --breed filter
			
			info.notCheckable = true;
			info.text = CHECK_ALL
			info.func = function()
					for i=1,#self.db.filtering.breed do 
						self.db.filtering.breed[i] = true
					end

					UIDropDownMenu_Refresh(PetJournalFilterDropDown,1,2)
					PetJournalEnhanced:UpdatePets()
				end
			UIDropDownMenu_AddButton(info, level)
			
			info.text = UNCHECK_ALL
			info.func = function()
					for i=1,#self.db.filtering.breed	do 
						self.db.filtering.breed[i] = false
					end

					UIDropDownMenu_Refresh(PetJournalFilterDropDown,1,2)
					PetJournalEnhanced:UpdatePets()
				end
			UIDropDownMenu_AddButton(info, level)
			
			
			for i,breedName in breedInfo:IterateBreedNames() do
				info.notCheckable = false;	
				info.keepShownOnClick = true
				info.checked = false
				info.isNotRadio = true
				info.text = breedName
				info.func = function(_, _, _, value)
							self.db.filtering.breed[i] = not self.db.filtering.breed[i]
							PetJournalEnhanced:UpdatePets()
						end 
				info.checked = function() return self.db.filtering.breed[i] end
				UIDropDownMenu_AddButton(info, level)
				
			end	
		elseif UIDROPDOWNMENU_MENU_VALUE == 11 then -- Level filter
			
			info.notCheckable = true;
			info.text = CHECK_ALL
			info.func = function()
					for i=1,#self.db.filtering.level	do 
						self.db.filtering.level[i] = true
					end
					UIDropDownMenu_Refresh(PetJournalFilterDropDown,1,2)
					PetJournalEnhanced:UpdatePets()
				end
			UIDropDownMenu_AddButton(info, level)
			
			info.text = UNCHECK_ALL
			info.func = function()
							for i=1,#self.db.filtering.level	do 
								self.db.filtering.level[i] = false
							end
							UIDropDownMenu_Refresh(PetJournalFilterDropDown,1,2)
							PetJournalEnhanced:UpdatePets()
						end
			UIDropDownMenu_AddButton(info, level)
			
			
			info.notCheckable = false;	
			info.keepShownOnClick = true
			info.checked = false
			info.isNotRadio = true
			
			
			for i=1,#levelBrackets do
				info.text = levelBrackets[i]
				info.func = 	function(_, _, _, value)
									self.db.filtering.level[i] = not self.db.filtering.level[i]
									PetJournalEnhanced:UpdatePets()
								end 
				info.checked = function() return self.db.filtering.level[i] end;
				info.isNotRadio = true;
				UIDropDownMenu_AddButton(info, level)
			end
			
			
		
		elseif UIDROPDOWNMENU_MENU_VALUE == 10 then -- misc filter
			
			info.notCheckable = true;
			info.text = CHECK_ALL
			info.func = function()
					self.db.filtering.canBattle = true
					self.db.filtering.cantBattle = true
					self.db.filtering.canTrade = true
					self.db.filtering.cantTrade = true
					
					UIDropDownMenu_Refresh(PetJournalFilterDropDown,1,2)
					PetJournalEnhanced:UpdatePets()
				end
			UIDropDownMenu_AddButton(info, level)
			
			info.text = UNCHECK_ALL
			info.func = function()
					self.db.filtering.canBattle = false
					self.db.filtering.cantBattle = false
					self.db.filtering.canTrade = false
					self.db.filtering.cantTrade = false
					UIDropDownMenu_Refresh(PetJournalFilterDropDown,1,2)
					PetJournalEnhanced:UpdatePets()
				end
			UIDropDownMenu_AddButton(info, level)
			
			info.notCheckable = false;	
			info.keepShownOnClick = true
			info.checked = false
			info.isNotRadio = true
			
			 
			
			info.text = FILTER_CAN_BATTLE
			info.func = 	function(_, _, _, value)
								self.db.filtering.canBattle = not self.db.filtering.canBattle
								PetJournalEnhanced:UpdatePets()
							end 
			info.checked = function() return self.db.filtering.canBattle end;
			info.isNotRadio = true;
			UIDropDownMenu_AddButton(info, level)
			
			info.text = FILTER_CANT_BATTLE
			info.func = 	function(_, _, _, value)
								self.db.filtering.cantBattle = not self.db.filtering.cantBattle
								PetJournalEnhanced:UpdatePets()
							end 
			info.checked = function() return self.db.filtering.cantBattle end;
			info.isNotRadio = true;
			UIDropDownMenu_AddButton(info, level)
			
			info.text = FILTER_CAN_TRADE
			info.func = 	function(_, _, _, value)
						
						self.db.filtering.canTrade = not self.db.filtering.canTrade
						PetJournalEnhanced:UpdatePets()
					end 
			info.checked = function() return self.db.filtering.canTrade end
			UIDropDownMenu_AddButton(info, level)
			
			info.text = FILTER_CANT_TRADE
			info.func = 	function(_, _, _, value)
						
						self.db.filtering.cantTrade = not self.db.filtering.cantTrade
						PetJournalEnhanced:UpdatePets()
					end 
			info.checked = function() return self.db.filtering.cantTrade end
			UIDropDownMenu_AddButton(info, level)
		elseif UIDROPDOWNMENU_MENU_VALUE == 12 then -- ability type filter
			
			info.notCheckable = true;
			info.text = CHECK_ALL
			info.func = function()
					for i=1,#self.db.filtering.abilityType	do 
						self.db.filtering.abilityType[i] = true
					end
					UIDropDownMenu_Refresh(PetJournalFilterDropDown,1,2)
					PetJournalEnhanced:UpdatePets()
				end
			UIDropDownMenu_AddButton(info, level)
			
			info.text = UNCHECK_ALL
			info.func = function()
							for i=1,#self.db.filtering.abilityType	do 
								self.db.filtering.abilityType[i] = false
							end
							UIDropDownMenu_Refresh(PetJournalFilterDropDown,1,2)
							PetJournalEnhanced:UpdatePets()
						end
			UIDropDownMenu_AddButton(info, level)
			
			for i=1, #PET_TYPE_SUFFIX do
				info.notCheckable = false;	
				info.keepShownOnClick = true
				info.checked = false
				info.isNotRadio = true
				info.text = PET_TYPE_SUFFIX[i]
				info.func = function(_, _, _, value)
							self.db.filtering.abilityType[i] = not self.db.filtering.abilityType[i]
							PetJournalEnhanced:UpdatePets()
						end 
				info.checked = function() return self.db.filtering.abilityType[i] end
				UIDropDownMenu_AddButton(info, level)
			end
			
		
		elseif UIDROPDOWNMENU_MENU_VALUE == 8 then --quantity
			info.notCheckable = true;
			info.text = CHECK_ALL
			info.func = function()
					for i=1,#self.db.filtering.quantity	do 
						self.db.filtering.quantity[i] = true
					end
					UIDropDownMenu_Refresh(PetJournalFilterDropDown,1,2)
					PetJournalEnhanced:UpdatePets()
				end
			UIDropDownMenu_AddButton(info, level)
			
			info.text = UNCHECK_ALL
			info.func = function()
							for i=1,#self.db.filtering.quantity	do 
								self.db.filtering.quantity[i] = false
							end
							UIDropDownMenu_Refresh(PetJournalFilterDropDown,1,2)
							PetJournalEnhanced:UpdatePets()
						end
			UIDropDownMenu_AddButton(info, level)
			
			
			for i=1,#self.db.filtering.quantity do
				info.notCheckable = false;	
				info.keepShownOnClick = true
				info.checked = false
				info.isNotRadio = true
				info.text = i
				info.func = function(_, _, _, value)
							self.db.filtering.quantity[i] = not self.db.filtering.quantity[i]
							PetJournalEnhanced:UpdatePets()
						end 
				info.checked = function() return self.db.filtering.quantity[i] end
				UIDropDownMenu_AddButton(info, level)
			
			end
		
		elseif UIDROPDOWNMENU_MENU_VALUE == 1 then --blizzard pet families
			info.hasArrow = false;
			info.isNotRadio = true;
			info.notCheckable = true;
				
		
			info.text = CHECK_ALL
			info.func = function()
							C_PetJournal.AddAllPetTypesFilter();
							UIDropDownMenu_Refresh(PetJournalFilterDropDown, 1, 2);
							PetJournalEnhanced:UpdatePets()
						end
			UIDropDownMenu_AddButton(info, level)
			
			info.text = UNCHECK_ALL
			info.func = function()
							C_PetJournal.ClearAllPetTypesFilter();
							UIDropDownMenu_Refresh(PetJournalFilterDropDown, 1, 2);
							PetJournalEnhanced:UpdatePets()
						end
			UIDropDownMenu_AddButton(info, level)
		
			info.notCheckable = false;
			local numTypes = C_PetJournal.GetNumPetTypes();
			for i=1,numTypes do
				info.text = _G["BATTLE_PET_NAME_"..i];
				info.func = function(_, _, _, value)
							C_PetJournal.SetPetTypeFilter(i, value);
							PetJournalEnhanced:UpdatePets()
						end
				info.checked = function() return not C_PetJournal.IsPetTypeFiltered(i) end;
				UIDropDownMenu_AddButton(info, level);
			end
		elseif UIDROPDOWNMENU_MENU_VALUE == 2 then --blizzard pet sources
			info.hasArrow = false;
			info.isNotRadio = true;
			info.notCheckable = true;
				
		
			info.text = CHECK_ALL
			info.func = function()
							C_PetJournal.AddAllPetSourcesFilter();
							UIDropDownMenu_Refresh(PetJournalFilterDropDown, 2, 2);
							PetJournalEnhanced:UpdatePets()
						end
			UIDropDownMenu_AddButton(info, level)
			
			info.text = UNCHECK_ALL
			info.func = function()
							C_PetJournal.ClearAllPetSourcesFilter();
							UIDropDownMenu_Refresh(PetJournalFilterDropDown, 2, 2);
							PetJournalEnhanced:UpdatePets()
						end
			UIDropDownMenu_AddButton(info, level)
		
			info.notCheckable = false;
			local numSources = C_PetJournal.GetNumPetSources();
			for i=1,numSources do
				info.text = _G["BATTLE_PET_SOURCE_"..i];
				info.func = function(_, _, _, value)
							C_PetJournal.SetPetSourceFilter(i, value);
							PetJournalEnhanced:UpdatePets()
						end
				info.checked = function() return not C_PetJournal.IsPetSourceFiltered(i) end;
				UIDropDownMenu_AddButton(info, level);
			end
		
		elseif UIDROPDOWNMENU_MENU_VALUE == 3 then --zone filter
			local info = UIDropDownMenu_CreateInfo()
			local zoneTree = ZoneFiltering:GetZoneGroupMapping()
			info.hasArrow = false;
			info.isNotRadio = true;
			info.notCheckable = true;
			info.keepShownOnClick = true
			info.text = CHECK_ALL
			info.func = function()
							ZoneFiltering:SetAllFiltered(true)
							self.db.filtering.unknownZone = true
							PetJournalEnhanced:UpdatePets()
							UIDropDownMenu_Refresh(PetJournalFilterDropDown,1,2)
						end
			UIDropDownMenu_AddButton(info, level)
			
			info.text = UNCHECK_ALL
			info.func = function()
							ZoneFiltering:SetAllFiltered(false)
							self.db.filtering.unknownZone = false
							PetJournalEnhanced:UpdatePets()
							UIDropDownMenu_Refresh(PetJournalFilterDropDown,1,2)
						end
			UIDropDownMenu_AddButton(info, level)
			
			local info = UIDropDownMenu_CreateInfo()
			info.notCheckable = false;	
			info.keepShownOnClick = true
			info.checked = false
			info.isNotRadio = true
			info.text = FILTER_UNKNOWN_ZONE 
			info.func = 	function(_, _, _, value)
						self.db.filtering.unknownZone = not self.db.filtering.unknownZone
						UIDropDownMenu_Refresh(PetJournalFilterDropDown,1,2)
						PetJournalEnhanced:UpdatePets()
					end 
			info.checked = function() return self.db.filtering.unknownZone end
			UIDropDownMenu_AddButton(info, level)
			
			local ZoneGroupMap = ZoneFiltering:GetZoneGroupMapping()
			for i=1,ZoneFiltering:GetNumZoneGroups() do
				info.hasArrow = true;
				info.notCheckable = true;	
				info.keepShownOnClick = true
				info.checked = false
				info.isNotRadio = true
				info.text = ZoneFiltering:GetZoneGroupNames(i)
				info.value = i
				info.func = 	nil
				info.checked = nil
				UIDropDownMenu_AddButton(info, level)
			end
			
			
			
			
		elseif UIDROPDOWNMENU_MENU_VALUE == 4 then --pet specialization
			local info = UIDropDownMenu_CreateInfo()
			
			info.hasArrow = false;
			info.isNotRadio = true;
			info.notCheckable = true;
			info.keepShownOnClick = true
			info.text = CHECK_ALL
			info.func = function()
							for i=1,#self.db.filtering.specialization do self.db.filtering.specialization[i] = true end
							UIDropDownMenu_Refresh(PetJournalFilterDropDown,1,2)
							PetJournalEnhanced:UpdatePets()
						end
			UIDropDownMenu_AddButton(info, level)
			
			info.text = UNCHECK_ALL
			info.func = function()
							for i=1,#self.db.filtering.specialization do self.db.filtering.specialization[i] = false end
							UIDropDownMenu_Refresh(PetJournalFilterDropDown,1,2)
							PetJournalEnhanced:UpdatePets()
						end
			UIDropDownMenu_AddButton(info, level)
			
			
			for i=1,4 do
				info.notCheckable = false;	
				info.keepShownOnClick = true
				info.checked = false
				info.isNotRadio = true
				info.text = specializations[i]
				info.func = 	function(_, _, _, value)
							self.db.filtering.specialization[i] = not self.db.filtering.specialization[i]
							UIDropDownMenu_Refresh(PetJournalFilterDropDown,1,2)
							PetJournalEnhanced:UpdatePets()
							
						end 
				info.checked = function() return self.db.filtering.specialization[i] end
				UIDropDownMenu_AddButton(info, level)
			
			end
		
		elseif UIDROPDOWNMENU_MENU_VALUE == 5 then --sorting menu
			info.keepShownOnClick = true
			info.text = FILTER_SORT_FAVORITES
			info.func = 	function(_, _, _, value)
						self.db.sorting.favoritesFirst = not self.db.sorting.favoritesFirst
						PetJournalEnhanced.SortFunctions = PetJournalEnhanced:GetSortFunctions()
						UIDropDownMenu_Refresh(PetJournalFilterDropDown,1,2)
						PetJournalEnhanced:UpdatePets()
					end 
			info.checked = function() return self.db.sorting.favoritesFirst end
			info.isNotRadio = true
			info.notCheckable = false		
			UIDropDownMenu_AddButton(info, level)
			
			info.keepShownOnClick = true
			info.text = FILTER_SORT_ORDER
			info.func = nil;
			info.notCheckable = true		
			UIDropDownMenu_AddButton(info, level)
			
			info.notCheckable = false;	
			
			
			
			
			
			--create sort menu options
			for i=1,#sortTypes do 
				info.keepShownOnClick = true
				info.checked = false
				info.isNotRadio = false
				info.text = sortTypes[i]
				info.func = 	function(_, _, _, value)
							
							self.db.sorting.selection = i
							UIDropDownMenu_Refresh(PetJournalFilterDropDown,1,2)
							PetJournalEnhanced:UpdatePets()
						end 
				info.checked = function() return self.db.sorting.selection == i end
				UIDropDownMenu_AddButton(info, level)
			end
			
			if Hooked.db.display.breedInfo then
				info.keepShownOnClick = true
				info.checked = false
				info.isNotRadio = false
				info.text = FILTER_BREED
				info.func = 	function(_, _, _, value)
							
							self.db.sorting.selection = #sortTypes + 1
							UIDropDownMenu_Refresh(PetJournalFilterDropDown,1,2)
							PetJournalEnhanced:UpdatePets()
						end 
				info.checked = function() return self.db.sorting.selection == #sortTypes + 1 end
				UIDropDownMenu_AddButton(info, level)
			end	
			
			info.keepShownOnClick = true
			info.checked = false
			info.isNotRadio = false
			
			info.text = FILTER_SORT_DIRECTION
			info.func = nil;
			info.notCheckable = true		
			UIDropDownMenu_AddButton(info, level)
			
			info.notCheckable = false;	
			info.text = FILTER_SORT_ASCENDING
			info.func = 	function(_, _, _, value)
						
						self.db.sorting.order = ASCENDING
						UIDropDownMenu_Refresh(PetJournalFilterDropDown,1,2)
						PetJournalEnhanced:UpdatePets()
					end 
			info.checked = function() return self.db.sorting.order ==  ASCENDING end
			UIDropDownMenu_AddButton(info, level)
			
			info.text = FILTER_SORT_DESCENDING
			info.func = 	function(_, _, _, value)
						self.db.sorting.order = DESCENDING
						UIDropDownMenu_Refresh(PetJournalFilterDropDown,1,2)
						PetJournalEnhanced:UpdatePets()
					end 
			info.checked = function() return  self.db.sorting.order == DESCENDING end
			UIDropDownMenu_AddButton(info, level)
		elseif UIDROPDOWNMENU_MENU_VALUE == 6 then
			local info = UIDropDownMenu_CreateInfo()
		
			info.hasArrow = false;
			info.isNotRadio = true;
			info.notCheckable = true;
			info.keepShownOnClick = true
			info.text = CHECK_ALL
			info.func = function()
							for i=1,#self.db.filtering.rarity do self.db.filtering.rarity[i] = true end
							UIDropDownMenu_Refresh(PetJournalFilterDropDown, 1, 2);
							PetJournalEnhanced:UpdatePets()
						end
			UIDropDownMenu_AddButton(info, level)
			
			info.text = UNCHECK_ALL
			info.func = function()
							for i=1,#self.db.filtering.rarity do self.db.filtering.rarity[i] = false end
							UIDropDownMenu_Refresh(PetJournalFilterDropDown, 1, 2);
							PetJournalEnhanced:UpdatePets()
						end
			UIDropDownMenu_AddButton(info, level)
			
			for i=1,4 do
				local r,g,b,hex  = GetItemQualityColor(i-1)
				info.notCheckable = false;	
				info.keepShownOnClick = true
				info.checked = false
				info.isNotRadio = true
				info.text = string.format("|c%s%s|r",hex,_G["BATTLE_PET_BREED_QUALITY"..i])
				info.func = 	function(_, _, _, value)
							self.db.filtering.rarity[i] = not self.db.filtering.rarity[i]
							UIDropDownMenu_Refresh(PetJournalFilterDropDown,1,2)
							PetJournalEnhanced:UpdatePets()
						end 
				info.checked = function() return self.db.filtering.rarity[i] end
				UIDropDownMenu_AddButton(info, level)
			end
		end
	end

	if level == 3  then
		if UIDROPDOWNMENU_MENU_VALUE >= 1 and UIDROPDOWNMENU_MENU_VALUE <= ZoneFiltering:GetNumZoneGroups() then
			local info = UIDropDownMenu_CreateInfo()
		
			info.hasArrow = false;
			info.isNotRadio = true;
			info.notCheckable = true;
			info.keepShownOnClick = true
			info.text = CHECK_ALL
			info.func = function()
							ZoneFiltering:SetAllGroupFiltered(UIDROPDOWNMENU_MENU_VALUE,true)
							UIDropDownMenu_Refresh(PetJournalFilterDropDown,1,2)
							PetJournalEnhanced:UpdatePets()
						end
			UIDropDownMenu_AddButton(info, level)
			
			info.text = UNCHECK_ALL
			info.func = function()
							ZoneFiltering:SetAllGroupFiltered(UIDROPDOWNMENU_MENU_VALUE,false)
							UIDropDownMenu_Refresh(PetJournalFilterDropDown,1,2)
							PetJournalEnhanced:UpdatePets()
						end
			UIDropDownMenu_AddButton(info, level)
			
			
			local zoneIDs = ZoneFiltering:GetZoneGroup(UIDROPDOWNMENU_MENU_VALUE)
			for i=1, #zoneIDs do
				local zoneID = zoneIDs[i]
				info.hasArrow = false;
				info.notCheckable = false;	
				info.keepShownOnClick = true
				info.checked = false
				info.isNotRadio = true
				info.text = GetMapNameByID(zoneID)
				info.value = zoneID
				info.func = 	function(_, _, _, value)
							local isEnabled = ZoneFiltering:GetFiltered(zoneID)
							ZoneFiltering:SetFiltered(zoneID,not isEnabled)
							UIDropDownMenu_Refresh(PetJournalFilterDropDown,1,2)
							PetJournalEnhanced:UpdatePets()
						end 
				info.checked = function() return ZoneFiltering:GetFiltered(zoneID) end
				UIDropDownMenu_AddButton(info, level)
			end
		end
	end
end

function Hooked.PetJournalFilterDropDown(self, level)
	Hooked:CreateDropdownMenu(level)
end