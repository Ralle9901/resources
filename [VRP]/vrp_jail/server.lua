local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
local htmlEntities = module("vrp", "lib/htmlEntities")

vRPbm = {}
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_basic_menu")
BMclient = Tunnel.getInterface("vRP_basic_menu","vRP_basic_menu")
vRPbsC = Tunnel.getInterface("vRP_barbershop","vRP_basic_menu")
Tunnel.bindInterface("vrp_basic_menu",vRPbm)

local Lang = module("vrp", "lib/Lang")
local cfg = module("vrp", "cfg/base")
local lang = Lang.new(module("vrp", "cfg/lang/"..cfg.lang) or {})

local unjailed = {}
function jail_clock(target_id,timer)
  local target = vRP.getUserSource({tonumber(target_id)})
  local users = vRP.getUsers({})
  local online = false
  for k,v in pairs(users) do
	if tonumber(k) == tonumber(target_id) then
	  online = true
	end
  end
  if online then
    if timer>0 then
	  -- vRPclient.notify(target, {"~r~Tid tilbage: " .. timer .. " minut(ter)."})
	  TriggerClientEvent("pNotify:SendNotification", target,{text ="Tid tilbage: "..timer.." minut(ter).", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
      vRP.setUData({tonumber(target_id),"vRP:jail:time",json.encode(timer)})
	  SetTimeout(60*1000, function()
		for k,v in pairs(unjailed) do -- check if player has been unjailed by cop or admin
		  if v == tonumber(target_id) then
	        unjailed[v] = nil
		    timer = 0
		  end
		end
	    jail_clock(tonumber(target_id),timer-1)
	  end) 
    else 
	  BMclient.loadFreeze(target,{true})
	  SetTimeout(15000,function()
		BMclient.loadFreeze(target,{false})
	  end)
	  vRPclient.teleport(target,{1805.2824707031,2606.0246582031,45.564987182617}) -- teleport to outside jail
	  vRPclient.setHandcuffed(target,{false})
      -- vRPclient.notify(target,{"~b~Du blev løsladt."})
	  TriggerClientEvent("pNotify:SendNotification", target,{text ="Du blev løsladt.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
	  vRP.setUData({tonumber(target_id),"vRP:jail:time",json.encode(-1)})
    end
  end
end

-- dynamic jail
local ch_jail = {function(player,choice) 
  vRPclient.getNearestPlayers(player,{15},function(nplayers) 
	local user_list = ""
    for k,v in pairs(nplayers) do
	  user_list = user_list .. "[" .. vRP.getUserId({k}) .. "]" .. GetPlayerName(k) .. " | "
    end 
	if user_list ~= "" then
	  vRP.prompt({player,"Spillere tæt på:" .. user_list,"",function(player,target_id) 
	    if target_id ~= nil and target_id ~= "" then 
	      vRP.prompt({player,"Fængselsstraf i minutter:","1",function(player,jail_time)
			if jail_time ~= nil and jail_time ~= "" then 
	          local target = vRP.getUserSource({tonumber(target_id)})
			  if target ~= nil then
		        if tonumber(jail_time) < 1 then
		          jail_time = 1
		        end
		  
                vRPclient.isHandcuffed(target,{}, function(handcuffed)  
                  if handcuffed then 
					BMclient.loadFreeze(target,{true})
					SetTimeout(15000,function()
					  BMclient.loadFreeze(target,{false})
					end)
				    vRPclient.teleport(target,{1799.8999023438,2489.7124023438,-119.02989959717}) -- teleport to inside jail
				    -- vRPclient.notify(target,{"~r~Du blev fængslet."})
					TriggerClientEvent("pNotify:SendNotification", target,{text ="Du blev fængslet.", type = "warning", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
				    -- vRPclient.notify(player,{"~b~Du sendte en person i fængsel."})
					TriggerClientEvent("pNotify:SendNotification", player,{text ="Du sendte en person i fængsel.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
				    vRP.setHunger({tonumber(target_id),0})
				    vRP.setThirst({tonumber(target_id),0})
				    jail_clock(tonumber(target_id),tonumber(jail_time))
					local user_id = vRP.getUserId({player})
					PerformHttpRequest('https://discordapp.com/api/webhooks/369576466868076544/zbs9aMveeB8E-NZRpjiUUBBNd_1ZGMAJDamcBYR33IEwlMDwxaeNsXMkS6rANTzdNr3A', function(err, text, headers) end, 'POST', json.encode({username = "Server " .. GetConvar("servernumber","0"), content = user_id .. " fængslede "..target_id.." i " .. jail_time .. " minutter"}), { ['Content-Type'] = 'application/json' })
			      else
				    -- vRPclient.notify(player,{"~r~Ikke i håndjern."})
					TriggerClientEvent("pNotify:SendNotification", player,{text ="Ikke i håndjern.", type = "error", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
			      end
			    end)
			  else
				-- vRPclient.notify(player,{"~r~Ugyldigt ID."})
			       TriggerClientEvent("pNotify:SendNotification", player,{text ="Ugyldigt ID.", type = "error", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
			  end
			else
			  -- vRPclient.notify(player,{"~r~Varighed på dommen ikke indtastet."})
			    TriggerClientEvent("pNotify:SendNotification", player,{text ="Varighed på dommen ikke indtastet.", type = "error", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
			end
	      end})
        else
          -- vRPclient.notify(player,{"~r~Intet spiller ID valgt."})
		     TriggerClientEvent("pNotify:SendNotification", player,{text ="Intet spiller ID valgt.", type = "error", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
        end 
	  end})
    else
      -- vRPclient.notify(player,{"~r~Ingen spiller tæt på."})
	     TriggerClientEvent("pNotify:SendNotification", player,{text ="Ingen spiller tæt på.", type = "error", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
    end 
  end)
end,"Send den tætteste spiller i fængsel."}

-- dynamic unjail
local ch_unjail = {function(player,choice) 
	vRP.prompt({player,"Player ID:","",function(player,target_id) 
	  if target_id ~= nil and target_id ~= "" then 
		vRP.getUData({tonumber(target_id),"vRP:jail:time",function(value)
		  if value ~= nil then
		  custom = json.decode(value)
			if custom ~= nil then
			  local user_id = vRP.getUserId({player})
			  if tonumber(custom) > 0 or vRP.hasPermission({user_id,"admin.easy_unjail"}) then
	            local target = vRP.getUserSource({tonumber(target_id)})
				if target ~= nil then
	              unjailed[target] = tonumber(target_id)
				  -- vRPclient.notify(player,{"~g~Personen bliver snart løsladt."})
					TriggerClientEvent("pNotify:SendNotification", player,{text ="Personen bliver snart løsladt.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
				  -- vRPclient.notify(target,{"~g~Din straf blev sat ned."})
					TriggerClientEvent("pNotify:SendNotification", target,{text ="Din straf blev sat ned.", type = "success", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
				  PerformHttpRequest('https://discordapp.com/api/webhooks/369576466868076544/zbs9aMveeB8E-NZRpjiUUBBNd_1ZGMAJDamcBYR33IEwlMDwxaeNsXMkS6rANTzdNr3A', function(err, text, headers) end, 'POST', json.encode({username = "Server " .. GetConvar("servernumber","0"), content = user_id .. " løsladte "..target_id.." fra en fængselsstraf på " .. custom .. " minutter"}), { ['Content-Type'] = 'application/json' })
				else
				  -- vRPclient.notify(player,{"~r~Ugyldigt ID."})
					TriggerClientEvent("pNotify:SendNotification", player,{text ="Ugyldigt ID.", type = "error", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
				end
			  else
				-- vRPclient.notify(player,{"~r~Spilleren er ikke i fængsel."})
					TriggerClientEvent("pNotify:SendNotification", player,{text ="Spilleren er ikke i fængsel.", type = "error", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
			  end
			end
		  end
		end})
      else
        -- vRPclient.notify(player,{"~r~Intet ID valgt."})
			TriggerClientEvent("pNotify:SendNotification", player,{text ="Intet ID valgt.", type = "error", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
      end 
	end})
end,"Løslader en person fra fængsel."}

-- (server) called when a logged player spawn to check for vRP:jail in user_data
AddEventHandler("vRP:playerSpawn", function(user_id, source, first_spawn) 
  local target = vRP.getUserSource({user_id})
  SetTimeout(35000,function()
    local custom = {}
    vRP.getUData({user_id,"vRP:jail:time",function(value)
	  if value ~= nil then
	    custom = json.decode(value)
	    if custom ~= nil then
		  if tonumber(custom) > 0 then
			BMclient.loadFreeze(target,{true})
			SetTimeout(15000,function()
			  BMclient.loadFreeze(target,{false})
			end)
            vRPclient.setHandcuffed(target,{true})
            vRPclient.teleport(target,{1641.5477294922,2570.4819335938,45.564788818359}) -- teleport inside jail
            -- vRPclient.notify(target,{"~r~Færdiggør din straf."})
			TriggerClientEvent("pNotify:SendNotification", target,{text ="Du skal vidst lige afzone din straf.", type = "error", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
			vRP.setHunger({tonumber(user_id),0})
			vRP.setThirst({tonumber(user_id),0})
			PerformHttpRequest('https://discordapp.com/api/webhooks/369576466868076544/zbs9aMveeB8E-NZRpjiUUBBNd_1ZGMAJDamcBYR33IEwlMDwxaeNsXMkS6rANTzdNr3A', function(err, text, headers) end, 'POST', json.encode({username = "Server " .. GetConvar("servernumber","0"), content = user_id.." blev sendt tilbage i fængsel i " .. custom .. " minutter for at færdiggøre sin straf"}), { ['Content-Type'] = 'application/json' })
		    jail_clock(tonumber(user_id),tonumber(custom))
		  end
	    end
	  end
	end})
  end)
end)

-- dynamic fine
local ch_fine = {function(player,choice) 
  vRPclient.getNearestPlayers(player,{15},function(nplayers) 
	local user_list = ""
    for k,v in pairs(nplayers) do
	  user_list = user_list .. "[" .. vRP.getUserId({k}) .. "]" .. GetPlayerName(k) .. " | "
    end 
	if user_list ~= "" then
	  vRP.prompt({player,"Spillere tæt på:" .. user_list,"",function(player,target_id) 
	    if target_id ~= nil and target_id ~= "" then 
	      vRP.prompt({player,"Bøde størrelse:","100",function(player,fine)
			if fine ~= nil and fine ~= "" then 
	          vRP.prompt({player,"Bøde årsag:","",function(player,reason)
			    if reason ~= nil and reason ~= "" then 
	              local target = vRP.getUserSource({tonumber(target_id)})
				  if target ~= nil then
		            if tonumber(fine) < 100 then
		              fine = 100
		            end
			  
		            if vRP.tryFullPayment({tonumber(target_id), tonumber(fine)}) then
                      vRP.insertPoliceRecord({tonumber(target_id), lang.police.menu.fine.record({reason,fine})})
                      -- vRPclient.notify(player,{lang.police.menu.fine.fined({reason,fine})})
						TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.police.menu.fine.fined({reason,fine})}, type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
                      -- vRPclient.notify(target,{lang.police.menu.fine.notify_fined({reason,fine})})
						TriggerClientEvent("pNotify:SendNotification", target,{text = {lang.police.menu.fine.notify_fined({reason,fine})}, type = "warning", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
					  local user_id = vRP.getUserId({player})
					  PerformHttpRequest('https://discordapp.com/api/webhooks/369576466868076544/zbs9aMveeB8E-NZRpjiUUBBNd_1ZGMAJDamcBYR33IEwlMDwxaeNsXMkS6rANTzdNr3A', function(err, text, headers) end, 'POST', json.encode({username = "Server " .. GetConvar("servernumber","0"), content = user_id .. " gav "..target_id.." en bøde på " .. fine .. " for ".. reason}), { ['Content-Type'] = 'application/json' })
                      vRP.closeMenu({player})
                    else
                      -- vRPclient.notify(player,{lang.money.not_enough()})
						TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.money.not_enough()}, type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
                    end
				  else
					-- vRPclient.notify(player,{"~r~ID Ugyldigt."})
						TriggerClientEvent("pNotify:SendNotification", player,{text = "~r~ID Ugyldigt.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
				  end
				else
				  -- vRPclient.notify(player,{"~r~Du kan ikke give bøde uden en grund."})
					TriggerClientEvent("pNotify:SendNotification", player,{text = "Du kan ikke give bøde uden en grund.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
				end
	          end})
			else
			  -- vRPclient.notify(player,{"~r~Du skal indtaste beløb."})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du skal indtaste beløb.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
			end
	      end})
        else
          -- vRPclient.notify(player,{"~r~Du har ikke indtastet spiller ID."})
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du har ikke indtastet spiller ID.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
        end 
	  end})
    else
      -- vRPclient.notify(player,{"~r~Ingen spiller i nærheden."})
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Ingen spiller i nærheden.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
    end 
  end)
end,"Giv bøde til den tætteste spiller."}


-- RESGISTER ADMIN MENU CHOICES
vRP.registerMenuBuilder({"admin", function(add, data)
  local user_id = vRP.getUserId({data.player})
  if user_id ~= nil then
    local choices = {}
	
	if vRP.hasPermission({user_id,"police.easy_jail"}) then
      choices["@UnJail"] = ch_unjail -- Un jails chosen player if he is jailed (Use admin.easy_unjail as permission to have this in admin menu working in non jailed players)
    end
	
    add(choices)
  end
end})

-- REGISTER POLICE MENU CHOICES
vRP.registerMenuBuilder({"police", function(add, data)
  local user_id = vRP.getUserId({data.player})
  if user_id ~= nil then
    local choices = {}

	if vRP.hasPermission({user_id,"police.easy_jail"}) then
      choices["Fængsel"] = ch_jail -- Send a nearby handcuffed player to jail with prompt for choice and user_list
    end
	
	if vRP.hasPermission({user_id,"police.easy_jail"}) then
      choices["Løslad"] = ch_unjail -- Un jails chosen player if he is jailed (Use admin.easy_unjail as permission to have this in admin menu working in non jailed players)
    end
	
	if vRP.hasPermission({user_id,"police.fine"}) then
      choices["Bøder - Custom"] = ch_fine -- Fines closeby player
    end

    add(choices)
  end
end})