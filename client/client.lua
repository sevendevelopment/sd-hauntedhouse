local QBCore = exports['qb-core']:GetCoreObject()

local npcLocations = {
    vector4(-1569.3, 194.95, 59.25, 108.91),  -- Room 104
    vector4(-1576.12, 228.16, 59.25, 208.61),  -- Room 109
    vector4(-1601.29, 210.64, 59.25, 321.9),  -- Room 107
    vector4(-1588.04, 182.85, 63.46, 336.0),  -- Room 205
    vector4(-1568.99, 230.75, 63.46, 236.27),  -- Room 210
    vector4(-1580.72, 219.13, 63.65, 188.78),  -- Floor 2 hallway
    vector4(-1573.55, 211.88, 67.65, 26.61),  -- Floor 3 middle toilet
    vector4(-1592.29, 205.59, 67.66, 23.07),  -- Room 306
    vector4(-1550.94, 203.21, 67.66, 115.87),  -- Room 302
}

-- Put your ped models here!
local npcModels = {
    "FreddyKrueger",    -- Freddy
    "Jason",     -- Jason
    "Skeleton",    -- Skeleton
    "mp_m_marston_01",          -- Half man
    "mp_m_niko_01",          -- Niko
    "s_m_m_movalien_01",          -- Alien
    "s_m_y_clown_01",          -- Clown
    "u_f_y_corpse_01",          -- Corpse
    "SlenderMan"          -- Slender
}

local npcs = {}
local collectedNPCs = {}

local function loadModel(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(100)
    end
end

local function playCreepyEmotes(ped)
    local scaryEmotes = {
        "WORLD_HUMAN_BUM_STANDING",
        "WORLD_HUMAN_STAND_IMPATIENT",
    }

    local randomEmote = scaryEmotes[math.random(#scaryEmotes)]
    TaskStartScenarioInPlace(ped, randomEmote, 0, true)

    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
end

function AttackEffect()
    StartScreenEffect("DrugsMichaelAliensFightIn", 3.0, 0)
    Wait(math.random(5000, 8000))
    StartScreenEffect("DrugsMichaelAliensFight", 3.0, 0)
    Wait(math.random(5000, 8000))
    StartScreenEffect("DrugsMichaelAliensFightOut", 3.0, 0)
    StopScreenEffect("DrugsMichaelAliensFightIn")
    StopScreenEffect("DrugsMichaelAliensFight")
    StopScreenEffect("DrugsMichaelAliensFightOut")
end

local function spawnHauntedNpcs()
    for i, loc in pairs(npcLocations) do
        local pedModel = npcModels[i]
        loadModel(pedModel)

        local ped = CreatePed(4, pedModel, loc.x, loc.y, loc.z, loc.w, false, true)
        SetEntityHeading(ped, loc.w)
        SetBlockingOfNonTemporaryEvents(ped, true)
        playCreepyEmotes(ped)
        table.insert(npcs, ped)
        exports['qb-target']:AddTargetEntity(ped, {
            options = {
                {
                    label = "Collect Item",
                    action = function()
                        if collectedNPCs[ped] then
                            TriggerEvent('QBCore:Notify', 'You have already spoken to this Ghoul!', 'error')
                            return
                        end

                        local randomChance = math.random(1, 2)

                        if randomChance == 1 then
                            TriggerServerEvent('sd-hauntedhouse:giveItem')
                            TriggerEvent('QBCore:Notify', 'You collected a Ghoul token!', 'success')
                        else
                            local playerPed = PlayerPedId()
                            local currentHealth = GetEntityHealth(playerPed)
                            local newHealth = math.floor(currentHealth / 2)
                            SetEntityHealth(playerPed, newHealth)
                            ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.0)
                            TriggerEvent('QBCore:Notify', 'You got attacked by the Ghoul!!!', 'error')
                            AttackEffect()
                        end
                        collectedNPCs[ped] = true
                    end,
                    icon = "fas fa-ghost",
                }
            },
            distance = 2.0
        })
    end
end

local function spawnTraderNpc()
    local traderLocation = vector3(-1571.11, 178.21, 57.1)
    loadModel("ig_bankman")

    local traderPed = CreatePed(4, "ig_bankman", traderLocation.x, traderLocation.y, traderLocation.z, 207.85, false, true)
    SetBlockingOfNonTemporaryEvents(traderPed, true)
    FreezeEntityPosition(traderPed, true)
    local function openTraderMenu()
        local options = {
            {
                icon = "fas fa-exchange-alt",
                iconColor = 'blue',
                title = 'What is this place?',
                description = 'Its a haunted house! The Ghouls inside are giving out Ghoul tokens... Im collecting them & pay well! Get inside and get me some!!!',
            },
            {
                icon = "fas fa-exchange-alt",
                iconColor = 'purple',
                title = 'Trade Haunted Tokens',
                description = 'Exchange your haunted tokens for spooky items',
            },
            {
                icon = "fa-solid fa-candy-corn",
                iconColor = '#e8b923',
                title = 'Trade 1 Haunted Token for $1000',
                serverEvent = 'sd-hauntedhouse:server:tradeToken1',
            },
            {
                icon = "fa-solid fa-ghost",
                iconColor = 'red',
                title = 'Trade 10 Haunted Token for $10000',
                serverEvent = 'sd-hauntedhouse:server:tradeToken2',
            },
            {
                icon = "fa-solid fa-ghost",
                iconColor = 'red',
                title = 'Trade 25 Haunted Token for $25000',
                serverEvent = 'sd-hauntedhouse:server:tradeToken3',
            },
            {
                icon = "fa-solid fa-skull",
                iconColor = '#5ff5b4',
                title = 'Trade 15 Haunted Token for Limited Edition Axe',
                serverEvent = 'sd-hauntedhouse:server:tradeToken',
                args = { item = "weapon_axe" }
            },
            {
                icon = "fa-solid fa-skull",
                iconColor = 'white',
                title = 'Trade 15 Haunted Token for Limited Edition Chair',
                serverEvent = 'sd-hauntedhouse:server:tradeToken',
                args = { item = "weapon_chair" }
            },
            {
                icon = "fa-solid fa-skull",
                iconColor = 'yellow',
                title = 'Trade 25 Haunted Token for Limited Edition Stone Hatchet',
                serverEvent = 'sd-hauntedhouse:server:tradeToken',
                args = { item = "weapon_stone_hatchet" }
            },
            
        }
    
        lib.registerContext({
            id = 'TraderMenu',
            title = 'Token Trade Menu',
            options = options
        })
    
        lib.showContext('TraderMenu')
    end
    exports['qb-target']:AddTargetEntity(traderPed, {
        options = {
            {
                label = "Trade Haunted Tokens",
                action = function()
                    openTraderMenu()
                end,
                icon = "fas fa-exchange-alt",
            }
        },
        distance = 2.0
    })
end

local insideHauntedHouse = false
local insideHauntedHouse2 = false
local hauntedHouseZone = PolyZone:Create({
    vector2(-1525.9887695312, 195.65855407715),
    vector2(-1596.3082275391, 164.68865966797),
    vector2(-1618.9787597656, 223.3687286377),
    vector2(-1565.6136474609, 246.90832519531),
    vector2(-1556.4187011719, 244.51358032227)
}, {
    name = "haunted_house_zone",
    debugPoly = false,
})
local hauntedHouseZone2 = PolyZone:Create({
    vector2(-1588.5588378906, 181.78942871094),
    vector2(-1604.4431152344, 216.81643676758),
    vector2(-1564.3951416016, 235.79942321777),
    vector2(-1547.8809814453, 200.27435302734)
}, {
    name = "haunted_house_zone2",
    debugPoly = false,
})

local function applyHauntedHouseLightingEffects(enable)
    if enable then
        SetTimecycleModifier("NG_blackout")
        SetExtraTimecycleModifier("ng_filmic22")
        SetArtificialLightsState(true)
        SetFollowPedCamViewMode(4)
    else
        ClearTimecycleModifier()
        ClearExtraTimecycleModifier()

        SetArtificialLightsState(false)
        SetFollowPedCamViewMode(1)
    end
end

hauntedHouseZone:onPlayerInOut(function(isPointInside)
    insideHauntedHouse = isPointInside
    if isPointInside then
        TriggerEvent('QBCore:Notify', 'Welcome to the Haunted House!', 'success')
    else
        TriggerEvent('QBCore:Notify', 'You have left the Haunted House.', 'error')
    end
end)

hauntedHouseZone2:onPlayerInOut(function(isPointInside)
    insideHauntedHouse2 = isPointInside
    if isPointInside then
        TriggerEvent('QBCore:Notify', 'Shit theres no lights in here...', 'warning')
        applyHauntedHouseLightingEffects(true)
    else
        TriggerEvent('QBCore:Notify', 'Get me out of here!', 'error')
        applyHauntedHouseLightingEffects(false)
    end
end)

CreateThread(function()
    spawnHauntedNpcs()
    spawnTraderNpc()
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        for _, ped in pairs(npcs) do
            if DoesEntityExist(ped) then
                DeleteEntity(ped)
            end
        end
    end
end)

CreateThread(function()
    local blip = AddBlipForCoord(vector3(-1574.97, 175.77, 58.22))

    SetBlipSprite(blip, 40)
    SetBlipDisplay(blip, 2)
    SetBlipScale(blip, 1.5)
    SetBlipColour(blip, 7)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Haunted House')
    EndTextCommandSetBlipName(blip)
end)
