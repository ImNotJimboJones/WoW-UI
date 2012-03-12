local ZGV = ZygorGuidesViewer
if not ZGV then return end

ZGV.Parser = {}
local Parser = ZGV.Parser

local L = ZygorGuidesViewer_L("Main")
local LG = ZygorGuidesViewer_L("Guides")

local BZL=ZGV.BZL

local table,string,tonumber,ipairs,pairs,setmetatable,tinsert = table,string,tonumber,ipairs,pairs,setmetatable,tinsert

--[[
local function split (s,t)
	local l = {n=0}
	local f = function (s)
		l.n = l.n + 1
		l[l.n] = s
	end
	local p = "%s*(.-)%s*"..t.."%s*"
	s = string.gsub(s,"^%s+","")
	s = string.gsub(s,"%s+$","")
	s = string.gsub(s,p,f)
	l.n = l.n + 1
	l[l.n] = string.gsub(s,"(%s%s*)$","")
	return l
end
--]]

-- Spec to Talent Tree # lookup table
local classtalents=
{
	["WARRIOR"]		= { "Arms","Fury","Protection" },
	["DEATHKNIGHT"]	= { "Blood","Frost","Unholy" },
	["MONK"]		= { "Brewmaster","Mistweaver","Windwalker" }, -- 5.0-ready. Who's awesome?
	["PALADIN"]		= { "Holy","Protection","Retribution" },
	["HUNTER"]		= { "Beast Mastery","Marksmanship","Survival" },
	["ROGUE"]		= { "Assassination","Combat","Subtlety" },
	["PRIEST"]		= { "Discipline","Holy","Shadow" },
	["MAGE"]		= { "Arcane","Fire","Frost" },
	["WARLOCK"]		= { "Affliction","Demonology","Destruction" },
	["SHAMAN"]		= { "Elemental","Enhancement","Restoration" },
	["DRUID"]		= { "Balance","Feral Combat","Restoration" },
	-- TODO When MoP hits we'd be having problems with druid-4 specs this way
}
-- Reversing the table
for k,v in pairs(classtalents) do
	local reverse={}
	for i,j in ipairs(v) do
		reverse[j]=i
	end
	classtalents[k]=reverse
end
ZGV.SpecToNumber=classtalents

ZGV.actionmeta = {
	goto = { skippable = true },
	fpath = { skippable = true },
	home = { skippable = true },
	hearth = { skippable = true },
}

local function split(str,sep)
	local fields = {}
	str = str..sep
	local tinsert=tinsert
	str:gsub("(.-)"..sep, function(c) tinsert(fields, c) end)
	return fields
end

local MapFloorCountCache = {}

function ZGV:SanitizeMapFloor(map,flr)
	if not MapFloorCountCache[map] then
		local mm,ff=GetCurrentMapAreaID(),GetCurrentMapDungeonLevel()
		SetMapByID(map)
		MapFloorCountCache[map]=GetNumDungeonMapLevels()
		SetMapByID(mm) SetDungeonMapLevel(ff)
	end
	return flr --[[and min (flr or 0,MapFloorCountCache[map])]] or MapFloorCountCache[map]>0 and 1 or 0 -- TODO make correct clamping if flr > max
end

local function ParseMapXYDist(text)
	local map,x,y,dist,flr,_,err

	-- old syntax: 12.3,44.2,-150
	map,x,y,dist = text:match("^(.+),([0-9%.]+),([0-9%.]+),(-?[0-9%.]+)$")
	if not map then x,y,dist = text:match("^([0-9%.]+),([0-9%.]+),(-?[0-9%.]+)$") end
	if not x then map,x,y = text:match("^(.+),([0-9%.]+),(-?[0-9%.]+)$") end
	if not x then
		-- new syntax, or just old without distance: 12.3,44.2 <150
		_,disttype,dist = text:match("^(.-)%s*([<>])([0-9%.]+)$")	text=_ or text
		_,x,y = text:match("^(.-)%s*([0-9%.]+),([0-9%.]+)$")  text=_ or text
		if #text>1 then map=text end
	end

	if not x and not y and not dist and not map then map=text end

	if map then
		-- only map name should be left in the text - might be text or numeric, and might have /floor
		_,flr = map:match("^(.+)%s*/%s*(%d+)$")
		map = _ or map
	end

	map = tonumber(map) or map
	if map=="" then map=nil end
	flr = tonumber(flr)
	x = tonumber(x)
	y = tonumber(y)
	dist=tonumber(dist)
	if dist and disttype==">" then dist=-dist end   -- distance written as <40 is usual; >40 = reverse distance check: "leave the area".

	--	if x then x=x/100 end
	--	if y then y=y/100 end
	--	if dist then dist=dist/100 or 0.2 end
	--if not dist then dist=0.2 end

	-- Map IDs, here we come.
	if type(map)=="string" then
		local mapid = ZGV.MapIDsByName[map]
		if type(mapid)=="table" then mapid=mapid[1] end
		if mapid then map=mapid else err="ERROR: map '"..map.."' unknown." map=0 end
	end
	-- strictly prevent a "map, no floor" return. Either both are nil, or neither is. This is to prevent cases when the map would change but the floor would accidentally remain.
	if map then
		flr=ZGV:SanitizeMapFloor(map,flr)
	end
	-- if map then flr=flr or 0 end  
	--if map then map=map+0.01*(floor or 0) end

	return map,flr,x,y,dist, err
end

-- cache map IDs. Testing.
function ZGV:DumpMapIDsByName()
	ZGV.MapIDsByName = {}
	local arr=ZGV.MapIDsByName
	for i=1,2000 do
		local n=GetMapNameByID(i)
		if n then
			if arr[n] then
				if type(arr[n])=="number" then arr[n]={arr[n]} end
				tinsert(arr[n],i)
			else
				arr[n]=i
			end
		end
	end

	local s="ZGV.MapIDsByName={\n"
	for n,ids in pairs(arr) do
		s=s.." ['".. n:gsub("'","\\'") .."']="
		if type(ids)=="number" then
			s=s..ids..",\n"
		else
			s=s.."{"..table.concat(ids,",").."},\n"
		end
	end
	s=s.."}"
	self:ShowDump(s,"Map IDs",true)
end

-- jak odr�ni� te mapy co si� powtarzaj�... bo to zonuj�ce s�...

local LibRover = LibStub("LibRover-1.0")
ZGV.MapIDsByName = LibRover.data.MapIDsByName

local zoned = {
	['Gilneas']={539,545,678,679},
	['Mount Hyjal']={606,683},
	['The Lost Isles']={544,681,682},
	['The Maelstrom']={737,751},
	['Twilight Highlands']={700,770},
	['Uldum']={720,748},
	['Zul\'Gurub']={697,793},
}

local function ParseID(str)
	local name,id,nid,obj
	name,id = str:match("(.*)##([0-9/]*)")
	if not name then id = str:match("^([0-9/]*)$") end
	if id then
		nid,obj = id:match("([0-9]*)/([0-9]*)")
		if nid then
			id=nid
		end
	end
	if id then id = tonumber(id) end
	if obj then obj = tonumber(obj) end
	if not name and not id then name=str end
	return name, id, obj
end

--- parse just the header, until the first 'step' tag. No chunking, just header data extraction.
function Parser:ParseHeader(text)
	if not text then return {} end
	local guides = {}
	local index = 1

	text = text .. "\n"

	local linecount=0

	local header = {}

	while (index<#text) do
		local st,en,line=string.find(text,"(.-)\n",index)
		if not en then break end
		index = en + 1

		linecount=linecount+1
		if linecount>100000 then
			return nil,linecount,"More than 100000 lines!?"
		end

		line = line:gsub("^[%s	]+","")
		line = line:gsub("[%s	]+$","")
		line = line:gsub("//.*$","")
		line = line:gsub("||","|")

		local cmd,params = line:match("([^%s]*)%s?(.*)")

		if cmd then
			if cmd=="step" then
				break
			else
				header[cmd]=params
			end
		end
	end

	if header['guide'] then
		header['title']=header['guide']
		header['guide']=nil
	end

	return header
end

local ConditionEnv = {
	_G = _G,
	-- variables needing update
	level=1,
	ZGV=ZGV,

	-- these must be assigned in an _Update() call, if "local" scripts are to work. HORRIBLE local-faking.
	guide=nil,
	step=nil,
	goal=nil,

	_Update = function()
		Parser.ConditionEnv.level = ZGV:GetPlayerPreciseLevel()
		if ZGV.db.char.fakelevel and ZGV.db.char.fakelevel>0 then Parser.ConditionEnv.level=ZGV.db.char.fakelevel end
	end,

	_Setup = function()
		-- reputation 'constants'
		for standing,num in pairs(ZGV.StandingNamesEngRev) do Parser.ConditionEnv[standing]=num end
	end,

	_SetLocal = function(guide,step,goal)
		Parser.ConditionEnv.guide=guide
		Parser.ConditionEnv.step=step
		Parser.ConditionEnv.goal=goal
	end,

	-- independent data feeds
	rep = function(faction)
		return ZGV:GetReputation(faction).standing
	end,
	skill = function(skill)
		return ZGV:GetSkill(skill).level
	end,
	skillmax = function(skill)
		return ZGV:GetSkill(skill).max
	end,
	raceclass = function(raceclass)
		return ZGV:RaceClassMatch(raceclass,true)
	end,
	completedq = function(id)
		return ZGV.completedQuests[id]
	end,
	havequest = function(id)
		local q=ZGV.questsbyid[id]
		return q and q.inlog
	end,
	gotostep = function(num,num2)
		ZGV:GotoStep(num,num2)
	end,
	achieved = function(achieveid)
		return select(4,GetAchievementInfo(achieveid))
	end,
	haspet = function(petid)
		local id,name,spell
		for i=1,GetNumCompanions("CRITTER") do
			 id,name,spell = GetCompanionInfo("CRITTER",i)
			 if id==petid then return true end
		end
	end,
	hasmount = function(petid)
		local id,name,spell
		for i=1,GetNumCompanions("MOUNT") do
			 id,name,spell = GetCompanionInfo("MOUNT",i)
			 if id==petid then return true end
		end
	end,
	itemcount = function(...)
		local total = 0
		local count = select("#", ...)
		for i = 1, count do
			total = total + GetItemCount(select(i, ...))
		end
		return total
	end,
	heroic_dung = function(diff)
		diff = diff or 2
		return GetDungeonDifficulty()==diff
	end,
	heroic_raid = function(diff)
		diff = diff or 3
		return GetCurrentRaidDifficulty()==diff
	end,
}
Parser.ConditionEnv=ConditionEnv  --DEBUG

local function MakeCondition(cond,forcebool)
	local s
	if cond:find("return") then
		-- leave it be
	elseif forcebool then
		cond = ("_Update()  return not not (%s)"):format(cond)
	else
		cond = ("_Update()  return (%s)"):format(cond)
	end
	local fun,err = loadstring(cond)
	if fun then setfenv(fun,ConditionEnv) end
	return fun,err
end
--local yield=coroutine.yield

--- parse ONE guide section into usable arrays.
function Parser:ParseEntry(guide,fully_parse,lastparsed)
	local text = guide.rawdata

	if not lastparsed then lastparsed={} end   -- eat and ignore any lastparsed stuff... too bad.
	lastparsed.linenum=-1
	lastparsed.linedata="(none)"
	if not text then return nil,"No text!",0 end
	local index = 1

	local step

	local prevmap,prevfloor
	local prevlevel = 0
	local prevtitle

	local prevpathvars={}

	text = text .. "\n"

	local linecount=0

	local noobsoletequests = {}
	local dailyquests = ZGV.dailyQuests

	local function COLOR_LOC(s) return "|cffffee77"..s.."|r" end

	local _

	local strfind = string.find

	if fully_parse and not guide.steps then guide.steps={} end

	-- guess guide type
	assert(not guide.title:match("^Zygor's")) -- We should have runned guide title sanitation by now, do we? ~aprotas
	if guide.title:match("Leveling") then guide.type="leveling"
	elseif guide.title:match("Dailies") then guide.type="daily"
	elseif guide.title:match("Loremaster") then guide.type="loremaster"
	elseif guide.title:match("Event") then guide.type="event"
	elseif guide.title:match("Mounts") then guide.type="mount"
	elseif guide.title:match("Pets") then guide.type="pet"
	end

	-- clear some fields before reparsing
	guide.description=nil

	--local debug
	--if text:find("goto The Exodar,44.9,24.2") then debug=true end

	-- do inclusion. Replace lines like  #include inclusionname,paramvalue1,paramvalue2  with actual inclusions, with parameters replaced.
	local function do_include(line)
		line = line:gsub("\\,","##COMMA##") :gsub("\\\"","##QUOTE##")
		line = line:gsub('%s*//.-$',"")
		local words={strsplit(",",line)}
		local title = tremove(words,1)
		title = title:gsub("^%s*",""):gsub("%s*$","")
		title = title:gsub('^"(.-)"',"%1")
		local params={}
		for i,word in ipairs(words) do
			local param,val = word:match("(.-)%s*=%s*\"(.-)\"")
			if param then params[param]=val end
		end
		local inclusion = ZGV.registered_includes[title]
		return inclusion and inclusion:GetParsed(params) or ""
	end

	local safety=0
	while (text:find("#include")) do
		text = text:gsub("#include (.-)[\r\n]",do_include)
		safety=safety+1
		assert(safety<20,"#include recursion exceeded safety depth")
	end

	-- replace faux newlines
	text = text:gsub("||","\n")

	local breakout

	local do_debug
	
	local function parseerror(msg)
		return nil,msg,linecount,guide and #guide.steps,chunk
	end
	
	-- Registers a correspondence between mount spell id and a guide to obtain it
	local function registerMountSpell(spellid,guide)
		assert(ZGV)
		if not ZGV.mountSpellDatabase then 
			ZGV.mountSpellDatabase={}
		end
		ZGV.mountSpellDatabase[spellid]=guide
	end
	
	-- Registers a correspondence between pet spell id and a guide to obtain it
	local function registerPetID(petid,guide)
		assert(ZGV)
		if not ZGV.petIDDatabase then 
			ZGV.petIDDatabase={}
		end
		ZGV.petIDDatabase[petid]=guide
	end

	while (index<#text) do
		local st,en,line=strfind(text,"%s*(.-)%s*\n",index)
		--if debug then print(line) end
		if not en then break end
		index = en + 1

		linecount=linecount+1
		if linecount>100000 then
			return nil,linecount,"More than 100000 lines!?"
		end
		--if linecount%50==0 then yield() end

		--line = line:gsub("^%s+","")
		--line = line:gsub("%s+$","") --done in the find

		--st,en = strfind(line,"//",1,true)
		--if st then line=line:sub(1,st-1) end
		-- not really faster
		lastparsed.linenum=linecount
		lastparsed.linedata=line

		if guide.crapt then
			--line,guide.crapt=__uncrapt(line,guide.crapt)
		end

		-- Process the line!
		-- it's supposedly left- and right-trimmed by the find above.
		if guide.type=="macro" then -- Stop processing
			if guide.macro.body == ZGV.MacroGuideProto.body then -- If it's not set, reset
				guide.macro.body=""
			end
			guide.macro.body=guide.macro.body..line.."\n"
			if #guide.macro.body>255 then
				return parseerror("macros cannot exceed 255 characters")
			end
		else
			-- remove comments, retrim
			line = line:gsub("%s*//.*$","")

			-- extract indent, retrim
			local indent
			indent,line = line:match("^(%.*)%s*(.-)$")

			-- extract asterisk, retrim
			local had_asterisk=nil
			if line:find("^%*") then
				line=line:gsub("^%*%s*","")
				had_asterisk=true
			end

			-- strip leading pipes, retrim
			line = line:gsub("^|%s*","")

			local goal={}

			local chunkcount=1

			if do_debug then ZGV:Debug("Parsing: line "..linecount..": "..line) end

			-- cloak escaped pipes
			line = line:gsub("\\|","%%PIPE%%")

			line = line .. "|"
			for chunk in line:gmatch("%s*(.-)%s*|+") do
				
				-- un-cloak escaped pipes
				chunk = chunk:gsub("%%PIPE%%","|")

				-- we have a trimmed chunk here

				-- spacify leading quotes
				chunk = chunk:gsub("^'%s*","' ")

				--chunk = chunk:gsub("^turn in ","turnin ")
				--chunk = chunk:gsub("^@(%S)","@ %1")  --unused so far

				local cmd,params = chunk:match("^([^%s]*)%s*(.-)$")

				if do_debug then ZGV:Debug(": "..chunk) end

				-- guide parameters
				if cmd=="defaultfor" then
					local cond = "raceclass('"..params.."',true) and " .. (params=="DeathKnight" and "level<59" or "level<15")
					guide.condition_suggested = MakeCondition(cond)
					guide.condition_suggested_raw = cond
				elseif cmd=="next" then
					params = params:gsub("^\"(.-)\"$","%1")
					if params:match("^%d+$") then params=tonumber(params) end
					if not step then
						-- guide-wide
						guide.next=ZGV:SanitizeGuideTitle(params)

					--elseif chunkcount==1 then
					--	-- step-wide
					--	step.next=params
					else
						-- goal-local
						if params=="" then params="+1" end
						goal.next=params
					end
				elseif cmd=="author" then
					guide[cmd]=params
					
				elseif cmd=="description" then
					local keywords = params:match("^# (.+)")
					if keywords then
						guide.keywords=keywords
					else
						guide[cmd]=(guide[cmd] and (guide[cmd].."\n") or "") .. params
					end
				
				--elseif cmd=="faction" then --unused
				--	guide[cmd]=params
				elseif cmd=="startlevel" then
					guide[cmd]=tonumber(params)
					if not guide[cmd] then return parseerror("bad level number") end
					prevlevel=math.floor(guide[cmd])

				elseif cmd=="endlevel" then
					guide[cmd]=tonumber(params)
					if not guide[cmd] then return parseerror("bad level number") end

				elseif cmd=="type" then
					guide.type=params

				elseif cmd=="completion" then
					local pars = split(params,",")
					guide.completionmode = pars[1]
					guide.completionparams = {pars[2],pars[3],pars[4]}

				elseif cmd=="leechsteps" then
					local fromguide,from,to = params:match("^\"(.+)\"%s-,%s-(.-)%s-,%s-(.-)$")
					
					guide.leechsteps_guide = ZGV:SanitizeGuideTitle(fromguide or params:match("^\"(.+)\"$") or params) :gsub("\\+","\\")
					guide.leechsteps_from = from or 1
					guide.leechsteps_to = to or 999

					if fully_parse then

						-- okay, just do it now.
						local leechedguide = ZGV:GetGuideByTitle(guide.leechsteps_guide)
						if not leechedguide then ZGV:Debug("leeched '"..guide.leechsteps_guide.."' not found in "..guide.title) breakout=true break end
						if not leechedguide.fully_parsed then
							ZGV:Debug("Forcefully parsing "..guide.leechsteps_guide.." for leeching")
							local parsed = leechedguide:Parse(true)
							if not parsed or not leechedguide.steps then
								ZGV:Debug("leeched not parsing")
								breakout=true
								break
							end
						end

						ZGV:Debug("Parser:'leechsteps' guide "..guide.leechsteps_guide.." from "..guide.leechsteps_from.." to "..guide.leechsteps_to)

						local leeched=0
						-- okay, leech
						for i=guide.leechsteps_from,guide.leechsteps_to do
							-- holy shit. Clone all the steps. No memory shall be spared :(
							local step = leechedguide.steps[i]
							if step then
								local newstep = { goals = {} }
								setmetatable(newstep,ZGV.StepProto_mt)
								for k,v in pairs(step) do
									if k=="goals" then
										for gi,goal in ipairs(v) do
											local newgoal = {}
											setmetatable(newgoal,ZGV.GoalProto_mt)
											for gk,gv in pairs(goal) do
												if type(gv)~="function" then newgoal[gk]=gv end
											end
											newgoal.parentStep = newstep
											tinsert(newstep.goals,newgoal)
										end
									elseif type(v)~="function" then newstep[k]=v end
								end
								
								newstep.parentGuide = guide
								newstep.num = #guide.steps+1

								-- cloned! save, next.
								tinsert(guide.steps,newstep)
								leeched=leeched+1
							end
						end
						
						ZGV:Debug("Leeched "..leeched.." steps, total now "..(#guide.steps)..".")
					end

				-- TODO the parseerror here seems to wreak mayhem everywhere
				-- Only for certain class
				elseif cmd=="class" then
					-- Do we need the support of something like "only for druids and shamans" ?
					if guide[cmd] and guide[cmd]~=params then return parseerror("can't specify multiple classes for a guide, make it general") end 
					local classes={}
					FillLocalizedClassList(classes)
					if not classes[params] then return parseerror("class "..params.." is unknown to science") end
					guide.icon=guide.icon or { texname="Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes",
												coords = CLASS_ICON_TCOORDS[params] }
					guide.classicon=guide.icon -- In case we need to restore it for some reason
					guide[cmd]=params
				
				-- Only for certain specs
				elseif cmd=="spec" then
										local function tablelength(T) -- TODO make it more beautiful, anyone?
						local count = 0
						for _ in pairs(T) do count = count + 1 end
						return count
					end
					
					if not guide["class"] then return parseerror("spec specified without a class, what do you mean?") end
					local spec=ZGV.SpecToNumber[guide["class"]][params]
					if not spec then return parseerror("spec "..params.." either does not exist or belongs to the other class") end
					if not guide[cmd] then guide[cmd]={} end
					local lclass,kclass=UnitClass("player")
					if kclass==guide.class then -- If this is our class we may want to show a spec icon
						if tablelength(guide[cmd])==0 then
							-- This is *probaly* for a single spec and for our class
							local _,_,_,specicon=GetTalentTabInfo(spec,false,false,nil)
							guide.icon= { texname=specicon }
						else
							-- This is a multispec thing, screw it, let's show a class icon
							guide.icon=guide.classicon
						end
					end
					guide[cmd][spec]=true

				elseif cmd=="model" then
					if not step or not goal then
						-- guide-wide
						local models = split(params,",")
						for i=1,#models do
							local num = tonumber(models[i])
							if num then models[i]=num end
						end
						guide.model = models
					else
						-- local model
						goal.modelname,goal.model = ParseID(params)
					end

				elseif cmd=="nomodels" then
					goal.nomodels=true

				elseif cmd=="image" then
					guide.image=params

				elseif cmd=="icon" then
					local path,coords=params:match("(.-)%s(.*)")
					if not path then
						path=params
						coords={ 0,1,0,1 }
					elseif coords then
						coords={ coords:match("([0-9.]*),%s*([0-9.]*),%s*([0-9.]*),%s*([0-9.]*)") }
						for k,v in ipairs(coords) do coords[k]=tonumber(v) end
					end
					guide.icon= { texname=path, coords=coords }
				
				elseif cmd=="crapt" then
					guide[cmd]=params

				elseif cmd=="dynamic" then
					guide[cmd]=(params~="off")
					
				elseif cmd=="macroname" then
					-- TODO make sure it aint unique
					local name=params
					if not name then return parseerror("macro paramaters absent") end
					name=name:sub(1,14)
					name="ZG"..name
					if not guide.macro then guide.macro={} end
					guide.macro.name=name
					
				
				elseif cmd=="macroicon" then
					if not guide.macro then guide.macro={} end
					guide.macro.icon=params

				-- Macros. NB: there shouldnt be steps
				elseif cmd=="macrotext" then
					if not guide.macro then guide.macro = {} end
					setmetatable(guide.macro,ZGV.MacroGuideProto_mt)
					guide.condition_end=function(self) return not not self.macro:LocateMacro() end
					guide.condition_end_msg = L["macro_exists"]
					guide.type="macro"
					guide.completionmode="macro"
					guide.completionparams=""

				elseif cmd=="step" then
					if guide.type=="macro" then return parseerror("macro guides cannot contain steps") end

					if not fully_parse then
						guide.steps=nil

						-- THIS SUCKS. Find the last ding to find the last level.
						while st do
							local lev
							st,en,lev = text:find("[ \t\r\n]ding ([0-9]+)[ \t\r\n]",en+1)
							if lev then prevlevel = tonumber(lev) end
						end
						breakout=true
						break
					end

					step = { goals = {}, map = prevmap, floor=prevfloor, level = prevlevel, num = #guide.steps+1, parentGuide=guide, title=prevtitle }
					setmetatable(step,ZGV.StepProto_mt)

					tinsert(guide.steps,step)

					params = params:gsub("^\"(.-)\"$","%1") -- strip quotes
					if params~="" then
						step.label=params
					end

				elseif cmd=="label" then
					params = params:gsub("^\"(.-)\"$","%1")
					step.label = params

				-- step parameters
				elseif cmd=="level" then
					step[cmd]=params
					prevlevel=tonumber(params)

				elseif cmd=="title" then
					if chunkcount>1 then
						goal[cmd]=params
					else
						if params:find("^+") then
							params=params:gsub("^+%s*","")
							prevtitle=params
						end
						step[cmd]=params
					end

				elseif cmd=="map" then
					local map,flr,x,y,dist, err = ParseMapXYDist(params)  -- a bit redundant, but a map/floor pair is fine to get here.
					if not map then return parseerror("map '"..params.."' unknown.") end
					prevmap,prevfloor = map,flr
					if step then  step.map,step.floor = map,flr  end

				--[[
				elseif cmd=="@" then
					local map,x,y
					map,x,y = params:match("(.+),([0-9.]+),([0-9.]+)")
					if not map then
						x,y = params:match("([0-9.]+),([0-9.]+)")
					end
					if not x then
						map = params
					end
					if not map then
						map = prevmap
					end
					step['map']=map
					prevmap=map
					if x or y then
						step['x']=x
						step['y']=y
					end
				--]]
				-- goal commands
				elseif cmd=="accept" or cmd=="turnin" then
					goal.action = goal.action or cmd
					if not params then return parseerror("no quest parameter") end
					goal.quest,goal.questid = ParseID(params)
					if goal.quest then
						local q,qp = goal.quest:match("^(.-)%s-%((%d+)%)$")
						if q then goal.quest,goal.questpart=q,qp end
					end
					if not goal.quest and not goal.questid then return parseerror("no quest parameter") end

					if goal.questid then
						if not step.level then return parseerror("Missing step level information") end
						local lev = ZGV.mentionedQuests[goal.questid]
						if guide.dynamic then
							if not lev or lev<step.level then lev=step.level end
						else
							if not lev then lev=-1 end
						end
						ZGV.mentionedQuests[goal.questid] = lev
					end

				elseif cmd=="talk" then
					
					goal.action = goal.action or cmd
					if not params then return parseerror("no npc") end
					goal.npc,goal.npcid = ParseID(params)
					if not goal.npc and not goal.npcid then return parseerror("no npc") end

				elseif cmd=="goto" or cmd=="at" then
					goal.action = goal.action or cmd

					local params2,title = params:match('^(.-)%s*"(.*)"')
					if title then params=params2 end
					
					local map,flr,x,y,dist, err = ParseMapXYDist(params)

					if err then return parseerror(err) end

					goal.map,goal.floor = (map or goal.map or step.map or prevmap), (flr or goal.floor or step.floor or prevfloor)
					if not goal.map then
						return parseerror("'"..cmd.."' has no map parameter, neither has one been given before.")
					end
					step.map,step.floor = goal.map,goal.floor
					prevmap,prevfloor = step.map,step.floor

					goal.x = x or goal.x
					goal.y = y or goal.y
					goal.dist = dist or goal.dist

					if (goal.action=="accept" or goal.action=="turnin" 	or goal.action=="kill" 	or goal.action=="get" 	or goal.action=="talk" 	or goal.action=="goal" 	or goal.action=="use") then
						goal.autotitle = goal.param or goal.target or goal.quest
					end
					
					goal.waytitle=title

				elseif cmd=="fly" then

					goal.action = goal.action or cmd

					for n,node in ipairs(LibRover.data.taxis) do
						if node.name==params then
							goal.x=node.x
							goal.y=node.y
							goal.map=node.m
							goal.floor= ZGV:SanitizeMapFloor(node.m,node.f)
							step.map,step.floor = goal.map,goal.floor
							prevmap,prevfloor = step.map,step.floor
							goal.dist = 50
							goal.landing = node.name
							goal.title = node.name -- TODO is this safe? ~aprotas
							break
						end
					end
					if not goal.map then
						return parseerror("'"..cmd.."' has an unknown landing name '"..params.."'.")
					end

				elseif cmd=="path" then
				
					local path=params
					if not step.waypath then step.waypath={follow="loose",loop=true,ants="straight",coords={}} end
					for var,val in pairs(prevpathvars) do step.waypath[var] = val or step.waypath[var] end

					-- remove plusses, trim
					path=path:gsub("^%+%s*","")
					path=path:gsub("%s*[	;]+%s*",";")
					path=path .. ";"
					for coord in path:gmatch("(.-);") do
						local map,flr,x,y,dist,err = ParseMapXYDist(coord)
						if x then
							if err then return parseerror(err) end  -- might happen, if the coords look good but map is bogus.
							local point = {map=map or step.map or prevmap,floor=flr or step.floor or prevfloor,x=x,y=y,dist=dist}
							tinsert(step.waypath.coords,point)
							prevmap,prevfloor = point.map,point.floor
						else
							-- no coords..? maybe a path command, then?
							local var,val = coord:match("^([^%s]+)%s+(.+)$")
							if not val then var,val=coord,1 end
							if val=="off" then val=false end
							if var:sub(1,1)=="<" then
								-- assign something to the last point. This sucks, but CBA to make it any better right now.
								step.waypath.coords[#step.waypath.coords][var:sub(2)] = tonumber(val) or val
							else
								-- plain two-word variable.
								step.waypath[var] = tonumber(val) or val
								prevpathvars[var] = tonumber(val) or val
							end
						end
					end

				elseif cmd=="kill" or cmd=="get" or cmd=="collect" or cmd=="goal" or cmd=="buy" then
					goal.action = goal.action or cmd

					-- first, extract the count
					-- oooh boy, this could be an expression..! gods help us.
					local count,excl,object

					count,object = params:match("^%((.*)%)%s*(.*)")
					if count then
						goal.countexpr = count
					else
						count,excl,object = params:match("^([0-9]+)(!?)%s+(.*)")
					end
					if not object then object=params end
					goal.count = tonumber(count) or 0
					if excl=="!" then goal.exact = 1 end

					-- check for plural
					local name,plural = object:match("^(.+)(%+)$")
					if plural then
						goal.plural=true
						object=name
					end

					-- now object##id
					goal.target,goal.targetid = ParseID(object)

					-- finally, assume buys are futureproof
					if cmd=="buy" then goal.future=true end

					-- something missing?
					if not goal.targetid and not goal.target then return parseerror("no parameter") end
					--[[
					if goal.target:match("%+%+") then
						if goal.target:match("%+%+$") then
							goal.target = goal.target:gsub("%+%+","")
							goal.targets = goal.target
						else
							local sing,pl = goal.target:match("(.+)%+%+%+(.+)")
							if not sing or not pl then
								sing = goal.target:gsub("([^%s%+]+)++([^%s%+]+)","%1")
								pl = goal.target:gsub("([^%s%+]+)++([^%s%+]+)","%2")
							end
							goal.target = sing
							goal.targets = pl
						end
					end
					--]]

				elseif cmd=="earn" then
					goal.action = goal.action or cmd

					local count,excl,object = params:match("^([0-9]+)(!?) (.*)")
					goal.count = tonumber(count) or 1
					if excl=="!" then goal.exact = 1 end
					goal.target,goal.targetid = ParseID(object)
					if not goal.targetid then return parseerror("no parameter") end

				elseif cmd=="create" then
					goal.action = goal.action or cmd

					local spell,skill,level = params:match("^(.-)%s*,%s*(.-)%s*,%s*(.+)$")
					if spell then
						goal.spell,goal.spellid = ParseID(spell)
						goal.spell = GetSpellInfo(tonumber(goal.spellid))

						local castskill 
						if skill=="Mining" or skill=="Smelting" then
							goal.skill = "Mining"
							castskill = ZGV.LocaleSkills["Smelting"]
						else
							goal.skill = skill
							castskill = ZGV.LocaleSkills[skill]
						end

						local total = level:match("(%d+) total")
						if total then
							goal.count=tonumber(total)
						else
							goal.skilllevel = tonumber(level)
						end

						goal.macrosrc = "#showtooltip ".. castskill .."{;}/run CloseTradeSkill(){;}/cast "..castskill.."{;}/run ZGV:PerformTradeSkillGoal({stepnum},{goalnum})"
						-- This is insane, I know. Here we have a macro that will call a function that will call upon the values above. Great and simple... NOT.
					else
						--local spell,num = params:match("^(.-)%s*,%s*([0-9]+)$")
						local num,item = params:match("^([0-9]+)%s+(.+)$")
						goal.count = tonumber(num)
						goal.item,goal.itemid = ParseID(item)
					end

				elseif cmd=="from" then
					goal.action = goal.action or cmd
					params=params:gsub([[\,]],"!!comma!!")
					params=params:gsub("%s*,%s*",",")
					goal.mobsraw = params
					local mobs = split(params,",")

					goal.mobs = {}
					for i,mob in ipairs(mobs) do
						mobs[i]=mob:gsub("!!comma!!",",")
						local name,plural = mob:match("^(.+)(%+)$")
						if not plural then name=mob end

						local nm,id = ParseID(name)
						
						tinsert(goal.mobs,{name=nm,id=id,pl=plural and true or false})
					end
					goal.mobspre = mobs
			elseif cmd=="complete" then
					goal.action = goal.action or cmd
				_,goal.questid,goal.objnum = ParseID(params)
				if not goal.questid then return parseerror("no quest parameter") end
				elseif cmd=="ding" then
					goal.action = goal.action or cmd
					goal.level = tonumber(params)
					if not goal.level then return parseerror("'ding': invalid level value") end
					prevlevel = tonumber(params)
				elseif cmd=="equipped" then
					goal.action = goal.action or cmd
					goal.target,goal.targetid = ParseID(params)
				elseif cmd=="hearth" then
					goal.action = goal.action or cmd
					goal.item = "Hearthstone"
					goal.itemid = 6948
					goal.itemuse = true
					goal.param = BZL[params]
					goal.force_noway = true
				elseif cmd=="rep" then
					goal.action = goal.action or cmd
					goal.faction,goal.rep = params:match("^(.-)%s*,%s*(.-)$")
					if type(goal.rep)=="string" then goal.rep=ZGV.StandingNamesEngRev[goal.rep] end
					if ZGV.BFL[goal.faction] then goal.faction=ZGV.BFL[goal.faction] end
				elseif cmd=="achieve" then
					goal.action = goal.action or cmd
					_,goal.achieveid,goal.achievesub = ParseID(params)
				elseif cmd=="skill" or cmd=="skillmax" then
					goal.action = goal.action or cmd
					goal.skill,goal.skilllevel = params:match("^(.+),([0-9]+)$")
					goal.skilllevel = tonumber(goal.skilllevel)
					if not goal.skill then return parseerror("'skill*': no skill found") end
					if cmd=="skillmax" and (goal.skilllevel % 75 > 0) then return parseerror("skillmax: you can't raise a skill max level to "..goal.skilllevel.."; did you mean "..(goal.skilllevel - goal.skilllevel % 75).." or "..(goal.skilllevel - goal.skilllevel % 75 + 75).." ?") end
				elseif cmd=="learn" then
					goal.action = goal.action or cmd
					goal.recipe,goal.recipeid = ParseID(params)
					if not goal.recipeid then return parseerror("'learn': no recipe found") end
				elseif cmd=="learnspell" then
					goal.action = goal.action or cmd
					goal.spell,goal.spellid = ParseID(params)
				elseif cmd=="learnpet" then
					goal.action = goal.action or cmd
					goal.pet,goal.petid = ParseID(params)
					registerPetID(goal.petid,guide) -- TODO mark duplicates
				elseif cmd=="learnmount" then
					goal.action = goal.action or cmd
					goal.spell,goal.spellid = ParseID(params)
					registerMountSpell(goal.spellid,guide) -- TODO mark duplicates
					
				elseif cmd=="fpath" or cmd=="home" then
					goal.action = goal.action or cmd
					goal.param = params
					if not goal.param then return parseerror("no parameter") end
				elseif cmd=="havebuff" then
					goal.action = goal.action or cmd
					goal.buff = params
					if not goal.buff then return parseerror("no parameter") end
				elseif cmd=="nobuff" then
					goal.action = goal.action or cmd
					goal.buff = params
					if not goal.buff then return parseerror("no parameter") end
				elseif cmd=="invehicle" then
					goal.action = goal.action or cmd
				elseif cmd=="outvehicle" then
					goal.action = goal.action or cmd
				elseif cmd=="condition" then	-- new in 3.1: supersede the "startlevel" eventually.
					if not step then
						local case,cond = params:match("(.-) (.+)$")
						if (case=="suggested" or case=="valid" or case=="invalid" or case=="end") and not step then
							local cond2,msg = cond:match("(.+)!!(.+)")
							if cond2 then cond=cond2 end
							if cond:sub(1,1)=="!" then
								-- special condition tag
								cond=cond:sub(2)
								local tag,data = cond:match("(.-) (.+)")
								data=data or true
								tag=tag or cond
								guide['condition_'..case..'_'..cond]=data
							else
								local fun,err = MakeCondition(cond,true)
								if not fun then return parseerror(err) end
								guide['condition_'..case..'_raw']=cond
								guide['condition_'..case]=fun
								guide['condition_'..case..'_msg']=msg
							end
						else
							return parseerror("wrong condition type (not suggested/valid/invalid/end) or rogue guide condition in steps")
						end
					else
						goal.action = goal.action or cmd
						local fun,err = MakeCondition(params,false)
						if not fun then return parseerror(err) end
						goal.condition_complete_raw=params
						goal.condition_complete = fun
					end

				elseif cmd=="click" then
					goal.action = goal.action or cmd
					goal.target,goal.targetid = ParseID(params)

				elseif cmd=="clicknpc" then
					goal.action = goal.action or cmd
					goal.npc,goal.npcid = ParseID(params)

				elseif cmd=="confirm" then
					goal.action = goal.action or cmd
					if params == "always" then
						goal.always = true
					else
						goal.always = false
					end
					goal.optional = true

				elseif cmd=="info" then
					goal.action = goal.action or cmd
					goal.info = params


				-- clickable icon displayers

				elseif cmd=="cast" then
					goal.action = goal.action or cmd
					goal.castspell,goal.castspellid = ParseID(params)
					if not goal.castspell and not goal.castspellid then return parseerror("no parameter") end
				elseif cmd=="petaction" then
					goal.action = goal.action or cmd
					goal.petaction = tonumber(params)
					if not goal.petaction then goal.petaction = params end
					if not goal.petaction then return parseerror("petaction needs an action number") end
				elseif cmd=="item" then
					goal.action = goal.action or cmd
					goal.item,goal.itemid = ParseID(params)
					if not goal.item and not goal.itemid then return parseerror("no parameter") end
				elseif cmd=="use" then
					goal.action = goal.action or cmd
					goal.item,goal.itemid = ParseID(params)
					goal.itemuse=true
					if not goal.item and not goal.itemid then return parseerror("no parameter") end
				elseif cmd=="script" then
					goal.script = params
				elseif cmd=="macro" then
					goal.macrosrc = params
				elseif cmd=="buttonicon" then
					goal.buttonicon = tonumber(params) or 1


				elseif cmd=="modelnpc" then
					goal.modelname,goal.modelnpc = ParseID(params)
				
				elseif cmd=="modeldisplay" then
					goal.modelname,goal.displayinfo = ParseID(params)
				
				-- conditions

				elseif cmd=="only" then
					local cond = params:match("^if%s+(.*)$")
					if cond then
						-- condition match
						local subject = goal  if chunkcount==1 then subject=step end

						local fun,err = MakeCondition(cond,true)
						if not fun then return parseerror(err) end

						subject.condition_visible_raw=cond
						subject.condition_visible=fun
					else
						-- race/class match
						params = params:gsub("%s*,%s*",",")
						if goal.action or goal.text or chunkcount>1 then
							if not ZGV:RaceClassMatch(split(params,",")) then
								goal={}
								break
							end -- skip goal line altogether
						else
							step.requirement=split(params,",")
						end
					end

				-- extra tags

				elseif cmd=="autoscript" then
					goal.autoscript = params
				elseif cmd=="n" then
					goal.force_nocomplete = true
				elseif cmd=="c" then
					goal.force_complete = true
				elseif cmd=="opt" then
					goal.optional = true
				elseif cmd=="noway" then
					goal.force_noway = true
				elseif cmd=="sticky" then
					goal.force_sticky = true
				elseif cmd=="important" then
					had_asterisk = true
				elseif cmd=="future" then
					goal.future = true  -- if quest-related, then don't worry if the quest isn't in the log.
				elseif cmd=="noobsolete" then
					if goal then
						goal.noobsolete = true
						if goal.questid then noobsoletequests[goal.questid] = true end
					else
						guide.noobsolete = true
					end
				elseif cmd=="travelfor" then
					step.travelfor = tonumber(params)

				elseif cmd=="daily" then
					if goal and goal.questid then dailyquests[goal.questid] = true end
					if not guide.steps or #guide.steps==0 then guide.daily=true end
				elseif cmd=="repeatable" then
					if goal and goal.questid then goal.repeatablequest = true end

				elseif cmd=="tip" then
					-- highlight _text_
					--params = params:gsub("_(.-)_","|cffffee88%1|r")
					-- or not, since it reverts to white.

				goal.tooltip = LG[params]

				elseif cmd=="image" then
					goal.image = params
				elseif cmd=="quest" or cmd=="q" then
					local first=params:match("^(.-),")
					if first then params=first end
					goal.quest,goal.questid,goal.objnum = ParseID(params)
					if not goal.questid then return parseerror("no questid in parameter") end
				elseif cmd=="or" then
					goal.orlogic = params and tonumber(params) or 1
				elseif cmd=="instant" then  -- when we HAVE to use the title, for instant-complete quests.
					if goal.questid then ZGV.instantQuests[goal.questid]=true end
					goal.usetitle=true
				elseif cmd=="killcount" then  -- use killcounter for non-quest mobs
					goal.usekillcount=true

				elseif cmd=="simulate" then
					goal.simulate = params

				elseif cmd=="debug" then
					do_debug = (params=="on")

				elseif #chunk>1 then -- text

					local text = (cmd=="'") and params or chunk

				text = LG[text]

					-- protect {scripts} from pretty much everything
					local braces={} -- har har
					local function savebrace(s,magic) -- har har indeed, quite an ugly hack to discriminate between brace types
						tinsert(braces,s)
						return not magic and ("%%BRACE"..#braces.."%%") or ("@@BRACE"..#braces.."??"..magic.."@@")
					end
					text = text:gsub("{=(.-)%?%?(.-)=}",savebrace):gsub("{(.-)}",savebrace)


					-- snag coordinates for waypointing, with distance
					local miniprevmap,miniprevfloor = prevmap,prevfloor
					local ways={}
					local function saveway(s)
						local map,flr,x,y,dist, err = ParseMapXYDist(s)
						if err then return "["..s.."]" end

						if x and y then
							tinsert(ways,{map=map or goal.map or step.map or miniprevmap,floor=flr or goal.floor or step.floor or miniprevfloor,x=x,y=y,dist=dist})
							miniprevmap, miniprevfloor = map or miniprevmap, flr or miniprevfloor
							s = ""
							if map~=goal.map or flr~=goal.floor then s=GetMapNameByID(map).." " end
							s = COLOR_LOC(L['coords']:format(x,y))
						end
						return s
					end

					text = text:gsub("%[(.-)%]",saveway)
					-- Saved all waypoints! but using only one. TODO: allow multiple coords per line.
					if ways[1] then
						goal.dist = tonumber(ways[1].dist)
						goal.x = ways[1].x
						goal.y = ways[1].y
						goal.map,goal.floor = ways[1].map,ways[1].floor
					end


					-- highlight _text_
					text = text:gsub("_(.-)_","|cffffee88%1|r")

					-- uncloak braces
					local function loadbrace(s,magic) -- for explaination what magic is see savebrace
						return not magic and ("{"..braces[tonumber(s)].."}") or ("{="..braces[tonumber(s)].."??"..magic.."=}")
					end
					text = text:gsub("@@BRACE(%d+)%?%?(.-)@@",loadbrace):gsub("%%%%BRACE(%d+)%%%%",loadbrace)

					goal.text = text
				end

				chunkcount=chunkcount+1
				if chunkcount>20 then
					return nil,"More than 20 chunks in line",linecount,line
				end
			end

			if #TableKeys(goal)>0 then
				if not step then return nil,"What? Unknown data before first 'step' tag, or what?",linecount,line end

				-- so there's something to record? go ahead.

				setmetatable(goal,ZGV.GoalProto_mt)

				if not goal.action then
					if (goal.x or goal.map) then
						goal.action = "goto"
					elseif goal.text then
						goal.action = "text"
					end
				end

				if goal.questid and noobsoletequests[goal.questid] then
					goal.noobsolete = true
				end


				goal.parentStep = step
				goal.num = #step.goals+1

				if goal.dist and math.abs(goal.dist)<5 then goal.dist=goal.dist*20 end

				goal.showinbrief = had_asterisk

				step.goals[#step.goals+1] = goal

				if (goal.action=="get" or goal.action=="kill" or goal.action=="goal") and not goal.questid and not goal.objnum and not goal.force_nocomplete then
					return nil,"Objective has no quest ID / obj num!",linecount,line
				end
			end

			if goal then goal.indent = #indent end

			if breakout then break end
		end
	end
	if guide.type=="macro" then
		-- Try to localize the Spell and item names
		local function ReplaceMacroIDs(macroguide)
			local ready=true
			
			-- Iterating over all the lines
			macroguide.body=macroguide.body:gsub(".-\n",function(par)
				local isItem=par:match("/use") -- If it's not an item, it's most probably a spell
				return par:gsub("##([0-9]*)",function(id)
					if not isItem then
						id=GetSpellInfo(id) -- That's an easy part, really
					else
						local item=GetItemInfo(id)
						if not item then -- Item was not found, damn
							ready=false
							id="##"..id
						else -- Item was found
							id=item
						end
					end
					return id
				end)
			end)
			
			-- If some data is missing we'd better cool down and retry later
			if not ready then 
				ZGV:ScheduleTimer(function() ReplaceMacroIDs(macroguide) end,2)
			else
				macroguide:Update() -- Localize the instance in the macro book
			end
		end
		ReplaceMacroIDs(guide.macro)
	end
	--[[
	if prevlevel and not guide.condition_end then
		guide.endlevel = prevlevel
		guide.endlevel_implicit = true
		local cond = "level>=self.endlevel"
		guide['condition_end']=MakeCondition(cond)
		guide['condition_end_raw']=cond
		guide['condition_end_msg']=("You've reached level %.1f"):format(prevlevel)
	end
	--]]

	return guide
end

local s=string local c=string.char
local h="" for i=33,127 do h=h .. c(i) end
function __uncrapt(text,q)

end


do -- unit-check ParseMapXYDist
	local map,x,y,dist
	map,flr,x,y,dist = ParseMapXYDist("Stormwind City")  assert(map==301,"ParseMapXYDist fail")
	map,flr,x,y,dist = ParseMapXYDist("Stormwind City/3")  assert(map==301 and flr==3,"ParseMapXYDist fail")
	map,flr,x,y,dist = ParseMapXYDist("12.3,12.8")  assert(x==12.3 and y==12.8,"ParseMapXYDist fail")
	map,flr,x,y,dist = ParseMapXYDist("12.3,12.8,2")  assert(x==12.3 and y==12.8 and dist==2,"ParseMapXYDist fail")
	map,flr,x,y,dist = ParseMapXYDist("12.3,12.8,-2")  assert(x==12.3 and y==12.8 and dist==-2,"ParseMapXYDist fail")
	map,flr,x,y,dist = ParseMapXYDist("Stormwind City,12.3,12.8")  assert(map==301 and x==12.3 and y==12.8,"ParseMapXYDist fail")
	map,flr,x,y,dist = ParseMapXYDist("Stormwind City,12.3,12.8,2")  assert(map==301 and x==12.3 and y==12.8 and dist==2,"ParseMapXYDist fail")
	map,flr,x,y,dist = ParseMapXYDist("Stormwind City,12.3,12.8,-2")  assert(map==301 and x==12.3 and y==12.8 and dist==-2,"ParseMapXYDist fail")
	map,flr,x,y,dist = ParseMapXYDist("Stormwind City/3,12.3,12.8,-2")  assert(map==301 and flr==3 and x==12.3 and y==12.8 and dist==-2,"ParseMapXYDist fail")
	-- new syntax
	map,flr,x,y,dist = ParseMapXYDist("Stormwind City 12.3,12.8")  assert(map==301 and x==12.3 and y==12.8,"ParseMapXYDist fail")
	map,flr,x,y,dist = ParseMapXYDist("Stormwind City 12.3,12.8 >5")  assert(map==301 and x==12.3 and y==12.8 and dist==-5,"ParseMapXYDist fail")
	map,flr,x,y,dist = ParseMapXYDist("504")  assert(map==504,"ParseMapXYDist fail")
	map,flr,x,y,dist = ParseMapXYDist("504/5")  assert(map==504 and flr==5,"ParseMapXYDist fail")
	map,flr,x,y,dist = ParseMapXYDist("504 12.3,12.8")  assert(map==504 and x==12.3 and y==12.8,"ParseMapXYDist fail")
	map,flr,x,y,dist = ParseMapXYDist("504 12.3,12.8 <5")  assert(map==504 and x==12.3 and y==12.8 and dist==5,"ParseMapXYDist fail")
end

--[[
do -- unit-check Translate
	assert(Translate("bla")=="bla")
	assert(Translate("bla [deDE] bladede","deDE")=="bladede")
	assert(Translate("bla [deDE] bladede [frFR] blafrfr","deDE")=="bladede")
	--assert(Translate("'bla")=="blaUS")
	--assert(Translate("'blabla")=="blabla",tostring(Translate("''blabla")))
end
--]]