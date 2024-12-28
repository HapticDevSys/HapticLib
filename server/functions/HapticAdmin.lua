local QBCore = exports['qb-core']:GetCoreObject()  

local HapticAdminPass = {}
local HapticAdminUserRoles = {}

function functions.AddPassword(license, password)
	HapticAdminPass[license] = password
    if Config.Debug then
        print("[HapticLib] - Added Password " .. password)
    end
	return true
end

function functions.AddRole(license, role)
    HapticAdminUserRoles[license] = role
    if Config.Debug then
        print("[HapticLib] - Added Role " .. role)
    end
    return true
end

function functions.CheckPassword(license, password)
    if password == HapticAdminPass[license] then
        if Config.Debug then
            print("[HapticLib] - Password Matched")
        end
        return true
    else
        if Config.Debug then
            print("[HapticLib] - Password Mismatch")
        end
        return false
    end
end

function functions.AdminExploitBan(src, reason)
    exports['qb-core']:ExploitBan(src, 'HapticAdmin - Exploit Detected - ' .. reason)
    return true
end