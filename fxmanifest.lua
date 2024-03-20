fx_version 'cerulean'
game 'gta5'
lua54 'yes'
use_experimental_fxv2_oal 'yes'

dependencies {
    'es_extended',
    'ox_lib',
    'ox_inventory'
}

shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'shared.lua'
}

client_script 'client.lua'
server_script 'server.lua'

files {
    'locales/*.json',
    'data/*.lua'
}