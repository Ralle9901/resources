--[[BASE]]--
MySQL = module("vrp_mysql", "MySQL")
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_dmvschool")

--[[LANG]]--
local Lang = module("vrp", "lib/Lang")
local cfg = module("vrp", "cfg/base")
local lang = Lang.new(module("vrp", "cfg/lang/"..cfg.lang) or {})

--[[SQL]]--
MySQL.createCommand("vRP/dmv_column", "ALTER TABLE vrp_users ADD IF NOT EXISTS DmvTest varchar(50) NOT NULL default 'Required'")
MySQL.createCommand("vRP/dmv_success", "UPDATE vrp_users SET DmvTest='Passed' WHERE id = @id")
MySQL.createCommand("vRP/dmv_search", "SELECT * FROM vrp_users WHERE id = @id AND DmvTest = 'Passed'")

-- init
MySQL.query("vRP/dmv_column")

--[[DMV Test]]--

RegisterServerEvent("dmv:success")
AddEventHandler("dmv:success", function()
	local user_id = vRP.getUserId({source})
	MySQL.query("vRP/dmv_success", {id = user_id})
end)

RegisterServerEvent("dmv:ttcharge")
AddEventHandler("dmv:ttcharge", function()
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	if vRP.tryFullPayment({user_id,2000}) then
        TriggerClientEvent('dmv:startttest',player)
	else
		-- vRPclient.notify(player,{"~r~Du har ikke råd."})
			TriggerClientEvent("pNotify:SendNotification", player,{text ="Du har ikke råd.", type = "error", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
	end
end)

RegisterServerEvent("dmv:ptcharge")
AddEventHandler("dmv:ptcharge", function()
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	if vRP.tryFullPayment({user_id,5000}) then
        TriggerClientEvent('dmv:startptest',player)
	else
		-- vRPclient.notify(player,{"~r~Du har ikke råd."})
			TriggerClientEvent("pNotify:SendNotification", player,{text ="Du har ikke råd.", type = "error", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
	end
end)

--[[ ***** SPAWN CHECK ***** ]]
RegisterServerEvent("dmv:LicenseStatus")
AddEventHandler("dmv:LicenseStatus", function()
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	MySQL.query("vRP/dmv_search", {id = user_id}, function(rows, affected)
        if #rows > 0 then
            TriggerClientEvent('dmv:CheckLicStatus',player)
        end
    end)
end)

--[[POLICE MENU]]--
local choice_asklc = {function(player,choice)
  vRPclient.getNearestPlayer(player,{10},function(nplayer)
    local nuser_id = vRP.getUserId({nplayer})
    if nuser_id ~= nil then
      -- vRPclient.notify(player,{"Spørger om kørekort"})
	  TriggerClientEvent("pNotify:SendNotification", player,{text ="Spørger om kørekort.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
      vRP.request({nplayer,"Vil du vise dit kørekort?",15,function(nplayer,ok)
        if ok then
          vRP.getUserIdentity({nuser_id, function(identity)
            if identity then
              -- display identity and business
              local name = identity.name
              local firstname = identity.firstname
              local age = identity.age
              local registration = identity.registration
              local license = "Nej"
              
              MySQL.query("vRP/dmv_search", {id = nuser_id}, function(rows, affected)
                if #rows > 0 then
                  license = "Ja"
                end
              end)

              vRP.getUserBusiness({nuser_id, function(business)
                if business then
                  bname = business.name
                  bcapital = business.capital
                end

                vRP.getUserAddress({nuser_id, function(address)
                  if address then
                    home = address.home
                    number = address.number
                  end

                  local content = "<em>Fornavn: </em>" .. firstname .. "<br /><em>Efternavn: </em>" .. name .. "<br /><em>Alder: </em>" .. age .. "<br /><em>CPR: </em>" .. registration .. "<br /><br /><em>Kørekort: </em>" .. license .. "<br />"
                  vRPclient.setDiv(player,{"police_identity",".div_police_identity{ background-color: rgba(0,0,0,0.75); color: white; font-weight: bold; width: 500px; padding: 10px; margin: auto; margin-top: 150px; }",content})
                  -- request to hide div
                  vRP.request({player, lang.police.menu.askid.request_hide(), 1000, function(player,ok)
                    vRPclient.removeDiv(player,{"police_identity"})
                  end})
                end})
              end})
            end
          end})
        else
          -- vRPclient.notify(player,{lang.common.request_refused()})
			TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.common.request_refused()}, type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
        end
      end})
    else
      -- vRPclient.notify(player,{lang.common.no_player_near()})
	  TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.common.no_player_near()}, type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
    end
  end)
end, "Check kørekort på nærmeste spiller."}

vRP.registerMenuBuilder({"police", function(add, data)
  local player = data.player

  local user_id = vRP.getUserId({player})
  if user_id ~= nil then
    local choices = {}

    -- build police menu
    if vRP.hasPermission({user_id,"police.askid"}) then
       choices["Tjek kørekort"] = choice_asklc
    end
	
    add(choices)
  end
end})