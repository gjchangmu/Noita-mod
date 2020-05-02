function OnPlayerSpawned( player_entity )
	
	if tonumber(StatsGetValue("playtime")) > 1 then return end
	
	tablev = {}
    tablev["execute_every_n_frame"] = "99999999"
    tablev["script_damage_received"] = "mods/half_damage_taken/files/data/scripts/damage_multiplier.lua"
	tablev["remove_after_executed"] = "0"
	EntityAddComponent( player_entity, "LuaComponent", tablev )
end