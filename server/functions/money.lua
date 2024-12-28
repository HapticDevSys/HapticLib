
local QBCore = exports['qb-core']:GetCoreObject()  

function functions.AddCash(source, amount, reason)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddMoney('cash', amount, reason)
	if Config.Debug then
		print("^2 [Haptic-Lib] - ^3 Cash Added - $ " .. amount .. " - " .. reason)
	end
    return true
end

function functions.AddBank(source, amount, reason)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddMoney('bank', amount, reason)
	if Config.Debug then
		print("^2 [Haptic-Lib] - ^3 Bank Added - $ " .. amount .. " - " .. reason)
	end
    return true
end

function functions.AddDirtyMoney(source, amount)
    --Add your own Dirty Money Logic
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem('lifecoin', amount)
    TriggerClientEvent('inventory:client:ItemBox', source,  QBCore.Shared.Items["lifecoin"], 'add', amount)
	if Config.Debug then
		print("^2 [Haptic-Lib] - ^3 Dirtymoney Added - $ " .. amount .. " - " .. reason)
	end
    return true
end


function functions.RemoveCash(source, amount, reason)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveMoney('cash', amount, reason) then 
		if Config.Debug then
			print("^2 [Haptic-Lib] - ^3 Cash Removed - $ " .. amount .. " - " .. reason)
		end
		return true 
	else 
		return false 
	end
end

function functions.RemoveBank(source, amount, reason)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveMoney('bank', amount, reason) then 
		
		if Config.Debug then
			print("^2 [Haptic-Lib] - ^3 Bank Removed - $ " .. amount .. " - " .. reason)
		end
		return true 
	else 
		return false 
	end
end

function functions.RemoveDirtyMoney(source, amount)
    --Add your own Dirty Money Logic
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem('lifecoin', amount) then
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['lifecoin'], 'remove', amount)
		if Config.Debug then
			print("^2 [Haptic-Lib] - ^3 DirtMoney Removed - $ " .. amount .. " - " .. reason)
		end
        return true
    else
        return false
    end
end


function functions.GetCashBalance(source)
    local Player = QBCore.Functions.GetPlayer(source)
    balance = Player.Functions.GetMoney('cash')
	if Config.Debug then
		print("^2 [Haptic-Lib] - ^3 Get Cash Balance - $ " .. balance)
	end
    return balance
end

function functions.GetBankBalance(source)
    local Player = QBCore.Functions.GetPlayer(source)
    balance = Player.Functions.GetMoney('bank')
	if Config.Debug then
		print("^2 [Haptic-Lib] - ^3 Get Bank Balance - $ " .. balance)
	end
    return balance
end


function functions.GetDirtyBalance(source)
    --Add your own Dirty Money Logic
    local Player = QBCore.Functions.GetPlayer(source)
    balance = Player.Functions.GetItemByName('lifecoin').amount
	if Config.Debug then
		print("^2 [Haptic-Lib] - ^3 Get Dirty Balance - $ " .. balance)
	end
    return balance
end



function functions.AddBankingTransaction(receiver_name, receiver_identifier, sender_name, sender_identifier, value, reason)
	if Config.BankingStatementsEnabled then
		if Config.BankingStatementMethod == "okok" then
	    	TriggerEvent('okokBanking:AddNewTransaction', receiver_name, receiver_identifier, sender_name, sender_identifier, value, reason)
	    else
	    	-- Implement your own logic
	    end
	end
end


function functions.GetSocietyMoney(src, society)
	local balance = 0
	if Config.SocietyBanking == "okok" then
		balance = exports['okokBanking']:GetAccount(society)
	elseif Config.SocietyBanking == "qb-banking" then
		balance = exports['qb-banking']:GetAccountBalance(society)
	elseif Config.SocietyBanking == "qb-management" then
		--balance = exports['qb-management']:RemoveMoney(society)
		-- ^^You will have to implement this yourself as i dont have an old copy
	else
		-- Implement your Own Logic
	end
	return balance
end


function functions.AddSocietyMoney(src, society, value, reason)
	if Config.SocietyBanking == "okok" then
		exports['okokBanking']:AddMoney(society, value)
	elseif Config.SocietyBanking == "qb-banking" then
		exports['qb-banking']:AddMoney(society, value, reason)
	elseif Config.SocietyBanking == "qb-management" then
		exports['qb-management']:AddMoney(society, value)
	else
		-- Implement your Own Logic
	end
end

function functions.RemoveSocietyMoney(src, society, value, reason)
	if Config.SocietyBanking == "okok" then
		exports['okokBanking']:RemoveMoney(society, value)
	elseif Config.SocietyBanking == "qb-banking" then
		exports['qb-banking']:RemoveMoney(society, value, reason)
	elseif Config.SocietyBanking == "qb-management" then
		exports['qb-management']:RemoveMoney(society, value)
	else
		-- Implement your Own Logic
	end
end