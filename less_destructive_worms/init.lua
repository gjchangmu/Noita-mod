dofile( "data/scripts/lib/utilities.lua" )

function OnPlayerSpawned( player_entity )

	if tonumber(StatsGetValue("playtime")) > 1 then return end

	local x, y = EntityGetTransform(player_entity)
	local modtimer = EntityLoad("mods/less_destructive_worms/files/modtimer.xml", x, y)
	
end

-- Debug
--ModLuaFileAppend("data/scripts/biomes/coalmine.lua","mods/less_destructive_worms/debug.lua")