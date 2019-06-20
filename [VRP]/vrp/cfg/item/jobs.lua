
local items = {}

-- local function play_drink(player)
  -- local seq = {
    -- {"mp_player_intdrink","intro_bottle",1},
    -- {"mp_player_intdrink","loop_bottle",1},
    -- {"mp_player_intdrink","outro_bottle",1}
  -- }

  -- vRPclient.playAnim(player,{true,seq,false})
-- end

-- local pills_choices = {}
-- pills_choices["Tag"] = {function(player,choice)
  -- local user_id = vRP.getUserId(player)
  -- if user_id ~= nil then
    -- if vRP.tryGetInventoryItem(user_id,"pills",1) then
      -- vRPclient.varyHealth(player,{25})
      -- vRPclient.notify(player,{"~g~ tager piller."})
      -- play_drink(player)
      -- vRP.closeMenu(player)
    -- end
  -- end
-- end}

items["raw_fish"] = {"Rå fisk","Rå fisk, skal forarbejdes før de kan sælges!",nil,0.1}
items["processed_fish"] = {"Forarbejdet fisk","Forarbejdet fisk, klar til salg!",nil,0.1}

return items