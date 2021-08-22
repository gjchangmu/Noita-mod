dofile_once("mods/portal_key/config.lua")
dofile( "data/scripts/lib/utilities.lua" )
dofile_once("mods/portal_key/files/data/scripts/which_boime.lua")

local minor_key	= GetUpdatedEntityID()
local player = EntityGetWithTag("player_unit")[1]

if player == nil then return end
local x, y, rot, scale_x, scale_y = EntityGetTransform(player)
local keyx, keyy, keyrot, keyscale_x, keyscale_y = EntityGetTransform(minor_key)
local dx = x - keyx
local dy = y - 30 - keyy
dx = dx / 50.0
dy = dy / 50.0
if dx > 0.5 then dx = 0.5 end
if dy > 0.5 then dy = 0.5 end

-- the following block must be exactly the same as the logic in entering_portal.lua
local boime = which_boime_im_in()
local portalkeycount_str = "portalkeycount" .. boime
local keyc = tonumber(GlobalsGetValue(portalkeycount_str, "0"))
local keygenerated_str = "keygenerated" .. boime
local keygc = tonumber(GlobalsGetValue(keygenerated_str, "0"))
local allow_enter = false
if keyc >= Key_Needed_To_Enter_Portal_Per_Boime then
	allow_enter = true
end
if keygc < Key_Needed_To_Enter_Portal_Per_Boime and keyc == keygc then
	allow_enter = true
end
if allow_enter then
	EntitySetTransform(minor_key, keyx + dx, keyy + dy, 0, 0.5, 0.5)
else
	EntitySetTransform(minor_key, keyx + dx, keyy + dy, 0, 0, 0)
end
