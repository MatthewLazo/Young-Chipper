enum enem_state {
	shooting,
	running,
	crouching,
	dead
}


can_shoot = true

hp = max_hp

can_damage = true
in_cover = false;
crouched = false;

move_target_x = random_range(x - 10, x + 10)
move_target_y = random_range(y - 10, y + 10)
state = enem_state.running
state_time = 200

path = path_add()

function shoot(pos_x, pos_y)
{
	var bullet = instance_create_depth(x,y-10,depth,obj_bullet_parent)
	bullet.owner = id
	bullet.direction = point_direction(bullet.x,bullet.y,pos_x,pos_y)
	
	if (obj_player.is_player_behind_cover()) bullet.aimed_at_cover=true
}

function begin_sprint()
{
	move_target_x = random_range(obj_player.x - 50, obj_player.x + 50)
	move_target_y = random_range(obj_player.y - 50, obj_player.y + 50)
	
	image_blend=c_white
	// Find nearest cover
	direction_to_cover = mp_grid_path(global.mp_grid, path, x, y, move_target_x, move_target_y, false)
	if (direction_to_cover) path_start(path, move_speed,path_action_stop,false)
	state = enem_state.running;
}
