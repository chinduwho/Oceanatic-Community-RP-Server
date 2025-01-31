--[[Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
    
        local playerPed = GetPlayerPed(-1)
        local playerVeh = GetVehiclePedIsIn(playerPed, false)

        if DoesEntityExist(playerVeh) then
            DisplayRadar(true)
        else
            DisplayRadar(false)
            SetRadarBigmapEnabled(true, true)
            DisplayRadar(false)
            SetRadarBigmapEnabled(false, true)
        end
    end
end)]]

Citizen.CreateThread(function()
    local isSniper = false
    while true do
        Citizen.Wait(0)

        local ped = GetPlayerPed(-1)

        
        --print(GetHashKey("WEAPON_SNIPERRIFLE"))
        local currentWeaponHash = GetSelectedPedWeapon(ped)

        if currentWeaponHash == 100416529 then
            isSniper = true
        elseif currentWeaponHash == 205991906 then
            isSniper = true
        elseif currentWeaponHash == -952879014 then
            isSniper = true
        elseif currentWeaponHash == GetHashKey('WEAPON_HEAVYSNIPER_MK2') then
            isSniper = true
        else
            isSniper = false
        end

        if not isSniper then
            HideHudComponentThisFrame(14)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if GetPlayerWantedLevel(PlayerId()) ~= 0 then
            SetPlayerWantedLevel(PlayerId(), 0, false)
            SetPlayerWantedLevelNow(PlayerId(), false)
        end
    end
end)
