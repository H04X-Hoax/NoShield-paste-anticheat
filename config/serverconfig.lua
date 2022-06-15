
-- ImoShieldOnTop

-- Buy ImoShield stay safe


NoShield = {}

--[[


    ███╗  ██╗ █████╗  ██████╗██╗  ██╗██╗███████╗██╗     ██████╗    ██████╗███████╗██████╗ ██╗   ██╗███████╗██████╗ 
    ████╗ ██║██╔══██╗██╔════╝██║  ██║██║██╔════╝██║     ██╔══██╗  ██╔════╝██╔════╝██╔══██╗██║   ██║██╔════╝██╔══██╗
    ██╔██╗██║██║  ██║╚█████╗ ███████║██║█████╗  ██║     ██║  ██║  ╚█████╗ █████╗  ██████╔╝╚██╗ ██╔╝█████╗  ██████╔╝
    ██║╚████║██║  ██║ ╚═══██╗██╔══██║██║██╔══╝  ██║     ██║  ██║   ╚═══██╗██╔══╝  ██╔══██╗ ╚████╔╝ ██╔══╝  ██╔══██╗
    ██║ ╚███║╚█████╔╝██████╔╝██║  ██║██║███████╗███████╗██████╔╝  ██████╔╝███████╗██║  ██║  ╚██╔╝  ███████╗██║  ██║
    ╚═╝  ╚══╝ ╚════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝╚══════╝╚══════╝╚═════╝   ╚═════╝ ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝

]]

--# VERIFICATION #--
NoShield.Version = 1.0 -- DONT CHANGE!
NoShield.License = "NO-SHIELD_Q783FDJG7UWVTZMMG0PFVCD3" -- Insert your License Key

--# GENERAL CONFIG #--
NoShield.Servername = '🛡 NoShield 🛡' -- Your Server Name
NoShield.Banmessage = 'You have been banned by No-Shield Anticheat'
NoShield.KickMessage = 'You have been kicked by No-Shield Anticheat'

--# ANTI CIPHER #--
NoShield.AntiCipher = true -- Recommended to keep it true [ANTI CIPHER/BACKDOOR]
NoShield.Installer = true -- Recommended to keep it true [ANTI DUMP]

--# ANTI SKRIPT.GG #--
NoShield.AntiSkriptInject = true -- RECOMMENDED
NoShield.AntiTeleportToVoid = true -- RECOMMENDED
NoShield.AntiVehicleGrabber = true -- RECOMMENDED

--# ANTI ENTITY #--
NoShield.Entity = true -- Deletes the object after limit
NoShield.EntityKick = true -- Kick player after limit ex. if i spawn 6 cars i will get kicked
NoShield.EntityBan = false -- Ban player after limit ex. if i spawn 6 cars i will get banned
NoShield.EntityVehicle = true
NoShield.EntityVehicleLimit = 3
NoShield.EntityPed = true
NoShield.EntityPedLimit = 5
NoShield.EntityObject = true

--# ANTI EXPLOSIONS #--
NoShield.AntiExplosion = true -- Disables Explosion
NoShield.AntiExplosionKick = true -- want to get banned?
NoShield.AntiExplosionBan = true -- want to get banned?
NoShield.BlacklistedExplosions = {  -- Blacklisted Explosions
    1,
    2, 
    4, 
    5,
    25,
    31,
    29, 
    32, 
    33, 
    35, 
    36, 
    37, 
    38,
    39
}

--# ANTI WEAPON #--
NoShield.AntiGiveWeapon = true -- Anti Give Weapon to other Players
NoShield.AntiRemoveWeapon = true -- Anti Remove Weapon to other Players

--# ANTI PARTICLE #--
NoShield.AntiParticles = true
NoShield.AntiParticlesKick = true
NoShield.AntiParticlesBan = true
NoShield.AntiParticlesLimit = 5

NoShield.AntiJaillAll = true -- Your jail Event needs to be esx-qalle-jail:jailPlayer
NoShield.AntiJaillAllKick = true
NoShield.AntiJaillAllBan = true


--# EVENTS #--
NoShield.BlacklistedEvents = true
NoShield.BlacklistedEventsKick = true
NoShield.BlacklistedEventsBan = true
NoShield.BlacklistedEventsList = {
    'bringplayertome',
    'lester:vendita',
    'esx_ambulancejob:revive'
}
NoShield.MaxValuedEvents = { -- This can catch money spamming, on a vulnarable event, and can easily catch other event executions like these. Maxvalue means, if a player triggers a mavalued event, with an argument which is higer then maxvalue, the anticheat will block it.
	["esx_garbagejob:pay"] = {maxvalue=1000},
	["esx_pizza:pay"] = {maxvalue=1000},
	["esx_ranger:pay"] = {maxvalue=1000},
	["esx_truckerjob:pay"] = {maxvalue=1000},
	["esx_slotmachine:sv:2"] = {maxvalue=1000},
	["AdminMenu:giveBank"] = {maxvalue=1000},
	["AdminMenu:giveCash"] = {maxvalue=1000},
	["LegacyFuel:PayFuel"] = {maxvalue=1000},
	["fuel:pay"] = {maxvalue=1000},
	["esx_society:billing"] = {maxvalue=100000}                               -- Do {maxvalue=-1} if you only will get banned on -1 trigger. Good for Police triggers ;D
}

--# TRIGGER #--
NoShield.AntiSpamTrigger = true
NoShield.AntiSpamTriggerList = { -- This can catch money spamming, on a vulnarable event, and can easily catch other event executions like these. Maxvalue means, if a player triggers a mavalued event, with an argument which is higer then maxvalue, the anticheat will block it.
    { EVENT = "esx_policejob:handcuff",           MAX_TIME = 4  },
    { EVENT = "esx-qalle-hunting:reward",         MAX_TIME = 3  },
    { EVENT = "esx:giveInventoryItem",            MAX_TIME = 4  },
    { EVENT = "esx_billing:sendBill" ,            MAX_TIME = 3  },
    { EVENT = "esx_billing:sendBill" ,            MAX_TIME = 3  },
    { EVENT = "chatE3vent" ,                      MAX_TIME = 2  },
    { EVENT = "_chat:messageEntered3" ,           MAX_TIME = 2  },
    { EVENT = "playerDi3ed" ,                     MAX_TIME = 2  },
    { EVENT = "gcPhone:_internalAddMessage",      MAX_TIME = 4  },
    { EVENT = "gcPhone:tchat_channel",            MAX_TIME = 4  },
    { EVENT = "ServerValidEmote",                 MAX_TIME = 4  },
    { EVENT = "lester:vendita",                   MAX_TIME = 20 },
    { EVENT = "esx:confiscatePlayerItem",         MAX_TIME = 4  },
    { EVENT = "esx_vehicleshop:setVehicleOwned",  MAX_TIME = 4  },
    { EVENT = "LegacyFuel:PayFuel",               MAX_TIME = 4  },
    { EVENT = "CarryPeople:sync",                 MAX_TIME = 3  },
    { EVENT = "fuel:pay",      MAX_TIME = 3  }
}

--# BLACKLISTED EVENTS #--
NoShield.AntiCommunityServiceAll = true -- Your CommunityService Event needs to be 'esx_communityservice:sendToCommunityService
NoShield.AntiCommunityServiceAllKick = true
NoShield.AntiCommunityServiceAllBan = true


--# ANTI ANTICHEESE #--
NoShield.AntiAntiCheese = true

--# ANTI DPEMOTE ALL #--
NoShield.AntiDpemoteAll = true
NoShield.AntiDpemoteAllKick = false
NoShield.AntiDpemoteAllBan = true


--# ANTI POLICEJOB #--
NoShield.AntiPolicejobExploits = true
NoShield.AntiPolicejobExploitsKick = false
NoShield.AntiPolicejobExploitsBan = true


--# ANTI TACKLE EXPLOIT #--
NoShield.AntiTackleExploit = true
NoShield.AntiTackleExploitKick = false
NoShield.AntiTackleExploitBan = true


--# ANTI CARRY ALL #--
NoShield.AntiCarryExploit = true
NoShield.AntiCarryExploitKick = false
NoShield.AntiCarryExploitBan = true


--# DISCORDBOT EXPLOIT #--
NoShield.DiscordBotExploit = true
NoShield.DiscordBotExploitKick = false
NoShield.DiscordBotExploitBan = true


--# PICKUP EXPLOIT #--
NoShield.PickupExploit = true
NoShield.PickupExploitKick = false
NoShield.PickupExploitBan = true


--# KASHACTER EXPLOIT #--
NoShield.Kashacter = true
NoShield.KashacterKick = false
NoShield.KashacterBan = true


