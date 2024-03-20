if not lib then return end

lib.locale()
local state = LocalPlayer.state

local function isPlayersFingerprintInserted(metadata)
    if not metadata or not metadata.fingerprints then return false end

    return metadata.fingerprints.users[state.identifier]
end

local gloves = require 'data.gloves'
local function isPlayerWearingGloves()
    local componentVariation = GetPedDrawableVariation(cache.ped, 3)

    return lib.table.contains(gloves, componentVariation)
end

local currentWeapon
local function gloveThread()
    while not isPlayerWearingGloves() do
        Wait(1000)
    end

    if not currentWeapon then return end
    if isPlayersFingerprintInserted(currentWeapon.metadata) then return end

    TriggerServerEvent('fingerprints:server:putMetadata', currentWeapon.slot)
end

AddEventHandler('ox_inventory:currentWeapon', function(weapon)
    currentWeapon = weapon
    if not weapon then return end

    if isPlayersFingerprintInserted(weapon.metadata) then return end

    if isPlayerWearingGloves() then
        return CreateThread(gloveThread)
    end

    TriggerServerEvent('fingerprints:server:putMetadata', weapon.slot)
end)

exports('IsPlayersFingerprintInserted', isPlayersFingerprintInserted)

exports('IsPlayersFingerprintOnCurrentWeapon', function ()
    return isPlayersFingerprintInserted(currentWeapon.metadata)
end)