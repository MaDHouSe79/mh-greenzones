--[[ ===================================================== ]] --
--[[            MH Greenzone Script by MaDHouSe            ]] --
--[[ ===================================================== ]] --
fx_version 'cerulean'
game 'gta5'

author 'MaDHouSe'
description 'MH Greenzone - anti vdm.'
version '1.0'
lua54 'yes'

shared_scripts {
    'config.lua',
}

client_script {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/main.lua',
}

server_script {
    'server/update.lua',
}