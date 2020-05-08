dofile( "data/scripts/lib/utilities.lua" )
dofile( "mods/less_destructive_worms/config.lua" )

--mod_name_to_neuter = {"$animal_worm", "$animal_worm_big", "$animal_worm_tiny", "$animal_lukki", "$animal_lukki_tiny"}

local enemies = EntityGetWithTag("enemy")
for i, enemy in ipairs(enemies) do
	--if EntityHasTag(enemy, "mod_ldw_neutered") == false then
		local cecomp = EntityGetFirstComponent(enemy, "CellEaterComponent")
		
		if cecomp ~= nil then
			if WormDestrictionAbility == 0 then
				EntitySetComponentIsEnabled(enemy, cecomp, false)
			elseif WormDestrictionAbility == 1 then
				ComponentSetMetaCustom( cecomp, "ignored_material", "templebrick_static,templebrick_static_soft,templebrick_noedge_static,templebrick_thick_static,templebrick_thick_static_noedge,templebrick_box2d" )
			end
		end

		--EntityAddTag(enemy, "mod_ldw_neutered")
	--end
end

local player 	= EntityGetWithTag("player_unit")[1]
local x, y, rot, scale_x, scale_y = EntityGetTransform(player)
EntitySetTransform(GetUpdatedEntityID(), x, y)