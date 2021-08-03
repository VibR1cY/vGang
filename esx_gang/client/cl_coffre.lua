local PlayerInventory, GangInventory = {}, {}

function openCoffreMenu(coffreGang)

    PlayerInventaire()
    GangStock(coffreGang.Coffre.SocietyCoffre)

    local menuCoffre = RageUI.CreateMenu("Coffre", ("Gang : %s"):format(coffreGang.JobGangName), nil, nil, nil, nil, 255, 0, 0, 0);
    local deposerItem = RageUI.CreateSubMenu(menuCoffre,"Mes Items", ("Gang : %s"):format(coffreGang.JobGangName));
    local prendreItem = RageUI.CreateSubMenu(menuCoffre,"Items Coffre", ("Gang : %s"):format(coffreGang.JobGangName));

    RageUI.Visible(menuCoffre, not RageUI.Visible(menuCoffre))

    while menuCoffre do
        Citizen.Wait(0)
        RageUI.IsVisible(menuCoffre, function()
            RageUI.Button(" ~r~> ~s~Déposer des objets", nil, { }, true, {}, deposerItem)
            RageUI.Button(" ~r~> ~s~Prendre des objets", nil, { }, true, {}, prendreItem)
        end)
        RageUI.IsVisible(deposerItem, function()
            for i = 1, #PlayerInventory do
                RageUI.Button((" ~r~> ~s~%s"):format(PlayerInventory[i].label), nil, { RightLabel = (" [~r~%s~s~]"):format(PlayerInventory[i].nombre) }, true, {
                    onSelected = function()
                        local valueDeposerItem = TextInfo("Nombre d'item ?", "", 20, false)
                        if valueDeposerItem ~= nil then
                            TriggerServerEvent("esx_gang:DeposerObjet", coffreGang, PlayerInventory[i].value, tonumber(valueDeposerItem))
                            PlayerInventaire()
                            GangStock(coffreGang.Coffre.SocietyCoffre)
                        else
                            ESX.ShowNotification("Merci de rentrer un nom d'item !")
                        end
                    end
                })
            end
        end)
        RageUI.IsVisible(prendreItem, function()
            for i = 1, #GangInventory do
                RageUI.Button((" ~r~> ~s~%s"):format(GangInventory[i].label), nil, { RightLabel = (" [~r~%s~s~]"):format(GangInventory[i].nombre) }, true, {
                    onSelected = function()
                        local valuePrendreItem = TextInfo("Nombre d'item ?", "", 20, false)
                        if valuePrendreItem ~= nil then
                            TriggerServerEvent("esx_gang:PrendreObjet", coffreGang, GangInventory[i].value, tonumber(valuePrendreItem))
                            PlayerInventaire()
                            GangStock(coffreGang.Coffre.SocietyCoffre)
                        else
                            ESX.ShowNotification("Merci de rentrer un nom d'item !")
                        end
                    end
                })
            end
        end)
        if not RageUI.Visible(menuCoffre) and not RageUI.Visible(deposerItem) and not RageUI.Visible(prendreItem) then
            FreezeEntityPosition(PlayerPedId(), false)
            menuCoffre = RMenu:DeleteType("menuCoffre", true)
        end
    end
end

function PlayerInventaire()
    ESX.TriggerServerCallback("esx_gang:PlayerInventaire", function(inventory)
        PlayerInventory = {}
        for i=1, #inventory.items, 1 do
            local item = inventory.items[i]
            if item.count > 0 then
                table.insert(PlayerInventory, {
                    label = item.label,
                    nombre = item.count,
                    value = item.name
                })
            end
        end
    end)
end

function GangStock(Society)
    ESX.TriggerServerCallback("esx_gang:GangStock", function(items)
        GangInventory = {}
        for i=1, #items, 1 do
            if (items[i].count ~= 0) then
                table.insert(GangInventory, {
                    label = items[i].label,
                    nombre = items[i].count,
                    value = items[i].name,
                })
            end
        end
    end, Society)
end