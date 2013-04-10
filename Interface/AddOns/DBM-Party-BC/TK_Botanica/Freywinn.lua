local mod = DBM:NewMod("Freywinn", "DBM-Party-BC", 14)
local L = mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 436 $"):sub(12, -3))

mod:SetCreatureID(17975)
mod:SetModelID(19045)
mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_CAST_SUCCESS"
)

local WarnTranq   = mod:NewAnnounce("WarnTranq", 3, 34550)

function mod:SPELL_CAST_SUCCESS(args)
	if args.spellId == 34557 then      --Summon Frayer Protector
		WarnTranq:Show()
	end
end