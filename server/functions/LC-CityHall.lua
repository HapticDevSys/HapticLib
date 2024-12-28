local QBCore = exports['qb-core']:GetCoreObject()  



function functions.AddCityHallLicense(source, id_to_give)
    local Player = QBCore.Functions.GetPlayer(source)
    local info = {}
    if id_to_give == "id_card" then
        info.citizenid = Player.PlayerData.citizenid
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
        info.nationality = Player.PlayerData.charinfo.nationality
    elseif id_to_give == "driver_license" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.type = "Class C Driver License"
    elseif id_to_give == "weaponlicense" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
    end
    exports['qb-inventory']:AddItem(source, id_to_give, 1, false, info, "LC-CityHall")
    TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items[id_to_give], 'add', 1)
    return true
end