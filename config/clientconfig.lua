

-- ImoShieldOnTop

-- Buy ImoShield stay safe
NoShield = {}

--[[
    
    ███╗  ██╗ █████╗  ██████╗██╗  ██╗██╗███████╗██╗     ██████╗    █████╗ ██╗     ██╗███████╗███╗  ██╗████████╗
    ████╗ ██║██╔══██╗██╔════╝██║  ██║██║██╔════╝██║     ██╔══██╗  ██╔══██╗██║     ██║██╔════╝████╗ ██║╚══██╔══╝
    ██╔██╗██║██║  ██║╚█████╗ ███████║██║█████╗  ██║     ██║  ██║  ██║  ╚═╝██║     ██║█████╗  ██╔██╗██║   ██║   
    ██║╚████║██║  ██║ ╚═══██╗██╔══██║██║██╔══╝  ██║     ██║  ██║  ██║  ██╗██║     ██║██╔══╝  ██║╚████║   ██║   
    ██║ ╚███║╚█████╔╝██████╔╝██║  ██║██║███████╗███████╗██████╔╝  ╚█████╔╝███████╗██║███████╗██║ ╚███║   ██║   
    ╚═╝  ╚══╝ ╚════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝╚══════╝╚══════╝╚═════╝    ╚════╝ ╚══════╝╚═╝╚══════╝╚═╝  ╚══╝   ╚═╝   

]]

NoShield.Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118, ["INSERT"] = 121
}


--# PREMIUM #--
NoShield.AntiFlyAroundInVehicle = true -- Be careful, it also detects if someone rides in a bike and jumps
NoShield.AntiNoClip = true -- Anti NoClip
NoShield.AntiInvisible = true -- Anti Invisibility
NoShield.AntiInvisibility = true -- Anti Invisibility [2]
NoShield.AntiVPN = true -- Anti VPN
NoShield.AntiInjection = true -- Detects Injcetions of most Mod Menus
NoShield.AntiDamageModifier = true -- Anti Damage Modifier
NoShield.AntiFreecam = true -- ANTI FREECAM
NoShield.AntiTeleport = true -- Anti Teleport

--# GENERAL #--
NoShield.SuperJump = true
NoShield.AntiSpectate = true -- Anti Spectate
NoShield.AntiInfiniteStamina = true -- Anti Infinite Stamina
NoShield.AntiRagdoll = true -- Anti Ragdoll
NoShield.AntiVehicleplatechange = true -- Anti Vehicle Plate Change
NoShield.AntiNuiDevtools = true -- Anti Nui Dev
NoShield.AntiBlips = true 
NoShield.AntiDamageModifier = true

--# GODMODE #--
NoShield.AntiEulenGodmode = true
NoShield.AntiGodMode2 = true
NoShield.AntiGodMode3 = true

--# ANTI START/STOP #--
--# I Recommend AntiStarter because it Detects the Most Executor! #--
NoShield.AntiStopper = true -- Disables stopping cheater from stopping other scripts. YOU ARE NOT ALLOWED TO START/STOP/RESTART/ENSURE ANY SCRIPT, ELSE EVERYONE GETS BANNED!
NoShield.AntiStarter = true -- Disables stopping cheater from starting other scripts. YOU ARE NOT ALLOWED TO START/STOP/RESTART/ENSURE ANY SCRIPT, ELSE EVERYONE GETS BANNED!
NoShield.WhitelistedResources = {
    "",
    ""
}

--# ONSCREENMENUDETECTION #--
NoShield.OnScreenMenuDetection = true
NoShield.OSMDCheckingTime = 30000 -- Checks for screen menus every 30 secs (Recommended to leave this right here otherwise you'll get a lot of lag and high CPU usage)
NoShield.BlacklistedMenuWords = { -- (OnScreenMenuDetection) Words to check
	"fallout", "godmode", "Godmode", "god mode", "modmenu", "esx money", "give armor", "Aim Lock","Aimbot", "Troll", "Esp", "trigger", "triggerbot", "rage bot", "ragebot", "rapidfire", "fuck server", "freecam", "execute", "superjump", "noclip", "hack", "super run",
	"lynx", "absolute", "ckgangisontop", "lumia1", "ISMMENU", "HydroMenu", "TAJNEMENUMenu", "rootMenu", "Outcasts666", "WaveCheat", "NacroxMenu", "MarketMenu", "topMenu", "FlexSkazaMenu", "SidMenu", "Crown", "Lynx8", "LynxEvo", "Maestro",
	"Tiago", "Brutan", "redEngine", "Unex", "Eulen", "HamMafia", "HamHaxia", "Dopamine", "Dopameme", "redMENU", "falcon", "Desudo", "Onion", "explode", "rape", "Ciao", "Anticheat", "Tapatio", "Particle", "Malossi", "Nisi", "ATG", "RedStonia",
	"Chocohax", "Inyection", "Inyected", "Dumper", "LUA Executor", "Executor", "Skid", "HoaX", "inSec", "Reaper", "Lux", "Event Blocker", "Cheats", "Cheat", "Destroyer", "Spectate", "Wallhack", "Exploit", "triggers", "crosshair", "Explosive",
	"Alokas66", "Hacking System!", "Infinity", "Online Players", "Panic Button", "Destroy Menu", "Self Menu", "Server IP", "Teleport To", "Give Single Weapon", "Airstrike Player", "Taze Player", "Toga", "Magneto"
}

--# VISION #--
NoShield.AntiVision = true  -- Anti Vision | If you are using a Helicopter with Camera and Visions it should be false
NoShield.AntiNightVision = true  -- Anti Night Vision | Anti Vision shuold be true
NoShield.AntiThermalVision = true -- Anti Thermal Vision | Anti Vision shuold be true

--# WEAPON #--
NoShield.AntiInfiniteAmmo = true -- checks if player has infinite ammo
NoShield.AntiWeaponPickup = true
NoShield.AntiExplosionBullet = true
NoShield.BlacklistedWeapons = true -- Do you want Blacklisted Weapons?
NoShield.BlacklistedWeaponsBan = true -- Do you want to ban them?
NoShield.BlacklistedWeaponsList = { -- List of Blacklisted Weapons
    'WEAPON_RPG',
    'WEAPON_MINIGUN'
}

--# VEHICLE #--
NoShield.VehicleGodMode = true -- TYPE 2
NoShield.VehiclePowerIncrease = true -- TYPE 3
NoShield.VehicleSpeedHack = true -- TYPE 5
NoShield.AntiRemoveFromCar = true -- Anti Remove Other Players of Vehicle
NoShield.BlacklistedVehicles = true -- Do you want Blacklisted Vehicles ?
NoShield.BlacklistedVehiclesBan = true -- Do you want to ban them?
NoShield.BlacklistedVehiclesList = { -- List of Blacklisted Vehicles 
    'RHINO',
    'HYDRA',
    'BOMBUSHKA',
    'JET',
    'MONSTER',
    'FREIGHT',
    'BUS',
    'BULLDOZER'
}

--# BLACKLISTKEY #--
NoShield.BlacklistedKey = true
NoShield.BlacklistedKeyScreenshot = true
NoShield.BlacklistedKeyKick = false
NoShield.BlacklistedKeyList = {

	{id = "INSERT" ,         value = 121},
    {id = "PAGEUP",        value = 10},
    {id = "TAB",        value = 37},

}


Noshield.AntiDamageModifier = true -- Detects if a player tries to modify his damage or defence value
Noshield.AntiDamageChanger = true -- Detects if a player tries to modify his damage or defence value

Noshield.WeaponDamages = {
	[-1357824103] = { damage = 34, name = "AdvancedRifle"}, -- AdvancedRifle
    [453432689] = { damage = 26, name = "Pistol"}, -- Pistol
    [1593441988] = { damage = 27, name = "CombatPistol"}, -- CombatPistol
    [584646201] = { damage = 25, name = "APPistol"}, -- APPistol
    [-1716589765] = { damage = 51, name = "Pistol50"}, -- Pistol50
    [-1045183535] = { damage = 160, name = "Revolver"}, -- Revolver
    [-1076751822] = { damage = 28, name = "SNSPistol"}, -- SNSPistol
    [-771403250] = { damage = 40, name = "HeavyPistol"}, -- HeavyPistol
    [137902532] = { damage = 34, name = "VintagePistol"}, -- VintagePistol
    [324215364] = { damage = 21, name = "MicroSMG"}, -- MicroSMG
    [736523883] = { damage = 22, name = "SMG"}, -- SMG
    [-270015777] = { damage = 23, name = "AssaultSMG"}, -- AssaultSMG
    [-1121678507] = { damage = 22, name = "MiniSMG"}, -- MiniSMG
    [-619010992] = { damage = 27, name = "MachinePistol"}, -- MachinePistol
    [171789620] = { damage = 22, name = "CombatPDW"}, -- CombatPDW
    [487013001] = { damage = 58, name = "PumpShotgun"}, -- PumpShotgun
    [2017895192] = { damage = 40, name = "SawnoffShotgun"}, -- SawnoffShotgun
    [-494615257] = { damage = 32, name = "AssaultShotgun"}, -- AssaultShotgun
    [-1654528753] = { damage = 14, name = "BullpupShotgun"}, -- BullpupShotgun
    [984333226] = { damage = 117, name = "HeavyShotgun"}, -- HeavyShotgun
    [-1074790547] = { damage = 30, name = "AssaultRifle"}, -- AssaultRifle
    [-2084633992] = { damage = 32, name = "CarbineRifle"}, -- CarbineRifle
    [-1063057011] = { damage = 32, name = "SpecialCarbine"}, -- SpecialCarbine
    [2132975508] = { damage = 32, name = "BullpupRifle"}, -- BullpupRifle
    [1649403952] = { damage = 34, name = "CompactRifle"}, -- CompactRifle
    [-1660422300] = { damage = 40, name = "MG"}, -- MG
    [2144741730] = { damage = 45, name = "CombatMG"}, -- CombatMG
    [1627465347] = { damage = 34, name = "Gusenberg"}, -- Gusenberg
    [100416529] = { damage = 101, name = "SniperRifle"}, -- SniperRifle
    [205991906] = { damage = 216, name = "HeavySniper"}, -- HeavySniper
    [-952879014] = { damage = 65, name = "MarksmanRifle"}, -- MarksmanRifle
    [1119849093] = { damage = 30, name = "Minigun"}, -- Minigun
    [-1466123874] = { damage = 165, name = "Musket"}, -- Musket
    [911657153] = { damage = 1, name = "StunGun"}, -- StunGun
    [1198879012] = { damage = 10, name = "FlareGun"}, -- FlareGun
    [-598887786] = { damage = 220, name = "MarksmanPistol"}, -- MarksmanPistol
    [1834241177] = { damage = 30, name = "Railgun"}, -- Railgun
    [-275439685] = { damage = 30, name = "DoubleBarrelShotgun"}, -- DoubleBarrelShotgun
    [-1746263880] = { damage = 81, name = "Double Action Revolver"}, -- Double Action Revolver
    [-2009644972] = { damage = 30, name = "SNS Pistol Mk II"}, -- SNS Pistol Mk II
    [-879347409] = { damage = 200, name = "Heavy Revolver Mk II"}, -- Heavy Revolver Mk II
    [-1768145561] = { damage = 32, name = "Special Carbine Mk II"}, -- Special Carbine Mk II
    [-2066285827] = { damage = 33, name = "Bullpup Rifle Mk II"}, -- Bullpup Rifle Mk II
    [1432025498] = { damage = 32, name = "Pump Shotgun Mk II"}, -- Pump Shotgun Mk II
    [1785463520] = { damage = 75, name = "Marksman Rifle Mk II"}, -- Marksman Rifle Mk II
    [961495388] = { damage = 40, name = "Assault Rifle Mk II"}, -- Assault Rifle Mk II
    [-86904375] = { damage = 33, name = "Carbine Rifle Mk II"}, -- Carbine Rifle Mk II
    [-608341376] = { damage = 47, name = "Combat MG Mk II"}, -- Combat MG Mk II
    [177293209] = { damage = 230, name = "Heavy Sniper Mk II"}, -- Heavy Sniper Mk II
    [-1075685676] = { damage = 32, name = "Pistol Mk II"}, -- Pistol Mk II
    [2024373456] = { damage = 25, name = "SMG Mk II"} -- SMG Mk II
}