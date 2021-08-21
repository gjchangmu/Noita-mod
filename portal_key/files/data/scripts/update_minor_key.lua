dofile( "data/scripts/lib/utilities.lua" )

local minor_key	= GetUpdatedEntityID()
local player = EntityGetWithTag("player_unit")[1]

if player == nil then return end

local x, y, rot, scale_x, scale_y = EntityGetTransform(player)

EntitySetTransform(minor_key, x, y - 20, scale_x=10, scale_y=10)

