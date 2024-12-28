local QBCore = exports['qb-core']:GetCoreObject()  


Citizen.CreateThread(function()
    if Config.Target == "ox" then
        --Ambulance Stashes
        for k,v in pairs(ConfigStash.AmbulanceStashs) do
            exports.ox_target:addBoxZone({
                    coords = v.location,
                    size = vec3(1, 1, 1),
                    rotation = v.rotation,
                    debug = Config.Debug,
                    options = {
                        {
                            serverEvent = 'HapticLib:Server:OpenEMSStash',
                            icon = v.icon,
                            label = v.label,
                            groups = "ambulance",
                        }
                    }
            })
        end    
        -- Job Stashes
        for k,v in pairs(ConfigStash.JobStash) do
            exports.ox_target:addBoxZone({
                    coords = v.location,
                    size = vec3(1, 1, 1),
                    rotation = v.rotation,
                    debug = Config.Debug,
                    options = {
                        {
                            serverEvent = 'HapticLib:Server:OpenJobStash',
                            icon = v.icon,
                            label = v.label,
                            groups = v.job,
                            args = {
                                unique = k,
                            }
                        }
                    }
            })
        end   
    end
    Citizen.Wait(1000)
end)