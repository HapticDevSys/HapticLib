local QBCore = exports['qb-core']:GetCoreObject()  

function functions.Notify(src, title, message, type)
    if Config.Notify == "qb" then
		TriggerClientEvent("QBCore:Notify", src, title .. " " .. message, type)
	elseif Config.Notify == "ox" then
		TriggerClientEvent('ox_lib:notify', src, { type = type or "success", title = title, description = message })
	elseif Config.Notify == "okok" then
		TriggerClientEvent('okokNotify:Alert', src, title, message, 6000, type)
	else
		-- Implement your own for standalone
	end
end

