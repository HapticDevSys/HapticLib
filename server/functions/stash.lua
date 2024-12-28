local QBCore = exports['qb-core']:GetCoreObject()  

function tprint (tbl, indent)
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



RegisterServerEvent("HapticLib:Server:OpenEMSStash")
RegisterNetEvent('HapticLib:Server:OpenEMSStash', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if not Player then return end
	local citizenId = Player.PlayerData.citizenid
	local stashName = 'ambulancestash_' .. citizenId
	exports['qb-inventory']:OpenInventory(src, stashName)
end)

RegisterServerEvent("HapticLib:Server:OpenJobStash")
RegisterNetEvent('HapticLib:Server:OpenJobStash', function(args)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local data = { label = args.args.stashlabel, maxweight = args.args.maxweight, slots = args.args.slots }
	exports['qb-inventory']:OpenInventory(source, args.args.unique, data)
end)


RegisterServerEvent("HapticLib:Server:OpenMechanicStash")
RegisterNetEvent('HapticLib:Server:OpenMechanicStash', function(data)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local datas = { label = data.stash, maxweight = data.stashOptions.maxweight, slots = data.stashOptions.slots }
	exports['qb-inventory']:OpenInventory(source, data.stash, datas)
end)



RegisterServerEvent("HapticLib:Server:DynamicStash")
RegisterNetEvent('HapticLib:Server:DynamicStash', function(id, slots, weight, label)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local datas = { label = label, maxweight = weight, slots = slots }
	exports['qb-inventory']:OpenInventory(source, id, datas)
end)

RegisterServerEvent("HapticLib:Server:EmployeeStash")
RegisterNetEvent('HapticLib:Server:EmployeeStash', function(id, slots, weight, label)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local cid = Player.PlayerData.citizenid
	local stashid = id .. "_" .. cid
	local datas = { label = label, maxweight = weight, slots = slots }
	exports['qb-inventory']:OpenInventory(source, stashid, datas)
end)

RegisterServerEvent("HapticLib:Server:HoustingStash")
RegisterNetEvent('HapticLib:Server:HoustingStash', function(uniq, data)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local datas = { label = "Home Stash", maxweight = data.maxweight, slots = data.slots }
	exports['qb-inventory']:OpenInventory(source, uniq, datas)
end)