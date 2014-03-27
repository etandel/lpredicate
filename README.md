About
---

LPredicate is a library to work with logic predicates in Lua. It requires Lua 5.3 work2 or greater.

Here's a sample use (FizzBuzz):
```lua
local predicate = require("lpredicate").predicate

mult3 = predicate(function (n) return n % 3 == 0 end)
mult5 = predicate(function (n) return n % 5 == 0 end)
mult15 = mult3 & mult5

for i = 1, 30 do
    if mult15(i) then
        print("fizzbuzz")
    elseif mult5(i) then
        print("buzz")
    elseif mult3(i) then
        print("fizz")
    else
        print(i)
    end
end
```

It supports the following operators:
 * `&` -  and
 * `|` -  or
 * `~` -  not
 * `~` (binary) - xor

License
---

LPredicate is licensed under the MIT License. See LICENSE.txt for more details.
