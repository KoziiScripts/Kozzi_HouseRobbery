if GetResourceState('ox_core') ~= 'started' then return end

AddEventHandler('ox:playerLoaded', function() 
    spawnmarkers()
end)