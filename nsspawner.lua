





function DrawCars(x,y,z, text)

	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
			
	SetTextScale(0.35, 0.35)
	SetTextFont(4)
	SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text)) / 370
	DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end



Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(3)

        local dist = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -19.861301422119, -1823.5178222656, 25.784687042236, true)

        if dist < 4 then 

            DrawCars(-19.861301422119, -1823.5178222656, 25.784687042236 +0.10,'[~r~E~w~] - Bike Spawner]')


        if IsControlJustReleased(0, 38) then
            SetEntityCoords(PlayerPedId(), -19.861301422119, -1823.5178222656, 25.784687042236) 

            spawnbmw("bmx")

    end
    end
end
end)



function spawnbmw(bmwspawner)

RequestModel(GetHashKey(bmwspawner))

Citizen.CreateThread(function()

        local cartimer = 0
        while not HasModelLoaded(GetHashKey(bmwspawner)) do
            cartimer = cartimer + 100.0
            Citizen.Wait(100.0)
            if cartimer > 5000 then
                print("nope")
                break
            end
        end

        SpawnedCar = CreateVehicle(GetHashKey(bmwspawner), GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), true, true)
        SetPedIntoVehicle(PlayerPedId(), SpawnedCar, -1)
        SetVehicleNumberPlateText(SpawnedCar, "Spawn")
    end)
end
