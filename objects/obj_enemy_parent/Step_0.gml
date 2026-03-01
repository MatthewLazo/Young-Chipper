switch (state) 
{
	case enem_state.running:
		if (path_position >= 1) 
		{
			alarm[1] = 200
			state = enem_state.shooting
		}
		else 
		{
	
			direction_to_cover = mp_grid_path(global.mp_grid, path, x, y, move_target_x, move_target_y, false)
	
			if (direction_to_cover) path_start(path, move_speed,path_action_stop,false)
			move_towards_point(move_target_x, move_target_y, move_speed)
		}
		break;
	case enem_state.shooting:
		x=x
		y=y
		show_debug_message(alarm[1])
		if (can_shoot) // Shoot
		{
			can_shoot = false
			alarm[0] = random_range(15, 45)
			shoot(obj_player.x,obj_player.y)
		}
		break;
	case enem_state.crouching:
		x=x
		y=y
		break;
	case enem_state.dead:
		instance_destroy()
		break;
}