local QBCore = exports['qb-core']:GetCoreObject()  

function functions.AddXP(src, job, xpamount)
	local src = src
	exports.pickle_xp:AddPlayerXP(src, job, xpamount)
	if Config.Debug then
		print("^2 [Haptic-Lib] - ^3 XP Level Added -  " .. xpamount)
	end
	return true
end
