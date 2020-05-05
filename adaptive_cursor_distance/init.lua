function OnPlayerSpawned( player_entity )
	local x, y = EntityGetTransform(player_entity)
	local adaptive_cursor = EntityLoad("mods/adaptive_cursor_distance/files/entities/adaptive_cursor.xml", x, y)
end