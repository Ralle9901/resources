
local cfg = {}

-- define market types like garages and weapons
-- _config: blipid, blipcolor, permissions (optional, only users with the permission will have access to the market)

cfg.market_types = {
  ["Butik"] = {
    _config = {blipid=52, blipcolor=2},

    -- list itemid => price
    -- Drinks
    ["milk"] = 2,
    ["beer"] = 30,
    ["beer2"] = 25,
    ["water"] = 2,
    ["coffee"] = 4,
    ["tea"] = 4,
    ["icetea"] = 8,
    ["orangejuice"] = 8,
    ["gocagola"] = 12,
    ["redgull"] = 12,
    ["lemonlimonad"] = 14,
    ["vodka"] = 30,

    --Food
    ["bread"] = 2,
    ["donut"] = 2,
    ["tacos"] = 8,
    ["sandwich"] = 20,
    ["kebab"] = 20,
    ["pdonut"] = 65,

	--Værktøjssæt
    ["repairkit"] = 50
  },
  ["Apotek"] = {
    _config = {blipid=51, blipcolor=2},
    ["pills"] = 50,
  },
  ["Hjertestarter"] = {
    _config = {blipid=489, blipcolor=1},
    ["medkit"] = 100
  },
  ["Sodavandsmaskine"] = {
    _config = {blipid=403, blipcolor=1},
    ["cola"] = 5,
    ["danskvand"] = 5,
    ["fantaexotic"] = 5,
    ["faxekondi"] = 5,
    ["fanta"] = 5
  },
   ["Telefonsælger"] = {
    _config = {blipid=459, blipcolor=13},
    ["Aphone"] = 3750,
  }, 
  ["Ambulanceredder"] = {
    _config = {blipid=51, blipcolor=68, permissions={"emergency.market"}},
    ["medkit"] = 0,
    ["pills"] = 0
  },
  ["Drugdealer"] = {
    _config = {blipid=473, blipcolor=4, permissions={"drugseller.market"}},
    ["weed"] = 500,
    ["cocaine"] = 1500,
  },
  ["Værktøj"] = {
    _config = {blipid=402, blipcolor=47, permissions={"repair.market"}},
    ["repairkit"] = 1000
  },
  ["Samlekort"] = { -- need vRP-TCG extension
    _config = {blipid=408, blipcolor=2},
    ["tcgbooster|0|5"] = 10,
    ["tcgbooster|1|5"] = 100,
    ["tcgbooster|2|5"] = 1000,
    ["tcgbooster|3|5"] = 10000,
    ["tcgbooster|4|5"] = 100000
   }
}

-- list of markets {type,x,y,z}

cfg.markets = {
  {"Butik",128.1410369873, -1286.1120605469, 29.281036376953},
  {"Butik",-47.522762298584,-1756.85717773438,29.4210109710693},
  {"Butik",25.7454013824463,-1345.26232910156,29.4970207214355}, 
  {"Butik",1135.57678222656,-981.78125,46.4157981872559}, 
  {"Butik",1163.53820800781,-323.541320800781,69.2050552368164}, 
  {"Butik",374.190032958984,327.506713867188,103.566368103027}, 
  {"Butik",2555.35766601563,382.16845703125,108.622947692871}, 
  {"Butik",2676.76733398438,3281.57788085938,55.2411231994629}, 
  {"Butik",1960.50793457031,3741.84008789063,32.3437385559082},
  {"Butik",1393.23828125,3605.171875,34.9809303283691}, 
  {"Butik",1166.18151855469,2709.35327148438,38.15771484375}, 
  {"Butik",547.987609863281,2669.7568359375,42.1565132141113}, 
  {"Butik",1698.30737304688,4924.37939453125,42.0636749267578}, 
  {"Butik",1729.54443359375,6415.76513671875,35.0372200012207}, 
  {"Butik",-3243.9013671875,1001.40405273438,12.8307056427002}, 
  {"Butik",-2967.8818359375,390.78662109375,15.0433149337769}, 
  {"Butik",-3041.17456054688,585.166198730469,7.90893363952637}, 
  {"Butik",-1820.55725097656,792.770568847656,138.113250732422}, 
  {"Butik",-1486.76574707031,-379.553985595703,40.163387298584}, 
  {"Butik",-1223.18127441406,-907.385681152344,12.3263463973999}, 
  {"Butik",-707.408996582031,-913.681701660156,19.2155857086182},
  {"Hjertestarter",441.73611450195,-995.640625,30.689584732056,240.4167175293}, -- Politi station 
  {"Sodavandsmaskine",436.55880737305,-986.34790039063,30.689603805542}, -- Politi station
  {"Apotek",260.04547119141,-1358.8044433594,24.537805557251},
  {"Apotek",244.23141479492,-46.524185180664,74.98713684082},
  {"Ambulanceredder",251.20562744141,-1347.0609130859,24.537809371948},
  {"Telefonsælger",350.53601074219,173.2590637207,103.09698486328}, 
  {"Værktøj",-1161.2064208984,-1689.7965087891,4.4493675231934},
  {"Værktøj",472.35717773438,-1311.1623535156,29.217060089111}
}

return cfg
