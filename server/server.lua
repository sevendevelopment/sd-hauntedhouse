local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('sd-hauntedhouse:giveItem', function()
    local Player = QBCore.Functions.GetPlayer(source)
    
    if Player.Functions.AddItem('haunted_token', 1) then
        TriggerClientEvent('QBCore:Notify', source, 'You have received a haunted token!', 'success')
        local playerName = GetPlayerName(source)
        local charName = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname
        local citizenID = Player.PlayerData.citizenid
        local logMessage = ("%s | %s | %s | Has received x1 haunted_token"):format(playerName, charName, citizenID)
        TriggerEvent('qb-log:server:CreateLog', 'haunted_items', 'Item Received', 'default', logMessage)
        
    else
        TriggerClientEvent('QBCore:Notify', source, 'You could not receive a haunted token!', 'error')
    end
end)


local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('sd-hauntedhouse:server:tradeToken1', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local hauntedTokens = Player.Functions.GetItemByName('haunted_token')

    if hauntedTokens and hauntedTokens.amount >= 1 then
        Player.Functions.RemoveItem('haunted_token', 1)
        Player.Functions.AddMoney('cash', 1000)
        TriggerClientEvent('QBCore:Notify', src, 'You traded a haunted token for $1000!', 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, 'You do not have any haunted tokens!', 'error')
    end
end)

RegisterNetEvent('sd-hauntedhouse:server:tradeToken2', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local hauntedTokens = Player.Functions.GetItemByName('haunted_token')

    if hauntedTokens and hauntedTokens.amount >= 10 then
        Player.Functions.RemoveItem('haunted_token', 10)
        Player.Functions.AddMoney('cash', 10000)
        TriggerClientEvent('QBCore:Notify', src, 'You traded a haunted token for $10000!', 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, 'You do not have any haunted tokens!', 'error')
    end
end)

RegisterNetEvent('sd-hauntedhouse:server:tradeToken3', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local hauntedTokens = Player.Functions.GetItemByName('haunted_token')

    if hauntedTokens and hauntedTokens.amount >= 25 then
        Player.Functions.RemoveItem('haunted_token', 25)
        Player.Functions.AddMoney('cash', 25000)
        TriggerClientEvent('QBCore:Notify', src, 'You traded a haunted token for $25000!', 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, 'You do not have any haunted tokens!', 'error')
    end
end)

RegisterNetEvent('sd-hauntedhouse:server:tradeToken', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local hauntedTokens = Player.Functions.GetItemByName('haunted_token')

    if hauntedTokens and hauntedTokens.amount >= 15 then
        Player.Functions.RemoveItem('haunted_token', 15)
        Player.Functions.AddItem(item, 1)
        TriggerClientEvent('QBCore:Notify', src, 'You traded a haunted token for a ' .. item .. '!', 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, 'You do not have any haunted tokens!', 'error')
    end
end)

RegisterNetEvent('sd-hauntedhouse:server:tradeToken2', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local hauntedTokens = Player.Functions.GetItemByName('haunted_token')

    if hauntedTokens and hauntedTokens.amount >= 25 then
        Player.Functions.RemoveItem('haunted_token', 25)
        Player.Functions.AddItem(item, 1)
        TriggerClientEvent('QBCore:Notify', src, 'You traded a haunted token for a ' .. item .. '!', 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, 'You do not have any haunted tokens!', 'error')
    end
end)
