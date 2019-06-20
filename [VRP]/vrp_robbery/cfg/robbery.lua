cfg = {}

cfg.blips = false -- enable blips

cfg.seconds = 900 -- seconds to rob

cfg.cooldown = 3600 -- time between robbaries

cfg.cops = 2 -- minimum cops online
cfg.permission = "police.robbery" -- permission given to cops

cfg.banks = { -- list of banks
	["fleeca"] = { 
	  position = {['x']=147.04908752441,['y']=-1044.9448242188,['z']=29.36802482605}, 
	  nameofbank = "Fleeca Bank (Centrum)",
	  reward = 10000 + math.random(25000,75000),
		lastrobbed = 0
	},
	["fleeca2"] = { 
	  position = {['x'] = -2957.6674804688,['y']=481.45776367188,['z']=15.697026252747}, 
	  nameofbank = "Fleeca Bank (Motorvej)", 
	  reward = 10000 + math.random(25000,75000),
		lastrobbed = 0
	},
	["blainecounty"] = { 
	  position = {['x'] = -107.06505584717, 6474.8012695313,['z']=31.62670135498}, 
	  nameofbank = "Blaine County Savings (Paleto Bay)", 
	  reward = 10000 + math.random(25000,75000),
	  lastrobbed = 0
	},
	--["fleeca3"] = { 
	  --position = {['x'] = -1212.2568359375, -336.128295898438, 36.7907638549805},
	  --nameofbank = "Fleeca Bank (Vinewood Hills)",  
	  --reward = 5000 + math.random(500,10000),
	  --lastrobbed = 0
	--},
	--["fleeca4"] = { 
	  --position = {['x'] = -354.452575683594, -53.8204879760742, 48.0463104248047}, 
	  --nameofbank = "Fleeca Bank (Burton)", 
	  --reward = 5000 + math.random(500,10000),
	  --lastrobbed = 0
	--},
	--["fleeca5"] = { 
	  --position = {['x'] = 309.967376708984, -283.033660888672, 53.1745223999023}, 
	  --nameofbank = "Fleeca Bank (Alta)", 
	  --reward = 5000 + math.random(500,10000),
	  --lastrobbed = 0
	--},
	--["fleeca6"] = { 
	  --position = {['x'] = 1176.86865234375, 2711.91357421875, 38.097785949707}, 
	  --nameofbank = "Fleeca Bank (Desert)", 
	  --reward = 5000 + math.random(500,10000),
	  --lastrobbed = 0
	--},
	["pacific"] = { 
	  position = {['x']=263.15411376953,['y']=214.57843017578,['z']=101.68337249756}, 
	  nameofbank = "Nationalbanken", 
	  reward = 50000 + math.random(50000,150000),
	  lastrobbed = 0
	}
}