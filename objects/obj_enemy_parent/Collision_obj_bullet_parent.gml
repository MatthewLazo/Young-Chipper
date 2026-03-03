if (other.owner != id && can_damage)
{
	can_damage=false
	alarm[2] = 10
	
	hp -= other.bullet_damage
	effect_create_depth(depth, ef_spark, x,y-20,1,c_red)

	if (hp <= 0)
	{
		effect_create_depth(depth, ef_explosion, x,y-20,0.5,c_red)
		state = enem_state.dead
	}
}