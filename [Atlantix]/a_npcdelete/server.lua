local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","a_npcdelete")
npcdclient = Tunnel.getInterface("a_npcdelete","a_npcdelete")
local user_id = 0

AddEventHandler("vRP:playerJoinGroup", function(user_id, group, gtype)
  local player = vRP.getUserSource({user_id})
  user_id = user_id
  if gtype == "job" then 
    if vRP.hasPermission({user_id, "police.weapons"}) or vRP.hasPermission({user_id, "emergency.taser"}) then
	  TriggerClientEvent("a:npcdelete", player, true)
	else
	  TriggerClientEvent("a:npcdelete", player, false)
	end
  end
end)

AddEventHandler("vRP:playerSpawn", function(user_id, source, first_spawn)
  local player = vRP.getUserSource({user_id})
  user_id = user_id
    if vRP.hasPermission({user_id, "police.weapons"}) or vRP.hasPermission({user_id, "emergency.taser"}) then
	  TriggerClientEvent("a:npcdelete", player, true)
	else
	  TriggerClientEvent("a:npcdelete", player, false)
	end
end)