dofile_once("mods/portal_key/config.lua")

table.insert(g_small_enemies, {
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "mods/portal_key/files/data/entities/portal_key_item.xml",
		spawn_check = function() 
			local keyg = tonumber(GlobalsGetValue("snowcavekeygenerated", "0"))
			if keyg < 3 then
				GlobalsSetValue("snowcavekeygenerated", keyg + 1)
				if Portal_Key_Debug == 1 then GamePrint("One Key Generated (Snow Cave, g_small_enemies)") end
				return true
			else
				--if Portal_Key_Debug == 1 then GamePrint("Denied (Snow Cave)") end
				return false
			end
		end,
	})