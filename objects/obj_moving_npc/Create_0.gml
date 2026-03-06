cutscene1 = [["talk", ["Hello there chipper!", "Ah as you must know... there are preparations in place set for the celebration of you!"]],["move", self, 1, 80, 116], ["talk", ["This here is where the food stand will be.", "It's gon taste like poop but thats all okay if it's made with love.", "Lovely poop."]], ["end"]]

current_cutscene = cutscene1
spr_move = spr_beanboy_walk
spr_idle = spr_beanboy_idle

enum npc_state {moving, sitting}

state = npc_state.sitting

resume_as_normal = true

norm_speed = 1
move_speed = norm_speed

path = path_add()
move_target_x = xstart
move_target_y = ystart
alarm[0] =  random_range(180, 300)

function begin_cutscene()
{
	resume_as_normal=false
	obj_cutscene_creator.start_cutscene(current_cutscene)
}
function dialogue_end(dialogue)
{
	
}

function begin_sprint(place_x,place_y, speed_)
{
	move_speed = speed_
	move_target_x = place_x
	move_target_y = place_y
	
	image_blend=c_white
	// Find nearest cover
	direction_to_cover = mp_grid_path(global.mp_grid, path, x, y, move_target_x, move_target_y, false)
	if (direction_to_cover) path_start(path, move_speed,path_action_stop,false)
	state = npc_state.moving;
}