
local function CallPolice()
    chance = math.random(1,100)

    if chance <= Config.Police.Chance then
        Config.Police.Function()
    end

end

local function spawnped(coords)

    local modelIndex = math.random(1, #Config.Ped.Model)
    local model = Config.Ped.Model[modelIndex]
    local pedModel = GetHashKey(model) 

    
    RequestModel(pedModel)
    while not HasModelLoaded(pedModel) do
        Wait(1)
    end

  
    local ped = CreatePed(4, pedModel, coords.x, coords.y, coords.z, 0.0, true, false)


    SetPedCombatAttributes(ped, 46, true)  
    SetPedCombatAbility(ped, 100)          
    SetPedCombatMovement(ped, 2)           
    SetPedCombatRange(ped, 2)              
    SetPedAlertness(ped, 3)                
    SetPedSeeingRange(ped, 100.0)          
    SetPedHearingRange(ped, 100.0)         
    SetPedFleeAttributes(ped, 0, 0)        


    local weaponindex = math.random(1, #Config.Ped.Weapon)
    local weapon = Config.Ped.Weapon[weaponindex]
    
    GiveWeaponToPed(ped, GetHashKey(weapon), 250, false, true)
    SetEntityHealth(ped, 200)


    local player = PlayerPedId()
    TaskCombatPed(ped, player, 0, 16)


    SetModelAsNoLongerNeeded(pedModel)
    if Config.Debug then
        print(string.format("Ped has spawned at x: %f, y: %f, z: %f with %s", coords.x, coords.y, coords.z, weapon))
    end
end

local function Sucesss(id, coords)
    CallPolice()
    lib.progressCircle(
        Config.Options.ProgressBar
    )
    ClearPedTasksImmediately(PlayerPedId())
    lib.notify({
        id = 'houserobberysucess',
        title = 'Sucesss',
        description = 'You have stolen some goods from the house',
        showDuration = Config.Options.Notify.showduration,
        position = Config.Options.Notify.position,
        style = {
            backgroundColor = '#141517',
            color = '#C1C2C5',
            ['.description'] = {
              color = '#909296'
            }
        },
        icon = 'fa-solid fa-check',
        iconColor = '#30c555'
    })

    TriggerServerEvent('kozzi-houserobberyreward', coords, id)
    local chance = math.random(1,100)
    if chance <= Config.Ped.Chance then
        spawnped(coords)
    else
        return
    end
    
end

local function BreakingIn(id, coords)
    lib.requestAnimDict(Config.Options.ProgressBar.anim.dict)        
    TaskPlayAnim(PlayerPedId(), Config.Options.ProgressBar.anim.dict, Config.Options.ProgressBar.anim.clip, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
    RemoveAnimDict(Config.Options.ProgressBar.anim.dict)
          
    local success = lib.skillCheck(Config.Options.SkillCheck.difcuilty, Config.Options.SkillCheck.keys)
   
    if success == true then
        Sucesss(id, coords)
       
    else
        ClearPedTasksImmediately(PlayerPedId())
        lib.notify({
            id = 'houserobberyfailed',
            title = 'You Failed',
            description = 'Your hand cramped and you dropped the tools',
            showDuration = Config.Options.Notify.showduration,
            position = Config.Options.Notify.position,
            style = {
                backgroundColor = '#141517',
                color = '#C1C2C5',
                ['.description'] = {
                  color = '#909296'
                }
            },
            icon = 'ban',
            iconColor = '#C53030'
        })

    end
end

function spawnmarkers()
    for k, v in pairs(Config.Locations) do

        exports.ox_target:addSphereZone({
            coords = vec3(v.x, v.y, v.z),
            radius = 2,
            debug = Config.Debug,
            options = {
                {
                    label = Config.Options.ThirdEye.label,
                    icon = Config.Options.ThirdEye.icon,
                    distance = 2.1,
                    onSelect = function()
                    
                    local lastrobbery = lib.callback.await('Kozii_GetTimer', false, k)
                    
    
                    if lastrobbery == false or  GetGameTimer() > lastrobbery + Config.CoolDown then
                        BreakingIn(k, v)
                    elseif GetGameTimer() < lastrobbery + Config.CoolDown  then
                            lib.notify({
                                id = 'houserobberycooldown',
                                title = 'Hold Up',
                                description = 'This house Looks like it has been attempted to be broken into. Maybe come back later',
                                showDuration = Config.Options.Notify.showduration,
                                position = Config.Options.Notify.position,
                                style = {
                                    backgroundColor = '#141517',
                                    color = '#C1C2C5',
                                    ['.description'] = {
                                      color = '#909296'
                                    }
                                },
                                icon = 'ban',
                                iconColor = '#C53030'
                            })
                            return
                          end
                
                        
                       
                    end
                }
            }
        })
    end
end

AddEventHandler('onResourceStart', function()
  spawnmarkers()
end)
