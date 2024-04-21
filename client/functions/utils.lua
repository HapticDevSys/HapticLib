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
    return id
end
