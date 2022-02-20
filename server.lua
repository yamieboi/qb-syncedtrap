local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('StartTrapServer',function (i)
    TriggerClientEvent('SyncClientTrap',-1,i,0)
    TriggerClientEvent('QBCore:Notify', -1, ''..i..' Is Being Robbed! Fight For The Money..', 'error',15000)
    for key, v in pairs(SPOTS) do
        if v.name == i then
            if not v.started then
                v.started = true
                v.moneytaken = false
            end
        end
    end
end)


RegisterNetEvent('TrapTakeMoney',function (i)
    local Player = QBCore.Functions.GetPlayer(source)
   for key, v in pairs(SPOTS) do
       if v.name == i then
           if not v.moneytaken and v.started then
               v.moneytaken = true
               v.started = false
               Player.Functions.AddMoney("cash", v.money)
           end
       end
   end
   TriggerClientEvent('SyncClientTrap',-1,i,1)
end)