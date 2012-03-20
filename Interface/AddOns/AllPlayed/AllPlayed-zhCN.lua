-- AllPlayed-zhCN.lua
-- $Id: AllPlayed-zhCN.lua 227 2010-10-03 05:49:57Z LaoTseu $
if not AllPlayed_revision then AllPlayed_revision = {} end
AllPlayed_revision.zhCN	= ("$Revision: 227 $"):match("(%d+)")

local L = LibStub("AceLocale-3.0"):NewLocale("AllPlayed", "zhCN")
if not L then return end

-- Generated from http://www.wowace.com/addons/all-played-laotseu/localization/
-- Translators: RoyalHawk, Mars1491 and wowuicn

L["% opacity of the tooltip background"] = "\230\152\190\231\164\186\228\191\161\230\129\175\232\131\140\230\153\175\228\184\141\233\128\143\230\152\142\229\186\166"
L["%.1f K XP"] = "%.1f \229\141\131\231\187\143\233\170\140"
L["%.1f M XP"] = "%.1f \231\153\190\228\184\135\231\187\143\233\170\140"
L["%d XP"] = "%d \231\187\143\233\170\140"
L["%d rested XP"] = "%d \229\143\140\229\128\141\231\187\143\233\170\140\229\128\188"
-- L["%s %s characters "] = ""
-- L["%s (%s or %s)"] = ""
-- L["%s (%s)"] = ""
L["%s : %s"] = true
L["%s AP"] = "%s \230\148\187\229\135\187\229\188\186\229\186\166"
-- L["%s CP"] = ""
L["%s HK"] = "%s \230\179\149\230\156\175\232\131\189\233\135\143"
L["%s HP"] = "%s \232\161\128\233\135\143"
-- L["%s JP"] = ""
L["%s characters "] = "%s \232\167\146\232\137\178"
L["/allplayed"] = true
L["/ap"] = true
L["000.TOC Notes"] = "\232\191\189\232\184\170\230\137\128\230\156\137\232\167\146\232\137\178\231\154\132\229\156\168\231\186\191\230\151\182\233\151\180\239\188\140\229\143\140\229\128\141\231\187\143\233\170\140\228\184\142\233\135\145\233\146\177"
L["100%"] = true
L["150%"] = true
L["AB Marks"] = "\233\152\191\230\139\137\229\184\140\231\155\134\229\156\176\232\141\163\232\170\137\229\165\150\231\171\160"
L["AV Marks"] = "\229\165\165\231\137\185\229\133\176\229\133\139\229\177\177\232\176\183\232\141\163\232\170\137\229\165\150\231\171\160"
L["About"] = "\229\133\179\228\186\142"
L["All Factions"] = "\230\137\128\230\156\137\233\152\181\232\144\165"
-- L["All Played Breakdown"] = ""
L["All Realms"] = "\230\137\128\230\156\137\230\156\141\229\138\161\229\153\168"
L["All factions will be displayed"] = "\230\152\190\231\164\186\230\137\128\230\156\137\233\152\181\232\144\165"
L["All realms will de displayed"] = "\230\152\190\231\164\186\230\137\128\230\156\137\230\156\141\229\138\161\229\153\168"
L["AllPlayed Configuration"] = "AllPlayed \232\174\190\231\189\174"
L["Arena Points"] = "\231\171\158\230\138\128\229\156\186\231\130\185\230\149\176"
L["BC Installed?"] = "\231\135\131\231\131\167\231\154\132\232\191\156\229\190\129?"
L["Badges of Justice"] = "\230\173\163\228\185\137\229\190\189\231\171\160"
L["By % rested"] = "\229\143\140\229\128\141\231\187\143\233\170\140\231\153\190\229\136\134\230\175\148"
L["By experience"] = "\231\187\143\233\170\140"
L["By level"] = "\231\173\137\231\186\167"
L["By money"] = "\233\135\145\233\146\177"
L["By name"] = "\229\144\141\229\173\151"
L["By rested XP"] = "\229\143\140\229\128\141\231\187\143\233\170\140"
L["By time played"] = "\229\156\168\231\186\191\230\151\182\233\151\180"
L["Close"] = "\229\133\179\233\151\173"
L["Close the tooltip"] = "\229\133\179\233\151\173\230\152\190\231\164\186\228\191\161\230\129\175"
L["Colorize Class"] = "\232\129\140\228\184\154\233\162\156\232\137\178"
L["Colorize the character name based on class"] = "\228\189\191\231\148\168\232\129\140\228\184\154\233\162\156\232\137\178."
L["Configuration"] = "\233\133\141\231\189\174"
-- L["Conquest Points"] = ""
-- L["Conquest Pts"] = ""
L["Display"] = "\230\152\190\231\164\186"
L["Display XP progress as a decimal value appended to the level"] = "\230\152\190\231\164\186\229\141\135\231\186\167\230\137\128\233\156\128\231\187\143\233\170\140\229\128\188"
-- L["Display the %s each character pocess"] = ""
L["Display the gold each character pocess"] = "\230\152\190\231\164\186\230\137\128\230\156\137\232\167\146\232\137\178\231\154\132\233\135\145\233\146\177"
L["Display the played time and the total time played"] = "\230\152\190\231\164\186\229\156\168\231\186\191\230\151\182\233\151\180\228\184\142\230\128\187\229\156\168\231\186\191\230\151\182\233\151\180"
L["Display the seconds in the time strings"] = "\229\156\168\230\151\182\233\151\180\228\184\178\228\184\173\230\152\190\231\164\186\231\167\146\230\149\176"
L["Do not show Percent Rest"] = "\228\184\141\230\152\190\231\164\186\229\143\140\229\128\141\231\187\143\233\170\140\231\153\190\229\136\134\230\175\148"
L["Don't show location"] = "\228\184\141\230\152\190\231\164\186\228\189\141\231\189\174"
L["EotS Marks"] = "\230\154\180\233\163\142\228\185\139\231\156\188\232\141\163\232\170\137\229\165\150\231\171\160"
L["Experience Points"] = "\231\187\143\233\170\140\231\130\185\230\149\176"
L["Factions and Realms"] = "\233\152\181\232\144\165\228\184\142\230\156\141\229\138\161\229\153\168"
L["Filter"] = "\232\191\135\230\187\164\229\153\168"
L["Hide %s of %s from display"] = "\233\154\144\232\151\143 %s of %s"
L["Hide characters from display"] = "\233\154\144\232\151\143\232\167\146\232\137\178\230\152\190\231\164\186"
L["Honor Kills"] = "\232\141\163\232\170\137\229\135\187\230\157\128"
L["Honor Points"] = "\232\141\163\232\170\137\231\130\185\230\149\176"
L["Ignore Characters"] = "\229\191\189\231\149\165\232\167\146\232\137\178"
L["Is the Burning Crusade expansion installed?"] = "\230\152\175\229\144\166\229\174\137\232\163\133\228\186\134\231\135\131\231\131\167\231\154\132\232\191\156\229\190\129?"
-- L["Justice Points"] = ""
L["Main Settings"] = "\228\184\187\232\166\129\232\174\190\231\189\174"
L["Minimap Icon"] = "\229\176\143\229\156\176\229\155\190\229\155\190\231\164\186"
L["None"] = "\230\151\160"
L["Opacity"] = "\228\184\141\233\128\143\230\152\142\229\186\166"
L["Open configuration dialog"] = "\230\137\147\229\188\128\233\133\141\231\189\174\229\175\185\232\175\157\230\161\134"
L["PVP"] = true
L["Percent Rest"] = "\229\143\140\229\128\141\231\187\143\233\170\140\229\128\188\231\154\132\231\153\190\229\136\134\230\175\148"
L["Rested XP"] = "\229\143\140\229\128\141\231\187\143\233\170\140\229\128\188"
L["Rested XP Countdown"] = "\229\143\140\229\128\141\231\187\143\233\170\140\229\128\188\229\128\146\230\149\176\232\174\161\231\167\146"
L["Rested XP Total"] = "\229\133\168\233\131\168\229\143\140\229\128\141\231\187\143\233\170\140\229\128\188"
L["Scale"] = "\231\188\169\230\148\190"
L["Scale the tooltip (70% to 150%)"] = "\231\188\169\230\148\190\228\191\161\230\129\175\230\143\144\231\164\186(70%\229\136\176150%)"
L["Select the sort type"] = "\233\128\137\230\139\169\230\142\146\229\186\143\228\190\157\230\141\174"
L["Set UI options"] = "\232\174\190\229\174\154UI\233\128\137\233\161\185"
L["Set the PVP options"] = "\232\174\190\229\174\154PVP\233\128\137\233\161\185"
L["Set the base for % display of rested XP"] = "\231\148\168\231\153\190\229\136\134\230\175\148\230\152\190\231\164\186\229\143\140\229\128\141\231\187\143\233\170\140\229\128\188"
L["Set the display options"] = "\232\174\190\231\189\174\230\152\190\231\164\186\233\128\137\233\161\185"
L["Set the rested XP options"] = "\229\143\140\229\128\141\231\187\143\233\170\140\229\128\188\232\174\190\231\189\174"
L["Set the sort options"] = "\230\142\146\229\186\143\232\174\190\231\189\174"
-- L["Show %s"] = ""
-- L["Show %s total"] = ""
L["Show Class Name"] = "\230\152\190\231\164\186\232\167\146\232\137\178\232\129\140\228\184\154"
L["Show Gold"] = "\230\152\190\231\164\186\233\135\145\233\146\177"
L["Show Location"] = "\230\152\190\231\164\186\228\189\141\231\189\174"
L["Show Minimap Icon"] = "\230\152\190\231\164\186\229\176\143\229\156\176\229\155\190\229\155\190\230\160\135"
-- L["Show PVP Totals"] = ""
L["Show Played Time"] = "\230\152\190\231\164\186\229\156\168\231\186\191\230\151\182\233\151\180"
L["Show Seconds"] = "\230\152\190\231\164\186\231\167\146\230\149\176"
L["Show XP Progress"] = "\230\152\190\231\164\186\231\187\143\233\170\140\229\128\188"
L["Show XP total"] = "\230\152\190\231\164\186\229\133\168\233\131\168\231\187\143\233\170\140\229\128\188"
L["Show subzone"] = "\230\152\190\231\164\186\229\173\144\229\156\176\229\140\186"
L["Show the Alterac Valley Marks"] = "\230\152\190\231\164\186\229\165\165\231\137\185\229\133\176\229\133\139\229\177\177\232\176\183\232\141\163\232\170\137\229\165\150\231\171\160"
L["Show the Arathi Basin Marks"] = "\230\152\190\231\164\186\233\152\191\230\139\137\229\184\140\231\155\134\229\156\176\232\141\163\232\170\137\229\165\150\231\171\160"
L["Show the Eye of the Storm Marks"] = "\230\152\190\231\164\186\230\154\180\233\163\142\228\185\139\231\156\188\232\141\163\232\170\137\229\165\150\231\171\160"
L["Show the Warsong Gulch Marks"] = "\230\152\190\231\164\186\230\136\152\230\173\140\229\179\161\232\176\183\232\141\163\232\170\137\229\165\150\231\171\160"
L["Show the character arena points"] = "\230\152\190\231\164\186\232\167\146\232\137\178\231\171\158\230\138\128\229\156\186\231\130\185\230\149\176"
L["Show the character badges of Justice"] = "\230\152\190\231\164\186\232\167\146\232\137\178\230\173\163\228\185\137\229\190\189\231\171\160\230\149\176"
L["Show the character class beside the level"] = "\229\156\168\231\186\167\229\136\171\230\151\129\232\190\185\230\152\190\231\164\186\232\167\146\232\137\178\232\129\140\228\184\154"
L["Show the character honor kills"] = "\230\152\190\231\164\186\232\167\146\232\137\178\231\154\132\232\141\163\232\170\137\229\135\187\230\157\128"
L["Show the character honor points"] = "\230\152\190\231\164\186\232\167\146\232\137\178\232\141\163\232\170\137\231\130\185\230\149\176"
L["Show the character location"] = "\230\152\190\231\164\186\232\167\146\232\137\178\230\137\128\229\164\132\228\189\141\231\189\174"
L["Show the character rested XP"] = "\230\152\190\231\164\186\232\167\146\232\137\178\231\154\132\229\143\140\229\128\141\231\187\143\233\170\140\229\128\188"
-- L["Show the honor related stats for all characters"] = ""
L["Show the time remaining before the character is 100% rested"] = "\230\152\190\231\164\186\232\167\146\232\137\178\232\190\190\229\136\176100%\229\143\140\229\128\141\231\187\143\233\170\140\229\128\188\229\137\141\230\137\128\229\137\169\231\154\132\230\151\182\233\151\180"
-- L["Show the total %s for all characters"] = ""
L["Show the total XP for all characters"] = "\230\152\190\231\164\186\230\137\128\230\156\137\232\167\146\232\137\178\231\154\132\229\133\168\233\131\168\231\187\143\233\170\140\229\128\188"
L["Show zone"] = "\230\152\190\231\164\186\229\156\176\229\140\186"
L["Show zone/subzone"] = "\230\152\190\231\164\186\229\156\176\229\140\186/\229\173\144\229\156\176\229\140\186"
L["Sort"] = "\230\142\146\229\186\143"
L["Sort Order"] = "\230\142\146\229\186\143"
L["Sort Type"] = "\230\142\146\229\186\143"
L["Sort in reverse order"] = "\229\143\141\229\144\145\230\142\146\229\186\143"
L["Specify what to display"] = "\230\140\135\229\174\154\232\166\129\230\152\190\231\164\186\228\187\128\228\185\136"
L["Time Played"] = "\229\156\168\231\186\191\230\151\182\233\151\180"
L["Total %s Cash Value: "] = "%s \230\137\128\230\156\137\232\167\146\232\137\178\233\135\145\229\184\129: "
L["Total %s Time Played: "] = "%s \230\137\128\230\156\137\232\167\146\232\137\178\229\156\168\231\186\191\230\151\182\233\151\180: "
L["Total Cash Value: "] = "\230\137\128\230\156\137\233\135\145\229\184\129: "
-- L["Total Justice Points: "] = ""
-- L["Total PvP: "] = ""
L["Total Time Played: "] = "\230\137\128\230\156\137\229\156\168\231\186\191\230\151\182\233\151\180: "
L["Total XP: "] = "\230\137\128\230\156\137\231\187\143\233\170\140: "
L["UI"] = true
L["Unknown"] = "\230\156\170\231\159\165\231\155\174\230\160\135"
L["Use Icons"] = "\228\189\191\231\148\168\229\155\190\231\164\186"
L["Use Old Shaman Colour"] = "\232\144\168\230\187\161\231\165\173\229\143\184\228\189\191\231\148\168\230\151\167\231\154\132\232\129\140\228\184\154\233\162\156\232\137\178"
-- L["Use graphics for coin and PvP currencies"] = ""
L["Use the curent sort type in reverse order"] = "\230\140\137\229\189\147\229\137\141\230\142\146\229\186\143\228\190\157\230\141\174\229\143\141\229\144\145\230\142\146\229\186\143"
L["Use the pre-210 patch colour for the Shaman class"] = "\228\184\141\233\128\137\229\136\153\232\144\168\230\187\161\228\189\191\231\148\168\230\150\176\231\154\132\232\129\140\228\184\154\233\162\156\232\137\178"
L["Version %s (r%s)"] = "\231\137\136\230\156\172 %s (r%s)"
L["WG Marks"] = "\229\134\172\230\143\161\230\185\150\232\141\163\232\170\137\229\165\150\231\171\160"
L["rested"] = "\231\178\190\229\138\155\229\133\133\230\178\155"
L["v%s - %s (Type /ap for help)"] = "v%s - %s (\231\137\136 /ap \229\188\128\229\144\175\232\175\180\230\152\142)"
