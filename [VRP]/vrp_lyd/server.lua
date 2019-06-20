local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
local cfg = module("vrp_lyd", "cfg/display")
vRPlyd = {}
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_lyd")
VDclient = Tunnel.getInterface("vrp_lyd","vrp_lyd")
Tunnel.bindInterface("vrp_lyd",vRPlyd)

function vRPlyd.setVoiceDisplay(player,volume)
	if not player then player = source end
	vRPclient.setDiv(player,{"voice_text",cfg[volume].css,cfg[volume].text})
    -- vRPclient.setDiv(player,{"voice_icon",cfg[volume].css,cfg[volume].text})
	VDclient.setTalkerProxity(player,{cfg[volume].distance})
end

AddEventHandler("vRP:playerSpawn",function(user_id, source, first_spawn)
	vRPlyd.setVoiceDisplay(source,1)
end)