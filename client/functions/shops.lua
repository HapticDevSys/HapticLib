local QBCore = exports['qb-core']:GetCoreObject()  


Citizen.CreateThread(function()
    if Config.Target == "ox" then
        for k,v in pairs(ConfigShops.Locations) do
            if v.job == nil then
                exports.ox_target:addBoxZone({
                    coords = v.location,
                    size = vec3(1, 1, 1),
                    rotation = v.rotation,
                    debug = Config.Debug,
                    options = {
                        {
                            serverEvent = 'HapticLib:Server:Openshop',
                            icon = v.icon,
                            label = v.label,
                            args = {
                                shopid = v.uniqueid,
                                type = v.type
                            }
                            
                        }
                    }
                })
            else
                exports.ox_target:addBoxZone({
                    coords = v.location,
                    size = vec3(1, 1, 1),
                    rotation = v.rotation,
                    debug = Config.Debug,
                    options = {
                        {
                            serverEvent = 'HapticLib:Server:Openshop',
                            icon = v.icon,
                            label = v.label,
                            groups = v.job,
                            args = {
                                shopid = v.uniqueid,
                                type = v.type
                            }
                            
                        }
                    }
                })

            end
        end 
    elseif Config.Target == "interact" then
        local ids = 0
        for k,v in pairs(ConfigShops.Locations) do
            if v.job == nil then
                ids = ids + 1
                local argz = {
                    shopid = v.uniqueid,
                    type = v.type
                }
                exports.interact:AddInteraction({
                    coords = v.location,
                    distance = 8.0, -- optional
                    interactDst = 2.0, -- optional
                    id = 'shophap_' .. ids, -- needed for removing interactions
                    name = 'shophap_' .. ids, -- optional
                    options = {
                         {
                            label = v.label,
                            action = function(entity, coords, args)
                                TriggerServerEvent("HapticLib:Server:Openshops", argz, v.type)
                            end,
                        },
                    }
                })
            else
                ids = ids + 1
                local argz = {
                    shopid = v.uniqueid,
                    type = v.type
                }
                exports.interact:AddInteraction({
                    coords = v.location,
                    distance = 8.0, -- optional
                    interactDst = 2.0, -- optional
                    id = 'shophap_' .. ids, -- needed for removing interactions
                    name = 'shophap_' .. ids, -- optional
                    groups = {
                        [v.job] = 0, -- Jobname | Job grade
                    },
                    options = {
                         {
                            label = v.label,
                            action = function(entity, coords, args)
                                TriggerServerEvent("HapticLib:Server:Openshops", argz, v.type)
                            end,
                        },
                    }
                })

            end
        end 
    end                          
    Citizen.Wait(1000)
end)