fx_version 'cerulean'
game 'gta5'

author 'Kozzi'
description 'Kozzi House Robbery Script'
version '1.0.0'


shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua',
}

client_scripts {
    'client/*.lua',
    'bridge/client/*.lua',
}



lua54 'yes'
use_experimental_fxv2_oal 'yes'
