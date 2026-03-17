
dead_cutscene = [["talk", ["..."]], ["end"]]

npc_id = ""
is_npc = true

spr_move = spr_beanboy_walk
spr_idle = spr_beanboy_idle
spr_dead = spr_beanboy_dead

enum npc_state {moving, sitting, dead}

state = npc_state.sitting

resume_as_normal = true

moveable = true
norm_speed = 1
move_speed = norm_speed

path = path_add()

main_center_of_movement_x = xstart
main_center_of_movement_y = ystart

move_target_x = xstart
move_target_y = ystart

current_cutscene = 0
cutscene_animation_playing = false

alarm[0] =  random_range(180, 300)

function play_anim(anim)
{
	cutscene_animation_playing = true
	sprite_index = anim
}

function die()
{
	upon_death()
	state = npc_state.dead
	moveable = false
}

// Create code

function begin_cutscene()
{
	cutscene_check()
	resume_as_normal=false
	obj_cutscene_creator.start_cutscene(current_cutscene)
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
function set_position_as_main_position(new_x,new_y)
{
	main_center_of_movement_x=new_x
	main_center_of_movement_y=new_y
}