dofile_once("data/scripts/lib/utilities.lua")
dofile( "mods/half_damage_taken/config.lua" )

function damage_received( damage, message, entity_thats_responsible, is_fatal )

	local player = EntityGetWithTag("player_unit")[1]
	local damagemodels = EntityGetFirstComponent( player, "DamageModelComponent" )
	local currenthp = ComponentGetValueFloat( damagemodels, "hp" )
	local currentmaxhp = ComponentGetValueFloat( damagemodels, "max_hp" )

	local targethp = currenthp - damage * DamageTakenMultiplier
	if( targethp > currentmaxhp ) then targethp = currentmaxhp end
	if( targethp > 0 ) then 
		ComponentSetValue( damagemodels, "hp", targethp + damage)
	else
		
	end

end