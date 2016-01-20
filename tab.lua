function tab(t)
	assert(type(t)=='table','Got '..type(t)..' table expected.')
	if getmetatable(t) == nil then
		for k,v in pairs(t) do
			if type(v) == 'table' then
				t[k] = tab(v)
			end
		end
		return setmetatable(t,{
			__index = table,
			__newindex = function(t,k,v)
							rawset(t,k,tab(v))
					end,
			tab = true
			})
	else
		if isTab(t) ~= true then
			assert(false,"table already has a metatable")
		end
	end
end
function isTab(t)
	assert(type(t)=='table','Got '..type(t)..' table expected.')
	return getmetatable(t).tab
end