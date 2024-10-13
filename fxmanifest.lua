fx_version 'adamant'
game 'gta5'
description 'Haunted House'
author 'Envision'
version '1.0.0'
client_scripts {
    "@ox_lib/init.lua",
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/PolyZone.lua',
    "config.lua",
    "client/**.lua"
}
server_scripts {
    "config.lua",
    "server/**.lua"
}
lua54 'yes'