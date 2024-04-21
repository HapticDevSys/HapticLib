fx_version "cerulean"
game "gta5"
lua54 "yes"
use_experimental_fxv2_oal "yes"
name "HapticLib"
author "Haptic"


version "1.0.0"

shared_script "shared/*.lua"


client_scripts {
    "client/*.lua",
    "client/functions/*.lua"
}

server_scripts {
    "server/*.lua",
    "server/functions/*.lua"
}

dependency '/assetpacks'