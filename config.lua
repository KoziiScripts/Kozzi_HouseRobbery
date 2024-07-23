Config = {}


Config.Locations = {                                  --- Coords of where the robbery can start
[1] = {x = 100.9632, y = -1912.1542, z = 21.4074},
[2] = {x = 72.0621, y = -1938.8481, z = 21.3692,},
[3] = {x = 38.8932, y = -1911.5696, z = 21.9535},
[4] = {x = -10.6354, y = -1883.8226, z = 24.1417},
[5] = {x = -327.9626, y = 369.6975, z = 110.0061},
[6] = {x = -560.9427, y = 402.5838, z = 101.8052},
[7] = {x = -32.3880, y = -1432.6283, z = 31.8823},
[8] = {x = -2.2928, y = -1442.0214, z = 30.9631},
[9] = {x = 314.9240, y = -1748.2456, z = 29.6305},
[10] = {x = 348.8853, y = -1820.9177, z = 28.8941}


}

Config.Options = 
{
    ThirdEye = 
    {
        label = "Break Into The House", -- Label when third eyed
        icon = "fa-solid fa-house" -- Icon when third eyed https://fontawesome.com/icons/ for the icons.
    },
    ProgressBar = 
       {
           duration = 5000, -- How long the ProgressBar will go on for in miliseconds
           label = "Breaking into the house", -- Label For ProgressBar
           useWhileDead = false,
           position = 'bottom',            --position of the ProgressBar
           canCancel = false,
           anim = {                            -- animation during the ProgressBar
               dict = 'mp_arresting',
               clip = 'a_uncuff'
           },
           disable = {    -- Disables movement
               move = true
           }
        },
    SkillCheck = 
        {
        difcuilty = { -- add as many as you want. Refer to https://overextended.dev/ox_lib/Modules/Interface/Client/skillcheck for the options
            'medium', 
            'medium', 
            'easy', 
            'medium'
        },
        keys = { -- Letters that will show up when skillcheck is active. Randomly chosen
            'w',
            'a',
            's',
            'd',
        }
        },
        Notify = {
            position = 'top',          ---- Position of where the notifiers will show
            showduration = true        ---- In the Notifier shows the duration
        }
        
}

Config.CoolDown = 60000   --- how long until the player can rob a house in ms

Config.Reward = 
    {   
 Items =  {                                                 -- The items they can get and there amounts
    {item = 'money', amount = {min = 20, max = 300}},
    {item = 'black_money', amount = {min = 20, max = 300}},
    {item = 'phone', amount = {min = 1, max = 1}},
    {item = "burger", amount = {min = 2, max = 5}},
    {item = "water", amount ={min = 2, max = 5}}
        },
 Reward = {1 , 3 }             ----- To pick X amount from above (Example can choose from 1 - 3 of the items above to give)
    }


Config.Ped = {
    Model =      -- Model Names
    {
        "g_m_m_mexboss_02",
        "g_m_m_korboss_01",
        "g_m_y_azteca_01",
        "g_m_m_armboss_01"
    },
    Chance = 45, -- A number that will be the % chance of a ped to spawn to attack the player, set to 0 if you want no ped
    Weapon = {                     --- Weapon Name
        "WEAPON_BAT", 
        "WEAPON_KNIFE",
        "WEAPON_PISTOL",
        "WEAPON_CROWBAR"
    }
}  


Config.Debug = false   ---  Add all the debuging tools that is used for the script.

Config.Ban = function()
                            ---- put your banning method in here (Server Sided ONlny)
end

Config.Police = 
{
    Chance = 30, ----- Calling The Police Chance
    Function = function()    --- Put Your Police Calling Method Here (Client Sided Only)

    end
}