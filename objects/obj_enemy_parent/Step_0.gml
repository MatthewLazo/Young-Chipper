switch (state) 
{
	case enem_state.running:
		image_blend=c_black
		
		if (path_position >= 1 or distance_to_point(move_target_x, move_target_y) < 1) 
		{
			path_end()
			alarm[1] = 200
			state = enem_state.shooting
		}
		else 
		{
			show_debug_message(distance_to_point(move_target_x, move_target_y))
			sprite_index = spr_move
			direction_to_cover = mp_grid_path(global.mp_grid, path, x, y, move_target_x, move_target_y, true)
	
			if (direction_to_cover) path_start(path, move_speed,path_action_stop,false)
			else 
			{
				path_end()
				alarm[1] = 200
				state = enem_state.shooting
			}
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

// SHAKE EFFECT
if (shake > 0) 
{
	shake = lerp(shake, 0, 0.1)
	
	hit_shake_x = random_range(-shake, shake)
	hit_shake_y = random_range(-shake, shake)
}
else
{
	hit_shake_x=0
	hit_shake_y=0
}