﻿function prraonload()

SetMapToCurrentZone()
if GetCurrentMapAreaID()==897 or GetCurrentMapAreaID()==896 or GetCurrentMapAreaID()==886 then
	RaidAchievement_prra:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	RaidAchievement_prra:RegisterEvent("UNIT_POWER")
	RaidAchievement_prra:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE")
end
	RaidAchievement_prra:RegisterEvent("PLAYER_REGEN_DISABLED")
	RaidAchievement_prra:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	RaidAchievement_prra:RegisterEvent("ADDON_LOADED")
	
	local _, instanceType, difficulty, _, maxPlayers, playerDifficulty, isDynamicInstance = GetInstanceInfo()
	if select(3,GetInstanceInfo())==7 then
		lfrenable=1
  else
    lfrenable=nil
  end


prraspisokach25={


--HoE
6553,

--ToES
6933,
6825,

--MV
6455,

}



if (prraspisokon==nil) then
prraspisokon={}
end


end


function prra_OnUpdate(curtime)

--после 10 сек после ачивки чек
if ratrackgoodattack2 and curtime>ratrackgoodattack2+10 then

    ratrackgoodattack2=nil
    
    --собираем инфо по тем кто в рейде!
    local taball={}
    local _, instanceType, pppl, _, maxPlayers, dif = GetInstanceInfo()
    if pppl and (pppl==4 or pppl==6 or pppl==7) then
      psdifflastfight=25
    end
		local psgroup=2
		if psdifflastfight==25 then
			psgroup=5
		end
		for i = 1,GetNumGroupMembers() do
			local name, _, subgroup, _, _, _, _, online, isDead = GetRaidRosterInfo(i)
			if subgroup<=psgroup then
				table.insert(taball,name)
			end
		end
		
		--если 75% игроков нанесло атаку...
		if #taball>0 then
      if #ratrackgoodattack1<#taball then
        if #ratrackgoodattack1>=#taball*0.75 then
          --поиск ников что не сделали свое дело!
          for k=1,#ratrackgoodattack1 do
             if ratrackgoodattack1[k] then
               if #taball>0 then
                 for j=1,#taball do
                   if taball[j] and taball[j]==ratrackgoodattack1[k] then
                     table.remove(taball,j)
                   end
                 end
               end
             end
          end
          if #taball<7 and #taball>0 then
            --вывод списка фейлеров
            local text=""
            for v=1,#taball do
              text=text..taball[v]
              if v~=#taball then
                text=text..", "
              end
            end
            raplaysound(3,prraspisokach25[4])
            if (wherereportraidach=="sebe") then
              DEFAULT_CHAT_FRAME:AddMessage("- "..achlinnk.." NO DAMAGE: "..text)
            else
            if (UnitIsGroupAssistant("player")==nil and UnitIsGroupLeader("player")==nil) and wherereportraidach=="raid_warning" then
              razapuskanonsa("raid", "{rt8} "..achlinnk.." NO DAMAGE: "..text)
            else
              razapuskanonsa(wherereportraidach, "{rt8} "..achlinnk.." NO DAMAGE: "..text)
            end
            end
          end
        end
      end
    end
    ratrackgoodattack1=nil
    ratrackgoodattack2=nil
    ratrackgoodattack3=nil
end



end


function prraonevent(self,event,...)

local arg1, arg2, arg3,arg4,arg5,arg6 = ...



if event == "PLAYER_REGEN_DISABLED" then
if (rabilresnut and GetTime()<rabilresnut+3) or racheckbossincombat then
else
--обнулять все данные при начале боя тут:




	if UnitGUID("boss1") and UnitName("boss1")~="" then
		local id2=UnitGUID("boss1")
		local id=tonumber(string.sub(id2,-12,-9),16)

	else
		racrtimerbossrecheck=GetTime()+3
	end
end

end


if event == "CHAT_MSG_RAID_BOSS_EMOTE" then



end


if event == "ZONE_CHANGED_NEW_AREA" then

rcradelayzonech=GetTime()+2

	local _, instanceType, difficulty, _, maxPlayers, playerDifficulty, isDynamicInstance = GetInstanceInfo()
	if select(3,GetInstanceInfo())==7 then
		lfrenable=1
  else
    lfrenable=nil
  end

end

if event == "ADDON_LOADED" then
	if arg1=="RaidAchievement_PandaRaids" then

for i=1,#prraspisokach25 do
if prraspisokon[i]==nil then prraspisokon[i]=1 end
end
	end
end


if event == "UNIT_POWER" then
if UnitName("boss1") and UnitName("boss1")~="" then



end
end




if GetNumGroupMembers() > 0 and event == "COMBAT_LOG_EVENT_UNFILTERED" and lfrenable==nil then

local arg1, arg2, arg3,arg4,arg5,arg6,argNEW1,arg7,arg8,arg9,argNEW2,arg10,arg11,arg12,arg13,arg14, arg15,arg16,arg17,arg18 = ...


--ТУТ АЧИВЫ


--Heart of Fear
if GetCurrentMapAreaID()==897 then



--Mogushan
if GetCurrentMapAreaID()==896 then

if arg2=="SPELL_DAMAGE" and arg10==116809 then
  if (ratrackgoodattack2==nil or (ratrackgoodattack2 and ratrackgoodattack2>GetTime()+10)) then
    ratrackgoodattack1={} --список игроков что нанесли удар
    table.wipe(ratrackgoodattack1)
    ratrackgoodattack2=GetTime() --время 1 атаки
    ratrackgoodattack3=arg7 --гуид того по кому атака
  end
  if ratrackgoodattack3==arg7 then
    local bil=0
    for i=1,#ratrackgoodattack1 do
      if ratrackgoodattack1[i]==arg5 then
        bil=1
      end
    end
    if bil==0 then
      table.insert(ratrackgoodattack1,arg5)
    end

    --собираем инфо по тем кто в рейде!
    local taball={}
    local _, instanceType, pppl, _, maxPlayers, dif = GetInstanceInfo()
    if pppl and (pppl==4 or pppl==6 or pppl==7) then
      psdifflastfight=25
    end
		local psgroup=2
		if psdifflastfight==25 then
			psgroup=5
		end
		for i = 1,GetNumGroupMembers() do
			local name, _, subgroup, _, _, _, _, online, isDead = GetRaidRosterInfo(i)
			if subgroup<=psgroup then
				table.insert(taball,name)
			end
		end
		if #ratrackgoodattack1>=#taball then
      if prraspisokon[4]==1 and raachdone1 then
        prraachcompl(4)
      end
    end
  end
end

end
--


if arg2=="SPELL_CAST_SUCCESS" and arg10==122786 then
	if prraspisokon[1]==1 and raachdone1 then
		prrafailnoreason(1) --arg8
	end
end


end
--



--ToES
if GetCurrentMapAreaID()==886 then


if arg2=="SPELL_DAMAGE" and arg14 and arg14>0 then
	if prraspisokon[2]==1 and raachdone1 then
    local id=tonumber(string.sub(arg7,-12,-9),16)
    if id==64443 then
      prrafailnoreason(2) --arg8
    end
	end
end




if arg2=="SPELL_AURA_APPLIED" and (arg10==119985 or arg10==119414) then
	if prraspisokon[3]==1 and raachdone1 then
		raunitisplayer(arg7,arg8)
		if raunitplayertrue then
      --проверка что нет дебаффа на хихиканье
      local spbuf=GetSpellInfo(129147)
      if UnitBuff(arg8, spbuf) or UnitDebuff(arg8, spbuf) then
      else
        prrafailnoreason(3,arg8) --arg8
      end
    end
	end
end


end
--



end
end --КОНЕЦ ОНЕВЕНТ

function prra_closeallpr()
prramain6:Hide()
end


function prra_button2()
PSFea_closeallpr()
prramain6:Show()
openmenureportprra()



if (prranespamit==nil) then

prraspislun= # prraspisokach25
prracbset={}

for i=1,prraspislun do

if i>14 then
l=280
j=i-14
else
l=0
j=i
end

if GetAchievementLink(prraspisokach25[i]) then

local _, prraName, _, completed, _, _, _, Description, _, prraImage = GetAchievementInfo(prraspisokach25[i])

if completed then
prraName="|cff00ff00"..prraName.."|r"
else
--no more red
end



--текст
local f = CreateFrame("Frame",nil,prramain6)
f:SetFrameStrata("DIALOG")
f:SetWidth(248)
f:SetHeight(24)




f:SetScript("OnEnter", function(self) Raiccshowtxt(self,Description) end )
f:SetScript("OnLeave", function(self) Raiccshowtxt2() end )
f:SetScript("OnMouseDown", function(self) if IsShiftKeyDown() then if ChatFrame1EditBox:GetText() and string.len(ChatFrame1EditBox:GetText())>0 then ChatFrame1EditBox:SetText(ChatFrame1EditBox:GetText().." "..GetAchievementLink(prraspisokach25[i])) else ChatFrame_OpenChat(GetAchievementLink(prraspisokach25[i])) end end end )

--картинка
local t = f:CreateTexture(nil,"OVERLAY")
t:SetTexture(prraImage)
t:SetWidth(24)
t:SetHeight(24)
t:SetPoint("TOPLEFT",0,0)

local t = f:CreateFontString()
t:SetFont(GameFontNormal:GetFont(), rafontsset[2])
t:SetWidth(548)
if i==3 then
  t:SetText(prraName.." - |cffff0000"..raspectext.."|r")
else
  t:SetText(prraName)
end
t:SetJustifyH("LEFT")
t:SetPoint("LEFT",27,0)


f:SetPoint("TOPLEFT",l+45,-14-j*30)
f:Show()

end

--чекбатон
local c = CreateFrame("CheckButton", nil, prramain6, "UICheckButtonTemplate")
c:SetWidth("25")
c:SetHeight("25")
c:SetPoint("TOPLEFT", l+20, -14-j*30)
c:SetScript("OnClick", function(self) prragalka(i) end )
table.insert(prracbset, c)


end --for i
prranespamit=1
end --nespam


prragalochki()




end --конец бутон2

function Raiccshowtxt(self,i)
	GameTooltip:SetOwner(self or UIParent, "ANCHOR_TOP")
	GameTooltip:SetText(i)
end

function Raiccshowtxt2(i)
GameTooltip:Hide()
end


function prragalochki()
for i=1,#prraspisokach25 do
if(prraspisokon[i]==1)then prracbset[i]:SetChecked() else prracbset[i]:SetChecked(false) end
end
end

function prragalka(nomersmeni)
if prraspisokon[nomersmeni]==1 then prraspisokon[nomersmeni]=0 else prraspisokon[nomersmeni]=1 end
end

function prra_buttonchangeyn(yesno)
prraspislun= # prraspisokach25
for i=1,prraspislun do
prraspisokon[i]=yesno
end
prragalochki()
end

function prra_button1()
prraspislun= # prraspisokach25
for i=1,prraspislun do
if prraspisokon[i]==1 then prraspisokon[i]=0 else prraspisokon[i]=1 end
end
prragalochki()
end


function openmenureportprra()
if not DropDownMenureportprra then
CreateFrame("Frame", "DropDownMenureportprra", prramain6, "UIDropDownMenuTemplate")
end
rachatdropm(DropDownMenureportprra,5,7)
end