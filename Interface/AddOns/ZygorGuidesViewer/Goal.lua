local Goal = { }

local ZGV = ZygorGuidesViewer
if not ZGV then return end
local L = ZGV.L

local table,string,tonumber,ipairs,pairs,setmetatable = table,string,tonumber,ipairs,pairs,setmetatable

ZGV.GoalProto = Goal
ZGV.GoalProto_mt = { __index=Goal }

function Goal:New(data)
	setmetatable(data,ZGV.GoalProto_mt)
	return data
end

Goal.indent=0

local Astrolabe = DongleStub("Astrolabe-1.0")

local MACROICON_TALK = 1 -- INVISIBLE! -- 378
local MACROICON_KILL = 1 -- INVISIBLE! Let our icons shine through. Otherwise, it'd be "ABILITY_DUALWIELD".
local MACROICON_MISC = "INV_MISC_QUESTIONMARK" --656

function Goal:GetStatus()
	if not self.prepared then self:Prepare() end

	if ZGV.db.profile.magickey~="" then
		-- update automatic macros. Wrong place to do it, but there isn't any "update goal" routine yet.
		if ((self.action=="kill" and self.target)
		or (self.action=="talk" and self.npcid)
		or (self.action=="from" and self.mobs and self.mobs[1] and self.mobs[1].name))
		and not self.macrosrc then
			if self.target or self.npcid then
				self.macrosrc = "/target "..(self.target or ZGV.Localizers:GetTranslatedNPC(self.npcid))
				self.macrosrc = self.macrosrc .."\n/run ZGV:MagicRaidMarker()"
			elseif self.mobs and self.mobs[1] and self.mobs[1].name then
				self.macrosrc = ""
				for mi,m in ipairs(self.mobs) do if m.name then
					self.macrosrc = self.macrosrc .. "/target "..m.name.."\n"
				end end
				self.macrosrc = self.macrosrc .."\n/run ZGV:MagicRaidMarker()"
				if self.macrosrc=="" then self.macrosrc=nil end
			end
			if self.macrosrc then
				self.macroicon = self.buttonicon or (self.action=="talk" and MACROICON_TALK or MACROICON_KILL)
				self.parentStep.prepared = nil
				self.prepared = nil
			end
			ZGV:Debug("goal "..self.num.." sets makeshift macro: "..tostring(self.macrosrc))
		end
	end

	if self.sub_goto then
		-- fly step!
		if (true) then
			local w1 = Astrolabe.WorldMapSize[ZGV.CurrentMapID or 0]
			local w2 = Astrolabe.WorldMapSize[self.map or 0]
			if w1 and w2 and w1.system==w2.system then

				local npc = LibRover:GetNearestTaxiInZone()
				--if npc and (not UnitOnTaxi("player") or not self.sub_goto.map) and self.map == npc.m then
				if npc and (not UnitOnTaxi("player") or not self.sub_goto.map)  then
					self.sub_goto.x = npc.x
					self.sub_goto.y = npc.y
					self.sub_goto.map = npc.m
					self.sub_goto.floor = ZGV:SanitizeMapFloor(npc.m,npc.floor)
					self.sub_talk.npcid = npc.npcid

					if self.taxi~=npc then
						-- taxi changed
						self.taxi = npc
						self.sub_talk.L = nil
						ZGV:SetWaypoint()
					end
				end
			end
			self.sub_goto.hidden = not self.sub_goto.x
			self.sub_talk.hidden = not self.sub_talk.npcid
		else
			self.sub_goto.hidden=true
			self.sub_talk.hidden=true -- TODO make it inside event? Let's ask Sinus ~aprotas
			ZGV:SetWaypoint(self.num)
		end
	end

	if not self:IsVisible() then return "hidden" end
	if not self:IsCompleteable() then return "passive" end
	local complete,possible,progress,warn = self:IsComplete()
	if complete then return "complete" end
	-- FIRST impossible (gray), THEN obsolete (blue).
	if warn then return "warning" end
	if not possible then return "impossible" end
	if ZGV.db.profile.skipobsolete and not self.parentStep.parentGuide.noobsolete and self:IsObsolete() then return "obsolete" end
	-- only possible and progressing is left.
	return "incomplete",progress
end

function Goal:UpdateStatus()
	self.status = self:GetStatus()
end

function Goal:IsVisible()
	if ZGV.db.profile.showwrongsteps then return true end
	if not self:IsFitting() then return false end
	if self.hidden then return false end
	if self.condition_visible then
		if self.condition_visible_raw=="default" then
			-- oo, special case.
			for i,goal in ipairs(self.parentStep.goals) do
				if goal~=self and goal.condition_visible and goal:IsVisible() then return false end
			end
			return true
		else
			ZGV.Parser.ConditionEnv._SetLocal(self.parentStep.parentGuide,self.parentStep,self)
			return self.condition_visible()
		end
	end
	return true
end


local _c = { "goal","kill","get","accept","turnin","collect","buy","fpath","home","ding","havebuff","nobuff","invehicle","outvehicle","equipped","rep","condition","achieve","create","skill","skillmax","learn","learnspell","learnpet","learnmount","confirm","earn","fly","complete" }
local completable = {}
for i=1,#_c do completable[_c[i]]=true end

function Goal:IsCompleteable()
	--if type(goal)=="number" then goal=self.CurrentStep.goals[goal] end
	if self.force_nocomplete then return false end

	if self.questid --[[and self.objnum--]] then return true end
	
	if self.action=="from"
	or self.action==""
	then return false end

	if completable[self.action] then return true end

	if self.action=="goto" then
		-- this one is tricky.
		-- by default - completeable only if only 'goto' goals are present.
		local all_gotos=true
		for i,goal in ipairs(self.parentStep.goals) do
			if goal.action~="goto" then
				all_gotos=false
				break
			end
		end
		return (self.force_complete or all_gotos)
	end
	return false
end

local goalstring_slain=QUEST_MONSTERS_KILLED:gsub(": .*","")

local invslots = {'AmmoSlot','BackSlot','Bag0Slot','Bag1Slot','Bag2Slot','Bag3Slot','ChestSlot','FeetSlot','Finger0Slot','Finger1Slot','HandsSlot','HeadSlot','LegsSlot','MainHandSlot','NeckSlot','RangedSlot','SecondaryHandSlot','ShirtSlot','ShoulderSlot','TabardSlot','Trinket0Slot','Trinket1Slot','WaistSlot','WristSlot'}

-- returns: true = complete, false = incomplete
-- second return: true = completable, false = incompletable
function Goal:IsComplete()

	if (self.force_sticky and ZGV.recentlyCompletedGoals[self]) or ZGV.recentlyStickiedGoals[self] or self.fake_complete then
		return true,true,true
	end

	if not self:IsCompleteable() then return false end

	if self.force_nocomplete then return false end

	if self.countexprfun then
		local res,err = pcall(countexprfun)
		if res then self.count=err else error("Error in step count expression: "..err) end
	end

	if self.action=="accept" then
		--[[
		-- Check for "turn in, accept" pair of the same quest - a workaround for "turn in part 1, accept part 2" steps
		--  Deprecated by introduction of questacceptedid
		if ZGV.questIndicesByTitle[self.questaccepted] and goalIndex>1 then
			local i
			for i = goalIndex-1, 1, -1 do
				if ZGV.StepCompletion[i].questturnedin==self.questaccepted and not ZGV:IsStepGoalComplete(i) then return false,true end
			end
		end
		--]]
		--local possible = (not self.parentStep.level  or  self.parentStep.level-UnitLevel("player")<=5)

		local quest = ZGV.questsbyid[self.questid]
		local complete = (ZGV.completedQuests[self.questid] and not self.repeatablequest)
		    or (ZGV.recentlyCompletedQuests[self.questid] or ZGV.recentlyCompletedQuests[self.quest])
		    or (quest and quest.inlog)
		    -- or ZGV.instantQuests[self.questid]  -- and ZGV.completedQuestTitles[self.quest])  -- let's not use this anymore, with GetQuestID available
		    -- or (not ZGV.CurrentGuide.daily and ZGV.db.char.permaCompletedDailies[self.questid])  -- deprecating this, let's see if this works.
		
		return complete, complete or ZGV:IsQuestPossible(self.questid)     --[[or ZGV.recentlyAcceptedQuests[id] --]]

	elseif self.action=="turnin" then
			--[[ Completion sequence:
									ZGV.completedQuests[id]		ZGV.questsbyid[id]
			 1. CHAT_MSG_SYSTEM "<quest> completed."	nil				{...}
			     - ZGV.completedQuests[id] = true		true				{...}
			 2. QUEST_LOG_UPDATE, quest gone from log.	true				nil

			--]]

			-- Completed if it's in the completed bin, but NOT in the log.
			-- If it's in the log, it couldn't be completed; this fixes some weird multiple-completion quests, like #348 Stranglethorn Fever.
			-- completeable if it's in the log and complete or non-goaled.
		local quest = ZGV.questsbyid[self.questid]
		local turned = ZGV.completedQuests[self.questid]
			and (not quest or not quest.inlog) -- Repeatables might be completed and in the log at the same time. We need to complete only when they're not in the log anymore.
			
			-- or (not ZGV.CurrentGuide.daily and ZGV.db.char.permaCompletedDailies[self.questid])
		
		return turned, turned or (quest and quest.inlog and (quest.complete or #quest.goals==0)), 0, not turned and quest and quest.inlog and not quest.complete and #quest.goals>0
	end

	
	if self.achieveid then
		-- oh gods. The below, redux.
		local completed
		if self.achievesub then
			local description, ctype
			description, ctype, completed = GetAchievementCriteriaInfo(self.achieveid, self.achievesub)
		else
			local id, name, points
			id, name, points, completed = GetAchievementInfo(self.achieveid)
		end

		if completed then
			return true,true
		end
		-- else fall-through
	end

	-- Quest-related? Handle appropriately.

	if self.questid then

		-- NEW: if it's a goddamn instant daily, try to reset it.
		--if ZGV.instantQuests[self.questid] and ZGV.dailyQuests[self.questid] then ZGV:QuestTracking_ResetDailyByTitle(self.quest) end

		-- if the quest was done, the goal is done and over with. Bye.
		if ZGV.completedQuests[self.questid] then return true,true end

		-- if the quest cannot be completed, and we're not a futureproof goal, bail.
		--if not ZGV:IsQuestPossible(self.questid) and not self.future then return false,false end

		-- okay, so the quest may yet be possible. Is it in the log?
		local quest = ZGV.questsbyid[self.questid]
		if quest and quest.inlog then
		
			-- Now if it is goalbound, complete it as the goal would.
			if self.objnum then
				local questGoalData = quest.goals[self.objnum]

				if questGoalData then
					if questGoalData.complete then
						return true, true
					else
						local count = self.count or questGoalData.needed or 1
						if count==0 then count=1 end
						if questGoalData.num>=count then
							return true, true
						else
							--ZGV:Debug("Not yet completed: "..questself.num.."/"..questgoal.needed)
							return false, true, questGoalData.num/count
						end
					end
				else
					--ZGV:Debug("No goal "..goal)
					ZGV:Print("WARNING: quest has no such goal! Step "..self.parentStep.num..", line "..(self.num)..", quest "..(self.questid or (self.quest and self.quest.title))..", goal "..(self.objnum or -1))
					return false, true
				end
				assert(false,"WTF, not supposed to reach this!")
			else
				-- bound to quest, not to quest objective?
				if not self.action or self.action=="" or self.action=="complete" then
					-- okay, this is a simple "complete the quest" check
					return quest.complete, true
				end
				-- otherwise... just drop from here.
				
				--[[
				if questInLog.complete or #questInLog.goals==0 then
					return true,true
				else
					-- otherwise drop through, let it complete on its own.
				end
				--]]
			end
		else
			-- if quest is not in log, then it usually means screw its links as well.
			-- Unless we're a future-proof goal, which drops through.
			if not self.future then
				return false,false
			end
		end
	end


	if self.action=="ding" then
		local percent
		local level = ZGV:GetPlayerPreciseLevel()
		percent = (level<self.level-1) and 0 or (level>=self.level) and 1.0 or UnitXP("player")/UnitXPMax("player")

		return level>=tonumber(self.level), level>=tonumber(self.level)-1, percent

	elseif self.action=="goto" or self.action=="fly" then
		-- some skip-ups if the action is fly
		if self.action=="fly" then
			if not UnitOnTaxi("player") then
				local goalcontinent=Astrolabe:GetMapInfo(self.map,0)
				local continent=Astrolabe:GetMapInfo(ZGV.CurrentMapID,0)
				local epicflyer=IsSpellKnown(34091) or IsSpellKnown(90265) -- Artisan and Master riding respectively
	
				if (goalcontinent==continent and epicflyer and ZGV.db.profile.skipflysteps) or -- TODO handle the case when they are not
					-- TODO GV-76 point 7 do we discriminate between fliers and nonfliers here?
					(ZGV.CurrentMapID==self.map and not UnitOnTaxi("player") and IsMounted()) then 
	-- 				ZGV:Debug("fly advised the player to make use of his own mount") 
					-- TODO avoid repetitive debug message
					return true,true
				end
			end
		end
	
		local gm,gf=self.map,self.floor

		-- goto is surely invalid if the current map is not the target.
		-- however, we make a little exception to phased maps which may bug in WoW client
		if ZGV.Pointer and ZGV.Pointer:IsEnvironmentPhased(gm) then
			gm,gf=GetCurrentMapAreaID(),GetCurrentMapDungeonLevel()
		elseif ZGV.CurrentMapID and (ZGV.CurrentMapID~=gm or ZGV.CurrentMapID~=GetCurrentMapAreaID() or ZGV.CurrentMapFloor~=gf) then return self.dist and self.dist<0,true end
		if ZGV.recentlyVisitedCoords[self] then return true, true end

		if self.x then
			local cm,cf,cx,cy = Astrolabe:GetCurrentPlayerPosition()
			if not cm then cm,cf,cx,cy = unpack(Astrolabe.LastPlayerPosition) end
			local gx,gy,dist = self.x/100,self.y/100,self.dist or 30
			local realdist=Astrolabe:ComputeDistance(cm,cf,cx,cy,gm,gf,gx,gy)
			if not realdist then
				return false, true
			elseif (dist>0 and realdist<=dist) or (dist<0 and realdist>=-dist) then
				--ZGV.recentlyVisitedCoords[self] = true
				return true, true
			else
				local prog
				if dist>0 then prog = 1-((realdist-dist)/500) else prog = realdist/(-dist+0.1) end
				if prog<0 then prog=0 end
				if prog>1 then prog=1 end
				return false, true, prog
			end
		else
			return not self.dist or self.dist>0,true
		end
	elseif self.action=="hearth" then
		return GetZoneText()==self.param or GetMinimapZoneText()==self.param or GetSubZoneText()==self.param, true
	elseif self.action=="home" then
		--return GetBindLocation("player")==self.home, true  -- didn't work well
		return ZGV.recentlyHomeChanged, true
	elseif self.action=="fpath" then
		return (ZGV.db.char.taxis[ZGV.LibTaxi.TaxiNames_English[self.param]] --[[or ZGV.recentlyDiscoveredFlightpath--]]), true
	elseif self.action=="collect" or self.action=="buy" or (self.action=="create" and self.count) then
		if not self.targetid then return false,true end -- no known item... what the...
		if self.count==0 then self.count=1 end  -- completable? has to have a count.
		local got = GetItemCount(self.targetid)
		local progress = got/self.count
		if self.exact then
			return got==self.count, true, got<=self.count and progress or 0
		else
			return got>=self.count, true, progress>1 and 1 or progress
		end
	elseif self.action=="earn" then
		local name,got = GetCurrencyInfo(self.targetid)
		if not name then return end
		if self.count==0 then self.count=1 end  -- completable? has to have a count.
		local progress = got/self.count
		return got>=self.count, true, progress>1 and 1 or progress
	elseif self.action=="havebuff" then
		for i=1,30 do
			local name,_,tex = UnitBuff("player",i)
			if name and (tex:find(self.buff) or name:find(self.buff)) then return true,true end
			local name,_,tex = UnitDebuff("player",i)
			if name and (tex:find(self.buff) or name:find(self.buff)) then return true,true end
		end
		return false,true
	elseif self.action=="nobuff" then
		for i=1,30 do
			local name,_,tex = UnitBuff("player",i)
			if name and (tex:find(self.buff) or name:find(self.buff)) then return false,true end
			local name,_,tex = UnitDebuff("player",i)
			if name and (tex:find(self.buff) or name:find(self.buff)) then return false,true end
		end
		return true,true
	elseif self.action=="invehicle" then
		return UnitInVehicle("player"),true
	elseif self.action=="outvehicle" then
		return not UnitInVehicle("player"),true
	elseif self.action=="equipped" then
		if GetItemCount(self.targetid)==0 then return false,false end  -- not even in the bags
		for i,slot in pairs(invslots) do
			local slotid,_ = GetInventorySlotInfo(slot)
			if slotid then
				local id = GetInventoryItemID("player",slotid)
				if id and id==self.targetid then
					return true,true  -- equipped!
				end
			end
		end
		return false,true  -- in bags, not equipped
	elseif self.action=="rep" then
		local rep = ZGV:GetReputation(self.faction)
		if rep then
			return rep.standing>=self.rep, true, 1-(rep:CalcTo(self.rep)/(rep.max-rep.min)) or 0
		else
			return nil,nil,nil
		end
	elseif self.action=="condition" then
		ZGV.Parser.ConditionEnv._SetLocal(self.parentStep.parentGuide,self.parentStep,self)
		return self:condition_complete(),true
	elseif self.action=="achieve" then
		if self.achieveid then
			if self.achievesub then
				-- partial achievement
				local desc,ctype,completed,quantity,required = GetAchievementCriteriaInfo(self.achieveid,self.achievesub)
				if not required or required==0 then required=1 end
				if not quantity then quantity = 0 end
				if quantity>required then quantity=required end
				return not not completed, true, quantity/required
			else
				-- full achievement
				local id, name, points, completed = GetAchievementInfo(self.achieveid)
				local numcrit = GetAchievementNumCriteria(self.achieveid)
				local completenum = 0
				for i=1,numcrit do
					local desc,ctype,completed,quantity,required = GetAchievementCriteriaInfo(self.achieveid,i)
					if not required or required==0 then required=1 end
					if not quantity then quantity = 0 end
					if quantity>required then quantity=required end
					completenum=completenum+quantity/required
				end
				return not not completed, true, numcrit>0 and completenum/numcrit or 0
			end
		else
			return nil,nil,nil
		end
	elseif self.action=="skill" or (self.action=="create" and self.skill and not self.count) then
		local skill = ZGV:GetSkill(self.skill)
		if self.skilllevel then
			return skill.level>=self.skilllevel,skill.max>=self.skilllevel
		elseif self.count and self.recipedata then
			return GetItemCount(self.recipedata.itemid or 0)>=self.count,true
		end
	elseif self.action=="skillmax" then
		return ZGV:GetSkill(self.skill).max>=self.skilllevel,true
	elseif self.action=="learn" then
		return ZGV.db.char.RecipesKnown[self.recipeid] or (self.recipe and ZGV.recentlyLearnedRecipes[self.recipe]), true
	elseif self.action=="learnspell" then
		return IsSpellKnown(self.spellid), true
	elseif self.action=="learnpet" then
		for i=1,GetNumCompanions("CRITTER") do
			 local id,name,spell = GetCompanionInfo("CRITTER",i)
			 if id==self.petid then return true,true end
		end
		return false,true
	elseif self.action=="learnmount" then
		for i=1,GetNumCompanions("MOUNT") do
			 local id,name,spell = GetCompanionInfo("MOUNT",i)
			 if id==self.petid then return true,true end
		end
		return false,true
	elseif self.action=="kill" and self.usekillcount then --killcount version
		local count = ZGV.recentKills[self.target]
		return count and count>=self.count, true
	elseif self.action=="confirm" then
		return false,true
	end

	return false,false
end

function FindPetActionInfo(action)
	if type(action)=="number" then return action,GetPetActionInfo(action) end
	for i=1,12 do
		local name,x,tex = GetPetActionInfo(i)
		if name and (name:find(action) or tex:find(action)) then return i,name,x,tex end
	end
end

function Goal:IsActionable()
	return (self.itemid and (GetItemCount(self.itemid)>0 or not self.itemuse))
	    or (self.castspellid and IsUsableSpell(self.castspellid))
	    or (self.petaction and FindPetActionInfo(self.petaction))
	    or ((self.script or self.macrosrc) and (self.action~="confirm"))
end

local function plural(s,i)
	if not i or i==1 then return s else return ZygorGuidesViewer_L("Specials")["plural"](s) end
end

function Goal:IsFitting()
	if self.wrong then return nil end
	if not self.requirement then return true end
	self.wrong = not ZygorGuidesViewer:RaceClassMatch(self.requirement)
	return not wrong
end

function Goal:NeedsTranslation()
	--return GetLocale()~="enUS" and not self.L
	return type(self.L)=="number" or not self.L
end

local retries=20
function Goal:AutoTranslate()
	local oldL=self.L
	if self.L==true then return false end
	if not self:IsFitting() then
		-- ignore wrong goals
		self.L=true
	end

	self.L = true  -- assume we're translating right

	if self.action=="fpath" and ZGV.LibTaxi then
		if ZGV.LibTaxi.TaxiNames_Local then
			self.param = ZGV.LibTaxi.TaxiNames_Local[self.param] or self.param
		end
	end
	if self.questid then
		local q = ZGV.Localizers:GetQuestData(self.questid)
		if q then
			self.quest=q
			if (self.action=='get' or self.action=='kill' or self.action=='goal')
			and not self.targetid then
				if q.goals then
					local obj=q.goals[self.objnum]
					if obj and obj.item and obj.item~=" " then
						self.target=obj.item
						--self.L=true
					else
						self.Lretries = (self.Lretries or retries) - 1
						self.L=nil -- WHOA.
					end
				else
					--self.L=true --sorry...
				end
			--elseif self.action=='accept' or self.action=='turnin' then
				--self.L = true  -- quest title is enough
				--ZGV:Debug("Translated: accept/turnin "..self.quest.." ("..(self.Lretries or 'all').." retries left)")
			--else
				--self.L = true
				--ZGV:Debug("Translated: '"..tostring(self.action).."' "..tostring(self.quest).." ("..(self.Lretries or 'all').." retries left)")
			end

			-- translated a quest - if it's an instant-daily, put it in a special bag
			-- it's used to remove titles from ZGV.db.char.completedQuests if removing the daily ID from completedDailies
			-- ... Not used anymore?
			--[[
			if ZGV.instantQuests[self.questid] and ZGV.dailyQuests[self.questid] then
				ZGV.db.global.instantDailies[self.questid] = qt
			end
			--]]
		else
			self.Lretries = (self.Lretries or retries) - 1
			self.L=nil -- WHOA.
		end
	end
	if self.targetid then
		--[[if QuestInfo_Name then
			local target=QuestInfo_Name[self.targetid]
			if target then
				self.target=target
			end
		--]]
		if self.action=="kill" then
			if ZygorGuidesNPCs then
				local target,tooltip=ZGV.Localizers:GetTranslatedNPC(self.targetid)
				if target then
					self.target,self.tooltip=target,tooltip or self.tooltip
				end
			end
			--self.L=true
			--ZGV:Debug("Translated: '"..tostring(self.action).."' "..tostring(self.target).." ("..(self.Lretries or 'all').." retries left)")
		elseif self.action=="collect" or self.action=="get" or self.action=="buy" or self.action=="use" or self.action=="equipped" then
			local item = GetItemInfo(self.targetid)
			if item then
				self.target=item
				--self.L=true
				--ZGV:Debug("Translated: '"..tostring(self.action).."' "..tostring(self.target).." ("..(self.Lretries or 'all').." retries left)")
			else
				self.Lretries = (self.Lretries or retries) - 1
				self.L=nil -- WHOA.
			end
		end
	end
	if self.itemid then
		local item = GetItemInfo(self.itemid)
		if item then
			self.item = item
		else
			self.Lretries = (self.Lretries or retries) - 1
			self.L=nil -- WHOA.
		end
	end

	if self.npcid then
		local npc,tooltip=ZGV.Localizers:GetTranslatedNPC(self.npcid)
		--if npc then
		--	--self.npc,self.tooltip=npc,tooltip
		--end
		self.tooltip=tooltip or self.tooltip
		--self.npc = self.npc or "?"
		-- NPC will self-translate.
	end

	if self.L then
		-- translated? whee.
		if (retries-(self.Lretries or retries) > 0) then ZGV:Debug(("Translating step %d goal %d, try %d - success"):format(self.parentStep.num,self.num,retries-(self.Lretries or retries))) end
		ZGV.frameNeedsUpdating=true
		self.Lretries=nil
		self.Lfail=nil
	else
		-- not yet?
		-- do we have retries left?

		if self.Lretries and self.Lretries>0 then
			-- let it retry
			--ZGV:Debug(("Translating step %d goal %d, try %d..."):format(self.parentStep.num,self.num,retries-(self.Lretries or retries)))
		else
			-- if many translation attempts fail, just leave it.
			ZGV:Debug(("Translating step %d goal %d, tried %d times - failed"):format(self.parentStep.num,self.num,retries-(self.Lretries or retries)))
			self.L=true  --sorry.
			self.Lfail=true
			self.Lretries=nil
		end
	end

	return oldL~=self.L
end

local function COLOR_LOC(s) return "|cffffee77"..tostring(s).."|r" end
local function COLOR_COUNT(s) return "|cffffffcc"..tostring(s).."|r" end
local function COLOR_ITEM(s) return "|cffaaeeff"..tostring(s).."|r" end
local function COLOR_QUEST(s) return "|cffddaaff"..tostring(s).."|r" end
local function COLOR_NPC(s) return "|cffaaffaa"..tostring(s).."|r" end
local function COLOR_MONSTER(s) return "|cffffaaaa"..tostring(s).."|r" end
local function COLOR_GOAL(s) return "|cffffcccc"..tostring(s).."|r" end


local function GenericText(brief,goaltype,colorfunc,count,target,nocount,isplural,_done)
	if nocount or count==0 then
		local formattxt = brief and "%s" or L["stepgoal_"..goaltype.._done]
		return formattxt:format(colorfunc(plural(target,isplural and 2 or 1)))
	else
		local formattxt = brief and "%s %s" or L["stepgoal_"..goaltype.." #".._done]
		return formattxt:format((count and count>0) and count or "?",colorfunc(plural(target,count)))
	end
end

local simulquest = {
	['goals']={
		{ type="monster",monster="Two Monsters",leaderboard="Monster slain: 0/2",needed=2,num=0 },
		{ type="monster",monster="Two Monsters Again",leaderboard="Two Monsters Again slain: 1/2",needed=2,num=1 },
		{ type="monster",monster="Three Dead Monsters",leaderboard="Three Dead Monsters slain: 3/3",needed=3,num=3 }
	}
			
}

local unknownquest = {
	title="?"
}


local skillspells = {	--	apprentice	journeyman	expert		artisan		master		grand master	illustrious
	Alchemy = {		[75]=2275,	[150]=2280,	[225]=3465,	[300]=11612,	[375]=28597,	[450]=51303,	[525]=65281	},
	Archaeology = {		[75]=95553,	[150]=95554,	[225]=95555,	[300]=95556,	[375]=95557,	[450]=95558,	[525]=95546	},
	Blacksmithing = {	[75]=2020,	[150]=2021,	[225]=3539,	[300]=9786,	[375]=29845,	[450]=51298,	[525]=65282	},
	Cooking = {		[75]=2551,	[150]=3412,	[225]=19886,	[300]=19887,	[375]=33361,	[450]=51295,	[525]=65291	},
	Enchanting = {		[75]=7414,	[150]=7415,	[225]=7416,	[300]=13921,	[375]=28030,	[450]=51312,	[525]=65285	},
	Engineering = {		[75]=4039,	[150]=4040,	[225]=4041,	[300]=12657,	[375]=30351,	[450]=51305,	[525]=61464	},
	['First Aid'] = {	[75]=3279,	[150]=3280,	[225]=19903,	[300]=19902,	[375]=27029,	[450]=50299,	[525]=65292	},
	Fishing = {		[75]=7733,	[150]=7734,	[225]=19889,	[300]=19890,	[375]=33100,	[450]=64484,	[525]=65293	},
	Herbalism = {		[75]=2372,	[150]=2373,	[225]=3571,	[300]=11994,	[375]=28696,	[450]=50301,	[525]=65288	},
	Inscription = {		[75]=45375,	[150]=45376,	[225]=45377,	[300]=45378,	[375]=45379,	[450]=45380,	[525]=65287	},
	Jewelcrafting = {	[75]=25245,	[150]=25246,	[225]=28896,	[300]=28899,	[375]=28901,	[450]=51310,	[525]=65286	},
	Leatherworking = {	[75]=2155,	[150]=2154,	[225]=3812,	[300]=10663,	[375]=32550,	[450]=51301,	[525]=65284	},
	Mining = {		[75]=2581,	[150]=2582,	[225]=3568,	[300]=10249,	[375]=29355,	[450]=50309,	[525]=65289	},
	Riding = {		[75]=33389,	[150]=33392,	[225]=34092,	[300]=34093,	[375]=90266					},
	Skinning = {		[75]=8615,	[150]=8619,	[225]=8620,	[300]=10769,	[375]=32679,	[450]=50307,	[525]=65290	},
	Tailoring = {		[75]=3911,	[150]=3912,	[225]=3913,	[300]=12181,	[375]=26791,	[450]=51308,	[525]=65283	},
}

local function picktext(goal,goaltext)
	if ZGV.db.profile.usegenericgoals then
		goal.text = goaltext or goal.text or "?"
	else
		goal.text = goal.text or goaltext or "?"
	end
end
-- This is a HUGE mess.

function get_recipe(skill,spellid)
	if GetTradeSkillLine()==ZGV.LocaleSkills[skill] then
		local skillName, skillType, numAvailable, isExpanded, serviceType, numSkillUps
		local itemlink
		local line
		for i=1,500 do
			local link = GetTradeSkillRecipeLink(i)
			if link then
				local sid = link:match(":([0-9]+)|h%[")
				if tonumber(sid)==spellid then
					line = i
					break
				end
			end
		end
		if line then
			local skillName, skillType, numAvailable, isExpanded, serviceType, numSkillUps = GetTradeSkillInfo(line)
			local itemid = (GetTradeSkillItemLink(line) or ""):match("|H.-:(%d+)")

			return {avail=numAvailable,type=skillType,numup=numSkillUps and numSkillUps>0 and numSkillUps or 1, lastskill=skill, itemid=itemid}
		else
			return nil,"unknown"
		end
	else
		return nil,"closed"
	end
end

local dots_table = {'.','..','...','....','.....','....','...','..'}
local function dots(num) return dots_table[(num or 0)%8+1] end

function Goal:GetText(showcompleteness,brief)
	if not self.prepared then self:Prepare() end
	--if type(goal)=="number" then goal=self.CurrentStep.goals[goal] end

	-- prepare for progress
	local questdata,goaldata,goalcountnow,goalcountneeded,remaining
	if self.force_nocomplete and self.action~="collect" and self.action~="buy" then showcompleteness=false end
	if showcompleteness and self.questid then
		questdata=ZGV.questsbyid[self.questid]
		if questdata and questdata.inlog and self.objnum then
			-- quest-goal completion display; lame 0/5
			goaldata = questdata.goals[self.objnum]
			if goaldata then
				goalcountneeded = min(self.count or 9999,goaldata.needed or 9999)
				goalcountnow = goaldata.num
				remaining = goalcountneeded-goalcountnow
				if remaining<=0 then remaining=goalcountneeded end
			end
		end
	end

	local complete,ext = self:IsComplete()

	local _done = complete and "_done" or ""

	local text="?"
	local progtext

	if self.text then

		local nsub=1
		-- Generates a parser proc with said behaviour, to evade calling loadstring too much
		local function make_parser(parser) -- function to generate code
			return function(s)
				if not self.textsubs then self.textsubs={} end
				local f = self.textsubs[nsub]
				if not f then
					f=parser(s)
					self.textsubs[nsub]=f
				end
				nsub=nsub+1
				return type(f)=="function" and tostring(f()) or tostring(f)
			end
		end
		local function parser_simple(s)
			local fun,err = loadstring(s:find("return") and s or "return "..s)
			if fun then
				setfenv(fun,ZGV.Parser.ConditionEnv)
				return fun
			else
				return "("..err..")"
			end
		end
		local function parser_ternary(s)
			local condcode,a,b=s:match("(.*)%?%?(.*)::(.*)")
			if condcode and a and b then
				local condfun,err = loadstring(condcode:find("return") and condcode or "return "..condcode)
				if condfun then
					local fun = function() -- Generating a real worker function
						return condfun() and a or b
					end
					setfenv(fun,ZGV.Parser.ConditionEnv)
					return fun
				else
					return "("..err..")"
				end
			else
				return "(Wrong conditional syntax)"
			end
		end
		-- TODO support nesting of conditionals
		text = self.text:gsub("{=(.-)=}",make_parser(parser_ternary)):gsub("{(.-)}",make_parser(parser_simple))

	elseif self.action=='accept' then
		text = (brief and "%s" or L["stepgoal_accept".._done]):format(COLOR_QUEST((self.questpart and L['questtitle_part'] or L['questtitle']):format(self.quest and self.quest.title or dots(self.Lretries),self.questpart)))
	
	elseif self.action=='turnin' then
		text = (brief and "%s" or L["stepgoal_turn in".._done]):format(COLOR_QUEST((self.questpart and L['questtitle_part'] or L['questtitle']):format(self.quest and self.quest.title or dots(self.Lretries),self.questpart)))
	
	elseif self.action=='talk' then
		text = (brief and "%s" or L["stepgoal_talk to".._done]):format(COLOR_NPC(ZGV.Localizers:GetTranslatedNPC(self.npcid)))
	
	elseif self.action=='get' then
		--if self.test==1 then goalcount=nil elseif self.test==2 then 
		text = GenericText(brief,self.action,COLOR_ITEM,remaining or self.count,self.target,not self.count or self.count==1,self.plural,_done)

	elseif self.action=='kill' then
		text = GenericText(brief,self.action,COLOR_MONSTER,remaining or self.count,self.target,not self.count or self.count==1,self.plural,_done)
		if self.usekillcount then goalcountnow=ZGV.recentKills[self.targetid] end
	
	elseif self.action=='collect' then
		goalcountnow = goalcountnow or GetItemCount(self.targetid)
		goalcountneeded = goalcountneeded or self.count
		remaining = remaining or goalcountneeded-goalcountnow
		if remaining<1 then remaining=goalcountneeded end
		text = GenericText(brief,self.action,COLOR_ITEM,remaining or self.count,self.target,not self.count or self.count==1,self.count~=1,_done)
	
	elseif self.action=='buy' then
		goalcountnow = goalcountnow or GetItemCount(self.targetid)
		goalcountneeded = goalcountneeded or self.count
		remaining = remaining or goalcountneeded-goalcountnow
		if remaining<1 then remaining=goalcountneeded end
		text = GenericText(brief,self.action,COLOR_ITEM,remaining or self.count,self.target,self.count==0,self.count~=1,_done)
	
	elseif self.action=='goal' then
		text = GenericText(brief,self.action,COLOR_GOAL,remaining or self.count,self.target,not self.count or self.count==1,false,_done)

	elseif self.action=='earn' then
		local name,count = GetCurrencyInfo(self.targetid)
		goalcount = goalcount or count
		remaining = remaining or max(self.count-goalcount,0)
		text = GenericText(brief,self.action,COLOR_ITEM,(remaining>0 and remaining) or self.count,name,false,self.count and self.count>1,_done)
		goalmaxcount = (self.exact and self.count) or goalmaxcount or self.count
	
	elseif self.action=='from' then
		-- no text overriding; don't want the kill-list? don't use it.
		for i,mob in ipairs(self.mobs) do
			local mobname
			if mob.id then mobname=ZGV.Localizers:GetTranslatedNPC(mob.id) end
			if mobname then
				mob.name = mobname
			elseif not self.knownmissing then
				ZGV:Debug("Missing from NPC database: "..mob.name.." #"..(mob.id or "?"))
				self.knownmissing=true
			end
		end
		if #self.mobs>1 then
			-- contraction
			ZGV.db.profile.contractmobs = true
			
			if ZGV.db.profile.contractmobs and ZygorGuidesViewer_L("Specials")['contract_mobs'] then
				local contr = ZygorGuidesViewer_L("Specials")['contract_mobs'](self.mobs)

				if contr then
					text = COLOR_MONSTER(contr)
				end
			end
			if not text or text=="?" then
				-- regular listing
				text = ""
				for i,mob in ipairs(self.mobs) do
					if #text>0 then text = text .. ", " end
					text = text .. COLOR_MONSTER(plural(mob.name,nil,mob.pl and 2 or 1))
				end
			end
		else
			text = COLOR_MONSTER(plural(self.mobs[1].name,self.mobs[1].pl and 2 or 1))
		end
		text = L['stepgoal_kill']:format(text)

	elseif self.action=='ding' then
		text = (brief and L["stepgoal_ding_brief"] or L["stepgoal_ding"]):format(COLOR_NPC(self.level))
		if showcompleteness then
			local percent
			local level = ZGV:GetPlayerPreciseLevel()
			percent = (level<self.level-1) and 0 or (level>=self.level) and 100 or floor(UnitXP("player")/UnitXPMax("player") * 100)
			progtext = L["completion_ding"]:format(percent)
		end

	elseif self.action=='fpath' then text = L["stepgoal_fpath"]:format(COLOR_LOC(self.param))
	elseif self.action=='home' then text = L["stepgoal_home"]:format(COLOR_LOC(self.param))
	elseif self.action=='use' then text = L["stepgoal_use"]:format(COLOR_ITEM(self.item or "item #"..self.itemid))
	elseif self.action=='item' then text = L["stepgoal_item"]:format("|c"..select(4,GetItemQualityColor(select(3,GetItemInfo(self.itemid)) or 2)).. (self.item or "item #"..self.itemid))
	elseif self.action=='cast' then text = L["stepgoal_cast"]:format(COLOR_ITEM(self.castspell or "spell #"..self.castspellid))
	elseif self.action=='petaction' then text = L["stepgoal_petaction"]:format(self.petaction)
	elseif self.action=='havebuff' then text = L["stepgoal_havebuff"]:format(COLOR_ITEM(self.buff))
	elseif self.action=='nobuff' then text = L["stepgoal_nobuff"]:format(COLOR_ITEM(self.buff))
	elseif self.action=='invehicle' then text = L["stepgoal_invehicle"]
	elseif self.action=='outvehicle' then text = L["stepgoal_outvehicle"]
	elseif self.action=='equipped' then text = L["stepgoal_equipped"]:format(self.target)
	elseif self.action=='hearth' then text = L["stepgoal_hearth to"]:format(COLOR_LOC(self.param))
	elseif self.action=='rep' then
		text = L["stepgoal_rep"]:format(ZGV.StandingNames[self.rep],self.faction)
		if showcompleteness then
			progtext = L["completion_rep"]:format(ZGV:GetReputation(self.faction):Going())
		end
	elseif self.action=='goto' --[[or (self.action=='fly' and self.map==ZGV.CurrentMapID)]] then
		--if self.CurrentGuide.steps[self.CurrentStepNum-1] and self.CurrentGuide.steps[self.CurrentStepNum-1].map~=goal.map then
		if self.map~=ZGV.CurrentMapID then
		-- different map
			if self.x then
				-- and coords
				text = COLOR_LOC(L['map_coords']:format(GetMapNameByID(self.map),self.x,self.y))
			else
				-- just the map
				text = COLOR_LOC(GetMapNameByID(self.map or 0))
			end
		else
			-- same map
			text = COLOR_LOC(L['coords']:format(self.x or 0,self.y or 0))
		end
		if self.waytitle then
			text = self.waytitle.." ("..text..")"
		end
		text = (brief and "%s" or L["stepgoal_go to"]):format( text )

	elseif (self.action=='fly') then
		-- just the map
		text = (brief and "%s" or L[UnitOnTaxi("player") and "stepgoal_arrive" or "stepgoal_fly"]):format( 
			COLOR_LOC(self.map==ZGV.CurrentMapID and self.landing or self.landing..", "..GetMapNameByID(self.map)) )

	elseif self.action=="achieve" then
		local id, name, points, completed = GetAchievementInfo(self.achieveid)
		if self.achievesub then
			local desc,ctype,completed,quantity,required = GetAchievementCriteriaInfo(self.achieveid,self.achievesub)
			text = L["stepgoal_achievesub"]:format(COLOR_QUEST(desc),COLOR_ITEM(name))
		else
			text = L["stepgoal_achieve"]:format(COLOR_ITEM(name))
		end
		if showcompleteness then
			if self.achievesub then
				-- partial achievement
				local desc,ctype,completed,quantity,required = GetAchievementCriteriaInfo(self.achieveid,self.achievesub)
				progtext = L["completion_goal"]:format(quantity,required)
			else
				-- full achievement
				local id, name, points, completed = GetAchievementInfo(self.achieveid)
				local numcrit = GetAchievementNumCriteria(self.achieveid)
				local completenum = 0
				for i=1,numcrit do
					local desc,ctype,completed,quantity,required = GetAchievementCriteriaInfo(self.achieveid,i)
					if completed then completenum=completenum+1 end
				end
				progtext = L["completion_goal"]:format(completenum,numcrit)
			end
		end
	elseif self.action=="skill" then
		text = L["stepgoal_skill"]:format(COLOR_ITEM(ZGV.LocaleSkills[self.skill]),self.skilllevel)
	elseif self.action=="skillmax" then
		local spell = skillspells[self.skill] and skillspells[self.skill][self.skilllevel]
		if spell and spell>0 then
			text = L["stepgoal_skillmax2"]:format(COLOR_ITEM(GetSpellInfo(spell)))
		else
			text = L["stepgoal_skillmax"]:format(COLOR_ITEM(ZGV.LocaleSkills[self.skill]),self.skilllevel)
		end
	elseif self.action=="learn" then
		text = L["stepgoal_learn"]:format(COLOR_ITEM(self.recipe))

	elseif self.action=="learnspell" then
		text = L["stepgoal_learnspell"]:format(COLOR_ITEM(GetSpellInfo(self.spellid)))

	elseif self.action=="learnpet" then
		text = L["stepgoal_learnpet"]:format(COLOR_ITEM(ZGV.Localizers:GetTranslatedNPC(self.petid)))

	elseif self.action=="learnmount" then
		text = L["stepgoal_learnmount"]:format(COLOR_ITEM(ZGV.Localizers:GetTranslatedNPC(self.petid)))

	elseif self.action=="create" then
		if self.skill then
			-- new syntax

			local skill = ZGV:GetSkill(self.skill)
			local skill_loc = ZGV.LocaleSkills[self.skill]

			if self:IsComplete() then
				text = ("Created %s"):format(COLOR_ITEM(self.spell))
				progtext = ("\n (%s level %s reached)"):format(COLOR_ITEM(skill_loc), COLOR_GOAL(self.skilllevel))
			else
				local errortype

				local errormsgs = {
					maxlevel = "\n (max skill level too low)",
					closed = "\n (open %s window)",
					unknown = "\n (unknown recipe)",
					trivial = "\n (creating %s won't raise your skill anymore)",
					lackingredients = "\n (ingredients suffice for only %s)",
					noingredients = "\n (not enough ingredients)",
					wtf = "\n (?unknown error?)",
				}

				if self.skilllevel then
					-- create until skill reaches level
					local modifier=1
					local remaining=self.skilllevel - skill.level
					local remaining_avg=0

					if skill.level>=self.skilllevel then
						self.recipedata=nil
						--errortype = "(done)"
					elseif self.skilllevel>skill.max then
						self.recipedata=nil
						errortype = "maxlevel"
					else
						if not self.recipedata or self.recipedata.lastskill~=skill then
							self.recipedata,errortype = get_recipe(self.skill,self.spellid)
						end
						self.castspellid = self.spellid
					end


					if self.recipedata and self.recipedata.type then
						if self.recipedata.type=="optimal" then modifier = 1
						elseif self.recipedata.type=="medium" then modifier = 1.5
						elseif self.recipedata.type=="easy" then modifier = 3
						elseif self.recipedata.type=="trivial" and remaining>0 then errortype="trivial"
						else errortype = "wtf" end
				
						if modifier>0 and self.recipedata.numup>0 then
							remaining_avg = math.ceil(remaining / self.recipedata.numup * modifier)
						end
					end

					-- important info to display:
					-- skill_loc
					-- self.item == item name
					-- remaining == avg items to produce

					if errortype=="trivial" then
						-- gray
						text = ("Gain %s skill points to reach %s level %s"):format(COLOR_GOAL(remaining), COLOR_ITEM(skill_loc), COLOR_GOAL(self.skilllevel))
						progtext = errormsgs['trivial']:format(COLOR_ITEM(self.spell))
					elseif errortype or remaining<1 then
						-- error?
						text = ("Gain %s skill points, creating %s\n Reach %s level %s"):format(COLOR_GOAL(remaining), COLOR_ITEM(self.spell), COLOR_ITEM(skill_loc), COLOR_GOAL(self.skilllevel))
						if errortype then progtext = errormsgs[errortype]:format(skill_loc) end
					elseif not self.recipedata or (self.recipedata.type=="optimal" and self.recipedata.numup==1) then
						-- orange or standard
						text = ("Gain %s skill points, creating %s\n Reach %s level %s"):format(COLOR_GOAL(remaining), COLOR_ITEM(self.spell), COLOR_ITEM(skill_loc), COLOR_GOAL(self.skilllevel))
					elseif self.recipedata.type=="optimal" and self.recipedata.numup>1 then
						-- orange
						text = ("Gain %s skill points, creating %s %s\n Reach %s level %s"):format(COLOR_GOAL(remaining), COLOR_GOAL(math.ceil(remaining/self.recipedata.numup)), COLOR_ITEM(self.spell), COLOR_ITEM(skill_loc), COLOR_GOAL(self.skilllevel))
					elseif self.recipedata.type=="easy" or self.recipedata.type=="medium" then
						-- yellow/green
						text = ("Gain %s skill points, creating about %s %s\n Reach %s level %s"):format(COLOR_GOAL(remaining), COLOR_GOAL(remaining_avg), COLOR_ITEM(self.spell), COLOR_ITEM(skill_loc), COLOR_GOAL(self.skilllevel))
					else
						text = "?wtf?"
					end

					if not progtext and self.recipedata and self.recipedata.avail<remaining then
						if self.recipedata.avail==0 then
							progtext = errormsgs['noingredients']
						elseif remaining>self.recipedata.avail then
							progtext = errormsgs['lackingredients']:format(COLOR_GOAL(self.recipedata.avail))
						end
					end

					self.skillnum = math.ceil(remaining / (self.recipedata and self.recipedata.numup or 1))
				
				elseif self.count then
					-- create until n items are obtained

					if not self.recipedata or self.recipedata.lastskill~=skill then
						self.recipedata,errortype = get_recipe(self.skill,self.spellid)
					end

					local have=0

					if self.recipedata and self.recipedata.itemid then
						self.targetid = self.recipedata.itemid
						have = GetItemCount(self.recipedata.itemid)
						if have then
							if have>=self.count then
								text = ("Created %s %s"):format(COLOR_GOAL(self.count),COLOR_ITEM(plural(self.spell,self.count)))
							else
								-- primary display
								text = ("Create %s %s"):format(COLOR_GOAL(self.count-have),COLOR_ITEM(plural(GetItemInfo(self.recipedata.itemid),self.count-have)))
								if self.recipedata.avail==0 then
									progtext = errormsgs.noingredients
								elseif self.count-have>self.recipedata.avail then
									progtext = errormsgs.lackingredients:format(COLOR_GOAL(self.recipedata.avail))
								end
							end
						end
					else
						text = L['stepgoal_perform_'..(self.skill:lower())]:format(COLOR_GOAL(self.count),COLOR_ITEM(plural(self.spell,self.count)))
						progtext = errormsgs[errortype]:format(skill_loc)
					end

					self.skillnum = max(0,min(tonumber(self.count)-have or 0,self.recipedata and tonumber(self.recipedata.avail) or 0))

				else
					
					text = "error in create: no skill, no total, no nothing"
				end
			end

		else
			-- old create syntax
			text = GenericText(brief,"create",COLOR_ITEM,self.count,GetItemInfo(self.itemid),not self.count or self.count==1,self.count and self.count>1,_done)
		end
		
	elseif self.action=="complete" then
		local txt
		goalcountneeded=false
		local q=self.quest
		if q then
			if self.objnum then
				if q.goals then
					local goal = q.goals[self.objnum]
					if goal then
						-- BINGO!
						txt = goal.item
						goalcountneeded = goal.needed and goal.needed>1
					else
						txt = q.title.." (#"..self.objnum.." ??)"
					end
				else
					txt = q.title.." (#"..self.objnum..")"
				end
			else
				txt = q.title
			end
		else
			txt = "(?)"
		end
		text = L["stepgoal_complete"]:format(COLOR_GOAL(txt))

	elseif self.action=="confirm" then
		text = L["stepgoal_confirm"]

	elseif self.action=="click" then
		text = GenericText(brief,self.action,COLOR_ITEM,remaining or self.count,self.target,true,self.plural,_done)

	elseif self.action=="clicknpc" then
		text = GenericText(brief,self.action,COLOR_ITEM,remaining or self.count,self.npc,true,self.plural,_done)

	elseif self.action=="info" then
		text = "|cffeeeecc"..(self.infoL or self.info).."|r"
	end

	
	-- trickiness: coordinates.

	if self.x -- if there's a coordinate
	and not (self.action=="goto" or self.action=="fly") -- but it's not a plain goto   --and not self.text
	and not (self.text and self.text:find("[0-9%.]-,[0-9%.]-")) -- and it's not a coord-in-text
	and not self.force_noway then
		text = text .. L['stepgoal_at_suff']:format(COLOR_LOC(L['coords']:format(self.x,self.y)))
	end




	-- apply the (2/4) totals now, or not

	if ZGV.db.profile.goaltotals then
		if goalcountnow and goalcountneeded and goalcountneeded>0 then progtext=L["completion_goal"]:format(goalcountnow,goalcountneeded)
		elseif goalcountneeded and goalcountneeded==0 then progtext=L["completion_count"]:format(goalcountnow)
		end

		if progtext then
			local col1,col2=""
			if complete then col1,col2=" ",""
			elseif ext then col1,col2=" |cffffbbbb","|r"
			else col1,col2=" |cffaaaaaa","|r"
			end
			
			text = text .. col1 .. progtext .. col2
		end
	end

	return text
end

function Goal:GetString()
	if self.action=="get" then
		return self.target
	elseif self.action=="goal" then
		return self.target
	elseif self.action=="kill" then
		--return goalstring_slain:format(self.target)
		return self.target
	end
end

function Goal:Prepare(reset)
	self.macro = nil

	if reset then self.prepared = nil end

	if self.prepared then return end

	if self.castspellid then self.castspell=GetSpellInfo(self.castspellid) end

	if self.action=="goal" or self.action=="kill" or self.action=="get" then
		if self.questid and self.objnum then
			local questData = ZGV.questsbyid[self.questid]

			if questData and questData.inlog and questData.index>0 then
				local questGoalData = questData.goals[self.objnum]
				if questGoalData and questGoalData.needed and not self.exact and (not self.count or self.count==0 or self.count>questGoalData.needed) then
					self.count=questGoalData.needed
				end
			end
			if not self.count then self.count=1 end
		end
	end

	if self.countexpr and not self.countexprfun then
		local err
		self.countexprfun,err=loadstring("return ".. self.countexpr)
		if err then
			ZGV:Print("Error in step expression: '".. self.countexpr .."' error: '".. err .."'")
		end
	end

	if self.autoscript then
		local fun,err=loadstring(self.autoscript)
		if fun then
			setfenv(fun,ZGV.Parser.ConditionEnv)
			self.autoscriptfun = fun
		else
			ZGV:Print("Error in step autoscript: '".. self.autoscript .."' error: '".. tostring(err) .."'")
		end
	end

	-- For some reason, scripts are two-natured. The first nature is the .scriptfun method on a goal.
	if self.script and not self.scriptfun then
		ZGV:Debug("goal "..self.num.." loading script: "..self.script)
	
		local fun,err = loadstring(self.script)
		if fun then
			setfenv(fun,ZGV.Parser.ConditionEnv)
			self.scriptfun = fun
		else
			self:Print("Error in |script ".. self.script.." : ".. tostring(err))
		end
	end

	-- The second, shared with macros, is a clickable button.
	if (self.script or self.macrosrc)
	and self.action~="confirm" -- don't make macros for click lines!
	and (not self.macro or not GetMacroInfo(self.macro)) --[[and ZGV.db.profile.tweaks_domacros--]] then
		-- have source, need to "compile"
		if not InCombatLockdown() then
			-- do it now
			local macrosrc = self.script and ("/run "..self.script) or self.macrosrc
			macrosrc = macrosrc:gsub("{goalnum}",self.num) :gsub("{stepnum}",self.parentStep.num) :gsub("{;}","\n")
			
			local macroname = "ZGVMacro" .. self.num
			local macro = GetMacroIndexByName(macroname)  -- returns 0 if not found.

			if macro==0 then
				local MAX_ACCOUNT_MACROS = MAX_ACCOUNT_MACROS or 36
				local MAX_CHARACTER_MACROS = MAX_CHARACTER_MACROS or 18
				local storeglobal
				local numAccountMacros, numCharacterMacros = GetNumMacros()
				if numCharacterMacros>=MAX_CHARACTER_MACROS then storeglobal=true end
				if numAccountMacros>=MAX_ACCOUNT_MACROS then
					-- screw it
					macro = nil
				else
					macro = CreateMacro(macroname,self.macroicon or (self.macrosrc and self.macrosrc:find("showtooltip") and MACROICON_MISC) or MACROICON_MISC,macrosrc, not storeglobal)
				end
			end
			self.macro = macro
			if macro then
				if self.macrospell then SetMacroSpell(macro,GetSpellInfo(self.macrospell)) end
				if self.macroitem then SetMacroItem(macro,GetItemInfo(self.macroitem)) end
				ZGV:Debug("goal "..self.num.." set up macro "..self.macro..": "..macrosrc)
			else
				ZGV:Debug("goal "..self.num.." did NOT set up macro: out of macro space?")
			end
		else
			ZGV:Debug("goal "..self.num.." tried to set up macro, but we're in combat.")
		end
	end


	-- wipe completed quests by title, if they're instant
	--[[ moved to core code, to be done on ClearRecentActivities
	if self.action=="accept" or self.action=="turnin" then
		if self.questid then
			if ZGV.instantQuests[self.questid] and ZGV.completedQuestTitles[self.quest] then
				ZGV.completedQuestTitles[self.quest] = nil
			end
		end
	end
	--]]

	--ZGV:Debug("goal "..self.num.." prepared.")

	self.prepared = true
end

function Goal:IsObsolete()
	do return false end --obsoletion is by section now
end

local _n = {"ding","kill","rep","achieve","skill","skillmax","create","learn","learnspell","learnpet","learnmount"}
local nonaux = {}  for i=1,#_n do nonaux[_n[i]]=true end

function Goal:IsAuxiliary()
	if (self.questid or nonaux[self.action]) and not self.force_nocomplete
	then return false
	elseif self.action=="confirm" and self.always then return false 
	elseif self.action=="fpath" then
		local isc = self:IsComplete()
		-- it's true or false if LibTaxi is sure of its data.
		if isc~=nil then return isc end
		-- if it's not... guess.
		local step=self.parentStep
		for i=1,5 do
			step=step:GetNextStep()
			if not step then return false end
			while (step.requirement) do
				step=step:GetNextStep()
				if not step then return false end
			end
			--print("complete? "..tostring(step:IsComplete()))
			if step:IsComplete() then return true end
		end
		return false
	else
		return true
	end
end

function Goal:OnEnter()
	if self.autoscriptfun and (not ZGV.LastSkip or ZGV.LastSkip>=0) and not self.parentStep.needsreload then
		ZGV:Debug("calling autoscript ".. self.autoscript)
		ZGV.Parser.ConditionEnv._SetLocal(self.parentStep.parentGuide,self.parentStep,self)
		self:autoscriptfun()
		ZGV:Debug("called autoscript.")
	end

	self.fake_complete = nil
end

function Goal:GetIndentChildren()
	local children={}
	local goals = self.parentStep.goals
	for n=self.num+1,#goals do
		if goals[n].indent==self.indent+1 then
			tinsert(children,goals[n])
		elseif goals[n].indent<=self.indent then
			break
		end
	end
	return children
end

function Goal:CanBeIndentHidden()
	local children = self:GetIndentChildren()
	local all=#children>0
	if all then
		for ci,child in ipairs(children) do
			if not child:CanBeIndentHidden() then all=false break end
		end
	end
	local complete,completable = self:IsComplete()
	return (all and (complete or not completable)) or (#children==0 and complete)
end