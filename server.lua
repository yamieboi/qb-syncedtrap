local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('StartTrapServer',function (i)
    if CheckPlayers() >= MinimumPlayers then
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
    else
        TriggerClientEvent('QBCore:Notify', source, 'Not enough active players..', 'error')
    end
end)
function CheckPlayers()
    local TotalPlayers = 0
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        TotalPlayers = TotalPlayers + 1
    end
    return TotalPlayers
end

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