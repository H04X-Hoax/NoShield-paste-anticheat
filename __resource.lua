resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

author 'ImoShieldOnTop'
description 'Buy ImoShield'
version '1.0.0'

client_script {

    "client/client.lua",
    "config/clientconfig.lua",
    "config/webhooks.lua"

}

server_script {

    "server/server.lua",
    "config/serverconfig.lua",
    "config/webhooks.lua"

}

ui_page 'index.html'

files {
    'index.html',
    'onworddetection.js'
}