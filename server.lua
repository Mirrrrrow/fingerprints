if not lib then return end

lib.locale()

RegisterServerEvent('fingerprints:server:putMetadata', function (slot)
    local playerId = source
    local xPlayer = ESX.GetPlayerFromId(playerId)
    if not xPlayer then return end

    local item = exports.ox_inventory:GetSlot(playerId, slot)
    if not item then return end

    local metadata = item.metadata or {}
    metadata.fingerprints = metadata.fingerprints or {
        users = {},
        count = 0
    }

    metadata.fingerprints.count += 1
    metadata.fingerprints.users[xPlayer.getIdentifier()] = true

    exports.ox_inventory:SetMetadata(playerId, slot, metadata)
end)