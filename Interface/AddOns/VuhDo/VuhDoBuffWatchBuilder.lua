local _;

local pairs = pairs;
local InCombatLockdown = InCombatLockdown;

local VUHDO_BUFF_PANEL_BASE_HEIGHT = nil;
local VUHDO_BUFF_PANEL_BASE_WIDTH = nil;
local VUHDO_IN_PANEL_HEIGHT;
local VUHDO_PANEL_OFFSET_Y;
local VUHDO_PANEL_OFFSET_X;
local VUHDO_PANEL_WIDTH = 0;
local VUHDO_PANEL_HEIGHT = 0;
local VUHDO_BUFF_PANEL_GAP_X = 4;
local VUHDO_BUFF_PANEL_GAP_TOP = 4;



--
local function VUHDO_addBuffSwatch(aBuffPanel, aGroupName, aBuffInfo, aBuffTarget, aCategSpec)
	if (aBuffInfo == nil) then
		return nil;
	end

	local tBuffName = aBuffInfo[1];
	local tPostfix = tBuffName .. (aBuffTarget or "");

	local tSwatch = VUHDO_getOrCreateBuffSwatch("VuhDoBuffSwatch_" .. tPostfix, aBuffPanel);
	tSwatch:SetAttribute("buff", aBuffInfo);
	tSwatch:SetAttribute("target", aBuffTarget);
	tSwatch:SetAttribute("buffname", aCategSpec);

	_G[tSwatch:GetName() .. "GroupLabelLabel"]:SetText(aGroupName);

	tSwatch:SetPoint("TOPLEFT", aBuffPanel:GetName(), "TOPLEFT", VUHDO_BUFF_PANEL_BASE_WIDTH, -VUHDO_BUFF_PANEL_BASE_HEIGHT);
	tSwatch:SetBackdropBorderColor(VUHDO_backColor(VUHDO_BUFF_SETTINGS["CONFIG"]["SWATCH_BORDER_COLOR"]));
	tSwatch:Show();

	local tButton = _G[tSwatch:GetName() .. "GlassButton"];
	if (tButton:GetAttribute("unit") == nil) then
		VUHDO_setupAllBuffButtonsTo(tButton, tBuffName, "player");
	end

	VUHDO_IN_PANEL_HEIGHT = VUHDO_BUFF_PANEL_BASE_HEIGHT + tSwatch:GetHeight();
	VUHDO_updateBuffSwatch(tSwatch);

	local tIsSingle = VUHDO_isUseSingleBuff(tSwatch);
	if (tIsSingle ~= 2) then
		if (tIsSingle) then
			VUHDO_setupAllBuffButtonsTo(tButton, tBuffName, tSwatch:GetAttribute("lowtarget"));
		else
			VUHDO_setupAllBuffButtonUnits(tButton, tSwatch:GetAttribute("goodtarget"));
		end
	end

	return tSwatch;
end



--
function VUHDO_getBuffInfoForName(aBuffName)
	for _, tCategBuffs in pairs(VUHDO_CLASS_BUFFS[VUHDO_PLAYER_CLASS]) do
		for _, tBuffInfo in pairs(tCategBuffs) do
			if (aBuffName == tBuffInfo[1]) then
				return tBuffInfo;
			end
		end
	end

	return nil;
end



--
local function VUHDO_addBuffPanel(aCategorySpec)
	local tCategName = aCategorySpec;
	local tSettings = VUHDO_BUFF_SETTINGS[tCategName];
	local tCategBuffs = VUHDO_CLASS_BUFFS[VUHDO_PLAYER_CLASS][aCategorySpec];
	local tSampleVariant = tCategBuffs[1];
	local tBuffPanel, tSwatch;
	local tIcon;
	local tTargetType;
	local tIconFrame;
	local tTexture;
	local tLabelText;

	-- Happens on emergency login
	if (VUHDO_BUFFS[tSampleVariant[1]] == nil) then
		return nil;
	end

	tTargetType = tSampleVariant[2];
	tLabelText = VUHDO_BUFF_SETTINGS[tCategName]["buff"] or tSampleVariant[1];
	tBuffPanel = VUHDO_getOrCreateBuffPanel("VuhDoBuffPanel" .. tLabelText);

	if (VUHDO_BUFF_SETTINGS["CONFIG"]["COMPACT"]) then
		VUHDO_BUFF_PANEL_BASE_WIDTH = 24;
		VUHDO_BUFF_PANEL_BASE_HEIGHT = 0;
	else
		VUHDO_BUFF_PANEL_BASE_WIDTH = 0;
		VUHDO_BUFF_PANEL_BASE_HEIGHT = 30;
	end

	tIcon = (VUHDO_BUFFS[tLabelText] ~= nil and VUHDO_BUFFS[tLabelText]["icon"] ~= nil)
		and VUHDO_BUFFS[tLabelText]["icon"]
		or VUHDO_BUFFS[tSampleVariant[1]]["icon"];

	if (tIcon == nil) then
		return nil;
	end

	local tLabel = _G[tBuffPanel:GetName() .. "BuffNameLabelLabel"];
	tLabel:SetText(tLabelText);
	tLabel:SetShown(VUHDO_BUFF_SETTINGS["CONFIG"]["SHOW_LABEL"] and not VUHDO_BUFF_SETTINGS["CONFIG"]["COMPACT"]);

	tIconFrame = _G[tBuffPanel:GetName() .. "IconTexture"];
	tTexture = _G[tIconFrame:GetName() .. "Texture"];
	tTexture:SetTexture(tIcon);

	local tGap = VUHDO_BUFF_SETTINGS["CONFIG"]["COMPACT"] and 0 or 3
	tIconFrame:SetPoint("TOPLEFT", tBuffPanel:GetName(), "TOPLEFT" , tGap, -tGap);

	if (VUHDO_LibButtonFacade ~= nil) then
		VUHDO_LibButtonFacade:Group("VuhDo", VUHDO_I18N_BUFF_WATCH):AddButton(tIconFrame, {
			["Icon"] = tTexture,
		});
	end

	VUHDO_IN_PANEL_HEIGHT = 0;
	tSwatch = nil;

	if (VUHDO_BUFF_TARGET_UNIQUE == tTargetType) then
		if (tSettings["name"] == nil) then
			tSettings["name"] = VUHDO_PLAYER_NAME;
		end
		tSwatch = VUHDO_addBuffSwatch(tBuffPanel, tSettings["name"], tCategBuffs[1], "N" .. tSettings["name"], aCategorySpec);
	else
		local tVariants = VUHDO_getBuffInfoForName(tSettings["buff"]) or VUHDO_getBuffInfoForName(tSampleVariant[1]);
		if (tVariants ~= nil) then
			tSwatch = VUHDO_addBuffSwatch(tBuffPanel, VUHDO_I18N_PLAYER, tVariants, "S", aCategorySpec);
		end
	end

	if (tSwatch ~= nil) then
		tBuffPanel:SetPoint("TOPLEFT", "VuhDoBuffWatchMainFrame", "TOPLEFT", VUHDO_PANEL_OFFSET_X, -VUHDO_PANEL_OFFSET_Y);
		tBuffPanel:SetWidth(tSwatch:GetWidth() + VUHDO_BUFF_PANEL_BASE_WIDTH);
		tBuffPanel:SetHeight(VUHDO_IN_PANEL_HEIGHT);
		_G[tBuffPanel:GetName() .. "BuffNameLabel"]:SetWidth(tBuffPanel:GetWidth() - 30);
		tBuffPanel:Show();
	end

	return tBuffPanel;
end



--
local function VUHDO_addAllBuffPanels()
	local tAllClassBuffs = VUHDO_CLASS_BUFFS[VUHDO_PLAYER_CLASS];
	local tBuffPanel;
	local tColPanels;
	local tNumber;

	VUHDO_PANEL_OFFSET_Y = VUHDO_BUFF_PANEL_GAP_TOP;
	VUHDO_PANEL_OFFSET_X = VUHDO_BUFF_PANEL_GAP_X;
	VUHDO_PANEL_HEIGHT = VUHDO_BUFF_PANEL_GAP_TOP;
	VUHDO_PANEL_WIDTH = VUHDO_BUFF_PANEL_GAP_X;
	VUHDO_IN_GRID_MAX_X = 0;

	tColPanels = 0;
	local tIndex = 0;

	for _, _ in pairs(tAllClassBuffs) do
		for tCategName, _ in pairs(tAllClassBuffs) do

			tNumber = VUHDO_BUFF_ORDER[tCategName];
			if (tNumber == tIndex + 1) then
				tIndex = tIndex + 1;
				if ((VUHDO_BUFF_SETTINGS[tCategName] or { })["enabled"]) then

					tBuffPanel = VUHDO_addBuffPanel(tCategName);
					if (tBuffPanel ~= nil) then
						tColPanels = tColPanels + 1;

						VUHDO_PANEL_OFFSET_Y = VUHDO_PANEL_OFFSET_Y + VUHDO_IN_PANEL_HEIGHT;

						if (VUHDO_PANEL_OFFSET_Y > VUHDO_PANEL_HEIGHT) then
							VUHDO_PANEL_HEIGHT = VUHDO_PANEL_OFFSET_Y;
						end

						if (VUHDO_PANEL_OFFSET_X > VUHDO_PANEL_WIDTH) then
							VUHDO_PANEL_WIDTH = VUHDO_PANEL_OFFSET_X;
						end

						if (tColPanels >= VUHDO_BUFF_SETTINGS["CONFIG"]["PANEL_MAX_BUFFS"]) then
							VUHDO_PANEL_OFFSET_Y = VUHDO_BUFF_PANEL_GAP_TOP;
							VUHDO_PANEL_OFFSET_X = VUHDO_PANEL_OFFSET_X + tBuffPanel:GetWidth();
							VUHDO_IN_GRID_MAX_X = 0;

							tColPanels = 0;
						end
					end
				end

			end
		end
	end

	if (tBuffPanel ~= nil) then
		VUHDO_PANEL_WIDTH = VUHDO_PANEL_WIDTH + tBuffPanel:GetWidth();
	end
end




--
function VUHDO_reloadBuffPanel()
	if (InCombatLockdown()) then
		return;
	end

	if (VUHDO_BUFF_SETTINGS["CONFIG"] == nil) then
		if (VuhDoBuffWatchMainFrame ~= nil) then
			VuhDoBuffWatchMainFrame:Hide();
		end
		return;
	end

	VUHDO_resetBuffSwatchInfos();
	VUHDO_resetAllBuffPanels();

	if (VUHDO_CLASS_BUFFS[VUHDO_PLAYER_CLASS] == nil) then
		return;
	end

	if (VuhDoBuffWatchMainFrame == nil) then
		CreateFrame("Frame", "VuhDoBuffWatchMainFrame", UIParent, "VuhDoBuffWatchMainFrameTemplate");
	end

	VUHDO_addAllBuffPanels();

	if (VUHDO_PANEL_HEIGHT < 10) then
		VUHDO_PANEL_HEIGHT = 24;
		VUHDO_PANEL_WIDTH = 150;
		VuhDoBuffWatchMainFrameInfoLabel:Show();
	else
		VuhDoBuffWatchMainFrameInfoLabel:Hide();
	end

	VuhDoBuffWatchMainFrame:ClearAllPoints();
	local tPosition = VUHDO_BUFF_SETTINGS["CONFIG"]["POSITION"];
	VuhDoBuffWatchMainFrame:SetPoint(tPosition["point"], "UIParent", tPosition["relativePoint"], tPosition["x"], tPosition["y"]);
	VuhDoBuffWatchMainFrame:SetWidth(VUHDO_PANEL_WIDTH + VUHDO_BUFF_PANEL_GAP_X);
	VuhDoBuffWatchMainFrame:SetHeight(VUHDO_PANEL_HEIGHT + VUHDO_BUFF_PANEL_GAP_TOP);
	VuhDoBuffWatchMainFrame:SetBackdropColor(VUHDO_backColor(VUHDO_BUFF_SETTINGS["CONFIG"]["PANEL_BG_COLOR"]));
	VuhDoBuffWatchMainFrame:SetBackdropBorderColor(VUHDO_backColor(VUHDO_BUFF_SETTINGS["CONFIG"]["PANEL_BORDER_COLOR"]));
	VuhDoBuffWatchMainFrame:SetScale(VUHDO_BUFF_SETTINGS["CONFIG"]["SCALE"]);

	if (VUHDO_BUFF_SETTINGS["CONFIG"]["SHOW"]) then
		VuhDoBuffWatchMainFrame:Show();
		if (VUHDO_LibButtonFacade ~= nil) then
			VUHDO_LibButtonFacade:Group("VuhDo", VUHDO_I18N_BUFF_WATCH):Skin(VUHDO_BUFF_SETTINGS["CONFIG"]["BUTTON_FACADE"]);
		end
	else
		VuhDoBuffWatchMainFrame:Hide();
	end
end
