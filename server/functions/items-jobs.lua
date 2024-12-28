local QBCore = exports['qb-core']:GetCoreObject()  



function tprint (tbl, indent)
    if not indent then indent = 0 end
    for k, v in pairs(tbl) do
      formatting = string.rep("  ", indent) .. k .. ": "
      if type(v) == "table" then
        print(formatting)
        tprint(v, indent+1)
      elseif type(v) == 'boolean' then
        print(formatting .. tostring(v))      
      else
        print(formatting .. v)
      end
    end
end


RegisterNetEvent('QBCore:Client:UpdateObject', function()
    QBCore = exports['qb-core']:GetCoreObject()
end)

Citizen.CreateThread(function()
    for k, v in pairs(ConfigItemJob.Items) do 
        exports['qb-core']:AddItem(k, {
            name = k,
            label = v.label,
            weight = v.weight,
            type = v.type,
            image = v.image,
            unique = v.unique,
            useable = v.usable,
            shouldClose = v.shouldClose,
            combinable = v.combinable,
            description = v.description
        })
        if Config.Debug then
            print("^2 [Haptic-Lib] - ^3 Item Created  " .. k)
        end
    end
end)
