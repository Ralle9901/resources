--bind client tunnel interface
vRPbm = {}
Tunnel.bindInterface("vRP_basic_menu",vRPbm)
vRPserver = Tunnel.getInterface("vRP","vRP_basic_menu")
HKserver = Tunnel.getInterface("vrp_hotkeys","vRP_basic_menu")
BMserver = Tunnel.getInterface("vRP_basic_menu","vRP_basic_menu")
vRP = Proxy.getInterface("vRP")

