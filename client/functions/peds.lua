peds = {}


function functions.CreatePed(pedid, ped, pedtype, coords, heading, freeze, invincible, temporaryevents, scenarioenable, scenario, networked)
    modelHash = GetHashKey(ped)
	RequestModel(modelHash)

	while not HasModelLoaded(modelHash) do
		Wait(15)
	end
	local pedType = pedtype
	local n = 0
	if networked then
		n = 1
	end
	temppedid = CreatePed(pedType, ped,  coords.x, coords.y, coords.z, heading, n, 0)
	FreezeEntityPosition(temppedid, freeze)
	SetEntityInvincible(temppedid, invincible)
	SetBlockingOfNonTemporaryEvents(temppedid, temporaryevents)
	if scenarioenable then
		TaskStartScenarioInPlace(temppedid, scenario, 0, true)
	end
	if Config.Debug then
		print("^2 [Haptic-Lib] - ^3 Ped Created " .. pedid)
	end

	local pedsInfo = {
        id = pedid,
        pedid = temppedid,
        resource = GetInvokingResource(), -- Change this if the invoking resource is dynamic
    }

    table.insert(peds, pedsInfo)
	return temppedid
end

function functions.RemovePed(pedid)
    for k,v in pairs(peds) do
        if v.peds == pedid then
			if DoesEntityExist(v.pedid) then
				DeleteEntity(v.pedid)
				if Config.Debug then
					print("^2 [Haptic-Lib] - ^3 - Peds Deleted " .. v.pedid)
				end
			else
				if Config.Debug then
					print("^2 [Haptic-Lib] - ^3 - Ped Doesnt Exist")
				end
			end
			peds[k] = nil
        end
    end
end


AddEventHandler("onResourceStop", function(resourceName)
    if resourceName ~= GetCurrentResourceName() then
        --Delete Blips
        for k,v in pairs(peds) do
            if v.resource == resourceName then
				if DoesEntityExist(v.pedid) then
					DeleteEntity(v.pedid)
					if Config.Debug then
						print("^2 [Haptic-Lib] - ^3 Peds Deleted " .. resourceName)
					end
				else
					if Config.Debug then
						print("^2 [Haptic-Lib] - ^3 - Ped Doesnt Exist")
					end
				end
				peds[k] = nil
            end
        end
	else
		for k,v in pairs(peds) do
			if DoesEntityExist(v.pedid) then
				DeleteEntity(v.pedid)
				if Config.Debug then
					print("^2 [Haptic-Lib] - ^3 Peds Deleted " .. v.id)
				end
			else
				if Config.Debug then
					print("^2 [Haptic-Lib] - ^3 - Ped Doesnt Exist")
				end
			end
            peds = nil
            peds = {}
        end
		if Config.Debug then
            print("^2 [Haptic-Lib] - ^3 All Peds Deleted  ")
        end
    end
	
end)