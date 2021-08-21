
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
	ModLuaFileAppend("data/scripts/biomes/"..v..".lua","mods/portal_key/files/data/scripts/"..v..".lua")
end

function OnPlayerSpawned( player_entity )
	--test: to spawn the player right beside the portal and give the player a key
	--GlobalsSetValue("portalkeycount", 1)
	--EntitySetTransform( player_entity, 1338, 1000 )
	--EntitySetTransform( player_entity, 1338, 7200 ) -- shorter level before boss portal
	--EntitySetTransform( player_entity, 1338, 12800 ) -- before boss portal
end