dofile( "data/scripts/lib/utilities.lua" )
dofile( "mods/adaptive_cursor_distance/config.lua" )

local cursor 	= GetUpdatedEntityID()
local player 	= EntityGetWithTag("player_unit")[1]

if player == nil then return end

local x, y, rot, scale_x, scale_y = EntityGetTransform(player)

local comp = EntityGetFirstComponent(player, "ControlsComponent")
local cxv, cyv = ComponentGetValue2(comp, "mAimingVectorNonZeroLatest")
local cxym = math.sqrt(cxv * cxv + cyv * cyv)
cxv = cxv / cxym
cyv = cyv / cxym

local sumdw = 0
local sumw = 0
local enemies = EntityGetWithTag("enemy")
for i, enemy in ipairs(enemies) do
	local ex, ey, erot, escale_x, escale_y = EntityGetTransform(enemy)
	local exv = ex - x
	local eyv = ey - y
	local ed = math.sqrt(exv * exv + eyv * eyv)
	
	if ed < 250 then -- only consider enemies in close range
		exv = exv / ed
		eyv = eyv / ed
		local eda2 = (exv - cxv) * (exv - cxv) + (eyv - cyv) * (eyv - cyv)
		-- weighted average, using how close the enemy is to the aiming line as the weight
		local w = 1.0 / (eda2 + 0.01) 
		sumdw = sumdw + ed * w
		sumw = sumw + w
	end
end

local d = 999
if sumw > 0 then d = sumdw / sumw - 10 end
if d < 20 then d = 20 end

-- ellipse-shaped max allowed cursor distance
local DefaultCursorDistance = (DefaultCursorDistanceX * math.abs(cxv) + DefaultCursorDistanceY * math.abs(cyv)) / (math.abs(cxv) + math.abs(cyv))

-- max allowed cursor distance adaptive to camera position
local camerax, cameray = GameGetCameraPos()
local cameraxv = camerax - x
local camerayv = cameray - y
DefaultCursorDistance = DefaultCursorDistance + (cxv * cameraxv + cyv * camerayv) * 0.45

-- soft cap adaptive to whether the player is roughly pointing at enemies
d = (d * sumw * sumw + DefaultCursorDistance * 8.5) / (sumw * sumw + 8.5)
-- hard cap
local MaxCursorDistance = (MaxCursorDistanceX * math.abs(cxv) + MaxCursorDistanceY * math.abs(cyv)) / (math.abs(cxv) + math.abs(cyv))
if (d > MaxCursorDistance) then d = MaxCursorDistance end

-- smoothing
local mind_last = tonumber(GlobalsGetValue("mind_last", "0"))
local showd = (d * 0.15 + mind_last) / 1.15
GlobalsSetValue("mind_last", showd)

EntitySetTransform(cursor, x + cxv * showd, y + cyv * showd)

