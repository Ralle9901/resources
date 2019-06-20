vRPlyd = {}
Tunnel.bindInterface("vrp_lyd",vRPlyd)
vRPserver = Tunnel.getInterface("vRP","vrp_lyd")
VDserver = Tunnel.getInterface("vrp_lyd","vrp_lyd")
vRP = Proxy.getInterface("vRP")

local key = 213 -- https://wiki.fivem.net/wiki/Controls
local voice = 1

function vRPlyd.setTalkerProxity(distance)
	NetworkSetTalkerProximity(distance) -- set range
end

Citizen.CreateThread(function()
 	while true do
 		Citizen.Wait(0)
 		if IsControlJustPressed(1, key) then 
 			voice = voice + 1
			if voice > 3 then voice = 1 end
			VDserver.setVoiceDisplay({false,voice})
 		end
 	end
end)