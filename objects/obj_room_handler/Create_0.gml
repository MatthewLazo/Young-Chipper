function place_player(new_x,new_y)
{
	obj_player.x = new_x
	obj_player.y = new_y
}

function spawn_enemy(enemy_types, amount)
{
	var spawned_enemys = []
	
	num_of_entrances = instance_number(obj_room_transitioner)
	
	if (num_of_entrances > 0)
	{
		for (i=0; i<amount; i++)
		{
			var array_size = array_length(enemy_types)
			var random_enemy_obj = enemy_types[array_size-1]
			
			var rand_entrance = instance_find(obj_room_transitioner, irandom(num_of_entrances-1))
			var entrance_to_spawn_at=rand_entrance
		
			var spawned_enemy = instance_create_layer(entrance_to_spawn_at.x,entrance_to_spawn_at.y, "instances", random_enemy_obj)
			
			array_push(spawned_enemys, spawned_enemy)
		}
	}
	return spawned_enemys
	
}

function find_npc(_npc_id)
{
	with (obj_interactable)
	{
		if (npc_id == _npc_id)
		{
			return self
		}
	}
	
}