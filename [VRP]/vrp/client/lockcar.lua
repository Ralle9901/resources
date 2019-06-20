Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)
    local ped = GetPlayerPed(-1)
      if IsControlPressed(0,303) then
        if tvRP.getNearestOwnedVehicle(5) ~= null then
          local veh = "car"
          local veh = "bike"
          if not ok then
            tvRP.vc_toggleLock(veh)
            Citizen.Wait(2000)
          else
			Citizen.Wait(2000)
          end
      end
    end
  end
end)