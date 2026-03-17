switch (state)
{
	case npc_state.moving:
		if (path_position >= 1 or distance_to_point(move_target_x, move_target_y) < 1)
		{
			x=move_target_x
			y=move_target_y
			if (!global.cutscene_active) alarm[0] = random_range(180, 300)
			state = npc_state.sitting
		}
		else
		{
			if (sprite_index != spr_move) sprite_index = spr_move
			direction_to_cover = mp_grid_path(global.mp_grid, path, x, y, move_target_x, move_target_y, false)
	
			if (direction_to_cover) path_start(path, move_speed,path_action_stop,false)
			move_towards_point(move_target_x, move_target_y, move_speed)
		}
		break;
	case npc_state.sitting:
		if (!global.cutscene_active and not resume_as_normal)
		{
			resume_as_normal = true
			alarm[0] = random_range(180, 300)
		}
		
		if (cutscene_animation_playing)
		{
			if (image_index >= image_number) cutscene_animation_playing=false
		}
		else sprite_index = spr_idle
		x=x
		y=y
		break;
	case npc_state.dead:
		sprite_index=spr_dead
		break;
}