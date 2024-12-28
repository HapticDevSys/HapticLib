local QBCore = exports['qb-core']:GetCoreObject()


function functions.GetCraftingXP()
    PlayerData = QBCore.Functions.GetPlayerData()
    local CraftingXP = PlayerData.metadata.lcrafting
    return CraftingXP
end