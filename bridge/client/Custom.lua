  if GetResourceState('YOUR_FRAMEWORK_FILE_NAME') ~= 'started' then return end
  
  RegisterNetEvent('esx:playerLoaded', function()   ----- YOUR FUNCTIONS TO SPAWN 3RD EYE ON PLAYER LOAD
     spawnmarkers()         ---- SPAWNS THIRD EYES ON START UP
  end)

