local QBCore = exports['qb-core']:GetCoreObject()  
blips = {}


function functions.CreateBlip(id, coords, shortrange, sprite, scale, name, color)
    local ids = AddBlipForCoord(coords.x, coords.y, coords.z)
	SetBlipAsShortRange(ids, shortrange)
	SetBlipSprite(ids, sprite)
	SetBlipScale(ids, scale)
	SetBlipDisplay(ids, 6)
	BeginTextCommandSetBlipName('STRING')
	AddTextComponentString(name)
	EndTextCommandSetBlipName(ids)
    SetBlipColour(ids, color)

    local blipsInfo = {
        id = id,
        blipid = ids,
        resource = GetInvokingResource(), -- Change this if the invoking resource is dynamic
    }

    table.insert(blips, blipsInfo)
	if Config.Debug then
		print("^2 [Haptic-Lib] - ^3 Blip Created " .. id)
	end
end

function functions.RemoveBlip(blipid)
    for k,v in pairs(targets) do
        if v.blipid == blipid then
            exports['qb-target']:RemoveZone(v.id)
            targets[k] = nil
			if Config.Debug then
				print("^2 [Haptic-Lib] - ^3 Blip Deleted " .. v.blipid)
			end
        end
    end
end




AddEventHandler("onResourceStop", function(resourceName)
    if resourceName ~= GetCurrentResourceName() then
        --Delete Blips
        for k,v in pairs(blips) do
            if v.resource == resourceName then
                RemoveBlip(v.blipid)
				if Config.Debug then
					print("^2 [Haptic-Lib] - ^3 Blips Deleted " .. resourceName)
				end
                blips[k] = nil
            end
        end
	else
		for k,v in pairs(blips) do
            RemoveBlip(v.blipid)
            if Config.Debug then
                print("^2 [Haptic-Lib] - ^3 - Blips Deleted " .. v.blipid)
            end
            blips = nil
            blips = {}
        end
		if Config.Debug then
			print("^2 [Haptic-Lib] - ^3 All Blips Deleted  ")
		end
    end
end)