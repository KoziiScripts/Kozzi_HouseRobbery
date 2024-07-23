if GetResourceState('qb-core') ~= 'started' then return end

AddEventHandler('QBCore:Client:OnPlayerLoaded', function() 
    spawnmarkers()
end)