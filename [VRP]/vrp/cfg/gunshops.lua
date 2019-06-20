
local cfg = {}
-- list of weapons for sale
-- for the native name, see https://wiki.fivem.net/wiki/Weapons (not all of them will work, look at client/player_state.lua for the real weapon list)
-- create groups like for the garage config
-- [native_weapon_name] = {display_name,body_price,ammo_price,description}
-- ammo_price can be < 1, total price will be rounded

-- _config: blipid, blipcolor, permissions (optional, only users with the permission will have access to the shop)

cfg.gunshop_types = {
  ["BlackDevils"] = {
    _config = {blipid=110,blipcolor=1},
	["WEAPON_KNIFE"] = {"Kniv",10000,0,""},
	["WEAPON_BAT"] = {"Baseballbat",5000,0,""},
	["WEAPON_CROWBAR"] = {"Brækjern",1000,0,""},
	["WEAPON_MICROSMG"] = {"Mini Uzi",150000,0,""},
	["WEAPON_SNIPERRIFLE"] = {"Sniper",650000,0,""},
	["WEAPON_MACHINEPISTOL"] = {"TEC-9",250000,0,""},
	["WEAPON_WRENCH"] = {"Svensknøgle",5000,0,""},
	["WEAPON_SWITCHBLADE"] = {"Foldekniv",5000,0,""},
	["WEAPON_BATTLEAXE"] = {"Kamp-Økse",8000,0,""},
	["WEAPON_GOLFCLUB"] = {"Golfkølle",5000,0,""},
	["WEAPON_HAMMER"] = {"Hammer",6000,0,""}
  },
  ["Våbenshop"] = {
    _config = {blipid=110,blipcolor=1},
	["WEAPON_FLASHLIGHT"] = {"Lommelygte",5000,0,""},
	["WEAPON_KNIFE"] = {"Kniv",20000,0,""},
	["WEAPON_BAT"] = {"Baseballbat",25000,0,""},
	["WEAPON_CROWBAR"] = {"Brækjern",20000,0,""},
	["WEAPON_WRENCH"] = {"Svensknøgle",20000,0,""},
	["WEAPON_SWITCHBLADE"] = {"Foldekniv",20000,0,""},
	["WEAPON_BATTLEAXE"] = {"Kamp-Økse",20000,0,""},
	["WEAPON_GOLFCLUB"] = {"Golfkølle",20000,0,""},
	["WEAPON_HAMMER"] = {"Hammer",20000,0,""}
 }
}
-- list of gunshops positions

cfg.gunshops = {
 {"BlackDevils", 986.91467285156,-92.525054931641,74.845611572266},
 {"Våbenshop", 252.696, -48.2487, 69.941},
 {"Våbenshop", 844.299, -1033.26, 28.1949},
 {"Våbenshop", -331.624, 6082.46, 31.4548},
 {"Våbenshop", -664.147, -935.119, 21.8292},
 {"Våbenshop", -1320.983, -389.260, 36.483},
 {"Våbenshop", -1119.48803710938,2697.08666992188,18.5541591644287},
 {"Våbenshop", 2569.62, 294.453, 108.735},
 {"Våbenshop", -3172.60375976563,1085.74816894531,20.8387603759766},
 {"Våbenshop", 21.70, -1107.41, 29.79},
 {"Våbenshop", 810.15, -2156.88, 29.61}
}

return cfg