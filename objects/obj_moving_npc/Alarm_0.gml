if (obj_player.currently_talking) 
{
	alarm[0] = random_range(180, 300)
	state = npc_state.sitting
	return
}
begin_sprint()

state = npc_state.moving