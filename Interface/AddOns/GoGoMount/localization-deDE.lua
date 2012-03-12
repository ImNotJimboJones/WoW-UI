﻿if GetLocale() == "deDE" then
	BINDING_HEADER_GOGOHEADER = "GoGoMount"
	BINDING_NAME_GOGOBINDING = "Aufsitzen/Absitzen"
	BINDING_NAME_GOGOBINDING2 = "Aufsitzen/Absitzen (nicht fliegend)"
	BINDING_NAME_GOGOBINDING3 = "Aufsitzen/Absitzen bei Fahrgast-Mounts"
	GoGo_Variables.Localize = {
	Skill = {
		Engineering = "Ingenieurskunst",
		Riding = "Reiten",
		Tailoring = "Schneiderei",
	},
	String = {
		AutomaticallyRemoveBuffs = "Zauber, die das Aufsitzen verhindern, automatisch entfernen",
		AutoStartCrusaderAura = "Auto start Crusader Aura", -- Requires localization
		AutoStartCrusaderAura_Long = "Automatically start Crusader Aura when using GoGoMount to mount.", -- Requires localization
		Clear = "Löschen",
		ClearGlobalFavoriteMounts = "Lösche global favorisierte Mounts",
		CurrentZone = "Current Zone", -- Requires localization
		CurrentZoneDescription = "Mounts flagged here as zone favorites will be the only mounts GoGoMount will use in this zone.  All other mounts and shape forms will be ignored.  Clearing this list will allow GoGoMount to use all mounts (or global favorites if set).", -- Requires localization
		CurrentZoneExclusions = "Current Zone Exclusions", -- Requires localization
		CurrentZoneFavorites = "Favoriten der aktuellen Zone",
		DisableFlyingFromWater = "Verhindere Fliegen vom Wasser", -- Needs review
		DisableInCombat = "Disable GoGoMount buttons in combat", -- Requires localization
		DisableInCombat_Long = "This option disables GoGoMount buttons while in combat.  Useful for Druids who tank in bear form and accidently press their GoGoMount buttons.  Must be enabled or disabled before entering combat.", -- Requires localization
		DisableUnknownMountNotices = "Mitteilungen über unbekannte Reittiere ausschalten",
		DisableUpdateNotices = "Aktualisierungsnachrichten ausschalten",
		DruidFlightPreference = "Immer Flugformen verwenden, ausser bei reiner Bewegung",
		DruidOptions = "Druiden-Optionen",
		DruidSingleClick = "Einfacher Klick für den Wechsel in Reisegestalten",
		EnableAutoDismount = "Automatisches Absitzen aktivieren",
		Favorites = "Favoriten",
		GlobalExclusions = "Global Exclusions", -- Requires localization
		GlobalExclusionsDescription = "Mounts will always be ignored.  Even if mounts selected here are set as favorites, they will not be used.", -- Requires localization
		GlobalFavorites = "Globale Favoriten",
		GlobalPreferences = "Globale Präferenzen",
		GlobalZoneDescription = "Preferred mounts defined here will only take effect if there are no zone specific mount favorites set for the current zone you are in.", -- Requires localization
		HunterOptions = "Jäger-Optionen",
		NewVersionFound = "Eine aktualisierte Version von GoGoMount ist verfügbar und wird verwendet von ",
		NoShapeInRandom = "Zufällige Gestaltwandelung nicht gemeinsam mit Reittieren anwenden.", -- Needs review
		PaladinOptions = "Paladin Options", -- Requires localization
		RemoveBuffs = "Entferne Buffs die das Aufsitzen verhindern", -- Needs review
		RemoveBuffs_Long = "GoGoMount will attempt to remove buffs and shapeforms that come from spells and items that prevent mounting.  This only works for known buffs and in some cases require 2 clicks of your GoGoMount button to mount.", -- Requires localization
		UnknownMountFound = "Ein unbekanntes Reittier wurde in deiner Liste entdeckt. Bitte melde es, damit es in zukünftige Versionen von GoGoMount integriert werden kann.",
		UseAspectOfThePackInstead = "Aspekt des Rudels statt Aspekt des Geparden verwenden",
		UseAspectOfThePackInstead_Long = "When enabled, GoGoMount will cast Aspect of the Pack instead of Aspect of the Cheetah.  Local zone or global settings override this setting.  If this is set to use Aspect of the Pack and you have Aspect of the Cheetah as a zone favorite, Aspect of the Cheetah will be used.", -- Requires localization
		ZoneExclusionsDescription = "Zone specific exclusions work the same as global exclusions but specific to this zone.  Any mount marked below as an exclusion for the zone you're currently in will never be summoned.", -- Requires localization
	},
	Talent = {
		AncestralSwiftness = "Schnelligkeit der Ahnen",
		FeralSwiftness = "Schnelligkeit der Wildnis",
	},
	Zone = {
		AbyssalDepths = "Abyssische Tiefen",
		AmaniMountains = "Amani Mountains", -- Requires localization
		AQ40 = "Tempel von Ahn'Qiraj",
		AzuremystIsle = "Azurmythosinsel", -- Needs review
		BloodmystIsle = "Blutmythosinsel", -- Needs review
		CrumblingDepths = "Bröselnde Tiefen",
		Dalaran = "Dalaran",
		DarkbreakCove = "Darkbreak Cove", -- Requires localization
		Deepholm = "Tiefenheim",
		DireMaul = "Düsterbruch",
		EversongWoods = "Immersangwald", -- Needs review
		Ghostlands = "Geisterlande", -- Needs review
		Icecrown = "Eiskrone",
		Ironforge = "Eisenschmiede",
		IsleOfQuelDanas = "Insel von Quel'Danas",
		KrasusLanding = "Krasus' Landeplatz",
		LegionsRest = "Ruhestatt der Legion", -- Needs review
		Lghorek = "L'ghorek",
		Nespirah = "Nespirah",
		ShimmeringExpanse = "Schimmernde Weiten", -- Needs review
		SholazarBasin = "Sholazarbecken",
		SilvermoonCity = "Silbermond", -- Needs review
		SilverTideHollow = "Silberfluthöhle", -- Needs review
		TempleOfBethekk = "Temple of Bethekk", -- Requires localization
		TempleOfEarth = "Tempel der Erde",
		TenebrousCavern = "Tenebrous Cavern", -- Requires localization
		ThalassianPass = "Thalassian Pass", -- Requires localization
		ThalassianRange = "Thalassian Range", -- Requires localization
		TheCerebrillum = "The Cerebrillum", -- Requires localization
		TheExodar = "Die Exodar", -- Needs review
		TheFrozenSea = "Die gefrorene See",
		TheOculus = "Das Oculus",
		TheStormPeaks = "Die Sturmgipfel",
		TheTempleOfAtalHakkar = "Der Tempel von Atal'Hakkar",
		TheUnderbelly = "Die Schattenseite",
		TheVioletCitadel = "Die Violette Zitadelle",
		TheVortexPinnacle = "Der Vortexgipfel",
		TolBarad = "Tol Barad",
		TolBaradPeninsula = "Tol Barad Halbinsel",
		TwistingNether = "Wirbelnder Nether",
		Vashjir = "Vashj'ir",
		Wintergrasp = "Tausendwintersee",
	},
}

end --if