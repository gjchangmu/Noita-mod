dofile_once("mods/portal_key/config.lua")
dofile_once("data/scripts/game_helpers.lua")
dofile_once("data/scripts/lib/utilities.lua")

HaveShownNoKey = 0

function collision_trigger( colliding_entity_id )

	local player = EntityGetWithTag("player_unit")[1]
	if colliding_entity_id ~= player then return end

	local keyc = tonumber(GlobalsGetValue("portalkeycount", "0"))
	local keycc = tonumber(GlobalsGetValue("portalkeycountcumulated", "0"))
	local pec = tonumber(GlobalsGetValue("portalenteredcountcumulated", "0"))
	local keygc = 0
	if pec >= 0 and tonumber(GlobalsGetValue("coalminekeygenerated", "0")) > 0 then keygc = keygc + 1 end
	if pec >= 1 and tonumber(GlobalsGetValue("excavationsitekeygenerated", "0")) > 0 then keygc = keygc + 1 end
	if pec >= 2 and tonumber(GlobalsGetValue("snowcavekeygenerated", "0")) > 0 then keygc = keygc + 1 end
	if pec >= 3 and tonumber(GlobalsGetValue("snowcastlekeygenerated", "0")) > 0 then keygc = keygc + 1 end
	if pec >= 4 and tonumber(GlobalsGetValue("rainforestkeygenerated", "0")) > 0 then keygc = keygc + 1 end
	if pec >= 5 and tonumber(GlobalsGetValue("vaultkeygenerated", "0")) > 0 then keygc = keygc + 1 end
	if pec >= 6 and tonumber(GlobalsGetValue("cryptkeygenerated", "0")) > 0 then keygc = keygc + 1 end
	
	if Portal_Key_Debug == 1 then 
		GamePrint("pec=" .. pec)
		GamePrint("keyc=" .. keyc .. ";keycc=" .. keycc .. ";keygc=" .. keygc) 
	end
	
	if (keyc == 0 and keycc == keygc) then
		GamePrint("A key seems not have spawned. The portal opens itself for you")
		if pec == 0 then GlobalsSetValue("coalminekeygenerated", "1") end
		if pec == 1 then GlobalsSetValue("excavationsitekeygenerated", "1") end
		if pec == 2 then GlobalsSetValue("snowcavekeygenerated", "1") end
		if pec == 3 then GlobalsSetValue("snowcastlekeygenerated", "1") end
		if pec == 4 then GlobalsSetValue("rainforestkeygenerated", "1") end
		if pec == 5 then GlobalsSetValue("vaultkeygenerated", "1") end
		if pec == 6 then GlobalsSetValue("cryptkeygenerated", "1") end
		GlobalsSetValue("portalkeycountcumulated", keycc+1)
		keyc = 1
	end
	
	if keyc > 0 then
		GlobalsSetValue("portalenteredcountcumulated", pec+1)
		GlobalsSetValue("portalkeycount", keyc - 1)
		local x,y,rotation,scale_x,scale_y = EntityGetTransform(player)
		EntitySetTransform( player, -677, y+280 )
		local velocitymodels = EntityGetFirstComponent( player, "CharacterDataComponent" )
		ComponentSetValue2( velocitymodels, "mVelocity", 0.0, -30.0)
		ComponentSetValue2( velocitymodels, "mFlyingTimeLeft", 0)
	elseif (HaveShownNoKey == 0) then
		GamePrintImportant("No key", "You need a key to enter this portal")
		HaveShownNoKey = 1
	end
	
end