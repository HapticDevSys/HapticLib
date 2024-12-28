local QBCore = exports['qb-core']:GetCoreObject()  

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

function functions.generateRandomNumber()
    local number = ""
    for i = 1, 10 do
        number = number .. tostring(math.random(0, 9))
    end
    if Config.Debug then
        print("^2 [Haptic-Lib] - ^3 Random Number -  " .. number)
    end
    return number
end

function functions.GetSteam(src)
    local steamIdentifier = nil
	-- Retrieve all identifiers of the player
    for _, identifier in ipairs(GetPlayerIdentifiers(src)) do
        if string.find(identifier, "steam:") then
            steamIdentifier = identifier
            break
        end
    end
	if steamIdentifier then
        --print("Steam identifier: " .. steamIdentifier)
        return steamIdentifier
    else
        return false
    end
end

function functions.GetLicense(src)
    local Identifier = GetPlayerIdentifierByType(src, 'license')
    return Identifier
end

function functions.ToggleBlackout(src)
    exports["qb-weathersync"]:setBlackout();
    return true
end

function functions.SetTime(src, time, min)
    exports["qb-weathersync"]:setTime(time, min);
    return true
end

function functions.SetWeather(src, weather)
    exports["qb-weathersync"]:setWeather(weather);
    return true
end

