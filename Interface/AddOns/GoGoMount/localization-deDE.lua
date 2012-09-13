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
		AutoStartCrusaderAura = "Aura des Kreuzfahrers automatisch verwenden", -- Needs review
		AutoStartCrusaderAura_Long = "Aktiviert automatisch die Aura des Kreuzfahrers, wenn GoGoMount zum Aufsteigen verwendet wird.", -- Needs review
		Clear = "Löschen",
		ClearGlobalFavoriteMounts = "Lösche global favorisierte Mounts",
		CurrentZone = "Aktuelle Zone", -- Needs review
		CurrentZoneDescription = "Reittiere, die hier als Zonenfavoriten markiert sind, sind die einzigen, die von GoGoMount in dieser Zone verwendet werden. Alle anderen Reittiere und Gestaltwandlungen werden ignoriert. Wird diese Liste geleert, kann GoGoMount wieder alle Reittiere verwenden (oder die globalen Favoriten, falls festgelegt).", -- Needs review
		CurrentZoneExclusions = "Aktuelle Zonen Ausnahmen", -- Needs review
		CurrentZoneFavorites = "Favoriten der aktuellen Zone",
		DisableFlyingFromWater = "Verhindere Fliegen vom Wasser",
		DisableInCombat = "GoGoMount-Buttons während des Kampfes deaktivieren", -- Needs review
		DisableInCombat_Long = "Diese Einstellung deaktiviert die GoGoMount-Buttons während des Kampfes. Nützlich für Druiden, die in Bärform Tanken und versehentlich den GoGoMount-Button klicken. Muss vor dem Kampf aktiviert oder deaktiviert sein.", -- Needs review
		DisableUnknownMountNotices = "Mitteilungen über unbekannte Reittiere ausschalten",
		DisableUpdateNotices = "Aktualisierungsnachrichten ausschalten",
		DruidFlightPreference = "Immer Flugformen verwenden, ausser bei reiner Bewegung",
		DruidOptions = "Druiden-Optionen",
		DruidSingleClick = "Einfacher Klick für den Wechsel in Reisegestalten",
		EnableAutoDismount = "Automatisches Absitzen aktivieren",
		Favorites = "Favoriten",
		GlobalExclusions = "Globale Ausnahmen", -- Needs review
		GlobalExclusionsDescription = "Reittiere werden immer ignoroert. Selbst dann, wenn die hier angegebenen Reittiere als Favoriten festgelegt wurden, werden sie nicht verwendet.", -- Needs review
		GlobalFavorites = "Globale Favoriten",
		GlobalPreferences = "Globale Präferenzen",
		GlobalZoneDescription = "Die hier defineirten bevorzugten Reittiere, werden nur verwendet, wenn keine zonenspezifische Favoriten für die Zone definiert sind, in der du dich gearde befindest.", -- Needs review
		HunterOptions = "Jäger-Optionen",
		NewVersionFound = "Eine aktualisierte Version von GoGoMount ist verfügbar und wird verwendet von ",
		NoShapeInRandom = "Zufällige Gestaltwandlung nicht gemeinsam mit Reittieren anwenden.", -- Needs review
		PaladinOptions = "Paladin-Einstellungen", -- Needs review
		RemoveBuffs = "Entferne Buffs die das Aufsitzen verhindern",
		RemoveBuffs_Long = "GoGoMount wird versuchen, Stärkungszauber und Gestaltwandlungen von Zaubersprüchen und Gegenständen zu entfernen, die das Aufsteigen verhindern. Dies funktioniet nur für bekannte Stärkungszauber und in einigen Fällen muss der GoGoMount-Button zweimal geklickt werden.", -- Needs review
		UnknownMountFound = "Ein unbekanntes Reittier wurde in deiner Liste entdeckt. Bitte melde es, damit es in zukünftige Versionen von GoGoMount integriert werden kann.",
		UseAspectOfThePackInstead = "Aspekt des Rudels statt Aspekt des Geparden verwenden",
		UseAspectOfThePackInstead_Long = "Wenn aktiviert, wird GoGoMount den Aspekt des Rudels statt des Aspekt des Geparden verwenden. Lokale Zonen- oder globale Einstellungen überschreiben diese Einstellung. Wenn dies auf Aspekt des Rudels eingestellt ist und du hast Aspekt des Geparden als Zonenfavoriten eingestellt, wird Aspekt des Geparden verwendet.", -- Needs review
		ZoneExclusionsDescription = "Zonenspezifische Ausnahmen funktionieren genauso wie die globalen Ausnahmen, allerdings nur für die angegebene Zone. Alle Reittiere, die unten als Ausnahme für die Zone in der du dich gerade befindest markiert sind, werden niemals verwendet.", -- Needs review
	},
	Talent = {
		AncestralSwiftness = "Schnelligkeit der Ahnen",
		FeralSwiftness = "Schnelligkeit der Wildnis",
	},
	Zone = {
		AbyssalDepths = "Abyssische Tiefen",
		AmaniMountains = "Amani Mountains", -- Requires localization
		AQ40 = "Tempel von Ahn'Qiraj",
		AzuremystIsle = "Azurmythosinsel",
		BloodmystIsle = "Blutmythosinsel",
		CrumblingDepths = "Bröselnde Tiefen",
		Dalaran = "Dalaran",
		DarkbreakCove = "Darkbreak Cove", -- Requires localization
		Deepholm = "Tiefenheim",
		DireMaul = "Düsterbruch",
		EversongWoods = "Immersangwald",
		Ghostlands = "Geisterlande",
		Icecrown = "Eiskrone",
		Ironforge = "Eisenschmiede",
		IsleOfQuelDanas = "Insel von Quel'Danas",
		KrasusLanding = "Krasus' Landeplatz",
		LegionsRest = "Ruhestatt der Legion",
		Lghorek = "L'ghorek",
		Nespirah = "Nespirah",
		ShimmeringExpanse = "Schimmernde Weiten",
		SholazarBasin = "Sholazarbecken",
		SilvermoonCity = "Silbermond",
		SilverTideHollow = "Silberfluthöhle",
		TempleOfBethekk = "Tempel von Bethekk", -- Needs review
		TempleOfEarth = "Tempel der Erde",
		TenebrousCavern = "Tenebrous Cavern", -- Requires localization
		ThalassianPass = "Thalassischer Pass", -- Needs review
		ThalassianRange = "Thalassian Range", -- Requires localization
		TheCerebrillum = "The Cerebrillum", -- Requires localization
		TheExodar = "Die Exodar",
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