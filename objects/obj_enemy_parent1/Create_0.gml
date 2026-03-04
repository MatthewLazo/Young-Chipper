
spr_move = spr_enemy
spr_idle = spr_enemy

can_shoot = true
hp = max_hp

immunity = true
in_cover = false;

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
	
	hp -= amount
	effect_create_depth(depth, ef_spark, x,y-20,1,c_red)
	
	if (hp <= 0) die()
}

function die()
{
	
}