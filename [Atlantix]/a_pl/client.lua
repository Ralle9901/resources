Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(100)
        SendNUIMessage({
            show = IsPauseMenuActive(),
            policias = polis,
            taxistas = taxis,
            mecanicos = mechs,
			staffs = staff,
			kriminelle = krimi,
        })
    end
end)

RegisterNetEvent("trabajos:update")
AddEventHandler("trabajos:update", function(rpolis, rtaxis, rmechs, rstaff, rkrimi)
    polis = rpolis
    taxis = rtaxis
    mechs = rmechs
	staff = rstaff
	krimi = rkrimi
end)