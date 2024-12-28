function functions.tprint (tbl, indent)
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


function functions.GenerateString(length)
    local id = ""
    for _ = 1, length or 7 do
        local char = math.random(1, 2) == 1 and string.char(math.random(97, 122)) or tostring(math.random(0, 9))
        if math.random(1, 2) == 1 then
            char = string.upper(char)
        end
        id = id .. char
    end
    if Config.Debug then
		print("^2 [Haptic-Lib] - ^3 Random String -  " .. id)
	end
    return id
end

function functions.SetFuel(veh, fuel)
    exports[Config.FuelExport]:SetFuel(veh, fuel)
    return true
end

RegisterNetEvent("HapticLib:Client:SetLockState")
AddEventHandler("HapticLib:Client:SetLockState", function(veh, state)
	print("1")
	TriggerServerEvent('qb-vehiclekeys:server:setVehLockState', veh, state)
end)


RegisterNetEvent("HapticLib:Client:AquireKeys")
AddEventHandler("HapticLib:Client:AquireKeys", function(plate)
    TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', plate)
	TriggerEvent("vehiclekeys:client:SetOwner", plate)
end)



RegisterNetEvent("HapticLib:Client:toggleDuty")
AddEventHandler("HapticLib:Client:toggleDuty", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)