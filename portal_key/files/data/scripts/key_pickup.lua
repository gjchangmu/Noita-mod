dofile_once("mods/portal_key/config.lua")
dofile_once( "data/scripts/game_helpers.lua" )
dofile_once("data/scripts/lib/utilities.lua")

function item_pickup( entity_item, entity_pickupper, item_name )
	local keyc = tonumber(GlobalsGetValue("portalkeycount", "0"))
	if keyc == 0 then
		GlobalsSetValue("portalkeycount", 1)
		local keycc = GlobalsGetValue("portalkeycountcumulated", "0")
		GlobalsSetValue("portalkeycountcumulated", keycc+1)
	end
	
	EntityKill( entity_item )
	
	if Portal_Key_Debug == 1 then 
		keyc = GlobalsGetValue("portalkeycount", "0")
		keycc = GlobalsGetValue("portalkeycountcumulated", "0")
		GamePrint("keyc=" .. keyc .. ";keycc=" .. keycc) 
	end
end