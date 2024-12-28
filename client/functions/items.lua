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


function functions.HasItem(item, amount)
    local hasItemWithAmounts = exports['qb-inventory']:HasItem(item, amount)
    return hasItemWithAmounts -- Should Return true or false
end

function functions.HasItemsTable(data)
    local hasItemsWithAmounts = exports['qb-inventory']:HasItem(data)
    return hasItemsWithAmounts -- Should Return true or false
end
