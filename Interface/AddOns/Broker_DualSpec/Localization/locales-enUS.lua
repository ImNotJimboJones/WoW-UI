﻿-- ********************************************************************************
-- Data Broker Dual Specilisation (Broker_DualSpec)
-- A dual specialisation switch for Data Broker.
-- By: Shenton
--
-- Locales-enUS.lua
-- ********************************************************************************

local L = LibStub("AceLocale-3.0"):NewLocale("Broker_DualSpec", "enUS", true);

if L then
L["NOT_AVAILABLE"] = "Not available";
L["ADDON_NAME"] = "DualSpec";
L["CLOSE"] = "Close";
L["PRIMARY_SPEC"] = "Primary spec";
L["SECONDARY_SPEC"] = "Secondary spec";
L["GEAR_SETS"] = "Gear sets";
L["OPTIONS"] = "Options";
L["DISPLAY_SPEC_NAME"] = "Display spec name";
L["DISPLAY_SPEC_POINTS"] = "Display spec points";
L["SWITCH_GEAR_TOO"] = "Switch gear too";
L["NO_GEAR_SETS"] = "You got no gear set defined";
L["IN_COMBAT"] = "You are in combat, unable to switch your specialisation";
L["NO_GEAR_DEFINED"] = "Switching gear with specialisation is enabled but no set is defined";
L["SHOW_HIDE_MINIMAP"] = "Show/Hide minimap icon";
L["HIDE_MINIMAP"] = "Minimap icon is hidden if you want to show it back use: \"/ds show\" (or /bds /brokerdualspec)";
L["CURRENT_SPEC"] = "Current spec";
L["SWITCH_TO"] = "Switch to";
L["WITH_GEAR_SET"] = "With gear set";
L["GEAR_NOT_EXISTS"] = "That gear set do not exists, use \"/ds list\" to get them";
L["COMMAND_USAGE_1"] = "Command usage, \"/ds\", \"/bds\", \"/brokerdualspec\"";
L["COMMAND_USAGE_2"] = "With no argument it will change your specialisation";
L["COMMAND_USAGE_3"] = "\"/ds show\", show the minimap icon, \"/ds list\", list your gear sets";
L["COMMAND_USAGE_4"] = "\"/ds <primary|secondary> <gear set>\", will set the given specialisation with the given gear set";
L["TOOLTIP_TIPS"] = "%sLeft-Click:%s Switch your specialisation and gear if enabled\n%sRight-Click:%s Display the configuration menu"; -- 1st %s warrior color, 2nd green color, etc
end
