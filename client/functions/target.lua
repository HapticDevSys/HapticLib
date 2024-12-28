local QBCore = exports['qb-core']:GetCoreObject()  
targets = {}
--========================================================================================================================
--========================================================================================================================
 -- _    _                  _       _     
 --| |  | |                | |     | |    
 --| |__| | __ _ ___       | | ___ | |__  
 --|  __  |/ _` / __|  _   | |/ _ \| '_ \ 
 --| |  | | (_| \__ \ | |__| | (_) | |_) |
 --|_|  |_|\__,_|___/  \____/ \___/|_.__/ 
--========================================================================================================================
--========================================================================================================================                                    
                                        
function functions.CreateTargetBoxZoneJob(id, coords, width, depth, heading, minz, maxz, distance, label, icon, job, event)
    if Config.Target == "qb" then
        exports['qb-target']:AddBoxZone(id, coords, width, depth, {
            name = id,
            heading = heading,
            debugPoly = Config.Debug,
            minZ = minz,
            maxZ = maxz,
        }, {
            options = {
                {
                    type = "client",
                    event = event,
                    icon = icon,
                    label = label,
                    job = job,
                },
            },
            distance = distance
        })
        local targetInfo = {
            id = id,
            resource = GetInvokingResource(), -- Change this if the invoking resource is dynamic
        }
        table.insert(targets, targetInfo)
        if Config.Debug then
            print("^2 [Haptic-Lib] - ^3 Target Created  " .. id)
        end
    elseif Config.Target == "ox" then
        exports.ox_target:addBoxZone({
                name = id,
                coords = coords,
                size = vec3(width, depth, 1),
                rotation = heading,
                debug = Config.Debug,
                distance = distance,
                options = {
                    {
                        event = event,
                        icon = icon,
                        label = label,
                        groups = job,
                    }
                }
        })
        local targetInfo = {
            id = id,
            resource = GetInvokingResource(), -- Change this if the invoking resource is dynamic
        }
        table.insert(targets, targetInfo)
        if Config.Debug then
            print("^2 [Haptic-Lib] - ^3 Target Created  " .. id)
        end
    end
end

function functions.CreateTargetBoxZoneJobArg(id, coords, width, depth, heading, minz, maxz, distance, label, icon, job, event, arg)
    if Config.Target == "qb" then
        exports['qb-target']:AddBoxZone(id, coords, width, depth, {
            name = id,
            heading = heading,
            debugPoly = Config.Debug,
            minZ = minz,
            maxZ = maxz,
        }, {
            options = {
                {
                    type = "client",
                    event = event,
                    icon = icon,
                    label = label,
                    job = job,
                    args = arg
                },
            },
            distance = distance
        })
        local targetInfo = {
            id = id,
            resource = GetInvokingResource(), -- Change this if the invoking resource is dynamic
        }
        table.insert(targets, targetInfo)
        if Config.Debug then
            print("^2 [Haptic-Lib] - ^3 Target Created  " .. id)
        end
    elseif Config.Target == "ox" then
        exports.ox_target:addBoxZone({
                name = id,
                coords = coords,
                size = vec3(width, depth, 1),
                rotation = heading,
                debug = Config.Debug,
                distance = distance,
                options = {
                    {
                        event = event,
                        icon = icon,
                        label = label,
                        groups = job,
                        args = arg
                    }
                }
        })
        local targetInfo = {
            id = id,
            resource = GetInvokingResource(), -- Change this if the invoking resource is dynamic
        }
        table.insert(targets, targetInfo)
        if Config.Debug then
            print("^2 [Haptic-Lib] - ^3 Target Created  " .. id)
        end
    end
end


--========================================================================================================================
--========================================================================================================================
--  _   _              _       _     
-- | \ | |            | |     | |    
-- |  \| | ___        | | ___ | |__  
-- | . ` |/ _ \   _   | |/ _ \| '_ \ 
-- | |\  | (_) | | |__| | (_) | |_) |
-- |_| \_|\___/   \____/ \___/|_.__/ 

--========================================================================================================================
--========================================================================================================================                                 


function functions.CreateTargetBoxZoneArg(id, coords, width, depth, heading, minz, maxz, distance, label, icon, event, arg)
    if Config.Target == "qb" then
        exports['qb-target']:AddBoxZone(id, coords, width, depth, {
            name = id,
            heading = heading,
            debugPoly = Config.Debug,
            minZ = minz,
            maxZ = maxz,
        }, {
            options = {
                {
                    type = "client",
                    event = event,
                    icon = icon,
                    label = label,
                    args = arg
                },
            },
            distance = distance
        })
        local targetInfo = {
            id = id,
            resource = GetInvokingResource(), -- Change this if the invoking resource is dynamic
        }
        table.insert(targets, targetInfo)
        if Config.Debug then
            print("^2 [Haptic-Lib] - ^3 Target Created  " .. id)
        end
    elseif Config.Target == "ox" then
        exports.ox_target:addBoxZone({
                name = id,
                coords = coords,
                size = vec3(width, depth, 1),
                rotation = heading,
                debug = Config.Debug,
                distance = distance,
                options = {
                    {
                        event = event,
                        icon = icon,
                        label = label,
                        args = arg
                    }
                }
        })
        local targetInfo = {
            id = id,
            resource = GetInvokingResource(), -- Change this if the invoking resource is dynamic
        }
        table.insert(targets, targetInfo)
        if Config.Debug then
            print("^2 [Haptic-Lib] - ^3 Target Created  " .. id)
        end
	elseif Config.Target == "interact" then
        exports.interact:AddInteraction({
            coords = coords,
            distance = 6.0, -- optional
            interactDst = distance, -- optional
            id = id, -- needed for removing interactions
            name = id, -- optional
            options = {
                 {
                    label = label,
                    action = function(entity, coords, args)
                        TriggerEvent(event, arg)
                    end,
                },
            }
        })
		
		
    end
end



function functions.CreateTargetBoxZone(id, coords, width, depth, heading, minz, maxz, distance, label, icon, event)
    if Config.Target == "qb" then
        exports['qb-target']:AddBoxZone(id, coords, width, depth, {
            name = id,
            heading = heading,
            debugPoly = Config.Debug,
            minZ = minz,
            maxZ = maxz,
        }, {
            options = {
                {
                    type = "client",
                    event = event,
                    icon = icon,
                    label = label,
                },
            },
            distance = distance
        })
        local targetInfo = {
            id = id,
            resource = GetInvokingResource(), -- Change this if the invoking resource is dynamic
        }
        table.insert(targets, targetInfo)
        if Config.Debug then
            print("^2 [Haptic-Lib] - ^3 Target Created  " .. id)
        end
    elseif Config.Target == "ox" then
        exports.ox_target:addBoxZone({
                name = id,
                coords = coords,
                size = vec3(width, depth, 1),
                rotation = heading,
                debug = Config.Debug,
                distance = distance,
                options = {
                    {
                        event = event,
                        icon = icon,
                        label = label,
                    }
                }
        })
        local targetInfo = {
            id = id,
            resource = GetInvokingResource(), -- Change this if the invoking resource is dynamic
        }
        table.insert(targets, targetInfo)
        if Config.Debug then
            print("^2 [Haptic-Lib] - ^3 Target Created  " .. id)
        end
	elseif Config.Target == "interact" then
        exports.interact:AddInteraction({
            coords = coords,
            distance = 6.0, -- optional
            interactDst = distance, -- optional
            id = id, -- needed for removing interactions
            name = id, -- optional
            options = {
                 {
                    label = label,
                    action = function(entity, coords, args)
                        TriggerEvent(event)
                    end,
                },
            }
        })
        local targetInfo = {
            id = id,
            resource = GetInvokingResource(), -- Change this if the invoking resource is dynamic
        }
        table.insert(targets, targetInfo)
        if Config.Debug then
            print("^2 [Haptic-Lib] - ^3 Target Created  " .. id)
        end
    end
end



function functions.RemoveTarget(id)
    for k,v in pairs(targets) do
        if v.id == id then
            if Config.Target == "qb" then
                exports['qb-target']:RemoveZone(v.id)
                targets[k] = nil
                if Config.Debug then
                    print("^2 [LC-Lib] - ^3 Target Deleted  " .. v.id)
                end
            elseif Config.Target == "ox" then
                exports.ox_target:removeZone(v.id)
                targets[k] = nil
                if Config.Debug then
                    print("^2 [LC-Lib] - ^3 Target Deleted  " .. v.id)
                end
            elseif Config.Target == "interact" then
                exports.interact:RemoveInteraction(v.id)
                targets[k] = nil
                if Config.Debug then
                    print("^2 [LC-Lib] - ^3 Target Deleted  " .. v.id)
                end

            end
        end
    end
end



--========================================================================================================================
--========================================================================================================================
--  ______       _   _ _           _______                   _       
-- |  ____|     | | (_) |         |__   __|                 | |      
-- | |__   _ __ | |_ _| |_ _   _     | | __ _ _ __ __ _  ___| |_ ___ 
-- |  __| | '_ \| __| | __| | | |    | |/ _` | '__/ _` |/ _ \ __/ __|
-- | |____| | | | |_| | |_| |_| |    | | (_| | | | (_| |  __/ |_\__ \
-- |______|_| |_|\__|_|\__|\__, |    |_|\__,_|_|  \__, |\___|\__|___/
--                          __/ |                  __/ |             
--                         |___/                  |___/              

--========================================================================================================================
--========================================================================================================================   

entitytargets = {}

function functions.CreateEntityTarget(name, netid, distance, label, icon, event, server)
    if Config.Target == "interact" then
        exports.interact:AddEntityInteraction({
            netId = netid,
            name = name, -- optional
            id = name, -- needed for removing interactions
            distance = distance, -- optional
            interactDst = 2.0, -- optional
            options = {
                {
                    label = label,
                    action = function(entity, coords, args)
                        if server then
                            TriggerServerEvent(event)
                        else
                            TriggerEvent(event)
                        end
                    end,
                },
            }
        })
        local targetInfo = {
            netid = netid,
            name = name,
            resource = GetInvokingResource(), -- Change this if the invoking resource is dynamic
        }
        table.insert(entitytargets, targetInfo)
    end
    
end



function functions.DeleteEntityTarget(name)
    for k,v in pairs(entitytargets) do
        if v.name == name then
            if Config.Target == "interact" then
                exports.interact:RemoveEntityInteraction(v.netid, v.name)
            end
            entitytargets[k] = nil
        end
    end
    
end






--========================================================================================================================
--========================================================================================================================
--   _____ _                    _    _         _____          _   _       _     _______               _     
--  / ____| |                  | |  | |       |  __ \        | \ | |     | |   |__   __|             | |    
-- | |    | | ___  __ _ _ __   | |  | |_ __   | |  | | ___   |  \| | ___ | |_     | | ___  _   _  ___| |__  
-- | |    | |/ _ \/ _` | '_ \  | |  | | '_ \  | |  | |/ _ \  | . ` |/ _ \| __|    | |/ _ \| | | |/ __| '_ \ 
-- | |____| |  __/ (_| | | | | | |__| | |_) | | |__| | (_) | | |\  | (_) | |_     | | (_) | |_| | (__| | | |
--  \_____|_|\___|\__,_|_| |_|  \____/| .__/  |_____/ \___/  |_| \_|\___/ \__|    |_|\___/ \__,_|\___|_| |_|
--                                    | |                                                                   
--                                    |_|                                                                   
--========================================================================================================================
--========================================================================================================================


AddEventHandler("onResourceStop", function(resourceName)
    if resourceName ~= GetCurrentResourceName() then
        for k,v in pairs(targets) do
            if v.resource == resourceName then
                if Config.Debug then
                    if Config.Target == "qb" then
                        exports['qb-target']:RemoveZone(v.id)
                        print("^2 [Haptic-Lib] - ^3 Target Deleted  " .. v.id)
                    elseif Config.Target == "ox" then
                        exports.ox_target:removeZone(v.id)
                        print("^2 [Haptic-Lib] - ^3 Target Deleted  " .. v.id)
                    elseif Config.Target == "interact" then
                        exports.interact:RemoveInteraction(v.id)
                        print("^2 [Haptic-Lib] - ^3 Interaction Deleted  " .. v.id)
                    end
                else
                    if Config.Target == "qb" then
                        exports['qb-target']:RemoveZone(v.id)
                    elseif Config.Target == "ox" then
                        exports.ox_target:removeZone(v.id)
                    elseif Config.Target == "interact" then
                        exports.interact:RemoveInteraction(v.id)
                    end
                end
                targets[k] = nil

            end
        end
    else
        for k,v in pairs(targets) do
            if Config.Target == "qb" then
                exports['qb-target']:RemoveZone(v.id)
            elseif Config.Target == "ox" then
                exports.ox_target:removeZone(v.id)
            elseif Config.Target == "interact" then
                exports.interact:RemoveInteraction(v.id)
            end
        end
        targets = nil
        targets = {}
        if Config.Debug then
            print("^2 [Haptic-Lib] - ^3 All Targets Deleted  ")
        end
    end
end)