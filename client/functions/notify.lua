function functions.Notify(title, message, type)
    if Config.Notify == "qb" then
		TriggerEvent("QBCore:Notify", title .. " " .. message, type)
	elseif Config.Notify == "ox" then
		TriggerEvent('ox_lib:notify', {title = title, description = message, type = type or "success"})
	elseif Config.Notify == "okok" then
		TriggerEvent('okokNotify:Alert', title, message, 6000, type)
	else
		-- Implement your own for standalone
	end
end

