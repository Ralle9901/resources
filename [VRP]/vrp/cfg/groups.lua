
local cfg = {}

-- define each group with a set of permissions
-- _config property:
--- gtype (optional): used to have only one group with the same gtype per player (example: a job gtype to only have one job)
--- onspawn (optional): function(player) (called when the player spawn with the group)
--- onjoin (optional): function(player) (called when the player join the group)
--- onleave (optional): function(player) (called when the player leave the group)
--- (you have direct access to vRP and vRPclient, the tunnel to client, in the config callbacks)

cfg.groups = {
 
  ["Ejer"] = {
    _config = {
		onspawn = function(player)
		vRPclient.notify(player,{"Du er Ejer."})
		end
	},
    "player.group.add",
	"chatrules.owner",
    "player.group.remove",
	"admin.tickets",
    "admin.announce",
    "player.list",
	"betjent.market",
    "player.kick",
    "player.noclip",
    "player.display_custom",
    "player.tptome",
    "player.tpto",
    "player.tptowaypoint",
    "player.spawnvehicle",
    "player.deletevehicle",
	"player.tptowaypoint",
	"player.revival",
	"police.menu",
    "police.handcuff",
    "police.drag",
	"police.easy_jail",
	"emergency.revive",
 	"emergency.market",
	"car.fix"
  },
  ["Ledelsen"] = {
   _config = {
		onspawn = function(player)
		vRPclient.notify(player,{"Du er Ledelsen."})
		end
   },
	"player.group.add",
	"chatrules.owner",
    "player.group.remove",
	"player.revival",
	"admin.tickets",
	"betjent.market",
    "admin.announce",
    "player.list",
    "player.kick",
    "player.noclip",
    "player.display_custom",
    "player.tptome",
    "player.tpto",
    "player.tptowaypoint",
	"player.spawnvehicle",
    "player.deletevehicle",
	"player.tptowaypoint",
	"emergency.revive",
 	"emergency.market",
	"car.fix"
  },
  ["Admin"] = {
   _config = {
		onspawn = function(player) 
		vRPclient.notify(player,{"Du er Admin."})
		end
   },
    "admin.tickets",
    "admin.announce",
	"chatrules.moderator",
    "player.list",
    "player.kick",
    "player.noclip",
    "player.tpto",
    "player.tptome",
	"betjent.market",
    "player.tptowaypoint",
    "player.deletevehicle",
	"player.revival",
	"emergency.revive",
	"police.menu",
    "police.handcuff",
    "police.drag",
	"police.easy_jail",
 	"emergency.market"
  },
  ["emschief"] = {
   _config = {
		onspawn = function(player) 
		vRPclient.notify(player,{"Du er Lægechef."})
		end
	},
    "player.group.add",
    "player.group.remove"
  },
  ["mechchief"] = {
   _config = {
		onspawn = function(player)
		vRPclient.notify(player,{"Du er Mekanikerchef."})
		end
	},
    "player.group.add",
    "player.group.remove"
  },
  ["policechief"] = {
   _config = {
		onspawn = function(player) 
		vRPclient.notify(player,{"Du er Politichef."})
		end
   },
    "player.group.add",
    "player.group.remove"
  },
  ["god"] = {
    "admin.god" -- reset survivals/health periodically
  },
  -- the group user is auto added to all logged players
  ["user"] = {
    "player.phone",
	"chatcmd.twitter",
    "player.calladmin",
	"player.coords",
    "police.askid",
    "police.store_weapons",
    "police.seizable",	-- can be seized
	"user.paycheck",
	"user.firstaid",
	"money.launder"
  },
  ["Mafia"] = {
    _config = {
		onspawn = function(player)
		vRPclient.notify(player,{"Du er Mafia."})
		end
	 },
	"mafia.pc"
	},
  ["police"] = {
    _config = {
		onspawn = function(player)
		vRPclient.notify(player,{"Du er whitelisted til Politi."}) 
		end
	},
	"cop.whitelisted"
  },
  ["ems"] = {
    _config = {
		onspawn = function(player) 
		vRPclient.notify(player,{"Du er whitelisted til Ambulanceredder."}) 
		end
	},
	"ems.whitelisted"
  },
  ["mech"] = {
    _config = {
		onspawn = function(player)
		vRPclient.notify(player,{"Du er whitelisted til Mekaniker."})
		end
	},
    "mechanic.whitelisted"
  },
  ["lawyer"] = {
    _config = {
		onspawn = function(player) 
		vRPclient.notify(player,{"Du er whitelisted til Advokat."})
		end
	},
	"lawyer.whitelisted"
  },
  ["Politi"] = {
    _config = { 
      gtype = "job",
      onjoin = function(player)
	    vRPclient.setCop(player,{true})
	    vRPclient.notify(player,{"Du er nu Politi."})
		vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 250},  WEAPON_COMBATPISTOL = {ammo = 250}}})
	 end,
      onspawn = function(player)
	    vRPclient.setCop(player,{true})
		vRPclient.notify(player,{"Du er nu Politi."})
		vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_SMOKEGRENADE = {ammo = 25}}})
	  end,
      onleave = function(player)
	    vRPclient.setCop(player,{false})
		vRPclient.stopMission(player)
		vRPclient.removeWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 0}, WEAPON_STUNGUN = {ammo = 0}, WEAPON_COMBATPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 0}, WEAPON_CARBINERIFLE = {ammo = 0}, WEAPON_SMOKEGRENADE = {ammo = 0}}})
	  end
    },
	"police.menu",
	"police.carsearch",
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
	"robbery.police",
	"betjent.market",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.license",
    -- "police.jail",
	"police.easy_jail",
    "police.fine",
    "police.announce",
    "cop.whitelisted",
    "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.weapons",
	"police.paycheck",
	"police.drag",
	"police.bodyarmor",
	"police.robbery",
	"police.robbery1",
    "emergency.revive",
	"emergency.market",
	"police.menu_interaction"
  },
  ["Ambulanceredder"] = {
   _config = { 
      gtype = "job",
      onjoin = function(player)
	    vRPclient.setCop(player,{true})
	    vRPclient.notify(player,{"Du er nu ambulanceredder."})
		vRPclient.giveWeapons(player,{{WEAPON_STUNGUN = {ammo = 1}}})
		end,
      onspawn = function(player)
	    vRPclient.setCop(player,{true})
		vRPclient.notify(player,{"Du er nu ambulanceredder."})
		vRPclient.giveWeapons(player,{{WEAPON_STUNGUN = {ammo = 1}}})
		end,
      onleave = function(player)
	    vRPclient.setCop(player,{false})
		vRPclient.stopMission(player)
		vRPclient.removeWeapons(player,{{WEAPON_STUNGUN = {ammo = 0}}})
	  end
    },
    "emergency.revive",
    "emergency.shop",
    "emergency.service",
	"emergency.cloakroom",
	"emergency.vehicle",
	"emergency.market",
	"emergency.paycheck"
  },
  ["Mekaniker"] = {
    _config = { gtype = "job",
	onjoin = function(player) vRPclient.notify(player,{"Du er nu mekaniker."}) end,
	onspawn = function(player) vRPclient.notify(player,{"Du er nu mekaniker."}) end,
	onleave = function(player) vRPclient.stopMission(player) end
	},
    "mechanic.whitelisted",
	"mech.announce",
    "vehicle.repair",
    "vehicle.replace",
    "repair.service",
	"mission.repair.satellite_dishes",
	"mission.repair.wind_turbines",
	"repair.vehicle",
	"repair.market",
	"repair.paycheck"
  },
  ["Taxa"] = {
  _config = { gtype = "job",
    onjoin = function(player) vRPclient.notify(player,{"Du er nu taxachauffør."}) end,
    onspawn = function(player) vRPclient.notify(player,{"Du er nu taxachauffør."}) end,
    onleave = function(player) vRPclient.stopMission(player) end
	},
	"taxi.service",
	"taxi.vehicle",
	"taxi.announce",
	"taxi.paycheck"
  },
  ["Advokat"] = {
    _config = { gtype = "job",
	onjoin = function(player) vRPclient.notify(player,{"Du er nu advokat."}) end,
	onspawn = function(player) vRPclient.notify(player,{"Du er nu advokat."}) end,
	onleave = function(player) vRPclient.stopMission(player) end
	},
	"lawyer.service",
	"lawyer.announce",
	"lawyer.paycheck"
  },
  -- ["Civil"] = {
    -- _config = { gtype = "job",
	-- onjoin = function(player) vRPclient.notify(player,{"Du er civil, find et job på jobcentret."}) end,
	-- onspawn = function(player) vRPclient.notify(player,{"Du er civil, find et job på jobcentret."}) end
	-- }
  -- },
  ["Udbringer"] = {
    _config = { gtype = "job",
	onjoin = function(player) vRPclient.notify(player,{"Du er nu udbringer."}) end,
	onspawn = function(player) vRPclient.notify(player,{"Du er nu udbringer."}) end,
	onleave = function(player) vRPclient.stopMission(player) end
	},
	"mission.delivery.food",
	"delivery.vehicle",
	"delivery.paycheck"
  },
  ["Arbejdsløs"] = {
    _config = { gtype = "job",
	onjoin = function(player) vRPclient.notify(player,{"Du er nu Arbejdsløs."}) end,
	onspawn = function(player) vRPclient.notify(player,{"Du er nu Arbejdsløs."}) end,
	onleave = function(player) vRPclient.stopMission(player) end
	},
	"drugseller.sell",
	"drugseller.market",
	"drugseller.harvest",
	"drugseller.process",
	"hacker.0day"
  },
  ["Pengetransport"] = {
    _config = { gtype = "job",
	onjoin = function(player) vRPclient.notify(player,{"Du er nu Pengetransport."}) end,
	onspawn = function(player) vRPclient.notify(player,{"Du er nu Pengetransport."}) end,
	onleave = function(player) vRPclient.stopMission(player) end
	},
	"mission.bankdriver.moneybank",
	"mission.bankdriver.moneybank2",
	"bankdriver.vehicle",
	"bankdriver.paycheck",
	"bankdriver.money"
  },
  ["Minearbejder"] = {
    _config = { gtype = "job",
	onjoin = function(player) vRPclient.notify(player,{"Du er nu Minearbejder."}) end,
	onspawn = function(player) vRPclient.notify(player,{"Du er nu Minearbejder."}) end,
	onleave = function(player) vRPclient.stopMission(player) end
	},
	"mining.harvest",
	"mining.process",
	"mining.sell",
	"mining.paycheck",
	"mining.vehicle"
  },
  ["Fisker"] = {
    _config = { gtype = "job",
	onjoin = function(player) vRPclient.notify(player,{"Du er nu fisker."}) end,
	onspawn = function(player) vRPclient.notify(player,{"Du er nu fisker."}) end,
	onleave = function(player) vRPclient.stopMission(player) end
	},
	"fisher.sell",
	"fisher.fish",
	"fisher.process",
	"fisher.vehicle",
	"fisher.paycheck"
  }
  -- ["Buschauffør"] = {
    -- _config = { gtype = "job",
	-- onjoin = function(player) vRPclient.notify(player,{"Du er nu buschauffør."}) end,
	-- onspawn = function(player) vRPclient.notify(player,{"Du er nu buschauffør."}) end,
	-- onleave = function(player) vRPclient.stopMission(player) end
	-- },
	-- "bus.vehicle",
	-- "bus.paycheck"
  -- }
}

-- groups are added dynamically using the API or the menu, but you can add group when an user join here
cfg.users = {
  [1] = { -- give superadmin and admin group to the first created user on the database
    "Ejer",
    "Ledelsen",
    "Admin"
  }
}

-- group selectors
-- _config
--- x,y,z, blipid, blipcolor, permissions (optional)

cfg.selectors = {
  ["Job"] = {
    _config = {x = -268.363739013672, y = -957.255126953125, z = 31.22313880920410, blipid = 351, blipcolor = 47},
    "Taxa",
    "Udbringer",
    "Pengetransport",
    "Arbejdsløs",
	"Minearbejder"
  },
  ["Politi"] = {
    _config = {x = 454.47848510742, y = -988.86291503906, z = 30.689605712891, blipid = 351, blipcolor = 1, permissions = {"cop.whitelisted"} },
    "Politi",
    "Arbejdsløs"
  },
  ["Advokat"] = {
    _config = {x = 234.86401367188, y = 225.08558654785, z = 110.28269195557, blipid = 351, blipcolor = 16, permissions = {"lawyer.whitelisted"} },
    "Advokat",
    "Arbejdsløs"
  },
  ["Ambulanceredder"] = {
    _config = {x = 1151.0318603516, y = -1529.875, z = 35.37251663208, blipid = 351, blipcolor = 3, permissions = {"ems.whitelisted"} },
    "Ambulanceredder",
    "Arbejdsløs"
  },
  ["Mekaniker"] = {
    _config = {x = 406.26739501953, y = -1626.6818847656, z = 29.291933059692, blipid = 351, blipcolor = 3, permissions = {"mechanic.whitelisted"} },
    "Mekaniker",
    "Arbejdsløs"
  },
  ["Mekaniker"] = {
    _config = {x = 1445.06640625, y = 3224.9282226563, z = 40.659523010254, blipid = 351, blipcolor = 3, permissions = {"mechanic.whitelisted"} },
    "Mekaniker",
    "Arbejdsløs"
  }
  -- ["Fisker"] = {
    -- _config = {x = 531.07739257813, y = -2844.6320800781, z = 6.0453724861145, blipid = 68, blipcolor = 3},
    -- "Fisker",
    -- "Civil"
  -- }
}
  

return cfg

