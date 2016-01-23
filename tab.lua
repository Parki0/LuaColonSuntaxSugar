function tab(t)
	assert(type(t)=='table','Got '..type(t)..' table expected.')
	if not isTab(t) then
		if getmetatable(t) == nil then
			for k,v in pairs(t) do
				if type(v) == 'table' then
					t[k] = tab(v)
				end
			end
			return setmetatable(t,{
				__index = table,
				__newindex = function(t,k,v)
								if type(v) == 'table' and isTab(v) == false then
									rawset(t,k,tab(v))
								else
									rawset(t,k,v)
								end
						end,
				tab = true
				})
		else
			if isTab(t) ~= true then
				assert(false,"table already has a metatable")
			end
		end
	else
		return t
	end
end
function isTab(t)
	assert(type(t)=='table','Got '..type(t)..' table expected.')
	if getmetatable(t) ~= nil then
		return getmetatable(t).tab
	else
		return false
	end
end