

window_set_cursor(cr_none)
cursor_sprite=spr_cursor


// Stats
immunity = false
move_speed = 1.5;

// Movement
crouching = false;
in_cover = false;

// Shooting
cocked = true;
can_reload = true
max_ammo = 1000;
total_ammo = max_ammo;

// Menu
menu_opened = false

// Dialogue

// Shake Effect
shake = 0
shake_duration = 0

hit_shake_x = 0
hit_shake_y = 0

// Action
function do_shake(strength, duration)
{
	shake = strength
	shake_duration = duration
}

function shoot_bullet()
{
	if (total_ammo > 0)
	{
		total_ammo--;
		effect_create_depth(depth, ef_smokeup, x,y-20,0.01,c_orange)
		var bullet = instance_create_depth(x, y-20, depth, obj_bullet_parent)
		bullet.bullet_speed = 1;
		bullet.owner = id
		bullet.direction = point_direction(bullet.x, bullet.y, mouse_x, mouse_y)
		if (!in_cover) bullet.aimed_at_cover=true
	}
}

function reload()
{
	if (can_reload)
	{
		can_reload=false
		total_ammo = max_ammo
		alarm[1] = 240
	}
}

function is_player_behind_cover() {return  crouching && in_cover}

// HP

function take_damage(amount)
{
	immunity = true
	alarm[2] = 10
	
	total_ammo -= amount
	effect_create_depth(depth, ef_spark, x,y-20,1,c_red)
	do_shake(5,1)
}