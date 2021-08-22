dofile_once("mods/portal_key/config.lua")

local keyitemstr = ""
if Key_Emit_Light then
	keyitemstr = "mods/portal_key/files/data/entities/portal_key_item.xml"
else
	keyitemstr = "mods/portal_key/files/data/entities/portal_key_item_nolight.xml"
end

table.insert(g_small_enemies, {
		prob   		= gsep,
		min_count	= 1,
		max_count	= 1,    
		entity 	= keyitemstr,
		spawn_check = function() 
			local keyg = tonumber(GlobalsGetValue("keygenerated7", "-1"))
			if keyg < Key_Generated_Per_Boime_About then
				GlobalsSetValue("keygenerated7", keyg + 1)
				if Portal_Key_Debug == 1 then GamePrint("One Key Generated (Temple of the Art, g_small_enemies)") end
				return true
			else
				--if Portal_Key_Debug == 1 then GamePrint("Denied (Temple of the Art)") end
				return false
			end
		end,
	})