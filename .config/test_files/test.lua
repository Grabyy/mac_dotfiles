local function greet(name)
	print("Hello " .. name)
end

local users = { "Alice", "Bob", "Charlie" }

for i, user in ipairs(users) do
	greet(user)
end

local x = 10
local y = 0

print(x / y)
