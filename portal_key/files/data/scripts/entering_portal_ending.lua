dofile_once("mods/portal_key/config.lua")
dofile_once("data/scripts/game_helpers.lua")
dofile_once("data/scripts/lib/utilities.lua")
dofile_once("mods/portal_key/files/data/scripts/which_boime.lua")

HaveShownNoKey = 0

function collision_trigger( colliding_entity_id )

	local player = EntityGetWithTag("player_unit")[1]
	if colliding_entity_id ~= player then return end

	local boime = which_boime_im_in()
	local portalkeycount_str = "portalkeycount" .. boime
	local keyc = tonumber(GlobalsGetValue(portalkeycount_str, "0"))

	local keygenerated_str = "keygenerated" .. boime
	local keygc = tonumber(GlobalsGetValue(keygenerated_str, "0"))
	
	if Portal_Key_Debug == 1 then 
		GamePrint("boime=" .. boime .. ", keyc=" .. keyc .. ", keygc=" .. keygc) 
	end
	
	local allow_enter = false
	
	if keyc >= Key_Needed_To_Enter_Portal_Per_Boime then
		allow_enter = true
	end
	if keygc < Key_Needed_To_Enter_Portal_Per_Boime and keyc == keygc then
		GamePrint("It seems not enough keys spawned; the portal opens itself for you")
		allow_enter = true
	end
	
	if allow_enter then
		local x,y,rotation,scale_x,scale_y = EntityGetTransform(player)
		EntitySetTransform( player, 1891, y+280 )
		local velocitymodels = EntityGetFirstComponent( player, "CharacterDataComponent" )
		ComponentSetValue2( velocitymodels, "mVelocity", 0.0, -30.0)
		ComponentSetValue2( velocitymodels, "mFlyingTimeLeft", 0)
	elseif HaveShownNoKey == 0 then
		GamePrintImportant("No key", "You need a key to enter this portal")
		HaveShownNoKey = 1
	end
	
end