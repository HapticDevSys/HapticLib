local QBCore = exports['qb-core']:GetCoreObject()  


--[[function functions.AddItemMeta(source, item, amount, x, data)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem(item, amount, x, data)
    TriggerClientEvent('inventory:client:ItemBox', source,  QBCore.Shared.Items[item], 'add', amount)
	if Config.Debug then
		print("^2 [Haptic-Lib] - ^3 Add Item With Meta - Item  " .. item .. " - Amount " .. amount)
	end
    return true
end-]]

function functions.GetItemCount(src, item)
    local hasItemWithAmounts = exports['qb-inventory']:GetItemCount(src, item)
    if hasItemWithAmounts and hasItemWithAmounts > 0 then
        return hasItemWithAmounts
    else
        return 0
    end
end

function functions.HasItem(src, item, amount)
    local hasItemWithAmounts = exports['qb-inventory']:HasItem(src, item, amount)
    return hasItemWithAmounts -- Should Return true or false
end

function functions.HasItemsTable(src, data)
    local hasItemsWithAmounts = exports['qb-inventory']:HasItem(src, data)
    return hasItemsWithAmounts -- Should Return true or false
end

function functions.RemoveItem(src, item, amount, reason)
    local ItemRemoved = exports['qb-inventory']:RemoveItem(src, item, amount, false, reason)
    TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'remove', amount)
    return ItemRemoved -- Should Return true or false
end

function functions.AddItem(src, item, amount, reason)
    local ItemRemoved = exports['qb-inventory']:AddItem(src, item, amount, false, false, reason)
    TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add', amount)
    return ItemRemoved -- Should Return true or false
end

function functions.GetItemsByName(src, data)
    local itemsbyname = exports['qb-inventory']:GetItemsByName(src, data)
    return itemsbyname -- Should Return true or false
end

function functions.RemoveItemBySlot(src, item, amount, slot, reason)
    local ItemRemoved = exports['qb-inventory']:RemoveItem(src, item, amount, slot, reason)
    TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'remove', amount)
    return ItemRemoved -- Should Return true or false
end

function functions.GetItemBySlot(src, slot)
    local ItemBySlot = exports['qb-inventory']:GetItemBySlot(src, slot)
    return ItemBySlot -- Should Return true or false
end


function functions.AddItemMeta(src, item, amount, info, reason)
    local ItemRemoved = exports['qb-inventory']:AddItem(src, item, amount, false, info, reason)
    TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add', amount)
    return ItemRemoved -- Should Return true or false
end