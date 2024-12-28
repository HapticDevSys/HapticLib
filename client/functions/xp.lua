local QBCore = exports['qb-core']:GetCoreObject()  

function functions.GetXPLevel(id)
    local xp_level = exports.pickle_xp:GetLevel(id)
    return xp_level
end
