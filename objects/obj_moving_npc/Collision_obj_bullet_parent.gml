if (state == npc_state.moving or state == npc_state.dead) return
else
{
	obj_audio_manager.play_sound_at(death, x,y, 1)
	obj_audio_manager.play_sound(NPC_Death, 1)
	effect_create_depth(depth, ef_spark, x,y-20,1,c_red)

	path_end()
	die()
}