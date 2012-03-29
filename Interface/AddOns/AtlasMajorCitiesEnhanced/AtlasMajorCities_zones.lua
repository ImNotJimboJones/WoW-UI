-- define the colors
local AMC_Colors = {
	["WHITE"]  = "|cffffffff",
	["GREY"]   = "|cff999999",
	["BLACK"]  = "|c00000000",
	["BLUE"]   = "|cff3333ff",
	["GREEN"]  = "|cff00cc00",
	["RED"]    = "|cffcc0000",
	["YELLOW"] = "|cffcccc00",
	["CYAN"]   = "|cff00bbbb",
	["PINK"]   = "|cffff33ff",
	["ORANGE"] = "|cffbb6600",
	["PURPLE"] = "|cff7700bb",
}

-- define the colors for the zones
AtlasMajorCities_ZoneColors = {
	["Dalaran1_"] = {
		["Zone1"] = AMC_Colors["WHITE"],
		["Zone2"] = AMC_Colors["ORANGE"],
		["Zone3"] = AMC_Colors["PURPLE"],
		["Zone4"] = AMC_Colors["YELLOW"],
		["Zone5"] = AMC_Colors["BLUE"],
		["Zone6"] = AMC_Colors["GREEN"],
		["Zone7"] = AMC_Colors["CYAN"],
		["Zone8"] = AMC_Colors["RED"],
	},
	["Dalaran2_"] = {
		["Zone1"] = AMC_Colors["WHITE"],
	},
	["Darnassus"] = {
		["Zone1"] = AMC_Colors["WHITE"],
		["Zone2"] = AMC_Colors["PURPLE"],
		["Zone3"] = AMC_Colors["YELLOW"],
		["Zone4"] = AMC_Colors["BLUE"],
		["Zone5"] = AMC_Colors["GREEN"],
		["Zone6"] = AMC_Colors["CYAN"],
		["Zone7"] = AMC_Colors["RED"],
	},
	["Ironforge"] = {
		["Zone1"] = AMC_Colors["WHITE"],
		["Zone2"] = AMC_Colors["GREEN"],
		["Zone3"] = AMC_Colors["BLUE"],
		["Zone4"] = AMC_Colors["PURPLE"],
		["Zone5"] = AMC_Colors["CYAN"],
		["Zone6"] = AMC_Colors["ORANGE"],
		["Zone7"] = AMC_Colors["YELLOW"],
	},
	["Orgrimmar1_"] = {
		["Zone1"] = AMC_Colors["WHITE"],
		["Zone2"] = AMC_Colors["PURPLE"],
		["Zone3"] = AMC_Colors["YELLOW"],
		["Zone4"] = AMC_Colors["BLUE"],
		["Zone5"] = AMC_Colors["GREEN"],
		["Zone6"] = AMC_Colors["CYAN"],
		["Zone7"] = AMC_Colors["RED"],
	},
	["Orgrimmar2_"] = {
		["Zone1"] = AMC_Colors["WHITE"],
	},
	["ShattrathCity"] = {
		["Zone1"] = AMC_Colors["WHITE"],
		["Zone2"] = AMC_Colors["YELLOW"],
		["Zone3"] = AMC_Colors["RED"],
		["Zone4"] = AMC_Colors["BLUE"],
	},
	["SilvermoonCity"] = {
		["Zone1"] = AMC_Colors["WHITE"],
		["Zone2"] = AMC_Colors["PURPLE"],
		["Zone3"] = AMC_Colors["GREEN"],
		["Zone4"] = AMC_Colors["RED"],
		["Zone5"] = AMC_Colors["CYAN"],
		["Zone6"] = AMC_Colors["ORANGE"],
		["Zone7"] = AMC_Colors["BLUE"],
	},
	["StormwindCity"] = {
		["Zone1"] = AMC_Colors["PINK"],
		["Zone2"] = AMC_Colors["WHITE"],
		["Zone3"] = AMC_Colors["ORANGE"],
		["Zone4"] = AMC_Colors["CYAN"],
		["Zone5"] = AMC_Colors["RED"],
		["Zone6"] = AMC_Colors["PURPLE"],
		["Zone7"] = AMC_Colors["YELLOW"],
		["Zone8"] = AMC_Colors["BLUE"],
		["Zone9"] = AMC_Colors["GREEN"],
		["Zone0"] = AMC_Colors["GREY"],
	},
	["TheExodar"] = {
		["Zone0"] = AMC_Colors["YELLOW"],
		["Zone1"] = AMC_Colors["GREEN"],
		["Zone2"] = AMC_Colors["RED"],
		["Zone3"] = AMC_Colors["PURPLE"],
		["Zone4"] = AMC_Colors["WHITE"],
	},
	["ThunderBluff"] = {
		["Zone1"] = AMC_Colors["WHITE"],
		["Zone2"] = AMC_Colors["PURPLE"],
		["Zone3"] = AMC_Colors["YELLOW"],
		["Zone4"] = AMC_Colors["BLUE"],
		["Zone5"] = AMC_Colors["GREEN"],
		["Zone6"] = AMC_Colors["ORANGE"],
	},
	["Undercity"] = {
		["Zone1"] = AMC_Colors["WHITE"],
		["Zone2"] = AMC_Colors["PURPLE"],
		["Zone3"] = AMC_Colors["BLUE"],
		["Zone4"] = AMC_Colors["GREEN"],
		["Zone5"] = AMC_Colors["ORANGE"],
		["Zone6"] = AMC_Colors["RED"],
	},
}

AtlasMajorCities_ZoneList = {
	["Dalaran1_"] = {
		{
			["Zone"] = "Zone1",
			["x1"] = 62.0,
			["x2"] = 99.9,
			["y1"] = 39.3,
			["y2"] = 52.0,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 47.7,
			["x2"] = 55.7,
			["y1"] = 28.1,
			["y2"] = 35.4,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 44.0,
			["x2"] = 55.7,
			["y1"] = 35.4,
			["y2"] = 43.4,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 55.7,
			["x2"] = 62.0,
			["y1"] = 33.4,
			["y2"] = 43.4,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 34.7,
			["x2"] = 41.2,
			["y1"] = 43.4,
			["y2"] = 55.9,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 41.2,
			["x2"] = 45.5,
			["y1"] = 43.4,
			["y2"] = 59.3,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 45.5,
			["x2"] = 62.0,
			["y1"] = 43.4,
			["y2"] = 62.9,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 54.0,
			["x2"] = 57.0,
			["y1"] = 62.9,
			["y2"] = 99.9,
		},
		{
			["Zone"] = "Zone3",
			["x1"] = 45.5,
			["x2"] = 54.0,
			["y1"] = 62.9,
			["y2"] = 70.5,
		},
		{
			["Zone"] = "Zone3",
			["x1"] = 40.0,
			["x2"] = 54.0,
			["y1"] = 70.5,
			["y2"] = 99.9,
		},
		{
			["Zone"] = "Zone4",
			["x1"] = 62.0,
			["x2"] = 99.9,
			["y1"] = 52.0,
			["y2"] = 62.9,
		},
		{
			["Zone"] = "Zone4",
			["x1"] = 57.0,
			["x2"] = 99.9,
			["y1"] = 62.9,
			["y2"] = 99.9,
		},
		{
			["Zone"] = "Zone5",
			["x1"] = 0.1,
			["x2"] = 32.2,
			["y1"] = 62.1,
			["y2"] = 99.9,
		},
		{
			["Zone"] = "Zone5",
			["x1"] = 32.2,
			["x2"] = 34.7,
			["y1"] = 57.6,
			["y2"] = 70.5,
		},
		{
			["Zone"] = "Zone5",
			["x1"] = 34.7,
			["x2"] = 41.2,
			["y1"] = 55.9,
			["y2"] = 70.5,
		},
		{
			["Zone"] = "Zone5",
			["x1"] = 41.2,
			["x2"] = 45.5,
			["y1"] = 59.3,
			["y2"] = 70.5,
		},
		{
			["Zone"] = "Zone5",
			["x1"] = 32.2,
			["x2"] = 40.0,
			["y1"] = 70.5,
			["y2"] = 99.9,
		},
		{
			["Zone"] = "Zone6",
			["x1"] = 0.1,
			["x2"] = 32.2,
			["y1"] = 0.1,
			["y2"] = 62.1,
		},
		{
			["Zone"] = "Zone6",
			["x1"] = 32.2,
			["x2"] = 34.7,
			["y1"] = 35.4,
			["y2"] = 57.6,
		},
		{
			["Zone"] = "Zone7",
			["x1"] = 32.2,
			["x2"] = 55.7,
			["y1"] = 0.1,
			["y2"] = 28.1,
		},
		{
			["Zone"] = "Zone7",
			["x1"] = 32.2,
			["x2"] = 47.7,
			["y1"] = 28.1,
			["y2"] = 35.4,
		},
		{
			["Zone"] = "Zone7",
			["x1"] = 34.7,
			["x2"] = 44.0,
			["y1"] = 35.4,
			["y2"] = 43.4,
		},
		{
			["Zone"] = "Zone8",
			["x1"] = 55.7,
			["x2"] = 62.0,
			["y1"] = 0.1,
			["y2"] = 33.4,
		},
		{
			["Zone"] = "Zone8",
			["x1"] = 62.0,
			["x2"] = 99.9,
			["y1"] = 0.1,
			["y2"] = 39.3,
		},
	},
	["Dalaran2_"] = {
		{
			["Zone"] = "Zone1",
			["x1"] = 0.1,
			["x2"] = 99.9,
			["y1"] = 0.1,
			["y2"] = 99.9,
		},
	},
	["Darnassus"] = {
		{
			["Zone"] = "Zone1",
			["x1"] = 50.9,
			["x2"] = 99.9,
			["y1"] = 43.4,
			["y2"] = 55.1,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 50.9,
			["x2"] = 99.9,
			["y1"] = 55.1,
			["y2"] = 99.9,
		},
		{
			["Zone"] = "Zone3",
			["x1"] = 48.0,
			["x2"] = 99.9,
			["y1"] = 22.0,
			["y2"] = 43.4,
		},
		{
			["Zone"] = "Zone4",
			["x1"] = 0.1,
			["x2"] = 48.0,
			["y1"] = 22.0,
			["y2"] = 43.4,
		},
		{
			["Zone"] = "Zone5",
			["x1"] = 0.1,
			["x2"] = 50.9,
			["y1"] = 43.4,
			["y2"] = 74.1,
		},
		{
			["Zone"] = "Zone5",
			["x1"] = 0.1,
			["x2"] = 38.4,
			["y1"] = 74.1,
			["y2"] = 99.9,
		},
		{
			["Zone"] = "Zone6",
			["x1"] = 38.4,
			["x2"] = 50.9,
			["y1"] = 74.1,
			["y2"] = 99.9,
		},
		{
			["Zone"] = "Zone7",
			["x1"] = 0.1,
			["x2"] = 99.9,
			["y1"] = 0.1,
			["y2"] = 22.0,
		},
	},
	["Ironforge"] = {
		{
			["Zone"] = "Zone1",
			["x1"] = 0.1,
			["x2"] = 31.8,
			["y1"] = 29.8,
			["y2"] = 56.7,
		},
		{
			["Zone"] = "Zone1",
			["x1"] = 0.1,
			["x2"] = 38.3,
			["y1"] = 56.7,
			["y2"] = 65.2,
		},
		{
			["Zone"] = "Zone1",
			["x1"] = 0.1,
			["x2"] = 54.3,
			["y1"] = 65.2,
			["y2"] = 99.9,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 0.1,
			["x2"] = 41.2,
			["y1"] = 0.1,
			["y2"] = 29.8,
		},
		{
			["Zone"] = "Zone3",
			["x1"] = 41.2,
			["x2"] = 55.6,
			["y1"] = 0.1,
			["y2"] = 24.4,
		},
		{
			["Zone"] = "Zone4",
			["x1"] = 55.6,
			["x2"] = 99.9,
			["y1"] = 0.1,
			["y2"] = 27.0,
		},
		{
			["Zone"] = "Zone4",
			["x1"] = 61.8,
			["x2"] = 99.9,
			["y1"] = 27.0,
			["y2"] = 39.2,
		},
		{
			["Zone"] = "Zone5",
			["x1"] = 61.8,
			["x2"] = 99.9,
			["y1"] = 39.2,
			["y2"] = 61.1,
		},
		{
			["Zone"] = "Zone6",
			["x1"] = 54.3,
			["x2"] = 99.9,
			["y1"] = 61.1,
			["y2"] = 99.9,
		},
		{
			["Zone"] = "Zone7",
			["x1"] = 41.2,
			["x2"] = 55.6,
			["y1"] = 24.4,
			["y2"] = 27.0,
		},
		{
			["Zone"] = "Zone7",
			["x1"] = 31.8,
			["x2"] = 38.3,
			["y1"] = 29.8,
			["y2"] = 56.7,
		},
		{
			["Zone"] = "Zone7",
			["x1"] = 38.3,
			["x2"] = 41.2,
			["y1"] = 29.8,
			["y2"] = 65.2,
		},
		{
			["Zone"] = "Zone7",
			["x1"] = 41.2,
			["x2"] = 54.3,
			["y1"] = 61.1,
			["y2"] = 65.2,
		},
		{
			["Zone"] = "Zone7",
			["x1"] = 41.2,
			["x2"] = 61.8,
			["y1"] = 27.0,
			["y2"] = 61.1,
		},
	},
	["Orgrimmar1_"] = {
		{
			["Zone"] = "Zone1",
			["x1"] = 37.4,
			["x2"] = 40.4,
			["y1"] = 65.1,
			["y2"] = 73.1,
		},
		{
			["Zone"] = "Zone1",
			["x1"] = 40.4,
			["x2"] = 52.1,
			["y1"] = 65.1,
			["y2"] = 76.5,
		},
		{
			["Zone"] = "Zone1",
			["x1"] = 41.9,
			["x2"] = 52.1,
			["y1"] = 76.5,
			["y2"] = 99.9,
		},
		{
			["Zone"] = "Zone1",
			["x1"] = 52.1,
			["x2"] = 61.8,
			["y1"] = 68.9,
			["y2"] = 99.9,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 0.1,
			["x2"] = 41.9,
			["y1"] = 76.5,
			["y2"] = 99.9,
		},
		{
			["Zone"] = "Zone3",
			["x1"] = 49.6,
			["x2"] = 59.9,
			["y1"] = 42.7,
			["y2"] = 51.8,
		},
		{
			["Zone"] = "Zone3",
			["x1"] = 54.1,
			["x2"] = 61.8,
			["y1"] = 51.8,
			["y2"] = 60.8,
		},
		{
			["Zone"] = "Zone3",
			["x1"] = 52.1,
			["x2"] = 61.8,
			["y1"] = 60.8,
			["y2"] = 68.9,
		},
		{
			["Zone"] = "Zone4",
			["x1"] = 59.9,
			["x2"] = 99.9,
			["y1"] = 0.1,
			["y2"] = 51.8,
		},
		{
			["Zone"] = "Zone4",
			["x1"] = 61.8,
			["x2"] = 99.9,
			["y1"] = 51.8,
			["y2"] = 99.9,
		},
		{
			["Zone"] = "Zone5",
			["x1"] = 0.1,
			["x2"] = 37.4,
			["y1"] = 0.1,
			["y2"] = 73.1,
		},
		{
			["Zone"] = "Zone5",
			["x1"] = 0.1,
			["x2"] = 40.4,
			["y1"] = 73.1,
			["y2"] = 76.5,
		},
		{
			["Zone"] = "Zone6",
			["x1"] = 37.4,
			["x2"] = 59.9,
			["y1"] = 0.1,
			["y2"] = 42.7,
		},
		{
			["Zone"] = "Zone6",
			["x1"] = 37.4,
			["x2"] = 49.6,
			["y1"] = 42.7,
			["y2"] = 51.8,
		},
		{
			["Zone"] = "Zone6",
			["x1"] = 37.4,
			["x2"] = 48.8,
			["y1"] = 51.8,
			["y2"] = 55.1,
		},
		{
			["Zone"] = "Zone6",
			["x1"] = 37.4,
			["x2"] = 42.9,
			["y1"] = 55.1,
			["y2"] = 65.1,
		},
		{
			["Zone"] = "Zone7",
			["x1"] = 48.8,
			["x2"] = 54.1,
			["y1"] = 51.8,
			["y2"] = 55.1,
		},
		{
			["Zone"] = "Zone7",
			["x1"] = 42.9,
			["x2"] = 54.1,
			["y1"] = 55.1,
			["y2"] = 60.8,
		},
		{
			["Zone"] = "Zone7",
			["x1"] = 42.9,
			["x2"] = 52.1,
			["y1"] = 60.8,
			["y2"] = 65.1,
		},
	},
	["Orgrimmar2_"] = {
		{
			["Zone"] = "Zone1",
			["x1"] = 0.1,
			["x2"] = 99.9,
			["y1"] = 0.1,
			["y2"] = 99.9,
		},
	},
	["ShattrathCity"] = {
		{
			["Zone"] = "Zone1",
			["x1"] = 45.3,
			["x2"] = 61.3,
			["y1"] = 25.3,
			["y2"] = 30.6,
		},
		{
			["Zone"] = "Zone1",
			["x1"] = 40.5,
			["x2"] = 65.0,
			["y1"] = 30.6,
			["y2"] = 36.7,
		},
		{
			["Zone"] = "Zone1",
			["x1"] = 40.5,
			["x2"] = 67.0,
			["y1"] = 36.7,
			["y2"] = 53.1,
		},
		{
			["Zone"] = "Zone1",
			["x1"] = 40.5,
			["x2"] = 64.4,
			["y1"] = 53.1,
			["y2"] = 58.4,
		},
		{
			["Zone"] = "Zone1",
			["x1"] = 46.0,
			["x2"] = 62.7,
			["y1"] = 58.4,
			["y2"] = 66.8,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 40.5,
			["x2"] = 45.3,
			["y1"] = 25.3,
			["y2"] = 30.6,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 40.5,
			["x2"] = 61.3,
			["y1"] = 0.1,
			["y2"] = 25.3,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 61.3,
			["x2"] = 99.9,
			["y1"] = 0.1,
			["y2"] = 30.6,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 65.0,
			["x2"] = 99.9,
			["y1"] = 30.6,
			["y2"] = 36.7,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 67.0,
			["x2"] = 99.9,
			["y1"] = 36.7,
			["y2"] = 53.1,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 64.4,
			["x2"] = 99.9,
			["y1"] = 53.1,
			["y2"] = 58.4,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 62.7,
			["x2"] = 99.9,
			["y1"] = 58.4,
			["y2"] = 66.8,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 60.0,
			["x2"] = 99.9,
			["y1"] = 66.8,
			["y2"] = 99.9,
		},
		{
			["Zone"] = "Zone3",
			["x1"] = 0.1,
			["x2"] = 46.0,
			["y1"] = 58.4,
			["y2"] = 66.8,
		},
		{
			["Zone"] = "Zone3",
			["x1"] = 0.1,
			["x2"] = 60.0,
			["y1"] = 66.8,
			["y2"] = 99.9,
		},
		{
			["Zone"] = "Zone4",
			["x1"] = 0.1,
			["x2"] = 40.5,
			["y1"] = 0.1,
			["y2"] = 58.4,
		},
	},
	["SilvermoonCity"] = {
		{
			["Zone"] = "Zone1",
			["x1"] = 0.1,
			["x2"] = 68.5,
			["y1"] = 46.3,
			["y2"] = 99.9,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 68.5,
			["x2"] = 74.5,
			["y1"] = 53.9,
			["y2"] = 65.2,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 68.5,
			["x2"] = 79.5,
			["y1"] = 65.2,
			["y2"] = 76.1,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 68.5,
			["x2"] = 99.9,
			["y1"] = 76.1,
			["y2"] = 99.9,
		},
		{
			["Zone"] = "Zone3",
			["x1"] = 81.2,
			["x2"] = 99.9,
			["y1"] = 43.5,
			["y2"] = 53.9,
		},
		{
			["Zone"] = "Zone3",
			["x1"] = 79.5,
			["x2"] = 99.9,
			["y1"] = 53.9,
			["y2"] = 76.1,
		},
		{
			["Zone"] = "Zone4",
			["x1"] = 73.8,
			["x2"] = 78.0,
			["y1"] = 0.1,
			["y2"] = 42.0,
		},
		{
			["Zone"] = "Zone4",
			["x1"] = 78.0,
			["x2"] = 99.9,
			["y1"] = 0.1,
			["y2"] = 43.5,
		},
		{
			["Zone"] = "Zone5",
			["x1"] = 71.7,
			["x2"] = 73.8,
			["y1"] = 44.3,
			["y2"] = 53.9,
		},
		{
			["Zone"] = "Zone5",
			["x1"] = 73.8,
			["x2"] = 78.0,
			["y1"] = 42.0,
			["y2"] = 53.9,
		},
		{
			["Zone"] = "Zone5",
			["x1"] = 78.0,
			["x2"] = 81.2,
			["y1"] = 43.5,
			["y2"] = 53.9,
		},
		{
			["Zone"] = "Zone5",
			["x1"] = 74.5,
			["x2"] = 79.5,
			["y1"] = 53.9,
			["y2"] = 65.2,
		},
		{
			["Zone"] = "Zone6",
			["x1"] = 61.5,
			["x2"] = 73.8,
			["y1"] = 0.1,
			["y2"] = 31.9,
		},
		{
			["Zone"] = "Zone6",
			["x1"] = 0.1,
			["x2"] = 71.7,
			["y1"] = 31.9,
			["y2"] = 46.3,
		},
		{
			["Zone"] = "Zone6",
			["x1"] = 71.7,
			["x2"] = 73.8,
			["y1"] = 31.9,
			["y2"] = 44.3,
		},
		{
			["Zone"] = "Zone6",
			["x1"] = 68.5,
			["x2"] = 71.7,
			["y1"] = 46.3,
			["y2"] = 53.9,
		},
		{
			["Zone"] = "Zone7",
			["x1"] = 0.1,
			["x2"] = 61.5,
			["y1"] = 0.1,
			["y2"] = 31.9,
		},
	},
	["StormwindCity"] = {
		{
			["Zone"] = "Zone1",
			["x1"] = 65.7,
			["x2"] = 99.9,
			["y1"] = 76.9,
			["y2"] = 82.3,
		},
		{
			["Zone"] = "Zone1",
			["x1"] = 58.3,
			["x2"] = 99.9,
			["y1"] = 82.3,
			["y2"] = 99.9,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 58.0,
			["x2"] = 67.5,
			["y1"] = 60.6,
			["y2"] = 64.6,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 54.5,
			["x2"] = 67.5,
			["y1"] = 64.6,
			["y2"] = 72.5,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 67.5,
			["x2"] = 70.5,
			["y1"] = 64.6,
			["y2"] = 76.9,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 70.5,
			["x2"] = 76.6,
			["y1"] = 69.0,
			["y2"] = 76.9,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 56.8,
			["x2"] = 67.5,
			["y1"] = 72.5,
			["y2"] = 76.9,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 58.3,
			["x2"] = 65.7,
			["y1"] = 76.9,
			["y2"] = 82.3,
		},
		{
			["Zone"] = "Zone3",
			["x1"] = 0.1,
			["x2"] = 54.5,
			["y1"] = 64.6,
			["y2"] = 72.5,
		},
		{
			["Zone"] = "Zone3",
			["x1"] = 0.1,
			["x2"] = 56.8,
			["y1"] = 72.5,
			["y2"] = 76.9,
		},
		{
			["Zone"] = "Zone3",
			["x1"] = 0.1,
			["x2"] = 58.3,
			["y1"] = 76.9,
			["y2"] = 99.9,
		},
		{
			["Zone"] = "Zone4",
			["x1"] = 38.0,
			["x2"] = 41.6,
			["y1"] = 19.6,
			["y2"] = 32.2,
		},
		{
			["Zone"] = "Zone4",
			["x1"] = 41.6,
			["x2"] = 44.8,
			["y1"] = 19.6,
			["y2"] = 38.0,
		},
		{
			["Zone"] = "Zone4",
			["x1"] = 44.8,
			["x2"] = 50.0,
			["y1"] = 19.6,
			["y2"] = 44.0,
		},
		{
			["Zone"] = "Zone4",
			["x1"] = 50.0,
			["x2"] = 57.3,
			["y1"] = 25.4,
			["y2"] = 44.0,
		},
		{
			["Zone"] = "Zone5",
			["x1"] = 0.1,
			["x2"] = 38.0,
			["y1"] = 0.1,
			["y2"] = 56.9,
		},
		{
			["Zone"] = "Zone5",
			["x1"] = 38.0,
			["x2"] = 44.8,
			["y1"] = 0.1,
			["y2"] = 19.6,
		},
		{
			["Zone"] = "Zone5",
			["x1"] = 38.0,
			["x2"] = 41.6,
			["y1"] = 32.2,
			["y2"] = 56.9,
		},
		{
			["Zone"] = "Zone5",
			["x1"] = 41.6,
			["x2"] = 44.8,
			["y1"] = 38.0,
			["y2"] = 56.9,
		},
		{
			["Zone"] = "Zone6",
			["x1"] = 44.8,
			["x2"] = 60.6,
			["y1"] = 44.0,
			["y2"] = 48.3,
		},
		{
			["Zone"] = "Zone6",
			["x1"] = 44.8,
			["x2"] = 63.0,
			["y1"] = 48.3,
			["y2"] = 56.9,
		},
		{
			["Zone"] = "Zone6",
			["x1"] = 0.1,
			["x2"] = 63.0,
			["y1"] = 56.9,
			["y2"] = 60.6,
		},
		{
			["Zone"] = "Zone6",
			["x1"] = 0.1,
			["x2"] = 58.0,
			["y1"] = 60.6,
			["y2"] = 64.6,
		},
		{
			["Zone"] = "Zone7",
			["x1"] = 60.7,
			["x2"] = 67.7,
			["y1"] = 25.4,
			["y2"] = 31.1,
		},
		{
			["Zone"] = "Zone7",
			["x1"] = 57.3,
			["x2"] = 70.0,
			["y1"] = 31.1,
			["y2"] = 44.0,
		},
		{
			["Zone"] = "Zone7",
			["x1"] = 60.6,
			["x2"] = 70.0,
			["y1"] = 44.0,
			["y2"] = 48.3,
		},
		{
			["Zone"] = "Zone7",
			["x1"] = 63.0,
			["x2"] = 70.0,
			["y1"] = 48.3,
			["y2"] = 52.0,
		},
		{
			["Zone"] = "Zone8",
			["x1"] = 79.1,
			["x2"] = 99.9,
			["y1"] = 21.5,
			["y2"] = 31.1,
		},
		{
			["Zone"] = "Zone8",
			["x1"] = 70.0,
			["x2"] = 99.9,
			["y1"] = 31.1,
			["y2"] = 48.3,
		},
		{
			["Zone"] = "Zone9",
			["x1"] = 70.0,
			["x2"] = 99.9,
			["y1"] = 48.3,
			["y2"] = 52.0,
		},
		{
			["Zone"] = "Zone9",
			["x1"] = 63.0,
			["x2"] = 99.9,
			["y1"] = 52.0,
			["y2"] = 60.6,
		},
		{
			["Zone"] = "Zone9",
			["x1"] = 67.5,
			["x2"] = 99.9,
			["y1"] = 60.6,
			["y2"] = 64.6,
		},
		{
			["Zone"] = "Zone9",
			["x1"] = 70.5,
			["x2"] = 99.9,
			["y1"] = 64.6,
			["y2"] = 69.0,
		},
		{
			["Zone"] = "Zone9",
			["x1"] = 76.6,
			["x2"] = 99.9,
			["y1"] = 69.0,
			["y2"] = 76.9,
		},
		{
			["Zone"] = "Zone0",
			["x1"] = 44.8,
			["x2"] = 50.0,
			["y1"] = 0.1,
			["y2"] = 19.6,
		},
		{
			["Zone"] = "Zone0",
			["x1"] = 50.0,
			["x2"] = 67.7,
			["y1"] = 0.1,
			["y2"] = 25.4,
		},
		{
			["Zone"] = "Zone0",
			["x1"] = 57.3,
			["x2"] = 60.7,
			["y1"] = 25.4,
			["y2"] = 31.1,
		},
		{
			["Zone"] = "Zone0",
			["x1"] = 67.7,
			["x2"] = 79.1,
			["y1"] = 0.1,
			["y2"] = 31.1,
		},
		{
			["Zone"] = "Zone0",
			["x1"] = 79.1,
			["x2"] = 99.9,
			["y1"] = 0.1,
			["y2"] = 21.5,
		},
	},
	["TheExodar"] = {
		{
			["Zone"] = "Zone0",
			["x1"] = 67.1,
			["x2"] = 99.9,
			["y1"] = 0.1,
			["y2"] = 67.6,
		},
		{
			["Zone"] = "Zone1",
			["x1"] = 49.1,
			["x2"] = 67.1,
			["y1"] = 0.1,
			["y2"] = 41.0,
		},
		{
			["Zone"] = "Zone1",
			["x1"] = 44.6,
			["x2"] = 67.1,
			["y1"] = 41.0,
			["y2"] = 53.6,
		},
		{
			["Zone"] = "Zone1",
			["x1"] = 50.0,
			["x2"] = 67.1,
			["y1"] = 53.6,
			["y2"] = 59.5,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 50.0,
			["x2"] = 67.1,
			["y1"] = 59.5,
			["y2"] = 67.6,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 48.0,
			["x2"] = 99.9,
			["y1"] = 67.6,
			["y2"] = 79.5,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 44.1,
			["x2"] = 99.9,
			["y1"] = 79.5,
			["y2"] = 99.9,
		},
		{
			["Zone"] = "Zone3",
			["x1"] = 0.1,
			["x2"] = 44.6,
			["y1"] = 46.5,
			["y2"] = 53.6,
		},
		{
			["Zone"] = "Zone3",
			["x1"] = 0.1,
			["x2"] = 50.0,
			["y1"] = 53.6,
			["y2"] = 67.6,
		},
		{
			["Zone"] = "Zone3",
			["x1"] = 0.1,
			["x2"] = 48.0,
			["y1"] = 67.6,
			["y2"] = 79.5,
		},
		{
			["Zone"] = "Zone3",
			["x1"] = 0.1,
			["x2"] = 44.1,
			["y1"] = 79.5,
			["y2"] = 99.9,
		},
		{
			["Zone"] = "Zone4",
			["x1"] = 0.1,
			["x2"] = 44.6,
			["y1"] = 0.1,
			["y2"] = 46.5,
		},
		{
			["Zone"] = "Zone4",
			["x1"] = 44.6,
			["x2"] = 49.1,
			["y1"] = 0.1,
			["y2"] = 41.0,
		},
	},
	["ThunderBluff"] = {
		{
			["Zone"] = "Zone1",
			["x1"] = 0.1,
			["x2"] = 40.6,
			["y1"] = 44.4,
			["y2"] = 70.8,
		},
		{
			["Zone"] = "Zone1",
			["x1"] = 40.6,
			["x2"] = 48.4,
			["y1"] = 47.7,
			["y2"] = 70.8,
		},
		{
			["Zone"] = "Zone1",
			["x1"] = 48.4,
			["x2"] = 52.0,
			["y1"] = 58.7,
			["y2"] = 70.8,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 35.5,
			["x2"] = 52.0,
			["y1"] = 0.1,
			["y2"] = 44.4,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 52.0,
			["x2"] = 55.8,
			["y1"] = 0.1,
			["y2"] = 41.3,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 40.6,
			["x2"] = 48.4,
			["y1"] = 44.4,
			["y2"] = 47.7,
		},
		{
			["Zone"] = "Zone3",
			["x1"] = 48.4,
			["x2"] = 52.0,
			["y1"] = 44.4,
			["y2"] = 58.7,
		},
		{
			["Zone"] = "Zone3",
			["x1"] = 52.0,
			["x2"] = 55.8,
			["y1"] = 41.3,
			["y2"] = 70.8,
		},
		{
			["Zone"] = "Zone3",
			["x1"] = 55.8,
			["x2"] = 99.9,
			["y1"] = 36.7,
			["y2"] = 70.8,
		},
		{
			["Zone"] = "Zone4",
			["x1"] = 0.1,
			["x2"] = 99.9,
			["y1"] = 70.8,
			["y2"] = 99.9,
		},
		{
			["Zone"] = "Zone5",
			["x1"] = 55.8,
			["x2"] = 99.9,
			["y1"] = 0.1,
			["y2"] = 36.7,
		},
		{
			["Zone"] = "Zone6",
			["x1"] = 0.1,
			["x2"] = 35.5,
			["y1"] = 0.1,
			["y2"] = 44.4,
		},
	},
	["Undercity"] = {
		{
			["Zone"] = "Zone1",
			["x1"] = 60.5,
			["x2"] = 71.5,
			["y1"] = 32.6,
			["y2"] = 35.7,
		},
		{
			["Zone"] = "Zone1",
			["x1"] = 58.5,
			["x2"] = 73.5,
			["y1"] = 35.7,
			["y2"] = 52.0,
		},
		{
			["Zone"] = "Zone1",
			["x1"] = 60.5,
			["x2"] = 71.5,
			["y1"] = 52.0,
			["y2"] = 55.2,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 0.1,
			["x2"] = 58.5,
			["y1"] = 44.3,
			["y2"] = 52.0,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 0.1,
			["x2"] = 60.5,
			["y1"] = 52.0,
			["y2"] = 82.3,
		},
		{
			["Zone"] = "Zone2",
			["x1"] = 60.5,
			["x2"] = 66.0,
			["y1"] = 55.2,
			["y2"] = 82.3,
		},
		{
			["Zone"] = "Zone3",
			["x1"] = 0.1,
			["x2"] = 60.5,
			["y1"] = 0.1,
			["y2"] = 35.7,
		},
		{
			["Zone"] = "Zone3",
			["x1"] = 60.5,
			["x2"] = 66.0,
			["y1"] = 0.1,
			["y2"] = 32.6,
		},
		{
			["Zone"] = "Zone3",
			["x1"] = 0.1,
			["x2"] = 58.5,
			["y1"] = 35.7,
			["y2"] = 44.3,
		},
		{
			["Zone"] = "Zone4",
			["x1"] = 66.0,
			["x2"] = 71.5,
			["y1"] = 0.1,
			["y2"] = 32.6,
		},
		{
			["Zone"] = "Zone4",
			["x1"] = 71.5,
			["x2"] = 99.9,
			["y1"] = 0.1,
			["y2"] = 35.7,
		},
		{
			["Zone"] = "Zone4",
			["x1"] = 73.5,
			["x2"] = 99.9,
			["y1"] = 35.7,
			["y2"] = 44.3,
		},
		{
			["Zone"] = "Zone5",
			["x1"] = 73.5,
			["x2"] = 99.9,
			["y1"] = 44.3,
			["y2"] = 52.0,
		},
		{
			["Zone"] = "Zone5",
			["x1"] = 71.5,
			["x2"] = 99.9,
			["y1"] = 52.0,
			["y2"] = 99.9,
		},
		{
			["Zone"] = "Zone5",
			["x1"] = 66.0,
			["x2"] = 71.5,
			["y1"] = 55.2,
			["y2"] = 99.9,
		},
		{
			["Zone"] = "Zone6",
			["x1"] = 0.1,
			["x2"] = 66.0,
			["y1"] = 82.3,
			["y2"] = 99.9,
		},
	},
}
