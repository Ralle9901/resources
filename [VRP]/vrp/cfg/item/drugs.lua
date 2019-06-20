
local items = {}

local function play_drink(player)
  local seq = {
    {"mp_player_intdrink","intro_bottle",1},
    {"mp_player_intdrink","loop_bottle",1},
    {"mp_player_intdrink","outro_bottle",1}
  }

  vRPclient.playAnim(player,{true,seq,false})
end

local pills_choices = {}
pills_choices["Tag"] = {function(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    if vRP.tryGetInventoryItem(user_id,"pills",1) then
      vRPclient.varyHealth(player,{25})
      -- vRPclient.notify(player,{"~g~ tager piller."})
	  TriggerClientEvent("pNotify:SetQueueMax", player, 8, 2)
	  TriggerClientEvent("pNotify:SendNotification", player,{text = "Tager piller", type = "success", queue = "8", timeout = 2000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
      play_drink(player)
      vRP.closeMenu(player)
    end
  end
end}

local function play_smoke(player)
  local seq2 = {
    {"mp_player_int_uppersmoke","mp_player_int_smoke_enter",1},
    {"mp_player_int_uppersmoke","mp_player_int_smoke",1},
    {"mp_player_int_uppersmoke","mp_player_int_smoke_exit",1}
  }

  vRPclient.playAnim(player,{true,seq2,false})
end

local smoke_choices = {}
smoke_choices["Ryg"] = {function(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    if vRP.tryGetInventoryItem(user_id,"hash",1) then
	  vRP.varyHunger(user_id,(20))
	  TriggerClientEvent("pNotify:SetQueueMax", player, 9, 2)
      TriggerClientEvent("pNotify:SendNotification", player,{text = "Ryger en joint", type = "success", queue = "9", timeout = 2000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
      vRPclient.playScreenEffect(player,{"DrugsMichaelAliensFight", 180})
      play_smoke(player)
      vRP.closeMenu(player)
    end
  end
end}

local function play_smell(player)
  local seq3 = {
    {"mp_player_intdrink","intro_bottle",1},
    {"mp_player_intdrink","loop_bottle",1},
    {"mp_player_intdrink","outro_bottle",1}
  }

  vRPclient.playAnim(player,{true,seq3,false})
end

local smell_choices = {}
smell_choices["Snif"] = {function(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    if vRP.tryGetInventoryItem(user_id,"cocaine",1) then
	  vRP.varyThirst(user_id,(20))
	  TriggerClientEvent("pNotify:SetQueueMax", player, 10, 2)
      TriggerClientEvent("pNotify:SendNotification", player,{text = "Sniffer kokain", type = "success", queue = "10", timeout = 2000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
      vRPclient.playScreenEffect(player,{"ChopVision", 300})
	  play_smell(player)
      vRP.closeMenu(player)
    end
  end
end}

local function play_lsd(player)
  local seq4 = {
    {"mp_player_intdrink","intro_bottle",1},
    {"mp_player_intdrink","loop_bottle",1},
    {"mp_player_intdrink","outro_bottle",1}
  }

  vRPclient.playAnim(player,{true,seq4,false})
end

local lsd_choices = {}
lsd_choices["Tag"] = {function(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    if vRP.tryGetInventoryItem(user_id,"lsd",1) then
	  vRP.varyThirst(user_id,(20))
	  TriggerClientEvent("pNotify:SetQueueMax", player, 11, 2)
	  TriggerClientEvent("pNotify:SendNotification", player,{text = "Slikker på et frimærke", type = "success", queue = "11", timeout = 2000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	  vRPclient.playScreenEffect(player,{"DrugsTrevorClownsFight", 600})
      play_lsd(player)
      vRP.closeMenu(player)
    end
  end
end}

items["pills"] = {"Panodil","Smertestillende piller.",function(args) return pills_choices end,0.1}
items["hash"] = {"Hashklump","En klump hash.",function(args) return smoke_choices end,0.01}
items["cocaine"] = {"Kokain","Et gram kokain.",function(args) return smell_choices end,0.01}
items["lsd"] = {"LSD","Et frimærke med LSD.",function(args) return lsd_choices end,0.01}
items["processed_fish"] = {"Behandlet fisk","En behandlet fisk.",nil,0.01}
items["raw_fish"] = {"Rå fisk","Husk at behandle dem.",nil,0.01}
items["0day"] = {"ATM 0day Exploit","0day software exploit. Kan få hæveautomater til at spytte penge ud!",nil,0.1}

return items