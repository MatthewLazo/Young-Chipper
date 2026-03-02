

if (other.owner != id && can_damage)
{
	if (total_ammo <= 0)
	{
		effect_create_depth(depth, ef_explosion, x,y-20,0.5,c_red)
		reload()
		room_restart()
	}
	
	can_damage=false
	alarm[2] = 10
	
	total_ammo -= other.bullet_damage
	effect_create_depth(depth, ef_spark, x,y-20,1,c_red)
}