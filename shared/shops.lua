ConfigShops = {}

-- Currently only works with OX, if you want it to work with QB-Target implement it yourself.

ConfigShops.Type = {
	-- To Make a new Shop Category Copy From Here To 
	--[[["ambulance"] = {
		label = "Ems Store",
		items = {
			{ name = 'radio',                   price = 0, amount = 999 },
	        { name = 'bandage',                 price = 0, amount = 999 },
	        { name = 'painkillers',             price = 0, amount = 999 },
	        { name = 'firstaid',                price = 0, amount = 999 },
	        { name = 'weapon_flashlight',       price = 0, amount = 999 },
	        { name = 'weapon_fireextinguisher', price = 0, amount = 999 },
	        { name = 'leo_gps', 				price = 0, amount = 999 },
			{ name = 'panicbutton', 			price = 0, amount = 999 },
			{ name = 'crutch', 			price = 0, amount = 999 },
			{ name = 'wheelchair', 			price = 0, amount = 999 },
			{ name = 'prescriptionpad', 			price = 0, amount = 999 },
			{ name = 'watertank', 			price = 0, amount = 999 },
			{ name = 'hydraulicspreaders', 			price = 0, amount = 999 },
		}
	}, ---- HERE--]]]
}


ConfigShops.Locations = {
	--[[[1] = {uniqueid = "ambulance1", type = ConfigShops.Type["ambulance"], location = vector3(313.46, -595.21, 42.8), rotation = 0, job = "ambulance", icon = "fa fa-hand", label = "Open Armoury"},
	[2] = {uniqueid = "ambulance2", type = ConfigShops.Type["ambulance"], location = vector3(1777.86, 3650.49, 34.85), rotation = 0, job = "ambulance", icon = "fa fa-hand", label = "Open Armoury"}--]]
}