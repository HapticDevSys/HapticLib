local QBCore = exports['qb-core']:GetCoreObject()  


function functions.SetJob(source, job, grade)
    local Player = QBCore.Functions.GetPlayer(source)
	Player.Functions.SetJob(job, grade)
	if Config.Debug then
		print("^2 [Haptic-Lib] - ^3 Job Set To - Job  " .. job .. " - Grade " .. grade)
	end
    return true
end

function functions.GetJobName(source)
    local Player = QBCore.Functions.GetPlayer(source)
	local jobname = Player.PlayerData.job.name
	if Config.Debug then
		print("^2 [Haptic-Lib] - ^3 Job Name  " .. jobname)
	end
    return jobname
end