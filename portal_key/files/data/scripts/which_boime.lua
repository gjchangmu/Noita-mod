
function which_boime_im_in()
	local player = EntityGetWithTag("player_unit")[1]
	local x, y, rot, scale_x, scale_y = EntityGetTransform(player)
	if y < 1294 then return 1 end
	if y < 2830 then return 2 end
	if y < 4878 then return 3 end
	if y < 6414 then return 4 end
	if y < 8462 then return 5 end
	if y < 10510 then return 6 end
	if y < 13065 then return 7 end
	return 8
end