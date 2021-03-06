local MogIt,mog = ...;
local L = mog.L;


mog.view = CreateFrame("Frame","MogItPreview",UIParent);
mog.view:SetAllPoints(UIParent);
mog.view:SetScript("OnShow",function(self)
	if #mog.previews == 0 then
		mog:CreatePreview();
	end
end);
tinsert(UISpecialFrames,"MogItPreview");
--ShowUIPanel(mog.view);


function mog:ActivatePreview(preview)
	mog.activePreview = preview;
	_G["MogItPreview"..preview.id.."Bg"]:SetVertexColor(0.8,0.3,0.8);
	preview.activate:Disable();
	for k,v in ipairs(mog.previews) do
		if v ~= preview then
			_G["MogItPreview"..v.id.."Bg"]:SetVertexColor(1,1,1);
			v.activate:Enable();
		end
	end
	if mog.db.profile.gridDress == "preview" then
		mog.scroll:update();
	end
end


--// Preview Functions
local function raiseAll(self, ...)
	local newLevel = self:GetFrameLevel() + 1
	for i = 1, select("#", ...) do
		select(i, ...):SetFrameLevel(newLevel)
	end
end

local function stopMovingOrSizing(self)
	self:StopMovingOrSizing();
	local frameProps = mog.db.profile.previewProps[self:GetID()];
	frameProps.point, frameProps.x, frameProps.y = select(3, self:GetPoint());
end

local function resizeOnMouseDown(self)
	local f = self:GetParent();
	f:SetMinResize(335,385);
	f:SetMaxResize(GetScreenWidth(),GetScreenHeight());
	f:StartSizing();
end

local function resizeOnMouseUp(self)
	local f = self:GetParent();
	f:StopMovingOrSizing();
	local frameProps = mog.db.profile.previewProps[f:GetID()];
	frameProps.w, frameProps.h = f:GetSize();
	-- anchors may change from resizing
	frameProps.point, frameProps.x, frameProps.y = select(3, f:GetPoint());
end

local function modelOnMouseWheel(self,v)
	local delta = ((v > 0 and 0.6) or -0.6);
	if mog.db.profile.sync then
		mog.posZ = mog.posZ + delta;
		for id,model in ipairs(mog.models) do
			mog:PositionModel(model);
		end
		for id,preview in ipairs(mog.previews) do
			mog:PositionModel(preview.model);
		end
	else
		self.parent.data.posZ = (self.parent.data.posZ or mog.posZ or 0) + delta;
		mog:PositionModel(self);
	end
end

local function slotTexture(f,slot,texture)
	SetItemButtonTexture(f.slots[slot],texture or select(2,GetInventorySlotInfo(slot)));
end

local function slotOnEnter(self)
	if self.item then
		mog.ShowItemTooltip(self, self.item);
	else
		GameTooltip:SetOwner(self,"ANCHOR_RIGHT");
		GameTooltip:SetText(_G[strupper(self.slot)]);
	end
end

local function slotOnLeave(self)
	GameTooltip:Hide();
end

local function slotOnClick(self,btn)
	if btn == "RightButton" and IsControlKeyDown() then
		local preview = self:GetParent();
		mog.view.DelItem(self.slot,preview);
		if mog.db.profile.gridDress == "preview" and mog.activePreview == preview then
			mog.scroll:update();
		end
		slotOnEnter(self);
	else
		mog.Item_OnClick(self,btn,self);
	end
end

local function previewOnClose(self)
	if mog.db.profile.singlePreview then
		mog.view:Hide();
	else
		StaticPopup_Show("MOGIT_PREVIEW_CLOSE", nil, nil, self:GetParent());
	end
end

local function previewActivate(self)
	mog:ActivatePreview(self:GetParent());
end
--//


--// Preview Menu
local currentPreview;

local function setDisplayModel(self, arg1, value)
	currentPreview.data[arg1] = value;
	local model = currentPreview.model;
	model:ResetModel();
	model:Undress();
	mog.DressFromPreview(model, currentPreview);
	CloseDropDownMenus(1);
end

local previewMenu = {
	{
		text = RACE,
		value = "race",
		notCheckable = true,
		hasArrow = true,
	},
	{
		text = L["Gender"],
		value = "gender",
		notCheckable = true,
		hasArrow = true,
	},
	{
		text = L["Add Item"],
		notCheckable = true,
		func = function(self)
			StaticPopup_Show("MOGIT_PREVIEW_ADDITEM", nil, nil, currentPreview);
		end,
	},
	{
		text = L["Chat Link"],
		notCheckable = true,
		func = function(self)
			local tbl = {};
			for k, v in pairs(currentPreview.slots) do
				if v.item then
					table.insert(tbl, v.item);
				end
			end
			ChatEdit_InsertLink(mog:SetToLink(tbl, currentPreview.data.displayRace, currentPreview.data.displayGender));
			--ChatFrame_OpenChat(link);
		end,
	},
	{
		text = L["Import / Export"],
		notCheckable = true,
		func = function(self)
			StaticPopup_Show("MOGIT_PREVIEW_IMPORT", nil, nil, currentPreview);
		end,
	},
	{
		text = L["Equip current gear"],
		notCheckable = true,
		func = function(self)
			for k, v in pairs(currentPreview.slots) do
				mog.view.DelItem(k, currentPreview);
				local slotID = GetInventorySlotInfo(k);
				local item = mog.mogSlots[slotID] and select(6, GetTransmogrifySlotInfo(slotID)) or GetInventoryItemID("player", slotID)
				mog.view.AddItem(item, currentPreview);
			end
			if mog.activePreview == currentPreview and mog.db.profile.gridDress == "preview" then
				mog.scroll:update();
			end
		end,
	},
	{
		text = L["Clear"],
		notCheckable = true,
		func = function(self)
			mog.view:Undress(currentPreview);
			if mog.activePreview == currentPreview and mog.db.profile.gridDress == "preview" then
				mog.scroll:update();
			end
		end,
	},
}

local function previewInitialize(self, level)
	if level == 1 then
		currentPreview = self.parent;
		
		for i, info in ipairs(previewMenu) do
			UIDropDownMenu_AddButton(info, level);
		end
	elseif self.tier[2] == "race" then
		mog:CreateRaceMenu(level, setDisplayModel, self.parent.data.displayRace)
	elseif self.tier[2] == "gender" then
		mog:CreateGenderMenu(level, setDisplayModel, self.parent.data.displayGender)
	end
end
--//


--// Save Menu
local newSet = {items = {}}

local function onClick(self)
	newSet.name = self.value
	wipe(newSet.items)
	for slot, v in pairs(currentPreview.slots) do
		newSet.items[slot] = v.item
	end
	StaticPopup_Show("MOGIT_WISHLIST_OVERWRITE_SET", self.value, nil, newSet)
end

local function newSetOnClick(self)
	wipe(newSet.items)
	newSet.name = "Set "..(#mog.wishlist:GetSets() + 1)
	for slot, v in pairs(currentPreview.slots) do
		newSet.items[slot] = v.item
	end
	StaticPopup_Show("MOGIT_WISHLIST_CREATE_SET", nil, nil, newSet)
end

local function saveInitialize(self, level)
	currentPreview = self.parent;
	
	mog.wishlist:AddSetMenuItems(level, onClick)
	
	local info = UIDropDownMenu_CreateInfo()
	info.text = L["New set"]
	info.func = newSetOnClick
	info.colorCode = GREEN_FONT_COLOR_CODE
	info.notCheckable = true
	UIDropDownMenu_AddButton(info, level)
end
--//


--// Load Menu
local function onClick(self, profile)
	mog:AddToPreview(mog.wishlist:GetSetItems(self.value, profile), currentPreview)
	CloseDropDownMenus()
end

local function loadInitialize(self, level)
	currentPreview = self.parent;
	
	if level == 1 then
		mog.wishlist:AddSetMenuItems(level, onClick)
		
		local info = UIDropDownMenu_CreateInfo()
		info.text = L["Other profiles"]
		info.hasArrow = true
		info.notCheckable = true
		UIDropDownMenu_AddButton(info, level)
	elseif level == 2 then
		local curProfile = mog.wishlist:GetCurrentProfile()
		for i, profile in ipairs(mog.wishlist:GetProfiles()) do
			if profile ~= curProfile and mog.wishlist:GetSets(profile) then
				local info = UIDropDownMenu_CreateInfo()
				info.text = profile
				info.hasArrow = true
				info.notCheckable = true
				UIDropDownMenu_AddButton(info, level)
			end
		end
	elseif level == 3 then
		mog.wishlist:AddSetMenuItems(level, onClick, UIDROPDOWNMENU_MENU_VALUE, UIDROPDOWNMENU_MENU_VALUE)
	end
end;
--//


--// Toolbar
local function helpOnEnter(self)
	self.nt:SetTexture(1,0.82,0,1);
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT");
	GameTooltip:AddLine(L["How to use"]);
	GameTooltip:AddLine(" ");
	GameTooltip:AddLine(L["Basic Controls"]);
	GameTooltip:AddLine(L["Left click and drag horizontally to rotate"],1,1,1);
	GameTooltip:AddLine(L["Left click and drag vertically to zoom"],1,1,1);
	GameTooltip:AddLine(L["Right click and drag to move"],1,1,1);
	GameTooltip:AddLine(L["Click the bottom right corner and drag to resize"],1,1,1);
	GameTooltip:AddLine(L["Click the \"Activate\" button to set this as the active preview"],1,1,1);
	GameTooltip:AddLine(" ");
	GameTooltip:AddLine(L["Slot Controls"]);
	GameTooltip:AddLine(L["Shift + Left click to link an item to chat"],1,1,1);
	GameTooltip:AddLine(L["Ctrl + Left click to try on an item"],1,1,1);
	GameTooltip:AddLine(L["Right click to show the item menu"],1,1,1);
	GameTooltip:AddLine(L["Shift + Right click to show a URL for the item"],1,1,1);
	GameTooltip:AddLine(L["Ctrl + Right click to remove the item from the preview"],1,1,1);
	GameTooltip:Show();
end

local function helpOnLeave(self)
	GameTooltip:Hide();
	self.nt:SetTexture(0,0,0,0);
end

local function createMenuBar(parent)
	local menuBar = mog.CreateMenuBar(parent)
	
	menuBar.preview = menuBar:CreateMenu(L["Preview"], previewInitialize);
	menuBar.preview:SetPoint("TOPLEFT", parent, 62, -31);

	menuBar.load = menuBar:CreateMenu(L["Load"], loadInitialize);
	menuBar.load:SetPoint("LEFT", menuBar.preview, "RIGHT", 5, 0);
	
	menuBar.save = menuBar:CreateMenu(L["Save"], saveInitialize);
	menuBar.save:SetPoint("LEFT", menuBar.load, "RIGHT", 5, 0);
	
	menuBar.help = menuBar:CreateMenu(L["Help"]);
	menuBar.help:SetPoint("LEFT", menuBar.save, "RIGHT", 5, 0);
	menuBar.help:SetScript("OnEnter",helpOnEnter);
	menuBar.help:SetScript("OnLeave",helpOnLeave);
end
--//


--// Preview Frame
local function initPreview(frame, id)
	frame:SetID(id);
	local props = mog.db.profile.previewProps[id];
	frame:ClearAllPoints();
	frame:SetPoint(props.point, props.x, props.y);
	frame:SetSize(props.w, props.h);
	frame.TitleText:SetText(L["Preview %d"]:format(id));
	frame.data = {
		displayRace = mog.playerRace,
		displayGender = mog.playerGender,
	};
end

mog.previews = {};
mog.previewBin = {};
mog.previewNum = 0;

function mog:CreatePreview()
	if mog.previewBin[1] then
		local f = mog.previewBin[1];
		local leastIndex = #mog.previews + 1;
		-- find the lowest unused frame ID
		for i, v in ipairs(self.previewBin) do
			leastIndex = min(v.id, leastIndex);
		end
		initPreview(f, leastIndex);
		f:Show();
		mog:ActivatePreview(f);
		tremove(mog.previewBin,1);
		tinsert(mog.previews, f);
		return f;
	end
	
	mog.previewNum = mog.previewNum + 1;
	local f = CreateFrame("Frame", "MogItPreview"..mog.previewNum, mog.view, "ButtonFrameTemplate");
	f.id = mog.previewNum;
	initPreview(f, f.id);
	
	f:SetToplevel(true);
	f:SetClampedToScreen(true);
	f:EnableMouse(true);
	f:SetMovable(true);
	f:SetResizable(true);
	f:Raise();
	
	_G["MogItPreview"..f.id.."CloseButton"]:SetScript("OnClick",previewOnClose);
	--_G["MogItPreview"..f.id.."Bg"]:SetVertexColor(0.8,0.3,0.8);
	ButtonFrameTemplate_HidePortrait(f);
	
	f.resize = CreateFrame("Button", nil, f);
	f.resize:SetSize(16, 16);
	f.resize:SetPoint("BOTTOMRIGHT", -4, 3);
	f.resize:EnableMouse(true);
	f.resize:SetHitRectInsets(0, -4, 0, -3)
	f.resize:SetScript("OnMouseDown", resizeOnMouseDown);
	f.resize:SetScript("OnMouseUp", resizeOnMouseUp);
	f.resize:SetScript("OnHide", resizeOnMouseUp);
	f.resize:SetNormalTexture([[Interface\ChatFrame\UI-ChatIM-SizeGrabber-Up]]);
	f.resize:SetPushedTexture([[Interface\ChatFrame\UI-ChatIM-SizeGrabber-Down]])
	f.resize:SetHighlightTexture([[Interface\ChatFrame\UI-ChatIM-SizeGrabber-Highlight]])
	
	f.slots = {};
	for i = 1, 13 do
		local slotIndex = mog:GetSlot(i);
		local slot = CreateFrame("Button", "MogItPreview"..f.id..slotIndex, f, "ItemButtonTemplate");
		slot.slot = slotIndex;
		if i == 1 then
			slot:SetPoint("TOPLEFT", f.Inset, "TOPLEFT", 8, -8);
		elseif i == 8 then
			slot:SetPoint("TOPRIGHT", f.Inset, "TOPRIGHT", -7, -8);
		elseif i == 12 then
			slot:SetPoint("TOP", f.slots[mog:GetSlot(11)], "BOTTOM", 0, -45);
		else
			slot:SetPoint("TOP", f.slots[mog:GetSlot(i-1)], "BOTTOM", 0, -4);
		end
		slot:RegisterForClicks("AnyUp");
		slot:SetScript("OnClick", slotOnClick);
		slot:SetScript("OnEnter", slotOnEnter);
		slot:SetScript("OnLeave", slotOnLeave);
		slot.OnEnter = slotOnEnter;
		f.slots[slotIndex] = slot;
		slotTexture(f, slotIndex);
	end
	
	f.model = mog:CreateModelFrame(f);
	f.model.type = "preview";
	f.model:Show();
	f.model:EnableMouseWheel(true);
	f.model:SetScript("OnMouseWheel", modelOnMouseWheel);
	f.model:SetPoint("TOPLEFT", f.Inset, "TOPLEFT", 49, -8);
	f.model:SetPoint("BOTTOMRIGHT", f.Inset, "BOTTOMRIGHT", -49, 8);
	
	f.activate = CreateFrame("Button", "MogItPreview"..f.id.."Activate", f, "MagicButtonTemplate");
	f.activate:SetText(L["Activate"]);
	f.activate:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", 5, 5);
	f.activate:SetWidth(100);
	f.activate:SetScript("OnClick", previewActivate);
	
	f:SetScript("OnMouseDown", f.StartMoving);
	f:SetScript("OnMouseUp", stopMovingOrSizing);
	
	createMenuBar(f);
	mog:ActivatePreview(f);
	
	-- child frames occasionally appears behind the parent for whatever reason, so we raise them here
	raiseAll(f, f:GetChildren())
	
	tinsert(mog.previews, f);
	return f;
end

function mog:DeletePreview(f)
	f:Hide();
	f:ClearAllPoints();
	f:SetPoint("CENTER",mog.view,"CENTER");
	mog.view:Undress(f);
	wipe(f.data);
	tinsert(mog.previewBin,f);
	for k,v in ipairs(mog.previews) do
		if v == f then
			tremove(mog.previews,k);
			break;
		end
	end
	if mog.activePreview == f then
		mog.activePreview = nil;
		if mog.db.profile.gridDress == "preview" then
			mog.scroll:update();
		end
	end
	if #mog.previews == 0 then
		HideUIPanel(mog.view);
	end
end

function mog:GetPreview(frame)
	if self.db.profile.singlePreview then
		frame = self.previews[1];
	end

	return frame or self:CreatePreview();
end

local doCache = {};
mog:AddItemCacheCallback("PreviewAddItem", function()
	for i = #doCache, 1, -1 do
		local item = doCache[i]
		if GetItemInfo(item.id) then
			mog.view.AddItem(item.id, item.frame);
			tremove(doCache, i)
		end
	end
end)

local playerClass = select(2, UnitClass("PLAYER"));

function mog.view.AddItem(item, preview, forceSlot)
	if not (item and preview) then return end;
	
	local invType, texture = select(9, mog:GetItemInfo(item, "PreviewAddItem"));
	if not invType then
		tinsert(doCache, {id = item, frame = preview});
		return;
	end
	
	local slot = mog:GetSlot(invType)
	if type(forceSlot) == "string" then
		slot = forceSlot
	end
	if slot then
		if slot == "MainHandSlot" or slot == "SecondaryHandSlot" then
			if invType == "INVTYPE_2HWEAPON" then
				if playerClass == "WARRIOR" and IsSpellKnown(46917) then
					-- Titan's Grip exists in the spellbook, so we can treat this weapon as one handed
					invType = "INVTYPE_WEAPON";
				end
			end
			
			if invType == "INVTYPE_WEAPON" then
				-- put one handed weapons in the off hand if: main hand is occupied, off hand is free and a two handed weapon isn't equipped
				if preview.slots["MainHandSlot"].item and not preview.slots["SecondaryHandSlot"].item and not preview.data.twohand then
					slot = "SecondaryHandSlot"
				end
			end
			
			if invType == "INVTYPE_2HWEAPON" or invType == "INVTYPE_RANGED" or invType == "INVTYPE_RANGEDRIGHT" then
				-- if any two handed weapon is being equipped, first clear up both hands
				mog.view.DelItem("MainHandSlot", preview);
				mog.view.DelItem("SecondaryHandSlot", preview);
				preview.data.twohand = true;
			elseif preview.data.twohand then
				preview.data.twohand = false;
				if slot == "MainHandSlot" then
					mog.view.DelItem("SecondaryHandSlot", preview);
				elseif slot == "SecondaryHandSlot" then
					mog.view.DelItem("MainHandSlot", preview);
				end
			end
		end
		
		preview.slots[slot].item = item;
		slotTexture(preview, slot, texture);
		if preview:IsVisible() then
			preview.model:TryOn(item, slot);
		end
	end
end

function mog.view.DelItem(slot,preview)
	if not (preview and slot) then return end;
	preview.slots[slot].item = nil;
	slotTexture(preview,slot);
	if preview:IsVisible() then
		preview.model.model:UndressSlot(GetInventorySlotInfo(slot));
	end
end

function mog:AddToPreview(item,preview)
	if not item then return end;
	preview = mog:GetPreview(preview or mog.activePreview);
	
	ShowUIPanel(mog.view);
	if type(item) == "number" then
		mog.view.AddItem(item,preview);
	elseif type(item) == "string" then
		mog.view.AddItem(tonumber(item:match("item:(%d+)")),preview);
	elseif type(item) == "table" then
		mog.view:Undress(preview);
		for k,v in pairs(item) do
			mog.view.AddItem(v,preview,k);
		end
	end
	
	if mog.db.profile.gridDress == "preview" and mog.activePreview == preview then
		mog.scroll:update();
	end
	
	return preview;
end

function mog.view:Undress(preview)
	for k, v in pairs(preview.slots) do
		mog.view.DelItem(k, preview);
	end
end
--//


--// Hooks
if not ModifiedItemClickHandlers then
	ModifiedItemClickHandlers = {};
	
	local origHandleModifiedItemClick = HandleModifiedItemClick;
	
	function HandleModifiedItemClick(link)
		if not link then
			return false;
		end
		for i, v in ipairs(ModifiedItemClickHandlers) do
			if v(link) then
				return true;
			end
		end
		return origHandleModifiedItemClick(link);
	end
end

tinsert(ModifiedItemClickHandlers, function(link)
	if IsControlKeyDown() and GetMouseButtonClicked() == "RightButton" then
		mog:AddToPreview(link);
		return true;
	end
end);

local function hookInspectUI()
	local function inspect_OnClick(self, button)
		if InspectFrame.unit and self.hasItem and IsControlKeyDown() and button == "RightButton" then
			mog:AddToPreview(GetInventoryItemID(InspectFrame.unit, GetInventorySlotInfo(self:GetID())));
		end
	end
	for k, v in ipairs(mog.slots) do
		_G["Inspect"..v]:RegisterForClicks("AnyUp");
		_G["Inspect"..v]:HookScript("OnClick", inspect_OnClick);
	end
	hookInspectUI = nil;
end

if InspectFrame then
	hookInspectUI();
else
	mog.view:SetScript("OnEvent",function(self,event,addon)
		if addon == "Blizzard_InspectUI" then
			hookInspectUI();
			self:UnregisterEvent(event);
			self:SetScript("OnEvent", nil);
		end
	end);
	mog.view:RegisterEvent("ADDON_LOADED");
end

local old_SetItemRef = SetItemRef;
function SetItemRef(link, text, button, ...)
	local id = tonumber(link:match("^item:(%d+)"));
	if id and IsControlKeyDown() and button == "RightButton" then
		mog:AddToPreview(id);
	else
		return old_SetItemRef(link, text, button, ...);
	end
end
--//


--// Popups
local function onAccept(self,preview)
	local text = self.editBox:GetText();
	text = text and text:match("(%d+).-$");
	mog:AddToPreview(tonumber(text),preview);
end

StaticPopupDialogs["MOGIT_PREVIEW_ADDITEM"] = {
	text = L["Type the item ID or url in the text box below"],
	button1 = ADD,
	button2 = CANCEL,
	hasEditBox = 1,
	maxLetters = 512,
	editBoxWidth = 260,
	OnAccept = onAccept,
	EditBoxOnEnterPressed = function(self, data)
		local parent = self:GetParent();
		onAccept(parent, data);
		parent:Hide();
	end,
	EditBoxOnEscapePressed = function(self)
		self:GetParent():Hide();
	end,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
};

local function onAccept(self,preview)
	local items = self.editBox:GetText();
	items = items and items:match("compare%?items=([^;#]+)");
	if items then
		local tbl = {};
		for item in items:gmatch("([^:]+)") do
			item = item:match("^(%d+)");
			table.insert(tbl,tonumber(item));
		end
		mog:AddToPreview(tbl,preview);
	end
end

StaticPopupDialogs["MOGIT_PREVIEW_IMPORT"] = {
	text = L["Copy and paste a Wowhead Compare URL into the text box below to import"],
	button1 = L["Import"],
	button2 = CANCEL,
	hasEditBox = 1,
	maxLetters = 512,
	editBoxWidth = 260,
	OnShow = function(self,preview)
		local str;
		for k,v in pairs(preview.slots) do
			if v.item then
				if str then
					str = str..":"..v.item;
				else
					str = L["http://www.wowhead.com/"].."compare?items="..v.item;
				end
			end
		end
		self.editBox:SetText(str or "");
		self.editBox:HighlightText();
	end,
	OnAccept = onAccept,
	EditBoxOnEnterPressed = function(self, data)
		local parent = self:GetParent();
		onAccept(parent, data);
		parent:Hide();
	end,
	EditBoxOnEscapePressed = function(self)
		self:GetParent():Hide();
	end,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
};

StaticPopupDialogs["MOGIT_PREVIEW_CLOSE"] = {
	text = L["Are you sure you want to close this set?"],
	button1 = YES,
	button2 = NO,
	OnAccept = function(self, frame)
		mog:DeletePreview(frame);
	end,
	hideOnEscape = true,
	whileDead = true,
	timeout = 0,
}
--//


--[[
One-Handed Weapon Logic
- First goes into main hand, then alternates
- Equipping 2h weapon causes to next to go into main hand
- Equipping a right handed ranged weapon (gun, crossbow, thrown) will cause the next two one hand weapons to go into main hand (above rule still applies)
]]