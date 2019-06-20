local htmlEntities = module("lib/htmlEntities")
local Tools = module("lib/Tools")

-- this module define some admin menu functions

local player_lists = {}

local function ch_list(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.list") then
    if player_lists[player] then -- hide
      player_lists[player] = nil
      vRPclient.removeDiv(player,{"user_list"})
    else -- show
      local content = ""
      local count = 0
      for k,v in pairs(vRP.rusers) do
        count = count+1
        local source = vRP.getUserSource(k)
        vRP.getUserIdentity(k, function(identity)
          if source ~= nil then
            content = content.."<br />"..k.." => <span class=\"pseudo\">"..vRP.getPlayerName(source).."</span> | "
            if identity then
              content = content.." <span class=\"name\">"..htmlEntities.encode(identity.firstname).." "..htmlEntities.encode(identity.name).."</span> <span class=\"reg\">"..identity.registration.."</span> <span class=\"phone\">"..identity.phone.."</span>"
            end
          end

          -- check end
          count = count-1
          if count == 0 then
            player_lists[player] = true
            local css = [[
.div_user_list{ 
  margin: auto; 
  padding: 8px; 
  width: 650px; 
  margin-top: 80px; 
  background: black; 
  color: white; 
  font-weight: bold; 
  font-size: 1.1em;
} 

.div_user_list .pseudo{ 
  color: rgb(0,255,125);
}

.div_user_list .endpoint{ 
  color: rgb(255,0,0);
}

.div_user_list .name{ 
  color: #309eff;
}

.div_user_list .reg{ 
  color: rgb(0,125,255);
}
              
.div_user_list .phone{ 
  color: rgb(211, 0, 255);
}
            ]]
            vRPclient.setDiv(player,{"user_list", css, content})
          end
        end)
      end
    end
  end
end

local function ch_whitelist(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.whitelist") then
    vRP.prompt(player,"Bruger ID: ","",function(player,id)
      id = parseInt(id)
      vRP.setWhitelisted(id,true)
      -- vRPclient.notify(player,{"Du whitelistede "..id})
	  TriggerClientEvent("pNotify:SendNotification", player,{text = "Du whitelistede #"..id, type = "success", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})       
    end)
  end
end

local function ch_unwhitelist(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.unwhitelist") then
    vRP.prompt(player,"Bruger ID: ","",function(player,id)
      id = parseInt(id)
      vRP.setWhitelisted(id,false)
      -- vRPclient.notify(player,{"Du blacklistede "..id})
	  TriggerClientEvent("pNotify:SendNotification", player,{text = "Du blacklistede #"..id, type = "success", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
    end)
  end
end

local function ch_addgroup(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.group.add") then
    vRP.prompt(player,"Bruger ID: ","",function(player,id)
      id = parseInt(id)
      vRP.prompt(player,"Job: ","",function(player,group)
        vRP.addUserGroup(id,group)
        -- vRPclient.notify(player,{id.." blev ansat som "..group})
		TriggerClientEvent("pNotify:SendNotification", player,{text = id.." blev ansat som "..group, type = "success", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
      end)
    end)
  end
end

local function ch_removegroup(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.group.remove") then
    vRP.prompt(player,"Bruger ID: ","",function(player,id)
      id = parseInt(id)
      vRP.prompt(player,"Job: ","",function(player,group)
        vRP.removeUserGroup(id,group)
        -- vRPclient.notify(player,{id.." blev fyret som "..group})
		TriggerClientEvent("pNotify:SendNotification", player,{text = id.." blev fyret som "..group, type = "success", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
      end)
    end)
  end
end

local function ch_kick(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.kick") then
    vRP.prompt(player,"Bruger ID: ","",function(player,id)
      id = parseInt(id)
      vRP.prompt(player,"Årsag: ","",function(player,reason)
        local source = vRP.getUserSource(id)
        if source ~= nil then
          vRP.kick(source,reason)
          -- vRPclient.notify(player,{"Du kickede "..id})
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du kickede "..id, type = "success", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
        end
      end)
    end)
  end
end

local function ch_ban(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.ban") then
    vRP.prompt(player,"Bruger ID: ","",function(player,id)
      id = parseInt(id)
      vRP.prompt(player,"Årsag: ","",function(player,reason)
        local source = vRP.getUserSource(id)
        if source ~= nil then
          vRP.ban(source,reason)
          -- vRPclient.notify(player,{"Du kickede "..id})
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du bannede "..id, type = "success", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
        end
      end)
    end)
  end
end

local function ch_unban(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.unban") then
    vRP.prompt(player,"Bruger ID: ","",function(player,id)
      id = parseInt(id)
      vRP.setBanned(id,false)
      -- vRPclient.notify(player,{"Du unbannede "..id})
	TriggerClientEvent("pNotify:SendNotification", player,{text = "Du unbannede "..id, type = "success", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
    end)
  end
end

local function ch_emote(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.custom_emote") then
    vRP.prompt(player,"Animation sequence ('dict anim optional_loops' per line): ","",function(player,content)
      local seq = {}
      for line in string.gmatch(content,"[^\n]+") do
        local args = {}
        for arg in string.gmatch(line,"[^%s]+") do
          table.insert(args,arg)
        end

        table.insert(seq,{args[1] or "", args[2] or "", args[3] or 1})
      end

      vRPclient.playAnim(player,{true,seq,false})
    end)
  end
end

local function ch_sound(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.custom_sound") then
    vRP.prompt(player,"Lyd 'dict name': ","",function(player,content)
      local args = {}
      for arg in string.gmatch(content,"[^%s]+") do
        table.insert(args,arg)
      end
      vRPclient.playSound(player,{args[1] or "", args[2] or ""})
    end)
  end
end

local function ch_coords(player,choice)
  vRPclient.getPosition(player,{},function(x,y,z)
    vRPclient.getHeading(player,{},function(h)
      vRP.prompt(player,"Kopier koordinaterne med CTRL-A CTRL-C",x..","..y..","..z..","..h,function(player,choice) end)
	end)
  end)
end

local function ch_tptome(player,choice)
  vRPclient.getPosition(player,{},function(x,y,z)
    vRP.prompt(player,"Bruger ID:","",function(player,user_id) 
      local tplayer = vRP.getUserSource(tonumber(user_id))
      if tplayer ~= nil then
        vRPclient.teleport(tplayer,{x,y,z})
      end
    end)
  end)
end

local function ch_tpto(player,choice)
  vRP.prompt(player,"Bruger ID:","",function(player,user_id) 
    local tplayer = vRP.getUserSource(tonumber(user_id))
    if tplayer ~= nil then
      vRPclient.getPosition(tplayer,{},function(x,y,z)
        vRPclient.teleport(player,{x,y,z})
      end)
    end
  end)
end

local function ch_tptocoords(player,choice)
  vRP.prompt(player,"Koordinat x,y,z eller x,y,z,h:","",function(player,fcoords) 
    local coords = {}
    for coord in string.gmatch(fcoords or "0,0,0","[^,]+") do
      table.insert(coords,tonumber(coord))
    end

    local x,y,z,h = 0,0,0,nil
    if coords[1] ~= nil then x = coords[1] end
    if coords[2] ~= nil then y = coords[2] end
    if coords[3] ~= nil then z = coords[3] end
	if coords[4] ~= nil then h = coords[4] end

    vRPclient.teleport(player,{x,y,z,h})
  end)
end

local function ch_givemoney(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    vRP.prompt(player,"Beløb:","",function(player,amount) 
      amount = parseInt(amount)
      vRP.giveMoney(user_id, amount)
	  TriggerClientEvent("pNotify:SendNotification", player,{text = "Du gav dig selv " ..amount.. "DKK", type = "success", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
	 end)
  end
end

local function ch_giveitem(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    vRP.prompt(player,"ID:","",function(player,idname) 
      idname = idname or ""
      vRP.prompt(player,"Antal:","",function(player,amount) 
        amount = parseInt(amount)
        vRP.giveInventoryItem(user_id, idname, amount,true)
		end)
    end)
  end
end

local function ch_calladmin(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    vRP.prompt(player,"Beskriv problem:","",function(player,desc) 
      desc = desc or ""

      local answered = false
      local players = {}
      for k,v in pairs(vRP.rusers) do
        local player = vRP.getUserSource(tonumber(k))
        -- check user
        if vRP.hasPermission(k,"admin.tickets") and player ~= nil then
          table.insert(players,player)
        end
      end

      -- send notify and alert to all listening players
      for k,v in pairs(players) do
        vRP.request(v,"Admin report fra "..user_id.." - Tager du den?: "..htmlEntities.encode(desc), 60, function(v,ok)
          if ok then -- take the call
            if not answered then
              -- answer the call
              -- vRPclient.notify(player,{"Din sag er taget."})
			  TriggerClientEvent("pNotify:SendNotification",player,{text = "Din sag er taget", type = "success", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
              vRPclient.getPosition(player, {}, function(x,y,z)
                vRPclient.teleport(v,{x,y,z})
              end)
              answered = true
            else
              -- vRPclient.notify(v,{"Sagen er allerede taget."})
			  TriggerClientEvent("pNotify:SendNotification",v,{text = "Sagen er allerede taget", type = "success", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
              
            end
          end
        end)
      end
    end)
  end
end

local player_customs = {}

local function ch_display_custom(player, choice)
  vRPclient.getCustomization(player,{},function(custom)
    if player_customs[player] then -- hide
      player_customs[player] = nil
      vRPclient.removeDiv(player,{"customization"})
    else -- show
      local content = ""
      for k,v in pairs(custom) do
        content = content..k.." => "..json.encode(v).."<br />" 
      end

      player_customs[player] = true
      vRPclient.setDiv(player,{"customization",".div_customization{ margin: auto; padding: 8px; width: 500px; margin-top: 80px; background: black; color: white; font-weight: bold; ", content})
    end
  end)
end

local function ch_noclip(player, choice)
  vRPclient.toggleNoclip(player, {})
end

local function ch_spawnvehicle(player, choice)
	vRP.prompt(player,"Bilen's modelnavn f.eks. blista:","",function(player,car)
		if car ~= "" then
			TriggerClientEvent("hp:spawnvehicle",player,car)
		end
	end)
end

local function ch_deletevehicle(player, choice)
	TriggerClientEvent("hp:deletevehicle", player)
end


vRP.registerMenuBuilder("main", function(add, data)
  local user_id = vRP.getUserId(data.player)
  if user_id ~= nil then
    local choices = {}

    -- build admin menu
    choices["- Admin"] = {function(player,choice)

      local menu = {name="Admin menu",css={top="75px",header_color="rgba(200,0,0,0.75)"}}
      menu.onclose = function(player) vRP.openMainMenu(player) end -- nest menu

      if vRP.hasPermission(user_id,"player.list") then
        menu["Brugerliste"] = {ch_list,"Vis/Gem"}
      end
      if vRP.hasPermission(user_id,"player.whitelist") then
        menu["Whitelist bruger"] = {ch_whitelist}
      end
      if vRP.hasPermission(user_id,"player.group.add") then
        menu["Tilføj job"] = {ch_addgroup}
      end
      if vRP.hasPermission(user_id,"player.group.remove") then
        menu["Fjern job"] = {ch_removegroup}
      end
      if vRP.hasPermission(user_id,"player.kick") then
        menu["Kick"] = {ch_kick}
      end
      if vRP.hasPermission(user_id,"player.ban") then
        menu["Ban"] = {ch_ban}
      end
      if vRP.hasPermission(user_id,"player.noclip") then
        menu["Noclip"] = {ch_noclip}
      end
      if vRP.hasPermission(user_id,"player.spawnvehicle") then
        menu["Spawn køretøj"] = {ch_spawnvehicle}
      end
      if vRP.hasPermission(user_id,"player.deletevehicle") then
        menu["Slet køretøj"] = {ch_deletevehicle}
      end
      if vRP.hasPermission(user_id,"player.coords") then
        menu["Koordinater"] = {ch_coords}
      end
      if vRP.hasPermission(user_id,"player.tptome") then
        menu["Teleporter til mig"] = {ch_tptome}
      end
      if vRP.hasPermission(user_id,"player.tpto") then
        menu["Teleporter til"] = {ch_tpto}
      end
      if vRP.hasPermission(user_id,"player.tpto") then
          menu["TpToKoords"] = {ch_tptocoords}
        end
      if vRP.hasPermission(user_id,"player.givemoney") then
        menu["Giv penge"] = {ch_givemoney}
      end
      if vRP.hasPermission(user_id,"player.giveitem") then
        menu["Giv ting"] = {ch_giveitem}
      end
      if vRP.hasPermission(user_id,"player.display_custom") then
        menu["Vis skin"] = {ch_display_custom}
      end
      if vRP.hasPermission(user_id,"player.calladmin") then
        menu["Tilkald Staff"] = {ch_calladmin}
      end

      vRP.openMenu(player,menu)
    end}

    add(choices)
  end
end)

-- admin god mode
function task_god()
  SetTimeout(10000, task_god)

  for k,v in pairs(vRP.getUsersByPermission("admin.god")) do
    vRP.setHunger(v, 0)
    vRP.setThirst(v, 0)

    local player = vRP.getUserSource(v)
    if player ~= nil then
      vRPclient.setHealth(player, {200})
    end
  end
end

task_god()