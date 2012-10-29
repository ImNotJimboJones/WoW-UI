local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Horde" then return end
if ZGV:DoMutex("ProfessionsH") then return end
ZygorGuidesViewer:RegisterGuide("Zygor's Horde Profession Guides\\Alchemy\\Alchemy 1-500 Leveling Guide",[[
description This guide will walk you through leveling your Alchemy skill from 1-500.
author support@zygorguides.com
completion skill,Alchemy,500
condition suggested hasprof('Alchemy',1,500)
#include profession_dual_start,prof1="Alchemy",prof2="Herbalism" 
// routing to the proper section.
step
label "route"
'Redirecting to Alchemy 1-55 |next "alch_1-55" |only if skill("Alchemy")<55
'Redirecting to Alchemy 55-125 |next "alch_55-125" |only if skill("Alchemy")>=55 and skill("Alchemy")<125
'Redirecting to Alchemy 125-215 |next "alch_125-215" |only if skill("Alchemy")>=125 and skill("Alchemy")<215
'Redirecting to Alchemy 215-275 |next "alch_215-275" |only if skill("Alchemy")>=215 and skill("Alchemy")<275
'Redirecting to Alchemy 275-355 |next "alch_275-355" |only if skill("Alchemy")>=275 and skill("Alchemy")<355
'Redirecting to Alchemy 355-425 |next "alch_355-425" |only if skill("Alchemy")>=355 and skill("Alchemy")<425
'Redirecting to Alchemy 425-500 |next "alch_425-500" |only if skill("Alchemy")>=425 and skill("Alchemy")<500
'Redirecting to Alchemy 500-600 |next "alch_500-600" |only if skill("Alchemy")>=500 and skill("Alchemy")<600
'Redirecting to Alchemy finale |next "alch_600" |only if default
// ----------
// 1 - 55
// ----------
// TRAIN: Apprentice Alchemy
step
label "alch_1-55"
title + Alchemy 1-55
#include "trainer_Alchemy"
.skillmax Alchemy,75 |tip You must be at least level 5.
step
#include "home_ValleyofStrength"
step
#include "auctioneer"
.buy 55 Peacebloom##2447
.buy 55 Silverleaf##765
#include "go_farm",skill="Herbalism",req="1",goto="alch_1-55_farm"
next "alch_1-55_skill"
// GATHER: 55 Peacebloom, 55 Silverleaf
step
label "alch_1-55_farm"
title + Alchemy 1-55 (farming)
map Durotar
path follow loose;loop;ants straight 
path	46.2,17.1	38.8,16.2	38.7,22.1
path	37.9,30.4	48.5,32.8	51.4,36.5
path	51.7,52.0	53.6,62.4	55.6,69.7
path	60.9,69.1	60.7,58.0	57.6,46.9
path	55.0,32.4	57.8,26.1	53.4,12.5
#include "follow_path_herbs"
.collect 55 Peacebloom##2447
.collect 55 Silverleaf##765
skill Herbalism,50
#include "max_skill_warning",skill="Herbalism",goto="alch_1-55_farm"
// CREATE: 55 Minor Healing Potion
step
label "alch_1-55_skill"
title Alchemy 1-55
#include "vendor_Alchemy"
.buy 55 Crystal Vial##3371 |tip You can buy more just in case.
step
.create 55 Minor Healing Potion##2330,Alchemy,55 |tip You will need to save 38 of these for later use.
// ----------
// 55 - 125
// ----------
// TRAIN: Journeyman Alchemy
step
label "alch_55-125"
title + Alchemy 55-125
#include "trainer_Alchemy"
.skillmax Alchemy,150 |tip You must be at least level 10.
.learn Lesser Healing Potion##2337
step
#include "auctioneer"
.buy 38 Mageroyal##785
.buy 114 Briarthorn##2450
.buy 38 Minor Healing Potion##118 |only if itemcount("Minor Healing Potion")<38
#include go_farm,skill="Herbalism",req="50",goto="alch_55-125_farm"
|next "alch_55-125_skill"
// GATHER: 38 Peacebloom (if needed), 38 Silverleaf (if needed), 71 Mageroyal, 114 Briarthorn, 33 Stranglekelp
step
label "alch_55-125_farm"
title + Alchemy 55-125 (farming)
#include "trainer_Herbalism"
.skillmax Herbalism,150
step
label "farm"
'Skipping 1st part of farming |next "+farm2" |only if itemcount("Minor Healing Potion")>=38
'Proceeding to farm |next |only if default
step
map Durotar
path follow loose;loop;ants straight 
path	46.2,17.1	38.8,16.2	38.7,22.1
path	37.9,30.4	48.5,32.8	51.4,36.5
path	51.7,52.0	53.6,62.4	55.6,69.7
path	60.9,69.1	60.7,58.0	59.2,45.0
path	58.4,34.8	57.8,26.1	53.4,12.5
#include "follow_path_herbs"
.collect 38 Peacebloom##2447
.collect 38 Silverleaf##765
skill Herbalism,50
#include "max_skill_warning",skill="Herbalism",goto="alch_55-125_farm"
step
label "farm2"
'Skipping 2nd part of farming |next "+exit" |only if step:Find("+farming"):IsComplete()
'Proceeding to farm |next |only if default
step
label "farming"
map Hillsbrad Foothills
path 31.8,62.6		33.9,54.0		29.7,44.1
path 35.5,37.8		34.5,28.2		39.5,21.0		
path 44.2,8.3		51.3,14.0		57.5,20.9	
path 56.1,34.3		49.9,46.2		41.2,46.6
path 40.1,55.0		41.3,67.4		31.8,71.9
#include "follow_path_herbs"
.collect 71 Mageroyal##785
.collect 114 Briarthorn##2450
.collect 33 Stranglekelp##3820 |opt |tip Keep any Stranglekelp you find for later.
skill Herbalism,125
#include "max_skill_warning",skill="Herbalism",goto="alch_55-125_farm"
// CREATE: 38 Lesser Healing Potion, 38 Elixir of Wisdom
step
label "alch_55-125_skill"
title + Alchemy 55-125
#include "vendor_Alchemy"
.buy 114 Crystal Vial##3371 |only if itemcount("Minor Healing Potion")<38
.buy 76 Crystal Vial##3371 |only if itemcount("Minor Healing Potion")>=38
step
.create 38 Minor Healing Potion##118 |only if itemcount("Minor Healing Potion")<38
step
.create 38 Lesser Healing Potion##2337,Alchemy,90
step
#include "trainer_Alchemy"
.learn Elixir of Wisdom##3171
step
.create 38 Elixir of Wisdom##3171,Alchemy,125
]])
ZygorGuidesViewer:RegisterGuide("Zygor's Horde Profession Guides\\Archaeology\\Archaeology 1-525 Leveling Guide",[[
description This guide will walk you through leveling your Archaeology skill from 1-525.
author support@zygorguides.com
completion skill,Archaeology,525
condition suggested hasprof('Archaeology',1,525)
#include "profession_secondary_start",prof1="Archaeology"
// routing to the proper section.
step
'Redirecting to Archaeology 1-50 |next "arc_1-50" |only if skill("Archaeology")<50
'Redirecting to Archaeology 50-150 |next "arc_50-150" |only if skill("Archaeology")>=50 and skill("Archaeology")<150
'Redirecting to Archaeology 150-200 |next "arc_150-200" |only if skill("Archaeology")>=150 and skill("Archaeology")<200
'Redirecting to Archaeology 200-300 |next "arc_200-300" |only if skill("Archaeology")>=200 and skill("Archaeology")<300
'Redirecting to Archaeology 300-375 |next "arc_300-375" |only if skill("Archaeology")>=300 and skill("Archaeology")<375
'Redirecting to Archaeology 375-450 |next "arc_375-450" |only if skill("Archaeology")>=375 and skill("Archaeology")<450
'Redirecting to Archaeology 450-525 |next "arc_450-525" |only if skill("Archaeology")>=450 and skill("Archaeology")<525
'Redirecting to Archaeology 450-525 |next "arc_525-600" |only if skill("Archaeology")>=525 and skill("Archaeology")<600
'Redirecting to Archaeology finale |next "arc_600" |only if default
// ----------
// 1 - 50
// ----------
// TRAIN: Apprentice Archaeology
step
title + Archaeology 1-50
label "arc_1-50"
#include "trainer_Archaeology"
.' Learn the Archaeology skill |skillmax Archaeology,75 |tip You must be at least level 20.
|only if skill("Archaeology")<1
step
#include "home_ValleyofStrength"
step
'Open your world map, find dig sites in Kalimdor and Eastern Kingdoms, and go to them |tip They look like small shovel icons on your world map that spawn in random places.  Once you get to the zone where the dig site is located, you will see the dig site on your map as a red highlighted area.
.' Use your Survey ability inside the dig site area |cast Survey##80451
.' A telescope will appear, follow the direction it points in and continue using your Survey ability to eventually find the artifacts |tip Each dig site has 6 artifacts you can find.
.' Click the Archaeology Fragments that spawn on the ground
.skill Archaeology,50
// ----------
// 50 - 150
// ----------
// TRAIN: Journeyman Archaeology
step
title + Archaeology 50-150
label "arc_50-150"
#include "trainer_Archaeology"
.' Learn the Journeyman Archaeology skill |skillmax Archaeology,150 |tip You must be at least level 20.
step
'Open your world map, find dig sites in Kalimdor and Eastern Kingdoms, and go to them |tip They look like small shovel icons on your world map that spawn in random places.  Once you get to the zone where the dig site is located, you will see the dig site on your map as a red highlighted area.
.' Use your Survey ability inside the dig site area |cast Survey##80451
.' A telescope will appear, follow the direction it points in and continue using your Survey ability to eventually find the artifacts |tip Each dig site has 6 artifacts you can find.
.' Click the Archaeology Fragments that spawn on the ground
.' Open your Archaeology profession window |cast Archaeology##78670
.' Click artifacts to open them, then solve them once you have the required amounts of each
.skill Archaeology,150
]])
ZygorGuidesViewer:RegisterGuide("Zygor's Horde Profession Guides\\Blacksmithing\\Blacksmithing 1-500 Leveling Guide",[[
description This guide will walk you through leveling your Blacksmithing skill from 1-500.
author support@zygorguides.com
completion skill,Blacksmithing,500
condition suggested hasprof('Blacksmithing',1,500)
#include profession_dual_start,prof1="Blacksmithing",prof2="Mining"
// routing to the proper section.
step
label "route"
'Redirecting to Blacksmithing 1-75 |next "bla_1-75" |only if skill("Blacksmithing")<75
'Redirecting to Blacksmithing 75-125 |next "bla_75-125" |only if skill("Blacksmithing")>=75 and skill("Blacksmithing")<125
'Redirecting to Blacksmithing 125-210 |next "bla_125-210" |only if skill("Blacksmithing")>=125 and skill("Blacksmithing")<210
'Redirecting to Blacksmithing 210-300 |next "bla_210-300" |only if skill("Blacksmithing")>=210 and skill("Blacksmithing")<300
'Redirecting to Blacksmithing 300-325 |next "bla_300-325" |only if skill("Blacksmithing")>=300 and skill("Blacksmithing")<325
'Redirecting to Blacksmithing 325-350 |next "bla_325-350" |only if skill("Blacksmithing")>=325 and skill("Blacksmithing")<350
'Redirecting to Blacksmithing 350-425 |next "bla_350-425" |only if skill("Blacksmithing")>=350 and skill("Blacksmithing")<425
'Redirecting to Blacksmithing 425-475 |next "bla_425-475" |only if skill("Blacksmithing")>=425 and skill("Blacksmithing")<475
'Redirecting to Blacksmithing 475-525 |next "bla_475-500" |only if skill("Blacksmithing")>=475 and skill("Blacksmithing")<500
'Redirecting to Blacksmithing 500-600 |next "bla_500-600" |only if skill("Blacksmithing")>=500 and skill("Blacksmithing")<600
'Redirecting to Blacksmithing finale |next "bla_600" |only if default
// ----------
// 1 - 75
// ----------
// TRAIN: Apprentice Blacksmithing
step
title + Blacksmithing 1-75
label "bla_1-75"
#include "trainer_Blacksmithing"
.skillmax Blacksmithing,75 
step
#include "vendor_Blacksmithing"
.buy 1 Blacksmith Hammer##5956
step
#include "home_ValleyofStrength"
step
#include "auctioneer"
.buy 95 Rough Stone##2835
.buy 150 Copper Bar##2840
#include go_farm,skill="Mining",req="1",goto="bla_1-75_farm"
next "bla_1-75_skill"
// GATHER:  95 Rough Stone, 90 Copper Ore
step
label "bla_1-75_farm"
#include vendor_Blacksmithing
.buy 1 Mining Pick##2901
step
map Durotar
path	38.9,16.0	37.5,21.1	35.9,34.4
path +	36.8,52.3	44.2,49.5	50.6,46.3
path +	50.7,63.3	54.9,67.0	56.2,49.8
path +	55.0,36.9	53.0,29.7	57.9,30.0
path +	54.8,19.0	50.0,17.2	44.2,23.6
#include "follow_path_mine"
.collect 95 Rough Stone##2835
.collect 90 Copper Ore##2770
.skill Mining,50
#include "max_skill_warning",skill="Mining",goto="bla_1-75_farm"
step
#include "maincity_forge2"
.create Copper Bar##2657,Mining,150 total |n
.collect 150 Copper Bar##2840
// CREATE:  25 Rough Sharpening Stone, 35 Rough Grinding Stone, 15 Copper Chain Belt
step
label "bla_1-75_skill"
#include "maincity_anvil"
.create Rough Sharpening Stone##2660,Blacksmithing,25
step
#include "trainer_Blacksmithing"
.learn Rough Grinding Stone##3320
step
#include "maincity_anvil"
.create Rough Grinding Stone##3320,Blacksmithing,60 |tip Save 10 Rough Grinding Stones, you will need them later.
step
#include "trainer_Blacksmithing"
.learn Copper Chain Belt##2661
step
#include "maincity_anvil"
.create Copper Chain Belt##2661,Blacksmithing,75
// ----------
// 75 - 125
// ----------
// TRAIN: Journeyman Blacksmithing
step
title + Blacksmithing 75-125
label "bla_75-125"
#include "trainer_Blacksmithing"
.skillmax Blacksmithing,150 
step
#include "auctioneer"
.buy 60 Coarse Stone##2836
.buy 200 Copper Bar##2840
.buy 120 Bronze Bar##2841
#include go_farm,skill="Mining",req="65",goto="bla_75-125_farm"
next "bla_75-125_skill"
// GATHER:  60 Coarse Stone, 85 Tin Ore, 255 Copper Ore
step
label "bla_75-125_farm"
#include "trainer_Mining"
.skillmax Mining,150
.learn Smelt Bronze##2659
.learn Smelt Tin##3304
'Your _Mining_ skill is too low to learn this; You can proceed with farming, but your skill gains will stop at 75. It's better to skill up first. |only if skill("Mining")<50 and skillmax("Mining")<150
step
label "farm"
'Skipping 1st part of farming |next "+farm2" |only if itemcount("Copper Bar")>=235
'Skipping 1st part of farming |next "+farm2" |only if step:Find("+farming"):IsComplete()
'Proceeding to farm |next |only if default
step
label "farming"
map Durotar
path	38.9,16.0	37.5,21.1	35.9,34.4
path +	36.8,52.3	44.2,49.5	50.6,46.3
path +	50.7,63.3	54.9,67.0	56.2,49.8
path +	55.0,36.9	53.0,29.7	57.9,30.0
path +	54.8,19.0	50.0,17.2	44.2,23.6
#include "follow_path_mine"
.collect 255 Copper Ore##2770 |only if itemcount("Copper Bar")<235
#include "max_skill_warning",skill="Mining",goto="bla_1-75_farm"
step
label "farm2"
map Ashenvale
path	82.0,50.2	78.8,44.9	67.1,45.8
path +	61.9,42.6	59.5,37.5	54.5,37.1
path +	53.5,48.2	49.5,54.7	45.5,47.5
path +	41.8,40.3	40.1,32.4	38.2,30.3
path +	34.6,33.3	33.6,28.5	33.0,22.5
path +	25.4,19.3	21.0,19.1	16.6,15.7
path +	14.1,13.1	17.0,23.7	17.3,28.2
path +	16.5,36.6	19.5,45.7	18.8,55.4
path +	23.4,50.2	25.4,54.2	25.7,60.4
path +	29.9,58.1	31.8,64.7	33.1,70.3
path +	38.8,62.7	42.0,64.2	55.6,68.4
path +	62.7,64.6	67.0,69.1	75.6,69.2
path +	82.4,71.8	86.5,79.1	90.1,76.6
#include "follow_path_mine"
.collect 60 Coarse Stone##2836
.collect 85 Tin Ore##2771
skill Mining,125
#include "max_skill_warning",skill="Mining",goto="bla_75-125_farm"
step
#include "maincity_forge2"
.create Copper Bar##2657,Mining,205 total |n
.collect 255 Copper Bar##2840
step
#include "maincity_forge2"
.create Tin Bar##3304,Mining,85 total |n
.collect 85 Tin Bar##3576
step
#include "maincity_forge2"
.create Bronze Bar##2659,Mining,170 total |n
.collect 170 Bronze Bar##2841
// CREATE:  30 Coarse Grinding Stone, 15 Runed Copper Belt, 20 Rough Bronze Leggings
step
label "bla_75-125_skill"
#include "trainer_Blacksmithing"
.learn Coarse Grinding Stone##3326
step
#include "maincity_anvil"
.create 30 Coarse Grinding Stone##3326,Blacksmithing,30 total |n
.collect 30 Coarse Grinding Stone##3478 |tip Save 30 Coarse Grinding Stones, you'll need them later.
step
#include "trainer_Blacksmithing"
.learn Runed Copper Belt##2666
step
#include "maincity_anvil"
.create Runed Copper Belt##2666, Blacksmithing,105
step
#include "trainer_Blacksmithing"
.learn Rough Bronze Leggings##2668
step
#include "maincity_anvil"
.create Rough Bronze Leggings##2668,Blacksmithing,125
]])
ZygorGuidesViewer:RegisterGuide("Zygor's Horde Profession Guides\\Cooking\\Cooking 1-525 Leveling Guide",[[
description This guide will walk you through leveling your Cooking skill from 1-525.
author support@zygorguides.com
completion skill,Cooking,525
condition suggested not ZGV.Expansion_Mists and hasprof('Cooking',1,525)
#include "profession_secondary_start",prof1="Cooking"
step
label "route"
'Redirecting to Cooking 1-75 |next "cook_1-75" |only if skill("Cooking")<75
'Redirecting to Cooking 75-130 |next "cook_75-130" |only if skill("Cooking")>=75 and skill("Cooking")<130
'Redirecting to Cooking 130-225 |next "cook_130-225" |only if skill("Cooking")>=130 and skill("Cooking")<225
'Redirecting to Cooking 225-285 |next "cook_225-285" |only if skill("Cooking")>=225 and skill("Cooking")<285
'Redirecting to Cooking 285-350 |next "cook_285-350" |only if skill("Cooking")>=285 and skill("Cooking")<350
'Redirecting to Cooking 350-400 |next "cook_350-400" |only if skill("Cooking")>=350 and skill("Cooking")<400
'Redirecting to Cooking 400-425 |next "cook_400-425" |only if skill("Cooking")>=400 and skill("Cooking")<425
'Redirecting to Cooking 425-450 |next "cook_425-525" |only if skill("Cooking")>=425 and skill("Cooking")<525
'Redirecting to Cooking finale |next "cook_525" |only if default
// ----------
// 1 - 75
// ----------
// TRAIN: Apprentice Cooking
step
title + Cooking 1-75
label "cook_1-75"
#include "trainer_Cooking"
.skillmax Cooking,75
.learn Spice Bread##37836
step
#include "home_ValleyofStrength"
step
goto Silverpine Forest 43.2,40.6
.talk 3556
.buy 1 Recipe: Smoked Bear Meat##6892
step
#include "vendor_Cooking"
.buy 50 Simple Flour##30817
.buy 50 Mild Spices##2678
step
#include "auctioneer"
.buy 35 Bear Meat##3173
#include go_farm,skill="Cooking",req="1",goto="cook_1-75_farm"
next "cook_1-75_skill"
// GATHER: 35 Bear Meat
step
label "cook_1-75_farm"
goto Silverpine Forest,42.8,17.6
.from Giant Rabid Bear##1797+
.from Ferocious Grizzled Bear##1778+ |tip They're all around the forest
.collect 35 Bear Meat##3173
'There are more around
'You can find more at [50.0,15.7] 
'You can find more at [47.7,25.4]
'You can find more at [39.4,24.0] 
'You can find more at [47.2,32.7]
'You can find more at [56.0,27.6] 
'You can find more at [57.2,17.3]
'You can find more at [61.1,13.9]
// CREATE: 50 Spice Bread, 35 Smoke Bear Meat
step
label "cook_1-75_skill"
#include "cast_campfire"
.create 50 Spice Bread##37836,Cooking,40
step
'Use the Recipe: Smoked Bear Meat in your bags |use Recipe: Smoked Bear Meat##6892
.learn Smoked Bear Meat##8607
step
#include "cast_campfire"
.create 35 Smoked Bear Meat##8607,Cooking,75
// ----------
// 75 - 130
// ----------
// TRAIN: Journeyman
step
title + Cooking 75-130
label "cook_75-130"
#include "trainer_Cooking"
|skillmax Cooking,150
.learn Boiled Clams##6499
.learn Crab Cake##2544
step
#include "auctioneer"
.buy 42 Clam Meat##5503
.buy 30 Crawler Meat##2674
#include go_farm,skill="Cooking",req="75",goto="cook_75-130_farm"
next "cook_75-130_skill"
// GATHER: 50 Clam Meat, 30 Crawler Meat
step
label "cook_75-130_farm"
goto Ashenvale,13.0,29.2
.from Wrathtail Wave Rider##3713+, Wrathtail Sorceress##3717+, Spined Crawler##3814+, Mystlash Hydra##3721+, Clattering Crawler##3812+, Spined Crawler##3814+
.collect 30 Crawler Meat##2674
.collect Small Barnacled Clam##5523 |n |use Small Barnacled Clam##5523
|tip Use the clams in your bags
.collect 50 Clam Meat##5503
// CREATE: 50 Boiled Clams, 30 Crab Cakes
step
label "cook_75-130_skill"
#include "vendor_Cooking"
.buy 50 Refreshing Spring Water##159
step
#include "cast_campfire"
.create 50 Boiled Clams##6499,Cooking,110
step
#include "cast_campfire"
.create 30 Crab Cake##2544,Cooking,130
]])
ZygorGuidesViewer:RegisterGuide("Zygor's Horde Profession Guides\\Enchanting\\Enchanting 1-525 Leveling Guide",[[
description This guide will walk you through leveling your Enchanting skill from 1-525.
author support@zygorguides.com
completion skill,Enchanting,525
condition suggested hasprof('Enchanting',1,525)
#include "profession_single_start",prof1="Enchanting"
step
label "route"
'Redirecting to Enchanting 1-75 |next "ench_1_75" |only if skill("Enchanting")<75
'Redirecting to Enchanting 75-135 |next "ench_75_135" |only if skill("Enchanting")>=75 and skill("Enchanting")<135
'Redirecting to Enchanting 135-205 |next "ench_135_205" |only if skill("Enchanting")>=135 and skill("Enchanting")<205
'Redirecting to Enchanting 205-300 |next "ench_205_300" |only if skill("Enchanting")>=205 and skill("Enchanting")<300
'Redirecting to Enchanting 300-351 |next "ench_300_351" |only if skill("Enchanting")>=300 and skill("Enchanting")<351
'Redirecting to Enchanting 351-426 |next "ench_351_426" |only if skill("Enchanting")>=351 and skill("Enchanting")<426
'Redirecting to Enchanting 426-525 |next "ench_426_525" |only if skill("Enchanting")>=426 and skill("Enchanting")<525
'Redirecting to Enchanting 525-600 |next "ench_525_600" |only if skill("Enchanting")>=525 and skill("Enchanting")<600
'Redirecting to Enchanting finale |next "ench_600" |only if default
// ----------
// 1 - 75
// ----------
// TRAIN: Apprentice Enchanter
step
title +Enchanting 1-75
label "ench_1_75"
#include "trainer_Enchanting"
.skillmax Enchanting,75
step
#include "vendor_Enchanting"
.buy 1 Copper Rod##6217
step
#include "home_TradeDistrict"
step
#include "auctioneer"
.buy 138 Strange Dust##10940
.buy 1 Lesser Magic Essence##10938
#include "go_disenchant",skill="Enchanting",req="1",goto="ench_1_75_farm"
next "ench_1_75_skill"
// DISENCHANT: 138 Strange Dust, 1 Lesser Magic Essence
step
label "ench_1_75_farm"
'Disenchant any uncommon quality (green) weapons and armor with an item level of 5-15. |cast Disenchant##13262
.collect 130 Strange Dust##10940
.collect 1 Lesser Magic Essence##10938
// ENCHANT: 1 Runed Copper Rod, 48 Bracer - Minor Health
step
label "ench_1_75_skill"
.create 1 Runed Copper Rod##7421,Enchanting,2 |tip Save the Runed Copper Rod in your bags, you will need it to enchant items. 
step
.create 76 Enchant Bracer - Minor Health##7418,Enchanting,75 |tip You can keep enchanting the same item repeatedly.
// ----------
// 75 - 135
// ----------
// TRAIN: Journeyman Enchanter
step
title +Enchanting 75-135
label "ench_75_135"
#include "trainer_Enchanting"
.skillmax Enchanting,150 
step
#include "vendor_Enchanting"
.buy 9 Simple Wood##4470
step
.create 25 Enchant Bracer - Minor Health##7418,Enchanting,90 |tip You can keep enchanting the same item repeatedly.
step
#include "auctioneer"
.buy 12 Greater Magic Essence##10939
.buy 25 Lesser Astral Essence##10998
#include "go_disenchant",skill="Enchanting",req="1",goto="ench_75_135_farm"
next "ench_75_135_skill"
// DISENCHANT: 12 Greater Magic Essence, 25 Lesser Astral Essence
step
label "ench_75_135_farm"
'Disenchant any uncommon quality (green) weapons and armor with an item level of 16-20. |cast Disenchant##13262
.collect 12 Greater Magic Essence##10939
'Disenchant any uncommon quality (green) weapons and armor with an item level of 21-25. |cast Disenchant##13262
.collect 25 Lesser Astral Essence##10998
// ENCHANT: 10 Bracer - Minor Stamina, 1 Runed Silver Rod, 9 Greater Magic Wand, 25 Cloak - Minor Agility
step
label "ench_75_135_skill"
#include "trainer_Enchanting"
.learn Enchant Bracer - Minor Stamina##7457
step
.create 10 Enchant Bracer - Minor Stamina##7457,Enchanting,101 |tip You can keep enchanting the same item repeatedly.
step
#include "trainer_Enchanting"
.learn Greater Magic Wand##14807
step
.create 9 Greater Magic Wand##14807,Enchanting,110
step
goto Stonetalon Mountains 48.6,61.6
.talk 12043
.buy 1 Formula: Enchant Bracer - Lesser Strength##11101
.buy 1 Formula: Enchant Cloak - Minor Agility##11039
step
'Learn Formula: Enchant Cloak - Minor Agility |use Formula: Enchant Cloak - Minor Agility##11039 |n
.create 25 Enchant Cloak - Minor Agility##13419,Enchanting,135
]])
ZygorGuidesViewer:RegisterGuide("Zygor's Horde Profession Guides\\Engineering\\Engineering 1-500 Leveling Guide",[[
description This guide will walk you through leveling your Engineering skill from 1-500.
author support@zygorguides.com
completion skill,Engineering,500
condition suggested hasprof('Engineering',1,500)
#include profession_dual_start,prof1="Engineering",prof2="Mining"
step
label "route"
'Redirecting to Engineering 1-75 |next "eng_1-75" |only if skill("Engineering")<75
'Redirecting to Engineering 75-130|next "eng_75-130" |only if skill("Engineering")>=75 and skill("Engineering")<130
'Redirecting to Engineering 130-210 |next "eng_130-210" |only if skill("Engineering")>=130 and skill("Engineering")<210
'Redirecting to Engineering 210-280 |next "eng_210-280" |only if skill("Engineering")>=210 and skill("Engineering")<280
'Redirecting to Engineering 280-350 |next "eng_280-350" |only if skill("Engineering")>=280 and skill("Engineering")<350
'Redirecting to Engineering 350-425 |next "eng_350-425" |only if skill("Engineering")>=350 and skill("Engineering")<425
'Redirecting to Engineering 425-500 |next "eng_425-500" |only if skill("Engineering")>=425 and skill("Engineering")<500
'Redirecting to Engineering 500-600 |next "eng_500-600" |only if skill("Engineering")>=500 and skill("Engineering")<600
'Redirecting to Engineering finale |next "eng_600" |only if default
// ----------
// 1 - 75
// ----------
// TRAIN: Apprentice Engineering
step
title +Engineering 1-75
label "eng_1-75"
#include "trainer_Engineering"
.skillmax Engineering,75
step
#include "vendor_Engineering"
.buy 1 Blacksmith Hammer##5956 |tip Save the Blacksmith Hammer, you will need it to create items.
step
#include "home_ValleyofStrength"
step
#include "auctioneer"
.buy 40 Rough Stone##2835
.buy 105 Copper Bar##2840
#include go_farm,skill="Mining",req="1",goto="eng_1-75_farm"
next "eng_1-75_skill"
// GATHER: 38 Rough Stone, 142 Copper Bar
step
label "eng_1-75_farm"
map Durotar
path	38.9,16.0	37.5,21.1	35.9,34.4
path +	36.8,52.3	44.2,49.5	50.6,46.3
path +	50.7,63.3	54.9,67.0	56.2,49.8
path +	55.0,36.9	53.0,29.7	57.9,30.0
path +	54.8,19.0	50.0,17.2	44.2,23.6
#include "follow_path_mine"
.collect 40 Rough Stone##2835
.collect 105 Copper Ore##2770
.collect Tigerseye##818 |n |tip You will need these later.
step
#include "maincity_anvil"
.create Copper Bar##2657,Mining,105 total |tip Keep any extra Copper Bar you have for making items later.
// CREATE: 38 Rough Blasting Powder, 23 Handful of Copper Bolts, 25 Copper Tube
step
label  "eng_1-75_skill"
.create 40 Rough Blasting Powder##3918,Engineering,30
step
#include "trainer_Engineering"
.learn Handful of Copper Bolts##3922
step
#include "maincity_anvil"
.create 23 Handful of Copper Bolts##3922,Engineering,23 total |tip Save Handfuls of Copper Bolts to use later.
step
#include "trainer_Engineering"
.learn Rough Copper Bomb##3923
step
#include "maincity_anvil"
.create 20 Rough Copper Bomb##3923,Engineering,70
step
#include "trainer_Engineering"
.learn Arclight Spanner##7430
step
#include "maincity_anvil"
.create Arclight Spanner##7430,Engineering,75
// ----------
// 75 - 130
// ----------
// TRAIN: Journeyman Engineer
step
title +Engineering 75-130
label "eng_75-130"
#include "trainer_Engineering"
.skillmax Engineering,150 |tip You must be at least level 10.
step
#include "auctioneer"
.buy 40 Coarse Stone##2836
.buy 24 Linen Cloth##2589
.buy 103 Bronze Bar##2841
.buy 2 Tigerseye##818
#include go_farm,skill="Mining",req="50",goto="eng_75-130_farm"
next "eng_75-130_skill"
// GATHER: 35 Coarse Stone, 24 Linen Cloth, 36 Tin ore, 72 Bronze Bar, 5 Moss Agate
step
label "eng_75-130_farm"
#include "trainer_Mining"
.skillmax Mining,150
.learn Smelt Bronze##2659
.learn Smelt Tin##3304
'Your _Mining_ skill is too low to learn this; You can proceed with farming, but your skill gains will stop at 75. It's better to skill up first. |only if skill("Mining")<50 and skillmax("Herbalism")<150
step
label "farm"
'Skipping 1st part of farming |next "+farm2" |only if step:Find("+farming"):IsComplete()
'Proceeding to farm |next |only if default
step
label "farming"
goto Durotar,47.4,48.9 |n
.from Razormane Quilboar##3111+,Razormane Scout##3112+
.collect 24 Linen Cloth##2589
step
label "farm2"
'Skipping 2nd part of farming |next "+exit" |only if step:Find("+farming"):IsComplete()
'Proceeding to farm |next |only if default
step
label "farming"
map Ashenvale
path	82.0,50.2	78.8,44.9	67.1,45.8
path	61.9,42.6	59.5,37.5	54.5,37.1
path	53.5,48.2	49.5,54.7	45.5,47.5
path	41.8,40.3	40.1,32.4	38.2,30.3
path	34.6,33.3	33.6,28.5	33.0,22.5
path	25.4,19.3	21.0,19.1	16.6,15.7
path	14.1,13.1	17.0,23.7	17.3,28.2
path	16.5,36.6	19.5,45.7	18.8,55.4
path	23.4,50.2	25.4,54.2	25.7,60.4
path	29.9,58.1	31.8,64.7	33.1,70.3
path	38.8,62.7	42.0,64.2	55.6,68.4
path	62.7,64.6	67.0,69.1	75.6,69.2
path	82.4,71.8	86.5,79.1	90.1,76.6
#include "follow_path_mine"
.collect 40 Coarse Stone##2836
.collect 52 Tin Ore##2771
.skill Mining,100
#include "max_skill_warning",skill="Mining",goto="eng_75-130_farm"
step
#include "maincity_forge2"
.create Tin Bar##3304,Mining,52 total
step
#include "maincity_forge2"
.create Bronze Bar##2659,Mining,104 total
// CREATE: 35 Coarse Blasting Powder, 12 Copper Modulator, 5 Practice Lock, 8 Bronze Tube, 5 Standard Scope
step
label  "eng_75-130_skill"
#include "trainer_Engineering"
.learn Coarse Blasting Powder##3929
step
.create 40 Coarse Blasting Powder##3929,Engineering,95 |tip Keep at least 20 of these to craft a later item.
step
#include "trainer_Engineering"
.learn Coarse Dynamite##3931
step
#include "maincity_anvil"
.create Coarse Dynamite##3931,Engineering,100
step
#include "trainer_Engineering"
.learn Clockwork Box##8334
step
#include "maincity_anvil"
.create 15 Clockwork Box##8334,Engineering,115
step	
'Click on the Clockwork Boxes in your inventory. |use Clockwork Box##6712
.skill Engineering,125
step
#include "trainer_Engineering"
.learn Flying Tiger Goggles##3934
step
.create 1 Flying Tiger Goggles##3934,Engineering,130
]])
ZygorGuidesViewer:RegisterGuide("Zygor's Horde Profession Guides\\First Aid\\First Aid 1-525 Leveling Guide",[[
description This guide will walk you through leveling your First Aid skill from 1 - 525.
author support@zygorguides.com
completion skill,First Aid,525
condition suggested hasprof('First Aid',1,525)
#include profession_secondary_start,prof1="First Aid"
step
label "route"
'Redirecting to First Aid 1-75 |next "aid_1-75" |only if skill("First Aid")<75
'Redirecting to First Aid 75-150 |next "aid_75-150" |only if skill("First Aid")>=75 and skill("First Aid")<150
'Redirecting to First Aid 150-210 |next "aid_150-210" |only if skill("First Aid")>=150 and skill("First Aid")<210
'Redirecting to First Aid 210-300 |next "aid_210-300" |only if skill("First Aid")>=210 and skill("First Aid")<300
'Redirecting to First Aid 300-350 |next "aid_300-350" |only if skill("First Aid")>=300 and skill("First Aid")<350
'Redirecting to First Aid 350-450 |next "aid_350-450" |only if skill("First Aid")>=350 and skill("First Aid")<450
'Redirecting to First Aid 450-525 |next "aid_450-525" |only if skill("First Aid")>=450 and skill("First Aid")<525
'Redirecting to First Aid 525-600 |next "aid_525-600" |only if skill("First Aid")>=525 and skill("First Aid")<600
'Redirecting to First Aid finale |next "aid_600" |only if default
// ----------
// 1 - 75
// ----------
// TRAIN: Apprentice First Aid
step
title + First Aid 1-75
label "aid_1-75"
#include "trainer_FirstAid"
.skillmax First Aid,75 |tip You must be at least level 5.
step
#include "auctioneer"
.buy 170 Linen Cloth##2589
#include go_farm,skill="First Aid",req="1",goto="aid_1-75_farm"
|next "aid_1-75_skill"
// GATHER: 170 Linen Cloth
step
label "aid_1-75_farm"
goto Durotar,47.4,48.9 |n
.from Razormane Quilboar##3111+,Razormane Scout##3112+
.collect 170 Linen Cloth##2589
// CREATE: 50 Linen Bandage, 50 Heavy Linen Bandage
step
label "aid_1-75_skill"
.create Linen Bandage##3275,First Aid,40
step
#include "trainer_FirstAid"
.learn Heavy Linen Bandage##3276
step
.create Heavy Linen Bandage##3276+,First Aid,75
// ----------
// 75 - 150
// ----------
// TRAIN: Journeyman First Aid
step
title + First Aid 75-150
label "aid_75-150"
#include "trainer_FirstAid"
.skillmax First Aid,150 |tip You must be at least level 10.
step
.create Heavy Linen Bandage##3276+,First Aid,80
step
#include "trainer_FirstAid"
.learn Wool Bandage##3530
step
#include "auctioneer"
.buy 180 Wool Cloth##2592
#include go_farm,skill="First Aid",req="80",goto="aid_75-150_farm"
|next "aid_75-150_skill"
// GATHER: 180 Wool Cloth
step
label "aid_75-150_farm"
goto Ashenvale,34.0,39.8 |n
.from Thistlefur Shaman##3924+,Thistlefur Avenger##3925,Thistlefur Wise One##33389+,Thistlefur Warrior##33390+,Thistlefur Pathfinder##3926+
.collect 180 Wool Cloth##2592
// CREATE: 60 Wool Bandage, 60 Heavy Wool Bandage
step
label "aid_75-150_skill"
.create Wool Bandage##3277+,First Aid,115
step
#include "trainer_FirstAid"
.learn Heavy Wool Bandage##3531
step
.create Heavy Wool Bandage##3278+,First Aid,150
]])
ZygorGuidesViewer:RegisterGuide("Zygor's Horde Profession Guides\\Fishing\\Fishing 1-525 Leveling Guide",[[
description This guide will walk you through leveling your Fishing skill from 1-525.
author support@zygorguides.com
completion skill,Fishing,525
condition suggested hasprof('Fishing',1,525)
#include profession_secondary_start,prof1="Fishing"
step
label "route"
'Redirecting to Fishing 1-75 |next "fish_1-75" |only if skill("Fishing")<75
'Redirecting to Fishing 75-150 |next "fish_75-150" |only if skill("Fishing")>=75 and skill("Fishing")<150
'Redirecting to Fishing 150-225 |next "fish_150-225" |only if skill("Fishing")>=150 and skill("Fishing")<225
'Redirecting to Fishing 225-300 |next "fish_225-300" |only if skill("Fishing")>=225 and skill("Fishing")<300
'Redirecting to Fishing 300-375 |next "fish_300-375" |only if skill("Fishing")>=300 and skill("Fishing")<375
'Redirecting to Fishing 375-450 |next "fish_375-450" |only if skill("Fishing")>=375 and skill("Fishing")<450
'Redirecting to Fishing 450-525 |next "fish_450-525" |only if skill("Fishing")>=450 and skill("Fishing")<525
'Redirecting to Fishing finale |next "fish_525" |only if default
// ----------
// 1 - 75
// ----------
// TRAIN: Apprentice Fishing
step
title + Fishing 1-75
label "fish_1-75"
#include "trainer_Fishing"
.skillmax Fishing,75
step
#include "vendor_Fishing"
.buy 1 Fishing Pole##6256
.buy 1 Shiny Bauble##6529
step
 goto 66.5,41.5
.' Equip your Fishing Pole |use Fishing Pole##6256
.' Use the Shiny Bauble to temporarily increase your Fishing skill, to make it easier to catch fish |use Shiny Bauble##6529 |tip If your Shiny Bauble Fishing skill boost expires, you can buy more Shiny Baubles to help you fish.
.' Stand on the end of this wooden dock
.' Use your Fishing skill to fish in the water all around the wooden dock |cast Fishing##7620
.' Get your Fishing skill to level 75 |skill Fishing,75
// ----------
// 75 - 150
// ----------
// TRAIN: Journeyman Fishing
step
title + Fishing 75-150
label "fish_75-150"
#include "trainer_Fishing"
.skillmax Fishing,150
step
#include "vendor_Fishing"
.buy Shiny Bauble##6529
step
 goto 66.5,41.5
.' Equip your Fishing Pole, if it's not already equipped |use Fishing Pole##6256
.' Use the Shiny Bauble to temporarily increase your Fishing skill, to make it easier to catch fish |use Shiny Bauble##6529 |tip If your Shiny Bauble Fishing skill boost expires, you can buy more Baubles or Nightcrawlers to help you fish.
.' Stand on the end of this wooden dock
.' Use your Fishing skill to fish in the water all around the wooden dock |cast Fishing##7620
.' Get your Fishing skill to level 150 |skill Fishing,150
]])
ZygorGuidesViewer:RegisterGuide("Zygor's Horde Profession Guides\\Herbalism\\Herbalism 1-525 Leveling Guide",[[
description This guide will walk you through leveling your Herbalism skill from 1 - 525.
author support@zygorguides.com
completion skill,Herbalism,525
condition suggested hasprof('Herbalism',1,525)
#include profession_single_start,prof1="Herbalism"
step
label "route"
'Redirecting to Herbalism 1-70 |next "herb_1-70" |only if skill("Herbalism")<70
'Redirecting to Herbalism 70-150 |next "herb_70-150" |only if skill("Herbalism")>=70 and skill("Herbalism")<150
'Redirecting to Herbalism 150-200 |next "herb_150-200" |only if skill("Herbalism")>=150 and skill("Herbalism")<200
'Redirecting to Herbalism 200-285 |next "herb_200-285" |only if skill("Herbalism")>=200 and skill("Herbalism")<285
'Redirecting to Herbalism 285-375 |next "herb_285-375" |only if skill("Herbalism")>=285 and skill("Herbalism")<375
'Redirecting to Herbalism 375-425 |next "herb_375_425" |only if skill("Herbalism")>=375 and skill("Herbalism")<425
'Redirecting to Herbalism 425-525 |next "herb_425-525" |only if skill("Herbalism")>=425 and skill("Herbalism")<525
'Redirecting to Herbalism 525-545 |next "herb_525-545" |only if skill("Herbalism")>=525 and skill("Herbalism")<545
'Redirecting to Herbalism 545-590 |next "herb_545-590" |only if skill("Herbalism")>=545 and skill("Herbalism")<590
'Redirecting to Herbalism 590-600 |next "herb_590-600" |only if skill("Herbalism")>=590 and skill("Herbalism")<600
'Redirecting to Herbalism finale |next "herb_600" |only if default
// ----------
// 1 - 70
// ----------
// TRAIN: Apprentice Herbalism
step
title + Herbalism (1-70)
label	"herb_1-70"
#include "trainer_Herbalism"
.skillmax Herbalism,75
step
#include "home_UC"
// GATHER: (Herbalism 70)
step
map Tirisfal Glades
path follow loose;loop;ants straight 
path 56.6,49.0	49.4,49.5	47.6,42.4
path 50.2,32.2	44.4,32.9	42.9,51.0
path 43.1,53.8	44.3,59.8	55.7,55.5
.collect Peacebloom##2447 |n
.collect Silverleaf##765 |n
.collect Earthroot##2449 |n
#include "follow_path_herbs"
skill Herbalism,70
// ----------
// 70 - 150
// ----------
// TRAIN: Journeyman Herbalism
step
title + Herbalism (70-150)
label "herb_70-150"
#include trainer_HerbalismUC
.skillmax Herbalism,150
]])
ZygorGuidesViewer:RegisterGuide("Zygor's Horde Profession Guides\\Inscription\\Inscription 1-500 Leveling Guide",[[
description This guide will walk you through leveling your Inscription skill from 1-500.
author support@zygorguides.com
completion skill,Inscription,500
condition suggested hasprof('Inscription',1,500)
#include profession_dual_start,prof1="Inscription",prof2="Herbalism" 
// routing to the proper section.
step
label "route"
'Redirecting to Inscription 1-50 |next "ins_1-50" |only if skill("Inscription")<50
'Redirecting to Inscription 50-150 |next "ins_50-150" |only if skill("Inscription")>=50 and skill("Inscription")<150
'Redirecting to Inscription 150-200 |next "ins_150-200" |only if skill("Inscription")>=150 and skill("Inscription")<200
'Redirecting to Inscription 200-275 |next "ins_200-275" |only if skill("Inscription")>=200 and skill("Inscription")<275
'Redirecting to Inscription 275-350 |next "ins_275-350" |only if skill("Inscription")>=275 and skill("Inscription")<350
'Redirecting to Inscription 350-425 |next "ins_350-425" |only if skill("Inscription")>=350 and skill("Inscription")<425
'Redirecting to Inscription 425-500 |next "ins_425-500" |only if skill("Inscription")>=425 and skill("Inscription")<500
'Redirecting to Inscription 500-600 |next "ins_500-600" |only if skill("Inscription")>=500 and skill("Inscription")<600
'Redirecting to Inscription finale |next "ins_600" |only if default
// ----------
// 1 - 50
// ----------
// TRAIN: Apprentice Inscription
step
.'NOTE: When getting additional materials using this guide, do not sell them or throw them away. Most of them will be used in the guide at a later time.
step
title + Inscription 1-50
label "ins_1-50"
#include "trainer_Inscription"
.skillmax Inscription,75 |tip You must be at least level 5.
step
#include "vendor_Inscription"
.buy 1 Virtuoso Inking Set##39505
.buy 17 Light Parchment##39354
step
#include "home_ValleyofStrength"
step
#include "auctioneer"
.' You need about 160 herbs total
.buy Silverleaf##765 |n
.buy Peacebloom##2447 |n
.buy Earthroot##2449 |n
.buy Bloodthistle##22710 |n
.' Mill the 160 herbs you purchased, or gathered, into Alabaster Pigment |cast Milling##51005
.' You'll need about {_G.max(0 , (160-itemcount(765,2447,2449,22710)))} more herbs.
.buy 69 Alabaster Pigment##39151
#include go_farm,skill="Herbalism",req="1",goto="ins_1-50_farm"
|next "ins_1-50_skill"
// GATHER: 160 Alabaster Pigment
step
label "ins_1-50_farm"
map Durotar
path follow loose;loop;ants straight 
path 46.2,17.1		38.8,16.2		38.7,22.1
path 37.9,30.4		48.5,32.8		51.4,36.5
path 51.7,52.0		53.6,62.4		55.6,69.7
path 60.9,69.1		60.7,58.0		57.6,46.9
path 55.0,32.4		57.8,26.1		53.4,12.5
#include "follow_path_herbs"
.' You need about 160 herbs total
.collect Silverleaf##765 |n
.collect Peacebloom##2447 |n
.collect Earthroot##2449 |n
.' You'll need about {_G.max(0 , (160-itemcount(765,2447,2449,22710)))} more herbs.
.' Mill the 160 herbs you gathered into Alabaster Pigment
.collect 69 Alabaster Pigment##39151
#include "max_skill_warning",skill="Herbalism",goto="ins_1-50_farm"
// CREATE: 17 Ivory Ink, 17 Scroll of Intellect, 26 Moonglow Ink
step
label "ins_1-50_skill"
.create 17 Ivory Ink##52738,Inscription,18 |tip Save 17 of these for later use.
step
.create 17 Scroll of Intellect##48114,Inscription,35
step
#include "trainer_Inscription"
.learn Moonglow Ink##52843
step
.create 26 Moonglow Ink##52843,Inscription,50
// ----------
// 50 - 150
// ----------
// TRAIN: Journeyman Inscription
step
title + Inscription 50-150
label "ins_50-150"
#include "trainer_Inscription"
.skillmax Inscription,150 |tip You must be at least level 10.
.learn Enchanting Vellum##52739
step
#include "vendor_Inscription"
.buy 59 Light Parchment##39354
step
#include "auctioneer"
.' You need about 85 Dusky giving herbs total
.buy Briarthorn##2450 |n
.buy Bruiseweed##2453 |n
.buy Mageroyal##785 |n
.buy Stranglekelp##3820 |n
.buy Swiftthistle##2452 |n
.' You'll need about {_G.max(0 , (85-itemcount(2450,2453,785,3820,2452)))} more herbs.
.' Mill the 85 Dusky-giving herbs you purchased into Dusky Pigment. |cast Milling##51005
.buy 42 Dusky Pigment##39334
#include go_farm,skill="Herbalism",req="1",goto="ins_50-150_farm_pt1"
|next "ins_50-150_skill_pt1"
// GATHER: 42 Dusky Pigment
step
label "ins_50-150_farm_pt1"
#include "trainer_Herbalism"
.skillmax Herbalism,150
step
map Hillsbrad Foothills
path 31.8,62.6		33.9,54.0		29.7,44.1
path 35.5,37.8		34.5,28.2		39.5,21.0		
path 44.2,8.3		51.3,14.0		57.5,20.9	
path 56.1,34.3		49.9,46.2		41.2,46.6
path 40.1,55.0		41.3,67.4		31.8,71.9
#include "follow_path_herbs"
.' You need about 85 Dusky giving herbs total
.collect Mageroyal##785 |n
.collect Bruiseweed##2453 |n
.collect Briarthorn##2450 |n
.' You'll need about {_G.max(0 , (85-itemcount(2450,2453,785,3820,2452)))} more herbs.
.' Mill the 85 herbs you gathered into Dusky Pigment
.collect 42 Dusky Pigment##39334
#include "max_skill_warning",skill="Herbalism",goto="ins_50-150_farm_pt1"
// CREATE: 25 Enchanting Vellum, 1 Minor Inscription Research, 21 Midnight Ink, 7 Discovered Glyph
step
label "ins_50-150_skill_pt1"
.create 25 Enchanting Vellum##52739,Inscription,75
step
#include "trainer_Inscription"
.learn Minor Inscription Research##61288
step
.create Minor Inscription Research##61288,Inscription,76
step
#include "trainer_Inscription"
.learn Midnight Ink##39774
step
.create 21 Midnight Ink##53462,Inscription,21 total
skill Inscription,80
step
#include "trainer_Inscription"
.learn Glyph of Decoy##57114
step
.create 4 Glyph of Decoy##57114,Inscription,92
step
#include "trainer_Inscription"
.learn Glyph of Holy Wrath##57027
step
.create 3 Glyph of Holy Wrath##57027,Inscription,101
step
#include "trainer_Inscription"
.learn Lions Ink##57704
step
#include "vendor_Inscription"
.buy 13 Common Parchment##39354
step
#include "auctioneer"
.' You need about 220 Golden giving herbs total
.buy Grave Moss##3369 |n
.buy Kingsblood##3356 |n
.buy Liferoot##3357 |n
.buy Wild Steelbloom##3355 |n
.' You'll need about {_G.max(0 , (220-itemcount(3369,3356,3357,3355)))} more herbs.
.' Mill the 220 Golden-giving herbs into Golden Pigment and Burnt Pigment |cast Milling##51005
.buy 80 Golden Pigment##39338
.buy 20 Burnt Pigment##43104
#include go_farm,skill="Herbalism",req="105",goto="ins_50-150_farm_pt2"
|next "ins_50-150_skill_pt2"
// GATHER: 80 Golden Pigment
step
label "ins_50-150_farm_pt2"
map Northern Stranglethorn
path 64.2,25.4		63.9,39.4		56.2,43.2	
path 42.5,43.9		35.9,32.9		31.5,37.2	
path 23.1,32.3		17.4,24.1
#include "follow_path_herbs"
.' You need about 220 Golden giving herbs total
.collect Grave Moss##3369 |n
.collect Kingsblood##3356 |n
.collect Liferoot##3357 |n
.collect Wild Steelbloom##3355 |n
.' You'll need about {_G.max(0 , (220-itemcount(3369,3356,3357,3355)))} more herbs.
.' Mill the 220 herbs you gathered into Golden Pigment |cast Milling##51005
.collect 80 Golden Pigment##39338
.collect 20 Burnt Pigment##43104
#include "max_skill_warning",skill="Herbalism",goto="ins_50-150_farm_pt1"
// CREATE: 66 Lions Ink, 7 Discovered Glyphs, 18 Dawnstar Ink, 4 Discovered Glyphs, 1 Strange Tarot
step
label "ins_50-150_skill_pt2"
.create 36 Lions Ink##57704,Inscription,36 total
skill Inscription,105
step
#include "vendor_Inscription"
.buy 20 Light Parchment##39354
step
#include "trainer_Inscription"
.learn Glyph of Illumination##57029
step
.create 2 Glyph of Illumination##57029,Inscription,111
step
#include "trainer_Inscription"
.learn Glyph of Fire Nova##57238
step
.create 2 Glyph of Fire Nova##57238,Inscription,117
step
#include "trainer_Inscription"
.learn Glyph of Mending##56997
step
.create 1 Glyph of Mending##56997,Inscription,120
step
#include "trainer_Inscription"
.learn Glyph of Expose Armor##57121
step
.create 2 Glyph of Expose Armor##57121,Inscription,126
step
#include "trainer_Inscription"
.learn Dawnstar Ink##57706
step
.create 18 Dawnstar Ink##57706,Inscription,18 total
skill Inscription,135
step
#include "trainer_Inscription"
.learn Glyph of Divinity##57031
step
.create 2 Glyph of Divinity##57031,Inscription,141
step
#include "trainer_Inscription"
.learn Glyph of Imp Swarm##57269
step
.create 2 Glyph of Imp Swarm##57269,Inscription,147
step
#include "trainer_Inscription"
.learn Strange Tarot##59480
step
.create 3 Strange Tarot##59480,Inscription,150 |tip This will give you three skill-up points.
]])
ZygorGuidesViewer:RegisterGuide("Zygor's Horde Profession Guides\\Jewelcrafting\\Jewelcrafting 1-525 Leveling Guide",[[
description This guide will walk you through leveling your Jewelcrafting skill from 1-525.
author support@zygorguides.com
completion skill,Jewelcrafting,525
condition suggested hasprof('Jewelcrafting',1,525)
#include profession_dual_start,prof1="Jewelcrafting",prof2="Mining"
step
label "route"
'Redirecting to Jewelcrafting 1-50 |next "jc_1-50" |only if skill("Jewelcrafting")<50
'Redirecting to Jewelcrafting 50-150 |next "jc_50-150" |only if skill("Jewelcrafting")>=50 and skill("Jewelcrafting")<150
'Redirecting to Jewelcrafting 150-200 |next "jc_150-225" |only if skill("Jewelcrafting")>=150 and skill("Jewelcrafting")<225
'Redirecting to Jewelcrafting 200-275 |next "jc_225-300" |only if skill("Jewelcrafting")>=200 and skill("Jewelcrafting")<300
'Redirecting to Jewelcrafting 275-350 |next "jc_300-350" |only if skill("Jewelcrafting")>=275 and skill("Jewelcrafting")<350
'Redirecting to Jewelcrafting 350-425 |next "jc_350-425" |only if skill("Jewelcrafting")>=350 and skill("Jewelcrafting")<425
'Redirecting to Jewelcrafting 425-525 |next "jc_425-525" |only if skill("Jewelcrafting")>=425 and skill("Jewelcrafting")<525
'Redirecting to Jewelcrafting 425-525 |next "jc_525-600" |only if skill("Jewelcrafting")>=525 and skill("Jewelcrafting")<600
'Redirecting to Jewelcrafting finale |next "jc_600" |only if default
// ----------
// 1 - 50
// ----------
// TRAIN: Apprentice Jewelcrafting
step
title + Jewelcrafting 1-50
label "jc_1-50"
#include "trainer_Jewelcrafting"
.skillmax Jewelcrafting,75
step
#include "vendor_Jewelcrafting"
.buy Jeweler's Kit##20815
step
#include "home_ValleyofStrength"
step
#include "auctioneer"
.buy 170 Copper Bar##2840
.buy Tigerseye##818 |n
.buy Malachite##774 |n
.' You'll need about {_G.max(0 , (20-itemcount(818,774))*1)} more of the gems above. |condition itemcount(818,774)>=20 
#include go_farm,skill="Mining",req="1",goto="jc_1-50_farm"
next "jc_1-50_skill"
// GATHER: 270 Copper Ore, 10 Tigerseye, 10 Malachite
step
label "jc_1-50_farm"
#include vendor_Mining
.buy 1 Mining Pick##2901
step
map Durotar
path follow loose;loop
path	38.9,16.0	37.5,21.1	35.9,34.4
path	36.8,52.3	44.2,49.5	50.6,46.3
path	50.7,63.3	54.9,67.0	56.2,49.8
path	55.0,36.9	53.0,29.7	57.9,30.0
path	54.8,19.0	50.0,17.2	44.2,23.6
#include "follow_path_mine"
.collect Tigerseye##818 |tip You can use the prospect ability on the Copper Ore in your bags to get this item. |cast Prospecting##31252 |n 
.collect Malachite##774 |tip You can use the prospect ability on the Copper Ore in your bags to get this item. |cast Prospecting##31252 |n
.' You'll need about {_G.max(0 , (20-itemcount(818,774))*1)} more of the gems above. |condition itemcount(818,774)>=20 
.collect 290 Copper Ore##2770 
.collect Shadowgem##1210 |n |tip Save these for later use.
step
#include "maincity_anvil"
.create Copper Bar##2657,Mining,170 total
.collect 170 Copper Bar##2840
// CREATE: 60 Delicate Copper Wire, 20 Tigerseye Band
step
label "jc_1-50_skill"
.create 60 Delicate Copper Wire##25255,Jewelcrafting,60 total |tip Save all Delicate Copper Wires, you will need them later.
.collect 60 Delicate Copper Wire##20816
step
#include "trainer_Jewelcrafting"
'Learn Prospecting |condition _G.IsSpellKnown(31252)
step
'Prospect the remaining Copper Ore to collect Tigerseyes and Malachite |cast Prospecting##31252
.collect Tigerseyes##818 |n
.collect Malachite##774 |n
.' You'll need about {_G.max(0 , (20-itemcount(818,774))*1)} more of the gems above. |condition itemcount(818,774)>=20 
step
#include "trainer_Jewelcrafting"
.learn Malachite Pendant##32178
.learn Tigerseye Band##32179 
step
.create Malachite Pendant##32178,Jewelcrafting,50 
|tip If you didn't get enough Malachite but more Tigerseyes from Prospecting, make Tigerseye Band instead.
.create Tigerseye Band##32179,Jewelcrafting,50
// ----------
// 50 - 150
// ----------
// TRAIN: Journeyman Jewelcrafting
step
title + Jewelcrafting 50-150
label "jc_50-150" 
#include "trainer_Jewelcrafting"
.skillmax Jewelcrafting,150 
.learn Bronze Setting##25278
step
#include "auctioneer"
.buy 140 Bronze Bar##2841
.buy 40 Silver Bar##2842
.buy 20 Shadowgem##1210
.buy 80 Heavy Stone##2838
.buy 30 Moss Agate##1206
#include go_farm,skill="Mining",req="65",goto="jc_50-150_farm"
|next "jc_50-150_skill"
// GATHER: 70 Shadowgem, 30 Moss Agate, 70 Tin Ore, 80 Heavy Stones
step
label "jc_50-150_farm"
#include "trainer_Mining"
.skillmax Mining,150
.learn Smelt Bronze##2659
.learn Smelt Tin##3304
'Your _Mining_ skill is too low to learn this; You can proceed with farming, but your skill gains will stop at 75. It's better to skill up first. |only if skill("Mining")<50 and skillmax("Mining")<150
step
'Skipping 1st part of farming |next "+exit" |only if step:Find("+farming"):IsComplete()
'Proceeding to farm |next |only if default
step
label "farming"
map Ashenvale
path	82.0,50.2	78.8,44.9	67.1,45.8
path	61.9,42.6	59.5,37.5	54.5,37.1
path	53.5,48.2	49.5,54.7	45.5,47.5
path	41.8,40.3	40.1,32.4	38.2,30.3
path	34.6,33.3	33.6,28.5	33.0,22.5
path	25.4,19.3	21.0,19.1	16.6,15.7
path	14.1,13.1	17.0,23.7	17.3,28.2
path	16.5,36.6	19.5,45.7	18.8,55.4
path	23.4,50.2	25.4,54.2	25.7,60.4
path	29.9,58.1	31.8,64.7	33.1,70.3
path	38.8,62.7	42.0,64.2	55.6,68.4
path	62.7,64.6	67.0,69.1	75.6,69.2
path	82.4,71.8	86.5,79.1	90.1,76.6
#include "follow_path_mine"
.collect 20 Shadowgem##1210 |tip You can use the prospect ability on the Tin Ore in your bags to get this item. |cast Prospecting##31252
.collect 30 Moss Agate##1206 |tip You can use the prospect ability on the Tin Ore in your bags to get this item. |cast Prospecting##31252
.collect 40 Silver Ore##2775
.collect 70 Tin Ore##2771 |tip After you've collected all the gems, collect the ore you need.
.collect Citrine##3864 |n |tip These will be used later.
.collect Aquamarine##7909 |n |tip These will be used later.
#include "max_skill_warning",skill="Mining",goto="jc_50-150_farm"
step
'Skipping 2nd part of farming |next "+exit" |only if step:Find("+farming"):IsComplete()
'Proceeding to farm |next |only if default
step
label "farming"
map Feralas
path	74.9,48.6	84.0,45.6
path	84.9,39.9	71.5,34.7
path	54.3,50.1	48.6,44.0	49.7,34.9
path	51.6,33.8	50.9,26.2	51.3,19.0
path	54.9,8.1	49.4,4.0	40.0,7.7
path	37.1,12.1	38.1,17.6	37.0,25.6
path	45.1,26.2	46.3,38.6	50.3,52.7
path	47.9,55.4	46.9,64.1	54.8,53.9
path	55.2,62.6	52.9,66.2	53.6,73.7
path	60.8,75.8	62.0,55.0	63.7,61.0
path	66.4,51.3	68.2,51.3
path	68.1,61.5	71.6,65.1	77.2,62.1
#include "follow_path_mine"
.collect 80 Heavy Stone##2838 |tip Keep the Iron Ore you get for prospecting later.
.collect Citrine##3864 |n |tip These will be used later.
.collect Aquamarine##7909 |n |tip These will be used later. 
.collect Star Ruby##7910 |n |tip These will be used later.
#include "max_skill_warning",skill="Mining",goto="jc_50-150_farm"
step
label "exit"
#include "trainer_Mining"
.learn Smelt Silver##2658
step
#include "maincity_anvil"
.create Silver Bar##2658,Mining,40 total
step
#include "maincity_anvil" 
.create Tin Bar##3304,Mining,70 total
step
#include "maincity_anvil"
.create Bronze Bar##2659,Mining,70 total
.collect 140 Bronze Bar##2841
// CREATE: 50 Bronze Setting, 20 Gloom Band, 10 Ring of Twilight Shadows, 10 Heavy Stone Statue, 30 Pendant of the Agate Shield
step
label "jc_50-150_skill"
.create 50 Bronze Setting##25278,Jewelcrafting,50 total |tip Save these, you will need them later
step
#include "trainer_Jewelcrafting"
.learn Ring of Silver Might##25317
step
.create Ring of Silver Might##25317,Jewelcrafting,100
step
#include "trainer_Jewelcrafting"
.learn Ring of Twilight Shadows##25318
step
.create 10 Ring of Twilight Shadows##25318,Jewelcrafting,110
step
#include "trainer_Jewelcrafting"
.learn Heavy Stone Statue##32807
step
.create 10 Heavy Stone Statue##32807,Jewelcrafting,120
step
#include "trainer_Jewelcrafting"
.learn Pendant of the Agate Shield##25610
step
.create Pendant of the Agate Shield##25610,Jewelcrafting,150
]])
ZygorGuidesViewer:RegisterGuide("Zygor's Horde Profession Guides\\Tailoring\\Tailoring 1-500 Leveling Guide",[[
description This guide will walk you through leveling your Tailoring skill from 1-525.
author support@zygorguides.com
completion skill,Tailoring,500
condition suggested hasprof('Tailoring',1,500)
#include "profession_single_start",prof1="Tailoring"
step
'Redirecting to Tailoring 1-75 |next "tl_1-75" |only if skill("Tailoring")<75
'Redirecting to Tailoring 75-130 |next "tl_75-125" |only if skill("Tailoring")>=75 and skill("Tailoring")<125
'Redirecting to Tailoring 130-225 |next "tl_125-200" |only if skill("Tailoring")>=125 and skill("Tailoring")<200
'Redirecting to Tailoring 200-250 |next "tl_200-250" |only if skill("Tailoring")>=200 and skill("Tailoring")<250
'Redirecting to Tailoring 250-300 |next "tl_250-300" |only if skill("Tailoring")>=250 and skill("Tailoring")<300
'Redirecting to Tailoring 300-350 |next "tl_300-350" |only if skill("Tailoring")>=300 and skill("Tailoring")<350
'Redirecting to Tailoring 350-425 |next "tl_350-425" |only if skill("Tailoring")>=350 and skill("Tailoring")<425
'Redirecting to Tailoring 425-500 |next "tl_425-500" |only if skill("Tailoring")>=425 and skill("Tailoring")<500
'Redirecting to Tailoring 500-600 |next "next_guide" |only if skill("Tailoring")>=500 and skill("Tailoring")<600
'Redirecting to Tailoring finale |next "tl_600" |only if default
step
title + Tailoring 1-75
label	"tl_1-75"
#include "home_ValleyofStrength"
step
#include "trainer_Tailoring"
.skillmax Tailoring,75 |tip You must be at least level 5. 
step
#include "auctioneer"
.buy 276 Linen Cloth##2589
#include go_farm_level,level="8",goto="tl_1-75_farm"
|next "tl_1-75_skill"
// ----------
// 1 - 75
// ----------
// Westfall: 276 Linen Cloth
step
label	"tl_1-75_farm"
goto Mulgore,60.6,47.7
.from Venture Co. Supervisor##2979+, Enforcer Emilgund##5787+, Supervisor Fizsprocket##3051+, Venture Co. Worker##2978+
.collect 240 Linen Cloth##2589
// CREATE:  138 Bolt of Linen Cloth, 5 Reinforced Linen Cape
step
label	"tl_1-75_skill"
.create 120 Bolt of Linen Cloth##2963,Tailoring,120 total
.skill Tailoring,50
step
#include "trainer_Tailoring"
.learn Heavy Linen Gloves##3840
step
#include "vendor_Tailoring"
.buy 40 Coarse Thread##2320
step
.create 20 Heavy Linen Gloves##3840,Tailoring,70
step
#include "trainer_Tailoring"
.learn Reinforced Linen Cape##2397
step
.create 5 Reinforced Linen Cape##2397,Tailoring,75
// ----------
// 75 - 125
// ----------
// TRAIN: Journeyman Tailoring
step
title + Tailoring 75-125
label	"tl_75-125"
#include "trainer_Tailoring"
.skillmax Tailoring,150 |tip You must be level 10
.learn Bolt of Woolen Cloth##2964
step
#include "auctioneer"
.buy 165 Wool Cloth##2592
.' or
#include go_farm_level,level="20",goto="tl_75-125_farm"
|next "tl_75-125_skill"
// GATHER: 165 Wool Cloth
step
label	"tl_75-125_farm"
goto Hillsbrad Foothills 40.4,47.9
.from Stormpike Engineer##49116+
..collect 165 Wool Cloth##2592
// CREATE:  45 Bolt of Woolen Cloth, 15 Simple Kilts, 15 Double-stitched Woolen Shoulders
step
label	"tl_75-125_skill"
.create 45 Bolt of Woolen Cloth##2964,Tailoring,45 total
.skill Tailoring,100
step
#include "trainer_Tailoring"
.learn Simple Kilt##12046
step
#include "vendor_Tailoring"
.buy 45 Fine Thread##2321
step
.create 40 Simple Kilt##12046,Tailoring,110
step
#include "trainer_Tailoring"
.learn Double-stitched Woolen Shoulders##3848
step
.create 15 Double-stitched Woolen Shoulders##3848,Tailoring,125
// ----------
// 125 - 200
// ----------
// TRAIN: Expert Tailoring
step
title + Tailoring 125-200
label	"tl_125-200"
#include "trainer_Tailoring"
.skillmax Tailoring,225 |tip You must be at least level 20.
.learn Bolt of Silk Cloth##3839
step
#include "auctioneer"
.buy 760 Silk Cloth##4306
.buy 480 Mageweave Cloth##4338
.' or
#include go_farm_level,level="30",goto="tl_125-200_farm"
|next "tl_125-200_skill"
// GATHER: 808 Silk Cloth, 400 Mageweave Cloth
step
label	"tl_125-200_farm"
'Skipping next part of farming |next "+farm2" |only if step:Find("+farming"):IsComplete()
'Proceeding to farm |next |only if default
step
label	"farming"
goto Dustwallow Marsh,41.9,12.4 
.from Grimtotem Breaker##23592+, Grimtotem Spirit-Shifter##23593+, Grimtotem Elder##23714+ 
.collect 780 Silk Cloth##4306 |tip You can also farm these by killing humanoid mobs in the Scarlet Monastery instance.
step
'Skipping next part of farming |next "exit" |only if step:Find("+farming"):IsComplete()
'Proceeding to farm |next |only if default
step
label	"farming"
goto Felwood,63.4,20.7
.from Irontree Chopper##48452+
.collect 480 Mageweave Cloth##4338
// CREATE: 202 Bolts of Silk Cloth, 15 Azure Silk Hood, 10 Silk Headband, 10 Formal White Shirt
step
label	"tl_125-200_skill"
.create 195 Bolt of Silk Cloth##3839,Tailoring,202 total
.skill Tailoring,145
]])
ZygorGuidesViewer:RegisterGuide("Zygor's Horde Profession Guides\\Leatherworking\\Leatherworking 1-500 Leveling Guide",[[
description This guide will walk you through leveling your Leatherworking skill from 1-500.
author support@zygorguides.com
completion skill,Leatherworking,500
condition suggested hasprof('Leatherworking',1,500)
#include profession_dual_start,prof1="Leatherworking",prof2="Skinning"
step
label "route"
'Redirecting to Leatherworking 1-55 |next "lw_1-55" |only if skill("Leatherworking")<55
'Redirecting to Leatherworking 55-155 |next "lw_55-155" |only if skill("Leatherworking")>=55 and skill("Leatherworking")<155
'Redirecting to Leatherworking 155-200 |next "lw_155-200" |only if skill("Leatherworking")>=155 and skill("Leatherworking")<200
'Redirecting to Leatherworking 200-225 |next "lw_200-225" |only if skill("Leatherworking")>=200 and skill("Leatherworking")<225
'Redirecting to Leatherworking 225-300 |next "lw_225-300" |only if skill("Leatherworking")>=225 and skill("Leatherworking")<300
'Redirecting to Leatherworking 300-350 |next "lw_300-350" |only if skill("Leatherworking")>=300 and skill("Leatherworking")<350
'Redirecting to Leatherworking 350-425 |next "lw_350-425" |only if skill("Leatherworking")>=350 and skill("Leatherworking")<425
'Redirecting to Leatherworking 425-500 |next "lw_425-500" |only if skill("Leatherworking")>=425 and skill("Leatherworking")<500
'Redirecting to Leatherworking 500-600 |next "lw_500-600" |only if skill("Leatherworking")>=500 and skill("Leatherworking")<600
'Redirecting to Leatherworking finale |next "lw_600" |only if default
// ----------
// 1 - 50
// ----------
// TRAIN:	Apprentice Leatherworking
step
label "lw_1-55"
title + Leatherworking 1-55
#include "trainer_Leatherworking"
.skillmax Leatherworking,75 |tip You must be at least level 5.
step
#include "vendor_Skinning"
.buy 1 Skinning Knife##7005
step
#include "auctioneer"
.buy 57 Ruined Leather Scraps##2934
.buy 260 Light Leather##2318
#include go_farm,skill="Skinning",req="1",goto="lw_1-55_farm"
|next "lw_1-55_skill"
// GATHER:	130 Coarse Thread, 57 Ruined Leather Scraps, 260 Light Leather
step
label	"lw_1-55_farm"
'Skipping next part of farming |next "farm2" |only if step:Find("+farming"):IsComplete()
'Proceeding to farm |next |only if default
step
label	"farming"
map Durotar
path	44.1,20.6	45.7,23.8	45.1,31.2 
path	45.5,37.6	45.0,44.4	41.1,46.6
path	36.9,45.2	36.0,34.8	38.0,25.2
path	41.9,19.4
.' Kill any beasts you see and skin them.
.collect 57 Ruined Leather Scraps##2934 |n
.collect 260 Light Leather##2318 |n
skill Skinning,75
step
label	"farm2"
#include "trainer_Skinning" 
.skillmax Skinning,150
step
'Skipping next part of farming |next "exit" |only if step:Find("+farming"):IsComplete()
'Proceeding to farm |next |only if default
step
label	"farming"
map Northern Barrens
path 62.4,70.7	67.1,63.9	64.3,55.5
path 62.3,58.9	61.8,67.2
.' Kill any beasts you see and skin them.
.collect 57 Ruined Leather Scraps##2934
.collect 260 Light Leather##2318
.' If you have an excess amount of Ruined Leather Scraps, you can use them to create Light Leather |cast Leatherworking##3811
// CREATE:	19 Light Leather, 10 Light Armor Kit, 20 Handstitched Leather Cloak, 5 Handstitched Leahter Belt
step
label	"lw_1-55_skill"
#include vendor_Leatherworking
.buy 43 Coarse Thread##2320
step
.create 20 Light Leather##2881,Leatherworking,20
step
.create 13 Light Armor Kits##2152,Leatherworking,30
step
.create 23 Handstitched Leather Cloak##9058,Leatherworking,50
step
#include trainer_Leatherworking
.learn Handstitched Leather Belt##3753
step
.create 5 Handstitched Leather Belts##3753,Leatherworking,55
// ----------
// 55 - 155
// ----------
// TRAIN:	Journeyman Leatherworking
step
title + Leatherworking 55-155
label	"lw_55-155"
#include trainer_Leatherworking
.skillmax Leatherworking,150 |tip You must be at least level 10. 
.learn Embossed Leather Gloves##3756
// GATHER:	75 Salt, 30 Gray Dye, 190 Fine Thread, 15 Medium Hide, 155 Medium Leather
step
#include "auctioneer"
.buy 15 Medium Hide##4232
.buy 155 Medium Leather##2319
#include go_farm,skill="Skinning",req="125",goto="lw_55-155_farm"
|next "lw_55-155_skill"	
step
label	"lw_55-155_farm"
title + Leatherworking 55-155 (farming)
#include "trainer_Skinning" 
.skillmax Skinning,225 |only if skill("Skinning")>=125
'Your _Skinning_ skill is too low to learn the _Expert_ skill. You can proceed with farming, but your skill gains will stop at 150. It's better to skill up first. |only if skill("Skinning")<125
.' Click here to continue |confirm |only if skill("Skinning")<125
step
map Northern Stranglethorn
path	41.1,45.2	37.1,38.6	37.4,31.9
path	36.5,30.9	35.7,25.8	35.8,19.7
path	40.5,20.6	45.8,25.4	48.3,30.0
path	48.2,35.5	42.9,47.4
.' Kill any beasts you see and skin them.
.collect 15 Medium Hide##4232 |tip You can also buy these off the auction house since they are rare.
.collect 155 Medium Leather##2319
// CREATE:	30 Embossed Leather Gloves, 15 Fine Leather Belts, 15 Cured Medium Hide, 15 Dark Leather Boots
step
label	"lw_55-155_skill"
#include "vendor_Leatherworking"
.buy 75 Salt##4289
.buy 30 Gray Dye##4340
.buy 190 Fine Thread##2321
step
.create Embossed Leather Gloves##3756,Leatherworking,85
        step
#include "trainer_Leatherworking"
.learn Fine Leather Belt##3763
step
.create Fine Leather Belt##3763,Leatherworking,100 
.' Hold on to these for later use
step
#include "trainer_Leatherworking"
.learn Cured Medium Hide##3817
step
.create Cured Medium Hide##3817,Leatherworking,115 
step
#include "trainer_Leatherworking"
.learn Dark Leather Boots##2167
step
.create Dark Leather Boots##2167,Leatherworking,130 
step
#include "trainer_Leatherworking"
.learn Dark Leather Belt##3766	
step
#include "trainer_Leatherworking"
.create Dark Leather Belt##3766,Leatherworking,145 
step
#include "trainer_Leatherworking"
.learn Hillman's Leather Gloves##3764
step
.create Hillman's Leather Gloves##3764,Leatherworking,150
step
.create Heavy Leather##20649,Leatherworking,155 
]])
ZygorGuidesViewer:RegisterGuide("Zygor's Horde Profession Guides\\Skinning\\Skinning 1-525 Leveling Guide",[[
description This guide will walk you through leveling your Skinning skill from 1-525.
author support@zygorguides.com
completion skill,Skinning,525
condition suggested hasprof('Skinning',1,525)
#include "profession_single_start",prof1="Skinning"
step
'Redirecting to Skinning 1-60 |next "skn_1-60" |only if skill("Skinning")<60
'Redirecting to Skinning 60-150 |next "skn_60-150" |only if skill("Skinning")>=60 and skill("Skinning")<150
'Redirecting to Skinning 150-205 |next "skn_150-205" |only if skill("Skinning")>=150 and skill("Skinning")<205
'Redirecting to Skinning 205-300 |next "skn_205-300" |only if skill("Skinning")>=205 and skill("Skinning")<300
'Redirecting to Skinning 300-350 |next "skn_300-350" |only if skill("Skinning")>=300 and skill("Skinning")<350
'Redirecting to Skinning 350-450 |next "skn_350-450" |only if skill("Skinning")>=350 and skill("Skinning")<450
'Redirecting to Skinning 450-525 |next "skn_450-525" |only if skill("Skinning")>=450 and skill("Skinning")<525
'Redirecting to Skinning 525-600 |next "skn_525-600" |only if skill("Skinning")>=525 and skill("Skinning")<600
'Redirecting to Skinning finale |next "skn_600" |only if default
next 100
step
Title + Skinning 1-60
label	"skn_1-60"
#include "trainer_Skinning"
.skillmax Skinning,75
step
#include "vendor_Leatherworking"
.buy 1 Skinning Knife##7005
step
#include "home_ValleyofHonor"
step
'Follow the path in the following steps until your Skinning skill is level 60.
.' Kill any beasts you see and skin them.
|confirm
step
map Durotar
path follow loose;loop 
path	56.2,31.4	58.1,23.9	56.3,15.5
path	52.8,10.7	51.3,14.0	48.9,16.0
path	49.7,17.9		53.8,18.6
.' Kill any beasts you see and skin them.
skill Skinning,60
step
label	"skn_60-150"
#include trainer_Skinning
.skillmax Skinning,150

step
'Skipping next part of farming |next "+farm1" |only if step:Find("+farming"):IsComplete()
'Proceeding to farm |next |only if default
step
'Follow the path in the following steps until your Skinning skill is level 120.
.' Kill any beasts you see and skin them.
|confirm
step
label	"farming"
map Northern Barrens
path	65.2,57.4	67.8,63.9	63.9,67.0
path	61.1,71.2	62.3,77.1	58.9,75.7
path	55.7,71.1	57.9,65.2	62.2,63.1
path	64.0,58.1
.' Kill any beasts you see and skin them.
skill Skinning,120
step
label	"farm1"
map Ashenvale
path	69.1,69.8	69.3,66.4	67.8,62.1
path	64.8,64.0	63.2,68.2	66.1,70.6
.' Kill any beasts you see and skin them.
skill Skinning,150
]])
ZygorGuidesViewer:RegisterGuide("Zygor's Horde Profession Guides\\Mining\\Mining 1-525 Leveling Guide",[[
description This guide will walk you through leveling your Mining skill from 1 - 525.
author support@zygorguides.com
completion skill,Mining,525
condition suggested hasprof('Mining',1,525)
#include "profession_single_start",prof1="Mining"
step
'Redirecting to Mining 1-75 |next "m_1-65" |only if skill("Mining")<65
'Redirecting to Mining 65-155 |next "m_65-125" |only if skill("Mining")>=65 and skill("Mining")<125
'Redirecting to Mining 125-200 |next "m_125-200" |only if skill("Mining")>=125 and skill("Mining")<200
'Redirecting to Mining 200-275 |next "m_200-275" |only if skill("Mining")>=200 and skill("Mining")<275
'Redirecting to Mining 275-350 |next "m_275-350" |only if skill("Mining")>=275 and skill("Mining")<350
'Redirecting to Mining 350-425 |next "m_350-425" |only if skill("Mining")>=350 and skill("Mining")<425
'Redirecting to Mining 425-525 |next "m_425-525" |only if skill("Mining")>=425 and skill("Mining")<525
'Redirecting to Mining 525-600 |next "m_525-600" |only if skill("Mining")>=525 and skill("Mining")<600
//...
'Redirecting to Mining finale |next "m_600" |only if default
step
#include "home_ValleyofStrength"
step
title + Mining (1-65)
label	"m_1-65"
#include trainer_Mining
.skillmax Mining,75 |tip You must be at least level 5.
step
#include "vendor_Mining"
.buy 1 Mining Pick##2901
step
'Skipping next part of guide |next "m_1-65_skill" |only if step:Find("+farming"):IsComplete()
'Proceeding to skill up |next |only if default
step
label	"farming"
map Durotar
path follow loose;loop 
path 55.1,10.2	53.8,18.5	56.3,24.6
path 52.7,29.3	50.7,31.8	48.6,33.8
path 46.6,30.0	50.9,15.5	52.4,13.9
#include follow_path_mine
skill Mining,35
step
label	"m_1-65_skill"
#include maincity_anvil
.create Copper Bar##2657,Mining,50 |tip Keep all of the Copper Bars for Smelting later.
step
title + Mining (65-125)
label	"m_65-125"
#include trainer_Mining
.skillmax Mining,150
.learn Smelt Bronze##2659
.learn Smelt Tin##3304
step
'Skipping next part of guide |next "m_125-275" |only if step:Find("+farming"):IsComplete()
'Proceeding to skill up |next |only if default
step
label	"farming"
map Northern Stranglethorn
path 40.4,45.0	36.3,44.1	34.0,38.8
path 31.1,34.1	27.0,31.8	21.4,25.2
path 21.8,18.7	26.6,21.9	31.1,22.4
path 34.6,20.9	33.8,17.2	38.5,17.9
path 46.3,19.1	52.5,20.5	58.6,16.8
path 63.5,17.5	63.2,22.1	60.3,24.3
path 57.2,28.2	60.8,34.6	66.1,40.9
path 62.9,47.1	56.2,50.4	48.0,55.2
path 44.3,55.5	48.7,47.2	47.7,39.2
path 50.2,28.6	44.6,28.2	42.9,34.7
path 41.4,41.2
#include "follow_path_mine"
skill Mining,125
step
title + Mining (125-200)
label	"m_125-200"
#include trainer_Mining
.skillmax Mining,225
.learn Smelt Iron##3307
step
'Skipping next part of guide |next "+farm" |only if step:Find("+farming"):IsComplete()
'Proceeding to skill up |next |only if default
step
label	"farming"
map Western Plaguelands
path 42.6,80.9	39.3,79.9	36.1,77.2
path 33.2,72.6	30.2,69.6	29.3,64.5
path 33.5,63.9	32.5,59.9	31.2,55.5
path 37.1,54.4	38.7,51.6	43.8,49.7
path 48.0,47.8	45.0,41.3	45.0,36.1
path 44.2,31.6	49.9,28.9	54.3,26.4
path 54.8,33.7	51.6,40.2	50.2,45.8
path 54.7,48.9	60.0,52.2	66.3,43.9
path 68.8,45.9	67.4,52.5	65.6,59.7
path 61.4,62.0	63.3,64.8	72.4,59.7
path 80.7,77.4	73.0,83.5	64.4,84.0
path 58.0,82.1	53.1,74.7
#include "follow_path_mine"
skill Mining,150
]])