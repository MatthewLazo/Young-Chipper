text = ["What's up motherfucker!", "I know my bean-like build may not seem so threatening...", "But I got hands like Sir Arnold!", "Who's Sir Arnold?", "Shit I don't know, I made it up on the spot."]
text2 = ["You want a piece of me!"]

spr_walk = spr_beanboy_walk
spr_idle = spr_beanboy_walk

enum npc_state {moving, sitting}

state = npc_state.sitting

move_speed = 1
path = path_add()
move_target_x = xstart
move_target_y = ystart
alarm[0] =  random_range(180, 300)

function return_text()
{
	if (state == npc_state.moving) return false
	else return text
}
function dialogue_end(dialogue)
{
	
}

function begin_sprint()
{
	move_target_x = random_range(xstart - 50, xstart + 50)
	move_target_y = random_range(ystart - 50, ystart + 50)
	
	image_blend=c_white
	// Find nearest cover
	direction_to_cover = mp_grid_path(global.mp_grid, path, x, y, move_target_x, move_target_y, false)
	if (direction_to_cover) path_start(path, move_speed,path_action_stop,false)
	state = npc_state.moving;
}