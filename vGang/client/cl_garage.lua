function openGarageMenu(garageGang)
    local menuGarage = RageUI.CreateMenu("Garage", ("Gang : %s"):format(garageGang.JobGangName), nil, nil, nil, nil, 255, 0, 0, 0);

    RageUI.Visible(menuGarage, not RageUI.Visible(menuGarage))

    while menuGarage do
        Citizen.Wait(0)
        RageUI.IsVisible(menuGarage, function()
            for k,v in pairs(garageGang.Garage.Vehicule) do
                if v.stock == 0 then
                    RageUI.Button((" ~r~> ~s~%s"):format(v.name), nil, {}, false, {})
                else
                    RageUI.Button((" ~r~> ~s~%s"):format(v.name), nil, { RightLabel = ("[~r~%s~s~]"):format(tostring(v.stock)) }, true, {
                        onSelected = function()
                            TriggerServerEvent("esx_gang:stockVehicule", garageGang, v)
                            RageUI.CloseAll()
                            v.stock = v.stock - 1
                            local coords = GetEntityCoords(PlayerPedId())
                            local heading = GetEntityHeading(PlayerPedId())
                            local vehicleHash = GetHashKey(v.label)
                            RequestModel(vehicleHash)
                            while not HasModelLoaded(vehicleHash) do
                                Citizen.Wait(0)
                            end
                            local Vehicule = CreateVehicle(vehicleHash, coords.x, coords.y, coords.z, heading, true, true)
                            TaskWarpPedIntoVehicle(PlayerPedId(), Vehicule, -1)
                            local r,g,b = table.unpack(v.color)
                            SetVehicleCustomPrimaryColour(Vehicule, r,g,b)
                            SetVehicleCustomSecondaryColour(Vehicule, r,g,b)
                            ESX.ShowNotification(("Vous venez de sortir une : ~b~%s~s~, il en reste : ~r~%s ~s~!"):format(v.name, tostring(v.stock)))
                        end
                    })
                end
            end
        end)
        if not RageUI.Visible(menuGarage) then
            FreezeEntityPosition(PlayerPedId(), false)
            menuGarage = RMenu:DeleteType("menuGarage", true)
        end
    end
end
