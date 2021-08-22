dofile_once("mods/portal_key/config.lua")
dofile_once( "data/scripts/game_helpers.lua" )
dofile_once("data/scripts/lib/utilities.lua")
dofile_once("mods/portal_key/files/data/scripts/which_boime.lua")

function item_pickup( entity_item, entity_pickupper, item_name )
	local boime = which_boime_im_in()
	local portalkeycount_str = "portalkeycount" .. boime
	local keyc = tonumber(GlobalsGetValue(portalkeycount_str, "0"))
	keyc = keyc + 1
	GlobalsSetValue(portalkeycount_str, keyc)
	
	EntityKill( entity_item )
	
	GamePrint("Picked " .. keyc .. " keys. ")
	
	if Portal_Key_Debug == 1 then 
		keyc = tonumber(GlobalsGetValue(portalkeycount_str, "0"))
		local keygenerated_str = "keygenerated" .. boime
		local keygc = tonumber(GlobalsGetValue(keygenerated_str, "0"))
		GamePrint("boime=" .. boime .. ", keyc=" .. keyc .. ", keygc=" .. keygc) 
	end
end