

window_set_cursor(cr_none)
cursor_sprite=spr_cursor


// Stats
total_hp = 1000
hp = total_hp
can_damage = true
move_speed = 1.5;

// Movement
crouching = false;
in_cover = false;

// Shooting
cocked = true;
max_ammo = 6;
total_ammo = max_ammo;

// Menu
menu_opened = false

// Dialogue
currently_talking = noone
current_text = ""
current_text_index = 0
current_text_line = 0

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
	total_ammo = max_ammo
}

function is_player_behind_cover() {return  crouching && in_cover}