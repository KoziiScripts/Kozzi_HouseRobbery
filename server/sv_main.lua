local lastRobberyTimes = {}




lib.callback.register('Kozii_GetTimer', function(source, v)


    if lastRobberyTimes[v] == nil then return false end


    return lastRobberyTimes[v]
end)

local function GiveItem(source, item, amount)
    exports.ox_inventory:AddItem(source, item, amount)
    if Config.Debug == true then
    print("Given Item's to ID:", source)
    end
end

local function PickItems(source)
    local reward = math.random(Config.Reward.Reward[1], Config.Reward.Reward[2])
    local selectedItems = {}

    for i = 1, reward do
        local randomIndex = math.random(1, #Config.Reward.Items)
        local selectedItem = Config.Reward.Items[randomIndex]
        local randomAmount = math.random(selectedItem.amount.min, selectedItem.amount.max) 
        table.insert(selectedItems, { item = selectedItem.item, amount = randomAmount })
    end

    if Config.Debug == true then
        print("Selected items:")
        for _, item in ipairs(selectedItems) do
            print("Item:", item.item, "Amount:", item.amount)
        end
    end

    
    for _, item in ipairs(selectedItems) do
        GiveItem(source, item.item, item.amount)
    end
end


RegisterNetEvent('kozzi-houserobberyreward')
AddEventHandler('kozzi-houserobberyreward', function(coords, id)
    local source = source
    local playerPed = GetPlayerPed(source)
    local playerCoords = GetEntityCoords(playerPed)
    
    local distance = #(vec3(playerCoords.x, playerCoords.y, playerCoords.z) - vec3(coords.x, coords.y, coords.z))
    
    if distance <= 4.0 then
        PickItems(source)
        lastRobberyTimes[id] = GetGameTimer() - 50000
    else
    print("Player ID: "..source.. " somehow actived the robbery to far away, could be using a lua executor")
    Config.Ban()
    DropPlayer(source, "You Have Been Kicked")
        
    end
end)

