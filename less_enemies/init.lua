
local biomes = {
	"coalmine",
	"crypt",
	"excavationsite",
	"rainforest",
	"snowcastle",
	"snowcave",
	"vault"
}

for i, v in ipairs(biomes) do
	ModLuaFileAppend("data/scripts/biomes/"..v..".lua","mods/less_enemies/files/data/scripts/"..v..".lua")
end
