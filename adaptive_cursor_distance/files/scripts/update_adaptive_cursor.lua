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

local minda2 = 1000
local minenemyid = 0
local mind = math.max(MaxCursorDistanceX, MaxCursorDistanceY)
local enemies = EntityGetWithTag("enemy")
for i, enemy in ipairs(enemies) do
	local ex, ey, erot, escale_x, escale_y = EntityGetTransform(enemy)
	local exv = ex - x
	local eyv = ey - y
	local ed2 = exv * exv + eyv * eyv
	
	if (ed2 < mind * mind) then
		local exym = math.sqrt(exv * exv + eyv * eyv)
		exv = exv / exym
		eyv = eyv / exym
		local eda2 = (exv - cxv) * (exv - cxv) + (eyv - cyv) * (eyv - cyv)
		if eda2 < 0.2 and eda2 < minda2 then 
			minda2 = eda2 
			minenemyid = enemy
			mind = math.sqrt(ed2)
		end
	end
end

mind = mind - 10
if mind < 20 then mind = 20 end
local MaxCursorDistance = (MaxCursorDistanceX * math.abs(cxv) + MaxCursorDistanceY * math.abs(cyv)) / (math.abs(cxv) + math.abs(cyv))
if (mind > MaxCursorDistance) then mind = MaxCursorDistance end

local mind_last = tonumber(GlobalsGetValue("mind_last", "0"))
local showd = (mind * 0.2 + mind_last) / 1.2
GlobalsSetValue("mind_last", showd)

EntitySetTransform(cursor, x + cxv * showd, y + cyv * showd)

