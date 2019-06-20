
local cfg = {}

-- PCs positions
cfg.pcs = {
  {1853.21,3689.51,34.2671},
  {441.00912475586,-978.44665527344,30.689594268799},
  {-449.14297485352,6012.7451171875,31.71639251709},
  {459.73251342773,-989.140625,24.914873123169}
}

-- vehicle tracking configuration
cfg.trackveh = {
  min_time = 300, -- min time in seconds
  max_time = 600, -- max time in seconds
  service = "police",  -- service to alert when the tracking is successful
  "fbi",
  "sheriff",
  "trafficguard"
}

-- wanted display
cfg.wanted = {
  blipid = 458,
  blipcolor = 38,
  service = "police",
  "fbi",
  "sheriff",
  "trafficguard"
}

-- illegal items (seize)
cfg.seizable_items = {
  "dirty_money",
  "cocaine",
  "lsd",
  "acid",
  "cocaineplant",
  "weed",
  "hash",
  "wbody|WEAPON_PISTOL",
  "wammo|WEAPON_PISTOL",
  "wbody|WEAPON_KNIFE",
  "wbody|WEAPON_GOLFCLUB",
  "wbody|WEAPON_BAT",
  "wbody|WEAPON_CROWBAR",
  "wbody|WEAPON_PISTOL",
  "wammo|WEAPON_PISTOL",
  "wbody|WEAPON_FLASHLIGHT",
  "wbody|WEAPON_SWITCHBLADE",
  "wbody|WEAPON_KNUCKLE",
  "wbody|WEAPON_WRENCH",
  "wbody|WEAPON_HAMMER",
  "wbody|WEAPON_PISTOL50",
  "wammo|WEAPON_PISTOL50",
  "wbody|WEAPON_ASSAULTRIFLE",
  "wammo|WEAPON_ASSAULTRIFLE",
  "wbody|WEAPON_HEAVYSNIPER",
  "wammo|WEAPON_HEAVYSNIPER",
  "wbody|WEAPON_STUNGUN",
  "wbody|WEAPON_COMBATPISTOL",
  "wbody|WEAPON_COMBATPDW",
  "wbody|WEAPON_CARBINERIFLE_MK2",
  "wammo|WEAPON_CARBINERIFLE_MK2",
  "wbody|WEAPON_HEAVYSNIPER_MK2",
  "wammo|WEAPON_HEAVYSNIPER_MK2",
  "WEAPON_BATTLEAXE",
  "WEAPON_BALL",
  "WEAPON_GOLFCLUB"
}

-- jails {x,y,z,radius}
cfg.jails = {
  -- {459.485870361328,-1001.61560058594,24.914867401123,2.1},
  -- {459.305603027344,-997.873718261719,24.914867401123,2.1},
  -- {459.999938964844,-994.331298828125,24.9148578643799,1.6}
  {1690.7608642578,2594.93359375,45.564849853516,155}
}

-- fines
-- map of name -> money
cfg.fines = {
  ["Forstyrrelse af embedsmand i funktion."] = 3000,
  ["Hasarderet kørsel"] = 5000,
  ["Manglende kørekort under kørsel"] = 1000,
  ["Hærværk"] = 5000,
  ["Besiddelse af våben uden tilladelse"] = 20000,
  ["Voldelig optræden/slagsmål."] = 1500,
  ["Gadeuorden"] = 1000
}

return cfg
