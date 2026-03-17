if (other.owner != id && not immunity)
{
	instance_destroy(other)
	take_damage(other.bullet_damage)
	do_shake(4, 1)
	if (hp <= 0)
	{
		state = enem_state.dead
	}
}