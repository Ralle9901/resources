local Proxy = module("vrp", "lib/Proxy")

RegisterServerEvent('paycheck:salary')
AddEventHandler('paycheck:salary', function()
  	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"police.paycheck") then
		vRP.giveMoney(user_id,2900)
		-- vRPclient.notify(source,{"Lønningsdag: 5000 DKK"})
		-- vRPclient.notify(source,{"Skat: -2100 DKK"})
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønseddel: 5000 DKK", type = "info", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Skat: -2100 DKK", type = "info", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
  
	elseif vRP.hasPermission(user_id,"emergency.paycheck") then
		vRP.giveMoney(user_id,2030)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønseddel: 3500 DKK", type = "info", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Skat: -1470 DKK", type = "info", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
  
	elseif vRP.hasPermission(user_id,"lawyer.paycheck") then
		vRP.giveMoney(user_id,2030)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønseddel: 3500 DKK", type = "info", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Skat: -1470 DKK", type = "info", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
  
	elseif vRP.hasPermission(user_id,"miner.paycheck") then
		vRP.giveMoney(user_id,870)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønseddel: 1500 DKK", type = "info", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Skat: -630 DKK", type = "info", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	
	elseif vRP.hasPermission(user_id,"bankdriver.paycheck") then
		vRP.giveMoney(user_id,870)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønseddel: 1500 DKK", type = "info", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Skat: -630 DKK", type = "info", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	
	elseif vRP.hasPermission(user_id,"repair.paycheck") then
		vRP.giveMoney(user_id,870)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønseddel: 1500 DKK", type = "info", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Skat: -630 DKK", type = "info", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	
	elseif vRP.hasPermission(user_id,"repairchef.paycheck") then
		vRP.giveMoney(user_id,870)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønseddel: 1500 DKK", type = "info", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Skat: -630 DKK", type = "info", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	
	elseif vRP.hasPermission(user_id,"taxi.paycheck") then
		vRP.giveMoney(user_id,1870)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønseddel: 1200 DKK", type = "info", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Skat: -504 DKK", type = "info", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	
	--elseif vRP.hasPermission(user_id,"bus.paycheck") then
		--vRP.giveMoney(user_id,696)
		--TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønseddel: 1200 DKK", type = "info", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		--TriggerClientEvent("pNotify:SendNotification", source,{text = "Skat: -504 DKK", type = "info", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	
	elseif vRP.hasPermission(user_id,"delivery.paycheck") then
		vRP.giveMoney(user_id,580)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønseddel: 1000 DKK", type = "info", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Skat: -420 DKK", type = "info", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	
	elseif vRP.hasPermission(user_id,"fisher.paycheck") then
		vRP.giveMoney(user_id,580)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønseddel: 1000 DKK", type = "info", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Skat: -420 DKK", type = "info", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	
	elseif vRP.hasPermission(user_id,"user.paycheck") then
		vRP.giveMoney(user_id,290)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Kontanthjælp: 500 DKK", type = "info", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Skat: -210 DKK", type = "info", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	end
end)