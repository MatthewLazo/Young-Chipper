enum enem_state {
	shooting,
	running,
	dead
}

spr_move = spr_enemy
spr_idle = spr_enemy

can_shoot = true

hp = max_hp

immunity = false;
did_dead = false;
in_cover = false;

move_target_x = random_range(x - 10, x + 10)
move_target_y = random_range(y - 10, y + 10)

state_time = 200

path = path_add()

state = enem_state.running

// Shake Effect
shake = 0
shake_duration = 0

hit_shake_x = 0
hit_shake_y = 0

function do_shake(strength, duration)
{
	shake = strength
	shake_duration = duration
}

function shoot(pos_x, pos_y)
{
	effect_create_depth(depth, ef_smokeup, x,y-20,0.01,c_orange)
	var bullet = instance_create_depth(x,y-10,depth,obj_bullet_parent)
	bullet.owner = id
	bullet.direction = point_direction(bullet.x,bullet.y,pos_x,pos_y)
	
	if (obj_player.is_player_behind_cover()) bullet.aimed_at_cover=true
}

function take_damage(amount)
{
	immunity=true
	alarm[2] = 10 // Immunity
	effect_create_depth(depth, ef_flare, x,y-10, 1,c_red)
	hp -= amount
	obj_audio_manager.play_sound_at(hit, x,y, 1)
}

function begin_sprint()
{
	move_target_x = random_range(obj_player.x - 50, obj_player.x + 50)
	move_target_y = random_range(obj_player.y - 50, obj_player.y + 50)
	
	image_blend=c_white
	// Find nearest cover
	direction_to_cover = mp_grid_path(global.mp_grid, path, x, y, move_target_x, move_target_y, true)
	if (direction_to_cover) path_start(path, move_speed,path_action_stop,false)
	state = enem_state.running;
}