-- Remember to use the cop group or this won't work
-- F9 > Admin > Add Group > User ID > cop

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_bank")

local banks = {
	["fleeca"] = {
		position = { ['x'] = 147.04908752441, ['y'] = -1044.9448242188, ['z'] = 29.36802482605 },
		reward = 100000 + math.random(100000,200000),
		nameofbank = "Fleeca Bank [Midt Byen]",
		lastrobbed = 0
	},
	["fleeca2"] = {
		position = { ['x'] = -2957.6674804688, ['y'] = 481.45776367188, ['z'] = 15.697026252747 },
		reward = 100000 + math.random(100000,200000),
		nameofbank = "Fleeca Bank [Motervejen]",
		lastrobbed = 0
	},
	["blainecounty"] = {
		position = { ['x'] = -107.06505584717, ['y'] = 6474.8012695313, ['z'] = 31.62670135498 },
		reward = 100000 + math.random(100000,200000),
		nameofbank = "Blaine County Savings [Nord]",
		lastrobbed = 0
	}
}

local robbers = {}

function get3DDistance(x1, y1, z1, x2, y2, z2)
	return math.sqrt(math.pow(x1 - x2, 2) + math.pow(y1 - y2, 2) + math.pow(z1 - z2, 2))
end

RegisterServerEvent('es_bank:toofar')
AddEventHandler('es_bank:toofar', function(robb)
	if(robbers[source])then
		TriggerClientEvent('es_bank:toofarlocal', source)
		robbers[source] = nil
		TriggerClientEvent('chatMessage', -1, 'NYHEDER', {255, 0, 0}, "Røveri blev aflyst på: ^2" .. banks[robb].nameofbank)
	end
end)

RegisterServerEvent('es_bank:playerdied')
AddEventHandler('es_bank:playerdied', function(robb)
	if(robbers[source])then
		TriggerClientEvent('es_bank:playerdiedlocal', source)
		robbers[source] = nil
		TriggerClientEvent('chatMessage', -1, 'NYHEDER', {255, 0, 0}, "Røveri blev aflyst på: ^2" .. banks[robb].nameofbank)
	end
end)

RegisterServerEvent('es_bank:rob')
AddEventHandler('es_bank:rob', function(robb)
  local user_id = vRP.getUserId({source})
  local player = vRP.getUserSource({user_id})
  local cops = vRP.getUsersByGroup({"Politi"}) -- remember to use the cop group or this won't work - K > Admin > Add Group > User ID > cop
  if vRP.hasGroup({user_id,"Politi"}) then
    vRPclient.notify(player,{"~r~Politiet kan ikke røve banke."})
  else
    if #cops >= 2 then -- change 2 to the minimum amount online necessary
	  if banks[robb] then
		  local bank = banks[robb]

		  if (os.time() - bank.lastrobbed) < 600 and bank.lastrobbed ~= 0 then
			  TriggerClientEvent('chatMessage', player, 'ROBBERY', {255, 0, 0}, "Dette er allerede blevet røvet for nylig. Vent venligst en anden: ^2" .. (1200 - (os.time() - bank.lastrobbed)) .. "^0 sekunder.")
			  return
		  end
		  TriggerClientEvent('chatMessage', -1, 'NYHEDER', {255, 0, 0}, "Røver i gang på ^2" .. bank.nameofbank)
		  TriggerClientEvent('chatMessage', player, 'NYHEDER', {255, 0, 0}, "Du startede et røveri på: ^2" .. bank.nameofbank .. "^0, kom ikke for langt væk fra dette punkt!")
		  TriggerClientEvent('chatMessage', player, 'NYHEDER', {255, 0, 0}, "Hold fortet for ^1 12 ^0minutter og pengene er din!")
		  TriggerClientEvent('es_bank:currentlyrobbing', player, robb)
		  banks[robb].lastrobbed = os.time()
		  robbers[player] = robb
		  local savedSource = player
		  SetTimeout(720000, function()
			  if(robbers[savedSource])then
				  if(user_id)then
					  vRP.giveInventoryItem({user_id,"dirty_money",bank.reward,true})
					  TriggerClientEvent('chatMessage', -1, 'NYHEDER', {255, 0, 0}, "Røveri er forbi på: ^2" .. bank.nameofbank .. "^0!")
					  TriggerClientEvent('es_bank:robberycomplete', savedSource, bank.reward)
				  end
			  end
		  end)		
	  end
    else
      vRPclient.notify(player,{"~r~Der skal være 2 Politi på serveren for at start en bankrøveri."})
    end
	end
end)