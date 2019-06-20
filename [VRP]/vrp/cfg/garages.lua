
local cfg = {}
-- define garage types with their associated vehicles
-- (vehicle list: https://wiki.fivem.net/wiki/Vehicles)

-- each garage type is an associated list of veh_name/veh_definition 
-- they need a _config property to define the blip and the vehicle type for the garage (each vtype allow one vehicle to be spawned at a time, the default vtype is "default")
-- this is used to let the player spawn a boat AND a car at the same time for example, and only despawn it in the correct garage
-- _config: vtype, blipid, blipcolor, permissions (optional, only users with the permission will have access to the shop)

cfg.rent_factor = 0.1 -- 10% of the original price if a rent
cfg.sell_factor = 0.75 -- sell for 75% of the original price

cfg.garage_types = {
  --[[["Forhandler"]  = {
    _config = {vtype="car",blipid=50,blipcolor=4},
    ["blista"] = {"Blista", 15000, ""},
    ["brioso"] = {"Brioso R/A", 155000, ""},
    ["dilettante"] = {"Dilettante", 25000, ""},
    ["issi2"] = {"Issi", 18000, ""},
    ["panto"] = {"Panto", 85000, ""},
    ["prairie"] = {"Prairie", 30000, ""},
    ["rhapsody"] = {"Rhapsody", 120000, ""},
    ["cogcabrio"] = {"Cognoscenti Cabrio",180000, ""},
    ["exemplar"] = {"Exemplar", 200000, ""},
    ["F620"] = {"F620", 80000, ""},
    ["felon"] = {"Felon", 90000, ""},
    ["felon2"] = {"Felon GT", 95000, ""},
    ["jackal"] = {"Jackal", 60000, ""},
    ["oracle"] = {"Oracle", 80000, ""},
    ["oracle2"] = {"Oracle XS",82000, ""},
    ["sentinel"] = {"sentinel", 90000, ""},
    ["sentinel2"] = {"Sentinel XS", 60000, ""},
    ["windsor"] = {"Windsor",800000, ""},
    ["windsor2"] = {"Windsor Drop",850000, ""},
    ["zion"] = {"Zion", 60000, ""},
    ["zion2"] = {"Zion Cabrio", 65000, ""},
    ["ninef"] = {"9F",120000, ""},
    ["ninef2"] = {"9F Cabrio",130000, ""},
    ["alpha"] = {"Alpha",150000, ""},
    ["banshee"] = {"Banshee",105000, ""},
    ["bestiagts"] = {"Bestia GTS",610000, ""},
    ["blista"] = {"Blista Compact",42000, ""},
    ["buffalo"] = {"Buffalo",35000, ""},
    ["buffalo2"] = {"Buffalo S",96000, ""},
    ["carbonizzare"] = {"Carbonizzare",195000, ""},
    ["comet2"] = {"Comet",100000, ""},
    ["coquette"] = {"Coquette",138000, ""},
    ["tampa2"] = {"Drift Tampa",995000, ""},
    ["feltzer2"] = {"Feltzer",130000, ""},
    ["furoregt"] = {"Furore GT",448000, ""},
    ["fusilade"] = {"Fusilade",36000, ""},
    ["jester"] = {"Jester",240000, ""},
    ["jester2"] = {"Jester (Racecar)",350000, ""},
    ["kuruma"] = {"Kuruma",95000, ""},
    ["lynx"] = {"Lynx",1735000, ""},
    ["massacro"] = {"Massacro",275000, ""},
    ["massacro2"] = {"Massacro (Racecar)",385000, ""},
    ["omnis"] = {"Omnis",701000, ""},
    ["penumbra"] = {"Penumbra",24000, ""},
    ["rapidgt"] = {"Rapid GT",140000, ""},
    ["rapidgt2"] = {"Rapid GT Convertible",150000, ""},
    ["schafter3"] = {"Schafter V12",140000, ""},
    ["sultan"] = {"Sultan",12000, ""},
    ["surano"] = {"Surano",110000, ""},
    ["tropos"] = {"Tropos",816000, ""},
    ["verlierer2"] = {"Verkierer",695000,""},
    ["casco"] = {"Casco",680000, ""},
    ["coquette2"] = {"Coquette Classic",665000, ""},
    ["jb700"] = {"JB 700",350000, ""},
    ["pigalle"] = {"Pigalle",400000, ""},
    ["stinger"] = {"Stinger",850000, ""},
    ["stingergt"] = {"Stinger GT",875000, ""},
    ["feltzer3"] = {"Stirling",975000, ""},
    ["ztype"] = {"Z-Type",950000,""},
    ["adder"] = {"Adder",1000000, ""},
    ["banshee2"] = {"Banshee 900R",565000, ""},
    ["bullet"] = {"Bullet",155000, ""},
    ["cheetah"] = {"Cheetah",650000, ""},
    ["entityxf"] = {"Entity XF",795000, ""},
    ["sheava"] = {"ETR1",199500, ""},
    ["fmj"] = {"FMJ",1750000, ""},
    ["infernus"] = {"Infernus",440000, ""},
    ["osiris"] = {"Osiris",1950000, ""},
    ["le7b"] = {"RE-7B",5075000, ""},
    ["reaper"] = {"Reaper",1595000, ""},
    ["sultanrs"] = {"Sultan RS",795000, ""},
    ["t20"] = {"T20",2200000, ""},
    ["turismor"] = {"Turismo R",500000, ""},
    ["tyrus"] = {"Tyrus",2550000, ""},
    ["vacca"] = {"Vacca",240000, ""},
    ["voltic"] = {"Voltic",150000, ""},
    ["prototipo"] = {"X80 Proto",2700000, ""},
    ["zentorno"] = {"Zentorno",725000, ""},
    ["blade"] = {"Blade",160000, ""},
    ["buccaneer"] = {"Buccaneer",29000, ""},
    ["Chino"] = {"Chino",225000, ""},
    ["coquette3"] = {"Coquette BlackFin",695000, ""},
    ["dominator"] = {"Dominator",35000, ""},
    ["dukes"] = {"Dukes",62000, ""},
    ["gauntlet"] = {"Gauntlet",32000, ""},
    ["hotknife"] = {"Hotknife",90000, ""},
    ["faction"] = {"Faction",36000, ""},
    ["nightshade"] = {"Nightshade",585000, ""},
    ["picador"] = {"Picador",9000, ""},
    ["sabregt"] = {"Sabre Turbo",15000, ""},
    ["tampa"] = {"Tampa",375000, ""},
    ["virgo"] = {"Virgo",195000, ""},
    ["vigero"] = {"Vigero",21000, ""},
    ["bifta"] = {"Bifta",75000, ""},
    ["blazer"] = {"Blazer",8000, ""},
    ["brawler"] = {"Brawler",715000, ""},
    ["dubsta3"] = {"Bubsta 6x6",249000, ""},
    ["dune"] = {"Dune Buggy",20000, ""},
    ["rebel2"] = {"Rebel",22000, ""},
    ["sandking"] = {"Sandking",38000, ""},
    ["monster"] = {"The Liberator",550000, ""},
    ["trophytruck"] = {"The Liberator",550000, ""},
    ["baller"] = {"Baller",90000, ""},
    ["cavalcade"] = {"Cavalcade",60000, ""},
    ["granger"] = {"Grabger",35000, ""},
    ["huntley"] = {"Huntley",195000, ""},
    ["landstalker"] = {"Landstalker",58000, ""},
    ["radi"] = {"Radius",32000, ""},
    ["rocoto"] = {"Rocoto",85000, ""},
    ["seminole"] = {"Seminole",30000, ""},
    ["xls"] = {"XLS",253000, ""},
    ["bison"] = {"Bison",30000, ""},
    ["bobcatxl"] = {"Bobcat XL",23000, ""},
    ["gburrito"] = {"Gang Burrito",65000, ""},
    ["journey"] = {"Journey",15000, ""},
    ["minivan"] = {"Minivan",30000, ""},
    ["paradise"] = {"Paradise",25000, ""},
    ["rumpo"] = {"Rumpo",13000, ""},
    ["surfer"] = {"Surfer",11000, ""},
    ["youga"] = {"Youga",16000, ""},
    ["asea"] = {"Asea",1000000, ""},
    ["asterope"] = {"Asterope",1000000, ""},
    ["cognoscenti"] = {"Cognoscenti",1000000, ""},
    ["cognoscenti2"] = {"Cognoscenti(Armored)",1000000, ""},
    ["cognoscenti3"] = {"Cognoscenti 55",1000000, ""},
    ["zentorno"] = {"Cognoscenti 55(Armored)",1500000, ""},
    ["fugitive"] = {"Fugitive",24000, ""},
    ["glendale"] = {"Glendale",200000, ""},
    ["ingot"] = {"Ingot",9000, ""},
    ["intruder"] = {"Intruder",16000, ""},
    ["premier"] = {"Premier",10000, ""},
    ["primo"] = {"Primo",9000, ""},
    ["primo2"] = {"Primo Custom",9500, ""},
    ["regina"] = {"Regina",8000, ""},
    ["schafter2"] = {"Schafter",65000, ""},
    ["stanier"] = {"Stanier",10000, ""},
    ["stratum"] = {"Stratum",10000, ""},
    ["stretch"] = {"Stretch",30000, ""},
    ["superd"] = {"Super Diamond",250000, ""},
    ["surge"] = {"Surge",38000, ""},
    ["tailgater"] = {"Tailgater",55000, ""},
    ["warrener"] = {"Warrener",120000, ""},
    ["washington"] = {"Washington",15000, ""}
  }, --]]
  ["Politi"] = {
    _config = {vtype="police",blipid=56,blipcolor=49,permissions={"police.vehicle"}},
	["sheriff2"] = {"Politi 1",0, ""},
	["sheriff"] = {"Politi 2",0, ""},
	["fbi2"] = {"Politi 3",0, ""},
  },

  ["Ambulanceredder"] = {
    _config = {vtype="emergency",blipid=50,blipcolor=3,permissions={"emergency.vehicle"}},
    ["ambulance"] = {"Ambulance",0, ""},
  },

  ["Taxa"] = {
    _config = {vtype="taxi",blipid=50,blipcolor=81,permissions={"taxi.vehicle"}},
    ["taxi"] = {"Taxa",0, ""}
  },
  ["Udbringer"] = {
    _config = {vtype="delivery",blipid=226,blipcolor=31,permissions={"delivery.vehicle"}},
    ["faggio2"] = {"Scooter",0, ""}
  },
  ["Mekaniker"] = {
    _config = {vtype="repair",blipid=50,blipcolor=31,permissions={"repair.vehicle"}},
    ["towtruck"] = {"Falck - Lift",0, ""},
    ["flatbed"] = {"Falck - ladvogn",0, ""}
  },
  ["Pengetransport"] = {
    _config = {vtype="bankdriver",blipid=67,blipcolor=4,permissions={"bankdriver.vehicle"}},
    ["stockade"] = {"Pengetransport",0, ""}
  },
  ["Fisker"] = {
    _config = {vtype="boat",blipid=371,blipcolor=3,permissions={"fisher.vehicle"}},
    ["suntrap"] = {"Fiskerbåd",0, ""}
  },
  ["Busgarage"] = {
    _config = {vtype="bus",blipid=369,blipcolor=3,permissions={"bus.vehicle"}},
    ["bus"] = {"Bybus",0, ""},
    ["coach"] = {"LINJE 888",0, ""}
  },
  ["Event"] = {
    _config = {vtype="event",blipid=379,blipcolor=26},
    ["sanchez"] = {"Sanchez (Event)",0, ""},
    ["polmav"] = {"Helikopter (Event)",0, ""}
  },
  ["Politihelikopter"] = {
    _config = {vtype="event",blipid=43,blipcolor=26,permissions={"police.vehicle"}},
    ["polmav"] = {"Politihelikopter",0, ""}
  },
  ["Minelastbil"] = {
    _config = {vtype="mining",blipid=477,blipcolor=4,permissions={"mining.vehicle"}},
    ["rubble"] = {"Minelastbil 160KG",0, ""}
  },
  ["Lægehelikopter"] = {
    _config  = {vtype="event",blipid=379,blipcolor=26,permissions={"emergency.vehicle"}},
    ["ambumav"] = {"Lægehelikopter",0, ""}
  },  
  
}

-- {garage_type,x,y,z}
cfg.garages = {
  -- {"Forhandler",112.275, 6619.83, 31.8154},
  -- {"Motorcykler",-46.56327,-1097.382,25.99875},
  {"Politi",449.92391967773,-1011.7383422852,28.496351242065,180.24673461914},	-- jobs garage
  {"Politi",434.05184936523,-1012.8768920898,28.724056243896,185.20317077637},	-- jobs garage
  {"Politi",-474.33676147461,6025.6879882813,31.340551376343},	-- jobs garage
  {"Politi",378.612274169922,-1629.18676757813,28.5226573944092},  -- jobs garage
  {"Politi",1843.4580078125,3667.0170898438,33.716926574707},  -- jobs garage
  {"Politihelikopter",449.43023681641,-981.28009033203,43.691646575928},  -- jobs garage
  {"Politihelikopter",-474.74252319336,5989.5048828125,31.336685180664},  -- jobs garage
  {"Lægehelikopter",313.36541748047,-1465.0029296875,46.5094871521}, -- jobs garage
  {"Minelastbil", 2681.5654296875,2802.8540039063,39.764659881592}, -- jobs garage
  {"Ambulanceredder",1157.1373291016,-1607.4422607422,34.692581176758}, -- jobs garage
  {"Ambulanceredder",334.0920715332,-1477.2772216797,29.629636764526,319.01611328125}, -- jobs garage
  {"Taxa",916.49957275391,-163.49717712402,74.697868347168}, -- jobs garage
  {"Udbringer",968.80639648438,-1019.6612548828,40.853908538818},   -- jobs garage
  {"Mekaniker",401.42602539063,-1631.7053222656,29.291942596436},   -- jobs garage
  {"Mekaniker",-1138.3192138672,-1680.2406005859,4.4169330596924},
  {"Pengetransport",222.68756103516,222.95631408691,105.41331481934},   -- jobs garage
  -- {"Busgarage",466.30679321289,-586.87829589844,28.499719619751,183.63677978516},   -- jobs garage
  {"Fisker",521.76110839844,-2872.54296875,-0.017442777752876},   -- jobs garage
  -- {"Event",1019.8416748047,2518.5834960938,45.349987030029},   -- events garage
  --{"planes",1640, 3236, 40.4},
  --{"planes",2123, 4805, 41.19},
  --{"planes",-1348, -2230, 13.9},
  --{"helicopters",1750, 3260, 41.37},
  --{"helicopters",-1233, -2269, 13.9},
  {"helicopters",-140.03265380859,-592.51574707031,211.77513122559,282.9873046875},
  --{"boats",-849.5, -1368.64, 1.6},
  --{"boats",1538, 3902, 30.35}
}

return cfg
