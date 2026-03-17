if (state == npc_state.dead) return
if (global.cutscene_active or not moveable) 
{
	alarm[0] = random_range(180, 300)
	state = npc_state.sitting
	return
}

begin_sprint(random_range(main_center_of_movement_x - 10, main_center_of_movement_x + 10),random_range(main_center_of_movement_y - 10, main_center_of_movement_y + 10), norm_speed)

state = npc_state.moving