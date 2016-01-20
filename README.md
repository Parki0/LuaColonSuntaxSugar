# LuaColonSuntaxSugar

Allows to use colon suntax with tables.

Quick Look
==========
```
require 'tab'
a = tab{3,2,1}
a:sort() -- {1,2,3}
```
If table has a metatable already it will raise an error.
```
b = setmetatable({1,2,3,4},{__index = a})
tab(b)
```
Could be used to already exist table too.
```
a = {3,2,1}
tab(a)
a:sort() -- {1,2,3}
```
To use functions this way they are need to be defined like that:
```
function table.test()
	print("Hello World.")
end
```
Returns is table has the tab metatable.
```
a = tab{1,2,3}
print(isTab(a))
```
New tables inside the table will has the metatable too
```
a = tab{1,2,3}
a[4] = {4,5,6}
-- a[4] have the tab matatable too.
print(isTab(a[4]))
```

TODO
=======
- Correct my english
- make variadic

License
=======
Distributed under the MIT license.