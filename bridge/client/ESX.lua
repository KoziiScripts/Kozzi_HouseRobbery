if GetResourceState('es_extended') ~= 'started' then return end

RegisterNetEvent('esx:playerLoaded', function()
   spawnmarkers()
end)

