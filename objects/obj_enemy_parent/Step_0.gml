switch (state) 
{
	case enem_state.running:
		image_blend=c_black
		
		if (path_position >= 1) 
		{
			alarm[1] = 200
			state = enem_state.shooting
		}
		else 
		{
			show_debug_message(distance_to_point(move_target_x, move_target_y))
			sprite_index = spr_move
			direction_to_cover = mp_grid_path(global.mp_grid, path, x, y, move_target_x, move_target_y, true)
	
			if (direction_to_cover) path_start(path, move_speed,path_action_stop,false)
		}
		break;
	case enem_state.shooting:
		image_blend=c_orange

		if (can_shoot) // Shoot
		{
			can_shoot = false
			alarm[0] = random_range(15, 45)
			shoot(obj_player.x,obj_player.y)
		}
		else sprite_index = spr_idle
		break;
	case enem_state.dead:
		instance_destroy()
		break;
}
show_debug_message(path_position)