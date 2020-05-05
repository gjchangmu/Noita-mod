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

local mind2 = 15625
local enemies = EntityGetWithTag("enemy")
for i, enemy in ipairs(enemies) do
	local ex, ey, erot, escale_x, escale_y = EntityGetTransform(enemy)
	local ed2 = (ex - x) * (ex - x) + (ey - y) * (ey - y)
	if ed2 < mind2 then mind2 = ed2 end
end
if mind2 < 900 then mind2 = 900 end
d = math.sqrt(mind2) - 10
EntitySetTransform(cursor, x + cx * d, y + cy * d)

if( Random( 1, 100 ) <= 2 ) then
	GamePrint(cx .. ", " .. cy)
end
