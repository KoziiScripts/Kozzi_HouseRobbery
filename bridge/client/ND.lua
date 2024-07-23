if GetResourceState('ND_Core') ~= 'started' then return end


AddEventHandler("ND:characterLoaded", function()
    spawnmarkers()
end)