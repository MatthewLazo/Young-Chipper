

if (other.owner != id && not immunity)
{
	if (total_ammo <= 0)
	{
		effect_create_depth(depth, ef_explosion, x,y-20,0.5,c_red)
		reload()
		room_restart()
	}
	
	take_damage(other.bullet_damage)
}