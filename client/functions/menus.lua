local QBCore = exports['qb-core']:GetCoreObject()

function functions.CreateMenu(data)
    if Config.Menu == "qb" then
		exports['qb-menu']:openMenu(data)
	else 
		-- Implement your own logic
	end
end

