fx_version "cerulean"
game "gta5"
lua54 "yes"
use_experimental_fxv2_oal "yes"
name "HapticLib"
author "Haptic"


version "1.1.2"

shared_scripts {
    "shared/*.lua",
}


client_scripts {
    "client/*.lua",
    "client/functions/*.lua"
}

server_scripts {
    "server/*.lua",
    "server/functions/*.lua"
}


escrow_ignore {
    -- Client
    'client/functions/HapticAdmin.lua', 
    'client/functions/blips.lua',  
    'client/functions/items.lua', 
    'client/functions/menus.lua',  
    'client/functions/notify.lua', 
    'client/functions/peds.lua',  
    'client/functions/shops.lua',  
    'client/functions/stash.lua',
    'client/functions/target.lua',
    'client/functions/utils.lua',
	'client/functions/LCCrafting.lua',
	'client/functions/xp.lua',
    -- Server
    'server/functions/HapticAdmin.lua',
    'server/functions/items.lua',
    'server/functions/items-jobs.lua',
    'server/functions/jobs.lua',
    'server/functions/LC-CityHall.lua',
	'server/functions/LCCrafting.lua',
    'server/functions/money.lua',
    'server/functions/notify.lua',
    'server/functions/shops.lua',
    'server/functions/stash.lua',
    'server/functions/utils.lua',
	 'server/functions/xp.lua',
    -- Shared
    'shared/config.lua',
    'shared/items-jobs.lua',
    'shared/shops.lua',
    'shared/stash.lua',
}

dependency '/assetpacks'