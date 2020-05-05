dofile( "data/scripts/lib/utilities.lua" )

function OnPlayerSpawned( player_entity )

	local reticlecomp = EntityGetFirstComponent(player_entity, "SpriteComponent", "aiming_reticle")
	EntitySetComponentIsEnabled( player_entity, reticlecomp, false )
	
	if tonumber(StatsGetValue("playtime")) > 1 then return end

	local x, y = EntityGetTransform(player_entity)
	local adaptive_cursor = EntityLoad("mods/adaptive_cursor_distance/files/entities/adaptive_cursor.xml", x, y)
	
end