local QBCore = exports['qb-core']:GetCoreObject()


function functions.GetCraftingXP(src)
    local Player = QBCore.Functions.GetPlayer(src)
    local CraftingLevel = Player.PlayerData.metadata.lcrafting
    return CraftingLevel
end


function functions.AddCraftingXP(src, xpamount)
    local Player = QBCore.Functions.GetPlayer(src)
    local CraftingLevel = Player.PlayerData.metadata.lcrafting
    local count = CraftingLevel + xpamount
    Player.Functions.SetMetaData("lcrafting", count)
    return true
end