if select(6, GetAddOnInfo("PitBull4_" .. (debugstack():match("[o%.][d%.][u%.]les\\(.-)\\") or ""))) ~= "MISSING" then return end

local PitBull4 = _G.PitBull4
if not PitBull4 then
	error("PitBull4_ThreatBar requires PitBull4")
end

local mop_500 = select(4,GetBuildInfo()) >= 50000

local GROUP_UPDATE_EVENT = 'GROUP_ROSTER_UPDATE'
local IsInGroup = IsInGroup
if not mop_500 then
	GROUP_UPDATE_EVENT = 'PARTY_MEMBERS_CHANGED'
	IsInGroup = function()
		return GetNumPartyMembers() > 0 or GetNumRaidMembers() > 0
	end
end

local EXAMPLE_VALUE = 0.5

local L = PitBull4.L

local PitBull4_ThreatBar = PitBull4:NewModule("ThreatBar", "AceEvent-3.0")

PitBull4_ThreatBar:SetModuleType("bar")
PitBull4_ThreatBar:SetName(L["Threat bar"])
PitBull4_ThreatBar:SetDescription(L["Show a threat bar."])
PitBull4_ThreatBar:SetDefaults({
	size = 1,
	position = 5,
})

function PitBull4_ThreatBar:OnEnable()
	self:RegisterEvent("PLAYER_TARGET_CHANGED")
	self:RegisterEvent("UNIT_THREAT_LIST_UPDATE")
	self:RegisterEvent("UNIT_THREAT_SITUATION_UPDATE")
	self:RegisterEvent(GROUP_UPDATE_EVENT, "GROUP_ROSTER_UPDATE")
	if not mop_500 then
		self:RegisterEvent("RAID_ROSTER_UPDATE", "GROUP_ROSTER_UPDATE")
	end
	self:RegisterEvent("PLAYER_PET_CHANGED", "GROUP_ROSTER_UPDATE")
	
	self:GROUP_ROSTER_UPDATE()
end

local player_in_group = false

local ACCEPTABLE_CLASSIFICATIONS = {
	player = true,
	pet = true,
	party = true,
	raid = true,
	partypet = true,
	raidpet = true,
}

function PitBull4_ThreatBar:GROUP_ROSTER_UPDATE()
	player_in_group = UnitExists("pet") or IsInGroup()
	
	for classification in pairs(ACCEPTABLE_CLASSIFICATIONS) do
		self:UpdateForClassification(classification)
	end
end

function PitBull4_ThreatBar:GetValue(frame)
	if not ACCEPTABLE_CLASSIFICATIONS[frame.classification] or not player_in_group then
		return nil
	end
	local unit = frame.unit
	
	local _,_,threatpct = UnitDetailedThreatSituation(unit, "target")
       
	if not threatpct then
		return nil
	end
    
	return threatpct / 100
end
function PitBull4_ThreatBar:GetExampleValue(frame)
	if frame and not ACCEPTABLE_CLASSIFICATIONS[frame.classification] then
		return nil
	end
	return EXAMPLE_VALUE
end

function PitBull4_ThreatBar:GetColor(frame, value)
	local status
	if frame.guid then
		local _
		_, status = UnitDetailedThreatSituation(frame.unit, "target")
	else
		status = 0
	end
	
	return GetThreatStatusColor(status)
end
function PitBull4_ThreatBar:GetExampleColor(frame, value)
	return GetThreatStatusColor(0)
end

function PitBull4_ThreatBar:PLAYER_TARGET_CHANGED()
	self:UpdateAll()
end

PitBull4_ThreatBar.UNIT_THREAT_LIST_UPDATE = PitBull4_ThreatBar.PLAYER_TARGET_CHANGED
PitBull4_ThreatBar.UNIT_THREAT_SITUATION_UPDATE = PitBull4_ThreatBar.PLAYER_TARGET_CHANGED
