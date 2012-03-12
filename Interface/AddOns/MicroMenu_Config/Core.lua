if not _G[...] then return end
local addon = _G[...]

local buttons, order = addon.buttons, addon.order

local addonName, L = addon.addonName, addon.L

--[[-----------------------------------------------------------------------------
Helper functions
-------------------------------------------------------------------------------]]
local function Get(info)
	return addon.db.profile[info[#info]]
end

local function GetButtonStatus(info)
	return buttons[info[#info]].order
end

local function GetColor(info)
	local field, settings = info[#info], addon.db.profile
	return settings[field .. "R"], settings[field .. "G"], settings[field .. "B"], settings[field .. "A"]
end

local function Set(info, value)
	addon.db.profile[info[#info]] = value
end

local function SetButtonStatus(info, value)
	local id = buttons[info[#info]].id
	if not value then
		for index = 1, #order do
			if order[index] == id then
				tremove(order, index)
				break
			end
		end
		id = #order < 1 and 1 or nil
	end
	if id then
		order[#order + 1] = id
	end
	addon:CopyOrderToButtons()
	addon:UpdatePlugin()
end

local function SetColor(info, ...)
	local field, settings = info[#info], addon.db.profile
	settings[field .. "R"], settings[field .. "G"], settings[field .. "B"], settings[field .. "A"] = ...
	addon:ApplyPluginSettings()
end

local function SetWithRefresh(info, value)
	addon.db.profile[info[#info]] = value
	addon:ApplyPluginSettings()
end

--[[-----------------------------------------------------------------------------
Options
-------------------------------------------------------------------------------]]
local options = {
	type = 'group', childGroups = 'tab',
	args = {
		generalTab = {
			type = 'group',
			order = 1,
			name = L["General"],
			get = GetButtonStatus,
			set = SetButtonStatus,
			args = {
				lock = {
					type = 'toggle',
					order = 1,
					name = L["Button Lock"],
					desc = L["Determines whether or not the buttons can be dragged by the mouse to be rearranged."],
					get = Get,
					set = Set
				},
				spacing = {
					type = 'range',
					order = 2,
					name = L["Button Spacing"],
					desc = L["Set the amount of space between the buttons."],
					min = 0, max = 8, step = 1,
					get = Get,
					set = SetWithRefresh,
				},
				latency = {
					type = 'range',
					order = 3,
					name = L["Latency Indicator"],
					desc = L["The computer screen on the Game Menu button changes color to indicate latency. This value determines the point at which it will be red."],
					min = 100, max = 1000, step = 10,
					disabled = function(info)
						return not buttons[MAINMENU_BUTTON].order
					end,
					get = Get,
					set = function(info, value)
						Set(info, value)
						buttons[MAINMENU_BUTTON]:GetScript('OnUpdate')(buttons[MAINMENU_BUTTON], 100)
					end
				},
				tooltip = {
					type = 'select',
					order = 4,
					name = L["Tooltip"],
					desc = L["Set the visibility of the tooltip when mousing over the buttons."],
					values = { [""] = L["Show"], ["Hide"] = L["Hide"], ["[combat] Hide"] = L["Hide in combat"] },
					get = Get,
					set = Set
				},
				header = {
					type = 'header',
					order = 5,
					name = "Buttons"
				},
				reset = {
					type = 'execute',
					order = -1,
					name = L["Reset Order"],
					desc = L["Click to reset the buttons to their default order."],
					func = function()
						table.sort(order)
						addon:CopyOrderToButtons()
						addon:UpdatePlugin()
					end
				}
			}
		}
	}
}

local generalTab, half = options.args.generalTab.args, ceil(#buttons / 2)
for id, button in ipairs(buttons) do
	generalTab[button.title] = {
		type = 'toggle',
		order = 6 + id + id - (id <= half and 1 or half + half),
		name = button.title,
		desc = L["Show the %s button."]:format(button.title)
	}
end

if addon.platform == 'Titan' then
	options.args.titanTab = {
		type = 'group',
		order = 3,
		name = 'Titan',
		args = {
			titanPosition = {
				type = 'toggle',
				order = 1,
				name = L["Right Side"],
				desc = L["Determines if the plugin will appear on it's panel's right side."],
				get = function()
					return TitanGetVar(addonName, 'DisplayOnRightSide')
				end,
				set = function()
					TitanToggleVar(addonName, 'DisplayOnRightSide')
					TitanPanel_RemoveButton(addonName)
					TitanUtils_AddButtonOnBar(TitanUtils_GetWhichBar(addonName) or 'Bar', addonName)
					TitanPanelButton_UpdateButton(addonName)
				end
			},
			titanTooltip = {
				type = 'toggle',
				order = 2,
				name = L["Tooltip"],
				desc = L["Determines if %s's tooltip settings will be used."]:format('Titan'),
				get = Get,
				set = Set
			}
		}
	}
	options.args.generalTab.args.tooltip.disabled = function()
		return addon.db.profile.titanTooltip
	end
elseif addon.platform == 'FuBar' then
	options.args.fubarTab = {
		type = 'group',
		order = 3,
		name = 'FuBar',
		args = {
			fubarPosition = {
				type = 'select',
				order = 1,
				name = L["Panel Position"],
				desc = L["Set the plugin's position within it's panel."],
				values = { L["Left"], L["Center"], L["Right"] },
				get = function(info)
					local position = Get(info)
					return position == 'LEFT' and 1 or position == 'CENTER' and 2 or 3
				end,
				set = function(info, value)
					SetWithRefresh(info, value == 1 and 'LEFT' or value == 2 and 'CENTER' or 'RIGHT')
				end
			},
			fubarTooltip = {
				type = 'toggle',
				order = 2,
				name = L["Tooltip"],
				desc = L["Determines if %s's tooltip settings will be used."]:format('FuBar'),
				get = Get,
				set = Set
			}
		}
	}
	options.args.generalTab.args.tooltip.disabled = function()
		return addon.db.profile.fubarTooltip
	end
elseif not addon.platform then
	local strataLayers = { 'BACKGROUND', 'LOW', 'MEDIUM', 'HIGH', 'DIALOG', 'FULLSCREEN', 'FULLSCREEN_DIALOG' }

	options.args.standaloneTab = {
		type = 'group',
		order = 3,
		name = L["Standalone"],
		get = Get,
		set = SetWithRefresh,
		args = {
			frameLock = {
				type = 'toggle',
				order = 1,
				name = L["Frame Lock"],
				desc = L["Determines whether or not the frame can be dragged by the mouse."],
				width = 'full',
				set = Set
			},
			frameBackground = {
				type = 'color', hasAlpha = true,
				order = 2,
				name = L["Background Color"],
				desc = L["Change the color and transparency of the background."],
				get = GetColor,
				set = SetColor
			},
			frameBorder = {
				type = 'color', hasAlpha = true,
				order = 3,
				name = L["Border Color"],
				desc = L["Change the color and transparency of the border."],
				get = GetColor,
				set = SetColor
			},
			borderSpacing = {
				type = 'range',
				order = 4,
				name = L["Border Spacing"],
				desc = L["Set the amount of space between the buttons and the border."],
				min = 0, max = 8, step = 1
			},
			buttonSize = {
				type = 'range',
				order = 5,
				name = L["Button Size"],
				desc = L["Set the size of the buttons."],
				min = 14, max = 32, step = 1
			},
			header = {
				type = 'header',
				order = 6,
				name = L["Position"]
			},
			anchorPoint = {
				type = 'select',
				order = 7,
				name = L["Anchor Point"],
				desc = L["Set which point of the frame will be used for anchoring."],
				values = { BOTTOM = 'BOTTOM', BOTTOMLEFT = 'BOTTOMLEFT', BOTTOMRIGHT = 'BOTTOMRIGHT', CENTER = 'CENTER', LEFT = 'LEFT', RIGHT = 'RIGHT', TOP = 'TOP', TOPLEFT = 'TOPLEFT', TOPRIGHT = 'TOPRIGHT' },
				set = function(info, value)
					Set(info, value)
					addon.isMoving = true
					addon:OnDragStop()
				end
			},
			reset = {
				type = 'execute',
				order = 8,
				name = L["Reset"],
				desc = L["Click to set the frame flush with it's anchor point."],
				func = function()
					local settings = addon.db.profile
					settings.anchorOffsetX, settings.anchorOffsetY = 0, 0
					addon.frame:ClearAllPoints()
					addon.frame:SetPoint(settings.anchorPoint, UIParent)
				end
			},
			frameStrata = {
				type = 'select',
				order = 9,
				name = L["Frame Strata"],
				desc = L["Set the strata layer of the frame."],
				values = strataLayers,
				get = function(info)
					local value = Get(info)
					for index = 1, #strataLayers do
						if strataLayers[index] == value then
							return index
						end
					end
				end,
				set = function(info, value)
					SetWithRefresh(info, strataLayers[value])
				end
			},
			frameLevel = {
				type = 'range',
				order = 10,
				name = L["Frame Level"],
				desc = L["Set the level of the frame."],
				min = 1, max = 127, step = 1
			}
		}
	}
end

--[[-----------------------------------------------------------------------------
Initialize
-------------------------------------------------------------------------------]]
LibStub('AceConfigRegistry-3.0'):RegisterOptionsTable(addonName, options)

options.args.profilesTab = LibStub('AceDBOptions-3.0'):GetOptionsTable(addon.db)

addon.config:AssignOptions(addonName)
addon.config:SetDesc(L["These options allow you to change the appearance and behavior of %s."]:format(addonName))
addon.config:SetInfo(L["Version: %s"]:format(GetAddOnMetadata(addonName, 'Version')))
