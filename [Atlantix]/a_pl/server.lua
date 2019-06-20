local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")

Citizen.CreateThread(function()
    while true do

		local polis = vRP.getUsersByPermission({"police.service"})
		local taxis = vRP.getUsersByPermission({"ambulance.whitelisted"})
		local mechs = vRP.getUsersByPermission({"repair.service"})
		local staff = vRP.getUsersByPermission({"admin.tickets"})
		local krimi = vRP.getUsersByPermission({"drugseller.market"})

		TriggerClientEvent("trabajos:update", -1, #polis, #taxis, #mechs, #staff, #krimi)

		Citizen.Wait(100)
    end
end)