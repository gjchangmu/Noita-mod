dofile( "data/scripts/lib/utilities.lua" )

local cursor 	= GetUpdatedEntityID()
local player 	= EntityGetWithTag("player_unit")[1]

if player == nil then return end

local x, y, rot, scale_x, scale_y = EntityGetTransform(player)

local comp = EntityGetFirstComponent(player, "ControlsComponent")
local cx, cy = ComponentGetValue2(comp, "mAimingVectorNonZeroLatest")
local cxym = math.sqrt(cx * cx + cy * cy)
cx = cx / cxym
cy = cy / cxym

if( Random( 1, 100 ) <= 2 ) then
	GamePrint(cx .. ", " .. cy)
end

d = 45
EntitySetTransform(cursor, x + cx * d, y + cy * d)
