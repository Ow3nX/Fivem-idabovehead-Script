local lastToggle = 0

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.UpdateInterval)
        if IsControlJustReleased(0, Config.ToggleKey) and (GetGameTimer() - lastToggle) > Config.AntiSpamDelay then
            Config.Enabled = not Config.Enabled
            lastToggle = GetGameTimer()
        end

        if Config.Enabled then
            local playerPed = PlayerId()
            local coords = GetEntityCoords(GetPlayerPed(-1))

            for _, id in pairs(GetActivePlayers()) do
                local targetPed = GetPlayerPed(id)
                local distance = GetDistanceBetweenCoords(coords, GetEntityCoords(targetPed), true)

                if distance <= Config.MaxDistance and NetworkIsPlayerActive(id) then
                    local screenX, screenY = GetScreenCoordFromWorldCoord(coords.x, coords.y, coords.z + 1.0)
                    local playerId = GetPlayerServerId(id)
                    local displayText = string.format(Config.DisplayFormat, playerId)
                    local textWidth, textHeight = GetTextScaleHeight(Config.FontSize, Config.Font)

                    DrawText3D(coords.x, coords.y, coords.z + 1.0, displayText, Config.TextColor.r, Config.TextColor.g, Config.TextColor.b, Config.TextColor.a, Config.FontSize)

                end
            end
        end
    end
end)

function DrawText3D(x, y, z, text, r, g, b, a, scale)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())

    if onScreen then
        SetTextScale(scale, scale)
        SetTextFont(Config.Font)
        SetTextProportional(1)
        SetTextColour(r, g, b, a)
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end