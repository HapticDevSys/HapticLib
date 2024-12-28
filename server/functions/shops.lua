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



RegisterServerEvent("HapticLib:Server:Openshop")
RegisterNetEvent('HapticLib:Server:Openshop', function(shopid, type)
    local src = source
    exports['qb-inventory']:CreateShop({
        name = shopid.args.shopid,
        label = shopid.args.type.label,
        slots = #shopid.args.type.items,
        items = shopid.args.type.items
    })
    exports['qb-inventory']:OpenShop(src, shopid.args.shopid)
end)



RegisterServerEvent("HapticLib:Server:OpenMechShop")
RegisterNetEvent('HapticLib:Server:OpenMechShop', function(data)
    local src = source
	exports['qb-inventory']:CreateShop({
        name = data.shop,
        label = data.items.label,
        slots = #data.items.items,
        items = data.items.items
    })
	exports['qb-inventory']:OpenShop(src, data.shop)
end)

RegisterServerEvent("HapticLib:Server:LCBusinessShop")
RegisterNetEvent('HapticLib:Server:LCBusinessShop', function(shopid, label, items)
    local src = source
    exports['qb-inventory']:CreateShop({
        name = shopid,
        label = label,
        slots = #items,
        items = items
    })
    exports['qb-inventory']:OpenShop(src, shopid)
end)

RegisterServerEvent("HapticLib:Server:LCAmmoShop")
RegisterNetEvent('HapticLib:Server:LCAmmoShop', function(shopid, items)
    local src = source
    exports['qb-inventory']:CreateShop({
        name = shopid,
        label = "Ammunation Shop",
        slots = #items,
        items = items
    })
    exports['qb-inventory']:OpenShop(src, shopid)--]]
end)