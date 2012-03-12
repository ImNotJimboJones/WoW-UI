--[[
	Enchantrix Addon for World of Warcraft(tm).
	Version: 5.13.5258 (BoldBandicoot)
	Revision: $Id: EnxConstants.lua 4632 2010-01-24 02:33:54Z ccox $
	URL: http://enchantrix.org/

	Enchantrix Constants for Inscription / Milling

	License:
		This program is free software; you can redistribute it and/or
		modify it under the terms of the GNU General Public License
		as published by the Free Software Foundation; either version 2
		of the License, or (at your option) any later version.

		This program is distributed in the hope that it will be useful,
		but WITHOUT ANY WARRANTY; without even the implied warranty of
		MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
		GNU General Public License for more details.

		You should have received a copy of the GNU General Public License
		along with this program(see GPL.txt); if not, write to the Free Software
		Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

	Note:
		This AddOn's source code is specifically designed to work with
		World of Warcraft's interpreted AddOn system.
		You have an implicit license to use this AddOn with these facilities
		since that is its designated purpose as per:
		http://www.fsf.org/licensing/licenses/gpl-faq.html#InterpreterIncompat
]]
Enchantrix_RegisterRevision("$URL: http://dev.norganna.org/auctioneer/trunk/Enchantrix/EnxConstantsInscription.lua $", "$Rev: 4632 $")

local const = Enchantrix.Constants


local ALABASTER_PIGMENT = 39151
local DUSKY_PIGMENT = 39334
local GOLDEN_PIGMENT = 39338
local EMERALD_PIGMENT = 39339
local VIOLET_PIGMENT = 39340
local SILVERY_PIGMENT = 39341
local NETHER_PIGMENT = 39342
local AZURE_PIGMENT = 39343
local ASHEN_PIGMENT = 61979

local VERDANT_PIGMENT = 43103
local BURNT_PIGMENT = 43104
local INDIGO_PIGMENT = 43105
local RUBY_PIGMENT = 43106
local SAPPHIRE_PIGMENT = 43107
local EBON_PIGMENT = 43108
local ICY_PIGMENT = 43109
local BURNING_EMBERS = 61980

local HERB_PEACEBLOOM = 2447
local HERB_SILVERLEAF = 765
local HERB_EARTHROOT = 2449
local HERB_MAGEROYAL = 785

local HERB_BRIARTHORN = 2450
local HERB_SWIFTTHISTLE = 2452
local HERB_BRUISEWEED = 2453
local HERB_STRANGLEKELP = 3820

local HERB_WILDSTEELBLOOM = 3355
local HERB_GRAVEMOSS = 3369
local HERB_KINGSBLOOD = 3356
local HERB_LIFEROOT = 3357

local HERB_FADELEAF = 3818
local HERB_GOLDTHORN = 3821
local HERB_WINTERSBITE = 3819
local HERB_KHADGARSWHISKER = 3358

local HERB_FIREBLOOM = 4625
local HERB_GHOSTMUSHROOM = 8845
local HERB_ARTHASTEARS = 8836
local HERB_GROMSBLOOD = 8846
local HERB_BLINDWEED = 8839
local HERB_SUNGRASS = 8838
local HERB_PURPLELOTUS = 8831

local HERB_ICECAP = 13467
local HERB_GOLDENSANSAM = 13464
local HERB_PLAGUEBLOOM = 13466
local HERB_DREAMFOIL = 13463
local HERB_MOUNTAINSILVERSAGE = 13465

-- all BC herbs
local HERB_TEROCONE = 22789
local HERB_DREAMINGGLORY = 22786
local HERB_FELWEED = 22785
local HERB_RAGVEIL = 22787
local HERB_NIGHTMAREVINE = 22792
local HERB_MANATHISTLE = 22793
local HERB_NETHERBLOOM = 22791
local HERB_ANCIENTLICHEN = 22790

-- all northrend herbs
local HERB_GOLDCLOVER = 36901
local HERB_ADDERSTONGUE = 36903
local HERB_TIGERLILY = 36904
local HERB_LICHBLOOM = 36905
local HERB_ICETHORN = 36906
local HERB_TALANDRASROSE = 36907
local HERB_DEADNETTLE = 37921
local HERB_FIRESEED = 39969
local HERB_FIRELEAF = 39970

-- Cataclysm herbs
local HERB_CINDERBLOOM = 52983
local HERB_STORMVINE = 52984
local HERB_AZSHARASVEIL = 52985
local HERB_HEARTBLOSSOM = 52986
local HERB_TWILIGHTJASMINE = 52987
local HERB_WHIPTAIL = 52988


-- only currently used for autoloot in EnxAutoDisenchant.lua
-- Blizz normally provides the reverse data in the pigment tooltip
const.ReversePigmentList = {

	-- common
	[ALABASTER_PIGMENT] = 1,
	[DUSKY_PIGMENT] = 1,
	[GOLDEN_PIGMENT] = 1,
	[EMERALD_PIGMENT] = 1,
	[VIOLET_PIGMENT] = 1,
	[SILVERY_PIGMENT] = 1,
	[NETHER_PIGMENT] = 1,
	[AZURE_PIGMENT] = 1,
	[ASHEN_PIGMENT] = 1,

	-- rare
	[VERDANT_PIGMENT] = 1,
	[BURNT_PIGMENT] = 1,
	[INDIGO_PIGMENT] = 1,
	[RUBY_PIGMENT] = 1,
	[SAPPHIRE_PIGMENT] = 1,
	[EBON_PIGMENT] = 1,
	[ICY_PIGMENT] = 1,
	[BURNING_EMBERS] = 1,

}

-- map groups to a string for now
local	ALABASTER_PIGMENT_LOW = "ALABASTER_PIGMENT_LOW"
local	DUSKY_PIGMENT_LOW =  "DUSKY_PIGMENT_LOW"
local	GOLDEN_PIGMENT_LOW = "GOLDEN_PIGMENT_LOW"
local	EMERALD_PIGMENT_LOW = "EMERALD_PIGMENT_LOW"
local	VIOLET_PIGMENT_LOW = "VIOLET_PIGMENT_LOW"
local	SILVERY_PIGMENT_LOW = "SILVERY_PIGMENT_LOW"
local	NETHER_PIGMENT_LOW = "NETHER_PIGMENT_LOW"
local	AZURE_PIGMENT_LOW = "AZURE_PIGMENT_LOW"
local	ASHEN_PIGMENT_LOW = "ASHEN_PIGMENT_LOW"
local	ALABASTER_PIGMENT_HIGH = "ALABASTER_PIGMENT_HIGH"
local	DUSKY_PIGMENT_HIGH = "DUSKY_PIGMENT_HIGH"
local	GOLDEN_PIGMENT_HIGH = "GOLDEN_PIGMENT_HIGH"
local	EMERALD_PIGMENT_HIGH = "EMERALD_PIGMENT_HIGH"
local	VIOLET_PIGMENT_HIGH = "VIOLET_PIGMENT_HIGH"
local	SILVERY_PIGMENT_HIGH = "SILVERY_PIGMENT_HIGH"
local	NETHER_PIGMENT_HIGH = "NETHER_PIGMENT_HIGH"
local	AZURE_PIGMENT_HIGH = "AZURE_PIGMENT_HIGH"
local	ASHEN_PIGMENT_HIGH = "ASHEN_PIGMENT_HIGH"
local	ASHEN_PIGMENT_MID = "ASHEN_PIGMENT_MID"


-- skill required, by bracket/result
const.MillingSkillRequired = {

	[ALABASTER_PIGMENT_LOW] = 1,
	[ALABASTER_PIGMENT_HIGH] = 1,
	[DUSKY_PIGMENT_LOW] =  25,
	[DUSKY_PIGMENT_HIGH] =  25,
	[GOLDEN_PIGMENT_LOW] = 75,
	[GOLDEN_PIGMENT_HIGH] = 75,
	[EMERALD_PIGMENT_LOW] = 125,
	[EMERALD_PIGMENT_HIGH] = 125,
	[VIOLET_PIGMENT_LOW] = 175,
	[VIOLET_PIGMENT_HIGH] = 175,
	[SILVERY_PIGMENT_LOW] = 225,
	[SILVERY_PIGMENT_HIGH] = 225,
	[NETHER_PIGMENT_LOW] = 275,
	[NETHER_PIGMENT_HIGH] = 275,
	[AZURE_PIGMENT_LOW] = 325,
	[AZURE_PIGMENT_HIGH] = 325,
	[ASHEN_PIGMENT_LOW] = 425,
	[ASHEN_PIGMENT_MID] = 450,
	[ASHEN_PIGMENT_HIGH] = 475,

}

const.MillableItems = {

	[HERB_SILVERLEAF] = ALABASTER_PIGMENT_LOW,
	[HERB_PEACEBLOOM] = ALABASTER_PIGMENT_LOW,
	[HERB_EARTHROOT] = ALABASTER_PIGMENT_HIGH,

	[HERB_MAGEROYAL] = DUSKY_PIGMENT_LOW,
	[HERB_BRIARTHORN] = DUSKY_PIGMENT_LOW,
	[HERB_SWIFTTHISTLE] = DUSKY_PIGMENT_LOW,
	
	[HERB_BRUISEWEED] = DUSKY_PIGMENT_HIGH,
	[HERB_STRANGLEKELP] = DUSKY_PIGMENT_HIGH,

	[HERB_WILDSTEELBLOOM] = GOLDEN_PIGMENT_LOW,
	[HERB_GRAVEMOSS] = GOLDEN_PIGMENT_LOW,
	
	[HERB_KINGSBLOOD] = GOLDEN_PIGMENT_HIGH,
	[HERB_LIFEROOT] = GOLDEN_PIGMENT_HIGH,

	[HERB_FADELEAF] = EMERALD_PIGMENT_LOW,
	[HERB_GOLDTHORN] = EMERALD_PIGMENT_LOW,
	
	[HERB_WINTERSBITE] = EMERALD_PIGMENT_HIGH,
	[HERB_KHADGARSWHISKER] = EMERALD_PIGMENT_HIGH,

	[HERB_FIREBLOOM] = VIOLET_PIGMENT_LOW,
	[HERB_PURPLELOTUS] = VIOLET_PIGMENT_LOW,
	[HERB_ARTHASTEARS] = VIOLET_PIGMENT_LOW,
	[HERB_SUNGRASS] = VIOLET_PIGMENT_LOW,
	
	[HERB_GHOSTMUSHROOM] = VIOLET_PIGMENT_HIGH,
	[HERB_BLINDWEED] = VIOLET_PIGMENT_HIGH,
	[HERB_GROMSBLOOD] = VIOLET_PIGMENT_HIGH,

	[HERB_GOLDENSANSAM] = SILVERY_PIGMENT_LOW,
	[HERB_DREAMFOIL] = SILVERY_PIGMENT_LOW,
	
	[HERB_MOUNTAINSILVERSAGE] = SILVERY_PIGMENT_HIGH,
	[HERB_PLAGUEBLOOM] = SILVERY_PIGMENT_HIGH,
	[HERB_ICECAP] = SILVERY_PIGMENT_HIGH,

	[HERB_TEROCONE] = NETHER_PIGMENT_LOW,
	[HERB_DREAMINGGLORY] = NETHER_PIGMENT_LOW,
	[HERB_FELWEED] = NETHER_PIGMENT_LOW,
	[HERB_RAGVEIL] = NETHER_PIGMENT_LOW,
	
	[HERB_ANCIENTLICHEN] = NETHER_PIGMENT_HIGH,
	[HERB_NIGHTMAREVINE] = NETHER_PIGMENT_HIGH,
	[HERB_MANATHISTLE] = NETHER_PIGMENT_HIGH,
	[HERB_NETHERBLOOM] = NETHER_PIGMENT_HIGH,

	[HERB_TIGERLILY] = AZURE_PIGMENT_LOW,
	[HERB_TALANDRASROSE] = AZURE_PIGMENT_LOW,
	[HERB_GOLDCLOVER] = AZURE_PIGMENT_LOW,
	[HERB_DEADNETTLE] = AZURE_PIGMENT_LOW,
	[HERB_FIRESEED] = AZURE_PIGMENT_LOW,
	[HERB_FIRELEAF] = AZURE_PIGMENT_LOW,
	
	[HERB_ADDERSTONGUE] = AZURE_PIGMENT_HIGH,
	[HERB_LICHBLOOM] = AZURE_PIGMENT_HIGH,
	[HERB_ICETHORN] = AZURE_PIGMENT_HIGH,
	
	[HERB_CINDERBLOOM] = ASHEN_PIGMENT_LOW,
	[HERB_STORMVINE] = ASHEN_PIGMENT_LOW,
	
	[HERB_AZSHARASVEIL] = ASHEN_PIGMENT_MID,
	[HERB_HEARTBLOSSOM] = ASHEN_PIGMENT_MID,
	
	[HERB_TWILIGHTJASMINE] = ASHEN_PIGMENT_HIGH,
	[HERB_WHIPTAIL] = ASHEN_PIGMENT_HIGH,
}


const.MillGroupYields = {

	[ALABASTER_PIGMENT_LOW] = {
		[ALABASTER_PIGMENT] = 2.5,
		},

	[ALABASTER_PIGMENT_HIGH] = {
		[ALABASTER_PIGMENT] = 3.0,
		},

	[DUSKY_PIGMENT_LOW] = {
		[DUSKY_PIGMENT] = 2.5,
		[VERDANT_PIGMENT] = 0.25,
 		},

	[DUSKY_PIGMENT_HIGH] = {
		[DUSKY_PIGMENT] = 3.0,
		[VERDANT_PIGMENT] = 0.5,
 		},

	[GOLDEN_PIGMENT_LOW] = {
		[GOLDEN_PIGMENT] = 2.5,
		[BURNT_PIGMENT] = 0.27,
		},

	[GOLDEN_PIGMENT_HIGH] = {
		[GOLDEN_PIGMENT] = 3.0,
		[BURNT_PIGMENT] = 0.5,
		},

	[EMERALD_PIGMENT_LOW] = {
		[EMERALD_PIGMENT] = 2.5,
		[INDIGO_PIGMENT] = 0.25,
		},

	[EMERALD_PIGMENT_HIGH] = {
		[EMERALD_PIGMENT] = 3.5,
		[INDIGO_PIGMENT] = 0.4,
		},

	[VIOLET_PIGMENT_LOW] = {
		[VIOLET_PIGMENT] = 2.5,
		[RUBY_PIGMENT] = 0.25,
		},

	[VIOLET_PIGMENT_HIGH] = {
		[VIOLET_PIGMENT] = 3.0,
		[RUBY_PIGMENT] = 0.5,
		},

	[SILVERY_PIGMENT_LOW] = {
		[SILVERY_PIGMENT] = 2.5,
		[SAPPHIRE_PIGMENT] = 0.27,
		},

	[SILVERY_PIGMENT_HIGH] = {
		[SILVERY_PIGMENT] = 3.0,
		[SAPPHIRE_PIGMENT] = 0.5,
		},

	[NETHER_PIGMENT_LOW] = {
		[NETHER_PIGMENT] = 2.5,
		[EBON_PIGMENT] = 0.3,
		},

	[NETHER_PIGMENT_HIGH] = {
		[NETHER_PIGMENT] = 3.0,
		[EBON_PIGMENT] = 0.55,
		},

	[AZURE_PIGMENT_LOW] = {
		[AZURE_PIGMENT] = 2.5,
		[ICY_PIGMENT] = 0.25,
		},

	[AZURE_PIGMENT_HIGH] = {
		[AZURE_PIGMENT] = 3.0,
		[ICY_PIGMENT] = 0.5,
		},
	
	[ASHEN_PIGMENT_LOW] = {
		[ASHEN_PIGMENT] = 2.5,
		[BURNING_EMBERS] = 0.25,
		},
	
	[ASHEN_PIGMENT_MID] = {
		[ASHEN_PIGMENT] = 2.7,
		[BURNING_EMBERS] = 0.25,
		},
	
	[ASHEN_PIGMENT_HIGH] = {
		[ASHEN_PIGMENT] = 3.0,
		[BURNING_EMBERS] = 0.5,
		},

}


local SHIMMERING_INK = 43122
local MOONGLOW_INK = 39469
local MIDNIGHT_INK = 39774
local LIONS_INK = 43116
local JADEFIRE_INK = 43118
local IVORY_INK = 37101
local INKOFTHESEA_INK = 43126
local ETHEREAL_INK = 43124
local CELESTIAL_INK = 43120
local SNOWFALL_INK = 43127
local ROYAL_INK = 43119
local INKOFTHESKY_INK = 43123
local HUNTERS_INK = 43115
local FIERY_INK = 43212
local DAWNSTAR_INK = 43117
local DARKFLAME_INK = 43125
local BLACKFALLOW_INK = 61978
local INFERNO_INK = 61981

const.ReverseInkList = {

	[ MOONGLOW_INK ] = { ALABASTER_PIGMENT },
	[ IVORY_INK ] = { ALABASTER_PIGMENT },
	[ MIDNIGHT_INK ] = { DUSKY_PIGMENT },
	[ LIONS_INK ] = { GOLDEN_PIGMENT },
	[ JADEFIRE_INK ] = { EMERALD_PIGMENT },
	[ CELESTIAL_INK ] = { VIOLET_PIGMENT },
	[ SHIMMERING_INK ] = { SILVERY_PIGMENT },
	[ ETHEREAL_INK ] = { NETHER_PIGMENT },
	[ INKOFTHESEA_INK ] = { AZURE_PIGMENT },
	[ BLACKFALLOW_INK ] = { ASHEN_PIGMENT },
	
	[ HUNTERS_INK ] = { VERDANT_PIGMENT },
	[ DAWNSTAR_INK ] = { BURNT_PIGMENT },
	[ ROYAL_INK ] = { INDIGO_PIGMENT },
	[ FIERY_INK ] = { RUBY_PIGMENT },
	[ INKOFTHESKY_INK ] = { SAPPHIRE_PIGMENT },
	[ DARKFLAME_INK ] = { EBON_PIGMENT },
	[ SNOWFALL_INK ] = { ICY_PIGMENT },
	[ INFERNO_INK ] = { BURNING_EMBERS },

}
