local function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 41, 11, 41, 60)    
    ClearDrawOrigin()
end


RegisterNetEvent('SyncClientTrap',function(name,f)
    if f == 1 then
        for key, value in pairs(SPOTS) do
            if value.name == name then
             value.started = false
             value.time = 600
            end
        end
    else 
      for key, value in pairs(SPOTS) do
        if value.name == name and value.recently_roobed == false then
         value.started = true

         value.recently_roobed = true

        end
      end

    end
end)

CreateThread(function ()
    while true do
        for k, v in pairs(SPOTS) do
            if v.started and v.time > 0 then
                v.time = v.time - 1
            end
        end
        Wait(1000)
    end
end)

CreateThread(function ()
    while true do
        Wait(500)
        for k, v in pairs(SPOTS) do
            if v.recently_roobed then
                Wait(600000 * 2)
                v.recently_roobed = false
            else
                Wait(1000)
            end
        end

    end
end)


CreateThread(function ()
    while true do
        local sleep = 50
        for key, value in pairs(SPOTS) do
            local coords = value.coords
            local label = value.label
            local label2 = value.use
            if #(coords - GetEntityCoords(PlayerPedId())) <= 3 then
                sleep = 1
                if value.started then
                    if value.time == 0 then
                        DrawText3D(coords.x,coords.y,coords.z,label2)
                        
                        if IsControlJustPressed(0,184) then
                        if  value.started then
                            TriggerServerEvent('TrapTakeMoney',value.name)
                        end
                        end
                    else 
                        DrawText3D(coords.x,coords.y,coords.z,'Time Left '..value.time..' Seconds')
                    end

                elseif not value.started and not value.recently_roobed then
                    DrawText3D(coords.x,coords.y,coords.z,label)
                    if IsControlJustPressed(0,184) then
                        if not value.started then
                            TriggerServerEvent('StartTrapServer',value.name)
                        end
                    end
                elseif not value.started and value.recently_roobed then
                    DrawText3D(coords.x,coords.y,coords.z,'Recently Robbed Wait A While')
                end


            end

        end
        Wait(sleep)
    end
end)
