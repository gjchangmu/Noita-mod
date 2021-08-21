
local biomes = {
	"coalmine",
	"excavationsite",
	"snowcave",
	"snowcastle",
	"rainforest",
	"vault",
	"crypt",
}

for i, v in ipairs(biomes) do
	ModLuaFileAppend("data/scripts/biomes/"..v..".lua","mods/better_wand_in_mines/files/data/scripts/"..v..".lua")
end
