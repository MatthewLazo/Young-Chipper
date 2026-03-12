// Stick to player if not in cutscene
if (!global.cutscene_active)
{
	move_to(obj_player.x, obj_player.y, 0.1)
}

switch (state)
{
	case cam_state.idle:
	break;
	case cam_state.moving:
		reached_position = false
		position_x = lerp(position_x, target_x, cam_speed)
		position_y = lerp(position_y, target_y, cam_speed)
		
		position_x = clamp(position_x, 0, room_width - camera_width)
		position_y = clamp(position_y, 0, room_height - camera_height)
		camera_set_view_pos(camera, position_x, position_y)
		
		
		if (point_distance(camera_get_view_x(camera), camera_get_view_y(camera), target_x, target_y) < 1)
		{
			show_debug_message("here")
			reached_position=true
			state = cam_state.idle
		}
	break;
	case cam_state.zooming:
	break;
}