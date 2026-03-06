if (global.cutscene_active) 
{
	alarm[0] = random_range(180, 300)
	state = npc_state.sitting
	return
}

begin_sprint(random_range(xstart - 50, xstart + 50),random_range(ystart - 50, ystart + 50), norm_speed)

state = npc_state.moving