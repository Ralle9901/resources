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

-- LOG FUNCTION
function vRPbm.logInfoToFile(file,info)
  file = io.open(file, "a")
  if file then
    file:write(os.date("%c").." => "..info.."\n")
  end
  file:close()
end

-- teleport waypoint
local choice_tptowaypoint = {function(player,choice)
  TriggerClientEvent("TpToWaypoint", player)
end, "Teleporter til map blip."}

function vRPbm.chargePhoneNumber(user_id,phone)
  local player = vRP.getUserSource({user_id})
  local directory_name = vRP.getPhoneDirectoryName({user_id, phone})
  if directory_name == "unknown" then
	directory_name = phone
  end
  vRP.prompt({player,"Beløbet du vil opkræve "..directory_name..":","0",function(player,charge)
	if charge ~= nil and charge ~= "" and tonumber(charge)>0 then 
	  vRP.getUserByPhone({phone, function(target_id)
		if target_id~=nil then
			if charge ~= nil and charge ~= "" then 
	          local target = vRP.getUserSource({target_id})
			  if target ~= nil then
				vRP.getUserIdentity({user_id, function(identity)
				  local my_directory_name = vRP.getPhoneDirectoryName({target_id, identity.phone})
				  if my_directory_name == "unknown" then
				    my_directory_name = identity.phone
				  end
			      local text = "" .. my_directory_name .. " har sendt dig en regning på DKK" .. charge .. " for hans services."
				  vRP.request({target,text,600,function(req_player,ok)
				    if ok then
					  local target_bank = vRP.getBankMoney({target_id}) - tonumber(charge)
					  local my_bank = vRP.getBankMoney({user_id}) + tonumber(charge)
		              if target_bank>0 then
					    vRP.setBankMoney({user_id,my_bank})
					    vRP.setBankMoney({target_id,target_bank})
					    -- vRPclient.notify(player,{"Du modtog ~y~DKK" .. charge .. " ~w~fra ~b~" .. directory_name .. "~w~ for dine services."})
						TriggerClientEvent("pNotify:SendNotification", player,{text = "Du modtog "..charge.." DKK fra "..directory_name.." for dine services.", type = "success", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
						-- vRPclient.notify(target,{"~b~" .. my_directory_name .. " ~w~modtog ~r~DKK " .. charge .. " ~w~for hans services."})
						TriggerClientEvent("pNotify:SendNotification", player,{text = my_directory_name.." modtog "..charge.." DKK for hans services.", type = "success", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
					    --vRPbm.logInfoToFile("mchargeLog.txt",user_id .. " mobile charged "..target_id.." the amount of " .. charge .. ", user bank post-payment for "..user_id.." equals $"..my_bank.." and for "..user_id.." equals $"..target_bank)
					    vRP.closeMenu({player})
                      else
                        -- vRPclient.notify(target,{lang.money.not_enough()})
						TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.money.not_enough()}, type = "error", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
                        -- vRPclient.notify(player,{"~b~" .. directory_name .. "~w~ forsøgte at betale, men~r~ har~w~ ikke penge nok til at betale for dine services."})
						TriggerClientEvent("pNotify:SendNotification", player,{text = directory_name.." forsøgte at betale, men har ikke penge nok til at betale for dine services.", type = "error", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
                      end
				    else
                      -- vRPclient.notify(player,{"~b~" .. directory_name .. "~r~ nægtede~w~ at betale for dine services."})
						TriggerClientEvent("pNotify:SendNotification", player,{text = directory_name.." nægtede at betale for dine services.", type = "error", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
				    end
				  end})
				end})
			  else
			    -- vRPclient.notify(player,{"~r~Du kan ikke sende regninger til offline spillere."})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du kan ikke sende regninger til offline spillere", type = "error", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
			  end
			else
			  -- vRPclient.notify(player,{"~r~Din regning skal have et beløb."})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Din regning skal have et beløb", type = "error", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
			end
		else
		  -- vRPclient.notify(player,{"~r~Ugyldigt nummer."})
		 TriggerClientEvent("pNotify:SendNotification", player,{text = "Ugyldigt nummer", type = "error", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
		end
	  end})
	else
	  -- vRPclient.notify(player,{"~r~Beløbet skal være større end 0."})
		 TriggerClientEvent("pNotify:SendNotification", player,{text = "Beløbet skal være større end 0.", type = "error", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
	end
  end})
end

function vRPbm.payPhoneNumber(user_id,phone)
  local player = vRP.getUserSource({user_id})
  local directory_name = vRP.getPhoneDirectoryName({user_id, phone})
  if directory_name == "unknown" then
	directory_name = phone
  end
  vRP.prompt({player,"Beløb sendt til "..directory_name..":","0",function(player,transfer)
	if transfer ~= nil and transfer ~= "" and tonumber(transfer)>0 then 
	  vRP.getUserByPhone({phone, function(target_id)
	    local my_bank = vRP.getBankMoney({user_id}) - tonumber(transfer)
		if target_id~=nil then
          if my_bank >= 0 then
		    local target = vRP.getUserSource({target_id})
			if target ~= nil then
			  vRP.setBankMoney({user_id,my_bank})
              -- vRPclient.notify(player,{"~g~Du overførte ~r~DKK"..transfer.." ~g~til ~b~"..directory_name})
			  TriggerClientEvent("pNotify:SendNotification", player,{text = "Du overførte "..transfer.." DKK til "..directory_name, type = "success", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
			  local target_bank = vRP.getBankMoney({target_id}) + tonumber(transfer)
			  vRP.setBankMoney({target_id,target_bank})
			  vRPbm.logInfoToFile("mpayLog.txt",user_id .. " mobile paid "..target_id.." the amount of " .. transfer .. ", user bank post-payment for "..user_id.." equals DKK"..my_bank.." and for "..user_id.." equals DKK"..target_bank)
			  vRP.getUserIdentity({user_id, function(identity)
		        local my_directory_name = vRP.getPhoneDirectoryName({target_id, identity.phone})
			    if my_directory_name == "unknown" then
		          my_directory_name = identity.phone
			    end
                -- vRPclient.notify(target,{"~g~Du modtog ~y~DKK"..transfer.." ~g~fra ~b~"..my_directory_name})
			  TriggerClientEvent("pNotify:SendNotification", target,{text = "Du modtog "..transfer.." DKK fra "..my_directory_name, type = "success", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
			  end})
              vRP.closeMenu({player})
			else
			  -- vRPclient.notify(player,{"~r~Du kan ikke overføre til offline spillere."})
			  TriggerClientEvent("pNotify:SendNotification", player,{text = "Du kan ikke overføre til offline spillere.", type = "error", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
			end
          else
            -- vRPclient.notify(player,{lang.money.not_enough()})
			  TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.money.not_enough()}, type = "error", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
          end
		else
		  -- vRPclient.notify(player,{"~r~Ugyldigt nummer."})
			  TriggerClientEvent("pNotify:SendNotification", player,{text = "Ugyldigt nummer", type = "error", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
		end
	  end})
	else
	  -- vRPclient.notify(player,{"~r~Beløbet skal være større end 0."})
			  TriggerClientEvent("pNotify:SendNotification", player,{text = "Beløbet skal være større end 0.", type = "error", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
	end
  end})
end

-- mobilepay
local ch_mobilepay = {function(player,choice) 
	local user_id = vRP.getUserId({player})
	local menu = {}
	menu.name = lang.phone.directory.title()
	menu.css = {top = "75px", header_color = "rgba(0,0,255,0.75)"}
    menu.onclose = function(player) vRP.openMainMenu({player}) end -- nest menu
	menu[">Indtast Nummer"] = {
	  -- payment function
	  function(player,choice) 
	    vRP.prompt({player,"Mobilnummer:","000000",function(player,phone)
	      if phone ~= nil and phone ~= "" then 
		    vRPbm.payPhoneNumber(user_id,phone)
		  else
		    -- vRPclient.notify(player,{"~r~Du skal indtaste et gyldigt nummer."})
			  TriggerClientEvent("pNotify:SendNotification", player,{text = "Du skal indtaste et gyldigt nummer.", type = "warning", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
		  end
	    end})
	  end,"Indtast nummeret manuelt."}
	local directory = vRP.getPhoneDirectory({user_id})
	for k,v in pairs(directory) do
	  menu[k] = {
	    -- payment function
	    function(player,choice) 
		  vRPbm.payPhoneNumber(user_id,v)
	    end
	  ,v} -- number as description
	end
	vRP.openMenu({player, menu})
end,"Overfør penge over MobilePay."}

-- mobilecharge
local ch_mobilecharge = {function(player,choice) 
	local user_id = vRP.getUserId({player})
	local menu = {}
	menu.name = lang.phone.directory.title()
	menu.css = {top = "75px", header_color = "rgba(0,0,255,0.75)"}
    menu.onclose = function(player) vRP.openMainMenu({player}) end -- nest menu
	menu[">Indtast Nummer"] = {
	  -- payment function
	  function(player,choice) 
	    vRP.prompt({player,"Mobilnummer:","000000",function(player,phone)
	      if phone ~= nil and phone ~= "" then 
		    vRPbm.chargePhoneNumber(user_id,phone)
		  else
		    -- vRPclient.notify(player,{"~r~Du skal indtaste et gyldigt nummer."})
			  TriggerClientEvent("pNotify:SendNotification", player,{text = "Du skal indtaste et gyldigt nummer.", type = "error", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
		  end
	    end})
	  end,"Indtast nummeret manuelt."}
	local directory = vRP.getPhoneDirectory({user_id})
	for k,v in pairs(directory) do
	  menu[k] = {
	    -- payment function
	    function(player,choice) 
		  vRPbm.chargePhoneNumber(user_id,v)
	    end
	  ,v} -- number as description
	end
	vRP.openMenu({player, menu})
end,"Send regning over mobilen."}

-- RESGISTER ADMIN MENU CHOICES
vRP.registerMenuBuilder({"admin", function(add, data)
  local user_id = vRP.getUserId({data.player})
  if user_id ~= nil then
    local choices = {}
	
	if vRP.hasPermission({user_id,"player.tptowaypoint"}) then
      choices["TP til Waypoint"] = choice_tptowaypoint -- teleport user to map blip
	end
	
	 add(choices)
  end
end})


-- REGISTER PHONE MENU CHOICES
-- TO USE THIS FUNCTION YOU NEED TO HAVE THE ORIGINAL vRP UPDATED TO THE LASTEST VERSION
vRP.registerMenuBuilder({"phone", function(add) -- phone menu is created on server start, so it has no permissions.
    local choices = {} -- Comment the choices you want to disable by adding -- in front of them.
	
    choices["MobilePay"] = ch_mobilepay -- transfer money through phone
    choices["Mobil Regning"] = ch_mobilecharge -- charge money through phone
	
    add(choices)
end})