# LuaColonSuntaxSugar

Allows to use colon suntax with tables.

Quick Look
==========
```lua
require 'tab'
a = tab{3,2,1}
a:sort() -- {1,2,3}
```
If table has a metatable already it will raise an error.
```lua
b = setmetatable({1,2,3,4},{__index = a})
tab(b) -- Raises an error.
```
Could be used to already exist table too.
```lua
a = {3,2,1}
tab(a)
a:sort() -- {1,2,3}
```
To use functions this way they are need to be defined like that:
```lua
function table.test()
	print("Hello World.")
end
```
Returns is table has the tab metatable.
```lua
a = tab{1,2,3}
print(isTab(a)) -- true
```
New tables inside the table will has the metatable too
```lua
a = tab{1,2,3}
a[4] = {4,5,6}
print(isTab(a[4])) -- true 
```

TODO
=======
- Correct my english
- make it variadic

License
=======
Distributed under the MIT license.